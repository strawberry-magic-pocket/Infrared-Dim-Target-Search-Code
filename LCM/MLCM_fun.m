function  out  = MLCM_fun( img, flag, i)

%% inputs:
% img: the input image

%% output
% out: output filtered image
%%
img = double(img);
[row,col]=size(img);  % 得到图像的大小
mask3=ones(3);        % 定义4个不同大小的模板 
mask5=ones(5);
mask7=ones(7);
mask9=ones(9);

l3=imdilate(img,mask3).^2;  % 灰度图像配膨胀：计算局部最大值
l5=imdilate(img,mask5).^2;
l7=imdilate(img,mask7).^2;
l9=imdilate(img,mask9).^2;

% 8个周围邻域（顺时针）
m31=zeros(9);      %建立邻域模板
m32=zeros(9);
m33=zeros(9);
m34=zeros(9);
m35=zeros(9);
m36=zeros(9);
m37=zeros(9);
m38=zeros(9);
m31(1:3,1:3)=1;
m32(1:3,4:6)=1;
m33(1:3,7:9)=1;
m34(4:6,7:9)=1;
m35(7:9,7:9)=1;
m36(7:9,4:6)=1;
m37(7:9,1:3)=1;
m38(4:6,1:3)=1;

LCM3=zeros(row,col,8);  % 可看作创建了8个[row, col]大小的矩阵，分别得到每个像素点的8个邻域的均值
LCM3(:,:,1)=localmean(img,m31);  % 存储各个像素点的第1个3*3邻域的均值
LCM3(:,:,2)=localmean(img,m32);
LCM3(:,:,3)=localmean(img,m33);
LCM3(:,:,4)=localmean(img,m34);
LCM3(:,:,5)=localmean(img,m35);
LCM3(:,:,6)=localmean(img,m36);
LCM3(:,:,7)=localmean(img,m37);
LCM3(:,:,8)=localmean(img,m38);
out3=max(LCM3,[],3);  % 得到第3维的最大值，即各个像素点的8个邻域均值中的最大值
out3=l3./out3;        % 
if flag
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,2,1);imshow(out3,[]);title('scale 3x3');
    subplot(1,2,2);
    surf(out3);
%     imwrite(uint8(out3),['./result/surf/',num2str(i),'_3x3.png']);
    saveas(gcf,['./result/surf/',num2str(i),'_3x3.png']);
end

m51=zeros(15);
m52=zeros(15);
m53=zeros(15);
m54=zeros(15);
m55=zeros(15);
m56=zeros(15);
m57=zeros(15);
m58=zeros(15);
m51(1:5,1:5)=1;
m52(1:5,6:10)=1;
m53(1:5,11:15)=1;
m54(6:10,11:15)=1;
m55(11:15,11:15)=1;
m56(11:15,6:10)=1;
m57(11:15,1:5)=1;
m58(6:10,1:5)=1;


LCM5=zeros(row,col,8);
LCM5(:,:,1)=localmean(img,m51);
LCM5(:,:,2)=localmean(img,m52);
LCM5(:,:,3)=localmean(img,m53);
LCM5(:,:,4)=localmean(img,m54);
LCM5(:,:,5)=localmean(img,m55);
LCM5(:,:,6)=localmean(img,m56);
LCM5(:,:,7)=localmean(img,m57);
LCM5(:,:,8)=localmean(img,m58);
out5=max(LCM5,[],3);
out5=l5./out5;

if flag
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,2,1);imshow(out5,[]);title('scale 5x5');
    subplot(1,2,2);
    surf(out5);
%     imwrite(uint8(out5),['./result/surf/',num2str(i),'_5x5.png']);
    saveas(gcf,['./result/surf/',num2str(i),'_5x5.png']);
end
    

m71=zeros(21);
m72=zeros(21);
m73=zeros(21);
m74=zeros(21);
m75=zeros(21);
m76=zeros(21);
m77=zeros(21);
m78=zeros(21);
m71(1:7,1:7)=1;
m72(1:7,8:14)=1;
m73(1:7,15:21)=1;
m74(8:14,15:21)=1;
m75(15:21,15:21)=1;
m76(15:21,8:14)=1;
m77(15:21,1:7)=1;
m78(8:14,1:7)=1;

LCM7=zeros(row,col,8);
LCM7(:,:,1)=localmean(img,m71);
LCM7(:,:,2)=localmean(img,m72);
LCM7(:,:,3)=localmean(img,m73);
LCM7(:,:,4)=localmean(img,m74);
LCM7(:,:,5)=localmean(img,m75);
LCM7(:,:,6)=localmean(img,m76);
LCM7(:,:,7)=localmean(img,m77);
LCM7(:,:,8)=localmean(img,m78);
out7=max(LCM7,[],3);
out7=l7./out7;

if flag
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,2,1);imshow(out7,[]);title('scale 7x7');
    subplot(1,2,2);
    surf(out7);
%     imwrite(uint8(out7),['./result/surf/',num2str(i),'_7x7.png']);
    saveas(gcf,['./result/surf/',num2str(i),'_7x7.png']);
end

m91=zeros(27);
m92=zeros(27);
m93=zeros(27);
m94=zeros(27);
m95=zeros(27);
m96=zeros(27);
m97=zeros(27);
m98=zeros(27);
m91(1:9,1:9)=1;
m92(1:9,10:18)=1;
m93(1:9,19:27)=1;
m94(10:18,19:27)=1;
m95(19:27,19:27)=1;
m96(19:27,10:18)=1;
m97(19:27,1:9)=1;
m98(10:18,1:9)=1;

LCM9=zeros(row,col,8);
LCM9(:,:,1)=localmean(img,m91);
LCM9(:,:,2)=localmean(img,m92);
LCM9(:,:,3)=localmean(img,m93);
LCM9(:,:,4)=localmean(img,m94);
LCM9(:,:,5)=localmean(img,m95);
LCM9(:,:,6)=localmean(img,m96);
LCM9(:,:,7)=localmean(img,m97);
LCM9(:,:,8)=localmean(img,m98);
out9=max(LCM9,[],3);
out9=l9./out9;

if flag
    figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(1,2,1);imshow(out9,[]);title('scale 9x9');
    subplot(1,2,2);
    surf(out9);
%     imwrite(uint8(out9),['./result/surf/',num2str(i),'_9x9.png']);
    saveas(gcf,['./result/surf/',num2str(i),'_9x9.png']);
end

temp=zeros(row,col,4);

temp(:,:,1)=out3;
temp(:,:,2)=out5;
temp(:,:,3)=out7;
temp(:,:,4)=out9;

out=max(temp,[],3);

end
