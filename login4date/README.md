#公司打卡脚本
###root用户下
###crontab -e 添加
<code>20 07 * * 1-5 echo '/usr/bin/python /usr/local/python27/login4date.py'|at now + $(openssl rand -base64 8 | cksum | cut -c3-4)minutes
00 17 * * 1-5 echo '/usr/bin/python /usr/local/python27/login4date.py'|at now + $(openssl rand -base64 8 | cksum | cut -c3-4)minutes
</code>
<code>/etc/init.d/crond reload</code>


