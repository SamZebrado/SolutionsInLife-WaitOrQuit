%% 主程序
%% library
path_list = {'InteractivePlotToolBox'};
addpath(path_list{:})
%% 输入参数初始值
q = 0.1; % 任意一天租出去成功的概率
R = 7000; % 一个月房租
day_per_month = 31; % 一个月多少天
%% 调用互动界面
plot_fc = @fc_compare_huan_vs_zhuan;
para = {{q,'Name','任意一天租出去成功的概率','RangeInputBox',[0 1]};
    {day_per_month,'Name','一个月多少天','RangeInputBox',[0 8000]};
    {R,'Name','一个月房租','RangeInputBox',[0 31]}
    {1,'Name','图号（整数）','RangeInputBox',[0 100]};
    };
InteractivePlot(plot_fc,para)

%% clear path
rmpath(path_list{:})