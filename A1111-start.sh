#!/bin/bash
set -e

cd /workspace

if [ ! -d "stable-diffusion-webui" ]; then
    echo "[Install] Cloning AUTOMATIC1111..."
    git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
fi

cd stable-diffusion-webui

echo "[Install] Updating repo..."
git pull

echo "[Install] Installing dependencies..."
pip install -r requirements.txt
pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu118
pip install xformers

echo "[Run] Launching WebUI with Gradio..."
python launch.py \
    --listen \
    --xformers \
    --no-half \
    --enable-insecure-extension-access \
    --disable-console-progressbars \
    --ckpt-dir /models \
    --output-dir /outputs \
    --gradio-auth none \
    --api
