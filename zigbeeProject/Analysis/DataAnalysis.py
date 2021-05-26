import pymysql
import json
import re
import random

from DataLoad import Common
from datetime import datetime
from datetime import timedelta

# IoT 监控持续  F_IP IP地址,F_UniqueID 起始码 ,raw_Code 原始码,FH_num 帧头数长度
def UDP_analysis(raw_data,raw_addr):
    print("***************************************************")
    #去帧头帧尾###########################################################
    IpAddress = raw_addr[0]
    IpPort = str(raw_addr[1])

    new_data = raw_data[8:-8]

    Frame_Header = raw_data[0:8]
    Device_Type = new_data[0:2]
    Device_ID = new_data[2:10]
    Data_Type = new_data[10:12]
    Command = new_data[12:14]
    Parameter_Length = ""
    Parameter = ""
    Check_Word = new_data[-2:]
    Frame_Tail = raw_data[-8:]

    # 去除校验数的校验数据汇总
    Check_Data = raw_data[8:-10]

    # 先进行数据校验
    rawCode_CheckResule = rawCode_Check(IpAddress,IpPort,raw_data,Check_Data, Check_Word)

    if rawCode_CheckResule == True:
        # 返回翻译信息
        if Command=="04":
            Parameter_Length = new_data[14:16]
            Parameter = new_data[16:-2]
            # print(Parameter)
            zh_CN_Translation = translation_Infor(Device_Type, Data_Type,Command)

            zh_CN_Device_Type =zh_CN_Translation[0][9]     #设备类型
            zh_CN_Data_Type =zh_CN_Translation[0][10]       #数据类型
            zh_CN_Command =zh_CN_Translation[0][1]        #命令字
            zh_CN_Parameters=""       #参数

            Need_Parameter_List = re.findall(r'.{2}', Parameter)
            # print(Need_Parameter_List)
            zh_CN_Parameters += "{"  # 参数

            #参数翻译
            for i in range(len(Need_Parameter_List)):

                for j in range(len(zh_CN_Translation)):
                    # zh_CN_Translation[j][6]    参数
                    # zh_CN_Translation[j][3]    参数定位
                    # zh_CN_Translation[j][8]    是否翻译
                    # zh_CN_Translation[j][7]    高/低8位

                    if int(zh_CN_Translation[j][3])==(i+1) :
                        if zh_CN_Translation[j][8] == 1 and zh_CN_Translation[j][6]==Need_Parameter_List[i]:
                            zh_CN_Parameters += '"' + zh_CN_Translation[j][4] + '":"' + zh_CN_Translation[j][7] + '",\n'
                            break
                        elif zh_CN_Translation[j][8] == 2 :
                            if zh_CN_Translation[j][7]=="高8位":
                                time=Need_Parameter_List[i]
                            elif zh_CN_Translation[j][7]=="低8位":
                                time += Need_Parameter_List[i]
                                time = str(int(time, 16))
                                zh_CN_Parameters += '"' + zh_CN_Translation[j][4] + '":"' + time + '",\n'
                                break
                        elif zh_CN_Translation[j][8] == 0:
                            zh_CN_Parameters += '"' + zh_CN_Translation[j][4] + '":"' + zh_CN_Translation[j][7] + '",\n'

            zh_CN_Parameters = zh_CN_Parameters[:-2]
            zh_CN_Parameters += "}"  # 参数
            print(zh_CN_Parameters)




        Nowtime=datetime.now().strftime("%Y-%m-%d %H:%M:%S")


        Device_All_Insert(IpAddress,Frame_Header, Device_Type, Device_ID, Data_Type, Command, Parameter_Length, Parameter,Check_Word, Frame_Tail,
                          zh_CN_Device_Type,zh_CN_Data_Type, zh_CN_Command,  zh_CN_Parameters,Nowtime)
    else:
        print("UDP_analysis 异常，数据未插入！")
        print("---------------------------")


