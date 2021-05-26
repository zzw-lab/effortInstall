from Analysis.DataAnalysis import errorMsg_job
from DataLoad import Common
from datetime import datetime

from Send.SendMsg import app
from Server.UdpServer import UDP_Server

import pymysql

import socket

def login(username,password):
    dbCon = pymysql.connect(host="127.0.0.1",
                            user="root",
                            password="123456",
                            db="effort",
                            port=3306,
                            charset="utf8")
    cur = dbCon.cursor()
    sql_select = "select * from effort.employee where username = '" + username + "' and password = '" + password + "' limit 1"
    try:
        cur.execute(sql_select)
        results = cur.fetchone()  # 获取查询的所有记录
        if results != None:
            return True
        else:
            val_errmsg = "用户名或密码错误，请重试"
            print(val_errmsg)
            hostname = socket.gethostname()
            ip = socket.gethostbyname(hostname)
            val_errmsg = "username:" + username + " ip:" + ip + "！！登录失败，请确认！！"
            print(val_errmsg)
            print("--------------------------------")
            errorMsg_job(val_errmsg)
            return False
    except Exception as e:
        raise e
    finally:
        dbCon.close()


if __name__ == '__main__':
    print("==========Please Login===========")
    valLocate = input("请输入执行地点:")
    # 加载配置信息
    Common.configLoad(valLocate)
    # # 校验密码
    # valUsername = input("请输入用户名:")
    # valPassword = input("请输入执行密码:")
    # while login(valUsername,valPassword) != True:
    #     valUsername = input("请输入用户名:")
    #     valPassword = input("请输入执行密码:")

    # 执行密码检测
    print("==========System start===========")

    # Python time strftime() 函数接收以时间元组，并返回以可读字符串表示的当地时间，格式由参数 format 决定。
    currentTime = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(currentTime + ' API 自动同步启动....')

    # 启动UDP服务端
    try:
        UDP_Server()
    except Exception as e:
        print(e)
    finally:
        print("Zero！")
