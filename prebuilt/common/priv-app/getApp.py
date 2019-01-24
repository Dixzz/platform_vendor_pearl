#!/usr/bin/env python
import urllib as urllib2
import os
appver = urllib2.urlopen('https://pastebin.com/raw/2TCsWXi8')
html = appver.read()
path = os.getcwd()+"/vendor/pearl/prebuilt/common/priv-app/"
update = html.decode("utf8")
appver.close()

if os.path.isfile(path+"AppVer.txt"):
    with open(path+"AppVer.txt") as f:
        version = f.readline().strip()
    f.close()

else:
    with open(path+"AppVer.txt","a+") as f:
        f.write("0")
    f.close()
    version = 0

if float(update) > float(version):
    if os.path.isfile(path+"AboutUs.apk"):
        os.remove(path+"AboutUs.apk")
    d = urllib2.urlopen("https://github.com/Ovenoboyo/pearl_aboutus/releases/download/" +update+ "/AboutUs.apk")
    file = d.read()
    with open(path+"AboutUs.apk", "wb") as app:
        app.write(file)
    f = open(path+"AppVer.txt","w+")
    f.write(update)
    f.close()

