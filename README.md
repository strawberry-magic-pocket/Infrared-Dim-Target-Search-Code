# Infrared-Dim-Target-Search-Code
本文件包含了已整理的经典的“红外弱小目标检测算法”有关资料。
子文件夹以算法名称命名，每个子文件夹包含了对应的复现代码和参考文献。

注：
data：共包含了25张测试图像
bwfunc.m 包含了3种实现阈值分割的算法

方法一： 阈值 = 图像均值 + 0.5✖️（图像最大值 - 图像均值）

方法二： 阈值 = 比例系数 ✖️图像最大值

方法三： 阈值 = 图像均值 + 比例系数✖️图像标准差
