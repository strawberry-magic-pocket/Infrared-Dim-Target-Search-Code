clc;
clearvars;
close all;

addpath('../');
% 读取图像
datapath = '../data/';

% 是否输出结果
wflag = 1;
figure('units','normalized','outerposition',[0 0 1 1]);

lengthfiles = 25;
for i = 1:25
    try 
        img = imread([datapath, num2str(i),'.jpg']);
    catch
        img = imread([datapath,num2str(i),'.bmp']);
    end
    
    if size(img,1)==3
        img = rgb2gray(img);
    end
 
    flag = 1;
    re = MLCM_fun(img,flag,i);
%     re = lcmfunc(img);
    bw = bwfunc(re);
    %% show result
    hold on;
    p = strcat('Image-', num2str(i));
    subplot(3, 1, 1), imshow(img),title(p,'FontSize',15);
    ylabel('Original Image','FontSize',20);
    
    subplot(3, 1, 2),imshow(re,[]);
    ylabel('Result','FontSize',20);

    subplot(3, 1, 3),imshow(bw, []);
    ylabel('Target Result','FontSize',20);
    
    if wflag
        saveas(gcf, ['./result/',num2str(i),'.bmp']); 
    end
end