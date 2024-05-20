import matlab.engine
import numpy as np
from PIL import Image
from flask import Flask, send_file
from flask_cors import CORS

app = Flask(__name__)
CORS(app, origins="http://localhost:8080")

@app.route('/')
@app.route('/')
def get_image_data():
    # 使用 MATLAB 引擎加载模型
    eng = matlab.engine.start_matlab()
    eng.eval("run('mianz.m');", nargout=0)
    # 获取当前图形句柄
    fig_handle = eng.gcf()

    # 将图像数据传输到 Python 中
    matlab_image_data = eng.getframe(fig_handle, nargout=1)
    # 检查数据类型并转换为 NumPy 数组
    if isinstance(matlab_image_data, dict) and 'cdata' in matlab_image_data:
        matlab_image = np.asarray(matlab_image_data['cdata'], dtype=np.uint8)
    else:
        raise ValueError("Unexpected image data format from MATLAB")

    # 关闭 MATLAB 引擎
    eng.quit()

    # 将图像数据转换为 PIL 图像对象
    image = Image.fromarray(matlab_image)
    image.save('static/img/output_path.png')

    return send_file('static/img/output_path.png', mimetype='image/png')

# 将Matlab输出转换为PIL图像对象
def matlab_output_to_image(matlab_output):
    # 假设matlab_output是你从Matlab脚本中获取的图像数据
    # 这里需要根据你的实际情况进行处理
    # 示例中假设matlab_output是一个二维数组，表示灰度图像
    # 你需要根据你的模型输出进行适当的转换
    # 这里仅提供一个简单的示例
    # 将二维数组转换为PIL的图像对象
    img = Image.fromarray(matlab_output)
    return img


if __name__ == '__main__':
    app.run()
