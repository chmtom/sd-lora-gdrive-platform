#!/bin/bash

cd /workspace

if [ ! -d "kohya_ss" ]; then
    echo "[Install] Cloning kohya_ss..."
    git clone https://github.com/bmaltais/kohya_ss.git
fi

cd kohya_ss

echo "[Install] Installing dependencies..."
pip install -r requirements.txt

echo "[Run] Launching kohya_ss GUI..."
python kohya_gui.py
