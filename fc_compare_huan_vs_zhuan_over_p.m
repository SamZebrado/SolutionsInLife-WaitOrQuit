function fig_hdl = fc_compare_huan_vs_zhuan_over_p(para)

para_value = cellfun(@(c)c{1},para,'UniformOutput',false);
[day_per_month,R,fig_hdl] = deal(para_value{:});
fig_hdl = max(1,round(fig_hdl));
%%
dd = 1;% 第一天

p_list = 0:0.01:1;
%% 换租
c_huanzu = zeros(day_per_month,0);
for i_p = 1:length(p_list)
    q = p_list(i_p);
    c_huanzu(i_p) = fc_get_Cost_huanzu(dd,day_per_month,q,R);
end


%% 转租
c_zhuanzu = 0.5*R + R/day_per_month*ones(1,length(p_list));

%% 作图比较
figure(fig_hdl);
hold off;
plot(c_huanzu,'bx-')
hold on;
plot(c_zhuanzu,'rx-')
ylabel('第一天成本（元）')
xlabel('单日成功出租概率p')
legend('换租','转租','Location','northwest')
mean_diff = (mean(c_zhuanzu-c_huanzu));
title (sprintf('转租 - 换租 的平均值为%.3f',mean_diff))
end