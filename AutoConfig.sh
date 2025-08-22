read -p "Введите имя для кого ключи: " name
umask 077 #Для генерация с правами только для юзера rw
wg genkey |tee ${name}_privat.key | wg pubkey > ${name}_pub.key
echo "Ключи сгенерированы для $name"
ls -la
privat_key=$(cat "${name}_privat.key")
pub_key=$(cat "${name}_pub.key")
server_pub=$(sudo cat /etc/wireguard/server_public.key)
external_ip=$(curl ifconfig.me)

sudo cat /etc/wireguard/wg0.conf
read -p "Введие IP, последний октет: " ip_client

sudo tee >> /etc/wireguard/wg0.conf <<EOF

[Peer]
# $name
PublicKey = $pub_key
AllowedIPs= 10.11.0.${ip_client}/32

EOF

sudo systemctl restart wg-quick@wg0
sudo wg show

umask 077
sudo cat >/home/ops/Wireguard/${name}_client.conf << EOF

[Interface]
PrivateKey = $privat_key
Address = 10.11.0.${ip_client}/32
DNS = 192.168.1.1

[Peer]
PublicKey = $server_pub
Endpoint = $external_ip:64000

AllowedIPs = 192.168.1.0/24, 10.11.0.1/32
PersistentKeepalive = 25
EOF

ls -la
