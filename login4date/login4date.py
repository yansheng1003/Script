#!/usr/bin/python
import requests

headers = {'User-Agent' : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.59 Safari/537.36',
           'Accept' : 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
           'Accept-Encoding' : 'gzip, deflate, sdch',
           'Accept-Language' : 'zh-CN,zh;q=0.8',
           #'Connection' : 'keep-alive',
           'Content-Type' : 'application/x-www-form-urlencoded',
           #'Host' : 'ucenter.unitedmne.com',
           #'Origin' : 'http://ucenter.unitedmne.com',
           #'Referer' : 'http://ucenter.unitedmne.com/cas/login?service=http://oa.unitedmne.com/accounts/login/?next=/',
           'Upgrade-Insecure-Requests' : '1'
           }
hosturl = 'http://oa.unitedmne.com'
loginurl = 'http://ucenter.unitedmne.com/cas/login?service=http://oa.unitedmne.com/accounts/login/?next=/'     	
s = requests.Session()
#获得csrftoken
res=s.get(hosturl)
r1=res.headers['Set-Cookie'].split(';',1)[0].split('=')[1]
post_data={'csrfmiddlewaretoken' : r1,
					 'username' : 'tianjinlong',
           'password' : 'jl10030895'
          }    
s.post(res.url,data=post_data,headers=headers)
r=s.get(hosturl)
s.get(http://oa.unitedmne.com/attendance/clock/)

#print r.text
#print '-----------------------------------'
#print r.headers
#print '-----------------------------------'
#print r.content
#print '-----------------------------------'
#print r.url
#print '-----------------------------------'
#print r.status_code
#print '-----------------------------------'
#print r.history