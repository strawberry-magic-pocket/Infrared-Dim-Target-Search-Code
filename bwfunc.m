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
%         ��ֵ = ͼ���ֵ + 0.5*��ͼ�����ֵ-ͼ���ֵ��
        T = m + 0.5*(maxv - m);    
    case 2
        ratio = 0.6;
%         ��ֵ = ����ϵ��*ͼ�����ֵ
        T = ratio * maxv;
    case 3
%         ��ֵ = ��ֵ + ����ϵ��*��׼��
        ratio = 5;
        T = m+ ratio*s;
end
bw = re> T;
if flag
    figure; imshow(bw);
end
end