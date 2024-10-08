
**如果搭建SSR账号，请使用脚本一，目前推荐的SSR参数设置为以下，有利于突破网络封锁，参数如下**：

1、加密方式：none  协议：origin 混淆：tls1.2_ticket_auth

2、加密方式：none   协议：auth_chain_a 混淆：tls1.2_ticket_auth 


**如果搭建SS账号，请使用脚本二，加密方式可选aes-256-gcm，或者高阶篇的SS+插件模式（推荐）**

**推荐搭建SSR账号。**

***

**CentOS 6和7/Debian6+/Ubuntu14+ ShadowsocksR/Shadowsocks一键部署管理脚本：**

**脚本一(SSR)，安装完成后，快捷管理命令：bash ssr.sh**

***

yum -y install wget

wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh

***

**脚本二（SS）**

**脚本二没有单独做图文教程，参考脚本一的图文说明摸索下就会了。安装完成后，快捷管理命令：bash ss-go.sh**

***

yum -y install wget

wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubiBackup/doubi/master/ss-go.sh && chmod +x ss-go.sh && bash ss-go.sh

***

> 如果提示 wget: command not found 的错误，这是你的系统精简的太干净了，wget都没有安装，所以需要安装wget。CentOS系统安装wget命令: yum install -y wget  Debian/Ubuntu系统安装wget命令:apt-get install -y wget


***


复制上面的**脚本一代码**到VPS服务器里，复制代码用鼠标右键的复制（整个代码一起复制，而不是分段哦！），然后在vps里面右键粘贴进去，因为ctrl+c和ctrl+v无效。接着按回车键，脚本会自动安装，以后只需要运行这个快捷命令就可以出现下图的界面进行设置，快捷管理命令为：bash ssr.sh

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/ss/8.png)

如上图出现管理界面后，**输入数字1来安装SSR服务端**。如果输入1后不能进入下一步，那么请退出xshell，重新连接vps服务器，然后输入快捷管理命令bash ssr.sh 再尝试。

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/demo/31.png)

根据上图提示，依次输入自己想设置的**端口和密码** (**密码建议用复杂点的字母组合，端口号为40-65535之间的数字**)，回车键用于确认

注：关于端口的设置，总的网络总端口有6万多个，理论上可以任意设置，但不要以0开头！但是有的地区需要设置特殊的端口才有效，一些特殊的端口比如80、143、443、1433、3306、3389、8080。

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/demo/32.png)

如上图，选择想设置的**加密方式**，比如10，按回车键确认

接下来是选择**协议插件**，如下图：

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/ss/11.png)

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/demo/41.PNG)

选择并确认后，会出现上图的界面，提示你是否选择兼容原版，这里的原版指的是SS客户端（SS客户端没有协议和混淆的选项），可以根据需求进行选择，演示选择y

之后进行混淆插件的设置。

**注意：混淆选择plain意思是不混淆，有的时期增加混淆有利于突破封锁，有的时期不混淆有利用突破封锁，需要自己来尝试。** 


进行混淆插件的设置后，会依次提示你对设备数、单线程限速和端口总限速进行设置，默认值是不进行限制，个人使用的话，选择默认即可，即直接敲回车键。

注意：关于限制设备数，这个协议必须是非原版且不兼容原版才有效，也就是必须使用SSR协议的情况下，才有效！

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/ss/14.png)

之后代码就正式自动部署了，到下图所示的位置，提示你下载文件，输入：y

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/ss/15.png)

耐心等待一会，出现下面的界面即部署完成：

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/ss/16.png)

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/demo/34.png)

根据上图就可以看到自己设置的SSR账号信息，包括IP、端口、密码、加密方式、协议插件、混淆插件，这些信息需要填入你的SSR客户端。提醒一下：二维码链接地址由于域名失效不可用，所以部署好的账号需要自己在客户端里面手动填写信息。

