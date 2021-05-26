#!/usr/bin/python

# -*-coding: UTF-8 -*-

import gi
gi.require_version('Gtk','3.0')
from gi.repository import Gtk
import os
import sys
import urllib2
import time


class Application(Gtk.Window):
	def __init__(self):
		Gtk.Window.__init__(self,title="Project deployment")
		self.set_border_width(10)
		self.box = Gtk.Box(spacing=6)
		self.add(self.box)

		self.button1 = Gtk.Button.new_with_label("Install mysql and python config")
		self.button1.connect("clicked",self.install_mysql)
		self.box.pack_start(self.button1,True,True,0)

		self.button2 = Gtk.Button.new_with_label("Unloads All")
		self.button2.connect("clicked", self.unload_All)
		self.box.pack_start(self.button2, True, True, 0)

		self.button3 = Gtk.Button.new_with_label("reset")
		self.button3.connect("clicked", self.reset)
		self.box.pack_start(self.button3, True, True, 0)



	@staticmethod
	def install_mysql(widget):
		print "# # # # # # start install tools # # # # # #\n"
		os.system('sudo rm /var/lib/dpkg/lock')
		os.system('sudo rm /var/lib/dpkg/lock-frontend')
		os.system('sudo rm /var/cache/apt/archives/lock')
		os.system('sudo apt-get update')
		os.system('sudo apt-get -y install vim net-tools')
		print "# # # # # # install tools finished # # # # # #\n"


		print "# # # # # # start install google # # # # # #\n"
		os.system('sudo dpkg -i google*.deb')
		print "# # # # # # install google finished # # # # # #\n"

		print "# # # # # # start install mysql # # # # # #\n"
		os.system('sudo apt-get -y install mysql-server')
		print "# # # # # # install mysql finished # # # # # #\n"

		print "# # # # # start import database # # # # #\n"
		os.system('sudo mysql -uroot -p27693030eft -e "drop database IF EXISTS effortZigbee" ')
		os.system('sudo mysql -uroot -p27693030eft -e "create database IF NOT EXISTS effortZigbee" ')
		os.system('sudo mysql -uroot -p27693030eft effortZigbee < effort1.sql')
		os.system('sudo mysql -uroot -p27693030eft -e "use mysql;update user set host = \\"%\\" where user = \\"root\\";FLUSH PRIVILEGES" ')
		os.system('sudo mysql -uroot -p27693030eft -e "ALTER USER \\"root\\"@\\"%\\" IDENTIFIED WITH mysql_native_password BY \\"27693030eft\\";FLUSH PRIVILEGES" ')
		print "# # # # # import sql finished # # # # #\n"

		print "# # # # # # start mysql config# # # # # #\n"
		os.system('chmod 777 /etc/mysql/mysql.conf.d/mysqld.cnf')
		os.system('sed -i "/^"bind-address"/d" /etc/mysql/mysql.conf.d/mysqld.cnf')
		os.system('sed -i "1 i\\bind-address		= 0.0.0.0" /etc/mysql/mysql.conf.d/mysqld.cnf')
		os.system('chmod 644 /etc/mysql/mysql.conf.d/mysqld.cnf')
		os.system('systemctl restart mysql')
		print "# # # # # # install mysql finished # # # # # #\n"

		print "# # # # # start Install HZG # # # # #"
		os.system('sudo mv Forguncy*.tar /tmp')
		os.system('sudo unzip -zxvf /tmp/Forguncy*.tar')
		os.system('sudo tar -zxvf /tmp/Forguncy*.tar')
		os.system('sudo snap  install dotnet-sdk --classic --channel=3.1')
		os.system("sudo snap  install dotnet-runtime-31 --classic")
		os.system('sudo bash installForguncy*.sh')
		print "# # # # # Install HZG finished # # # # #\n"

		print "# # # # # start Install python config # # # # #"
		os.system('mv rc.local /etc')
		os.system('chmod +x /etc/rc.local')
		os.system('mv zigbeeProject /usr/local/')
		os.system('ls /usr/local/')
		os.system('cd /usr/local/')
		os.system('sudo add-apt-repository universe')
		os.system('sudo apt update')
		os.system('sudo python2 get-pip.py')
		os.system('pip install flask')
		os.system('pip install gevent-websocket')
		os.system('pip install gevent')
		print "# # # # # Install python config finished # # # # #\n"

		print "# # # # # python start # # # # #"
		os.system('nohup python -u /usr/local/zigbeeProject/SendMsg.py > /usr/local/zigbeeProject/test.out 2>&1 &')
		print "# # # # # start python # # # # #"

		print "# # # # # delete # # # # #"
		os.system('mv /home/zzw/Desktop/effortInstall/deploy.py /home/zzw/Desktop/')
		os.system('mv /home/zzw/Desktop/effortInstall/installFor*.sh /home/zzw/Desktop/')
		os.system('mv /home/zzw/Desktop/effortInstall /usr/local/')
		print "# # # # # delete finish# # # # #"

	@staticmethod
	def unload_All(widget):
		print "# # # # # # start uninstall mysql # # # # # #\n"
		os.system('sudo apt-get -y remove mysql-server')
		print "# # # # # # uninstall mysql finished # # # # # #\n"

		print "# # # # # # start uninstall mysql # # # # # #\n"
		os.system('sudo bash installFor*.sh -r')
		print "# # # # # # uninstall mysql finished # # # # # #\n"

		print "# # # # # # delete # # # # # #\n"
		os.system('sudo rm -rf deploy.py')
		os.system('sudo rm -rf installFor*.sh')
		os.system('sudo rm -rf /usr/local/effortInstall')
		os.system('sudo rm -rf /etc/rc.local')
		print "# # # # # # delete # # # # # #\n"

	@staticmethod
	def install_mysql(widget):
		print "# # # # # # start reset# # # # # #\n"
		os.system('sudo rm /var/lib/dpkg/lock')
		os.system('sudo rm /var/lib/dpkg/lock-frontend')
		os.system('sudo rm /var/cache/apt/archives/lock')
		print "# # # # # # reset finished # # # # # #\n"




app=Application()
app.connect("delete-event",Gtk.main_quit)
app.show_all()
Gtk.main()
