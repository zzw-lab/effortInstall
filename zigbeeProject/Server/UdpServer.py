from socket import *
from DataLoad import Common
from Analysis.DataAnalysis import *
# IoT 监控持续
data_list = []

def check(r_data):
    # if data_list.count(r_data) != 0:
    #     return "Y"
    # else:
    #     if len(data_list) == Common.data_list_max_num:
    #         data_list.pop(0)
    #         data_list.append(r_data)
    #     else:
    #         data_list.append(r_data)
    #     return "N"
    return "N"

def UDP_Server():

    ADDRESS = (Common.valUDPhost, Common.valIUDPport)
    udpServerSocket = socket(AF_INET, SOCK_DGRAM)
    udpServerSocket.bind(ADDRESS)

    while True:
        try:
            print("waiting for message...")
            raw_data, raw_addr = udpServerSocket.recvfrom(Common.valIUDPbufsiz)
            print("接收到的原始数据：",raw_data.hex())
            try:
                Check_Value = check(raw_data)
                if Check_Value == 'N':
                    UDP_analysis(raw_data.hex(),raw_addr)
                else:
                    print("已存在该行数据")
            except Exception as e:
                print('except:', e)
                IpAddress = raw_addr[0]
                IpPort = str(raw_addr[1])
                val_errmsg = "IpAddress:" + IpAddress + " IpPort:" + IpPort + "！！插入数据失败，请确认！！\nerror  : " + e
                print(val_errmsg)
                errorMsg_job(val_errmsg)
            continue

        except ZeroDivisionError as e:
            print('except:', e)

        finally:
            print('此次接收结束,等待下组数据...')
            print('===============================')
