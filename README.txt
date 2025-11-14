================================================================================
                      ComfyUI API Python 客户端工具
================================================================================

项目简介
--------
本项目提供两个 Python 脚本，用于通过 API 方式自动化调用 ComfyUI 生成图像和视频。


文件说明
--------
1. t2i-api.py
   功能：文本到图像（Text to Image）批量生成
   描述：批量读取指定目录下的所有 JSON 配置文件，自动提交到 ComfyUI API 生成图像

2. i2v-api.py
   功能：图像到视频（Image to Video）生成
   描述：根据提示词文件和模板 JSON，批量生成视频任务并提交到 ComfyUI API


系统要求
--------
- Python 3.x
- ComfyUI 服务运行在本地 http://127.0.0.1:8188
- 必需的 Python 标准库：json, os, urllib, re


使用说明
--------

【一、t2i-api.py - 批量图像生成】

1. 配置路径
   在脚本中修改 JSON_DIR 变量，指向存放 JSON 配置文件的目录：
   JSON_DIR = r"D:\pythoncode\comfyui-api-py\t2i-json\1"

2. 准备 JSON 文件
   将 ComfyUI 导出的工作流 JSON 文件放入指定目录

3. 运行脚本
   python t2i-api.py

4. 功能特性
   - 自动扫描目录下所有 .json 文件
   - 为每个任务设置唯一的文件名前缀（Gen_文件名）
   - 批量提交到 ComfyUI API 队列
   - 支持自定义修改（如动态种子、提示词等）


【二、i2v-api.py - 图像转视频批量生成】

1. 配置路径
   在脚本中修改以下路径变量：
   PROMPT_FILE = r"D:\pythoncode\comfyui-api-py\i2v-json\prompt\prom.txt"
   TEMPLATE_JSON = r"D:\pythoncode\comfyui-api-py\i2v-json\json\video_wan2_2_14B_i2v-api-example.json"
   OUTPUT_DIR = r"D:\pythoncode\comfyui-api-py\i2v-json\json"

2. 准备文件
   a) prom.txt - 提示词文件，格式如下：
      1.传统中国插画风格，红色背景
      2.现代科幻场景，蓝色调
      3.温馨家庭场景，暖色调

   b) 模板 JSON 文件 - 从 ComfyUI 导出的工作流配置

   c) 图像文件 - 命名为 "序号.png"（如 1.png, 2.png），放在 ComfyUI 可访问的目录

3. 运行脚本
   python i2v-api.py

4. 工作流程
   - 解析 prom.txt 文件，提取序号和提示词
   - 为每个提示词生成独立的 JSON 配置文件
   - 自动修改节点93的文本提示词和节点97的图像文件名
   - 保存修改后的 JSON 文件到输出目录
   - 自动提交到 ComfyUI API 执行

5. 功能特性
   - 支持序号重复，自动添加后缀（如 video_wan2_2_14B_i2v-api-1-1.json）
   - 实时显示处理进度和状态
   - 错误处理和异常捕获


API 接口
--------
ComfyUI API 地址：http://127.0.0.1:8188/prompt
请求方法：POST
请求体格式：{"prompt": <JSON配置对象>}


注意事项
--------
1. 确保 ComfyUI 服务已启动并运行在默认端口 8188
2. 确保所有路径配置正确，文件存在
3. 图像文件需要放在 ComfyUI 可访问的目录中
4. JSON 配置文件需要从 ComfyUI 中正确导出
5. 节点 ID（如"93"、"97"）可能因工作流不同而变化，请根据实际情况修改


故障排除
--------
1. "加载 JSON 失败"
   - 检查文件路径是否正确
   - 确认 JSON 文件格式正确

2. "提交 API 失败"
   - 确认 ComfyUI 服务正在运行
   - 检查防火墙设置
   - 验证端口 8188 是否可访问

3. "找不到图像文件"
   - 检查图像文件命名是否匹配序号
   - 确认图像文件在 ComfyUI 可访问路径


技术支持
--------
如有问题或建议，请检查：
1. ComfyUI 官方文档
2. Python 版本兼容性
3. 文件路径和编码格式（UTF-8）


版本信息
--------
脚本版本：1.0
更新日期：2025
适用于：ComfyUI API


================================================================================
