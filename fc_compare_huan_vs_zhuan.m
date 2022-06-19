function fig_hdl = fc_compare_huan_vs_zhuan(para)

para_value = cellfun(@(c)c{1},para,'UniformOutput',false);
[q,day_per_month,R,fig_hdl] = deal(para_value{:});
fig_hdl = max(1,round(fig_hdl));
%%
day_list = 1:day_per_month;% 天数列表
%% 换租
c_huanzu = zeros(day_per_month,0);
for dd = day_list
    c_huanzu(dd) = fc_get_Cost_huanzu(dd,day_per_month,q,R);
end


%% 转租
c_zhuanzu = 0.5*R + R/day_per_month*day_list;

%% 作图比较
figure(fig_hdl);
hold off;
plot(c_huanzu,'bx-')
hold on;
plot(c_zhuanzu,'rx-')
ylabel('成本（元）')
xlabel('发起日期（第dd天）')
legend('换租','转租','Location','northwest')
end