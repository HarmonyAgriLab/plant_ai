# yolo环境配置
从yolo的官方仓库将yolov5仓库clone到本地，并安装依赖包。
详情参考：https://github.com/ultralytics/yolov5


# 数据集准备

前往kaggle下载数据集，并解压到data目录下
详情参考：https://www.kaggle.com/datasets/sebastianpalaciob/plantvillage-for-object-detection-yolo
并编写合适的.yaml文件，存放于data的适当目录下,可参考仓库中给出的classes.yaml文件

# 训练模型
训练模型，并保存模型参数，保存在runs/exp/weights/best.pt
‘’‘bash
#可参考以下指令
python train.py  --batch 16 --epochs 100 --data data/plantvillage.yaml --weights yolov5s.pt

# 模型转换
模型转换，将模型参数转化为onnx格式，并保存在runs/exp/weights/best.onnx
‘’‘bash
#可参考以下指令
python export.py --weights runs/exp/weights/best.pt --include onnx

得到onnx模型后，就可以进行下一步转换，将onnx模型转化为rknn模型
详情参考https://doc.embedfire.com/linux/rk356x/Ai/zh/latest/lubancat_ai/example/yolov5.html
转换代码需要修改，可参考仓库中给出的onnx_to_rknn.py

# 模型部署
将得到的rknn部署到具体的开发版或其他边缘端上
详情参考https://doc.embedfire.com/linux/rk356x/Ai/zh/latest/lubancat_ai/example/yolov5.html