# 进行校验
def rawCode_Check(IpAddress,IpPort,raw_data,Check_data,Check_Word):
    Check_Num=str(hex(sum([int(i,16) for i in re.findall(r'.{2}', Check_data) if i != ''])))[-2:].upper()
    # print("Check_Data:",Check_Num)
    # print(Check_Word)
    flag=True if str(Check_Word).upper()==Check_Num else False
    if flag==False:
        val_errmsg = "IpAddress:" + IpAddress + "\n IpPort:" + IpPort +  "\n data:" + raw_data + "！！数据校验失败，请确认！！"
        print(val_errmsg)
        errorMsg_job(val_errmsg)
    else:
        print("校验通过！！！！！！！")
    return flag

# 获取到翻译信息
def translation_Infor(Device_Type, Data_Type,Command):

    dbCon = pymysql.connect(host=Common.valIP,
                            user=Common.valUsername,
                            password=Common.valPassword,
                            db=Common.valDBName,
                            port=Common.valPort,
                            charset=Common.valChaset)
    cur = dbCon.cursor()
    sql_select = "select device_status.id,Command_N," \
                 "Parameter_Length,Parameters_index,Parameters_N_index," \
                 "is_End,Parameter,Parameter_N,Parameter_type," \
                 "Device_N_Type,Data_N_Type " \
                 "from "+Common.valDBName+".device_status,device_type,data_Type " \
                 "where device_type.Device_Type = device_status.Device_Type " \
                 "and data_Type.Data_Type = device_status.Data_Type  " \
                 "and device_status.Device_Type = '" + Device_Type + "' and device_status.Data_Type = '" + Data_Type + "' and Command = '" + Command+"'"
    # print("解码信息查询SQL：" + sql_select)
    try:
        cur.execute(sql_select)
        results = cur.fetchall()  # 获取查询的所有记录
        if results!=None:
            return results
        else:
            # val_errmsg = "Device_Type:" + Device_Type + " Data_Type:" + Data_Type + "！！配方表无对应数据，请确认！！"
            print("对不起，没有对应翻译数据！")
            # errorMsg_job(val_errmsg)
    except Exception as e:
        raise e
    finally:
        dbCon.close()

# 写入解码信息
def Device_All_Insert(IpAddress,Frame_Header, Device_Type, Device_ID, Data_Type, Command, Parameter_Length, Parameter,
                          Check_Word, Frame_Tail,
                          zh_CN_Device_Type,zh_CN_Data_Type, zh_CN_Command,  zh_CN_Parameters,Nowtime):
    dbCon = pymysql.connect(host=Common.valIP,
                            user=Common.valUsername,
                            password=Common.valPassword,
                            db=Common.valDBName,
                            port=Common.valPort,
                            charset=Common.valChaset)
    cur = dbCon.cursor()

    sql_insert=Device_Insert(IpAddress,Frame_Header,Device_Type,Device_ID,Data_Type,Command,Parameter_Length,Parameter,Check_Word,Frame_Tail,Nowtime)

    sql_trans_insert=Device_Translation_Insert(IpAddress,zh_CN_Device_Type, Device_ID, zh_CN_Data_Type, zh_CN_Command, Parameter_Length,zh_CN_Parameters,Nowtime)

    sql_new_insert=DeviceNew_Insert(IpAddress,Device_ID,zh_CN_Device_Type,zh_CN_Parameters,Nowtime)

    try:
        cur.execute(sql_insert)
        cur.execute(sql_trans_insert)
        cur.execute(sql_new_insert)
        # 提交
        dbCon.commit()
        if cur.rowcount >=0:
            print("数据插入成功！")
        else:
            val_errmsg = "IpAddress:" + IpAddress + " IpPort:！！插入数据失败，请确认！！"
            print(val_errmsg)
            errorMsg_job(val_errmsg)

    except Exception as e:
        # 错误回滚
        dbCon.rollback()
    finally:
        dbCon.close()