如果之后想修改账号信息，直接输入快捷管理命令：bash ssr.sh 进入管理界面，选择相应的数字来进行一键修改。例如：

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/ss/22.png)

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/ss/23.png)

**脚本演示结束。**


此脚本是开机自动启动，部署一次即可。最后可以重启服务器确保部署生效（一般情况不重启也可以）。重启需要在命令栏里输入reboot ，输入命令后稍微等待一会服务器就会自动重启，一般重启过程需要2～5分钟，重启过程中Xshell会自动断开连接，等VPS重启好后才可以用Xshell软件进行连接。如果部署过程中卡在某个位置超过10分钟，可以用xshell软件断开，然后重新连接你的ip，再复制代码进行部署。

**注意：如果创建的是centos7的服务器，需要使用命令关闭防火墙，否则无法使用代理。CentOS 7.0默认使用的是firewall作为防火墙。**

**查看防火墙状态命令：firewall-cmd --state**

**停止firewall命令：systemctl stop firewalld.service**

**禁止firewall开机启动命令：systemctl disable firewalld.service**

***

**高阶篇**

当封锁特别厉害的时候，常规的SS/SSR配置可能已经无法满足需求，这个时候SSR节点我们可以搭建SSR+TLS+Caddy，搭建需要购买域名，可以参考这个[域名购买及设置教程](https://github.com/Alvin9999/new-pac/wiki/%E5%9F%9F%E5%90%8D%E8%B4%AD%E4%B9%B0%E6%95%99%E7%A8%8B) （有免费域名） 。如果搭建SS节点，推荐SS+插件，比如v2ray插件模式下的SS+Websocket，这个配置不用域名就可以搭建。

用一键搭建工具ProxySU来搭建即可，傻瓜式，很方便，[一键搭建工具ProxySU使用教程](https://github.com/Alvin9999/new-pac/wiki/%E4%B8%80%E9%94%AE%E6%90%AD%E5%BB%BA%E7%A7%91%E5%AD%A6%E4%B8%8A%E7%BD%91%E5%B7%A5%E5%85%B7ProxySU)

示意图:

![](https://fastly.jsdelivr.net/gh/Alvin9999/pac2/ssimage/ssrtls.PNG)

![](https://fastly.jsdelivr.net/gh/Alvin9999/pac2/ssimage/ss-plugin2.png)


***

**第三步：一键加速VPS服务器**

五合一的TCP网络加速脚本，包括了BBR原版、BBR魔改版、暴力BBR魔改版、BBR plus（首选）、Lotsever(锐速)安装脚本。可用于KVMXen架构，不兼容OpenVZ（OVZ）。支持Centos 6+ / Debian 7+ / Ubuntu 14+，BBR魔改版不支持Debian 8。

***

wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh"

chmod +x tcp.sh

./tcp.sh


***

> 如果提示 wget: command not found 的错误，这是你的系统精简的太干净了，wget都没有安装，所以需要安装wget。CentOS系统安装wget命令: yum install -y wget Debian/Ubuntu系统安装wget命令:apt-get install -y wget

安装完成后，脚本管理命令为：./tcp.sh

![](https://fastly.jsdelivr.net/gh/Alvin9999/pac2/vultr/newbbr1.jpg)

操作方法：先安装内核，重启vps让内核生效，再启动对应的加速即可。数字1的BBR/BBR魔改内核对应数字4、5、6的BBR加速、BBR魔改加速和暴力BBR魔改版加速。数字2的BBRplus内核对应数字7的BBRplus加速。数字3的锐速加速内核对应数字8的锐速加速。

以安装暴力BBR魔改版加速为例，我们先安装对应的内核，输入数字1

![](https://fastly.jsdelivr.net/gh/Alvin9999/pac2/vultr/newbbr2.jpg)

内核安装完成后，输入y进行重启，重启才能让内核生效

![](https://fastly.jsdelivr.net/gh/Alvin9999/pac2/vultr/newbbr3.jpg)

重启完成后，输入数字6来启动暴力BBR魔改版加速

![](https://fastly.jsdelivr.net/gh/Alvin9999/pac2/vultr/newbbr4.jpg)

![](https://fastly.jsdelivr.net/gh/Alvin9999/pac2/vultr/newbbr5.jpg)

输入./tcp.sh查看最终是否启动成功。

如果想换一个加速，输入数字9进行卸载加速，然后进行同样的操作，安装内核再安装对应内核的加速即可。

**注意：如果在安装内核环节出现这样一张图，注意选择NO**

![](https://fastly.jsdelivr.net/gh/Alvin9999/pac2/vultr/newbbr6.jpg)


***

【SSR客户端下载】

第一次电脑系统使用SSR/SS客户端时，如果提示你需要安装NET Framework 4.0，网上搜一下这个东西，安装一下即可。NET Framework 4.0是SSR/SS的运行库，没有这个SSR/SS客户端无法正常运行。有的电脑系统可能会自带NET Framework 4.0。

Windows SSR客户端 [下载地址](https://github.com/shadowsocksr-backup/shadowsocksr-csharp/releases) 

Windows SS客户端 [下载地址](https://github.com/shadowsocks/shadowsocks-windows/releases) 

Mac SSR客户端 [下载地址](https://github.com/shadowsocksr-backup/ShadowsocksX-NG/releases) 

[Linux客户端一键安装配置使用脚本](https://github.com/the0demiurge/CharlesScripts/blob/master/charles/bin/ssr) (使用方法见注释)

安卓SSR客户端 [下载地址](https://github.com/shadowsocksr-backup/shadowsocksr-android/releases/download/3.4.0.8/shadowsocksr-release.apk) 

iOS：[没有美区AppleID的翻墙教程](https://github.com/Alvin9999/new-pac/wiki/%E8%8B%B9%E6%9E%9C%E6%89%8B%E6%9C%BA%E7%BF%BB%E5%A2%99%E8%BD%AF%E4%BB%B6)  [iOS注册美区Apple ID教程](https://github.com/Alvin9999/new-pac/wiki/iOS%E6%B3%A8%E5%86%8C%E7%BE%8E%E5%8C%BAApple-ID%E6%95%99%E7%A8%8B) 

[全平台SS/SSR客户端下载汇总](http://www.mediafire.com/folder/sfqz8bmodqdx5/shadowsocks相关客户端)

***

**有了账号后，打开SSR客户端，填上信息，这里以windows版的SSR客户端为例子**：

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/demo/42.PNG)

在对应的位置，填上服务器ip、服务器端口、密码、加密方式、协议和混淆，最后将浏览器的代理设置为（http）127.0.0.1和1080即可。账号的端口号就是你自己设置的，而要上网的浏览器的端口号是1080，固定的，谷歌浏览器可以通过 SwitchyOmega 插件来设置。

下载插件：[switchyomega](https://github.com/atrandys/trojan/releases/download/1.0.0/SwitchyOmega_Chromium.crx)

安装插件，打开chrome，打开扩展程序，将下载的插件拖动到扩展程序页面，添加到扩展。
![20181116000534](https://user-images.githubusercontent.com/12132898/70548725-0461d000-1bae-11ea-9d1e-4577e36ac46e.png)

完成添加，会跳转到switchyomega页面，点跳过教程，然后点击proxy，如图填写，最后点击应用选项。

![](https://fastly.jsdelivr.net/gh/Alvin9999/PAC/demo/ssrkz.PNG)

启动SSR客户端后，右键SSR客户端图标，选择第一个“系统代理模式”，里面有3个子选项，选择"全局模式“，之后就可以用浏览器设置好了的代理模式（http）127.0.0.1和1080翻墙，此模式下所有的网站都会走SSR代理。

![ssr9000](https://user-images.githubusercontent.com/12132898/32225069-cfe6195a-be7e-11e7-99e0-e2fa98f93b1f.png)
