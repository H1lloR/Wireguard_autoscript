# Wireguard_autoscript
Простой bash-скрипт для автоматической генерации ключей WireGuard и добавления нового клиента в конфигурацию сервера.

## 🔧 Возможности
- Генерирует приватный и публичный ключи для клиента
- Автоматически добавляет `Peer` в `wg0.conf`
- Создаёт клиентский конфиг `${name}_client.conf`, готовый к использованию
- Перезапускает WireGuard для применения изменений

## 🚀 Использование
1. Клонируйте репозиторий:
   ```bash
   git clone https://github.com/H1lloR/Wireguard_autoscript.git
   cd Wireguard_autoscript


Дайте права на выполнение:

chmod +x AutoConfig.sh


Запустите:

sudo ./AutoConfig.sh

📂 Где искать файлы

Клиентские ключи: *.key

Конфиг клиента: где запускали скрипт

Серверный конфиг: /etc/wireguard/wg0.conf

⚠️ Требования

Linux

WireGuard (wg, wg-quick)

Права sudo
