function c = fc_get_Cost_huanzu(dd,day_per_month,q,R)
% 在第dd天发起换租，每天租成功的概率为q，一个月day_per_month天，月房租R；计算成本的期望值c
fprintf('第%i天发起换租\n',dd)
if dd==day_per_month
    c = R;
    fprintf('相当于没发起hhh\n')
    return;
end
p_stay = 1;
cost_ii = zeros(day_per_month-dd+1,1);
p_stop = zeros(day_per_month-dd+1,1);% 租出去的概率
for ii = 1:(day_per_month-dd) % 计算之后每一天 租出去 和 没租出去 两种情况 对应的 累计成本
    %% 当天房子还没租出去的概率: p_stay，第1天为1
    %% 租出去了

    % 在这天之前还没租出去、刚好到这天租出去的概率
    p_stop(ii) = p_stay * q;
    fprintf('\t恰好在第%i天租出去的概率为%.3f\n',ii,p_stop(ii))
    % 累计到这一天为止额外付出的房租
    cost_ii(ii) = ii*R/31;

    %% 没租出去
    % 未租出去，到下一天继续计算
    p_stay = p_stay*(1-q);
    fprintf('\t第%i天没有租出去的概率为%.3f\n',ii,p_stay)
end
%% 最后一天还是没有租出去
p_stop(end) = p_stay;
cost_ii(end) = cost_ii(end-1);% 没有额外损失 (因为租期结束了）

%% 前dd天的成本 + 按概率加权求得的后ii天的平均成本
c = R*dd/day_per_month + sum(p_stop.*cost_ii);
end
