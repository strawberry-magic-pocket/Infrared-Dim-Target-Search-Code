function bw = bwfunc(re, bflag)
bflag = 1;
flag = 0;
% m =mean2(re);
% s = std2(re);
m = mean(mean(re));
s = std(std(re));

maxv = max(re(:));
switch bflag
    case 1
%         阈值 = 图像均值 + 0.5*（图像最大值-图像均值）
        T = m + 0.5*(maxv - m);    
    case 2
        ratio = 0.6;
%         阈值 = 比例系数*图像最大值
        T = ratio * maxv;
    case 3
%         阈值 = 均值 + 比例系数*标准差
        ratio = 5;
        T = m+ ratio*s;
end
bw = re> T;
if flag
    figure; imshow(bw);
end
end