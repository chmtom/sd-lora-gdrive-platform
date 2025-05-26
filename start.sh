#!/bin/bash
set -e

cd /workspace
if [ ! -d "runpod-sd-platform" ]; then
    echo "[Clone] Pulling project from GitHub..."
    git clone https://github.com/chmtom/runpod-sd-platform.git
fi

cd runpod-sd-platform

echo "[RunPod SD Platform] Mounting Google Drive..."
rclone --config /root/.config/rclone/rclone.conf mount gdrive: /mnt/gdrive --daemon

sleep 5

echo "[RunPod SD Platform] Creating symlinks..."
ln -s /mnt/gdrive/models /models || true
ln -s /mnt/gdrive/data/train /data || true
ln -s /mnt/gdrive/outputs /outputs || true
ln -s /mnt/gdrive/prompts /prompts || true

# Kopiowanie pliku stylów
cp /mnt/gdrive/styles/styles.csv /stable-diffusion-webui/styles.csv || true

# Kopiowanie config.json z ustawieniami (np. pattern nazw plików)
cp /mnt/gdrive/configs/config.json /stable-diffusion-webui/config.json || true

mkdir -p /logs
touch /logs/session_log.txt

bash menu.sh
