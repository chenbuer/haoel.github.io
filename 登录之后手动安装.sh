# 安装证书
# https://certbot.eff.org/instructions?ws=other&os=pip
sudo apt update
sudo apt install python3 python3-venv libaugeas0
sudo apt-get remove certbot
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot
sudo certbot certonly --standalone


# 下载gost
wget -nv https://github.com/ginuerzh/gost/releases/download/v2.11.5/gost-linux-amd64-2.11.5.gz -O /opt/gost/gost-linux-amd64-2.11.5.gz | true
gunzip /opt/gost/gost-linux-amd64-2.11.5.gz
mv /opt/gost/gost-linux-amd64-2.11.5 /opt/gost/gost
chmod +x /opt/gost/gost


# cloudflare_warp
# prepare_for_cloudflare_warp
sudo apt-get install -y gpg curl lsb-release
curl https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt-get update
# install cloudflare_warp
sudo apt-get install -y cloudflare-warp
warp-cli --accept-tos register
warp-cli --accept-tos set-mode proxy
warp-cli --accept-tos connect
warp-cli --accept-tos enable-always-on
warp-cli --accept-tos status


# 安装gost.service
sudo vi /usr/lib/systemd/system/gost.service
```
[Unit]
Description=Gost Service
After=network.target
Wants=network.target

[Service]
Type=simple
User=root
ExecStart=/opt/gost/gost -C /opt/gost/config.json
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
sudo systemctl enable gost
sudo systemctl start gost


# BBR
echo -e "net.core.default_qdisc=fq\nnet.ipv4.tcp_congestion_control=bbr" | sudo tee -a /etc/sysctl.conf >/dev/null
sysctl -p