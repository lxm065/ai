#!/bin/bash

# 检查端口 8803 是否被监听
if ! lsof -Pi :8803 -sTCP:LISTEN -t >/dev/null ; then
    echo "端口 8803 未被监听，即将启动 ComfyUI..."
    # 启动 ComfyUI 命令
    python /mnt/hdd1/comfyUI/ComfyUI/main.py --listen &
    echo "ComfyUI 已启动，监听端口 8803。"
else
    echo "端口 8803 正在被监听，ComfyUI 可能正在运行。"
fi


