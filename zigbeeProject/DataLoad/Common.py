import configparser
import os

def configLoad(valLocate):

    # 读取UDP配置文件
    global valUDPhost
    global valIUDPport
    global valIUDPbufsiz
    global valUDPFH_num
    global valUDPUnic_Start
    global valUDPUnic_End

    # 存储数组最大行数
    global data_list_max_num
    global codeChaset

    global dbCon

    # MYSQL 连接
    global valIP
    global valUsername
    global valPassword
    global valDBName
    global valPort
    global valChaset
    global engine_raw

    parent_dir = os.path.dirname(os.path.abspath(__file__))
    conf = configparser.ConfigParser()
    conf.read(parent_dir + '/collectInfo.ini')  # 读config.ini文件

    # MySQL 数据库连接信息
    if valLocate == 'local':
        valIP = 'localhost'
    else:
        valIP = conf.get('global', 'valIP')
    valUsername = conf.get('global', 'valUsername')
    valPassword = conf.get('global', 'valPassword')
    valDBName = conf.get('global', 'valDBName')
    valPort = int(conf.get('global', 'valPort'))
    valChaset = conf.get('global', 'valChaset')

    parent_dir = os.path.dirname(os.path.abspath(__file__))
    conf = configparser.ConfigParser()
    conf.read(parent_dir + '/collectInfo.ini')  # 读config.ini文件

    valUDPhost= conf.get('global', 'valUDPhost')
    valIUDPport= int(conf.get('global', 'valIUDPport'))
    valIUDPbufsiz= int(conf.get('global', 'valIUDPbufsiz'))
    valUDPFH_num= int(conf.get('global', 'valUDPFH_num'))          # 帧头数
    valUDPUnic_Start= int(conf.get('global', 'valUDPUnic_Start'))  # 起始码 开始位数
    valUDPUnic_End = int(conf.get('global', 'valUDPUnic_End'))     # 起始码 结束位数

    data_list_max_num = int(conf.get('global', 'data_list_max_num'))    # 数组最大行数
    codeChaset = conf.get('global','codeChaset')

    # 数据库连接测试




