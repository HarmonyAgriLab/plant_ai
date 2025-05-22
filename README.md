# YOLO 环境配置

从 YOLO 的官方仓库将 YOLOv5 克隆到本地，并安装依赖包。  
详情参考：[YOLOv5 GitHub 仓库](https://github.com/ultralytics/yolov5)

```bash
git clone https://github.com/ultralytics/yolov5.git
cd yolov5
pip install -r requirements.txt
```

---

# 数据集准备

前往 Kaggle 下载数据集并解压到 `data/` 目录下。  
数据集地址：[PlantVillage for Object Detection (YOLO)](https://www.kaggle.com/datasets/sebastianpalaciob/plantvillage-for-object-detection-yolo)

编写合适的 `.yaml` 文件，存放于 `data/` 目录中。可参考仓库中提供的 `classes.yaml` 示例。

---

# 模型训练

训练模型并将模型参数保存至 `runs/exp/weights/best.pt`。

```bash
# 示例指令
python train.py --batch 16 --epochs 100 --data data/plantvillage.yaml --weights yolov5s.pt
```

---

# 模型转换

将训练好的模型转换为 ONNX 格式，并保存至 `runs/exp/weights/best.onnx`：

```bash
# 示例指令
python export.py --weights runs/exp/weights/best.pt --include onnx
```

然后使用 `onnx_to_rknn.py` 将 ONNX 模型转换为 RKNN 模型，详见：[RKNN 模型转换官方文档](https://doc.embedfire.com/linux/rk356x/Ai/zh/latest/lubancat_ai/example/yolov5.html)

---

# 模型部署

将 RKNN 模型部署至开发板或其他边缘设备，步骤参考上述文档：[模型部署说明](https://doc.embedfire.com/linux/rk356x/Ai/zh/latest/lubancat_ai/example/yolov5.html)
可参考show.py  进行模型测试
确认模型可以成功在部署端运行后，继续配置开机自启动脚本。
可参考[开机自启动脚本](https://blog.csdn.net/csdn570566705/article/details/131931703?ops_request_misc=&request_id=&biz_id=102&utm_term=liunx%E4%B8%8B%E5%A2%9E%E5%8A%A0%E5%BC%80%E6%9C%BA%E8%87%AA%E5%90%AF%E5%8A%A8&utm_medium=distribute.pc_search_result.none-task-blog-2~all~sobaiduweb~default-1-131931703.142^v102^pc_search_result_base2&spm=1018.2226.3001.4187)进行部署，本仓库使用的为systemd方法，方法一无法调动cv中的ui窗口以及读取摄像头权限
参考脚本见start_script.sh，部署时修改具体路径以及相关命令
注：在部署开机自启前，务必确定编写好的脚本能够手动调用成功，并确保模型能够正常运行