def Device_Insert(IpAddress,Frame_Header,Device_Type,Device_ID,Data_Type,Command,Parameter_Length,Parameters,Check_Word,Frame_Tail,Nowtime):
    # print(IpAddress)
    # print(Frame_Header)
    # print(Device_Type)
    # print(Device_ID)
    # print(Data_Type)
    # print(Command)
    # print(Parameter_Length)
    # print(Parameters)
    # print(Check_Word)
    # print(Frame_Tail)
    # print(Nowtime)
    sql_insert = "insert into "+Common.valDBName+".device_info(IP,Frame_Header,Device_Type,Device_ID,Data_Type,Command,Parameter_Length,Parameters,Check_Word,Frame_Tail,Create_time)" \
                 "values ('"+IpAddress+"','"+Frame_Header+"','"+Device_Type+"','"+Device_ID+"','"+Data_Type+"','"+Command+"','"+Parameter_Length+"','"+Parameters+"','"+Check_Word+"','"+Frame_Tail+"','"+Nowtime+"')"

    return sql_insert
    # print("数据插入SQL:" + sql_insert)

# 写入解码翻译信息
def Device_Translation_Insert(IpAddress,zh_CN_Device_Type, Device_ID, zh_CN_Data_Type, zh_CN_Command,Parameter_Length, zh_CN_Parameters,Nowtime):
    zh_CN_Parameters_Length=str(int(Parameter_Length,16))
    # print(IpAddress)
    # print(zh_CN_Device_Type)
    # print(Device_ID)
    # print(zh_CN_Data_Type)
    # print(zh_CN_Command)
    # print(Parameter_Length)
    # print(zh_CN_Parameters)
    # print(Nowtime)

    sql_insert = "insert into "+Common.valDBName+".device_info_translation(IP,Device_Type,Device_ID,Data_Type,Command,Parameter_Length,Parameters,Create_time)" \
                 "values ('"+IpAddress+"','"+zh_CN_Device_Type+"','"+Device_ID+"','"+zh_CN_Data_Type+"','"+zh_CN_Command+"','"+zh_CN_Parameters_Length+"','"+zh_CN_Parameters+"','"+Nowtime+"')"
    # print(sql_insert)
    return sql_insert
# 写入最新设备信息
def DeviceNew_Insert(IpAddress,Device_ID,Device_Type,zh_CN_Parameters,Nowtime):
    # 设备总表需要
    zh_CN_Parameters=json.loads(zh_CN_Parameters.replace("\r", "").replace("\n", ""))
    Device_status = zh_CN_Parameters.get("工作状态")
    State_Type = "开启"
    zh_CN_Battery_status = zh_CN_Parameters.get("电池电压")


    sqlNew_Insert="insert into "+Common.valDBName+".device_status_new(IP,Device_ID,Device_Type,Device_status,State_Type,Battery_status,Create_time)" \
                  " values('"+IpAddress+"','"+Device_ID+"','"+Device_Type+"','"+Device_status+"','"+State_Type+"','"+zh_CN_Battery_status+"','"+Nowtime+"')"\
                  "on duplicate key update IP = '"+IpAddress+"',State_Type = '"+State_Type+"',Battery_status = '"+zh_CN_Battery_status+"',Device_status = '"+Device_status+"';"

    # print(sqlNew_Insert)
    return sqlNew_Insert
    # print("数据插入SQL:" + sql_insert)
# 插入错误日志
def errorMsg_job(context):
    dbCon = pymysql.connect(host=Common.valIP,
                            user=Common.valUsername,
                            password=Common.valPassword,
                            db=Common.valDBName,
                            port=Common.valPort,
                            charset=Common.valChaset)
    cur = dbCon.cursor()

    currentTime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    sql_insert = "insert into effort.device_errmsg(Create_time,Error_Context) value('%s','%s')" % (currentTime, context)
    try:
        cur.execute(sql_insert)
        # 提交
        dbCon.commit()
    except Exception as e:
        # 错误回滚
        dbCon.rollback()
    finally:
        dbCon.close()


