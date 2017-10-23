------------------------------------------------
-- Export file for user SISANSHDATA           --
-- Created by LIWU645 on 2017-10-23, 15:16:40 --
------------------------------------------------

spool sisanshdata_proc.log

prompt
prompt Creating package RECOMMEND_STOCK_SETTLEMENT
prompt ===========================================
prompt
create or replace package sisanshdata.recommend_stock_settlement is

  -- Author  : 欧阳
  -- Created : 2012-7-4 13:21:19
  -- Purpose : 荐股日终清算

  --判断推荐时间是市前0、市中2、市后1
  function judgeRecmdTime(recmdTime varchar2) return varchar2;

  --判断推荐是否已经到最后日期 0：未到，1：到
  function isEndRecmdDay(afterDay number, recmdTerm varchar2, recmdTime varchar2) return varchar2;

  --判读用户是否已经参与排名 0表示存在 1表示不存在
  function userisranks(userid varchar2) return varchar2;

  --每日处理荐股状态及收益
  procedure calculateRecommendStockEarn(po_retcod out varchar2);

  --统计荐股数
  procedure statisticsCompleteRecmdStk(po_retcod out varchar2);

  --荐股排名
  procedure statisticsRanks(po_retcod out varchar2);

end recommend_stock_settlement;
/
grant execute on SISANSHDATA.RECOMMEND_STOCK_SETTLEMENT to SISANSHOPR;


prompt
prompt Creating package RZRQ_SETTLEMENT
prompt ================================
prompt
create or replace package sisanshdata.rzrq_settlement is

  -- Author  : 欧阳大炯
  -- Created : 2012-6-21 14:12:25
  -- Purpose : 融资融券清算包
  procedure rzrq_daily_settlement_prepare(po_retcod out varchar2);

  procedure rzrq_daily_nodeal_order(po_retcod out varchar2);

  procedure rzrq_match_end_deal(po_retcod out varchar2);

  procedure rzrq_daily_payoff(po_retcod out varchar2);

  procedure rzrq_earning_yield(po_retcod out varchar2);

  procedure rzrq_yield_rank_stock(po_retcod out varchar2);

  procedure rzrq_yield_rank_match(po_retcod out varchar2);

  procedure rzrq_contract_daily_interest(po_retcod out varchar2);  --新增，每日清算合约利息

  procedure rzrq_history_transfer(po_retcod out varchar2);

  procedure rzrq_match_end_updateaccount(po_retcod out varchar2);

end rzrq_settlement;
/
grant execute on SISANSHDATA.RZRQ_SETTLEMENT to SISANSHOPR;


prompt
prompt Creating package STOCK_SETTLEMENT
prompt =================================
prompt
create or replace package sisanshdata.stock_settlement is

  -- Author  : hgc
  -- Created : 2013/9/24 13:57:25
  -- Purpose :

  -- 普通交易清算包
  procedure proc_daily_nodeal_order(po_retcod out varchar2);

  procedure proc_match_end_sell(po_retcod out varchar2);

  procedure proc_daily_payoff(po_retcod out varchar2);

  procedure proc_history_transfer(po_retcod out varchar2);

  procedure proc_earnings_payoff(po_retcod out varchar2);

end stock_settlement;
/
grant execute on SISANSHDATA.STOCK_SETTLEMENT to SISANSHOPR;


prompt
prompt Creating package STOCK_SETTLEMENT_BAK
prompt =====================================
prompt
create or replace package sisanshdata.stock_settlement_bak is

  -- Author  : hgc
  -- Created : 2013/9/24 13:57:25
  -- Purpose :

  -- 普通交易清算包
  procedure proc_daily_settlement_prepare(po_retcod out varchar2);

  procedure proc_daily_nodeal_order(po_retcod out varchar2);

  procedure proc_match_end_sell(po_retcod out varchar2);

  procedure proc_daily_payoff(po_retcod out varchar2);

  procedure proc_earning_yield(po_retcod out varchar2);

  procedure proc_yield_rank_stock(po_retcod out varchar2);

  procedure proc_yield_rank_match(po_retcod out varchar2);

  procedure proc_history_transfer(po_retcod out varchar2);

  procedure proc_match_end_updateaccount(po_retcod out varchar2);

end stock_settlement_bak;
/
grant execute on SISANSHDATA.STOCK_SETTLEMENT_BAK to SISANSHOPR;


prompt
prompt Creating package THINKIVE_ORA
prompt =============================
prompt
CREATE OR REPLACE PACKAGE SISANSHDATA.THINKIVE_ORA
AS
    TYPE ref_cursor IS REF CURSOR;
END;
/
grant execute on SISANSHDATA.THINKIVE_ORA to SISANSHOPR;


prompt
prompt Creating function GETENDMONTH
prompt =============================
prompt
create or replace function sisanshdata.getendmonth
return varchar2
is
begin
  return (to_char(last_day(sysdate),'yyyymmdd'));
end getendmonth;
/
grant execute on SISANSHDATA.GETENDMONTH to SISANSHOPR;


prompt
prompt Creating function GETENDWEEK
prompt ============================
prompt
create or replace function sisanshdata.getendweek
return varchar2
is
  Result varchar2(8);
  v_day  varchar2(2);
begin
  select to_char(sysdate,'D') into v_day from dual;
  if v_day = '6' then
    select to_char(sysdate,'yyyymmdd') into result from dual;
  else
    select to_char(next_day(sysdate,6),'yyyymmdd') into Result from dual;
  end if;
  return(Result);
end getendweek;
/
grant execute on SISANSHDATA.GETENDWEEK to SISANSHOPR;


prompt
prompt Creating function GETLASTFRIDATE
prompt ================================
prompt
create or replace function sisanshdata.getLastFriDate
(
   argDate  in   varchar2
)
return varchar2
is
  Result varchar2(8);
  v_day  varchar2(2);
begin
  if argDate is not null then
    select to_char(to_date(argDate,'yyyymmdd'),'D') into v_day from dual;
    if v_day = '6' then
      select to_char(next_day(to_date(argDate,'yyyymmdd')-8,6),'yyyymmdd') into Result from dual;
    else
      select to_char(next_day(to_date(argDate,'yyyymmdd')-7,6),'yyyymmdd') into Result from dual;
    end if;
  else
    select to_char(sysdate,'D') into v_day from dual;
    if v_day = '6' then
      select to_char(next_day(sysdate-8,6),'yyyymmdd') into Result from dual;
    else
      select to_char(next_day(sysdate-7,6),'yyyymmdd') into Result from dual;
    end if;
  end if;

  return Result;
end getLastFriDate;
/
grant execute on SISANSHDATA.GETLASTFRIDATE to SISANSHOPR;


prompt
prompt Creating function GETLASTMONDATE
prompt ================================
prompt
create or replace function sisanshdata.getLastMonDate
(
  argDate   in  varchar2
)
return varchar2
is
begin
  if argDate is not null then
    return(to_char(last_day(add_months(to_date(argDate,'yyyymmdd'),-1)),'yyyymmdd'));
  else
    return(to_char(last_day(add_months(sysdate,-1)),'yyyymmdd'));
  end if;
end getLastMonDate;
/
grant execute on SISANSHDATA.GETLASTMONDATE to SISANSHOPR;


prompt
prompt Creating function GETLASTTRADEDATE
prompt ==================================
prompt
create or replace function sisanshdata.getLastTradeDate return varchar2 is
  Result      varchar2(8);
  lastRwoDate varchar2(8);
begin
  lastRwoDate := to_char(sysdate - 2, 'yyyymmdd');
  select t_date
    into Result
    from (select t_date
            from t_b_skrace_tradedate t
           where t.t_date <= lastRwoDate
             and t.is_trade = 1
           order by t.t_date desc)
   where rownum = 1;

  return(Result);
end getLastTradeDate;
/
grant execute on SISANSHDATA.GETLASTTRADEDATE to SISANSHOPR;


prompt
prompt Creating function GETLMTRADEDATE
prompt ================================
prompt
create or replace function sisanshdata.getlmtradedate return varchar2
is
  Result varchar2(8);
  v_date varchar2(8);
  v_day  varchar2(2);
begin
  select (to_char(last_day(add_months(sysdate,-1)),'yyyymmdd')) into v_date from dual;
  select max(t.t_date) into Result from t_b_skrace_tradedate t where t.t_date<=v_date and t.is_trade=1;
  return Result;
end getlmtradedate;
/
grant execute on SISANSHDATA.GETLMTRADEDATE to SISANSHOPR;


prompt
prompt Creating function GETLWTRADEDATE
prompt ================================
prompt
create or replace function sisanshdata.getlwtradedate
return varchar2
is
  Result varchar2(8);
  v_date varchar2(8);
  v_day  varchar2(2);
begin
   select to_char(sysdate,'D') into v_day from dual;
    if v_day = '6' then
      select to_char(next_day(sysdate-8,6),'yyyymmdd') into v_date from dual;
    else
      select to_char(next_day(sysdate-7,6),'yyyymmdd') into v_date from dual;
    end if;
    select max(t.t_date) into Result from t_b_skrace_tradedate t where t.t_date<=v_date and t.is_trade=1;
  return Result;
end getlwtradedate;
/
grant execute on SISANSHDATA.GETLWTRADEDATE to SISANSHOPR;


prompt
prompt Creating function GETMONTHTRADEDATE
prompt ===================================
prompt
create or replace function sisanshdata.getmonthtradedate return varchar2
is
  Result varchar2(8);
  v_date varchar2(8);
  v_day  varchar2(2);
begin
  select to_char((sysdate-30),'yyyymmdd') into v_date from dual;
  select max(t.t_date) into Result from t_b_skrace_tradedate t where t.t_date<=v_date and t.is_trade=1;
  return Result;
end getmonthtradedate;
/
grant execute on SISANSHDATA.GETMONTHTRADEDATE to SISANSHOPR;


prompt
prompt Creating function GETTRADEDATE
prompt ==============================
prompt
create or replace function sisanshdata.getTradeDate
 return varchar2 is
  Result varchar2(8);
  weekNum integer;
begin
  weekNum := to_char(sysdate,'D');
  if weekNum = 7  then
     Result := to_char(sysdate+2,'yyyymmdd');
  elsif weekNum = 1 then
     Result := to_char(sysdate+1,'yyyymmdd');
  else
     Result := to_char(sysdate,'yyyymmdd');
  end if;
  return(Result);
end getTradeDate;
/
grant execute on SISANSHDATA.GETTRADEDATE to SISANSHOPR;


prompt
prompt Creating function GETWEEKTRADEDATE
prompt ==================================
prompt
create or replace function sisanshdata.getweektradedate
return varchar2
is
  Result varchar2(8);
  v_date varchar2(8);
  v_day  varchar2(2);
begin
   select to_char(sysdate-7,'yyyyMMdd') into v_date from dual;
    select max(t.t_date) into Result from t_b_skrace_tradedate t where t.t_date<=v_date and t.is_trade=1;
  return Result;
end getweektradedate;
/
grant execute on SISANSHDATA.GETWEEKTRADEDATE to SISANSHOPR;


prompt
prompt Creating function GETYEARTRADEDATE
prompt ==================================
prompt
create or replace function sisanshdata.getyeartradedate return varchar2
is
  Result varchar2(8);
  v_date varchar2(8);
  v_day  varchar2(2);
begin
  select to_char((sysdate-365),'yyyymmdd') into v_date from dual;
  select max(t.t_date) into Result from t_b_skrace_tradedate t where t.t_date<=v_date and t.is_trade=1;
  if Result is null
  then
  select min(t.t_date) into Result from t_b_skrace_tradedate t where t.is_trade=1;
  end if;

  return Result;
end getyeartradedate;
/
grant execute on SISANSHDATA.GETYEARTRADEDATE to SISANSHOPR;


prompt
prompt Creating procedure PROC_CANCEL_ORDER
prompt ====================================
prompt
create or replace procedure sisanshdata.proc_cancel_order
(
	result_rc out THINKIVE_ORA.ref_cursor,
 	status_rc out THINKIVE_ORA.ref_cursor,
	p_account_id 	t_sim_account.account_id%TYPE,       --入参:账户ID
	p_serial_num	t_sim_today_order.SERIAL_NUM%TYPE    --入参:待撤单委托编号
)
is
	vr_order t_sim_today_order%rowtype;   --待撤单委托记录
  v_cancel_no number;                   --撤单记录编号
  v_num  number;
begin
  open result_rc for
	   select '撤单操作' as operate from dual;


  if p_account_id ='' or p_account_id is null then
     open status_rc for
	   select '-10000' as rscode, '账户ID不能为空' as rsmsg from dual;
     return;
  end if;

  if p_serial_num ='' or p_serial_num is null then
     open status_rc for
	   select '-10000' as rscode, '委托序号不能为空' as rsmsg from dual;
     return;
  end if;

  --根据撤单买卖恢复相关表数据（sim_capital,sim_hold_stock）
  select * into vr_order  from t_sim_today_order where serial_num = p_serial_num;

  --已成交或已处理的委托不接受撤单申请
  if vr_order.trade_status ='2' or vr_order.deal_flag ='2' then
     open status_rc for
	   select '-10000' as rscode, '委托已经成交,不能撤单。' as rsmsg from dual;
     return;
  end if;

  select count(*) into v_num from t_sim_cancel_order c where c.order_no=vr_order.serial_num;
  --不可重复撤单
  if v_num != 0 then
     open status_rc for
	   select '-10000' as rscode, '不能重复提交撤单。' as rsmsg from dual;
     return;
  end if;
  --插入撤单记录
  select sim_cancel_order_seq.nextval into v_cancel_no from dual;
  insert into t_sim_cancel_order(cancel_no,order_no,account_id,create_date,cancel_status)values(v_cancel_no,p_serial_num,p_account_id,to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),'0');

  --修改委托记录的交易状态
  if nvl(vr_order.bargain_qty,0) > 0 then
    update t_sim_today_order set trade_status='7'
      where serial_num=p_serial_num;
      commit;
  else
    update t_sim_today_order set trade_status='3'
      where serial_num=p_serial_num;
      commit;
  end if;

  open status_rc for
    select '0' as rscode, '撤单申请已提交' as rsmsg from dual;
  EXCEPTION
    when others then
    rollback;
    open status_rc for
    select '-100004' as rscode, '撤单异常！' as rsmsg from dual;
end proc_cancel_order;
/
grant execute on SISANSHDATA.PROC_CANCEL_ORDER to SISANSHOPR;


prompt
prompt Creating procedure PROC_CANCEL_ORDER_OUTTIME
prompt ============================================
prompt
create or replace procedure sisanshdata.proc_cancel_order_outtime
(
	result_rc out THINKIVE_ORA.ref_cursor,
 	status_rc out THINKIVE_ORA.ref_cursor,
	p_account_id 	t_sim_account.account_id%TYPE,       --入参:账户ID
	p_serial_num	t_sim_today_order.SERIAL_NUM%TYPE    --入参:待撤单委托编号
)
is
	vr_order t_sim_today_order%rowtype;   --待撤单委托记录
  v_cancel_no number;                   --撤单记录编号
  v_num  number;
begin
  open result_rc for
	   select '撤单操作' as operate from dual;


  if p_account_id ='' or p_account_id is null then
     open status_rc for
	   select '-10000' as rscode, '账户ID不能为空' as rsmsg from dual;
     return;
  end if;

  if p_serial_num ='' or p_serial_num is null then
     open status_rc for
	   select '-10000' as rscode, '委托序号不能为空' as rsmsg from dual;
     return;
  end if;

  --根据撤单买卖恢复相关表数据（sim_capital,sim_hold_stock）
  select * into vr_order  from t_sim_today_order where serial_num = p_serial_num and account_id=p_account_id ;

  --已成交或已处理的委托不接受撤单申请
  if vr_order.trade_status ='2' or vr_order.deal_flag ='2' then
     open status_rc for
	   select '-10000' as rscode, '委托已经成交,不能撤单。' as rsmsg from dual;
     return;
  end if;

  select count(*) into v_num from t_sim_cancel_order c where c.order_no=vr_order.serial_num;
  --不可重复撤单
  if v_num != 0 then
     open status_rc for
	   select '-10000' as rscode, '不能重复提交撤单。' as rsmsg from dual;
     return;
  end if;

  if vr_order.trade_type = '0' then
     update t_sim_account set userable_balance= userable_balance+vr_order.total_balance-nvl(vr_order.bargain_balance,0) where account_id = vr_order.account_id;
  elsif vr_order.trade_type = '1' or vr_order.trade_type = '5' or vr_order.trade_type='8' or vr_order.trade_type = '11'  then
     update t_sim_hold_stock set usable_qty= usable_qty+vr_order.order_qty-nvl(vr_order.bargain_qty,0) where account_id = vr_order.account_id and market_id=vr_order.market_id and stock_code=vr_order.stock_code;
  elsif vr_order.trade_type = '4' or vr_order.trade_type = '10'  then
     update t_rzrq_account t set usable_balance=usable_balance+vr_order.total_balance-nvl(vr_order.bargain_balance,0) where account_id=vr_order.account_id ;
  end if;
  --插入撤单记录
  select sim_cancel_order_seq.nextval into v_cancel_no from dual;
  insert into t_sim_cancel_order(cancel_no,order_no,account_id,create_date,cancel_status)values(v_cancel_no,p_serial_num,p_account_id,to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),'1');

  --修改委托记录的交易状态
  if nvl(vr_order.bargain_qty,0)>0 or nvl(vr_order.bargain_balance,0)>0 then
     update t_sim_today_order set deal_flag='2',trade_status='8', cancel_qty=vr_order.order_qty-vr_order.bargain_qty where serial_num=vr_order.serial_num;
     commit;
  else
     update t_sim_today_order set deal_flag='2',trade_status='4', cancel_qty=vr_order.order_qty where serial_num=vr_order.serial_num;
     commit;
  end if;

  open status_rc for
    select '0' as rscode, '撤单成功' as rsmsg from dual;
  EXCEPTION
    when others then
    rollback;
    open status_rc for
    select '-100004' as rscode, '撤单异常！' as rsmsg from dual;
end proc_cancel_order_outtime;
/
grant execute on SISANSHDATA.PROC_CANCEL_ORDER_OUTTIME to SISANSHOPR;


prompt
prompt Creating procedure PROC_SETTLEMENT_LOG
prompt ======================================
prompt
create or replace procedure sisanshdata.proc_settlement_log
(
  p_procedure_name     t_sim_settlement_log.procedure_name%type, --入参：存储过程名称
  p_err_code           t_sim_settlement_log.err_code%type,        --入参：错误代码
  p_err_msg            t_sim_settlement_log.err_msg%type         --入参：错误信息
)
is
begin
  insert into t_sim_settlement_log(id,procedure_name,err_code,err_msg,create_date)
    values(sim_settlement_log_seq.nextval,p_procedure_name,p_err_code,p_err_msg,to_char(sysdate,'yyyymmdd hh24:mi:ss'));
  commit;
end proc_settlement_log;
/
grant execute on SISANSHDATA.PROC_SETTLEMENT_LOG to SISANSHOPR;


prompt
prompt Creating procedure PROC_DAILY_NODEAL_ORDER
prompt ==========================================
prompt
create or replace procedure sisanshdata.proc_daily_nodeal_order
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_trade_type VARCHAR(10);                            --委托类型
  v_order_total_balance number(16,2);                  --委托总金额
  v_order_total_qty   number;                          --委托数量
  cursor c_order is
  select t.* from t_sim_today_order t,t_sim_account b where t.account_id=b.account_id and t.deal_flag != 2 order by order_date,order_time; --今日未处理的委托
  tmp_order c_order%rowtype;
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    --处理未处理的委托
    open c_order;
    loop
      fetch c_order into tmp_order;
      exit when c_order%notfound;
      v_trade_type := tmp_order.trade_type;
      if v_trade_type='0' then
        v_order_total_balance := tmp_order.total_balance;
        update t_sim_account t set userable_balance=userable_balance+v_order_total_balance where account_id=tmp_order.account_id ;
        update t_sim_today_order set trade_status=5,deal_flag=2 where serial_num=tmp_order.serial_num;
      else
        v_order_total_qty := tmp_order.order_qty;
        update t_sim_hold_stock  set usable_qty=usable_qty+v_order_total_qty where account_id=tmp_order.account_id
         and market_id=tmp_order.market_id and stock_code=tmp_order.stock_code;
        update t_sim_today_order set trade_status=5,deal_flag=2 where serial_num=tmp_order.serial_num;
      end if;
      commit;
    end loop;
    close c_order;

    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_daily_nodeal_order',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_nodeal_order',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_nodeal_order',po_retcod,v_err_msg);
      return;
end proc_daily_nodeal_order;
/
grant execute on SISANSHDATA.PROC_DAILY_NODEAL_ORDER to SISANSHOPR;


prompt
prompt Creating procedure PROC_DAILY_PAYOFF
prompt ====================================
prompt
create or replace procedure sisanshdata.proc_daily_payoff
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_total_market NUMBER;                               --总市值
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;

 		-- 更新用户持仓表( t_sim_hold_stock)
		update t_sim_hold_stock set usable_qty = total_qty where account_id in (select account_id from t_sim_account);
    update t_sim_information set now_price = null where now_price =0;
    commit;

   -- 清算账户总资产及股票市值(正常账号且需要清算的账户)
    for cur in (select account_id from t_sim_account  where state=1 and need_settlement=1 and apply_state=1) loop
      select nvl(sum(nvl(b.now_price,b.close_price)*nvl(a.total_qty,0)),0) into v_total_market
      from t_sim_hold_stock a,t_sim_information b
      where a.stock_code = b.stock_code
        and a.market_id = b.market_id
        and a.account_id = cur.account_id;
      update t_sim_account t set t.total_market = v_total_market,t.total_assets = t.userable_balance+v_total_market,t.current_balance=t.userable_balance
      where account_id = cur.account_id;
   	end loop;
    commit;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_daily_payoff',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_payoff',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_payoff',po_retcod,v_err_msg);
      return;
end proc_daily_payoff;
/
grant execute on SISANSHDATA.PROC_DAILY_PAYOFF to SISANSHOPR;


prompt
prompt Creating procedure PROC_DAILY_SETTLEMENT
prompt ========================================
prompt
create or replace procedure sisanshdata.proc_daily_settlement
is
v_is_trade_date    varchar(10);      --是否是交易日
v_err_code         varchar2(10);     --错误代码
ve_exception       exception;        --自定义异常变量
v_err_msg          varchar2(1000);   --错误信息
begin

  --更新当日未处理的委托订单
  stock_settlement.proc_daily_nodeal_order(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;
  --大赛账号最后一天强制卖出持仓股票
  stock_settlement.proc_match_end_sell(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --清算账户资产及股票市值
  stock_settlement.proc_daily_payoff(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --历史数据迁移
  stock_settlement.proc_history_transfer(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;


EXCEPTION
    when ve_exception then
       return;
    WHEN no_data_found THEN
      DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
    when others then
      dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;

end proc_daily_settlement;
/
grant execute on SISANSHDATA.PROC_DAILY_SETTLEMENT to SISANSHOPR;


prompt
prompt Creating procedure PROC_DAILY_SETTLEMENT_PREPARE
prompt ================================================
prompt
create or replace procedure sisanshdata.proc_daily_settlement_prepare
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_lsw_trade_date     varchar2(30);   --上一个周五
  v_lsm_trade_date     varchar2(30);   --上月最后一天
  v_ls_trade_date      varchar2(30);   --上个交易日
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    delete from t_sim_settlement_account where create_date = to_char(sysdate,'yyyymmdd');    --防止重复清算，造成 v_ls_trade_date=sysdate；
    select max(t.t_date) into v_ls_trade_date from t_b_skrace_tradedate t where t.t_date<to_char(sysdate,'yyyymmdd') and t.is_trade=1;--查询上一个交易日
    v_lsw_trade_date := getlwtradedate();     --获取上周最后一个交易日
    v_lsm_trade_date := getlmtradedate();     --获取上月最后一个交易日
    delete from t_sim_settlement_account t where t.create_date not in(v_ls_trade_date,v_lsw_trade_date,v_lsm_trade_date);
    commit;
    /*插入没有历史数据的账号*/
    insert into t_sim_settlement_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
      select account_id,money_id,v_ls_trade_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
      from t_sim_account where account_id not in (select account_id from t_sim_settlement_account a where a.create_date=v_ls_trade_date) ;
      commit;
    insert into t_sim_settlement_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
      select account_id,money_id,v_lsw_trade_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
      from t_sim_account where account_id not in (select account_id from t_sim_settlement_account a where a.create_date=v_lsw_trade_date) ;
      commit;
    insert into t_sim_settlement_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
      select account_id,money_id,v_lsm_trade_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
      from t_sim_account where account_id not in (select account_id from t_sim_settlement_account a where a.create_date=v_lsm_trade_date) ;
      commit;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_daily_settlement_prepare',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN

      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_settlement_prepare',po_retcod,v_err_msg);
      return;
    when others then
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_settlement_prepare',po_retcod,v_err_msg);
      return;
end proc_daily_settlement_prepare;
/
grant execute on SISANSHDATA.PROC_DAILY_SETTLEMENT_PREPARE to SISANSHOPR;


prompt
prompt Creating procedure PROC_DIVIDEND_STOCK
prompt ======================================
prompt
create or replace procedure sisanshdata.proc_dividend_stock
is
  v_tradeday  varchar2(10);     --交易日
  v_rzrq_serial_num varchar2(10);
  tmp_num_bonus0 number;    --分红数据条数
  tmp_num_bonus1 number;    --配股数据条数
  cursor c_dividend_stock(p_date varchar2) is
     select * from t_sim_bonus where bonus_date = p_date order by type;  --查询指定日期的分红送股信息
  tmp_dividend_stock c_dividend_stock%rowtype;
  cursor c_hold_stock(p_market_id varchar2,p_stockcode varchar2) is  --查询普通交易个人持仓指定的股票信息，排除两融持仓
     select a.*,b.stock_name from t_sim_hold_stock a,t_sim_information b,t_sim_account c where a.account_id=c.account_id and a.market_id=b.market_id and a.stock_code=b.stock_code and a.market_id=p_market_id and a.stock_code= p_stockcode
                                                                                              and a.serial_num not in (select rz.serial_num from t_rzrq_hold_stock rz);
  tmp_hold_stock c_hold_stock%rowtype;

  cursor rzrq_hold_stock(p_market_id varchar2,p_stockcode varchar2) is --查询信用交易持仓股票信息
       select a.credit_usbale_qty,a.financing_usable_qty,a.credit_qty,a.financing_qty,b.*,c.stock_name from t_rzrq_hold_stock a,t_sim_hold_stock b,t_sim_information c, t_rzrq_account d where b.account_id=d.account_id and a.serial_num=b.serial_num and b.market_id=c.market_id and b.stock_code=c.stock_code and b.market_id=p_market_id and b.stock_code=p_stockcode;
  tmp_rzrq_hold_stock rzrq_hold_stock%rowtype;

  --融资融券合约查询
  cursor c_rzrq_debet(p_market_id varchar2,p_stockcode varchar2) is
     select a.contracts_no,a.contracts_type,a.market_id,a.stock_code,a.stock_name,a.contracts_qty,a.account_id from t_rzrq_credit_contracts a where a.market_id=p_market_id and a.stock_code=p_stockcode and a.contracts_state='0' and a.contracts_type='1';
  tmp_rzrq_debet c_rzrq_debet%rowType;
  v_cost_price     number;           --成本价
  v_err_code           varchar2(30);
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  --分红送股处理
  --除权除息日
  select to_char(sysdate,'yyyymmdd') into v_tradeday from dual;
  open c_dividend_stock(v_tradeday);     --遍历分红送股信息
  loop
    fetch c_dividend_stock into tmp_dividend_stock;
    exit when c_dividend_stock%notfound;
      begin
         open c_hold_stock(tmp_dividend_stock.market_id,tmp_dividend_stock.stock_code);  --根据送股信息查询持仓
         loop
           fetch c_hold_stock into tmp_hold_stock;  --遍历持仓
           exit when c_hold_stock%notfound;
           --查询是否存在分红送股记录
           select count(*) into tmp_num_bonus0 from t_sim_exec_agge t
           where t.account_id = tmp_hold_stock.account_id and t.stock_code = tmp_hold_stock.stock_code
                 and t.trade_type = '2' and t.market_id = tmp_hold_stock.market_id;
           select count(*) into tmp_num_bonus1 from t_sim_exec_agge t
           where t.account_id = tmp_hold_stock.account_id and t.stock_code = tmp_hold_stock.stock_code
                 and t.trade_type = '3' and t.market_id = tmp_hold_stock.market_id;
           --分红处理
           if tmp_dividend_stock.type = '0' and tmp_num_bonus0 <= 0 then  --（分红，做除息）
             v_cost_price := tmp_hold_stock.cost_price - tmp_dividend_stock.rate;  --成本价=综合买入成本-分红比例
             update t_sim_hold_stock set cost_price=v_cost_price where serial_num = tmp_hold_stock.serial_num;  --更新成本价
             insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,  --加入成交明细
                market_id,stock_code,stock_name,trade_type,exec_qty,exec_price,stap_tax,commissoin,
                fare,total_balance,remark,transfer_free,total_fare,hold_srlnum,bargain_balance)values(sim_exec_agge_seq.nextval,
                0,tmp_hold_stock.account_id,v_tradeday,'09:25:00',
                tmp_hold_stock.market_id,tmp_hold_stock.stock_code,tmp_hold_stock.stock_name,'2',0,0,0,0,
                0,tmp_hold_stock.total_qty*tmp_dividend_stock.rate,'红利',0,0,tmp_hold_stock.serial_num,tmp_hold_stock.total_qty*tmp_dividend_stock.rate);
                --更新个人账户 可用资金=可用资金+持仓可用数量*分红比例（每股分红多少）
             update t_sim_account set userable_balance = userable_balance+tmp_hold_stock.total_qty*tmp_dividend_stock.rate where account_id = tmp_hold_stock.account_id;
             commit;
           --送股处理
           elsif tmp_dividend_stock.type = '1' and tmp_num_bonus1 <= 0 then
             v_cost_price := tmp_hold_stock.cost_price / (1+tmp_dividend_stock.rate);  --成本价=综合买入成本/（1+送股率）
             --更新持仓  综合成本价，实际持仓，可用持仓
             update t_sim_hold_stock set cost_price=v_cost_price,total_qty=total_qty+tmp_hold_stock.total_qty*tmp_dividend_stock.rate,
                  usable_qty = usable_qty + tmp_hold_stock.total_qty*tmp_dividend_stock.rate where serial_num = tmp_hold_stock.serial_num;
             insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,  --加入成交明细
                market_id,stock_code,stock_name,trade_type,exec_qty,exec_price,stap_tax,commissoin,
                fare,total_balance,remark,transfer_free,total_fare,hold_srlnum,bargain_balance)values(sim_exec_agge_seq.nextval,
                0,tmp_hold_stock.account_id,v_tradeday,'09:25:00',
                tmp_hold_stock.market_id,tmp_hold_stock.stock_code,tmp_hold_stock.stock_name,'3',tmp_hold_stock.total_qty*tmp_dividend_stock.rate,0,0,0,
                0,0,'红股',0,0,tmp_hold_stock.serial_num,0);
                --加入历史持仓
             insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,create_date,hold_srlnum,total_qty,usable_qty,cost_price)
                 values(sim_hist_hold_stock_seq.nextval,tmp_hold_stock.account_id,tmp_hold_stock.market_id,tmp_hold_stock.stock_code,to_char(to_date(v_tradeday,'yyyymmdd'),'yyyy-mm-dd')||' 09:25:00',
                     tmp_hold_stock.serial_num,tmp_hold_stock.total_qty+tmp_hold_stock.total_qty*tmp_dividend_stock.rate,
                     tmp_hold_stock.usable_qty + tmp_hold_stock.total_qty*tmp_dividend_stock.rate,v_cost_price);
             commit;
           end if;
         end loop;
         close c_hold_stock;

         --信用交易分红送股
         open rzrq_hold_stock(tmp_dividend_stock.market_id,tmp_dividend_stock.stock_code);
         loop
              fetch rzrq_hold_stock into tmp_rzrq_hold_stock;
              exit when rzrq_hold_stock%notfound;
              --查询是否存在分红送股记录,以09:25:05配合确定
             select count(*) into tmp_num_bonus0 from t_sim_exec_agge t
             where t.account_id = tmp_rzrq_hold_stock.account_id and t.stock_code = tmp_rzrq_hold_stock.stock_code
                   and t.trade_type = '2' and t.market_id = tmp_rzrq_hold_stock.market_id and t.exec_time='09:25:05';
             select count(*) into tmp_num_bonus1 from t_sim_exec_agge t
             where t.account_id = tmp_rzrq_hold_stock.account_id and t.stock_code = tmp_rzrq_hold_stock.stock_code
                   and t.trade_type = '3' and t.market_id = tmp_rzrq_hold_stock.market_id and t.exec_time='09:25:05';

              --分红处理
              if tmp_dividend_stock.type = '0' and tmp_num_bonus0 <= 0 then  --（分红，做除息）
                 v_cost_price := tmp_rzrq_hold_stock.cost_price - tmp_dividend_stock.rate;  --成本价=综合买入成本-分红比例
                 update t_sim_hold_stock set cost_price=v_cost_price where serial_num = tmp_rzrq_hold_stock.serial_num;  --更新成本价
                 insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,  --加入成交明细
                 market_id,stock_code,stock_name,trade_type,exec_qty,exec_price,stap_tax,commissoin,
                 fare,total_balance,remark,transfer_free,total_fare,hold_srlnum,bargain_balance)values(sim_exec_agge_seq.nextval,
                 0,tmp_rzrq_hold_stock.account_id,v_tradeday,'09:25:05',
                 tmp_rzrq_hold_stock.market_id,tmp_rzrq_hold_stock.stock_code,tmp_rzrq_hold_stock.stock_name,'2',0,0,0,0,
                 0,tmp_rzrq_hold_stock.total_qty*tmp_dividend_stock.rate,'红利',0,0,tmp_rzrq_hold_stock.serial_num,tmp_rzrq_hold_stock.usable_qty*tmp_dividend_stock.rate);
                --更新个人账户 可用资金=可用资金+持仓可用数量*分红比例（每股分红多少）
             update t_rzrq_account set usable_balance = usable_balance+tmp_rzrq_hold_stock.total_qty*tmp_dividend_stock.rate where account_id = tmp_rzrq_hold_stock.account_id;
             commit;
             elsif tmp_dividend_stock.type = '1' and tmp_num_bonus1 <= 0 then  --送股
                 v_cost_price := tmp_rzrq_hold_stock.cost_price / (1+tmp_dividend_stock.rate);  --成本价=综合买入成本/（1+送股率）
                 --更新持仓  综合成本价，实际持仓，可用持仓
                 update t_sim_hold_stock set cost_price=v_cost_price,total_qty=total_qty+tmp_rzrq_hold_stock.total_qty*tmp_dividend_stock.rate,
                        usable_qty = usable_qty + tmp_rzrq_hold_stock.total_qty*tmp_dividend_stock.rate where serial_num = tmp_rzrq_hold_stock.serial_num;
                 update t_rzrq_hold_stock set credit_usbale_qty=credit_usbale_qty+tmp_rzrq_hold_stock.credit_qty*tmp_dividend_stock.rate,credit_qty=credit_qty+tmp_rzrq_hold_stock.credit_qty*tmp_dividend_stock.rate,
                        financing_usable_qty=financing_usable_qty+tmp_rzrq_hold_stock.financing_qty*tmp_dividend_stock.rate,financing_qty=financing_qty+tmp_rzrq_hold_stock.financing_qty*tmp_dividend_stock.rate
                        where serial_num = tmp_rzrq_hold_stock.serial_num;

                 insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,  --加入成交明细
                        market_id,stock_code,stock_name,trade_type,exec_qty,exec_price,stap_tax,commissoin,
                        fare,total_balance,remark,transfer_free,total_fare,hold_srlnum,bargain_balance)values(sim_exec_agge_seq.nextval,
                        0,tmp_rzrq_hold_stock.account_id,v_tradeday,'09:25:05',
                        tmp_rzrq_hold_stock.market_id,tmp_rzrq_hold_stock.stock_code,tmp_rzrq_hold_stock.stock_name,'3',tmp_rzrq_hold_stock.total_qty*tmp_dividend_stock.rate,0,0,0,
                        0,0,'红股',0,0,tmp_rzrq_hold_stock.serial_num,0);
                --加入历史持仓
                insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,create_date,hold_srlnum,total_qty,usable_qty,cost_price)
                     values(sim_hist_hold_stock_seq.nextval,tmp_rzrq_hold_stock.account_id,tmp_rzrq_hold_stock.market_id,tmp_rzrq_hold_stock.stock_code,to_char(to_date(v_tradeday,'yyyymmdd'),'yyyy-mm-dd')||' 09:25:00',
                     tmp_rzrq_hold_stock.serial_num,tmp_rzrq_hold_stock.total_qty+tmp_rzrq_hold_stock.total_qty*tmp_dividend_stock.rate,
                     tmp_rzrq_hold_stock.usable_qty + tmp_rzrq_hold_stock.total_qty*tmp_dividend_stock.rate,v_cost_price);
                commit;
             end if;
         end loop;
         close rzrq_hold_stock;

         --融资融券分红送股处理
         open c_rzrq_debet(tmp_dividend_stock.market_id,tmp_dividend_stock.stock_code);
         loop
            fetch c_rzrq_debet into tmp_rzrq_debet;
            exit when c_rzrq_debet%notfound;
              --查询是否存在分红送股记录,以09:25:10配合确定
             select count(*) into tmp_num_bonus0 from t_sim_exec_agge t
             where t.account_id = tmp_rzrq_hold_stock.account_id and t.stock_code = tmp_rzrq_hold_stock.stock_code
                   and t.trade_type = '2' and t.market_id = tmp_rzrq_hold_stock.market_id and t.exec_time='09:25:10';
             select count(*) into tmp_num_bonus1 from t_sim_exec_agge t
             where t.account_id = tmp_rzrq_hold_stock.account_id and t.stock_code = tmp_rzrq_hold_stock.stock_code
                   and t.trade_type = '3' and t.market_id = tmp_rzrq_hold_stock.market_id and t.exec_time='09:25:10';

            --分红
            if tmp_dividend_stock.type='0' and tmp_num_bonus0 <= 0 then
                     --更新账户可用资金
                   update t_rzrq_account set usable_balance=usable_balance-tmp_rzrq_debet.contracts_qty*tmp_dividend_stock.rate where account_id=tmp_rzrq_debet.account_id;
                   insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,trade_type,exec_qty,
                          exec_price,stap_tax,commissoin,fare,total_balance,remark,transfer_free,total_fare,hold_srlnum,bargain_balance)
                          values(sim_exec_agge_seq.nextval,0,tmp_rzrq_debet.account_id,v_tradeday,'09:25:10',
                          tmp_rzrq_debet.market_id,tmp_rzrq_debet.stock_code,tmp_rzrq_debet.stock_name,'2',0,0,0,0,
                          0,-tmp_rzrq_debet.contracts_qty*tmp_dividend_stock.rate,'红利',0,0,'',-tmp_rzrq_debet.contracts_qty*tmp_dividend_stock.rate);
            commit;
            elsif tmp_dividend_stock.type = '1' and tmp_num_bonus1 <= 0 then
                  update t_rzrq_credit_contracts a set a.contracts_qty=a.contracts_qty+a.contracts_qty*tmp_dividend_stock.rate where a.contracts_no=tmp_rzrq_debet.contracts_no;
                  insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,  --加入成交明细
                      market_id,stock_code,stock_name,trade_type,exec_qty,exec_price,stap_tax,commissoin,
                      fare,total_balance,remark,transfer_free,total_fare,hold_srlnum,bargain_balance)values(sim_exec_agge_seq.nextval,
                      0,tmp_rzrq_debet.account_id,v_tradeday,'09:25:10',
                      tmp_rzrq_debet.market_id,tmp_rzrq_debet.stock_code,tmp_rzrq_debet.stock_name,'3',tmp_rzrq_debet.contracts_qty*tmp_dividend_stock.rate,0,0,0,
                      0,0,'红股',0,0,'',0);
            commit;
            end if;
         end loop;
         close c_rzrq_debet;
      end;
  end loop;
  close c_dividend_stock;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    v_err_code := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_dividend_stock',v_err_code,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      v_err_code := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_dividend_stock',v_err_code,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      v_err_code := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_dividend_stock',v_err_code,v_err_msg);
      return;
end proc_dividend_stock;
/
grant execute on SISANSHDATA.PROC_DIVIDEND_STOCK to SISANSHOPR;


prompt
prompt Creating procedure PROC_EARNING_YIELD
prompt =====================================
prompt
create or replace procedure sisanshdata.proc_earning_yield
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
v_begin_date t_sim_hist_account.create_date%type;       --开始日期
v_last_date t_sim_hist_account.create_date%type;        --前一日期
v_last_fri_date varchar2(30);    --上周末日期
v_last_mon_date varchar2(30);    --上月末日期
v_day_earning number(16,2); --日收益
v_day_yield number(10,4);   --日收益率
v_week_earning number(16,2);--周收益
v_week_yield number(10,4);  --周收益率
v_month_earning number(16,2);--月收益
v_month_yield number(10,4);  --月收益率
v_total_earning number(16,2); --总收益
v_total_yield number(10,4);  --总收益率
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
cursor c_sim_account is select * from t_sim_account where state=1 and need_settlement=1 and apply_state=1 order by account_id;
tmp_account c_sim_account%rowtype;
v_hist_account t_sim_hist_account%rowtype;
v_tmp_count          number;
v_tmp_time           varchar2(20);
v_lsw_trade_date     varchar2(30);   --上一个周五
v_lsm_trade_date     varchar2(30);   --上月最后一天
v_ls_trade_date      varchar2(30);
v_test_start_date    varchar2(50);
v_test_end_date      varchar2(50);
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;

  select max(t.t_date) into v_ls_trade_date from t_b_skrace_tradedate t where t.t_date<to_char(sysdate,'yyyymmdd') and t.is_trade=1;--查询上一个交易日
  v_lsw_trade_date := getlwtradedate();     --获取上周最后一个交易日
  v_lsm_trade_date := getlmtradedate();     --获取上月最后一个交易日

  --日收益
  update t_sim_account t set(t.day_earnings,t.day_yield) = (select a.total_assets-b.total_assets earning,(a.total_assets-b.total_assets)/b.total_assets yeild from t_sim_account a, t_sim_settlement_account b where a.account_id=b.account_id
            and b.create_date=v_ls_trade_date and t.account_id=a.account_id) where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;

  --周收益
  update t_sim_account t set(t.week_earnings,t.week_yield) = (select a.total_assets-b.total_assets earning,(a.total_assets-b.total_assets)/b.total_assets yeild from t_sim_account a, t_sim_settlement_account b where a.account_id=b.account_id
            and b.create_date=v_lsw_trade_date and t.account_id=a.account_id) where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;

  --月收益
  update t_sim_account t set(t.month_earnings,t.month_yield) = (select a.total_assets-b.total_assets earning,(a.total_assets-b.total_assets)/b.total_assets yeild from t_sim_account a, t_sim_settlement_account b where a.account_id=b.account_id
            and b.create_date=v_lsm_trade_date and t.account_id=a.account_id) where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;

  --累计收益
  update t_sim_account t set t.total_earnings = t.total_assets-t.init_balance,t.total_yield=(t.total_assets-t.init_balance)/t.init_balance where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_earning_yield',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_earning_yield',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_earning_yield',po_retcod,v_err_msg);
      return;
end proc_earning_yield;
/
grant execute on SISANSHDATA.PROC_EARNING_YIELD to SISANSHOPR;


prompt
prompt Creating procedure PROC_ENTRUST_STOCK
prompt =====================================
prompt
CREATE OR REPLACE PROCEDURE SISANSHDATA."PROC_ENTRUST_STOCK"(result_rc      out THINKIVE_ORA.ref_cursor,
                                                 status_rc      out THINKIVE_ORA.ref_cursor,
                                                 p_account_id   T_SIM_TODAY_ORDER.account_id%TYPE, --入参:账户ID
                                                 p_stock_code   T_SIM_TODAY_ORDER.stock_code%TYPE, --入参:股票代码
                                                 p_stock_name   T_SIM_TODAY_ORDER.stock_name%TYPE, --入参:股票名称
                                                 p_market_id    T_SIM_TODAY_ORDER.market_id%TYPE, --入参:市场代码
                                                 p_trade_type   T_SIM_TODAY_ORDER.trade_type%TYPE, --入参:交易类型,buy:买入;sell:卖出
                                                 p_order_qty    T_SIM_TODAY_ORDER.order_qty%TYPE, --入参:委托交易数量(股)
                                                 p_order_price  T_SIM_TODAY_ORDER.order_price%TYPE, --入参:委托交易价格
                                                 p_match_no     T_SIM_TODAY_ORDER.MATCH_NO%TYPE, --入参：匹配编号(新增)
                                                 p_order_remark T_SIM_ACCOUNT_ORDER_COMMENT.comment_content%TYPE, --入参：委托理由
                                                 p_order_type      T_SIM_TODAY_ORDER.ordertype%TYPE     --入参：委托类型 marketprice市价委托，limitprice 限价委托
                                                 ) is
  v_order_balance    number(16, 2); --委托金额
  v_total_balance    number(16, 2); --交易金额（含交易费用）
  v_stap_tax_rate    number(16, 4); --印花税率
  v_stap_tax         number(16, 2); --印花税(卖出时收取)
  v_transfer_free    number(16, 4); --过户费率 只有上海股票才会收取过户费
  v_transfer         number(16, 2); --过户费
  v_commissoin_rate  number(16, 4); --佣金率
  v_commissoin       number(16, 2); --佣金率
  v_highbuy          number(16, 3); --当日涨停价
  v_lowsell          number(16, 3); --当日跌停价
  v_userable_num     number; --持有股票可用数量
  v_userable_capital number(16, 2); --可用资金
  v_sec_type         varchar(10); --股票类型
  v_temp             integer(4); --临时计数变量
  v_trade_date       varchar(8); --委托交易时间
  v_error_info       varchar(500); --错误信息
  v_serial_num       number;
begin
  open result_rc for
    select '委托下单' from dual;
  if p_account_id = '' or p_account_id is null then
    open status_rc for
      select '-10000' as rscode, '账户ID不能为空' as rsmsg from dual;
    return;
  end if;

  if p_trade_type = '' or p_trade_type is null then
    open status_rc for
      select '-10000' as rscode, '证券委托类型不能为空' as rsmsg from dual;
    return;
  end if;

  if p_order_type !='marketprice' and (p_order_price = '' or p_order_price is null) then
    open status_rc for
      select '-10000' as rscode, '委托价格不能为空' as rsmsg from dual;
    return;
  end if;

  if p_order_type !='marketprice' and p_order_price = 0 then
    open status_rc for
      select '-10000' as rscode, '委托价格不能为零' as rsmsg from dual;
    return;
  end if;

  if p_order_price = 0 then
    open status_rc for
      select '-10000' as rscode, '委托价格不能为零' as rsmsg from dual;
    return;
  end if;

  if p_stock_code = '' or p_stock_code is null then
    open status_rc for
      select '-10000' as rscode, '股票代码不能为空' as rsmsg from dual;
    return;
  end if;

  if p_market_id = '' or p_market_id is null then
    open status_rc for
      select '-10000' as rscode, '市场代码不能为空' as rsmsg from dual;
    return;
  end if;

  --禁止新股委托买卖
  /*if substr(p_stock_name,0,1) = 'n' or substr(p_stock_name,0,1) = 'N' then
      open status_rc for
       select '-10000' as rscode, '暂不支持新股买卖' as rsmsg from dual;
     return;
  end if;
  */
  begin
    --获取当前委托股票的涨停价、跌停价、股票类型
    select highbuy_price, lowsell_price, sec_type
      into v_highbuy, v_lowsell, v_sec_type
      from t_sim_information
     where stock_code = p_stock_code
       and market_id = p_market_id;
  Exception
    when NO_DATA_FOUND then
      open status_rc for
        select '-10001' as rscode,
               '未找到(' || p_stock_code || ')当天证券信息' as rsmsg
          from dual;
      return;
  end;

  if p_order_price < v_lowsell then
    if lower(p_trade_type) = '0' then
      open status_rc for
        select '-10002' as rscode, '委托买入价格不能小于跌停价格' as rsmsg
          from dual;
      return;
    else
      open status_rc for
        select '-10002' as rscode, '委托卖出价格不能小于跌停价格' as rsmsg
          from dual;
      return;
    end if;
  
  end if;

  if p_order_price > v_highbuy then
    if lower(p_trade_type) = '0' then
      open status_rc for
        select '-10002' as rscode, '委托买入价格不能大于涨停价格' as rsmsg
          from dual;
      return;
    else
      open status_rc for
        select '-10002' as rscode, '委托卖出价格不能大于涨停价格' as rsmsg
          from dual;
      return;
    end if;
  end if;

  --获取委托日期
  v_trade_date := to_char(sysdate, 'yyyymmdd'); --modify by qinjk 20160612 直接取当天日期
  -- modify by xulin 20101016 去除清算前后日期判断 end

  v_transfer := 0; --过户费默认为0
  -- 获取买卖过户费
  if lower(p_market_id) = 'sh' then
    select count(fare_rate)
      into v_temp
      from t_sim_fare
     where sec_type = v_sec_type
       and fare_type = 'transfer_free';
  
    if v_temp = 0 then
      select cur_value
        into v_transfer_free
        from t_sim_sys_config
       where name = 'default_transfer_free';
    else
      select fare_rate
        into v_transfer_free
        from t_sim_fare
       where sec_type = v_sec_type
         and fare_type = 'transfer_free';
    end if;
  
    v_transfer := p_order_qty * v_transfer_free;
    --过户费最低1元
    /*
    if v_transfer<1 then
       v_transfer :=1;
    end if;
    */
  end if;

  -- 委托买
  if lower(p_trade_type) = '0' then
    BEGIN
      --佣金费率获取
      select count(fare_rate)
        into v_temp
        from t_sim_fare
       where sec_type = v_sec_type
         and fare_type = 'commission';
    
      if v_temp = 0 then
        select cur_value
          into v_commissoin_rate
          from t_sim_sys_config
         where name = 'default_commission';
      else
        select fare_rate
          into v_commissoin_rate
          from t_sim_fare
         where sec_type = v_sec_type
           and fare_type = 'commission';
      end if;
      --手续费最低5元
      v_commissoin := p_order_price * p_order_qty * v_commissoin_rate;
      /*
      if v_commissoin<5 then
         v_commissoin:=5;
      end if;
      */
      --费率获取结束
    
      --委托买入金额
      v_order_balance := p_order_qty * p_order_price;
      v_total_balance := p_order_qty * p_order_price + v_commissoin +
                         v_transfer;
      select userable_balance
        into v_userable_capital
        from t_sim_account
       where account_id = p_account_id for update ;
    
      --委托买入金额大于可用金额
      if v_total_balance > v_userable_capital then
        open status_rc for
          select '-10002' as rscode, '可用资金不足' as rsmsg from dual;
          commit;
        return;
      end if;
    
      --记录委托交易并修改账户的可用资金
      select sim_today_order_seq.nextval into v_serial_num from dual;
      insert into T_SIM_TODAY_ORDER
        (serial_num,
         account_id,
         order_date,
         order_time,
         market_id,
         stock_code,
         stock_name,
         trade_type,
         trade_status,
         order_qty,
         order_price,
         order_balance,
         stap_tax,
         fare,
         deal_flag,
         Transfer_Free,
         Total_Balance,
         Total_Fare,
         Commissoin,
         Match_No,
         Ordertype)
      values
        (v_serial_num,
         p_account_id,
         v_trade_date,
         to_char(sysdate, 'hh24:mi:ss'),
         p_market_id,
         p_stock_code,
         p_stock_name,
         p_trade_type,
         '0',
         p_order_qty,
         p_order_price,
         v_order_balance,
         0,
         0,
         '0',
         v_transfer,
         v_total_balance,
         v_transfer + v_commissoin,
         v_commissoin,
         p_match_no,
         p_order_type);
      if p_order_remark is not null then
        insert into T_SIM_ACCOUNT_ORDER_COMMENT
          (serial_num,
           ACCOUNT_ID,
           COMMENT_CONTENT,
           COMMENT_DATE,
           COMMENT_TIME)
        values
          (v_serial_num,
           p_account_id,
           p_order_remark,
           v_trade_date,
           to_char(sysdate, 'hh24:mi:ss'));
      end if;
      update t_sim_account
         set userable_balance =
             (userable_balance - v_total_balance)
       where account_id = p_account_id;
      commit;
      open result_rc for
        select *
          from t_sim_today_order t
         where t.serial_num = v_serial_num;
      open status_rc for
        select '0' as rscode, '委托买入下单成功' as rsmsg from dual;
      return;
    END;
  
    -- 委托卖
  elsif lower(p_trade_type) = '1' then
    BEGIN
      select count(fare_rate)
        into v_temp
        from t_sim_fare
       where sec_type = v_sec_type
         and fare_type = 'staptax';
    
      if v_temp = 0 then
        select cur_value
          into v_stap_tax_rate
          from t_sim_sys_config
         where name = 'default_staptax';
      else
        select fare_rate
          into v_stap_tax_rate
          from t_sim_fare
         where sec_type = v_sec_type
           and fare_type = 'staptax';
      end if;
      --印花税
      v_stap_tax := p_order_price * p_order_qty * v_stap_tax_rate;
    
      select count(fare_rate)
        into v_temp
        from t_sim_fare
       where sec_type = v_sec_type
         and fare_type = 'commission';
    
      if v_temp = 0 then
        select cur_value
          into v_commissoin_rate
          from t_sim_sys_config
         where name = 'default_commission';
      else
        select fare_rate
          into v_commissoin_rate
          from t_sim_fare
         where sec_type = v_sec_type
           and fare_type = 'commission';
      end if;
    
      --手续费最低5元
      v_commissoin := p_order_price * p_order_qty * v_commissoin_rate;
      /*
      if v_commissoin<5 then
         v_commissoin:=5;
      end if;
      */
    
      select usable_qty
        into v_userable_num
        from t_sim_hold_stock
       where stock_code = p_stock_code
         and account_id = p_account_id
         and market_id = p_market_id for update ;
    
      --委托卖出数量大于持股数量
      if p_order_qty > v_userable_num then
        open status_rc for
          select '-10002' as rscode,
                 '委托卖出数量不能大于实际持股数量' as rsmsg
            from dual;
            commit ;
        return;
      end if;
    
      -- 委托卖出金额
      v_order_balance := p_order_qty * p_order_price;
      v_total_balance := p_order_qty * p_order_price - v_transfer -
                         v_stap_tax - v_commissoin;
      --记录委托交易并修改账户持有对应股票的可用数量
      select sim_today_order_seq.nextval into v_serial_num from dual;
      insert into T_SIM_TODAY_ORDER
        (serial_num,
         account_id,
         order_date,
         order_time,
         market_id,
         stock_code,
         stock_name,
         trade_type,
         trade_status,
         order_qty,
         order_price,
         order_balance,
         stap_tax,
         fare,
         deal_flag,
         Transfer_Free,
         Total_Balance,
         Total_Fare,
         Commissoin,
         Match_No,
         Ordertype)
      values
        (v_serial_num,
         p_account_id,
         v_trade_date,
         to_char(sysdate, 'hh24:mi:ss'),
         p_market_id,
         p_stock_code,
         p_stock_name,
         p_trade_type,
         '0',
         p_order_qty,
         p_order_price,
         v_order_balance,
         v_stap_tax,
         0,
         '0',
         v_transfer,
         v_total_balance,
         v_stap_tax + v_commissoin + v_transfer,
         v_commissoin,
         p_match_no,
         p_order_type);
      if p_order_remark is not null then
        insert into T_SIM_ACCOUNT_ORDER_COMMENT
          (serial_num,
           ACCOUNT_ID,
           COMMENT_CONTENT,
           COMMENT_DATE,
           COMMENT_TIME)
        values
          (v_serial_num,
           p_account_id,
           p_order_remark,
           v_trade_date,
           to_char(sysdate, 'hh24:mi:ss'));
      end if;
      update t_sim_hold_stock
         set usable_qty =
             (usable_qty - p_order_qty)
       where stock_code = p_stock_code
         and account_id = p_account_id
         and market_id = p_market_id;
      commit;
      open result_rc for
        select *
          from t_sim_today_order t
         where t.serial_num = v_serial_num;
      open status_rc for
        select '0' as rscode, '委托卖出下单成功' as rsmsg from dual;
    END;
  else
    BEGIN
      open status_rc for
        select '-10002' as rscode, '交易类型不明确' as rsmsg from dual;
      return;
    END;
  end if;

exception
  when others then
    rollback;
    v_error_info := 'proc_entrust_stock' ||
                    substr(sqlerrm(sqlcode), 1, 255);
    open status_rc for
      select '-10003' as rscode, v_error_info as rsmsg from dual;
end proc_entrust_stock;
/
grant execute on SISANSHDATA.PROC_ENTRUST_STOCK to SISANSHOPR;


prompt
prompt Creating procedure PROC_HISTORY_TRANSFER
prompt ========================================
prompt
create or replace procedure sisanshdata.proc_history_transfer
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
begin
     select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    -- 历史成交数据迁移
	  insert into t_sim_hist_exec_agge
	  select a.* from t_sim_exec_agge a,t_sim_account b where a.account_id=b.account_id;

    --历史委托数据迁移(处理状态均为已处理)
    insert into t_sim_hist_order
	  (
	       serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,
	       trade_type,trade_status,order_qty,order_price,cancel_qty,stap_tax,fare,order_balance,transfer_free,
	       remark,commissoin,total_fare,deal_flag,total_balance,bargain_qty,bargain_balance
	  )
	  select serial_num,a.account_id,order_date,order_time,market_id,stock_code,stock_name,
	       trade_type,trade_status,order_qty,order_price,cancel_qty,stap_tax,fare,order_balance,transfer_free,
	       a.remark,commissoin,total_fare,deal_flag,total_balance,bargain_qty,bargain_balance from t_sim_today_order a,t_sim_account b where a.account_id=b.account_id and deal_flag=2 ;

	  delete from  t_sim_today_order where deal_flag=2 and account_id in (select account_id from t_sim_account);
	  delete from t_sim_exec_agge where account_id in (select account_id from t_sim_account);
    commit;

    --账户历史资产数据迁移
    delete from t_sim_hist_account where create_date = to_char(sysdate,'yyyymmdd');
    insert into t_sim_hist_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
    select account_id,money_id,to_char(sysdate,'yyyymmdd'),total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
    from t_sim_account where need_settlement=1 and state=1;
    commit;

    delete from t_sim_settlement_account where create_date = to_char(sysdate,'yyyymmdd');
    insert into t_sim_settlement_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
    select account_id,money_id,to_char(sysdate,'yyyymmdd'),total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
    from t_sim_account where need_settlement=1 and state=1;
    commit;

    delete from t_sim_hist_information where trade_date = to_char(sysdate,'yyyymmdd');
    insert into t_sim_hist_information(stock_serino,trade_date,market_id,stock_code,stock_name,sec_type,buy_unit,close_price,open_price,highbuy_price,lowsell_price,now_price,remark)
    select stock_serino,trade_date,market_id,stock_code,stock_name,sec_type,buy_unit,close_price,open_price,highbuy_price,lowsell_price,now_price,remark from t_sim_information;
    commit;

    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_history_transfer',po_retcod,v_err_msg);
    return;

EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_history_transfer',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_history_transfer',po_retcod,v_err_msg);
      return;
end proc_history_transfer;
/
grant execute on SISANSHDATA.PROC_HISTORY_TRANSFER to SISANSHOPR;


prompt
prompt Creating procedure PROC_IN_STOCKPOOL
prompt ====================================
prompt
create or replace procedure sisanshdata.proc_in_stockpool
(
   result_rc out THINKIVE_ORA.ref_cursor,
 	 status_rc out THINKIVE_ORA.ref_cursor,
   p_stockcode   t_sim_stockpool.stockcode%type,
   p_marketid    t_sim_stockpool.market_id%type,
   p_stockname   t_sim_stockpool.stockname%type,
   p_in_price    t_sim_stockpool.in_pool_price%type,
   p_in_reason   t_sim_stockpool.in_reason%type,
   p_in_exponent t_sim_stockpool.in_exponent%type,
   p_pool_no     t_sim_stockpool_info.pool_no%type,
   p_hold_percent t_sim_stockpool.hold_percent%type,
   p_aim_price    t_sim_stockpool.aim_price%type
)
is
   v_useable_percent    number(10,2);
   v_in_num             number;
begin
    open result_rc for select '股票池股票移入操作' as operate from dual;

    if p_pool_no = '' or p_pool_no is null then
       open status_rc for select '-10001' as rscode,'未知的股票池' as rsmsg from dual;
       return;
    end if;
    if p_stockcode = '' or p_stockcode is null  then
       open status_rc for select '-10001' as rscode,'股票代码不能为空' as rsmsg from dual;
       return;
    end if;
    if p_marketid = '' or p_marketid is null  then
       open status_rc for select '-10001' as rscode,'股票市场代码不能为空' as rsmsg from dual;
       return;
    end if;
    if p_stockname = '' or p_stockname is null  then
       open status_rc for select '-10001' as rscode,'股票名称不能为空' as rsmsg from dual;
       return;
    end if;
    if p_in_price = '' or p_in_price is null or p_in_price <= 0 then
       open status_rc for select '-10001' as rscode,'股票移入价格不能为空或为零' as rsmsg from dual;
       return;
    end if;
    if p_in_exponent = '' or p_in_exponent is null or p_in_exponent <= 0 then
       open status_rc for select '-10002' as rscode,'上证指数不能为空或为零' as rsmsg from dual;
       return;
    end if;
    if p_in_reason = '' or p_in_reason is null  then
       open status_rc for select '-10000' as rscode,'股票移入原因不能为空' as rsmsg from dual;
       return;
    end if;
    if p_hold_percent = '' or p_hold_percent is null  then
       open status_rc for select '-10000' as rscode,'股票仓位不能为空' as rsmsg from dual;
       return;
    end if;

    select useable_percent into v_useable_percent from t_sim_stockpool_info where pool_no = p_pool_no;

    if p_hold_percent > v_useable_percent then
       open status_rc for select '-10000' as rscode,'股票仓位大于可用仓位' as rsmsg from dual;
       return;
    end if;

    --加入股票池
    select sim_stockpoll_seq.nextval into v_in_num from dual;
    insert into t_sim_stockpool(stockcode,market_id,stockname,in_pool_price,in_pool_time,aim_price,hold_percent,
       in_exponent,in_num,in_reason,pool_no) values (p_stockcode,p_marketid,p_stockname,p_in_price,
       to_char(sysdate,'yyyy-mm-dd 24hh:mi:ss'),p_aim_price,p_hold_percent,p_in_exponent,v_in_num,p_in_reason,p_pool_no);
    --更新可用仓位
    update t_sim_stockpool_info set useable_percent = useable_percent - p_hold_percent where pool_no = p_pool_no;

    commit;
    open status_rc for select '0' as rscode, '股票移入成功' as rsmsg from dual;
    return;
EXCEPTION
    when others then
    rollback;
    open status_rc for
    select '-100004' as rscode, '股票移入出现异常！' as rsmsg from dual;
    proc_settlement_log('proc_in_stockpool',sqlcode,'其他异常!' || substr(sqlerrm,1,500));
    return;
end proc_in_stockpool;
/
grant execute on SISANSHDATA.PROC_IN_STOCKPOOL to SISANSHOPR;


prompt
prompt Creating procedure PROC_MATCH_END_SELL
prompt ======================================
prompt
create or replace procedure sisanshdata.proc_match_end_sell
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_order_num          number;    --委托编号
  v_exec_agge_num      number;    --成交编号
  v_hist_hold_num      number;    --历史持仓编号
  v_order_balance      number(16,2);   --委托金额
  v_total_balance      number(16,2);   --交易金额（含交易费用）
  v_stap_tax_rate      number(16,4);   --印花税率
  v_stap_tax           number(16,2);   --印花税(卖出时收取)
  v_transfer_free      number(16,4);    --过户费率 只有上海股票才会收取过户费
  v_transfer           number(16,2);    --过户费
  v_commissoin_rate    number(16,4);   --佣金率
  v_commissoin         number(16,2);   --佣金率
  v_temp               integer(4);     --临时计数变量
  v_num                integer(4);     --新增临时计数
  v_sec_type           varchar(10);    --股票类型
  v_highbuy            number(16,3);   --当日涨停价
  v_lowsell            number(16,3);   --当日跌停价
  v_nowprice           number(16,3);   --现价
  v_closeprice         number(16,3);   --收盘价
  v_orderprice         number(16,3);   --委托价
  v_stockname          varchar2(30);   --股票名称
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time                  varchar2(20);             --存储过程执行结束时间
  cursor c_now_match is
   select act_id, end_date from t_sim_activity where match_state=1;
  tmp_now_match c_now_match%rowtype;
  cursor c_match_account(p_act_id varchar2) is
   select b.* from t_sim_account a, t_sim_hold_stock b where a.act_id=p_act_id and a.state=1 and a.account_id=b.account_id;
  tmp_match_account c_match_account%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
    	select count(*) into v_num  from t_b_skrace_tradedate t where t.t_date=tmp_now_match.end_date and t.is_trade=1;
    	--如果比赛结束日不是交易日
      if v_num=0 then
    	select max(t.t_date) into tmp_now_match.end_date  from t_b_skrace_tradedate t where t.t_date<=tmp_now_match.end_date and t.is_trade=1;
    	end if;
      --如果是比赛的最后一天，强制卖出持仓的股票，并按收盘价成交
      if tmp_now_match.end_date=to_char(sysdate,'yyyymmdd') then
         --内循环
         open c_match_account(tmp_now_match.act_id);
         loop
           fetch c_match_account into tmp_match_account;
           exit when c_match_account%notfound;

           --获取当前委托股票的涨停价、跌停价、股票类型
           select Highbuy_price,Lowsell_price,sec_type,now_price,close_price,stock_name into  v_highbuy,v_lowsell,v_sec_type,v_nowprice,v_closeprice,v_stockname
                  from t_sim_information where stock_code = tmp_match_account.stock_code and market_id = tmp_match_account.market_id ;
            if v_nowprice != 0 then
               v_orderprice :=v_nowprice;
            else
               v_orderprice :=v_closeprice;
            end if;

            v_transfer :=0;--过户费默认为0
             -- 获取买卖过户费
            if lower(tmp_match_account.market_id)='sh' then
                   select count(fare_rate) into v_temp
                   from t_sim_fare
                   where sec_type = v_sec_type
                   and fare_type='transfer_free';

                   if v_temp=0 then
                     select cur_value into v_transfer_free  from t_sim_sys_config where name='default_transfer_free';
                     else
                     select  fare_rate  into v_transfer_free
                     from t_sim_fare
                     where sec_type = v_sec_type
                     and fare_type='transfer_free';
                   end if;

                   v_transfer :=tmp_match_account.usable_qty*v_transfer_free;
                   --过户费最低1元
                   if v_transfer<1 then
                      v_transfer :=1;
                   end if;
            end if;
            select count(fare_rate) into v_temp from t_sim_fare where  sec_type = v_sec_type and fare_type='staptax';

            if v_temp = 0 then
               select cur_value into v_stap_tax_rate from t_sim_sys_config where name='default_staptax'  ;
            else
               select  fare_rate  into v_stap_tax_rate from t_sim_fare where sec_type = v_sec_type and fare_type='staptax';
            end if;

            v_stap_tax := v_orderprice * tmp_match_account.usable_qty * v_stap_tax_rate;

            select count(fare_rate) into v_temp
            from t_sim_fare where sec_type = v_sec_type and fare_type='commission';

            if v_temp = 0 then
               select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission' ;
            else
               select  fare_rate  into v_commissoin_rate from t_sim_fare where sec_type = v_sec_type and fare_type='commission';
            end if;
            v_commissoin:=v_orderprice * tmp_match_account.usable_qty * v_commissoin_rate;
            if v_commissoin<5 then
               v_commissoin:=5;
            end if;

           -- 委托卖出金额
           v_order_balance := tmp_match_account.usable_qty * v_orderprice;
           v_total_balance := tmp_match_account.usable_qty*v_orderprice-v_transfer-v_stap_tax-v_commissoin;
           select sim_today_order_seq.nextval into v_order_num from dual;
           insert into T_SIM_TODAY_ORDER(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
                   values(v_order_num,tmp_match_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_account.market_id,tmp_match_account.stock_code,v_stockname,'sell','2',tmp_match_account.usable_qty,v_orderprice,v_order_balance,v_stap_tax,0,'2',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
           select sim_exec_agge_seq.nextval into v_exec_agge_num from dual;
           insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,
                   trade_type,exec_qty,exec_price,stap_tax,commissoin,fare,total_balance,transfer_free,total_fare,hold_srlnum,bargain_balance)
                   values(v_exec_agge_num,v_order_num,tmp_match_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_account.market_id,
                   tmp_match_account.stock_code,v_stockname,'sell',tmp_match_account.usable_qty,v_orderprice,v_stap_tax,v_commissoin,0,v_total_balance,v_transfer,v_stap_tax+v_commissoin+v_transfer,tmp_match_account.serial_num,v_order_balance);
           delete from t_sim_hold_stock  where serial_num=tmp_match_account.serial_num;
           select sim_hist_hold_stock_seq.nextval into v_hist_hold_num from dual;
           insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,
                  create_date,hold_srlnum,total_qty,usable_qty,cost_price)
                  values(v_hist_hold_num,tmp_match_account.account_id,tmp_match_account.market_id,tmp_match_account.stock_code,
                  to_char(sysdate,'yyyymmdd hh24:mi:ss'),tmp_match_account.serial_num,0,0,0);
           update t_sim_account set userable_balance= userable_balance+v_total_balance where account_id= tmp_match_account.account_id;
           commit;
         end loop;
         close c_match_account;
      end if;
    end;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_match_end_sell',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_sell',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_sell',po_retcod,v_err_msg);
      return;
end proc_match_end_sell;
/
grant execute on SISANSHDATA.PROC_MATCH_END_SELL to SISANSHOPR;


prompt
prompt Creating procedure PROC_MATCH_END_UPDATEACCOUNT
prompt ===============================================
prompt
create or replace procedure sisanshdata.proc_match_end_updateaccount
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time                  varchar2(20);             --存储过程执行结束时间
  cursor c_now_match is
   select act_id, end_date from t_sim_activity where match_state=1 and activity_trade_type=0;
  tmp_now_match c_now_match%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
      --如果是比赛的最后一天，更新大赛账户清算标志，以后不进行清算
      if tmp_now_match.end_date<=to_char(sysdate,'yyyymmdd') then
         update t_sim_account  set need_settlement=0 where act_id=tmp_now_match.act_id;
         commit;
      end if;
    end;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_match_end_updateaccount',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_updateaccount',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_updateaccount',po_retcod,v_err_msg);
      return;
end proc_match_end_updateaccount;
/
grant execute on SISANSHDATA.PROC_MATCH_END_UPDATEACCOUNT to SISANSHOPR;


prompt
prompt Creating procedure PROC_ONTIME_STATS
prompt ====================================
prompt
create or replace procedure sisanshdata.proc_ontime_stats
is
v_err_code         varchar2(10);     --错误代码
ve_exception       exception;        --自定义异常变量
begin

  --清算账户资产及股票市值
  stock_settlement.proc_earnings_payoff(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

EXCEPTION
    when ve_exception then
       return;
    WHEN no_data_found THEN
      DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
    when others then
      dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;

end proc_ontime_stats;
/
grant execute on SISANSHDATA.PROC_ONTIME_STATS to SISANSHOPR;


prompt
prompt Creating procedure PROC_OUT_STOCKPOOL
prompt =====================================
prompt
create or replace procedure sisanshdata.proc_out_stockpool
(
   result_rc out THINKIVE_ORA.ref_cursor,
 	 status_rc out THINKIVE_ORA.ref_cursor,
   p_in_num      t_sim_stockpool.in_num%type,
   p_out_price   t_sim_hist_stockpool.out_pool_price%type,
   p_out_exponent t_sim_hist_stockpool.out_exponent%type,
   p_out_reason   t_sim_hist_stockpool.out_reason%type
)
is
  v_in_stockinfo      t_sim_stockpool%rowtype;
  v_out_num           number;
  v_earn_rate         number(10,2);
  v_exponent_rate     number(10,2);
  v_hist_earn_rate    number(10,2);
begin
  open result_rc for select '股票池股票移出操作' as operate from dual;

  if p_in_num = '' or p_in_num is null then
    open status_rc for select '-10000' as rscode,'股票池中无此记录，无法进行移出操作' as rsmsg from dual;
    return;
  end if;
  if p_out_price = '' or p_out_price is null or p_out_price <= 0 then
    open status_rc for select '-10001' as rscode,'股票移出价格不能为空或为零' as rsmsg from dual;
    return;
  end if;
  if p_out_exponent = '' or p_out_exponent is null or p_out_exponent <= 0 then
    open status_rc for select '-10002' as rscode,'上证指数不能为空或为零' as rsmsg from dual;
    return;
  end if;
  if p_out_reason = '' or p_out_reason is null  then
    open status_rc for select '-10000' as rscode,'股票移出原因不能为空' as rsmsg from dual;
    return;
  end if;

  select * into v_in_stockinfo from t_sim_stockpool where in_num = p_in_num;

  --收益率
  v_earn_rate := ((p_out_price - v_in_stockinfo.in_pool_price)/v_in_stockinfo.in_pool_price) * 100;
  --同期上证涨跌幅
  v_exponent_rate := ((p_out_exponent - v_in_stockinfo.in_exponent)/v_in_stockinfo.in_exponent) *100;

  v_hist_earn_rate := (v_in_stockinfo.hold_percent/100) * v_earn_rate;
  select sim_hist_stockpoll_seq.nextval into v_out_num from dual;
  --插入历史股票池
  insert into t_sim_hist_stockpool(pool_no,out_num,in_num,out_pool_price,out_pool_time,out_reason,earn_rate,out_exponent,exponent_rate,
     stockcode,market_id,stockname,in_pool_price,in_pool_time,aim_price,hold_percent,in_exponent,in_reason)values(v_in_stockinfo.pool_no,v_out_num,v_in_stockinfo.in_num,
     p_out_price,to_char(sysdate,'yyyy-mm-dd hh24:mi:ss'),p_out_reason,v_earn_rate,p_out_exponent,v_exponent_rate,v_in_stockinfo.stockcode,v_in_stockinfo.market_id,v_in_stockinfo.stockname,
     v_in_stockinfo.in_pool_price,v_in_stockinfo.in_pool_time,v_in_stockinfo.aim_price,v_in_stockinfo.hold_percent,v_in_stockinfo.in_exponent,v_in_stockinfo.in_reason);
  --更新股票池历史收益及可用仓位
  update t_sim_stockpool_info set hist_earn_rate = hist_earn_rate+v_hist_earn_rate,useable_percent = useable_percent + v_in_stockinfo.hold_percent where pool_no = v_in_stockinfo.pool_no;
  --将此股票移出股票池
  delete from t_sim_stockpool where in_num = v_in_stockinfo.in_num;
  commit;
  open status_rc for select '0' as rscode, '股票移出成功' as rsmsg from dual;
  return;
EXCEPTION
    when others then
    rollback;
    open status_rc for
    select '-100004' as rscode, '股票移出出现异常！' as rsmsg from dual;
    proc_settlement_log('proc_out_stockpool',sqlcode,'其他异常!' || substr(sqlerrm,1,500));
    return;
end proc_out_stockpool;
/
grant execute on SISANSHDATA.PROC_OUT_STOCKPOOL to SISANSHOPR;


prompt
prompt Creating procedure PROC_QRY_CAPITAL
prompt ===================================
prompt
create or replace procedure sisanshdata.proc_qry_capital
(
	result_rc out      THINKIVE_ORA.ref_cursor,
 	status_rc out      THINKIVE_ORA.ref_cursor,
	p_account_id 	     t_sim_account.account_id%TYPE,        --入参:账户ID
	p_user_id 		     t_sim_account.user_id%TYPE,           --入参:用户ID
	p_money_id         t_sim_account.money_id%TYPE := 'CNY'  --入参:币种
)
is

begin
  if p_user_id ='' or p_user_id is null then
     open status_rc for
	    select '-10000' as rscode, '用户ID不能为空' as rsmsg from dual;
     return;
  end if;

  if p_account_id ='' or p_account_id is null then
     open status_rc for
	    select '-10000' as rscode, '账户ID不能为空' as rsmsg from dual;
     return;
  end if;


  open result_rc for
     select * from t_sim_account where user_id = p_user_id and account_id= p_account_id and money_id = p_money_id;
	open status_rc for
	 select '0' as rscode, '账户资产查询成功' as rsmsg from dual;

  EXCEPTION
    when no_data_found then
      open status_rc for
      select '-100004' as rscode, '无此账户匹配的资产！' as rsmsg from dual;
end proc_qry_capital;
/
grant execute on SISANSHDATA.PROC_QRY_CAPITAL to SISANSHOPR;


prompt
prompt Creating procedure PROC_QRY_CAPITALLIST
prompt =======================================
prompt
create or replace procedure sisanshdata.proc_qry_capitallist
(
	result_rc out THINKIVE_ORA.ref_cursor,
 	status_rc out THINKIVE_ORA.ref_cursor,
	p_account_id 	t_sim_account.account_id%TYPE,        --入参:账户ID
	p_start_date  varchar2,
	p_end_date  	varchar2
)
is

begin

  if p_account_id ='' or p_account_id is null then
     open status_rc for
	    select '-10000' as rscode, '账户ID不能为空' as rsmsg from dual;
     return;
  end if;

  if p_start_date ='' or p_start_date is null then
     open status_rc for
	    select '-10000' as rscode, '开始时间不能为空' as rsmsg from dual;
     return;
  end if;

  if p_end_date ='' or p_end_date is null then
     open status_rc for
	    select '-10000' as rscode, '结束时间不能为空' as rsmsg from dual;
     return;
  end if;


  open result_rc for
  	select * from t_sim_hist_account where account_id= p_account_id and create_date>=p_start_date and create_date<=p_end_date ;

	open status_rc for
	   select '0' as rscode, '账户历史资产流水查询成功' as rsmsg from dual;

end proc_qry_capitallist;
/
grant execute on SISANSHDATA.PROC_QRY_CAPITALLIST to SISANSHOPR;


prompt
prompt Creating procedure PROC_QRY_ENTRUST
prompt ===================================
prompt
create or replace procedure sisanshdata.proc_qry_entrust
(
	result_rc out THINKIVE_ORA.ref_cursor,
 	status_rc out THINKIVE_ORA.ref_cursor,
  p_account_id 	     t_sim_account.account_id%TYPE        --入参:账户ID
)
is

begin

  if p_account_id ='' or p_account_id is null then
     open status_rc for
	    select '-10000' as rscode, '账户ID不能为空' as rsmsg from dual;
     return;
  end if;


  open result_rc for
     select * from t_sim_today_order where account_id= p_account_id ;
	open status_rc for
	   select '0' as rscode, '委托查询成功' as rsmsg from dual;
end proc_qry_entrust;
/
grant execute on SISANSHDATA.PROC_QRY_ENTRUST to SISANSHOPR;


prompt
prompt Creating procedure PROC_RECOVERY_ACCOUNT
prompt ========================================
prompt
create or replace procedure sisanshdata.proc_recovery_account
(
  po_retcod                out     varchar2,                --出参返回代码
  po_retmsg                out     varchar2,                --出参返回信息
  p_recovery_date          in   varchar2,                  --恢复日期
  p_recovery_accountid     in   varchar2                   --恢复资金账号
)
is
  vn_count                    integer(10);
  v_recovery_startdate        varchar2(30);      --恢复开始时间，入参恢复日期的前一个交易日
  v_recovery_enddate          varchar2(30);      --恢复结束时间
  v_account_createdate        varchar2(30);      --账号创建时间
  v_hist_startdate            varchar2(30);      --历史资产开始时间
  v_userable_balance          number(16,2);
  v_total_market              number(16,2);
  v_hist_account              t_sim_hist_account%rowtype;
  v_account                   t_sim_account%rowtype;
  v_hold_stock                t_sim_hold_stock%rowtype;
  v_begin_date t_sim_hist_account.create_date%type;       --开始日期
  v_last_date t_sim_hist_account.create_date%type;        --前一日期
  v_last_fri_date varchar2(30);    --上周末日期
  v_last_mon_date varchar2(30);    --上月末日期
  v_day_earning number(16,2); --日收益
  v_day_yield number(10,4);   --日收益率
  v_week_earning number(16,2);--周收益
  v_week_yield number(10,4);  --周收益率
  v_month_earning number(16,2);--月收益
  v_month_yield number(10,4);  --月收益率
  v_total_earning number(16,2); --总收益
  v_total_yield number(10,4);  --总收益率
  v_total_hold_stock     number(16);  --总持仓
  v_cost_price          number(16,3);   --成本价
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
  v_have_hold_stock     number;
  v_tmp_count           number;
  v_exeage_num          number;
  v_stock_info_num      number;
  v_stap_tax_rate      number(16,4);   --印花税率
  v_stap_tax           number(16,2);   --印花税(卖出时收取)
  v_transfer_free      number(16,4);    --过户费率 只有上海股票才会收取过户费
  v_transfer           number(16,2);    --过户费
  v_commissoin_rate    number(16,4);   --佣金率
  v_commissoin         number(16,2);   --佣金率
  v_sec_type           varchar(10);    --股票类型
  v_temp               integer(4);     --临时计数变量
  v_totalbalance       number(16,2);
  v_dividend_num       number(10);
  v_create_date        varchar2(30);
  --指定时间段交易日遍历
  cursor c_trade_date(p_startdate varchar2,p_enddate varchar2)
     is select * from t_b_skrace_tradedate where t_date>=p_startdate
     and t_date <=p_enddate and is_trade=1 order by t_date asc;
  tmp_trade_date              c_trade_date%rowtype;
  -- 历史成交汇总查询
  cursor c_hist_exec_agge(p_exec_date varchar2,p_account_id varchar2)
     is select * from t_sim_hist_exec_collect where account_id=p_account_id and exec_date=p_exec_date order by seri_num;
  tmp_hist_exec_agge          c_hist_exec_agge%rowtype;
  --分红送股查询
  cursor c_stock_bonus(p_trade_date varchar2) is select * from t_sim_bonus t where t.bonus_date=p_trade_date;
  tmp_stock_bonus       c_stock_bonus%rowtype;
  -- 持仓遍历
  cursor c_hold_stock(p_market_id varchar2,p_stockcode varchar2,p_accountid varchar2) is
     select a.*,b.stock_name from t_sim_hold_stock a,t_sim_information b where a.account_id=p_accountid and a.market_id=b.market_id and a.stock_code=b.stock_code and a.market_id=p_market_id and a.stock_code= p_stockcode;
  tmp_hold_stock c_hold_stock%rowtype;
  -- 委托遍历
  cursor orderNum(p_accountid varchar2) is select t.order_srlnum from t_sim_hist_exec_collect t where t.order_srlnum>0 and t.account_id=p_accountid group by t.order_srlnum having count(order_srlnum) > 1;
  v_ordernum   orderNum%rowtype;
  --历史持仓查询
  cursor histholdstock(p_accountid varchar2,p_date varchar2) is select a.* from  t_sim_hist_hold_stock a ,(select max(t.serial_num)serial_num  from T_SIM_HIST_HOLD_STOCK t where to_char(to_date(create_date,'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') <= p_date group by t.hold_srlnum)b
         where a.serial_num = b.serial_num and a.total_qty>0 and a.account_id=p_accountid;
  tmp_histholdstock      histholdstock%rowtype;
begin
   select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
   if p_recovery_date  = '' or p_recovery_date is null then
     po_retcod := '-10001';
     po_retmsg := '回退日期参数不能为空';
     proc_settlement_log('proc_recovery_account',po_retcod,po_retmsg);
     return;
   end if;
   if p_recovery_accountid = '' or p_recovery_accountid is null then
     po_retcod := '-10002';
     po_retmsg := '回退账号不能为空';
     proc_settlement_log('proc_recovery_account',po_retcod,po_retmsg);
     return;
   end if;
   --确定回退开始日期
   select to_char(to_date(p_recovery_date,'yyyymmdd')-1,'yyyymmdd') into v_recovery_startdate from dual;
   select to_char(to_date(create_date,'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') into v_account_createdate from T_SIM_ACCOUNT
      where account_id=p_recovery_accountid;
   if v_recovery_startdate < v_account_createdate then
      v_recovery_startdate := v_account_createdate;
   end if;

   select * into v_account from t_sim_account where account_id = p_recovery_accountid;
   if v_account.state = 0 then
     po_retcod := '-10003';
     po_retmsg := '回退账号为关闭状态，不进行回退'|| p_recovery_accountid;
     proc_settlement_log('proc_recovery_account',po_retcod,po_retmsg);
     return;
   end if;

   --确定回退结束日期
   if v_account.account_type = '1' then
     select to_char(sysdate,'yyyymmdd') into v_recovery_enddate from dual;
   elsif v_account.account_type = '2' then
     select end_date into v_recovery_enddate from t_sim_activity where act_id = v_account.act_id;
   end if;

   if v_recovery_startdate >= v_recovery_enddate then
     po_retcod := '-10004';
     po_retmsg := '回退日期大于等于结束日期'|| p_recovery_accountid;
     proc_settlement_log('proc_recovery_stock',po_retcod,po_retmsg);
     return;
   end if;
   --删除重复成交
   open orderNum(p_recovery_accountid);
   loop
     fetch orderNum into v_ordernum;
     exit when orderNum%notfound;
      delete from t_sim_hist_exec_collect t where order_srlnum=v_ordernum.order_srlnum and  t.rowid < (select max(rowid) from t_sim_hist_exec_collect where order_srlnum=v_ordernum.order_srlnum);
      commit;
    end loop;
    close orderNum;

   --删除指定回退日期后的非交易日的成交
  /* delete from t_sim_hist_exec_collect where exec_date >= v_recovery_startdate
     and exec_date not in(select t_date from t_b_skrace_tradedate where t_date>=v_recovery_startdate
     and t_date <=to_char(sysdate,'yyyymmdd') and is_trade=1 );
   commit;*/

   --备份客户当前资产及持仓
   delete from t_sim_account_bk where account_id = p_recovery_accountid;
   insert into t_sim_account_bk select * from t_sim_account where account_id = p_recovery_accountid;
   delete from t_sim_hold_stock_bk where account_id = p_recovery_accountid;
   insert into t_sim_hold_stock_bk select * from t_sim_hold_stock where account_id = p_recovery_accountid;
   commit;

   -- 删除回退日期后的历史账户
   delete from t_sim_hist_account t where t.account_id=p_recovery_accountid and t.create_date>v_recovery_startdate;
   commit;
   --删除回退日期后的历史持仓
   delete from t_sim_hist_hold_stock t where t.account_id=p_recovery_accountid and to_char(to_date(substr(t.create_date,0,10),'yyyy-mm-dd'),'yyyymmdd') >v_recovery_startdate;
   commit;
   --删除回退日期后的持仓
   delete from t_sim_hold_stock t where t.account_id=p_recovery_accountid and to_char(to_date(substr(t.create_date,0,10),'yyyy-mm-dd'),'yyyymmdd') >v_recovery_startdate;
   commit;
   --删除回退日期后的撤单成交
   delete from t_sim_hist_exec_collect t where t.account_id=p_recovery_accountid and t.order_srlnum in(select a.serial_num from t_sim_hist_order a where a.cancel_qty>0 and a.trade_status='2' and a.order_date>v_recovery_startdate);
   delete from T_SIM_HIST_EXEC_AGGE t where t.account_id=p_recovery_accountid and t.order_srlnum in (select a.serial_num from t_sim_hist_order a where a.cancel_qty>0 and a.trade_status='2' and a.order_date>v_recovery_startdate);
   commit;

   update t_sim_hist_order t set t.trade_status=4  where  t.account_id=p_recovery_accountid and t.serial_num in (select a.serial_num from t_sim_hist_order a where a.cancel_qty>0 and a.trade_status='2' and a.order_date>v_recovery_startdate);
   commit;

   --把持仓回退到回退日期
   open histholdstock(p_recovery_accountid,v_recovery_startdate);
   loop
     fetch histholdstock into tmp_histholdstock;
     exit when histholdstock%notfound;
      --如果当前还有改持仓，更新
      select count(*) into v_have_hold_stock from t_sim_hold_stock t where t.serial_num=tmp_histholdstock.hold_srlnum;
      if v_have_hold_stock > 0 then
         update t_sim_hold_stock t set t.total_qty=tmp_histholdstock.total_qty,t.usable_qty=tmp_histholdstock.usable_qty,t.cost_price=tmp_histholdstock.cost_price,
           t.modify_date = tmp_histholdstock.create_date where t.serial_num=tmp_histholdstock.hold_srlnum;
      else
         --添加持仓
         select min(t.create_date) into v_create_date from t_sim_hist_hold_stock t where t.hold_srlnum=tmp_histholdstock.hold_srlnum;
         insert into t_sim_hold_stock(serial_num,account_id,market_id,stock_code,total_qty,usable_qty,cost_price,create_date,modify_date)
          values(tmp_histholdstock.hold_srlnum,tmp_histholdstock.account_id,tmp_histholdstock.market_id,tmp_histholdstock.stock_code,
          tmp_histholdstock.total_qty,tmp_histholdstock.usable_qty,tmp_histholdstock.cost_price,v_create_date,tmp_histholdstock.create_date);
      end if;
      commit;
   end loop;
   close histholdstock;


   --将账户资产回退到指定日期
   select count(*) into vn_count from t_sim_hist_account
     where create_date =(select max(create_date) from t_sim_hist_account where create_date <= v_recovery_startdate
       and account_id = p_recovery_accountid) and account_id = p_recovery_accountid;
   if vn_count >0 then
      select create_date into v_hist_startdate from t_sim_hist_account
       where create_date =(select max(create_date) from t_sim_hist_account where create_date <= v_recovery_startdate
       and account_id = p_recovery_accountid )and account_id = p_recovery_accountid;
      select * into v_hist_account from t_sim_hist_account where create_date = v_hist_startdate and account_id = p_recovery_accountid;
   else
      v_hist_startdate := '19000101'; --设置为特殊的历史日期,标明该账户无历史资产信息
   end if;

   if v_hist_startdate = '19000101' then
      --恢复资产
      update t_sim_account
          set userable_balance     = init_balance,
              current_balance      = init_balance,
              total_assets         = init_balance,
              total_market         = 0.0000,
              total_earnings       = 0.0000,
              total_yield          = 0.0000,
              total_yield_rankings = 0,
              week_earnings        = 0.0000,
              week_yield           = 0.0000,
              week_yield_rankings  = 0,
              month_earnings       = 0.0000,
              month_yield          = 0.0000,
              month_yield_rankings = 0,
              day_earnings         = 0.0000,
              day_yield            = 0.0000,
              day_yield_rankings   = 0.0000
            where account_id = p_recovery_accountid;
      commit;
   else
      --恢复资产
      update t_sim_account
          set userable_balance     = v_hist_account.current_balance,
              current_balance      = v_hist_account.current_balance,
              total_assets         = v_hist_account.total_assets,
              total_market         = v_hist_account.total_market,
              total_earnings       = v_hist_account.total_earnings,
              total_yield          = v_hist_account.total_yield,
              total_yield_rankings = v_hist_account.total_yield_rankings,
              week_earnings        = v_hist_account.week_earnings,
              week_yield           = v_hist_account.week_yield,
              week_yield_rankings  = v_hist_account.week_yield_rankings,
              month_earnings       = v_hist_account.month_earnings,
              month_yield          = v_hist_account.month_yield,
              month_yield_rankings = v_hist_account.month_yield_rankings,
              day_earnings         = v_hist_account.day_earnings,
              day_yield            = v_hist_account.day_yield,
              day_yield_rankings   = v_hist_account.day_yield_rankings
            where account_id = p_recovery_accountid;
   end if;
   commit;

   --根据历史成交，计算从回退日期开始到当前日期的每个交易日的资产收益。
   open c_trade_date(v_recovery_startdate,v_recovery_enddate);
   loop
   fetch c_trade_date into tmp_trade_date;
   exit when c_trade_date%notfound;
      --分红送股处理
      open c_stock_bonus(tmp_trade_date.t_date);
      loop
      fetch c_stock_bonus into tmp_stock_bonus;
      exit when c_stock_bonus%notfound;
        v_dividend_num := 0;
        if tmp_stock_bonus.type = '0' then
           --删除当日分红流水
           delete from t_sim_hist_exec_agge t where  t.account_id=p_recovery_accountid and t.trade_type='2'
           and t.exec_date=tmp_trade_date.t_date and t.market_id=tmp_stock_bonus.market_id and t.stock_code=tmp_stock_bonus.stock_code;
           commit;
           select count(*) into v_dividend_num from t_sim_hist_exec_agge t where  t.account_id=p_recovery_accountid and t.trade_type='2'
           and t.exec_date=tmp_trade_date.t_date and t.market_id=tmp_stock_bonus.market_id and t.stock_code=tmp_stock_bonus.stock_code;
           if v_dividend_num <= 0 then
              open c_hold_stock(tmp_stock_bonus.market_id,tmp_stock_bonus.stock_code,p_recovery_accountid);
               loop
                 fetch c_hold_stock into tmp_hold_stock;
                 exit when c_hold_stock%notfound;
                   insert into t_sim_hist_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,
                      market_id,stock_code,stock_name,trade_type,exec_qty,exec_price,stap_tax,commissoin,
                      fare,total_balance,remark,transfer_free,total_fare,hold_srlnum,bargain_balance)values(sim_exec_agge_seq.nextval,
                      0,tmp_hold_stock.account_id,tmp_trade_date.t_date,'09:25:00',
                      tmp_hold_stock.market_id,tmp_hold_stock.stock_code,tmp_hold_stock.stock_name,'2',0,0,0,0,
                      0,tmp_hold_stock.usable_qty*tmp_stock_bonus.rate,'红利',0,0,tmp_hold_stock.serial_num,tmp_hold_stock.usable_qty*tmp_stock_bonus.rate);
                   commit;
               end loop;
               close c_hold_stock;
           end if;
        elsif tmp_stock_bonus.type = '1' then
           delete from t_sim_hist_exec_agge t where t.account_id=p_recovery_accountid and t.trade_type='3' and t.market_id=tmp_stock_bonus.market_id and t.stock_code=tmp_stock_bonus.stock_code
            and t.exec_date=tmp_trade_date.t_date;
           commit;
           select count(*) into v_dividend_num from t_sim_hist_exec_agge t where t.account_id=p_recovery_accountid and t.trade_type='3' and t.market_id=tmp_stock_bonus.market_id and t.stock_code=tmp_stock_bonus.stock_code
            and t.exec_date=tmp_trade_date.t_date;
           if v_dividend_num <= 0 then
              open c_hold_stock(tmp_stock_bonus.market_id,tmp_stock_bonus.stock_code,p_recovery_accountid);
               loop
                 fetch c_hold_stock into tmp_hold_stock;
                 exit when c_hold_stock%notfound;
                   insert into t_sim_hist_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,
                      market_id,stock_code,stock_name,trade_type,exec_qty,exec_price,stap_tax,commissoin,
                      fare,total_balance,remark,transfer_free,total_fare,hold_srlnum,bargain_balance)values(sim_exec_agge_seq.nextval,
                      0,tmp_hold_stock.account_id,tmp_trade_date.t_date,'09:25:00',
                      tmp_hold_stock.market_id,tmp_hold_stock.stock_code,tmp_hold_stock.stock_name,'3',tmp_hold_stock.usable_qty*tmp_stock_bonus.rate,0,0,0,
                      0,0,'红股',0,0,tmp_hold_stock.serial_num,0);
                   commit;
               end loop;
               close c_hold_stock;
           end if;
        end if;
      end loop;
      close c_stock_bonus;

      --更新每日可用资产,每日持仓
      select userable_balance into v_userable_balance from t_sim_account where account_id = p_recovery_accountid;

      open c_hist_exec_agge(tmp_trade_date.t_date,p_recovery_accountid);
      loop
      fetch c_hist_exec_agge into tmp_hist_exec_agge;
      exit when c_hist_exec_agge%notfound;
          select count(*) into v_have_hold_stock from t_sim_hold_stock t where t.account_id=p_recovery_accountid and t.market_id=tmp_hist_exec_agge.market_id and t.stock_code=tmp_hist_exec_agge.stock_code;
          if v_have_hold_stock >0 then
             select * into v_hold_stock from t_sim_hold_stock t where t.account_id=p_recovery_accountid and t.market_id=tmp_hist_exec_agge.market_id and t.stock_code=tmp_hist_exec_agge.stock_code;
          end if;
          if tmp_hist_exec_agge.trade_type = '0' then
            if v_userable_balance-tmp_hist_exec_agge.total_balance> 0 then
              v_userable_balance := v_userable_balance - tmp_hist_exec_agge.total_balance;
              --持有对应的持仓
              if v_have_hold_stock >0 then
                v_total_hold_stock := v_hold_stock.total_qty+tmp_hist_exec_agge.exec_qty;
                v_cost_price :=(v_hold_stock.cost_price*v_hold_stock.total_qty+tmp_hist_exec_agge.total_balance)/(v_hold_stock.total_qty+tmp_hist_exec_agge.exec_qty);
                update t_sim_hold_stock t set t.total_qty=v_total_hold_stock,t.usable_qty=v_total_hold_stock,
                    t.cost_price=v_cost_price,t.modify_date=to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd')
                    where t.market_id=tmp_hist_exec_agge.market_id and t.stock_code=tmp_hist_exec_agge.stock_code and t.account_id=p_recovery_accountid;
              --无对应相关持仓
              else
                v_total_hold_stock := tmp_hist_exec_agge.exec_qty;
                v_cost_price := tmp_hist_exec_agge.total_balance/tmp_hist_exec_agge.exec_qty;
                insert into t_sim_hold_stock(serial_num,account_id,market_id,stock_code,total_qty,usable_qty,cost_price,create_date,modify_date)
                  values(tmp_hist_exec_agge.hold_srlnum,p_recovery_accountid,tmp_hist_exec_agge.market_id,tmp_hist_exec_agge.stock_code,v_total_hold_stock,
                  v_total_hold_stock,v_cost_price,to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd'),to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd'));
              end if;
              insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,
                 create_date,hold_srlnum,total_qty,usable_qty,cost_price)values(sim_hist_hold_stock_seq.nextval,p_recovery_accountid,tmp_hist_exec_agge.market_id,tmp_hist_exec_agge.stock_code,
                 to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd'),tmp_hist_exec_agge.hold_srlnum,v_total_hold_stock,v_total_hold_stock,v_cost_price);
              commit;

             else
                delete from t_sim_hist_exec_collect t where t.seri_num= tmp_hist_exec_agge.seri_num;
                delete from t_sim_hist_order t where t.serial_num=tmp_hist_exec_agge.order_srlnum;
                commit;
             end if;

          elsif tmp_hist_exec_agge.trade_type = '1' then
             if v_have_hold_stock >0 then
                v_tmp_count := v_hold_stock.total_qty-tmp_hist_exec_agge.exec_qty;
                --全部卖出
                if v_tmp_count = 0 then
                  v_userable_balance := v_userable_balance + tmp_hist_exec_agge.total_balance;
                  delete from t_sim_hold_stock t where t.serial_num=v_hold_stock.serial_num;
                  v_total_hold_stock := 0;
                  v_cost_price :=0;
                --部分卖出
                elsif v_tmp_count >0 then
                  v_userable_balance := v_userable_balance + tmp_hist_exec_agge.total_balance;
                  v_total_hold_stock := v_hold_stock.total_qty-tmp_hist_exec_agge.exec_qty;
                  v_cost_price := (v_hold_stock.total_qty*v_hold_stock.cost_price-tmp_hist_exec_agge.total_balance)/v_total_hold_stock;
                  update t_sim_hold_stock t set t.total_qty=v_total_hold_stock,t.usable_qty=v_total_hold_stock,
                      t.cost_price=v_cost_price,t.modify_date=to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd')
                      where t.market_id=tmp_hist_exec_agge.market_id and t.stock_code=tmp_hist_exec_agge.stock_code and t.account_id=p_recovery_accountid;
                elsif v_tmp_count <0 then
                  delete from t_sim_hold_stock t where t.serial_num=v_hold_stock.serial_num;
                  select sec_type into v_sec_type
                      from t_sim_information
                      where stock_code = tmp_hist_exec_agge.stock_code and market_id = tmp_hist_exec_agge.market_id ;
                  v_total_hold_stock := 0;
                  v_cost_price :=0;
                  v_transfer :=0;--过户费默认为0
                  v_commissoin:=0;
                  v_stap_tax :=0;
                  -- 获取买卖过户费
                  if lower(v_hold_stock.market_id)='sh' then
                    select count(fare_rate) into v_temp
                    from t_sim_fare
                    where sec_type = v_sec_type
                    and fare_type='transfer_free';

                    if v_temp=0 then
                      select cur_value into v_transfer_free  from t_sim_sys_config where name='default_transfer_free';
                    else
                      select  fare_rate  into v_transfer_free
                      from t_sim_fare
                      where sec_type = v_sec_type
                      and fare_type='transfer_free';
                    end if;

                    v_transfer :=v_hold_stock.total_qty*v_transfer_free;

                    --过户费最低1元
                    if v_transfer<1 then
                       v_transfer :=1;
                    end if;

                  end if;
                  -- 委托买
                  if lower(tmp_hist_exec_agge.trade_type)='0' then
                    BEGIN
                       --佣金费率获取
                        select count(fare_rate) into v_temp
                        from t_sim_fare
                        where sec_type = v_sec_type
                         and fare_type='commission';

                       if v_temp = 0 then
                         select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission'  ;
                       else
                        select  fare_rate  into v_commissoin_rate
                        from t_sim_fare
                        where sec_type = v_sec_type
                         and fare_type='commission';
                       end if;
                       --手续费最低5元
                       v_commissoin:=v_hold_stock.total_qty*tmp_hist_exec_agge.exec_price*v_commissoin_rate;
                       if v_commissoin<5 then
                          v_commissoin:=5;
                       end if;
                       --费率获取结束
                       v_totalbalance := v_hold_stock.total_qty*tmp_hist_exec_agge.exec_price + v_commissoin+v_transfer;
                    end;
                  -- 委托卖
                  elsif lower(tmp_hist_exec_agge.trade_type) = '1' then
                    BEGIN
                    select count(fare_rate) into v_temp
                        from t_sim_fare
                        where  sec_type = v_sec_type
                         and fare_type='staptax';

                       if v_temp = 0 then
                        select cur_value into v_stap_tax_rate from t_sim_sys_config where name='default_staptax'  ;
                       else
                        select  fare_rate  into v_stap_tax_rate
                        from t_sim_fare
                        where sec_type = v_sec_type
                         and fare_type='staptax';
                       end if;
                       --印花税
                       v_stap_tax := v_hold_stock.total_qty * tmp_hist_exec_agge.exec_price * v_stap_tax_rate;

                        select count(fare_rate) into v_temp
                        from t_sim_fare
                        where sec_type = v_sec_type
                         and fare_type='commission';

                       if v_temp = 0 then
                        select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission' ;
                       else
                        select  fare_rate  into v_commissoin_rate
                        from t_sim_fare
                        where sec_type = v_sec_type
                         and fare_type='commission';
                       end if;

                       --手续费最低5元
                       v_commissoin:=v_hold_stock.total_qty*tmp_hist_exec_agge.exec_price*v_commissoin_rate;
                       if v_commissoin<5 then
                          v_commissoin:=5;
                       end if;
                       v_totalbalance := v_hold_stock.total_qty*tmp_hist_exec_agge.exec_price - v_commissoin-v_transfer-v_stap_tax;
                    end;
                  end if;
                  v_userable_balance := v_userable_balance + v_totalbalance;
                  update t_sim_hist_exec_collect t set t.exec_qty=v_hold_stock.total_qty,t.total_balance=v_totalbalance,t.commissoin=v_commissoin,t.transfer_free=v_transfer,t.stap_tax=v_stap_tax,t.bargain_balance= v_hold_stock.total_qty*tmp_hist_exec_agge.exec_price
                   where t.seri_num=tmp_hist_exec_agge.seri_num;
                end if;
                insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,
                   create_date,hold_srlnum,total_qty,usable_qty,cost_price)values(sim_hist_hold_stock_seq.nextval,p_recovery_accountid,tmp_hist_exec_agge.market_id,tmp_hist_exec_agge.stock_code,
                   to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd'),tmp_hist_exec_agge.hold_srlnum,v_total_hold_stock,v_total_hold_stock,v_cost_price);
                commit;
             else
                delete from t_sim_hist_exec_collect t where t.seri_num= tmp_hist_exec_agge.seri_num;
                delete from t_sim_hist_exec_agge t where t.order_srlnum=tmp_hist_exec_agge.order_srlnum;
                delete from t_sim_hist_order t where t.serial_num=tmp_hist_exec_agge.order_srlnum;
                commit;
             end if;
          elsif tmp_hist_exec_agge.trade_type = '2' then
             if v_have_hold_stock >0 then
                v_userable_balance := v_userable_balance + tmp_hist_exec_agge.total_balance;
                v_total_hold_stock := v_hold_stock.total_qty;
                v_cost_price := (v_hold_stock.cost_price*v_hold_stock.total_qty-tmp_hist_exec_agge.total_balance)/v_total_hold_stock;
                update t_sim_hold_stock t set t.total_qty=v_total_hold_stock,t.usable_qty=v_total_hold_stock,
                      t.cost_price=v_cost_price,t.modify_date=to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd')
                      where t.market_id=tmp_hist_exec_agge.market_id and t.stock_code=tmp_hist_exec_agge.stock_code and t.account_id=p_recovery_accountid;
                insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,
                   create_date,hold_srlnum,total_qty,usable_qty,cost_price)values(sim_hist_hold_stock_seq.nextval,p_recovery_accountid,tmp_hist_exec_agge.market_id,tmp_hist_exec_agge.stock_code,
                   to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd'),tmp_hist_exec_agge.hold_srlnum,v_total_hold_stock,v_total_hold_stock,v_cost_price);
                commit;
             else
                delete from t_sim_hist_exec_collect t where t.seri_num= tmp_hist_exec_agge.seri_num;
                commit;
             end if;
          elsif tmp_hist_exec_agge.trade_type = '3' then
             if v_have_hold_stock >0 then
                v_total_hold_stock := v_hold_stock.total_qty+tmp_hist_exec_agge.exec_qty;
                v_cost_price := (v_hold_stock.cost_price*v_hold_stock.total_qty)/v_total_hold_stock;
                update t_sim_hold_stock t set t.total_qty=v_total_hold_stock,t.usable_qty=v_total_hold_stock,
                      t.cost_price=v_cost_price,t.modify_date=to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd')
                      where t.market_id=tmp_hist_exec_agge.market_id and t.stock_code=tmp_hist_exec_agge.stock_code and t.account_id=p_recovery_accountid;
                insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,
                   create_date,hold_srlnum,total_qty,usable_qty,cost_price)values(sim_hist_hold_stock_seq.nextval,p_recovery_accountid,tmp_hist_exec_agge.market_id,tmp_hist_exec_agge.stock_code,
                   to_char(to_date(tmp_hist_exec_agge.exec_date,'yyyymmdd'),'yyyy-mm-dd'),tmp_hist_exec_agge.hold_srlnum,v_total_hold_stock,v_total_hold_stock,v_cost_price);
                commit;
             else
                delete from t_sim_hist_exec_collect t where t.seri_num= tmp_hist_exec_agge.seri_num;
                commit;
             end if;
          end if;
      end loop;
      close c_hist_exec_agge;
      select count(*) into v_exeage_num from t_sim_hist_exec_collect t where t.account_id=p_recovery_accountid and t.exec_date=tmp_trade_date.t_date;
      if v_exeage_num > 0 then
        --更新当日可用资产
        update t_sim_account set userable_balance = v_userable_balance ,current_balance=v_userable_balance where account_id = p_recovery_accountid;
        commit;
      end if;

      select count(*) into v_stock_info_num from t_sim_hist_information t where t.trade_date=tmp_trade_date.t_date;
      if v_stock_info_num >0 then
        --计算当日市值及总资产
        select nvl(sum(nvl(b.now_price,b.close_price)*nvl(a.total_qty,0)),0) into v_total_market from t_sim_hold_stock a,t_sim_hist_information b
            where a.stock_code = b.stock_code and a.market_id = b.market_id and a.account_id = p_recovery_accountid and b.trade_date=tmp_trade_date.t_date;
        update t_sim_account t set t.total_market = v_total_market,t.total_assets = t.userable_balance+v_total_market
            where account_id = p_recovery_accountid;
        commit;

        --计算收益
        select * into v_account from t_sim_account where account_id = p_recovery_accountid;
        select to_char(min(create_date)) into v_begin_date from t_sim_hist_account where account_id = p_recovery_accountid;
        select to_char(max(create_date)) into v_last_date from t_sim_hist_account where account_id = p_recovery_accountid;
        v_last_fri_date := getlastfridate(tmp_trade_date.t_date);
        v_last_mon_date := getlastmondate(tmp_trade_date.t_date);
        -- 日收益计算
        if v_last_date ='' or v_last_date is null then
           v_day_earning := v_account.total_assets - v_account.init_balance;
           v_day_yield := v_day_earning / v_account.init_balance;
        else
           select * into v_hist_account from t_sim_hist_account where account_id=p_recovery_accountid and create_date=v_last_date;
           v_day_earning := v_account.total_assets - v_hist_account.total_assets;
           v_day_yield := v_day_earning / v_hist_account.total_assets;
        end if;
        -- 周收益计算
        if v_begin_date ='' or v_begin_date is null then
           v_week_earning := v_account.total_assets - v_account.init_balance;
           v_week_yield := v_week_earning /v_account.init_balance;
        elsif v_last_fri_date<v_begin_date then
           v_week_earning := v_account.total_assets - v_account.init_balance;
           v_week_yield := v_week_earning /v_account.init_balance;
        else
           select * into v_hist_account from t_sim_hist_account where account_id=p_recovery_accountid
              and create_date=(select max(create_date)from t_sim_hist_account
              where account_id=p_recovery_accountid and create_date<=v_last_fri_date);
           v_week_earning := v_account.total_assets - v_hist_account.total_assets;
           v_week_yield := v_week_earning /v_hist_account.total_assets;
        end if;

        -- 月收益计算
        if v_begin_date ='' or v_begin_date is null then
           v_month_earning := v_account.total_assets - v_account.init_balance;
           v_month_yield := v_week_earning /v_account.init_balance;
        elsif v_last_mon_date<v_begin_date then
           v_month_earning := v_account.total_assets - v_account.init_balance;
           v_month_yield := v_week_earning /v_account.init_balance;
        else
           select * into v_hist_account from t_sim_hist_account where account_id=p_recovery_accountid
             and create_date=(select max(create_date)from t_sim_hist_account
             where account_id=p_recovery_accountid and create_date<=v_last_mon_date);
           v_month_earning := v_account.total_assets - v_hist_account.total_assets;
           v_month_yield := v_week_earning /v_hist_account.total_assets;
        end if;

        -- 总收益计算
        v_total_earning := v_account.total_assets - v_account.init_balance;
        v_total_yield := v_total_earning / v_account.init_balance;

        -- 更新收益
        update t_sim_account  set total_earnings=v_total_earning,total_yield=v_total_yield,
            day_earnings=v_day_earning,day_yield=v_day_yield,week_earnings=v_week_earning,week_yield=v_week_yield,
            month_earnings=v_month_earning,month_yield=v_month_yield  where account_id=p_recovery_accountid;
        commit;
        --账户历史资产数据迁移
        insert into t_sim_hist_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
          select account_id,money_id,tmp_trade_date.t_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
          from t_sim_account where account_id=p_recovery_accountid;
        commit;
     else
        insert into t_sim_hist_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
          select account_id,money_id,tmp_trade_date.t_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
          from t_sim_account where account_id=p_recovery_accountid;
        commit;
     end if;


   end loop;
   close c_trade_date;
   select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
   po_retcod := '0';
   po_retmsg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
   --proc_settlement_log('proc_recovery_account',po_retcod,po_retmsg);
   return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      po_retmsg := '数据未找到!' || substr(sqlerrm,1,500) || p_recovery_accountid;
      proc_settlement_log('proc_recovery_account',po_retcod,po_retmsg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      po_retmsg := '其他异常!' || substr(sqlerrm,1,500) || p_recovery_accountid;
      proc_settlement_log('proc_recovery_account',po_retcod,po_retmsg);
      return;
end proc_recovery_account;
/
grant execute on SISANSHDATA.PROC_RECOVERY_ACCOUNT to SISANSHOPR;


prompt
prompt Creating procedure PROC_RECOVERY_SINGLE_ACCOUNT
prompt ===============================================
prompt
create or replace procedure sisanshdata.proc_recovery_single_account
/*
  描述：对于单账号清算回退存储过程（前提交易撮合正常）
  作者：欧阳大炯
  参数： p_recovery_date 回退日期 指需要从哪一天开始从新清算
         p_recovery_accountid 回退账号
*/
(
  p_recovery_date           varchar2,
  p_recovery_accountid      varchar2
)
is
  v_account              t_sim_account%rowtype;
  v_err_code             varchar2(30);
  v_err_msg              varchar2(1000);
  ve_exception           exception;
begin
  if p_recovery_date  = '' or p_recovery_date is null then
     v_err_code := '-10001';
     v_err_msg := '回退日期参数不能为空';
     proc_settlement_log('proc_recovery_single_account',v_err_code,v_err_msg);
     return;
   end if;
   if p_recovery_accountid = '' or p_recovery_accountid is null then
     v_err_code := '-10002';
     v_err_msg := '回退账号不能为空';
     proc_settlement_log('proc_recovery_single_account',v_err_code,v_err_msg);
     return;
   end if;
  select * into v_account from t_sim_account where account_id = p_recovery_accountid;
  proc_recovery_account(po_retcod => v_err_code,po_retmsg => v_err_msg,p_recovery_date => p_recovery_date,p_recovery_accountid => p_recovery_accountid);
  if v_err_code <> 0 then
     raise ve_exception;
  end if;

  if v_account.account_type = '1' and v_account.pk_account = '1' then
    --stock_settlement.proc_yield_rank_stock(po_retcod => v_err_code);
    if v_err_code <> '0' then
       raise ve_exception;
    end if;
  elsif v_account.account_type = '2' then
    --stock_settlement.proc_yield_rank_match(po_retcod => v_err_code);
    if v_err_code <> '0' then
       raise ve_exception;
    end if;
  end if;

EXCEPTION
    when ve_exception then
       return;
    WHEN no_data_found THEN
      DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
    when others then
      dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
end proc_recovery_single_account;
/
grant execute on SISANSHDATA.PROC_RECOVERY_SINGLE_ACCOUNT to SISANSHOPR;


prompt
prompt Creating procedure PROC_RECOVER_HIST_DATE
prompt =========================================
prompt
create or replace procedure sisanshdata.proc_recover_hist_date
is
  cursor date_hist_account is select to_char(to_date(substr(t.err_msg,12,10),'yyyy-MM-dd'),'yyyyMMdd') begin_date,to_char(to_date(substr(t.err_msg,37,10),'yyyy-MM-dd'),'yyyyMMdd') end_date from T_SIM_SETTLEMENT_LOG t
    where t.procedure_name='proc_earning_yield' and t.err_code=0 and substr(t.err_msg,12,10) <> substr(t.err_msg,37,10)
    order by t.create_date;
  tmp_date_hist_account  date_hist_account%rowtype;
begin
  open date_hist_account;
    loop
    fetch date_hist_account into tmp_date_hist_account;
    exit when date_hist_account%notfound;
       update t_sim_hist_account t set t.create_date=tmp_date_hist_account.begin_date where t.create_date=tmp_date_hist_account.end_date;
       commit;
    end loop;
  close date_hist_account;

end proc_recover_hist_date;
/
grant execute on SISANSHDATA.PROC_RECOVER_HIST_DATE to SISANSHOPR;


prompt
prompt Creating procedure PROC_RZRQ_CALCUL_RATE
prompt ========================================
prompt
create or replace procedure sisanshdata.PROC_RZRQ_CALCUL_RATE
--(
--   po_retcod                     out     varchar2     --出参返回代码
--)
is

  v_orderprice         number(16,3);   --委托价
  v_stockname          varchar2(30);   --股票名称
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time                  varchar2(20);             --存储过程执行结束时间
  v_all_sell_balance   number(16,2);

  v_userable_balance   number(16,2);          --融券卖出所得
  v_creditAsset        number(16,2);   --担保物折算
  v_userableRepay      number(16,2);   --剩余现金
  v_exchang_rate       number(5,2);    --担保物折算率
  v_nowprice           number(16,3);   --现价
  v_closeprice         number(16,3);   --收盘价
  v_rz_total_margin       number(16,2);   --融资合约总金额：(融资合约总金额-已还金额) *保证金比例
  v_rz_caution         number(16,2);   --融资占用保证金
  v_rz_freeze_margin   number(16,2);   --融资冻结保证金
  v_rq_total_margin    number(16,2);   --融券合约总金额：（融券总数量 - 已还数量）* 成交价格 * 保证金比例
  v_rq_caution         number(16,2);   --融券占用保证金
  v_rq_freeze_margin   number(16,2);   --融券冻结保证金
  v_contractMargin     number(16,2);   --已占用保证金
  v_rz_debt            number(16,2);   --融资负债
  v_rq_debt            number(16,2);   --融券负债总金额
  v_hold_nowprice      number(16,3);
  v_hold_marketbalance number(16,2);
  v_maintain_rate      number(16,2);
  v_tmp_rzrq_debt      number(16,2);

  cursor c_account is
   select * from t_rzrq_account t where t.state=1 and t.need_settlement=1;
  tmp_account t_rzrq_account%rowtype;

  cursor c_account_holdstock(p_account_id varchar2) is
   select a.serial_num, a.account_id,a.market_id, a.stock_code, a.total_qty, a.usable_qty, a.cost_price,
    to_char(to_date(a.create_date,'yyyy-MM-dd hh24:mi:ss'),'yyyyMMdd') create_date,b.stock_name,nvl(b.close_price,0) close_price,nvl(b.now_price,0) now_price
    from t_sim_hold_stock a,t_sim_information b where  a.market_id = b.market_id
    and a.stock_code = b.stock_code  and a.account_id = p_account_id order by a.create_date desc;
  tmp_account_holdstock c_account_holdstock%rowtype;

  cursor c_rzrq_holdstock(p_account_id varchar2) is
   select a.credit_usbale_qty,a.credit_qty,a.financing_usable_qty,a.financing_qty,b.* from t_rzrq_hold_stock a,t_sim_hold_stock b where b.account_id=p_account_id and a.serial_num=b.serial_num;
  tmp_rzrq_holdstock c_rzrq_holdstock%rowtype;

  cursor c_rq_debt(p_account_id varchar2) is
   select sum((a.contracts_qty-nvl(a.returned_qty,0)-nvl(a.today_returned_qty,0))) rq_debt_qty ,a.market_id,a.stock_code from t_rzrq_credit_contracts a
   where a.contracts_state=0 and a.contracts_type=1 and a.account_id=p_account_id  group by a.market_id,a.stock_code;
  tmp_rq_debt c_rq_debt%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_account;
  loop
    fetch c_account into tmp_account;
    exit when c_account%notfound;
    begin
       /*--可用资金
       v_userableRepay := tmp_account.usable_balance;
       --计算持仓折算资产（充抵保证金的证券）
       v_creditAsset := 0;
       open c_rzrq_holdstock(tmp_account.account_id);
       loop
          fetch c_rzrq_holdstock into tmp_rzrq_holdstock;
          exit when c_rzrq_holdstock%notfound;
          begin
             if tmp_rzrq_holdstock.credit_qty != 0 then
                select c.exchang_rate into v_exchang_rate from t_rzrq_collateral c where c.stock_code=tmp_rzrq_holdstock.stock_code and c.market_id=tmp_rzrq_holdstock.market_id;
                select i.now_price into v_nowprice from t_sim_information i where i.stock_code=tmp_rzrq_holdstock.stock_code and i.market_id=tmp_rzrq_holdstock.market_id;
                select t.close_price into v_closeprice from t_sim_information t where t.stock_code=tmp_rzrq_holdstock.stock_code and t.market_id=tmp_rzrq_holdstock.market_id;
                if v_nowprice = 0 then
                  v_nowprice := v_closeprice;
                end if;
                --持仓折算资产=信用买入持仓 * 现价 * 担保物折算率
                v_creditAsset := v_creditAsset + tmp_rzrq_holdstock.credit_qty * v_nowprice * v_exchang_rate;
             end if;
          end;
       end loop;
       close c_rzrq_holdstock;

       --计算融资占用保证金
       select nvl(sum((a.contracts_balance-nvl(a.returned_balance,0)-nvl(a.today_returned_balance,0))*a.margin_rate),0)total_margin into v_rz_total_margin from t_rzrq_credit_contracts a where a.contracts_state=0 and a.contracts_type=0 and a.account_id=tmp_account.account_id;
       select nvl(sum(a.freeze_margin)-sum(nvl(b.used_margin,0)),0) freeze_margin into v_rz_freeze_margin from t_rzrq_today_order a left join t_rzrq_credit_contracts b on a.order_num=b.order_no,t_sim_today_order c where a.order_num=c.serial_num and c.account_id=tmp_account.account_id and c.trade_type=6 and c.deal_flag in ('0','1');
      --融资占用保证金 = 融资合约总金额(减去已还金额)+融资冻结保证金
       v_rz_caution := v_rz_total_margin + v_rz_freeze_margin;

       --计算融券占用保证金
       select nvl(sum((a.contracts_qty-nvl(a.returned_qty,0)-nvl(a.today_returned_qty,0))*b.exec_price*a.margin_rate),0) rq_total_margin into v_rq_total_margin from t_rzrq_credit_contracts a,(select ec.order_srlnum,ec.exec_price from t_sim_exec_collect ec where ec.trade_type='7' and ec.account_id=tmp_account.account_id union all select hc.order_srlnum,hc.exec_price from t_sim_hist_exec_collect hc where hc.trade_type='7' and hc.account_id=tmp_account.account_id) b where a.order_no=b.order_srlnum and  a.contracts_state=0 and a.contracts_type=1 and a.account_id=tmp_account.account_id;
       select nvl(sum(a.freeze_margin)-sum(nvl(b.used_margin,0)),0) freeze_margin into v_rq_freeze_margin from t_rzrq_today_order a left join t_rzrq_credit_contracts b on a.order_num=b.order_no,t_sim_today_order c where a.order_num=c.serial_num and c.account_id=tmp_account.account_id and c.trade_type=7 and c.deal_flag in ('0','1');
       --融券占用保证金=融券合约总金额+融券冻结保证金
       v_rq_caution := v_rq_total_margin + v_rq_freeze_margin;

        --已占用保证金 > 担保物(持仓折算资产)：可用资金 = 可用资金 - (已占用保证金 - 担保物)
       v_contractMargin := v_rz_caution + v_rq_caution;
       if v_contractMargin > v_creditAsset then
          v_userableRepay := v_userableRepay - (v_contractMargin - v_creditAsset);
       end if;
       */

       --融资负债
       select nvl(sum(a.contracts_balance-nvl(a.returned_balance,0)-nvl(a.today_returned_balance,0)+nvl(a.contracts_interest,0)),0)total_debt into v_rz_debt from t_rzrq_credit_contracts a where a.contracts_state=0 and a.contracts_type=0 and a.account_id=tmp_account.account_id;

       --融券负债金额
       v_rq_debt :=0;
       open c_rq_debt(tmp_account.account_id);
       loop
          fetch c_rq_debt into tmp_rq_debt;
          exit when c_rq_debt%notfound;
          begin
              select nvl(i.now_price,0) into v_nowprice from t_sim_information i where i.stock_code=tmp_rq_debt.stock_code and i.market_id=tmp_rq_debt.market_id;
              select nvl(t.close_price,0) into v_closeprice from t_sim_information t where t.stock_code=tmp_rq_debt.stock_code and t.market_id=tmp_rq_debt.market_id;
              if v_nowprice = 0 then
                  v_nowprice := v_closeprice;
              end if;
              --融券负债金额 = 融券数量 * 现价;
              v_rq_debt := v_rq_debt + tmp_rq_debt.rq_debt_qty * v_nowprice;
          end;
       end loop;
       close c_rq_debt;

       --计算持仓总市值
       v_hold_marketbalance := 0;
       open c_account_holdstock(tmp_account.account_id);
       loop
           fetch c_account_holdstock into tmp_account_holdstock;
           exit when c_account_holdstock%notfound;
           begin
              if tmp_account_holdstock.now_price = 0 then
                 v_hold_nowprice := tmp_account_holdstock.close_price;
              else
                 v_hold_nowprice := tmp_account_holdstock.now_price;
              end if;
              v_hold_marketbalance := v_hold_marketbalance + v_hold_nowprice * tmp_account_holdstock.total_qty;
           end;
       end loop;
       close c_account_holdstock;

       --计算帐户维保比例=(帐户现金资产 + 帐户持仓总市值)*100 / (融资负债+融券负债金额)
       select decode((v_rz_debt + v_rq_debt),0,1,(v_rz_debt + v_rq_debt)) into v_tmp_rzrq_debt from dual;
       v_maintain_rate := (tmp_account.capital_balance + v_hold_marketbalance) * 100 / v_tmp_rzrq_debt;

       --写入维保比例表
       insert into t_rzrq_account_maintain_rate(account_id,maintain_rate,create_date)
          values(tmp_account.account_id,v_maintain_rate,to_char(sysdate,'yyyymmdd'));

    end;
  end loop;
  close c_account;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  --po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_rzrq_calcul_rate',0,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      --po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_rzrq_calcul_rate',500,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      --po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_rzrq_calcul_rate',500,v_err_msg);
      return;
end PROC_RZRQ_CALCUL_RATE;
/
grant execute on SISANSHDATA.PROC_RZRQ_CALCUL_RATE to SISANSHOPR;


prompt
prompt Creating procedure PROC_RZRQ_COMPEL_DEAL
prompt ========================================
prompt
create or replace procedure sisanshdata.PROC_RZRQ_COMPEL_DEAL
--(
   --po_retcod                     out     varchar2     --出参返回代码
--)
is
  v_order_num          number;    --委托编号
  v_exec_agge_num      number;    --成交编号
  v_hist_hold_num      number;    --历史持仓编号
  v_order_balance      number(16,2);   --委托金额
  v_total_balance      number(16,2);   --交易金额（含交易费用）
  v_stap_tax_rate      number(16,4);   --印花税率
  v_stap_tax           number(16,2);   --印花税(卖出时收取)
  v_transfer_free      number(16,4);    --过户费率 只有上海股票才会收取过户费
  v_transfer           number(16,2);    --过户费
  v_commissoin_rate    number(16,4);   --佣金率
  v_commissoin         number(16,2);   --佣金率
  v_temp               integer(4);     --临时计数变量
  v_sec_type           varchar(10);    --股票类型
  v_highbuy            number(16,3);   --当日涨停价
  v_lowsell            number(16,3);   --当日跌停价
  v_nowprice           number(16,3);   --现价
  v_closeprice         number(16,3);   --收盘价
  v_orderprice         number(16,3);   --委托价
  v_stockname          varchar2(30);   --股票名称
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time                  varchar2(20);             --存储过程执行结束时间
  v_all_sell_balance   number(16,2);
  v_rz_debt      number(16,2);                         --融资负债
  v_userable_balance   number(16,2);          --融券卖出所得
  cursor c_account_holdstock(p_account_id varchar2) is
   select * from t_sim_hold_stock  where account_id = p_account_id;
  tmp_account_holdstock c_account_holdstock%rowtype;
  cursor c_account is
   select * from t_rzrq_account where state=1 and account_id in (
     select a.account_id from t_rzrq_account_maintain_rate a,t_rzrq_account_maintain_rate b where
     a.maintain_rate < (select cur_value*100 from t_sim_sys_config where name='rzrq_forcesell_line')
     and a.create_date = getLastTradeDate
     and b.maintain_rate < (select cur_value*100 from t_sim_sys_config where name='rzrq_warn_line')
     and b.create_date = to_char(sysdate,'yyyymmdd')
     and a.account_id=b.account_id
   );
  tmp_account c_account%rowtype;
  cursor c_rq_debt(p_account_id varchar2) is
   select * from (select a.*,b.contracts_no,b.contracts_qty,b.returned_qty,b.today_returned_qty,b.create_time from t_sim_exec_collect  a,t_rzrq_credit_contracts b  where a.order_srlnum=b.order_no and b.contracts_state=0 and b.contracts_type=1
     union all select a.*,b.contracts_no,b.contracts_qty,b.returned_qty,b.today_returned_qty ,b.create_time from  t_sim_hist_exec_collect a,t_rzrq_credit_contracts b  where a.order_srlnum=b.order_no and b.contracts_state=0 and b.contracts_type=1) where 1=1
     and account_id = p_account_id;
  tmp_rq_debt c_rq_debt%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;

        open c_account;
        loop
          fetch c_account into tmp_account;
          exit when c_account%notfound;
             select sum(a.contracts_balance-nvl(a.returned_balance,0)-nvl(a.today_returned_balance,0)) into v_rz_debt from t_rzrq_credit_contracts a where a.contracts_state=0 and a.contracts_type=0 and a.account_id=tmp_account.account_id;
             v_all_sell_balance :=0;
             --内循环
             open c_account_holdstock(tmp_account.account_id);
             loop
               fetch c_account_holdstock into tmp_account_holdstock;
               exit when c_account_holdstock%notfound;

               --获取当前委托股票的涨停价、跌停价、股票类型
               select Highbuy_price,Lowsell_price,sec_type,now_price,close_price,stock_name into  v_highbuy,v_lowsell,v_sec_type,v_nowprice,v_closeprice,v_stockname
                      from t_sim_information where stock_code = tmp_account_holdstock.stock_code and market_id = tmp_account_holdstock.market_id ;
                if v_nowprice != 0 then
                   v_orderprice :=v_nowprice;
                else
                   v_orderprice :=v_closeprice;
                end if;

                v_transfer :=0;--过户费默认为0
                 -- 获取买卖过户费
                if lower(tmp_account_holdstock.market_id)='sh' then
                       select count(fare_rate) into v_temp
                       from t_sim_fare
                       where sec_type = v_sec_type
                       and fare_type='transfer_free';

                       if v_temp=0 then
                         select cur_value into v_transfer_free  from t_sim_sys_config where name='default_transfer_free';
                         else
                         select  fare_rate  into v_transfer_free
                         from t_sim_fare
                         where sec_type = v_sec_type
                         and fare_type='transfer_free';
                       end if;

                       v_transfer :=tmp_account_holdstock.usable_qty*v_transfer_free;
                       --过户费最低1元
                       /*
                       if v_transfer<1 then
                          v_transfer :=1;
                       end if;*/
                end if;
                select count(fare_rate) into v_temp from t_sim_fare where  sec_type = v_sec_type and fare_type='staptax';

                if v_temp = 0 then
                   select cur_value into v_stap_tax_rate from t_sim_sys_config where name='default_staptax'  ;
                else
                   select  fare_rate  into v_stap_tax_rate from t_sim_fare where sec_type = v_sec_type and fare_type='staptax';
                end if;

                v_stap_tax := v_orderprice * tmp_account_holdstock.usable_qty * v_stap_tax_rate;

                select count(fare_rate) into v_temp
                from t_sim_fare where sec_type = v_sec_type and fare_type='commission';

                if v_temp = 0 then
                   select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission' ;
                else
                   select  fare_rate  into v_commissoin_rate from t_sim_fare where sec_type = v_sec_type and fare_type='commission';
                end if;
                v_commissoin:=v_orderprice * tmp_account_holdstock.usable_qty * v_commissoin_rate;
                /*
                if v_commissoin<5 then
                   v_commissoin:=5;
                end if;*/

               -- 委托卖出金额
               v_order_balance := tmp_account_holdstock.usable_qty * v_orderprice;
               v_total_balance := tmp_account_holdstock.usable_qty*v_orderprice-v_transfer-v_stap_tax-v_commissoin;
               select sim_today_order_seq.nextval into v_order_num from dual;
               insert into T_SIM_TODAY_ORDER(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
                       values(v_order_num,tmp_account_holdstock.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_account_holdstock.market_id,tmp_account_holdstock.stock_code,v_stockname,'8','2',tmp_account_holdstock.usable_qty,v_orderprice,v_order_balance,v_stap_tax,0,'2',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
               select sim_exec_agge_seq.nextval into v_exec_agge_num from dual;
               insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,
                       trade_type,exec_qty,exec_price,stap_tax,commissoin,fare,total_balance,transfer_free,total_fare,hold_srlnum,bargain_balance)
                       values(v_exec_agge_num,v_order_num,tmp_account_holdstock.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_account_holdstock.market_id,
                       tmp_account_holdstock.stock_code,v_stockname,'8',tmp_account_holdstock.usable_qty,v_orderprice,v_stap_tax,v_commissoin,0,v_total_balance,v_transfer,v_stap_tax+v_commissoin+v_transfer,tmp_account_holdstock.serial_num,v_order_balance);
               delete from t_sim_hold_stock  where serial_num=tmp_account_holdstock.serial_num;
               select sim_hist_hold_stock_seq.nextval into v_hist_hold_num from dual;
               insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,
                      create_date,hold_srlnum,total_qty,usable_qty,cost_price)
                      values(v_hist_hold_num,tmp_account_holdstock.account_id,tmp_account_holdstock.market_id,tmp_account_holdstock.stock_code,
                      to_char(sysdate,'yyyymmdd hh24:mi:ss'),tmp_account_holdstock.serial_num,0,0,0);
               v_all_sell_balance := v_all_sell_balance + v_total_balance;
             end loop;
             close c_account_holdstock;
             --更改融资负债状态
             update t_rzrq_credit_contracts t set t.today_returned_balance=nvl(t.today_returned_balance,0)+(t.contracts_balance-nvl(t.returned_balance,0)-nvl(t.today_returned_balance,0)) where t.account_id=tmp_account.account_id;
             if v_rz_debt > v_all_sell_balance then
               select sim_today_order_seq.nextval into v_order_num from dual;
               insert into T_SIM_TODAY_ORDER(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
                       values(v_order_num,tmp_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),'','','','10','2',0,0,v_rz_debt-v_all_sell_balance,0,0,'2',0,v_rz_debt-v_all_sell_balance,0,0);
               select sim_exec_agge_seq.nextval into v_exec_agge_num from dual;
               insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,
                       trade_type,exec_qty,exec_price,stap_tax,commissoin,fare,total_balance,transfer_free,total_fare,hold_srlnum,bargain_balance)
                       values(v_exec_agge_num,v_order_num,tmp_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),'',
                       '','','10',0,0,0,0,0,v_rz_debt-v_all_sell_balance,0,0,'',v_rz_debt-v_all_sell_balance);
               update t_rzrq_account set capital_balance= capital_balance - (v_rz_debt-v_all_sell_balance),  usable_balance= usable_balance-(v_rz_debt-v_all_sell_balance) where account_id= tmp_account.account_id;
             else
               update t_rzrq_account set capital_balance= capital_balance + (v_all_sell_balance-v_rz_debt),  usable_balance= usable_balance+(v_all_sell_balance-v_rz_debt) where account_id= tmp_account.account_id;
             end if;

             --融券负债内循环
             open c_rq_debt(tmp_account.account_id);
             loop
               fetch c_rq_debt into tmp_rq_debt;
               exit when c_rq_debt%notfound;

               --获取当前委托股票的涨停价、跌停价、股票类型
               select Highbuy_price,Lowsell_price,sec_type,now_price,close_price,stock_name into  v_highbuy,v_lowsell,v_sec_type,v_nowprice,v_closeprice,v_stockname
                      from t_sim_information where stock_code = tmp_rq_debt.stock_code and market_id = tmp_rq_debt.market_id ;
                if v_nowprice != 0 then
                   v_orderprice :=v_nowprice;
                else
                   v_orderprice :=v_closeprice;
                end if;

                v_transfer :=0;--过户费默认为0
                 -- 获取买卖过户费
                if lower(tmp_rq_debt.market_id)='sh' then
                       select count(fare_rate) into v_temp
                       from t_sim_fare
                       where sec_type = v_sec_type
                       and fare_type='transfer_free';

                       if v_temp=0 then
                         select cur_value into v_transfer_free  from t_sim_sys_config where name='default_transfer_free';
                         else
                         select  fare_rate  into v_transfer_free
                         from t_sim_fare
                         where sec_type = v_sec_type
                         and fare_type='transfer_free';
                       end if;

                       v_transfer :=(tmp_rq_debt.contracts_qty-nvl(tmp_rq_debt.returned_qty,0)-nvl(tmp_rq_debt.today_returned_qty,0))*v_transfer_free;
                       --过户费最低1元
                       /*
                       if v_transfer<1 then
                          v_transfer :=1;
                       end if;*/
                end if;

                v_stap_tax := 0;

                select count(fare_rate) into v_temp
                from t_sim_fare where sec_type = v_sec_type and fare_type='commission';

                if v_temp = 0 then
                   select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission' ;
                else
                   select  fare_rate  into v_commissoin_rate from t_sim_fare where sec_type = v_sec_type and fare_type='commission';
                end if;
                v_commissoin:=v_orderprice * (tmp_rq_debt.contracts_qty-nvl(tmp_rq_debt.returned_qty,0)-nvl(tmp_rq_debt.today_returned_qty,0)) * v_commissoin_rate;
                /*
                if v_commissoin<5 then
                   v_commissoin:=5;
                end if;*/

               -- 委托买券还券金额
               v_order_balance := (tmp_rq_debt.contracts_qty-nvl(tmp_rq_debt.returned_qty,0)-nvl(tmp_rq_debt.today_returned_qty,0)) * v_orderprice;
               v_total_balance := (tmp_rq_debt.contracts_qty-nvl(tmp_rq_debt.returned_qty,0)-nvl(tmp_rq_debt.today_returned_qty,0))*v_orderprice+v_transfer+v_stap_tax+v_commissoin;
               select sim_today_order_seq.nextval into v_order_num from dual;
               insert into T_SIM_TODAY_ORDER(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
                       values(v_order_num,tmp_rq_debt.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_rq_debt.market_id,tmp_rq_debt.stock_code,v_stockname,'9','2',tmp_rq_debt.contracts_qty-nvl(tmp_rq_debt.returned_qty,0)-nvl(tmp_rq_debt.today_returned_qty,0),v_orderprice,v_order_balance,v_stap_tax,0,'2',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
               select sim_exec_agge_seq.nextval into v_exec_agge_num from dual;
               insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,
                       trade_type,exec_qty,exec_price,stap_tax,commissoin,fare,total_balance,transfer_free,total_fare,hold_srlnum,bargain_balance)
                       values(v_exec_agge_num,v_order_num,tmp_rq_debt.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_rq_debt.market_id,
                       tmp_rq_debt.stock_code,v_stockname,'9',tmp_rq_debt.contracts_qty-nvl(tmp_rq_debt.returned_qty,0)-nvl(tmp_rq_debt.today_returned_qty,0),v_orderprice,v_stap_tax,v_commissoin,0,v_total_balance,v_transfer,v_stap_tax+v_commissoin+v_transfer,tmp_rq_debt.hold_srlnum,v_order_balance);
               update t_rzrq_credit_contracts t set t.contracts_state=1,t.today_returned_qty=nvl(t.today_returned_qty,0)+ (tmp_rq_debt.contracts_qty-nvl(tmp_rq_debt.returned_qty,0)-nvl(tmp_rq_debt.today_returned_qty,0)) where t.contracts_no=tmp_rq_debt.contracts_no;
               v_userable_balance := tmp_rq_debt.total_balance * (tmp_rq_debt.contracts_qty-nvl(tmp_rq_debt.returned_qty,0)-nvl(tmp_rq_debt.today_returned_qty,0))/tmp_rq_debt.exec_qty;
               update t_rzrq_account t set t.capital_balance=t.capital_balance-v_total_balance,t.usable_balance=t.usable_balance+(v_userable_balance-v_total_balance) where t.account_id=tmp_rq_debt.account_id;
             end loop;
             close c_rq_debt;

             --添加到平仓记录表
             insert into t_rzrq_account_forcesell(account_id,is_forcesell,create_date)
                values(tmp_account.account_id,1,to_char(sysdate,'yyyymmdd'));
             commit;
        end loop;
        close c_account;

  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  --po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_rzrq_compel_deal',0,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      --po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_rzrq_compel_deal',500,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      --po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_rzrq_compel_deal',500,v_err_msg);
      return;
end PROC_RZRQ_COMPEL_DEAL;
/
grant execute on SISANSHDATA.PROC_RZRQ_COMPEL_DEAL to SISANSHOPR;


prompt
prompt Creating procedure PROC_RZRQ_ENTRUST
prompt ====================================
prompt
create or replace procedure sisanshdata.proc_rzrq_entrust
(
   result_rc out     THINKIVE_ORA.ref_cursor,
   status_rc out     THINKIVE_ORA.ref_cursor,
   p_account_id      T_SIM_TODAY_ORDER.account_id%TYPE,  --入参:账户ID
   p_stock_code      T_SIM_TODAY_ORDER.stock_code%TYPE,  --入参:股票代码
   p_stock_name      T_SIM_TODAY_ORDER.stock_name%TYPE,  --入参:股票名称
   p_market_id       T_SIM_TODAY_ORDER.market_id%TYPE,   --入参:市场代码
   p_trade_type      T_SIM_TODAY_ORDER.trade_type%TYPE,  --入参:交易类型 参看数据字典
   p_order_qty       T_SIM_TODAY_ORDER.order_qty%TYPE,   --入参:委托交易数量(股)
   p_order_price     T_SIM_TODAY_ORDER.order_price%TYPE,  --入参:委托交易价格
   p_order_remark    T_SIM_ACCOUNT_ORDER_COMMENT.comment_content%TYPE, --入参：委托理由
   p_contract_no     t_rzrq_today_order.contract_no%type,     --入参：合约编号
   p_repayment_money t_sim_today_order.total_balance%type,  --入参：直接还款金额
   p_usable_margin   number,
   p_usable_repayment number
)
is
v_order_balance      number(16,2);   --委托金额
v_total_balance      number(16,2);   --交易金额（含交易费用）
v_stap_tax_rate      number(16,2);   --印花税率
v_stap_tax           number(16,2);   --印花税(卖出时收取)
v_transfer_free      number(16,2);    --过户费率 只有上海股票才会收取过户费
v_transfer           number(16,2);    --过户费
v_commissoin_rate    number(16,2);   --佣金率
v_commissoin         number(16,2);   --佣金率
v_highbuy            number(16,3);   --当日涨停价
v_lowsell            number(16,3);   --当日跌停价
v_openprice          number(16,3);   --当日开盘价
v_userable_num       number;         --持有股票可用数量
v_usable_capital   number(16,2);   --可用资金
v_sec_type           varchar(10);    --股票类型
v_temp               integer(4);     --临时计数变量
v_trade_date         varchar(8);     --委托交易时间
v_error_info         varchar(500);   --错误信息
v_serial_num         number;
v_rz_rate            number(5,2);    --融资保证金比例
v_rz_margin          number(16,2);   --融资保证金
v_rq_rate            number(5,2);    --融券保证金比例
v_rq_margin          number(16,2);   --融券保证金
v_total_need_repayment_qty  number;   --需要还券总数
begin
  open result_rc for select '委托下单' from dual;
  if p_account_id ='' or p_account_id is null then
     open status_rc for
     select '-10000' as rscode, '账户ID不能为空' as rsmsg from dual;
     return;
  end if;

  if p_trade_type ='' or p_trade_type is null then
     open status_rc for
     select '-10000' as rscode, '证券委托类型不能为空' as rsmsg from dual;
     return;
  end if;

  --融资融券交易类型为直接还款或直接还券处理
  if p_trade_type = '10' or p_trade_type = '11' then
     v_trade_date := getTradeDate;
     if p_trade_type = '10' then
       --直接还款
       BEGIN
          if p_repayment_money = '' or p_repayment_money is null then
             open status_rc for select '-10002' as rscode, '直接还款申请金额不能为空' as rsmsg from dual;
             return;
          end if;
          if p_repayment_money <=0 then
             open status_rc for select '-10002' as rscode, '直接还款申请金额需大于零' as rsmsg from dual;
             return;
          end if;
          --委托还款金额大于实际可用还款金额
          if p_repayment_money>p_usable_repayment then
             open status_rc for select '-10002' as rscode, '委托还款金额大于实际可用还款金额' as rsmsg from dual;
             return;
          end if;
          --记录委托信息
          select sim_today_order_seq.nextval into v_serial_num from dual;
          insert into t_sim_today_order(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,transfer_free,total_balance,total_fare,commissoin)
              values(v_serial_num,p_account_id,v_trade_date,to_char(sysdate,'hh24:mi:ss'),'','','',p_trade_type,'0',0,0,p_repayment_money,0,0,'0',0,p_repayment_money,0,0);
          if p_contract_no is not null then
             insert into t_rzrq_today_order(order_num,contract_no)values(v_serial_num,p_contract_no);
          end if;
          update t_rzrq_account set usable_balance =( usable_balance-p_repayment_money) where account_id = p_account_id;
          commit;
          open status_rc for select '0' as rscode, '直接还款委托下单成功,委托编号：'|| v_serial_num as rsmsg from dual;
          return;
       END;
     end if;
     --直接还券
     if p_trade_type = '11' then
        if p_stock_code ='' or p_stock_code is null then
          open status_rc for
            select '-10000' as rscode, '股票代码不能为空' as rsmsg from dual;
          return;
        end if;
        if p_market_id ='' or p_market_id is null then
          open status_rc for
            select '-10000' as rscode, '市场代码不能为空' as rsmsg from dual;
          return;
        end if;
        if p_order_qty ='' or p_order_qty is null then
          open status_rc for
            select '-10000' as rscode, '委托数量不能为空' as rsmsg from dual;
          return;
        end if;

        begin
           select sum(contracts_qty)-sum(returned_qty)-sum(today_returned_qty) into v_total_need_repayment_qty from t_rzrq_credit_contracts where market_id = p_market_id and stock_code = p_stock_code
             and account_id = p_account_id and contracts_type = '1';
           Exception
           when NO_DATA_FOUND then
           open status_rc for select '-10001' as rscode, '未找到('||p_stock_code||')对应的合约信息' as rsmsg from dual;
           return;
        end;

        if p_order_qty > v_total_need_repayment_qty then
          open status_rc for
            select '-10000' as rscode, '委托数量大于负债数量' as rsmsg from dual;
          return;
        end if;
        --记录委托信息
        select sim_today_order_seq.nextval into v_serial_num from dual;
        insert into t_sim_today_order(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,transfer_free,total_balance,total_fare,commissoin)
            values(v_serial_num,p_account_id,v_trade_date,to_char(sysdate,'hh24:mi:ss'),p_market_id,p_stock_code,p_stock_name,p_trade_type,'0',p_order_qty,0,0,0,0,'0',0,0,0,0);
        update t_sim_hold_stock set usable_qty = (usable_qty - p_order_qty) where stock_code = p_stock_code and account_id = p_account_id and market_id = p_market_id;
        commit;
        open status_rc for select '0' as rscode, '直接还券委托下单成功,委托编号：'|| v_serial_num as rsmsg from dual;
        return;
     end if;
  else
     if p_stock_code ='' or p_stock_code is null then
        open status_rc for
          select '-10000' as rscode, '股票代码不能为空' as rsmsg from dual;
        return;
     end if;

     if p_market_id ='' or p_market_id is null then
        open status_rc for
           select '-10000' as rscode, '市场代码不能为空' as rsmsg from dual;
        return;
     end if;

     if p_order_qty ='' or p_order_qty is null then
        open status_rc for
            select '-10000' as rscode, '委托数量不能为空' as rsmsg from dual;
        return;
     end if;
     if p_order_price ='' or p_order_price is null then
        open status_rc for
           select '-10000' as rscode, '委托价格不能为空' as rsmsg from dual;
        return;
     end if;

     if p_order_price = 0 then
        open status_rc for
          select '-10000' as rscode, '委托价格不能为零' as rsmsg from dual;
        return;
     end if;

     --禁止新股委托买卖
     if substr(p_stock_name,0,1) = 'n' or substr(p_stock_name,0,1) = 'N' then
        open status_rc for
          select '-10000' as rscode, '暂不支持新股买卖' as rsmsg from dual;
        return;
     end if;

     begin
     --获取当前委托股票的涨停价、跌停价、股票类型
     select highbuy_price,lowsell_price,sec_type,open_price into  v_highbuy,v_lowsell,v_sec_type,v_openprice
        from t_sim_information where stock_code = p_stock_code
        and market_id = p_market_id ;
     Exception
     when NO_DATA_FOUND then
       open status_rc for select '-10001' as rscode, '未找到('||p_stock_code||')当天证券信息' as rsmsg from dual;
       return;
     end;

    -- if v_openprice <= 0 then
    --    open status_rc for select '-10001' as rscode, '不允许买卖停牌股票!' as rsmsg from dual;
    --    return;
    -- end if;

     if p_order_price<v_lowsell then
        if p_trade_type='4' or p_trade_type='6' or p_trade_type='9' then
           open status_rc for select '-10002' as rscode, '委托买入价格不能小于跌停价格' as rsmsg from dual;
           return;
        else
           open status_rc for select '-10002' as rscode, '委托卖出价格不能小于跌停价格' as rsmsg from dual;
           return;
        end if;
     end if;

     if p_order_price>v_highbuy then
        if p_trade_type='4' or p_trade_type='6' or p_trade_type='9' then
           open status_rc for select '-10002' as rscode, '委托买入价格不能大于涨停价格' as rsmsg from dual;
           return;
        else
           open status_rc for select '-10002' as rscode, '委托卖出价格不能大于涨停价格' as rsmsg from dual;
           return;
        end if;
     end if;

     --获取委托日期
     v_trade_date := getTradeDate;

     v_transfer :=0;--过户费默认为0
     -- 获取买卖过户费
     if lower(p_market_id)='sh' then
        select count(fare_rate) into v_temp from t_sim_fare where sec_type = v_sec_type
          and fare_type='transfer_free';

        if v_temp=0 then
           select cur_value into v_transfer_free  from t_sim_sys_config where name='default_transfer_free';
        else
           select  fare_rate  into v_transfer_free from t_sim_fare where sec_type = v_sec_type
               and fare_type='transfer_free';
        end if;

        v_transfer :=p_order_qty*v_transfer_free;
        --过户费最低1元
        if v_transfer<1 then
           v_transfer :=1;
        end if;
     end if;

     --佣金获取开始
     select count(fare_rate) into v_temp from t_sim_fare where sec_type = v_sec_type and fare_type='commission';
     if v_temp = 0 then
        select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission'  ;
     else
        select  fare_rate  into v_commissoin_rate from t_sim_fare where sec_type = v_sec_type and fare_type='commission';
     end if;
     --佣金最低5元
     v_commissoin:=p_order_price*p_order_qty*v_commissoin_rate;
     if v_commissoin<5 then
        v_commissoin:=5;
     end if;
     --佣金获取结束

     --委托开始根据交易类型做相应处理

     if p_trade_type = '4' then
        --担保物买入
        BEGIN
          --委托买入金额
          v_order_balance:= p_order_qty*p_order_price;
          v_total_balance:= p_order_qty*p_order_price+v_commissoin+v_transfer;

          --资金可用金额（注：这里的可用金额包括已用作为担保金的现金）
          select usable_balance into v_usable_capital from t_rzrq_account where account_id = p_account_id;

          --委托买入金额大于可用金额
          if v_total_balance>v_usable_capital then
             open status_rc for select '-10002' as rscode, '可用资金不足' as rsmsg from dual;
             return;
          end if;

          --记录委托交易并修改账户的可用资金
          select sim_today_order_seq.nextval into v_serial_num from dual;
          insert into t_sim_today_order(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
              values(v_serial_num,p_account_id,v_trade_date,to_char(sysdate,'hh24:mi:ss'),p_market_id,p_stock_code,p_stock_name,p_trade_type,'0',p_order_qty,p_order_price,v_order_balance,0,0,'0',v_transfer,v_total_balance,v_transfer+v_commissoin,v_commissoin);
          if  p_order_remark is not null then
              insert into T_SIM_ACCOUNT_ORDER_COMMENT(serial_num,ACCOUNT_ID,COMMENT_CONTENT,COMMENT_DATE,COMMENT_TIME)
                 values(v_serial_num,p_account_id,p_order_remark,v_trade_date,to_char(sysdate,'hh24:mi:ss'));
          end if;
          update t_rzrq_account set usable_balance =( usable_balance-v_total_balance) where account_id = p_account_id;
          commit;
          open status_rc for select '0' as rscode, '普通买入下单成功,委托编号：'|| v_serial_num as rsmsg from dual;
          return;
       END;

     elsif p_trade_type = '5' then
       --担保物卖出
       BEGIN
          --印花税获取开始
          select count(fare_rate) into v_temp from t_sim_fare where  sec_type = v_sec_type and fare_type='staptax';
          if v_temp = 0 then
             select cur_value into v_stap_tax_rate from t_sim_sys_config where name='default_staptax'  ;
          else
             select  fare_rate  into v_stap_tax_rate from t_sim_fare where sec_type = v_sec_type and fare_type='staptax';
          end if;
          v_stap_tax := p_order_price*p_order_qty*v_stap_tax_rate;
          --印花税获取结束
          --股票可用数
          select usable_qty into v_userable_num from t_sim_hold_stock where stock_code = p_stock_code and account_id = p_account_id
            and market_id = p_market_id;

          --委托卖出数量大于持股数量
          if p_order_qty>v_userable_num then
             open status_rc for select '-10002' as rscode, '委托卖出数量不能大于实际持股数量' as rsmsg from dual;
             return;
          end if;

          -- 委托卖出金额
          v_order_balance := p_order_qty*p_order_price;
          v_total_balance := p_order_qty*p_order_price-v_transfer-v_stap_tax-v_commissoin;

          --记录委托交易并修改账户持有对应股票的可用数量
          select sim_today_order_seq.nextval into v_serial_num from dual;
          insert into t_sim_today_order(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
             values(v_serial_num,p_account_id,v_trade_date,to_char(sysdate,'hh24:mi:ss'),p_market_id,p_stock_code,p_stock_name,p_trade_type,'0',p_order_qty,p_order_price,v_order_balance,v_stap_tax,0,'0',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
          if p_order_remark is not null then
             insert into t_sim_account_order_comment(serial_num,ACCOUNT_ID,COMMENT_CONTENT,COMMENT_DATE,COMMENT_TIME)
                values(v_serial_num,p_account_id,p_order_remark,v_trade_date,to_char(sysdate,'hh24:mi:ss'));
          end if;
          update t_sim_hold_stock set usable_qty = (usable_qty - p_order_qty) where stock_code = p_stock_code and account_id = p_account_id and market_id = p_market_id;
          commit;
          open status_rc for select '0' as rscode, '普通卖出下单成功,委托编号：'|| v_serial_num as rsmsg from dual;
          return;
       END;
     elsif p_trade_type='6' then
       --融资买入
       BEGIN
          --融资买入金额
          v_order_balance:= p_order_qty*p_order_price;
          v_total_balance:= p_order_qty*p_order_price+v_commissoin+v_transfer;
          --融资保证金
          begin
            select rz_rate into v_rz_rate from t_rz_matter where stock_code = p_stock_code and market_id=p_market_id;
            Exception
            when NO_DATA_FOUND then
                 open status_rc for select '-10001' as rscode, '未找到('||p_stock_code||')当天融资信息' as rsmsg from dual;
                 return;
          end;
          v_rz_margin := v_total_balance * v_rz_rate;

          if v_rz_margin > p_usable_margin then
             open status_rc for select '-10002' as rscode, '委托融资买入金额大于可用保证金。' as rsmsg from dual;
             return;
          end if;

          --记录委托交易并修改账户的可用保证金
          select sim_today_order_seq.nextval into v_serial_num from dual;
          insert into t_sim_today_order(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
              values(v_serial_num,p_account_id,v_trade_date,to_char(sysdate,'hh24:mi:ss'),p_market_id,p_stock_code,p_stock_name,p_trade_type,'0',p_order_qty,p_order_price,v_order_balance,0,0,'0',v_transfer,v_total_balance,v_transfer+v_commissoin,v_commissoin);
          if  p_order_remark is not null then
              insert into t_sim_account_order_comment(serial_num,ACCOUNT_ID,COMMENT_CONTENT,COMMENT_DATE,COMMENT_TIME)
                 values(v_serial_num,p_account_id,p_order_remark,v_trade_date,to_char(sysdate,'hh24:mi:ss'));
          end if;
          insert into t_rzrq_today_order(order_num,freeze_margin)values(v_serial_num,v_rz_margin);
          commit;
          open status_rc for select '0' as rscode, '融资买入下单成功,委托编号：'|| v_serial_num as rsmsg from dual;
          return;
       END;
     elsif p_trade_type='7' then
       --融券卖出
       BEGIN
          --印花税获取开始
          select count(fare_rate) into v_temp from t_sim_fare where  sec_type = v_sec_type and fare_type='staptax';
          if v_temp = 0 then
             select cur_value into v_stap_tax_rate from t_sim_sys_config where name='default_staptax'  ;
          else
             select  fare_rate  into v_stap_tax_rate from t_sim_fare where sec_type = v_sec_type and fare_type='staptax';
          end if;
          v_stap_tax := p_order_price*p_order_qty*v_stap_tax_rate;
          --印花税获取结束

          -- 委托卖出金额
          v_order_balance := p_order_qty*p_order_price;
          v_total_balance := p_order_qty*p_order_price-v_transfer-v_stap_tax-v_commissoin;
          --融券保证金
          begin
            select rq_rate into v_rq_rate from t_rq_matter where stock_code = p_stock_code and market_id=p_market_id;
            Exception
            when NO_DATA_FOUND then
                 open status_rc for select '-10001' as rscode, '未找到('||p_stock_code||')当天融券信息' as rsmsg from dual;
                 return;
          end;
          v_rq_margin := v_order_balance * v_rq_rate;

          if v_rq_margin > p_usable_margin then
             open status_rc for select '-10002' as rscode, '委托融券卖出金额大于可用保证金。' as rsmsg from dual;
             return;
          end if;

          --记录委托记录
          select sim_today_order_seq.nextval into v_serial_num from dual;
          insert into t_sim_today_order(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
             values(v_serial_num,p_account_id,v_trade_date,to_char(sysdate,'hh24:mi:ss'),p_market_id,p_stock_code,p_stock_name,p_trade_type,'0',p_order_qty,p_order_price,v_order_balance,v_stap_tax,0,'0',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
          if p_order_remark is not null then
             insert into t_sim_account_order_comment(serial_num,ACCOUNT_ID,COMMENT_CONTENT,COMMENT_DATE,COMMENT_TIME)
                values(v_serial_num,p_account_id,p_order_remark,v_trade_date,to_char(sysdate,'hh24:mi:ss'));
          end if;
          insert into t_rzrq_today_order(order_num,freeze_margin)values(v_serial_num,v_rq_margin);
          commit;
          open status_rc for select '0' as rscode, '融券卖出下单成功,委托编号：'|| v_serial_num as rsmsg from dual;
          return;
       END;
     elsif p_trade_type = '8' then
       --卖券还款
       BEGIN
          --印花税获取开始
          select count(fare_rate) into v_temp from t_sim_fare where  sec_type = v_sec_type and fare_type='staptax';
          if v_temp = 0 then
             select cur_value into v_stap_tax_rate from t_sim_sys_config where name='default_staptax'  ;
          else
             select  fare_rate  into v_stap_tax_rate from t_sim_fare where sec_type = v_sec_type and fare_type='staptax';
          end if;
          v_stap_tax := p_order_price*p_order_qty*v_stap_tax_rate;
          --印花税获取结束
          --股票可用数
          select usable_qty into v_userable_num from t_sim_hold_stock where stock_code = p_stock_code and account_id = p_account_id
            and market_id = p_market_id;

          --委托卖出数量大于持股数量
          if p_order_qty>v_userable_num then
             open status_rc for select '-10002' as rscode, '委托卖出数量不能大于实际持股数量' as rsmsg from dual;
             return;
          end if;

          -- 委托卖出金额
          v_order_balance := p_order_qty*p_order_price;
          v_total_balance := p_order_qty*p_order_price-v_transfer-v_stap_tax-v_commissoin;

          --记录委托交易并修改账户持有对应股票的可用数量
          select sim_today_order_seq.nextval into v_serial_num from dual;
          insert into t_sim_today_order(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
             values(v_serial_num,p_account_id,v_trade_date,to_char(sysdate,'hh24:mi:ss'),p_market_id,p_stock_code,p_stock_name,p_trade_type,'0',p_order_qty,p_order_price,v_order_balance,v_stap_tax,0,'0',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
          if p_order_remark is not null then
             insert into t_sim_account_order_comment(serial_num,ACCOUNT_ID,COMMENT_CONTENT,COMMENT_DATE,COMMENT_TIME)
                values(v_serial_num,p_account_id,p_order_remark,v_trade_date,to_char(sysdate,'hh24:mi:ss'));
          end if;
          update t_sim_hold_stock set usable_qty = (usable_qty - p_order_qty) where stock_code = p_stock_code and account_id = p_account_id and market_id = p_market_id;
          if p_contract_no is not null then
             insert into t_rzrq_today_order(order_num,contract_no) values(v_serial_num,p_contract_no);
             commit;
          end if;
          open status_rc for select '0' as rscode, '卖券还款下单成功,委托编号：'|| v_serial_num as rsmsg from dual;
          return;
       END;
     elsif p_trade_type = '9' then
       --买券还券
       BEGIN
          select count(*) into v_temp from t_rzrq_credit_contracts t where t.market_id = p_market_id and t.stock_code=p_stock_code and t.account_id=p_account_id and t.contracts_type=1 and t.contracts_state=0;
          if v_temp = 0 then
             open status_rc for select '-10002' as rscode, '无对应的融券负债' as rsmsg from dual;
             return;
          end if;
          --委托买入金额
          v_order_balance:= p_order_qty*p_order_price;
          v_total_balance:= p_order_qty*p_order_price+v_commissoin+v_transfer;


          --委托买入金额大于可用还款金额
          if v_total_balance>p_usable_repayment then
             open status_rc for select '-10002' as rscode, '可用还款金额不足' as rsmsg from dual;
             return;
          end if;

          --记录委托交易并修改账户的可用还款资金
          select sim_today_order_seq.nextval into v_serial_num from dual;
          insert into t_sim_today_order(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
              values(v_serial_num,p_account_id,v_trade_date,to_char(sysdate,'hh24:mi:ss'),p_market_id,p_stock_code,p_stock_name,p_trade_type,'0',p_order_qty,p_order_price,v_order_balance,0,0,'0',v_transfer,v_total_balance,v_transfer+v_commissoin,v_commissoin);
          if  p_order_remark is not null then
              insert into T_SIM_ACCOUNT_ORDER_COMMENT(serial_num,ACCOUNT_ID,COMMENT_CONTENT,COMMENT_DATE,COMMENT_TIME)
                 values(v_serial_num,p_account_id,p_order_remark,v_trade_date,to_char(sysdate,'hh24:mi:ss'));
          end if;

          insert into t_rzrq_today_order(order_num,contract_no)values(v_serial_num,p_contract_no);
          commit;
          open status_rc for select '0' as rscode, '买券还券下单成功,委托编号：'|| v_serial_num as rsmsg from dual;
          return;
       END;
     end if;
  end if;
exception
   when others then
        rollback;
        v_error_info := 'proc_rzrq_entrust' ||
                    substr(sqlerrm(sqlcode), 1, 255);
        open status_rc for select '-10003' as rscode, v_error_info as rsmsg from dual;
end proc_rzrq_entrust;
/
grant execute on SISANSHDATA.PROC_RZRQ_ENTRUST to SISANSHOPR;


prompt
prompt Creating procedure PROC_YIELD_RANK_MATCH
prompt ========================================
prompt
create or replace procedure sisanshdata.proc_yield_rank_match
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  cursor c_now_match is
   select * from t_sim_activity where match_state=1;
  tmp_now_match c_now_match%rowtype;
  cursor c_match_account_day(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_sim_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(day_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_day c_match_account_day%rowtype;
  cursor c_match_account_week(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_sim_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(week_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_week c_match_account_week%rowtype;
  cursor c_match_account_month(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_sim_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(month_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_month c_match_account_month%rowtype;
  cursor c_match_account_total(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_sim_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(total_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_total c_match_account_total%rowtype;
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
  v_trade_dayrow       t_b_skrace_tradedate%rowtype;
  v_account_info       t_sim_account%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
      --大赛账户日排名
      open c_match_account_day(tmp_now_match.act_id);
      loop
         fetch c_match_account_day into tmp_match_account_day;
         exit when c_match_account_day%notfound;
         update t_sim_account set day_yield_rankings=tmp_match_account_day.rownum,
               day_change=nvl2(tmp_match_account_day.day_yield_rankings,0,tmp_match_account_day.day_yield_rankings-tmp_match_account_day.rownum)
               where account_id = tmp_match_account_day.account_id;
         commit;
      end loop;
      close c_match_account_day;
      --大赛账户周排名
      open c_match_account_week(tmp_now_match.act_id);
      loop
         fetch c_match_account_week into tmp_match_account_week;
         exit when c_match_account_week%notfound;
         update t_sim_account set week_yield_rankings=tmp_match_account_week.rownum,
               week_change=nvl2(tmp_match_account_week.week_yield_rankings,0,tmp_match_account_week.week_yield_rankings-tmp_match_account_week.rownum)
               where account_id = tmp_match_account_week.account_id;
         commit;
      end loop;
      close c_match_account_week;
      --大赛账户月排名
      open c_match_account_month(tmp_now_match.act_id);
      loop
         fetch c_match_account_month into tmp_match_account_month;
         exit when c_match_account_month%notfound;
         update t_sim_account set month_yield_rankings=tmp_match_account_month.rownum,
               month_change=nvl2(tmp_match_account_month.month_yield_rankings,0,tmp_match_account_month.month_yield_rankings-tmp_match_account_month.rownum)
               where account_id = tmp_match_account_month.account_id;
         commit;
      end loop;
      close c_match_account_month;
      --大赛账户总排名
      open c_match_account_total(tmp_now_match.act_id);
      loop
         fetch c_match_account_total into tmp_match_account_total;
         exit when c_match_account_total%notfound;
         update t_sim_account set total_yield_rankings=tmp_match_account_total.rownum,
               month_change=nvl2(tmp_match_account_total.total_yield_rankings,0,tmp_match_account_total.total_yield_rankings-tmp_match_account_total.rownum)
               where account_id = tmp_match_account_total.account_id;
         commit;
      end loop;
      close c_match_account_total;
    end;
    --统计大赛冠军
    select * into v_trade_dayrow from t_b_skrace_tradedate t where t.t_date=(select max(t_date) from t_b_skrace_tradedate where t_date<=tmp_now_match.end_date and is_trade=1) ;
    if to_char(sysdate,'yyyymmdd') = v_trade_dayrow.t_date then
       select * into v_account_info from t_sim_account where total_yield_rankings=1 and account_type=2 and act_id=tmp_now_match.act_id;
       insert into t_sim_hist_champion(account_id,total_earn,earn_rate,champion_type,create_date)
        values(v_account_info.account_id,v_account_info.total_earnings,v_account_info.total_yield,'2',to_char(sysdate,'yyyymmdd'));
    end if;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_yield_rank_match',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_match',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_match',po_retcod,v_err_msg);
      return;
end proc_yield_rank_match;
/
grant execute on SISANSHDATA.PROC_YIELD_RANK_MATCH to SISANSHOPR;


prompt
prompt Creating procedure PROC_YIELD_RANK_STOCK
prompt ========================================
prompt
create or replace procedure sisanshdata.proc_yield_rank_stock
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
cursor c_stock_rank_type is select t.rank_type from t_sim_account t where t.rank_type is not null group by t.rank_type;
tmp_stock_rank_type c_stock_rank_type%rowtype;
cursor c_stock_account_day(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_sim_account where account_type=1
  and pk_account=1 and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(day_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_day c_stock_account_day%rowtype;
cursor c_stock_account_week(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_sim_account where account_type=1
  and pk_account=1 and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType  order by nvl(week_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_week c_stock_account_week%rowtype;
cursor c_stock_account_month(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_sim_account where account_type=1
  and pk_account=1 and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(month_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_month c_stock_account_month%rowtype;
cursor c_stock_account_total(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_sim_account where account_type=1
  and pk_account=1 and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(total_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_total c_stock_account_total%rowtype;
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
v_week_end           varchar2(10);  --本周末
v_month_end          varchar2(10);  --本月末
v_trade_dayrow       t_b_skrace_tradedate%rowtype;
v_account_info       t_sim_account%rowtype;
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    open c_stock_rank_type;
    loop
    fetch c_stock_rank_type into tmp_stock_rank_type;
    exit when c_stock_rank_type%notfound;
      --模拟炒股日收益排名
      open c_stock_account_day(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_day into tmp_stock_account_day;
      exit when c_stock_account_day%notfound;
        update t_sim_account set day_yield_rankings=tmp_stock_account_day.rownum,
        day_change=nvl2(tmp_stock_account_day.day_yield_rankings,0,tmp_stock_account_day.day_yield_rankings-tmp_stock_account_day.rownum)
        where account_id = tmp_stock_account_day.account_id;
        commit;
      end loop;
      close c_stock_account_day;

      --模拟炒股周收益排名
      open c_stock_account_week(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_week into tmp_stock_account_week;
      exit when c_stock_account_week%notfound;
        update t_sim_account set week_yield_rankings=tmp_stock_account_week.rownum,
        week_change=nvl2(tmp_stock_account_week.week_yield_rankings,0,tmp_stock_account_week.week_yield_rankings-tmp_stock_account_week.rownum)
        where account_id = tmp_stock_account_week.account_id;
        commit;
      end loop;
      close c_stock_account_week;

      --模拟炒股月收益排名
      open c_stock_account_month(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_month into tmp_stock_account_month;
      exit when c_stock_account_month%notfound;
        update t_sim_account set month_yield_rankings=tmp_stock_account_month.rownum,
        month_change=nvl2(tmp_stock_account_month.month_yield_rankings,0,tmp_stock_account_month.month_yield_rankings-tmp_stock_account_month.rownum)
        where account_id = tmp_stock_account_month.account_id;
        commit;
      end loop;
      close c_stock_account_month;

      --模拟炒股总收益排名
      open c_stock_account_total(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_total into tmp_stock_account_total;
      exit when c_stock_account_total%notfound;
        update t_sim_account set total_yield_rankings=tmp_stock_account_total.rownum,
        total_change=nvl2(tmp_stock_account_total.total_yield_rankings,0,tmp_stock_account_total.total_yield_rankings-tmp_stock_account_total.rownum)
        where account_id = tmp_stock_account_total.account_id;
        commit;
      end loop;
      close c_stock_account_total;

      --每周最后一个交易日及每月最后一个交易日统计周冠军与月冠军
      v_week_end := getendweek;
      v_month_end := getendmonth;
      select * into v_trade_dayrow from t_b_skrace_tradedate t where t.t_date=(select max(t_date) from t_b_skrace_tradedate where t_date<=v_week_end and is_trade=1) ;
      if to_char(sysdate,'yyyymmdd') = v_trade_dayrow.t_date then
         select * into v_account_info from t_sim_account where week_yield_rankings=1 and account_type=1 and rank_type =tmp_stock_rank_type.rank_type ;
         insert into t_sim_hist_champion(account_id,total_earn,earn_rate,champion_type,create_date,rank_type)
          values(v_account_info.account_id,v_account_info.week_earnings,v_account_info.week_yield,'0',to_char(sysdate,'yyyymmdd'),tmp_stock_rank_type.rank_type);
         commit;
      end if;
      select * into v_trade_dayrow from t_b_skrace_tradedate t where t.t_date=(select max(t_date) from t_b_skrace_tradedate where t_date<=v_month_end and is_trade=1) ;
      if to_char(sysdate,'yyyymmdd') = v_trade_dayrow.t_date then
         select * into v_account_info from t_sim_account where month_yield_rankings=1 and account_type=1 and rank_type =tmp_stock_rank_type.rank_type;
         insert into t_sim_hist_champion(account_id,total_earn,earn_rate,champion_type,create_date,rank_type)
          values(v_account_info.account_id,v_account_info.month_earnings,v_account_info.month_yield,'1',to_char(sysdate,'yyyymmdd'),tmp_stock_rank_type.rank_type);
         commit;
      end if;
    end loop;
    close c_stock_rank_type;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_yield_rank_stock',po_retcod,v_err_msg);
    return;

EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_stock',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_stock',po_retcod,v_err_msg);
      return;
end proc_yield_rank_stock;
/
grant execute on SISANSHDATA.PROC_YIELD_RANK_STOCK to SISANSHOPR;


prompt
prompt Creating procedure RECOMMAND_DAILY_SETTLEMENT
prompt =============================================
prompt
create or replace procedure sisanshdata.recommand_daily_settlement
is
v_is_trade_date    varchar(10);      --是否是交易日
v_err_code         varchar2(10);     --错误代码
ve_exception       exception;        --自定义异常变量
v_err_msg          varchar2(1000);   --错误信息
begin
  select is_trade into v_is_trade_date from t_b_skrace_tradedate t where t.t_date=to_char(sysdate,'yyyymmdd');
  if v_is_trade_date = '' or v_is_trade_date is null or v_is_trade_date=0 then
    dbms_output.put_line('非交易日，不进行清算！');
    v_err_code:='0';
    v_err_msg := '非交易日，不进行清算！';
    proc_settlement_log('recommand_daily_settlement',v_err_code,v_err_msg);
    return;
  end if;

  --更新荐股状态
  recommend_stock_settlement.calculateRecommendStockEarn(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --计算荐股收益
  recommend_stock_settlement.statisticsCompleteRecmdStk(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --排名统计
  recommend_stock_settlement.statisticsRanks(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

EXCEPTION
    when ve_exception then
       return;
    WHEN no_data_found THEN
      DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
    when others then
      dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
end recommand_daily_settlement;
/
grant execute on SISANSHDATA.RECOMMAND_DAILY_SETTLEMENT to SISANSHOPR;


prompt
prompt Creating procedure RECOVER_DATA
prompt ===============================
prompt
create or replace procedure sisanshdata.recover_data
(
  p_recovery_date           varchar2
)
is
cursor c_account is select * from t_sim_account t where t.state=1 order by t.account_id;
tmp_account      c_account%rowtype;
v_begin_date     varchar2(30);
v_err_code             varchar2(30);
v_err_msg              varchar2(1000);
begin
   update t_sim_sys_config t set t.cur_value='on' where t.name='settle_flag';
   commit;
   open c_account;
   loop
   fetch c_account into tmp_account;
   exit when c_account%notfound;
     select to_char(to_date(min(t.create_date),'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') into v_begin_date from t_sim_hist_account t where t.account_id=tmp_account.account_id;
     if v_begin_date is null then
       select to_char(to_date(min(t.create_date),'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd') into v_begin_date from t_sim_account t where t.account_id=tmp_account.account_id;
     end if;
     if p_recovery_date > v_begin_date then
       v_begin_date := p_recovery_date;
     end if;
     proc_recovery_account(po_retcod => v_err_code,po_retmsg => v_err_msg,p_recovery_date => v_begin_date,p_recovery_accountid => tmp_account.account_id);
   end loop;
   close c_account;
   --stock_settlement.proc_yield_rank_stock(po_retcod => v_err_code);
   --stock_settlement.proc_yield_rank_match(po_retcod => v_err_code);
   update t_sim_sys_config t set t.cur_value='off' where t.name='settle_flag';
   commit;
end recover_data;
/
grant execute on SISANSHDATA.RECOVER_DATA to SISANSHOPR;


prompt
prompt Creating procedure RZRQ_DAILY_SETTLEMENT
prompt ========================================
prompt
create or replace procedure sisanshdata.rzrq_daily_settlement
is
v_is_trade_date    varchar(10);      --是否是交易日
v_err_code         varchar2(10);     --错误代码
ve_exception       exception;        --自定义异常变量
v_err_msg          varchar2(1000);   --错误信息
begin
  select is_trade into v_is_trade_date from t_b_skrace_tradedate t where t.t_date=to_char(sysdate,'yyyymmdd');
  if v_is_trade_date = '' or v_is_trade_date is null or v_is_trade_date=0 then
    dbms_output.put_line('非交易日，不进行清算！');
    v_err_code:='0';
    v_err_msg := '非交易日，不进行清算！';
    proc_settlement_log('rzrq_daily_settlement',v_err_code,v_err_msg);
    return;
  end if;

  --清算准备
  rzrq_settlement.rzrq_daily_settlement_prepare(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;
  --处理废单
  rzrq_settlement.rzrq_daily_nodeal_order(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --处理大赛最后一日强制平仓
  rzrq_settlement.rzrq_match_end_deal(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --清算账户净资产及股票市值
  rzrq_settlement.rzrq_daily_payoff(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --清算账户净收益
  rzrq_settlement.rzrq_earning_yield(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --计算模拟炒股账户排名
  rzrq_settlement.rzrq_yield_rank_stock(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --计算大赛账户排名
  rzrq_settlement.rzrq_yield_rank_match(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  rzrq_settlement.rzrq_contract_daily_interest(v_err_code);
   if v_err_code <> '0' then
     raise ve_exception;
  end if;

  --历史数据迁移
  rzrq_settlement.rzrq_history_transfer(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

  rzrq_settlement.rzrq_match_end_updateaccount(v_err_code);
  if v_err_code <> '0' then
     raise ve_exception;
  end if;

EXCEPTION
    when ve_exception then
       return;
    WHEN no_data_found THEN
      DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
    when others then
      dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;

end rzrq_daily_settlement;
/
grant execute on SISANSHDATA.RZRQ_DAILY_SETTLEMENT to SISANSHOPR;


prompt
prompt Creating package body RECOMMEND_STOCK_SETTLEMENT
prompt ================================================
prompt
create or replace package body sisanshdata.recommend_stock_settlement
is
function judgeRecmdTime(recmdTime in varchar2)
return varchar2
is
v_hour  number;
v_minute number;
v_minutes number;
begin
  v_hour := to_number(substr(recmdTime,12,2));
  v_minute := to_number(substr(recmdTime,15,2));
  v_minutes := v_hour * 60 + v_minute;
  if v_minutes >= 0  and v_minutes < 570 then
    return '0';
  elsif v_minutes >= 570 and v_minutes <=900 then
    return '2';
  elsif v_minutes >900 and v_minutes < 1439 then
    return '1';
  end if;
  return '0';
end judgeRecmdTime;

function isEndRecmdDay(afterDay number, recmdTerm varchar2, recmdTime varchar2) return varchar2
is
v_num   number;
begin
  v_num := 0;
  if recmdTerm = '0' then
    select count(*) into v_num from t_b_skrace_tradedate t where t.t_date>=to_char(to_date(recmdTime,'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd')
     and t.t_date<=to_char(sysdate,'yyyymmdd') and t.is_trade=1;
  elsif recmdTerm = '1' or recmdTerm = '2' then
    select count(*) into v_num from t_b_skrace_tradedate t where t.t_date>to_char(to_date(recmdTime,'yyyy-mm-dd hh24:mi:ss'),'yyyymmdd')
     and t.t_date<=to_char(sysdate,'yyyymmdd') and t.is_trade=1;
  end if;
  if v_num >= afterDay then
     return '1';
  else
     return '0';
  end if;
end isEndRecmdDay;

function userisranks(userid varchar2) return varchar2
is
v_count    number;
begin
  v_count := 0;
  select count(*) into v_count from t_recommend_statistics where user_id = userid;
  if v_count > 0 then
    return '0';
  else
    return '1';
  end if;
end userisranks;

procedure calculateRecommendStockEarn
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
cursor now_cmd_stock
  is select * from t_recommend_stock where state = 0;
tmp_now_cmd_stock  now_cmd_stock%rowtype;
v_recmdTerm  varchar2(1);
v_isendday   varchar2(1);
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
v_stock_info         t_sim_information%rowtype;
v_state              varchar2(1);
begin
   select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
   open now_cmd_stock;
   loop
     fetch now_cmd_stock into tmp_now_cmd_stock;
     exit when now_cmd_stock%notfound;
     v_recmdTerm := judgeRecmdTime(recmdTime => tmp_now_cmd_stock.begin_time);
     if v_recmdTerm >= 0 and v_recmdTerm is not null then
        v_isendday := isEndRecmdDay(afterDay => tmp_now_cmd_stock.expect_date,recmdTerm => v_recmdTerm,recmdTime => tmp_now_cmd_stock.begin_time);
        if v_isendday = '1' then
           select * into v_stock_info from t_sim_information where stock_code = tmp_now_cmd_stock.stock_code;
           if nvl(v_stock_info.now_price,v_stock_info.close_price) >= tmp_now_cmd_stock.target_price then
             v_state := '1';
           else
             v_state := '2';
           end if;
           update t_recommend_stock  set  state=v_state ,end_time = to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') where r_id = tmp_now_cmd_stock.r_id;
           commit;
        end if;
     end if;
   end loop;
   close now_cmd_stock;
   select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
   po_retcod := '0';
   v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
   proc_settlement_log('calculateRecommendStockEarn',po_retcod,v_err_msg);
   return;

EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('calculateRecommendStockEarn',po_retcod,v_err_msg);
      return;
    when others then
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('calculateRecommendStockEarn',po_retcod,v_err_msg);
      return;
end calculateRecommendStockEarn;

procedure statisticsCompleteRecmdStk
(
   po_retcod out varchar2
)
is
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
cursor c_completeRecmd(start_date varchar2,tmp_state varchar2,tmp_statetwo varchar2) is
  select count(*) total_num,user_id from t_recommend_stock t where substr(end_time,0,10)>=start_date and end_time is not null
    and state in(tmp_state,tmp_statetwo) group by user_id;
v_tmp_completeRecmd  c_completeRecmd%rowtype;
v_monday            varchar2(30);  --星期一
v_month_date         varchar2(30); --每月第一天
v_begin_date         varchar2(30); --开始时间
v_user_exist         varchar2(1);  --用户是否已经在排名中
cursor c_userranks is
  select * from t_recommend_statistics;
v_tmp_userranks      c_userranks%rowtype;
begin
   select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
   --周统计
   select to_char(next_day(sysdate-7,2),'yyyy-mm-dd') into v_monday from dual;
   --本周完成荐股总统计
   open c_completeRecmd(v_monday,'1','2');
   loop
     fetch c_completeRecmd into v_tmp_completeRecmd;
     exit when c_completeRecmd%notfound;
     v_user_exist := userisranks(userid => v_tmp_completeRecmd.User_Id);
     --用户存在
     if v_user_exist = 0 then
       update t_recommend_statistics set week_sum_count = v_tmp_completeRecmd.Total_Num where user_id=v_tmp_completeRecmd.User_Id;
     --用户不存在
     elsif v_user_exist = 1 then
       insert into t_recommend_statistics(rs_id,user_id,week_sum_count)values(t_recommend_statistics_seq.nextval,v_tmp_completeRecmd.User_Id,v_tmp_completeRecmd.Total_Num);
     end if;
   end loop;
   close c_completeRecmd;
   commit;
   --本周完成荐股成功统计
   open c_completeRecmd(v_monday,'1','');
   loop
     fetch c_completeRecmd into v_tmp_completeRecmd;
     exit when c_completeRecmd%notfound;
     v_user_exist := userisranks(userid => v_tmp_completeRecmd.User_Id);
     --用户存在
     if v_user_exist = 0 then
       update t_recommend_statistics set week_sum_right_count = v_tmp_completeRecmd.Total_Num where user_id=v_tmp_completeRecmd.User_Id;
     --用户不存在
     elsif v_user_exist = 1 then
       insert into t_recommend_statistics(rs_id,user_id,week_sum_right_count)values(t_recommend_statistics_seq.nextval,v_tmp_completeRecmd.User_Id,v_tmp_completeRecmd.Total_Num);
     end if;
   end loop;
   close c_completeRecmd;
   commit;

   --月统计
   select to_char(last_day(add_months(sysdate,-1))+1,'yyyy-mm-dd') into v_month_date from dual;
   --本月完成荐股总统计
   open c_completeRecmd(v_month_date,'1','2');
   loop
     fetch c_completeRecmd into v_tmp_completeRecmd;
     exit when c_completeRecmd%notfound;
     v_user_exist := userisranks(userid => v_tmp_completeRecmd.User_Id);
     --用户存在
     if v_user_exist = 0 then
       update t_recommend_statistics set month_sum_count = v_tmp_completeRecmd.Total_Num where user_id=v_tmp_completeRecmd.User_Id;
     --用户不存在
     elsif v_user_exist = 1 then
       insert into t_recommend_statistics(rs_id,user_id,month_sum_count)values(t_recommend_statistics_seq.nextval,v_tmp_completeRecmd.User_Id,v_tmp_completeRecmd.Total_Num);
     end if;
   end loop;
   close c_completeRecmd;
   commit;
   --本月完成荐股成功统计
   open c_completeRecmd(v_month_date,'1','');
   loop
     fetch c_completeRecmd into v_tmp_completeRecmd;
     exit when c_completeRecmd%notfound;
     v_user_exist := userisranks(userid => v_tmp_completeRecmd.User_Id);
     --用户存在
     if v_user_exist = 0 then
       update t_recommend_statistics set month_sum_right_count = v_tmp_completeRecmd.Total_Num where user_id=v_tmp_completeRecmd.User_Id;
     --用户不存在
     elsif v_user_exist = 1 then
       insert into t_recommend_statistics(rs_id,user_id,month_sum_right_count)values(t_recommend_statistics_seq.nextval,v_tmp_completeRecmd.User_Id,v_tmp_completeRecmd.Total_Num);
     end if;
   end loop;
   close c_completeRecmd;
   commit;
   --累计统计
   select substr(min(end_time),0,10) into v_begin_date  from t_recommend_stock ;
   --累计完成荐股总统计
   open c_completeRecmd(v_begin_date,'1','2');
   loop
     fetch c_completeRecmd into v_tmp_completeRecmd;
     exit when c_completeRecmd%notfound;
     v_user_exist := userisranks(userid => v_tmp_completeRecmd.User_Id);
     --用户存在
     if v_user_exist = 0 then
       update t_recommend_statistics set total_sum_count = v_tmp_completeRecmd.Total_Num where user_id=v_tmp_completeRecmd.User_Id;
     --用户不存在
     elsif v_user_exist = 1 then
       insert into t_recommend_statistics(rs_id,user_id,total_sum_count)values(t_recommend_statistics_seq.nextval,v_tmp_completeRecmd.User_Id,v_tmp_completeRecmd.Total_Num);
     end if;
   end loop;
   close c_completeRecmd;
   commit;
   --累计完成荐股成功统计
   open c_completeRecmd(v_begin_date,'1','');
   loop
     fetch c_completeRecmd into v_tmp_completeRecmd;
     exit when c_completeRecmd%notfound;
     v_user_exist := userisranks(userid => v_tmp_completeRecmd.User_Id);
     --用户存在
     if v_user_exist = 0 then
       update t_recommend_statistics set total_sum_right_count = v_tmp_completeRecmd.Total_Num where user_id=v_tmp_completeRecmd.User_Id;
     --用户不存在
     elsif v_user_exist = 1 then
       insert into t_recommend_statistics(rs_id,user_id,total_sum_right_count)values(t_recommend_statistics_seq.nextval,v_tmp_completeRecmd.User_Id,v_tmp_completeRecmd.Total_Num);
     end if;
   end loop;
   close c_completeRecmd;
   commit;

   --计算正确率
   open c_userranks;
   loop
     fetch c_userranks into v_tmp_userranks;
     exit when c_userranks%notfound;
     --周正确率
     if v_tmp_userranks.week_sum_count = 0 then
       update t_recommend_statistics set week_sum_rate = null where rs_id = v_tmp_userranks.rs_id;
     elsif v_tmp_userranks.week_sum_count >0 then
       update t_recommend_statistics set week_sum_rate = v_tmp_userranks.week_sum_right_count*100/v_tmp_userranks.week_sum_count  where rs_id = v_tmp_userranks.rs_id;
     end if;

     --月正确率
     if v_tmp_userranks.total_sum_count = 0 then
       update t_recommend_statistics set month_sum_rate = null where rs_id = v_tmp_userranks.rs_id;
     elsif v_tmp_userranks.total_sum_count >0 then
       update t_recommend_statistics set month_sum_rate = v_tmp_userranks.month_sum_right_count*100/v_tmp_userranks.month_sum_count  where rs_id = v_tmp_userranks.rs_id;
     end if;

     --总正确率
     if v_tmp_userranks.total_sum_count = 0 then
       update t_recommend_statistics set total_sum_rate = null where rs_id = v_tmp_userranks.rs_id;
     elsif v_tmp_userranks.total_sum_count >0 then
       update t_recommend_statistics set total_sum_rate = v_tmp_userranks.total_sum_right_count*100/v_tmp_userranks.total_sum_count  where rs_id = v_tmp_userranks.rs_id;
     end if;
   end loop;
   close c_userranks;
   commit;

   select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
   po_retcod := '0';
   v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
   proc_settlement_log('statisticsCompleteRecmdStk',po_retcod,v_err_msg);
   return;
EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('statisticsCompleteRecmdStk',po_retcod,v_err_msg);
      return;
    when others then
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('statisticsCompleteRecmdStk',po_retcod,v_err_msg);
      return;
end statisticsCompleteRecmdStk;

procedure statisticsRanks
(
    po_retcod out varchar2
)
is
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
cursor c_user_ranks_week is
  select rownum,rs_id,week_sum_rate from (select t.rs_id, t.week_sum_rate from t_recommend_statistics t where t.week_sum_rate is not null order by t.week_sum_rate desc,t.rs_id);
v_tmp_ranks_week     c_user_ranks_week%rowtype;

cursor c_user_ranks_month is
  select rownum,rs_id,month_sum_rate from (select t.rs_id, t.month_sum_rate from t_recommend_statistics t where t.month_sum_rate is not null order by t.month_sum_rate desc,t.rs_id);
v_tmp_ranks_month     c_user_ranks_month%rowtype;

cursor c_user_ranks_total is
  select rownum,rs_id,total_sum_rate from (select t.rs_id, t.total_sum_rate from t_recommend_statistics t where t.total_sum_rate is not null order by t.total_sum_rate desc,t.rs_id);
v_tmp_ranks_total     c_user_ranks_total%rowtype;

begin
   select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
   --周排名
   open c_user_ranks_week;
   loop
     fetch c_user_ranks_week into v_tmp_ranks_week;
     exit when c_user_ranks_week%notfound;
     update t_recommend_statistics set week_rank = v_tmp_ranks_week.rownum where rs_id = v_tmp_ranks_week.rs_id;
   end loop;
   close c_user_ranks_week;
   commit;
   --月排名
   open c_user_ranks_month;
   loop
     fetch c_user_ranks_month into v_tmp_ranks_month;
     exit when c_user_ranks_month%notfound;
     update t_recommend_statistics set month_rank = v_tmp_ranks_month.rownum where rs_id = v_tmp_ranks_month.rs_id;
   end loop;
   close c_user_ranks_month;
   commit;
   --总排名
   open c_user_ranks_total;
   loop
     fetch c_user_ranks_total into v_tmp_ranks_total;
     exit when c_user_ranks_total%notfound;
     update t_recommend_statistics set total_rank = v_tmp_ranks_total.rownum where rs_id = v_tmp_ranks_total.rs_id;
   end loop;
   close c_user_ranks_total;
   commit;
   select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
   po_retcod := '0';
   v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
   proc_settlement_log('statisticsRanks',po_retcod,v_err_msg);
   return;
EXCEPTION
    WHEN no_data_found THEN
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('statisticsRanks',po_retcod,v_err_msg);
      return;
    when others then
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('statisticsRanks',po_retcod,v_err_msg);
      return;
end statisticsRanks;

end recommend_stock_settlement;
/
grant execute on SISANSHDATA.RECOMMEND_STOCK_SETTLEMENT to SISANSHOPR;


prompt
prompt Creating package body RZRQ_SETTLEMENT
prompt =====================================
prompt
create or replace package body sisanshdata.rzrq_settlement
is

function getBetweenDate(startDate varchar2) return varchar2 is
  v_date    varchar2(10);
begin
  select round(sysdate-to_date(startDate,'yyyy-MM-dd hh24:mi:ss')) into v_date from dual;
  return v_date;
end getBetweenDate;

procedure rzrq_daily_settlement_prepare
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_lsw_trade_date     varchar2(30);   --上一个周五
  v_lsm_trade_date     varchar2(30);   --上月最后一天
  v_ls_trade_date      varchar2(30);   --上个交易日
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    delete from t_rzrq_settlement_account where create_date = to_char(sysdate,'yyyymmdd');    --防止重复清算，造成 v_ls_trade_date=sysdate；
    select max(t.t_date) into v_ls_trade_date from t_b_skrace_tradedate t where t.t_date<to_char(sysdate,'yyyymmdd') and t.is_trade=1;--查询上一个交易日
    v_lsw_trade_date := getlwtradedate();     --获取上周最后一个交易日
    v_lsm_trade_date := getlmtradedate();     --获取上月最后一个交易日
    delete from t_rzrq_settlement_account t where t.create_date not in(v_ls_trade_date,v_lsw_trade_date,v_lsm_trade_date);
    commit;
    /*插入没有历史数据的账号*/
    insert into t_rzrq_settlement_account(account_id, money_id,capital_balance, financing_loan, securities_loan, total_assets, total_market,create_date,usable_balance, net_assets, total_earnings, total_yield, total_yield_rankings, week_earnings, week_yield, week_yield_rankings, month_earnings, month_yield, month_yield_rankings, day_earnings, day_yield, day_yield_rankings, total_change, month_change, week_change, day_change, rank_type)
      select account_id, money_id, capital_balance, financing_loan, securities_loan, total_assets, total_market, v_ls_trade_date, usable_balance, net_assets, total_earnings, total_yield, total_yield_rankings, week_earnings, week_yield, week_yield_rankings, month_earnings, month_yield, month_yield_rankings, day_earnings, day_yield, day_yield_rankings, total_change, month_change, week_change, day_change, rank_type
      from t_rzrq_account where account_id not in (select account_id from t_rzrq_settlement_account a where a.create_date=v_ls_trade_date) ;
      commit;
    insert into t_rzrq_settlement_account(account_id, money_id,capital_balance, financing_loan, securities_loan, total_assets, total_market,create_date,usable_balance, net_assets, total_earnings, total_yield, total_yield_rankings, week_earnings, week_yield, week_yield_rankings, month_earnings, month_yield, month_yield_rankings, day_earnings, day_yield, day_yield_rankings, total_change, month_change, week_change, day_change, rank_type)
      select account_id, money_id, capital_balance, financing_loan, securities_loan, total_assets, total_market, v_lsw_trade_date, usable_balance, net_assets, total_earnings, total_yield, total_yield_rankings, week_earnings, week_yield, week_yield_rankings, month_earnings, month_yield, month_yield_rankings, day_earnings, day_yield, day_yield_rankings, total_change, month_change, week_change, day_change, rank_type
      from t_rzrq_account where account_id not in (select account_id from t_rzrq_settlement_account a where a.create_date=v_lsw_trade_date) ;
      commit;
    insert into t_rzrq_settlement_account(account_id, money_id,capital_balance, financing_loan, securities_loan, total_assets, total_market,create_date,usable_balance, net_assets, total_earnings, total_yield, total_yield_rankings, week_earnings, week_yield, week_yield_rankings, month_earnings, month_yield, month_yield_rankings, day_earnings, day_yield, day_yield_rankings, total_change, month_change, week_change, day_change, rank_type)
      select account_id, money_id, capital_balance, financing_loan, securities_loan, total_assets, total_market, v_lsm_trade_date, usable_balance, net_assets, total_earnings, total_yield, total_yield_rankings, week_earnings, week_yield, week_yield_rankings, month_earnings, month_yield, month_yield_rankings, day_earnings, day_yield, day_yield_rankings, total_change, month_change, week_change, day_change, rank_type
      from t_rzrq_account where account_id not in (select account_id from t_rzrq_settlement_account a where a.create_date=v_lsm_trade_date) ;
      commit;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('rzrq_daily_settlement_prepare',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN

      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_daily_settlement_prepare',po_retcod,v_err_msg);
      return;
    when others then
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_daily_settlement_prepare',po_retcod,v_err_msg);
      return;
end rzrq_daily_settlement_prepare;

procedure rzrq_daily_nodeal_order
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_trade_type VARCHAR(10);                            --委托类型
  v_order_total_balance number(16,2);                  --委托总金额
  v_order_total_qty   number;                          --委托数量
  cursor c_order is
  select t.* from t_sim_today_order t,t_rzrq_account b where t.account_id=b.account_id and t.deal_flag != 2 order by order_date,order_time; --今日未处理的委托
  tmp_order c_order%rowtype;
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    --处理未处理的委托
    open c_order;
    loop
      fetch c_order into tmp_order;
      exit when c_order%notfound;
      v_trade_type := tmp_order.trade_type;
      --信用买入、直接还款
      if v_trade_type='4' or v_trade_type='10' then
        v_order_total_balance := tmp_order.total_balance-nvl(tmp_order.bargain_balance,0);
        update t_rzrq_account t set usable_balance=usable_balance+v_order_total_balance where account_id=tmp_order.account_id ;
        update t_sim_today_order set trade_status=nvl2(tmp_order.bargain_qty,6,5),deal_flag=2 where serial_num=tmp_order.serial_num;
      --信用卖出、卖券还款、直接还券
      elsif v_trade_type = '5' or v_trade_type='8' or v_trade_type = '11' then
        v_order_total_qty := tmp_order.order_qty- nvl(tmp_order.bargain_qty,0);
        update t_sim_hold_stock  set usable_qty=usable_qty+v_order_total_qty where account_id=tmp_order.account_id
         and market_id=tmp_order.market_id and stock_code=tmp_order.stock_code;
        update t_sim_today_order set trade_status=nvl2(tmp_order.bargain_qty,6,5),deal_flag=2 where serial_num=tmp_order.serial_num;
      --融资买入、融券卖出
      elsif v_trade_type = '6' or v_trade_type = '7' or v_trade_type='9'  then
        update t_sim_today_order set trade_status=nvl2(tmp_order.bargain_qty,6,5),deal_flag=2 where serial_num=tmp_order.serial_num;
      end if;
      commit;
    end loop;
    close c_order;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('rzrq_daily_nodeal_order',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_daily_nodeal_order',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_daily_nodeal_order',po_retcod,v_err_msg);
      return;
end rzrq_daily_nodeal_order;

procedure rzrq_match_end_deal
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_order_num          number;    --委托编号
  v_exec_agge_num      number;    --成交编号
  v_hist_hold_num      number;    --历史持仓编号
  v_order_balance      number(16,2);   --委托金额
  v_total_balance      number(16,2);   --交易金额（含交易费用）
  v_stap_tax_rate      number(16,4);   --印花税率
  v_stap_tax           number(16,2);   --印花税(卖出时收取)
  v_transfer_free      number(16,4);    --过户费率 只有上海股票才会收取过户费
  v_transfer           number(16,2);    --过户费
  v_commissoin_rate    number(16,4);   --佣金率
  v_commissoin         number(16,2);   --佣金率
  v_temp               integer(4);     --临时计数变量
  v_sec_type           varchar(10);    --股票类型
  v_highbuy            number(16,3);   --当日涨停价
  v_lowsell            number(16,3);   --当日跌停价
  v_nowprice           number(16,3);   --现价
  v_closeprice         number(16,3);   --收盘价
  v_orderprice         number(16,3);   --委托价
  v_stockname          varchar2(30);   --股票名称
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time                  varchar2(20);             --存储过程执行结束时间
  v_all_sell_balance   number(16,2);
  v_rz_debt      number(16,2);                         --融资负债
  v_userable_balance   number(16,2);          --融券卖出所得
  cursor c_now_match is
   select act_id, end_date from t_sim_activity where match_state=1 and activity_trade_type=1;
  tmp_now_match c_now_match%rowtype;
  cursor c_match_account_holdstock(p_account_id varchar2) is
   select * from t_sim_hold_stock  where account_id = p_account_id;
  tmp_match_account_holdstock c_match_account_holdstock%rowtype;
  cursor c_match_account(p_act_id varchar2) is
   select * from t_rzrq_account where act_id=p_act_id and state=1;
  tmp_match_account c_match_account%rowtype;
  cursor c_match_rq_debt(p_account_id varchar2) is
   select * from (select a.*,b.contracts_no,b.contracts_qty,b.returned_qty,b.today_returned_qty,b.create_time from t_sim_exec_collect  a,t_rzrq_credit_contracts b  where a.order_srlnum=b.order_no and b.contracts_state=0 and b.contracts_type=1
     union all select a.*,b.contracts_no,b.contracts_qty,b.returned_qty,b.today_returned_qty ,b.create_time from  t_sim_hist_exec_collect a,t_rzrq_credit_contracts b  where a.order_srlnum=b.order_no and b.contracts_state=0 and b.contracts_type=1) where 1=1
     and account_id = p_account_id;
  tmp_match_rq_debt c_match_rq_debt%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
      --如果是比赛的最后一天，强制卖出持仓的股票，并按收盘价成交
      if tmp_now_match.end_date<=to_char(sysdate,'yyyymmdd') then
        open c_match_account(tmp_now_match.act_id);
        loop
          fetch c_match_account into tmp_match_account;
          exit when c_match_account%notfound;
             select sum(a.contracts_balance-nvl(a.returned_balance,0)-nvl(a.today_returned_balance,0)) into v_rz_debt from t_rzrq_credit_contracts a where a.contracts_state=0 and a.contracts_type=0 and a.account_id=tmp_match_account.account_id;
             v_all_sell_balance :=0;
             --内循环
             open c_match_account_holdstock(tmp_match_account.account_id);
             loop
               fetch c_match_account_holdstock into tmp_match_account_holdstock;
               exit when c_match_account_holdstock%notfound;

               --获取当前委托股票的涨停价、跌停价、股票类型
               select Highbuy_price,Lowsell_price,sec_type,now_price,close_price,stock_name into  v_highbuy,v_lowsell,v_sec_type,v_nowprice,v_closeprice,v_stockname
                      from t_sim_information where stock_code = tmp_match_account_holdstock.stock_code and market_id = tmp_match_account_holdstock.market_id ;
                if v_nowprice != 0 then
                   v_orderprice :=v_nowprice;
                else
                   v_orderprice :=v_closeprice;
                end if;

                v_transfer :=0;--过户费默认为0
                 -- 获取买卖过户费
                if lower(tmp_match_account_holdstock.market_id)='sh' then
                       select count(fare_rate) into v_temp
                       from t_sim_fare
                       where sec_type = v_sec_type
                       and fare_type='transfer_free';

                       if v_temp=0 then
                         select cur_value into v_transfer_free  from t_sim_sys_config where name='default_transfer_free';
                         else
                         select  fare_rate  into v_transfer_free
                         from t_sim_fare
                         where sec_type = v_sec_type
                         and fare_type='transfer_free';
                       end if;

                       v_transfer :=tmp_match_account_holdstock.usable_qty*v_transfer_free;
                       --过户费最低1元
                       /*
                       if v_transfer<1 then
                          v_transfer :=1;
                       end if;*/
                end if;
                select count(fare_rate) into v_temp from t_sim_fare where  sec_type = v_sec_type and fare_type='staptax';

                if v_temp = 0 then
                   select cur_value into v_stap_tax_rate from t_sim_sys_config where name='default_staptax'  ;
                else
                   select  fare_rate  into v_stap_tax_rate from t_sim_fare where sec_type = v_sec_type and fare_type='staptax';
                end if;

                v_stap_tax := v_orderprice * tmp_match_account_holdstock.usable_qty * v_stap_tax_rate;

                select count(fare_rate) into v_temp
                from t_sim_fare where sec_type = v_sec_type and fare_type='commission';

                if v_temp = 0 then
                   select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission' ;
                else
                   select  fare_rate  into v_commissoin_rate from t_sim_fare where sec_type = v_sec_type and fare_type='commission';
                end if;
                v_commissoin:=v_orderprice * tmp_match_account_holdstock.usable_qty * v_commissoin_rate;
                /*
                if v_commissoin<5 then
                   v_commissoin:=5;
                end if;*/

               -- 委托卖出金额
               v_order_balance := tmp_match_account_holdstock.usable_qty * v_orderprice;
               v_total_balance := tmp_match_account_holdstock.usable_qty*v_orderprice-v_transfer-v_stap_tax-v_commissoin;
               select sim_today_order_seq.nextval into v_order_num from dual;
               insert into T_SIM_TODAY_ORDER(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
                       values(v_order_num,tmp_match_account_holdstock.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_account_holdstock.market_id,tmp_match_account_holdstock.stock_code,v_stockname,'8','2',tmp_match_account_holdstock.usable_qty,v_orderprice,v_order_balance,v_stap_tax,0,'2',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
               select sim_exec_agge_seq.nextval into v_exec_agge_num from dual;
               insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,
                       trade_type,exec_qty,exec_price,stap_tax,commissoin,fare,total_balance,transfer_free,total_fare,hold_srlnum,bargain_balance)
                       values(v_exec_agge_num,v_order_num,tmp_match_account_holdstock.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_account_holdstock.market_id,
                       tmp_match_account_holdstock.stock_code,v_stockname,'8',tmp_match_account_holdstock.usable_qty,v_orderprice,v_stap_tax,v_commissoin,0,v_total_balance,v_transfer,v_stap_tax+v_commissoin+v_transfer,tmp_match_account_holdstock.serial_num,v_order_balance);
               delete from t_sim_hold_stock  where serial_num=tmp_match_account_holdstock.serial_num;
               select sim_hist_hold_stock_seq.nextval into v_hist_hold_num from dual;
               insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,
                      create_date,hold_srlnum,total_qty,usable_qty,cost_price)
                      values(v_hist_hold_num,tmp_match_account_holdstock.account_id,tmp_match_account_holdstock.market_id,tmp_match_account_holdstock.stock_code,
                      to_char(sysdate,'yyyymmdd hh24:mi:ss'),tmp_match_account_holdstock.serial_num,0,0,0);
               v_all_sell_balance := v_all_sell_balance + v_total_balance;
             end loop;
             close c_match_account_holdstock;
             --更改融资负债状态
             update t_rzrq_credit_contracts t set t.today_returned_balance=nvl(t.today_returned_balance,0)+(t.contracts_balance-nvl(t.returned_balance,0)-nvl(t.today_returned_balance,0)) where t.account_id=tmp_match_account.account_id;
             if v_rz_debt > v_all_sell_balance then
               select sim_today_order_seq.nextval into v_order_num from dual;
               insert into T_SIM_TODAY_ORDER(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
                       values(v_order_num,tmp_match_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),'','','','10','2',0,0,v_rz_debt-v_all_sell_balance,0,0,'2',0,v_rz_debt-v_all_sell_balance,0,0);
               select sim_exec_agge_seq.nextval into v_exec_agge_num from dual;
               insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,
                       trade_type,exec_qty,exec_price,stap_tax,commissoin,fare,total_balance,transfer_free,total_fare,hold_srlnum,bargain_balance)
                       values(v_exec_agge_num,v_order_num,tmp_match_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),'',
                       '','','10',0,0,0,0,0,v_rz_debt-v_all_sell_balance,0,0,'',v_rz_debt-v_all_sell_balance);
               update t_rzrq_account set capital_balance= capital_balance - (v_rz_debt-v_all_sell_balance),  usable_balance= usable_balance-(v_rz_debt-v_all_sell_balance) where account_id= tmp_match_account.account_id;
             else
               update t_rzrq_account set capital_balance= capital_balance + (v_all_sell_balance-v_rz_debt),  usable_balance= usable_balance+(v_all_sell_balance-v_rz_debt) where account_id= tmp_match_account.account_id;
             end if;

             --融券负债内循环
             open c_match_rq_debt(tmp_match_account.account_id);
             loop
               fetch c_match_rq_debt into tmp_match_rq_debt;
               exit when c_match_rq_debt%notfound;

               --获取当前委托股票的涨停价、跌停价、股票类型
               select Highbuy_price,Lowsell_price,sec_type,now_price,close_price,stock_name into  v_highbuy,v_lowsell,v_sec_type,v_nowprice,v_closeprice,v_stockname
                      from t_sim_information where stock_code = tmp_match_rq_debt.stock_code and market_id = tmp_match_rq_debt.market_id ;
                if v_nowprice != 0 then
                   v_orderprice :=v_nowprice;
                else
                   v_orderprice :=v_closeprice;
                end if;

                v_transfer :=0;--过户费默认为0
                 -- 获取买卖过户费
                if lower(tmp_match_rq_debt.market_id)='sh' then
                       select count(fare_rate) into v_temp
                       from t_sim_fare
                       where sec_type = v_sec_type
                       and fare_type='transfer_free';

                       if v_temp=0 then
                         select cur_value into v_transfer_free  from t_sim_sys_config where name='default_transfer_free';
                         else
                         select  fare_rate  into v_transfer_free
                         from t_sim_fare
                         where sec_type = v_sec_type
                         and fare_type='transfer_free';
                       end if;

                       v_transfer :=(tmp_match_rq_debt.contracts_qty-nvl(tmp_match_rq_debt.returned_qty,0)-nvl(tmp_match_rq_debt.today_returned_qty,0))*v_transfer_free;
                       --过户费最低1元
                       /*
                       if v_transfer<1 then
                          v_transfer :=1;
                       end if;*/
                end if;


                v_stap_tax := 0;

                select count(fare_rate) into v_temp
                from t_sim_fare where sec_type = v_sec_type and fare_type='commission';

                if v_temp = 0 then
                   select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission' ;
                else
                   select  fare_rate  into v_commissoin_rate from t_sim_fare where sec_type = v_sec_type and fare_type='commission';
                end if;
                v_commissoin:=v_orderprice * (tmp_match_rq_debt.contracts_qty-nvl(tmp_match_rq_debt.returned_qty,0)-nvl(tmp_match_rq_debt.today_returned_qty,0)) * v_commissoin_rate;
                /*
                if v_commissoin<5 then
                   v_commissoin:=5;
                end if;*/

               -- 委托买券还券金额
               v_order_balance := (tmp_match_rq_debt.contracts_qty-nvl(tmp_match_rq_debt.returned_qty,0)-nvl(tmp_match_rq_debt.today_returned_qty,0)) * v_orderprice;
               v_total_balance := (tmp_match_rq_debt.contracts_qty-nvl(tmp_match_rq_debt.returned_qty,0)-nvl(tmp_match_rq_debt.today_returned_qty,0))*v_orderprice+v_transfer+v_stap_tax+v_commissoin;
               select sim_today_order_seq.nextval into v_order_num from dual;
               insert into T_SIM_TODAY_ORDER(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
                       values(v_order_num,tmp_match_rq_debt.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_rq_debt.market_id,tmp_match_rq_debt.stock_code,v_stockname,'9','2',tmp_match_rq_debt.contracts_qty-nvl(tmp_match_rq_debt.returned_qty,0)-nvl(tmp_match_rq_debt.today_returned_qty,0),v_orderprice,v_order_balance,v_stap_tax,0,'2',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
               select sim_exec_agge_seq.nextval into v_exec_agge_num from dual;
               insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,
                       trade_type,exec_qty,exec_price,stap_tax,commissoin,fare,total_balance,transfer_free,total_fare,hold_srlnum,bargain_balance)
                       values(v_exec_agge_num,v_order_num,tmp_match_rq_debt.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_rq_debt.market_id,
                       tmp_match_rq_debt.stock_code,v_stockname,'9',tmp_match_rq_debt.contracts_qty-nvl(tmp_match_rq_debt.returned_qty,0)-nvl(tmp_match_rq_debt.today_returned_qty,0),v_orderprice,v_stap_tax,v_commissoin,0,v_total_balance,v_transfer,v_stap_tax+v_commissoin+v_transfer,tmp_match_rq_debt.hold_srlnum,v_order_balance);
               update t_rzrq_credit_contracts t set t.contracts_state=1,t.today_returned_qty=nvl(t.today_returned_qty,0)+ (tmp_match_rq_debt.contracts_qty-nvl(tmp_match_rq_debt.returned_qty,0)-nvl(tmp_match_rq_debt.today_returned_qty,0)) where t.contracts_no=tmp_match_rq_debt.contracts_no;
               v_userable_balance := tmp_match_rq_debt.total_balance * (tmp_match_rq_debt.contracts_qty-nvl(tmp_match_rq_debt.returned_qty,0)-nvl(tmp_match_rq_debt.today_returned_qty,0))/tmp_match_rq_debt.exec_qty;
               update t_rzrq_account t set t.capital_balance=t.capital_balance-v_total_balance,t.usable_balance=t.usable_balance+(v_userable_balance-v_total_balance) where t.account_id=tmp_match_rq_debt.account_id;
             end loop;
             close c_match_rq_debt;
             commit;
        end loop;
        close c_match_account;
      end if;
    end;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('rzrq_match_end_deal',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_match_end_deal',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_match_end_deal',po_retcod,v_err_msg);
      return;
end rzrq_match_end_deal;


procedure rzrq_daily_payoff
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_total_market NUMBER;                               --总市值
  v_rz_debt      number(16,2);                         --融资负债
  v_rq_debt      number(16,2);                         --融券负债
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    -- 更新用户持仓表( t_sim_hold_stock)
    update t_sim_hold_stock set usable_qty = total_qty where account_id in (select account_id from t_rzrq_account);
    update t_sim_information set now_price = null where now_price =0;
    update t_rzrq_hold_stock set credit_usbale_qty = credit_qty,financing_usable_qty = financing_qty;
    --更新账户已还款，以还券数量
    update t_rzrq_credit_contracts c set c.returned_balance=nvl(c.returned_balance,0)+nvl(c.today_returned_balance,0),c.today_returned_balance=0
    where c.contracts_state=0 and c.contracts_type=0;
    update t_rzrq_credit_contracts c set c.returned_qty=nvl(c.returned_qty,0)+nvl(c.today_returned_qty,0),c.today_returned_qty=0
    where c.contracts_state=0 and c.contracts_type=1;
    commit;

    -- 清算账户总资产及股票市值(正常账号且需要清算的账户)
    for cur in (select account_id from t_rzrq_account  where state=1 and need_settlement=1) loop
      select nvl(sum(nvl(b.now_price,b.close_price)*nvl(a.total_qty,0)),0) into v_total_market
      from t_sim_hold_stock a,t_sim_information b
      where a.stock_code = b.stock_code
        and a.market_id = b.market_id
        and a.account_id = cur.account_id;
      update t_rzrq_account t set t.total_market = v_total_market,t.total_assets = t.capital_balance+v_total_market
      where account_id = cur.account_id;
     end loop;
    commit;

    -- 清算账户负债
    for cur in (select account_id from t_rzrq_account  where state=1 and need_settlement=1) loop
      select sum(a.contracts_balance-nvl(a.returned_balance,0)-nvl(a.today_returned_balance,0)) into v_rz_debt from t_rzrq_credit_contracts a where a.contracts_state=0 and a.contracts_type=0 and a.account_id=cur.account_id;
      select sum((a.contracts_qty-nvl(a.returned_qty,0)-nvl(a.today_returned_qty,0))*nvl(b.now_price,b.close_price)) into v_rq_debt from t_rzrq_credit_contracts a,t_sim_information b where a.market_id=b.market_id and a.stock_code= b.stock_code and  a.contracts_state=0 and a.contracts_type=1 and a.account_id=cur.account_id;
      update t_rzrq_account t set t.financing_loan = nvl(v_rz_debt,0),t.securities_loan=nvl(v_rq_debt,0),t.net_assets = t.total_assets-nvl(v_rz_debt,0)-nvl(v_rq_debt,0) where t.account_id=cur.account_id;
    end loop;
    commit;

    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('rzrq_daily_payoff',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_daily_payoff',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_daily_payoff',po_retcod,v_err_msg);
      return;
end rzrq_daily_payoff;

procedure rzrq_earning_yield
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
/*v_begin_date t_sim_hist_account.create_date%type;       --开始日期
v_last_date t_sim_hist_account.create_date%type;        --前一日期*/
v_last_fri_date varchar2(30);    --上周末日期
v_last_mon_date varchar2(30);    --上月末日期
v_day_earning number(16,2); --日收益
v_day_yield number(10,4);   --日收益率
v_week_earning number(16,2);--周收益
v_week_yield number(10,4);  --周收益率
v_month_earning number(16,2);--月收益
v_month_yield number(10,4);  --月收益率
v_total_earning number(16,2); --总收益
v_total_yield number(10,4);  --总收益率
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间

v_tmp_count          number;
v_tmp_time           varchar2(20);
v_lsw_trade_date     varchar2(30);   --上一个周五
v_lsm_trade_date     varchar2(30);   --上月最后一天
v_ls_trade_date      varchar2(30);
v_test_start_date    varchar2(50);
v_test_end_date      varchar2(50);
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;

  select max(t.t_date) into v_ls_trade_date from t_b_skrace_tradedate t where t.t_date<to_char(sysdate,'yyyymmdd') and t.is_trade=1;--查询上一个交易日
  v_lsw_trade_date := getlwtradedate();     --获取上周最后一个交易日
  v_lsm_trade_date := getlmtradedate();     --获取上月最后一个交易日

  --日收益
  update t_rzrq_account t set(t.day_earnings,t.day_yield) = (select a.net_assets-b.net_assets earning,(a.net_assets-b.net_assets)/b.net_assets yeild from t_rzrq_account a, t_rzrq_settlement_account b where a.account_id=b.account_id
            and b.create_date=v_ls_trade_date and t.account_id=a.account_id) where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;

  --周收益
  update t_rzrq_account t set(t.week_earnings,t.week_yield) = (select a.net_assets-b.net_assets earning,(a.net_assets-b.net_assets)/b.net_assets yeild from t_rzrq_account a, t_rzrq_settlement_account b where a.account_id=b.account_id
            and b.create_date=v_lsw_trade_date and t.account_id=a.account_id) where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;

  --月收益
  update t_rzrq_account t set(t.month_earnings,t.month_yield) = (select a.net_assets-b.net_assets earning,(a.net_assets-b.net_assets)/b.net_assets yeild from t_rzrq_account a, t_rzrq_settlement_account b where a.account_id=b.account_id
            and b.create_date=v_lsm_trade_date and t.account_id=a.account_id) where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;

  --累计收益
  update t_rzrq_account t set t.total_earnings = t.net_assets-t.init_capital,t.total_yield=(t.net_assets-t.init_capital)/t.init_capital where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('rzrq_earning_yield',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_earning_yield',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_earning_yield',po_retcod,v_err_msg);
      return;
end rzrq_earning_yield;

procedure rzrq_yield_rank_stock
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
cursor c_stock_rank_type is select t.rank_type from t_rzrq_account t where t.rank_type is not null group by t.rank_type;
tmp_stock_rank_type c_stock_rank_type%rowtype;
cursor c_stock_account_day(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_rzrq_account where account_type=1
  and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(day_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_day c_stock_account_day%rowtype;
cursor c_stock_account_week(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_rzrq_account where account_type=1
  and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(week_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_week c_stock_account_week%rowtype;
cursor c_stock_account_month(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_rzrq_account where account_type=1
  and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(month_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_month c_stock_account_month%rowtype;
cursor c_stock_account_total(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_rzrq_account where account_type=1
  and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(total_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_total c_stock_account_total%rowtype;
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
v_week_end           varchar2(10);  --本周末
v_month_end          varchar2(10);  --本月末
v_trade_dayrow       t_b_skrace_tradedate%rowtype;
v_account_info       t_rzrq_account%rowtype;
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    open c_stock_rank_type;
    loop
    fetch c_stock_rank_type into tmp_stock_rank_type;
    exit when c_stock_rank_type%notfound;
      --日收益排名
      open c_stock_account_day(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_day into tmp_stock_account_day;
      exit when c_stock_account_day%notfound;
        update t_rzrq_account set day_yield_rankings=tmp_stock_account_day.rownum,
        day_change=nvl2(tmp_stock_account_day.day_yield_rankings,tmp_stock_account_day.day_yield_rankings-tmp_stock_account_day.rownum,0)
        where account_id = tmp_stock_account_day.account_id;
        commit;
      end loop;
      close c_stock_account_day;

      --周收益排名
      open c_stock_account_week(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_week into tmp_stock_account_week;
      exit when c_stock_account_week%notfound;
        update t_rzrq_account set week_yield_rankings=tmp_stock_account_week.rownum,
        week_change=nvl2(tmp_stock_account_week.week_yield_rankings,tmp_stock_account_week.week_yield_rankings-tmp_stock_account_week.rownum,0)
        where account_id = tmp_stock_account_week.account_id;
        commit;
      end loop;
      close c_stock_account_week;

      --月收益排名
      open c_stock_account_month(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_month into tmp_stock_account_month;
      exit when c_stock_account_month%notfound;
        update t_rzrq_account set month_yield_rankings=tmp_stock_account_month.rownum,
        month_change=nvl2(tmp_stock_account_month.month_yield_rankings,tmp_stock_account_month.month_yield_rankings-tmp_stock_account_month.rownum,0)
        where account_id = tmp_stock_account_month.account_id;
        commit;
      end loop;
      close c_stock_account_month;

      --总收益排名
      open c_stock_account_total(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_total into tmp_stock_account_total;
      exit when c_stock_account_total%notfound;
        update t_rzrq_account set total_yield_rankings=tmp_stock_account_total.rownum,
        total_change=nvl2(tmp_stock_account_total.total_yield_rankings,tmp_stock_account_total.total_yield_rankings-tmp_stock_account_total.rownum,0)
        where account_id = tmp_stock_account_total.account_id;
        commit;
      end loop;
      close c_stock_account_total;

      --每周最后一个交易日及每月最后一个交易日统计周冠军与月冠军
      v_week_end := getendweek;
      v_month_end := getendmonth;
      select * into v_trade_dayrow from t_b_skrace_tradedate t where t.t_date=(select max(t_date) from t_b_skrace_tradedate where t_date<=v_week_end and is_trade=1) ;
      if to_char(sysdate,'yyyymmdd') = v_trade_dayrow.t_date then
         select * into v_account_info from t_rzrq_account where week_yield_rankings=1 and account_type=1 and rank_type =tmp_stock_rank_type.rank_type ;
         insert into t_sim_hist_champion(account_id,total_earn,earn_rate,champion_type,create_date,rank_type)
          values(v_account_info.account_id,v_account_info.week_earnings,v_account_info.week_yield,'0',to_char(sysdate,'yyyymmdd'),tmp_stock_rank_type.rank_type);
      end if;
      select * into v_trade_dayrow from t_b_skrace_tradedate t where t.t_date=(select max(t_date) from t_b_skrace_tradedate where t_date<=v_month_end and is_trade=1) ;
      if to_char(sysdate,'yyyymmdd') = v_trade_dayrow.t_date then
         select * into v_account_info from t_rzrq_account where month_yield_rankings=1 and account_type=1 and rank_type =tmp_stock_rank_type.rank_type ;
         insert into t_sim_hist_champion(account_id,total_earn,earn_rate,champion_type,create_date,rank_type)
          values(v_account_info.account_id,v_account_info.month_earnings,v_account_info.month_yield,'1',to_char(sysdate,'yyyymmdd'),tmp_stock_rank_type.rank_type);
      end if;
    end loop;
    close c_stock_rank_type;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('rzrq_yield_rank_stock',po_retcod,v_err_msg);
    return;

EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_yield_rank_stock',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_yield_rank_stock',po_retcod,v_err_msg);
      return;
end rzrq_yield_rank_stock;

procedure rzrq_yield_rank_match
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  cursor c_now_match is
   select * from t_sim_activity where match_state=1 and activity_trade_type=1;
  tmp_now_match c_now_match%rowtype;
  cursor c_match_account_day(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_rzrq_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(day_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_day c_match_account_day%rowtype;
  cursor c_match_account_week(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_rzrq_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(week_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_week c_match_account_week%rowtype;
  cursor c_match_account_month(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_rzrq_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(month_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_month c_match_account_month%rowtype;
  cursor c_match_account_total(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_rzrq_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(total_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_total c_match_account_total%rowtype;
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
  v_trade_dayrow       t_b_skrace_tradedate%rowtype;
  v_account_info       t_rzrq_account%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
      --大赛账户日排名
      open c_match_account_day(tmp_now_match.act_id);
      loop
         fetch c_match_account_day into tmp_match_account_day;
         exit when c_match_account_day%notfound;
         update t_rzrq_account set day_yield_rankings=tmp_match_account_day.rownum,
               day_change=nvl2(tmp_match_account_day.day_yield_rankings,tmp_match_account_day.day_yield_rankings-tmp_match_account_day.rownum,0)
               where account_id = tmp_match_account_day.account_id;
         commit;
      end loop;
      close c_match_account_day;
      --大赛账户周排名
      open c_match_account_week(tmp_now_match.act_id);
      loop
         fetch c_match_account_week into tmp_match_account_week;
         exit when c_match_account_week%notfound;
         update t_rzrq_account set week_yield_rankings=tmp_match_account_week.rownum,
               week_change=nvl2(tmp_match_account_week.week_yield_rankings,tmp_match_account_week.week_yield_rankings-tmp_match_account_week.rownum,0)
               where account_id = tmp_match_account_week.account_id;
         commit;
      end loop;
      close c_match_account_week;
      --大赛账户月排名
      open c_match_account_month(tmp_now_match.act_id);
      loop
         fetch c_match_account_month into tmp_match_account_month;
         exit when c_match_account_month%notfound;
         update t_rzrq_account set month_yield_rankings=tmp_match_account_month.rownum,
               month_change=nvl2(tmp_match_account_month.month_yield_rankings,tmp_match_account_month.month_yield_rankings-tmp_match_account_month.rownum,0)
               where account_id = tmp_match_account_month.account_id;
         commit;
      end loop;
      close c_match_account_month;
      --大赛账户总排名
      open c_match_account_total(tmp_now_match.act_id);
      loop
         fetch c_match_account_total into tmp_match_account_total;
         exit when c_match_account_total%notfound;
         update t_rzrq_account set total_yield_rankings=tmp_match_account_total.rownum,
               month_change=nvl2(tmp_match_account_total.total_yield_rankings,tmp_match_account_total.total_yield_rankings-tmp_match_account_total.rownum,0)
               where account_id = tmp_match_account_total.account_id;
         commit;
      end loop;
      close c_match_account_total;
    end;
    --统计大赛冠军
    select * into v_trade_dayrow from t_b_skrace_tradedate t where t.t_date=(select max(t_date) from t_b_skrace_tradedate where t_date<=tmp_now_match.end_date and is_trade=1) ;
    if to_char(sysdate,'yyyymmdd') = v_trade_dayrow.t_date then
       select * into v_account_info from t_rzrq_account where total_yield_rankings=1 and account_type=2 and act_id=tmp_now_match.act_id;
       insert into t_sim_hist_champion(account_id,total_earn,earn_rate,champion_type,create_date)
        values(v_account_info.account_id,v_account_info.total_earnings,v_account_info.total_yield,'2',to_char(sysdate,'yyyymmdd'));
    end if;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_yield_rank_match',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_match',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_match',po_retcod,v_err_msg);
      return;
end rzrq_yield_rank_match;

--新增每日清算合约利息
procedure rzrq_contract_daily_interest
(
    po_retcod                     out     varchar2     --出参返回代码
)
is
    v_err_msg            varchar2(1000); --错误信息
    v_begin_time         varchar2(20);   --存储过程执行开始时间
    v_end_time           varchar2(20); --存储过程执行结束时间
    v_rz_rate            varchar2(10); --融资年化利息率
    v_rq_rate            varchar2(10); --融券年化利率；
    v_debt_balance       number(16,2);  --欠款金额
    v_date               varchar2(5);   --利息计算时间差
    v_interest           number(16,2);  --计算利息
    v_rq_debtQty         number(10);    --融券负债数量

    cursor c_daily_interest is select t.*,i.now_price from t_rzrq_credit_contracts t,t_sim_information i where t.contracts_state=0 and t.market_id=i.market_id and t.stock_code=i.stock_code order by t.create_time;
    temp_daily_interest c_daily_interest%rowType;  --查询所有未平仓合约
begin
     select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
   open c_daily_interest;
   loop
       fetch c_daily_interest into temp_daily_interest;
       exit when c_daily_interest%notfound;
           select c.cur_value into v_rz_rate from t_sim_sys_config c where c.name='rz_interest_rate';
           select c.cur_value into v_rq_rate from t_sim_sys_config c where c.name='rq_interest_rate';
           v_date := getBetweenDate(temp_daily_interest.modify_date);  --计算时间差

           if temp_daily_interest.contracts_type='0' then  --计算融资利息，直接计算
              v_debt_balance := temp_daily_interest.contracts_balance-nvl(temp_daily_interest.returned_balance,0)-nvl(temp_daily_interest.today_returned_balance,0);
              v_interest := v_debt_balance*(v_rz_rate/360)*v_date;   --计算负债利息
           elsif temp_daily_interest.contracts_type='1' then  --融券利息，要用每天收盘价计算本金
              v_rq_debtQty := temp_daily_interest.contracts_qty-nvl(temp_daily_interest.returned_qty,0)-nvl(temp_daily_interest.today_returned_qty,0);
              v_debt_balance := v_rq_debtQty*temp_daily_interest.now_price;  --用收盘价计算负债金额；
              v_interest := v_debt_balance*(v_rq_rate/360)*v_date;
           end if;
           --更新合约
           update t_rzrq_credit_contracts c set c.contracts_interest=nvl(v_interest,0) where c.contracts_no=temp_daily_interest.contracts_no;
   end loop;
   close c_daily_interest;
   commit;

   select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
   po_retcod := '0';
   v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
   proc_settlement_log('rzrq_contract_daily_interest',po_retcod,v_err_msg);
   return;

EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_contract_daily_interest',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_contract_daily_interest',po_retcod,v_err_msg);
      return;
end rzrq_contract_daily_interest;

procedure rzrq_history_transfer
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
begin
     select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    -- 历史成交数据迁移
    insert into t_sim_hist_exec_agge
    select a.* from t_sim_exec_agge a,t_rzrq_account b where a.account_id=b.account_id;

    insert into t_sim_hist_exec_collect
    select a.* from t_sim_exec_collect a,t_rzrq_account b where a.account_id=b.account_id;

    --历史委托数据迁移(处理状态均为已处理)
    insert into t_sim_hist_order
    (
         serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,
         trade_type,trade_status,order_qty,order_price,cancel_qty,stap_tax,fare,order_balance,transfer_free,
         remark,commissoin,total_fare,deal_flag,total_balance,bargain_qty,bargain_balance
    )
    select serial_num,a.account_id,order_date,order_time,market_id,stock_code,stock_name,
         trade_type,trade_status,order_qty,order_price,cancel_qty,stap_tax,fare,order_balance,transfer_free,
         a.remark,commissoin,total_fare,deal_flag,total_balance,bargain_qty,bargain_balance from t_sim_today_order a,t_rzrq_account b where a.account_id=b.account_id and deal_flag=2 ;

    insert into t_rzrq_hist_order select * from t_rzrq_today_order;
    delete from t_rzrq_today_order;
    delete from  t_sim_today_order where deal_flag=2 and account_id in (select account_id from t_rzrq_account);
    delete from t_sim_exec_agge where account_id in (select account_id from t_rzrq_account);
    delete from t_sim_exec_collect where account_id in (select account_id from t_rzrq_account);
    commit;

    --账户历史资产数据迁移
    delete from t_rzrq_hist_account where create_date = to_char(sysdate,'yyyymmdd') and account_id in (select account_id from t_rzrq_account) ;
    insert into t_rzrq_hist_account(account_id,money_id,capital_balance,financing_loan,securities_loan,create_date,total_assets,total_market,usable_balance,net_assets,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
    select account_id,money_id,capital_balance,financing_loan,securities_loan,to_char(sysdate,'yyyymmdd'),total_assets,total_market,usable_balance,net_assets,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
    from t_rzrq_account where need_settlement=1 and state=1;
    commit;

    --融资融券清算缓存表
    delete from t_rzrq_settlement_account where create_date = to_char(sysdate,'yyyymmdd');
    insert into t_rzrq_settlement_account(account_id, money_id, capital_balance, financing_loan, securities_loan, total_assets, total_market, create_date, usable_balance, net_assets, total_earnings, total_yield, total_yield_rankings, week_earnings, week_yield, week_yield_rankings, month_earnings, month_yield, month_yield_rankings, day_earnings, day_yield, day_yield_rankings, total_change, month_change, week_change, day_change, rank_type)
    select account_id, money_id, capital_balance, financing_loan, securities_loan, total_assets, total_market, to_char(sysdate,'yyyymmdd'), usable_balance, net_assets, total_earnings, total_yield, total_yield_rankings, week_earnings, week_yield, week_yield_rankings, month_earnings, month_yield, month_yield_rankings, day_earnings, day_yield, day_yield_rankings, total_change, month_change, week_change, day_change, rank_type
    from t_rzrq_account r where r.state=1 and r.need_settlement=1;

    delete from t_sim_hist_information where trade_date = to_char(sysdate,'yyyymmdd') and sec_type in ('0','2','3','4','5','9','11','12','13','16','18','66');
    insert into t_sim_hist_information(stock_serino,trade_date,market_id,stock_code,stock_name,sec_type,buy_unit,close_price,open_price,highbuy_price,lowsell_price,now_price,remark)
    select stock_serino,trade_date,market_id,stock_code,stock_name,sec_type,buy_unit,close_price,open_price,highbuy_price,lowsell_price,now_price,remark from t_sim_information where sec_type in ('0','2','3','4','5','9','11','12','13','16','18','66');
    commit;

    --融资融券持仓数据备份
    delete from T_RZRQ_HOLD_STOCK_HIST t where t.create_date = to_char(sysdate,'yyyymmdd');
    insert into T_RZRQ_HOLD_STOCK_HIST(SERIAL_NUM,CREDIT_USBALE_QTY,FINANCING_USABLE_QTY,CREDIT_QTY,FINANCING_QTY,CREATE_DATE)
    select k.serial_num,k.credit_usbale_qty,k.financing_usable_qty,k.credit_qty,k.financing_qty,to_char(sysdate,'yyyymmdd') from t_rzrq_hold_stock k;
    commit;

    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('rzrq_history_transfer',po_retcod,v_err_msg);
    return;

EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_history_transfer',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_history_transfer',po_retcod,v_err_msg);
      return;
end rzrq_history_transfer;

procedure rzrq_match_end_updateaccount
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time                  varchar2(20);             --存储过程执行结束时间
  cursor c_now_match is
   select act_id, end_date from t_sim_activity where match_state=1 and activity_trade_type=1;
  tmp_now_match c_now_match%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
      --如果是比赛的最后一天，更新大赛账户清算标志，以后不进行清算
      if tmp_now_match.end_date<=to_char(sysdate,'yyyymmdd') then
         update t_rzrq_account  set need_settlement=0 where act_id=tmp_now_match.act_id;
         commit;
      end if;
    end;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('rzrq_match_end_updateaccount',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_match_end_updateaccount',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('rzrq_match_end_updateaccount',po_retcod,v_err_msg);
      return;
end rzrq_match_end_updateaccount;


end rzrq_settlement;
/
grant execute on SISANSHDATA.RZRQ_SETTLEMENT to SISANSHOPR;


prompt
prompt Creating package body STOCK_SETTLEMENT
prompt ======================================
prompt
create or replace package body sisanshdata.stock_settlement is
-- 普通交易清算包

--处理未成交委托
procedure proc_daily_nodeal_order
(
   po_retcod                     out     varchar2     --出参返回代码
)
is

  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    --处理未处理的委托
    --买入
      update t_sim_account t set userable_balance=userable_balance+(select nvl(sum(o.total_balance),0)-nvl(sum(o.bargain_balance),0) from t_sim_today_order o where o.deal_flag != 2 and o.trade_type='0' and o.account_id= t.account_id)
        where t.account_id in (select a.account_id from t_sim_today_order a where a.deal_flag != 2 and a.trade_type='0');
    --卖出
      update t_sim_hold_stock t set usable_qty=usable_qty+(select nvl(sum(o.order_qty),0)-nvl(sum(o.bargain_qty),0) from t_sim_today_order o where o.deal_flag != 2 and o.trade_type='1' and o.account_id= t.account_id
        and t.market_id=o.market_id and t.stock_code=o.stock_code)
      where t.account_id in (select a.account_id from t_sim_today_order a where a.deal_flag != 2 and a.trade_type='1');
    --更新状态
    update t_sim_today_order set trade_status=nvl2(bargain_qty,6,5),deal_flag=2 where deal_flag != 2;
    commit;

    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_daily_nodeal_order',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_nodeal_order',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_nodeal_order',po_retcod,v_err_msg);
      return;
end proc_daily_nodeal_order;

--大赛最后一天卖出全部
procedure proc_match_end_sell
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_order_num          number;    --委托编号
  v_exec_agge_num      number;    --成交编号
  v_hist_hold_num      number;    --历史持仓编号
  v_order_balance      number(16,2);   --委托金额
  v_total_balance      number(16,2);   --交易金额（含交易费用）
  v_stap_tax_rate      number(16,4);   --印花税率
  v_stap_tax           number(16,2);   --印花税(卖出时收取)
  v_transfer_free      number(16,4);    --过户费率 只有上海股票才会收取过户费
  v_transfer           number(16,2);    --过户费
  v_commissoin_rate    number(16,4);   --佣金率
  v_commissoin         number(16,2);   --佣金率
  v_temp               integer(4);     --临时计数变量
  v_num                integer(4);     --新增临时计数
  v_sec_type           varchar(10);    --股票类型
  v_highbuy            number(16,3);   --当日涨停价
  v_lowsell            number(16,3);   --当日跌停价
  v_nowprice           number(16,3);   --现价
  v_closeprice         number(16,3);   --收盘价
  v_orderprice         number(16,3);   --委托价
  v_stockname          varchar2(30);   --股票名称
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time                  varchar2(20);             --存储过程执行结束时间
  cursor c_now_match is
   select act_id, end_date from t_sim_activity where  activity_trade_type=0;
  tmp_now_match c_now_match%rowtype;
  cursor c_match_account(p_act_id varchar2) is
   select b.* from t_sim_account a, t_sim_hold_stock b where a.act_id=p_act_id and a.state=1 and a.account_id=b.account_id
	and b.stock_code not in (select n.stock_code from t_sim_information i right join (
                                 select distinct p.stock_code from t_sim_hold_stock p,t_sim_account o where p.account_id=o.account_id and
                                 p.cost_price<>0) n on n.stock_code=i.stock_code where  i.stock_code is null);
  tmp_match_account c_match_account%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
    	select count(*) into v_num  from t_b_skrace_tradedate t where t.t_date=tmp_now_match.end_date and t.is_trade=1;
    	--如果比赛结束日不是交易日
      if v_num=0 then
    	select max(t.t_date) into tmp_now_match.end_date  from t_b_skrace_tradedate t where t.t_date<=tmp_now_match.end_date and t.is_trade=1;
    	end if;    	
      --如果是比赛的最后一天，强制卖出持仓的股票，并按收盘价成交
      if tmp_now_match.end_date<=to_char(sysdate,'yyyymmdd') then
         --内循环
         open c_match_account(tmp_now_match.act_id);
         loop
           fetch c_match_account into tmp_match_account;
           exit when c_match_account%notfound;

           --获取当前委托股票的涨停价、跌停价、股票类型
           select Highbuy_price,Lowsell_price,sec_type,now_price,close_price,stock_name into  v_highbuy,v_lowsell,v_sec_type,v_nowprice,v_closeprice,v_stockname
                  from t_sim_information where stock_code = tmp_match_account.stock_code and market_id = tmp_match_account.market_id ;
            if v_nowprice != 0 then
               v_orderprice :=v_nowprice;
            else
               v_orderprice :=v_closeprice;
            end if;

            v_transfer :=0;--过户费默认为0
             -- 获取买卖过户费
            if lower(tmp_match_account.market_id)='sh' then
                   select count(fare_rate) into v_temp
                   from t_sim_fare
                   where sec_type = v_sec_type
                   and fare_type='transfer_free';

                   if v_temp=0 then
                     select cur_value into v_transfer_free  from t_sim_sys_config where name='default_transfer_free';
                     else
                     select  fare_rate  into v_transfer_free
                     from t_sim_fare
                     where sec_type = v_sec_type
                     and fare_type='transfer_free';
                   end if;

                   v_transfer :=tmp_match_account.usable_qty*v_transfer_free;
                   --过户费最低1元
                   if v_transfer<1 then
                      v_transfer :=1;
                   end if;
            end if;
            select count(fare_rate) into v_temp from t_sim_fare where  sec_type = v_sec_type and fare_type='staptax';

            if v_temp = 0 then
               select cur_value into v_stap_tax_rate from t_sim_sys_config where name='default_staptax'  ;
            else
               select  fare_rate  into v_stap_tax_rate from t_sim_fare where sec_type = v_sec_type and fare_type='staptax';
            end if;

            v_stap_tax := v_orderprice * tmp_match_account.usable_qty * v_stap_tax_rate;

            select count(fare_rate) into v_temp
            from t_sim_fare where sec_type = v_sec_type and fare_type='commission';

            if v_temp = 0 then
               select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission' ;
            else
               select  fare_rate  into v_commissoin_rate from t_sim_fare where sec_type = v_sec_type and fare_type='commission';
            end if;
            v_commissoin:=v_orderprice * tmp_match_account.usable_qty * v_commissoin_rate;
            if v_commissoin<5 then
               v_commissoin:=5;
            end if;

           -- 委托卖出金额
           v_order_balance := tmp_match_account.usable_qty * v_orderprice;
           v_total_balance := tmp_match_account.usable_qty*v_orderprice-v_transfer-v_stap_tax-v_commissoin;
           select sim_today_order_seq.nextval into v_order_num from dual;
           insert into T_SIM_TODAY_ORDER(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
                   values(v_order_num,tmp_match_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_account.market_id,tmp_match_account.stock_code,v_stockname,'sell','2',tmp_match_account.usable_qty,v_orderprice,v_order_balance,v_stap_tax,0,'2',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
           select sim_exec_agge_seq.nextval into v_exec_agge_num from dual;
           insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,
                   trade_type,exec_qty,exec_price,stap_tax,commissoin,fare,total_balance,transfer_free,total_fare,hold_srlnum,bargain_balance)
                   values(v_exec_agge_num,v_order_num,tmp_match_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_account.market_id,tmp_match_account.stock_code,v_stockname,'1',tmp_match_account.usable_qty,v_orderprice,v_stap_tax,v_commissoin,0,v_total_balance,v_transfer,v_stap_tax+v_commissoin+v_transfer,tmp_match_account.serial_num,v_order_balance);
           delete from t_sim_hold_stock  where serial_num=tmp_match_account.serial_num;
           select sim_hist_hold_stock_seq.nextval into v_hist_hold_num from dual;
           insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,
                  create_date,hold_srlnum,total_qty,usable_qty,cost_price)
                  values(v_hist_hold_num,tmp_match_account.account_id,tmp_match_account.market_id,tmp_match_account.stock_code,
                  to_char(sysdate,'yyyymmdd hh24:mi:ss'),tmp_match_account.serial_num,0,0,0);
           update t_sim_account set userable_balance= userable_balance+v_total_balance where account_id= tmp_match_account.account_id;
           commit;
         end loop;
         close c_match_account;
      end if;
    end;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_match_end_sell',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_sell',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_sell',po_retcod,v_err_msg);
      return;
end proc_match_end_sell;

--每日清算
procedure proc_daily_payoff
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_total_market NUMBER;                               --总市值
  v_week_trade_date    varchar2(30);   --七天之前最大交易日
  v_month_trade_date   varchar2(30);   --30天之前最大交易日

  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
     v_week_trade_date := getweektradedate();     --获取七天之前最大一个交易日
     v_month_trade_date := getmonthtradedate();     --获取30天之前最大一个交易日
     -- 更新用户持仓表( t_sim_hold_stock),将包含异常持仓的排除在外（退市股票/不支持交易的股票）
    update t_sim_hold_stock t set t.usable_qty = total_qty where t.account_id in (select account_id from t_sim_account)
        and t.stock_code not in (select n.stock_code from t_sim_information i right join (
                                 select distinct p.stock_code from t_sim_hold_stock p,t_sim_account o where p.account_id=o.account_id and
                                 p.cost_price<>0) n on n.stock_code=i.stock_code where  i.stock_code is null);

    update t_sim_information set now_price = null where now_price =0;
    commit;

   -- 清算账户总资产及股票市值(正常账号且需要清算的账户)
   -- 1删除临时表数据
   delete ACCOUNT_SETTLE_TEMP;
   -- 2查询有持仓的账户的股票市值
   INSERT INTO ACCOUNT_SETTLE_TEMP select nvl(sum(nvl(b.now_price,b.close_price) * nvl(a.total_qty, 0)),0) v_total_market,a.account_id
              from t_sim_hold_stock  a,
                   t_sim_information b
             where a.stock_code = b.stock_code
               and a.market_id = b.market_id
               group by a.account_id;
    -- 2更新账户股票市值 
    update t_sim_account t set t.total_market =(
        select v_total_market from ACCOUNT_SETTLE_TEMP rs where t.account_id=rs.account_id
        );
    -- 3更新账户总资产以及当前资金 
    update t_sim_account t set t.total_assets = t.userable_balance+nvl(t.total_market,0),t.current_balance=t.userable_balance;
    
    update t_sim_account a set a.total_assets = a.total_assets+(select nvl(sum(t.order_qty * t.order_price-nvl(t.bargain_balance,0)),0)
      from t_sim_today_order t
    where t.trade_type='0' and t.deal_flag<>'2' and t.account_id =a.account_id),a.current_balance=a.userable_balance;

    commit;

    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_daily_payoff',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_payoff',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_payoff',po_retcod,v_err_msg);
      return;
end proc_daily_payoff;

--数据迁移、回撤率计算
procedure proc_history_transfer
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间

v_week_trade_date    varchar2(30);   --七天之前最大交易日
v_month_trade_date   varchar2(30);   --一月之前最大交易日
v_year_trade_date    varchar2(30); --近1年之前最大一个交易日
v_todaycount   number;   --历史账户表中当日数据数量
begin
  v_week_trade_date := getweektradedate();     --获取七天之前最大一个交易日
  v_month_trade_date := getmonthtradedate();     --获取上月之前最大一个交易日
  v_year_trade_date := getyeartradedate();     --获取近1年之前最大一个交易日

     select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    -- 历史成交数据迁移
    insert into t_sim_hist_exec_agge
    select a.* from t_sim_exec_agge a,t_sim_account b where a.account_id=b.account_id;

    insert into t_sim_hist_exec_collect
    select a.* from t_sim_exec_collect a,t_sim_account b where a.account_id=b.account_id;

    --历史委托数据迁移(处理状态均为已处理)
    insert into t_sim_hist_order
    (
         serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,
         trade_type,trade_status,order_qty,order_price,cancel_qty,stap_tax,fare,order_balance,transfer_free,
         remark,commissoin,total_fare,deal_flag,total_balance,bargain_qty,bargain_balance,ordertype
    )
    select serial_num,a.account_id,order_date,order_time,market_id,stock_code,stock_name,
         trade_type,trade_status,order_qty,order_price,cancel_qty,stap_tax,fare,order_balance,transfer_free,
         a.remark,commissoin,total_fare,deal_flag,total_balance,bargain_qty,bargain_balance,ordertype from t_sim_today_order a,t_sim_account b where a.account_id=b.account_id and deal_flag=2 ;

    delete from  t_sim_today_order where deal_flag=2 and account_id in (select account_id from t_sim_account);
    delete from t_sim_exec_agge where account_id in (select account_id from t_sim_account);
    delete from t_sim_exec_collect where account_id in (select account_id from t_sim_account);
    commit;

    --账户历史资产数据迁移
    select count(1) into v_todaycount from t_sim_hist_account where create_date = to_char(sysdate,'yyyymmdd') and rownum <10;

    if v_todaycount > 0 then
       delete from t_sim_hist_account where create_date = to_char(sysdate,'yyyymmdd');
    end if;
    
    execute immediate'alter table t_sim_hist_account nologging';
    insert /*+ append */ into t_sim_hist_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings,recent_week_yield,recent_month_yield)
    select account_id,money_id,to_char(sysdate,'yyyymmdd'),total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings,recent_week_yield,recent_month_yield
    from t_sim_account where need_settlement=1 and state=1;
    execute immediate'alter table t_sim_hist_account logging';

    --组合统计数据迁移
    delete from t_portfolio_sum_hist where create_date = to_char(sysdate,'yyyymmdd');
    insert into t_portfolio_sum_hist(portfolio_id,sub_num,sub_num_rankings,comment_num,beatgrail_num,thirty_trade_num,seven_trade_num,total_trade_num,stock_holddays_avg,stock_num_avg,retrace_rate_seven,retrace_rate_thirty,retrace_rate_year,retrace_rate_total,turnover_total_money,turnover_total_rate,turnover_total_rankings,turnover_seven_money,turnover_seven_rate,turnover_seven_rankings,turnover_thirty_money,turnover_thirty_rate,turnover_thirty_rankings,turnover_today_money,turnover_today_rate,turnover_today_rankings,choose_total_sum,choose_success_sum,choose_success_rate,choose_success_rankings,trade_loss_sum,trade_success_sum,new_trade_time,portfolio_style,hold_stock_num,create_date)
    select portfolio_id,sub_num,sub_num_rankings,comment_num,beatgrail_num,thirty_trade_num,seven_trade_num,total_trade_num,stock_holddays_avg,stock_num_avg,retrace_rate_seven,retrace_rate_thirty,retrace_rate_year,retrace_rate_total,turnover_total_money,turnover_total_rate,turnover_total_rankings,turnover_seven_money,turnover_seven_rate,turnover_seven_rankings,turnover_thirty_money,turnover_thirty_rate,turnover_thirty_rankings,turnover_today_money,turnover_today_rate,turnover_today_rankings,choose_total_sum,choose_success_sum,choose_success_rate,choose_success_rankings,trade_loss_sum,trade_success_sum,new_trade_time,portfolio_style,hold_stock_num,to_char(sysdate, 'yyyyMMdd') from t_portfolio_sum t;

    delete from t_sim_hist_information where trade_date = to_char(sysdate,'yyyymmdd') and sec_type in ('0','2','3','4','5','6','9','11','12','13','14','16','18','66');
    insert into t_sim_hist_information(stock_serino,trade_date,market_id,stock_code,stock_name,sec_type,buy_unit,close_price,open_price,highbuy_price,lowsell_price,now_price,remark,issuspend)
    select stock_serino,trade_date,market_id,stock_code,stock_name,sec_type,buy_unit,close_price,open_price,highbuy_price,lowsell_price,now_price,remark,issuspend from t_sim_information where sec_type in ('0','2','3','4','5','6','9','11','12','13','14','16','18','66');
    commit;

  -- 每日持仓数据备份
    DELETE
      FROM t_sim_hold_stock_daily
    WHERE backup_date = to_char(sysdate,'yyyymmdd');
    INSERT INTO t_sim_hold_stock_daily (SERIAL_NUM,ACCOUNT_ID,MARKET_ID,STOCK_CODE,TOTAL_QTY,USABLE_QTY,COST_PRICE,CREATE_DATE,MODIFY_DATE,REMARK,BACKUP_DATE)
      SELECT SERIAL_NUM,ACCOUNT_ID,MARKET_ID,STOCK_CODE,TOTAL_QTY,USABLE_QTY,COST_PRICE,CREATE_DATE,MODIFY_DATE,REMARK,to_char(sysdate,'yyyymmdd')
       from t_sim_hold_stock;
      commit;

    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_history_transfer',po_retcod,v_err_msg);
    return;

EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_history_transfer',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_history_transfer',po_retcod,v_err_msg);
      return;
end proc_history_transfer;

--每日清算(盘中实时)
procedure proc_earnings_payoff
(
   po_retcod                     out     varchar2     --出参返回代码
)
is

  v_total_market NUMBER;                               --总市值
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;

   -- 清算账户总资产及股票市值(正常账号且需要清算的账户) 盘中清算需要加上冻结资金
   -- 1删除临时表数据
   delete ACCOUNT_SETTLE_TEMP;
   -- 2查询有持仓的账户的股票市值
   INSERT INTO ACCOUNT_SETTLE_TEMP select nvl(sum(nvl(b.now_price,b.close_price) * nvl(a.total_qty, 0)),0) v_total_market,a.account_id
              from t_sim_hold_stock  a,
                   t_sim_information b
             where a.stock_code = b.stock_code
               and a.market_id = b.market_id
               group by a.account_id;
    -- 2更新账户股票市值 
    update t_sim_account t set t.total_market =(
        select v_total_market from ACCOUNT_SETTLE_TEMP rs where t.account_id=rs.account_id
        );
    -- 3更新账户总资产以及当前资金 
    update t_sim_account t set t.total_assets = t.userable_balance+nvl(t.total_market,0),t.current_balance=t.userable_balance;
    
      update t_sim_account a set a.total_assets = a.total_assets+(select nvl(sum(t.total_balance-nvl(t.bargain_balance,0)),0)
       from t_sim_today_order t
     where t.trade_type='0' and t.deal_flag<>'2' and t.account_id =a.account_id),a.current_balance=a.userable_balance;
    commit;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_earnings_payoff',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_earnings_payoff',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_earnings_payoff',po_retcod,v_err_msg);
      return;
end proc_earnings_payoff;


end stock_settlement;
/
grant execute on SISANSHDATA.STOCK_SETTLEMENT to SISANSHOPR;


prompt
prompt Creating package body STOCK_SETTLEMENT_BAK
prompt ==========================================
prompt
create or replace package body sisanshdata.stock_settlement_bak is
--create or replace package body stock_settlement is

procedure proc_daily_settlement_prepare
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_lsw_trade_date     varchar2(30);   --上一个周五
  v_lsm_trade_date     varchar2(30);   --上月最后一天
  v_ls_trade_date      varchar2(30);   --上个交易日
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    delete from t_sim_settlement_account where create_date = to_char(sysdate,'yyyymmdd');    --防止重复清算，造成 v_ls_trade_date=sysdate；
    select max(t.t_date) into v_ls_trade_date from t_b_skrace_tradedate t where t.t_date<to_char(sysdate,'yyyymmdd') and t.is_trade=1;--查询上一个交易日
    v_lsw_trade_date := getlwtradedate();     --获取上周最后一个交易日
    v_lsm_trade_date := getlmtradedate();     --获取上月最后一个交易日
    delete from t_sim_settlement_account t where t.create_date not in(v_ls_trade_date,v_lsw_trade_date,v_lsm_trade_date);
    commit;
    /*插入没有历史数据的账号*/
    insert into t_sim_settlement_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
      select account_id,money_id,v_ls_trade_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
      from t_sim_account where account_id not in (select account_id from t_sim_settlement_account a where a.create_date=v_ls_trade_date) ;
      commit;
    insert into t_sim_settlement_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
      select account_id,money_id,v_lsw_trade_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
      from t_sim_account where account_id not in (select account_id from t_sim_settlement_account a where a.create_date=v_lsw_trade_date) ;
      commit;
    insert into t_sim_settlement_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
      select account_id,money_id,v_lsm_trade_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
      from t_sim_account where account_id not in (select account_id from t_sim_settlement_account a where a.create_date=v_lsm_trade_date) ;
      commit;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_daily_settlement_prepare',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN

      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_settlement_prepare',po_retcod,v_err_msg);
      return;
    when others then
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_settlement_prepare',po_retcod,v_err_msg);
      return;
end proc_daily_settlement_prepare;

--处理未成交委托
procedure proc_daily_nodeal_order
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_trade_type VARCHAR(10);                            --委托类型
  v_order_total_balance number(16,2);                  --委托总金额
  v_order_total_qty   number;                          --委托数量
  cursor c_order is
  select t.* from t_sim_today_order t,t_sim_account b where t.account_id=b.account_id and t.deal_flag != 2 order by order_date,order_time; --今日未处理的委托
  tmp_order c_order%rowtype;
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    --处理未处理的委托
    open c_order;
    loop
      fetch c_order into tmp_order;
      exit when c_order%notfound;
      v_trade_type := tmp_order.trade_type;
      if v_trade_type='0' then
        v_order_total_balance := tmp_order.total_balance;
        update t_sim_account t set userable_balance=userable_balance+v_order_total_balance-nvl(tmp_order.bargain_balance,0) where account_id=tmp_order.account_id ;
        update t_sim_today_order set trade_status=nvl2(tmp_order.bargain_qty,6,5),deal_flag=2 where serial_num=tmp_order.serial_num;
      elsif v_trade_type='1' then
        v_order_total_qty := tmp_order.order_qty;
        update t_sim_hold_stock  set usable_qty=usable_qty+v_order_total_qty-nvl(tmp_order.bargain_qty,0) where account_id=tmp_order.account_id
         and market_id=tmp_order.market_id and stock_code=tmp_order.stock_code;
        update t_sim_today_order set trade_status=nvl2(tmp_order.bargain_qty,6,5),deal_flag=2 where serial_num=tmp_order.serial_num;
      end if;
      commit;
    end loop;
    close c_order;

    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_daily_nodeal_order',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_nodeal_order',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_nodeal_order',po_retcod,v_err_msg);
      return;
end proc_daily_nodeal_order;

--大赛最后一天卖出全部
procedure proc_match_end_sell
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_order_num          number;    --委托编号
  v_exec_agge_num      number;    --成交编号
  v_hist_hold_num      number;    --历史持仓编号
  v_order_balance      number(16,2);   --委托金额
  v_total_balance      number(16,2);   --交易金额（含交易费用）
  v_stap_tax_rate      number(16,4);   --印花税率
  v_stap_tax           number(16,2);   --印花税(卖出时收取)
  v_transfer_free      number(16,4);    --过户费率 只有上海股票才会收取过户费
  v_transfer           number(16,2);    --过户费
  v_commissoin_rate    number(16,4);   --佣金率
  v_commissoin         number(16,2);   --佣金率
  v_temp               integer(4);     --临时计数变量
  v_sec_type           varchar(10);    --股票类型
  v_highbuy            number(16,3);   --当日涨停价
  v_lowsell            number(16,3);   --当日跌停价
  v_nowprice           number(16,3);   --现价
  v_closeprice         number(16,3);   --收盘价
  v_orderprice         number(16,3);   --委托价
  v_stockname          varchar2(30);   --股票名称
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time                  varchar2(20);             --存储过程执行结束时间
  cursor c_now_match is
   select act_id, end_date from t_sim_activity where match_state=1 and activity_trade_type=0;
  tmp_now_match c_now_match%rowtype;
  cursor c_match_account(p_act_id varchar2) is
   select b.* from t_sim_account a, t_sim_hold_stock b where a.act_id=p_act_id and a.state=1 and a.account_id=b.account_id;
  tmp_match_account c_match_account%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
      --如果是比赛的最后一天，强制卖出持仓的股票，并按收盘价成交
      if tmp_now_match.end_date<=to_char(sysdate,'yyyymmdd') then
         --内循环
         open c_match_account(tmp_now_match.act_id);
         loop
           fetch c_match_account into tmp_match_account;
           exit when c_match_account%notfound;

           --获取当前委托股票的涨停价、跌停价、股票类型
           select Highbuy_price,Lowsell_price,sec_type,now_price,close_price,stock_name into  v_highbuy,v_lowsell,v_sec_type,v_nowprice,v_closeprice,v_stockname
                  from t_sim_information where stock_code = tmp_match_account.stock_code and market_id = tmp_match_account.market_id ;
            if v_nowprice != 0 then
               v_orderprice :=v_nowprice;
            else
               v_orderprice :=v_closeprice;
            end if;

            v_transfer :=0;--过户费默认为0
             -- 获取买卖过户费
            if lower(tmp_match_account.market_id)='sh' then
                   select count(fare_rate) into v_temp
                   from t_sim_fare
                   where sec_type = v_sec_type
                   and fare_type='transfer_free';

                   if v_temp=0 then
                     select cur_value into v_transfer_free  from t_sim_sys_config where name='default_transfer_free';
                     else
                     select  fare_rate  into v_transfer_free
                     from t_sim_fare
                     where sec_type = v_sec_type
                     and fare_type='transfer_free';
                   end if;

                   v_transfer :=tmp_match_account.usable_qty*v_transfer_free;
                   --过户费最低1元
                   if v_transfer<1 then
                      v_transfer :=1;
                   end if;
            end if;
            select count(fare_rate) into v_temp from t_sim_fare where  sec_type = v_sec_type and fare_type='staptax';

            if v_temp = 0 then
               select cur_value into v_stap_tax_rate from t_sim_sys_config where name='default_staptax'  ;
            else
               select  fare_rate  into v_stap_tax_rate from t_sim_fare where sec_type = v_sec_type and fare_type='staptax';
            end if;

            v_stap_tax := v_orderprice * tmp_match_account.usable_qty * v_stap_tax_rate;

            select count(fare_rate) into v_temp
            from t_sim_fare where sec_type = v_sec_type and fare_type='commission';

            if v_temp = 0 then
               select cur_value into v_commissoin_rate from t_sim_sys_config where name='default_commission' ;
            else
               select  fare_rate  into v_commissoin_rate from t_sim_fare where sec_type = v_sec_type and fare_type='commission';
            end if;
            v_commissoin:=v_orderprice * tmp_match_account.usable_qty * v_commissoin_rate;
            if v_commissoin<5 then
               v_commissoin:=5;
            end if;

           -- 委托卖出金额
           v_order_balance := tmp_match_account.usable_qty * v_orderprice;
           v_total_balance := tmp_match_account.usable_qty*v_orderprice-v_transfer-v_stap_tax-v_commissoin;
           select sim_today_order_seq.nextval into v_order_num from dual;
           insert into T_SIM_TODAY_ORDER(serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,trade_type,trade_status,order_qty,order_price,order_balance,stap_tax,fare,deal_flag,Transfer_Free,Total_Balance,Total_Fare,Commissoin)
                   values(v_order_num,tmp_match_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_account.market_id,tmp_match_account.stock_code,v_stockname,'sell','2',tmp_match_account.usable_qty,v_orderprice,v_order_balance,v_stap_tax,0,'2',v_transfer,v_total_balance,v_stap_tax+v_commissoin+v_transfer,v_commissoin);
           select sim_exec_agge_seq.nextval into v_exec_agge_num from dual;
           insert into t_sim_exec_agge(serial_num,order_srlnum,account_id,exec_date,exec_time,market_id,stock_code,stock_name,
                   trade_type,exec_qty,exec_price,stap_tax,commissoin,fare,total_balance,transfer_free,total_fare,hold_srlnum,bargain_balance)
                   values(v_exec_agge_num,v_order_num,tmp_match_account.account_id,to_char(sysdate,'yyyymmdd'),to_char(sysdate,'hh24:mi:ss'),tmp_match_account.market_id,
                   tmp_match_account.stock_code,v_stockname,'1',tmp_match_account.usable_qty,v_orderprice,v_stap_tax,v_commissoin,0,v_total_balance,v_transfer,v_stap_tax+v_commissoin+v_transfer,tmp_match_account.serial_num,v_order_balance);
           delete from t_sim_hold_stock  where serial_num=tmp_match_account.serial_num;
           select sim_hist_hold_stock_seq.nextval into v_hist_hold_num from dual;
           insert into t_sim_hist_hold_stock(serial_num,account_id,market_id,stock_code,
                  create_date,hold_srlnum,total_qty,usable_qty,cost_price)
                  values(v_hist_hold_num,tmp_match_account.account_id,tmp_match_account.market_id,tmp_match_account.stock_code,
                  to_char(sysdate,'yyyymmdd hh24:mi:ss'),tmp_match_account.serial_num,0,0,0);
           update t_sim_account set userable_balance= userable_balance+v_total_balance where account_id= tmp_match_account.account_id;
           commit;
         end loop;
         close c_match_account;
      end if;
    end;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_match_end_sell',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_sell',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_sell',po_retcod,v_err_msg);
      return;
end proc_match_end_sell;

--每日清算
procedure proc_daily_payoff
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_total_market NUMBER;                               --总市值
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;

    -- 更新用户持仓表( t_sim_hold_stock)
    update t_sim_hold_stock set usable_qty = total_qty where account_id in (select account_id from t_sim_account);
    update t_sim_information set now_price = null where now_price =0;
    commit;

    -- 清算账户总资产及股票市值(正常账号且需要清算的账户)
   /* for cur in (select account_id from t_sim_account  where state=1 and need_settlement=1 and apply_state=1) loop
      select nvl(sum(nvl(b.now_price,b.close_price)*nvl(a.total_qty,0)),0) into v_total_market
      from t_sim_hold_stock a,t_sim_information b
      where a.stock_code = b.stock_code
        and a.market_id = b.market_id
        and a.account_id = cur.account_id;
      update t_sim_account t set t.total_market = v_total_market,t.total_assets = t.userable_balance+v_total_market,t.current_balance=t.userable_balance
      where account_id = cur.account_id;
    end loop;
    commit;
    */
    --更新总市值
      update t_sim_account t set(t.total_assets,t.total_market)=(select (b.userable_balance+a.total_market) total_assets,a.total_market from (select tshs.account_id,nvl(sum(nvl(tsi.now_price,tsi.close_price)*nvl(tshs.total_qty,0)),0) total_market
      from t_sim_hold_stock tshs,t_sim_information tsi where tshs.market_id=tsi.market_id and tshs.stock_code=tsi.stock_code group by tshs.account_id) a,t_sim_account b
      where a.account_id=b.account_id and a.account_id=t.account_id)
      where exists(select tshs.account_id
      from t_sim_hold_stock tshs,t_sim_information tsi where tshs.market_id=tsi.market_id and tshs.stock_code=tsi.stock_code and tshs.account_id=t.account_id);
      commit;

      --更新当前资产
      update t_sim_account t set t.current_balance=t.userable_balance where exists(select tshs.account_id
      from t_sim_hold_stock tshs,t_sim_information tsi where tshs.market_id=tsi.market_id and tshs.stock_code=tsi.stock_code and tshs.account_id=t.account_id);

      commit;
      --没有持仓用户更新总资产
      UPDATE t_sim_account tsa set tsa.total_assets=tsa.userable_balance,tsa.total_market=0
      WHERE tsa.account_id not in (SELECT tshs.account_id FROM t_sim_hold_stock tshs WHERE tsa.account_id=tshs.account_id);
      commit;

      --更新冻结资金
       update t_sim_account a set a.total_assets = a.total_assets+(select nvl(sum(t.order_qty * t.order_price-nvl(t.bargain_balance,0)),0)
       from t_sim_today_order t
       where t.trade_type='0' and t.deal_flag<>'2' and t.account_id =a.account_id),a.current_balance=a.userable_balance;
       commit;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_daily_payoff',po_retcod,v_err_msg);
    return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_payoff',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_daily_payoff',po_retcod,v_err_msg);
      return;
end proc_daily_payoff;

procedure proc_earning_yield
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
v_begin_date t_sim_hist_account.create_date%type;       --开始日期
v_last_date t_sim_hist_account.create_date%type;        --前一日期
v_last_fri_date varchar2(30);    --上周末日期
v_last_mon_date varchar2(30);    --上月末日期
v_day_earning number(16,2); --日收益
v_day_yield number(10,4);   --日收益率
v_week_earning number(16,2);--周收益
v_week_yield number(10,4);  --周收益率
v_month_earning number(16,2);--月收益
v_month_yield number(10,4);  --月收益率
v_total_earning number(16,2); --总收益
v_total_yield number(10,4);  --总收益率
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
cursor c_sim_account is select * from t_sim_account where state=1 and need_settlement=1 and apply_state=1 order by account_id;
tmp_account c_sim_account%rowtype;
v_hist_account t_sim_hist_account%rowtype;
v_tmp_count          number;
v_tmp_time           varchar2(20);
v_lsw_trade_date     varchar2(30);   --上一个周五
v_lsm_trade_date     varchar2(30);   --上月最后一天
v_ls_trade_date      varchar2(30);
v_test_start_date    varchar2(50);
v_test_end_date      varchar2(50);
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;

  select max(t.t_date) into v_ls_trade_date from t_b_skrace_tradedate t where t.t_date<to_char(sysdate,'yyyymmdd') and t.is_trade=1;--查询上一个交易日
  v_lsw_trade_date := getlwtradedate();     --获取上周最后一个交易日
  v_lsm_trade_date := getlmtradedate();     --获取上月最后一个交易日

  --日收益
  update t_sim_account t set(t.day_earnings,t.day_yield) = (select a.total_assets-b.total_assets earning,(a.total_assets-b.total_assets)/b.total_assets yeild from t_sim_account a, t_sim_settlement_account b where a.account_id=b.account_id
            and b.create_date=v_ls_trade_date and t.account_id=a.account_id) where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;

  --周收益
  update t_sim_account t set(t.week_earnings,t.week_yield) = (select a.total_assets-b.total_assets earning,(a.total_assets-b.total_assets)/b.total_assets yeild from t_sim_account a, t_sim_settlement_account b where a.account_id=b.account_id
            and b.create_date=v_lsw_trade_date and t.account_id=a.account_id) where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;

  --月收益
  update t_sim_account t set(t.month_earnings,t.month_yield) = (select a.total_assets-b.total_assets earning,(a.total_assets-b.total_assets)/b.total_assets yeild from t_sim_account a, t_sim_settlement_account b where a.account_id=b.account_id
            and b.create_date=v_lsm_trade_date and t.account_id=a.account_id) where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;

  --累计收益
  update t_sim_account t set t.total_earnings = t.total_assets-t.init_balance,t.total_yield=(t.total_assets-t.init_balance)/t.init_balance where t.state='1' and t.need_settlement=1 and t.apply_state=1;
  commit;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_earning_yield',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_earning_yield',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_earning_yield',po_retcod,v_err_msg);
      return;
end proc_earning_yield;


--账户排名计算
procedure proc_yield_rank_stock
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
cursor c_stock_rank_type is select t.rank_type from t_sim_account t where t.rank_type is not null group by t.rank_type;
tmp_stock_rank_type c_stock_rank_type%rowtype;
cursor c_stock_account_day(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_sim_account where account_type=1
  and pk_account=1 and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(day_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_day c_stock_account_day%rowtype;
cursor c_stock_account_week(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_sim_account where account_type=1
  and pk_account=1 and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType  order by nvl(week_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_week c_stock_account_week%rowtype;
cursor c_stock_account_month(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_sim_account where account_type=1
  and pk_account=1 and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(month_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_month c_stock_account_month%rowtype;
cursor c_stock_account_total(p_rankType varchar2 )
  is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
  month_yield_rankings,month_change,total_yield_rankings,total_change,
  account_id from (select * from t_sim_account where account_type=1
  and pk_account=1 and state=1 and need_settlement=1 and apply_state=1 and rank_type=p_rankType order by nvl(total_yield,0) desc,total_assets desc,create_date asc);
tmp_stock_account_total c_stock_account_total%rowtype;
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
v_week_end           varchar2(10);  --本周末
v_month_end          varchar2(10);  --本月末
v_trade_dayrow       t_b_skrace_tradedate%rowtype;
v_account_info       t_sim_account%rowtype;
begin
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    open c_stock_rank_type;
    loop
    fetch c_stock_rank_type into tmp_stock_rank_type;
    exit when c_stock_rank_type%notfound;
      --模拟炒股日收益排名
      open c_stock_account_day(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_day into tmp_stock_account_day;
      exit when c_stock_account_day%notfound;
        update t_sim_account set day_yield_rankings=tmp_stock_account_day.rownum,
        day_change=nvl2(tmp_stock_account_day.day_yield_rankings,tmp_stock_account_day.day_yield_rankings-tmp_stock_account_day.rownum,0)
        where account_id = tmp_stock_account_day.account_id;
        commit;
      end loop;
      close c_stock_account_day;

      --模拟炒股周收益排名
      open c_stock_account_week(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_week into tmp_stock_account_week;
      exit when c_stock_account_week%notfound;
        update t_sim_account set week_yield_rankings=tmp_stock_account_week.rownum,
        week_change=nvl2(tmp_stock_account_week.week_yield_rankings,tmp_stock_account_week.week_yield_rankings-tmp_stock_account_week.rownum,0)
        where account_id = tmp_stock_account_week.account_id;
        commit;
      end loop;
      close c_stock_account_week;

      --模拟炒股月收益排名
      open c_stock_account_month(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_month into tmp_stock_account_month;
      exit when c_stock_account_month%notfound;
        update t_sim_account set month_yield_rankings=tmp_stock_account_month.rownum,
        month_change=nvl2(tmp_stock_account_month.month_yield_rankings,tmp_stock_account_month.month_yield_rankings-tmp_stock_account_month.rownum,0)
        where account_id = tmp_stock_account_month.account_id;
        commit;
      end loop;
      close c_stock_account_month;

      --模拟炒股总收益排名
      open c_stock_account_total(tmp_stock_rank_type.rank_type);
      loop
      fetch c_stock_account_total into tmp_stock_account_total;
      exit when c_stock_account_total%notfound;
        update t_sim_account set total_yield_rankings=tmp_stock_account_total.rownum,
        total_change=nvl2(tmp_stock_account_total.total_yield_rankings,tmp_stock_account_total.total_yield_rankings-tmp_stock_account_total.rownum,0)
        where account_id = tmp_stock_account_total.account_id;
        commit;
      end loop;
      close c_stock_account_total;

      --每周最后一个交易日及每月最后一个交易日统计周冠军与月冠军
      v_week_end := getendweek;
      v_month_end := getendmonth;
      select * into v_trade_dayrow from t_b_skrace_tradedate t where t.t_date=(select max(t_date) from t_b_skrace_tradedate where t_date<=v_week_end and is_trade=1) ;
      if to_char(sysdate,'yyyymmdd') = v_trade_dayrow.t_date then
         select * into v_account_info from t_sim_account where week_yield_rankings=1 and account_type=1 and state=1 and rank_type =tmp_stock_rank_type.rank_type ;
         insert into t_sim_hist_champion(account_id,total_earn,earn_rate,champion_type,create_date,rank_type)
          values(v_account_info.account_id,v_account_info.week_earnings,v_account_info.week_yield,'0',to_char(sysdate,'yyyymmdd'),tmp_stock_rank_type.rank_type);
         commit;
      end if;
      select * into v_trade_dayrow from t_b_skrace_tradedate t where t.t_date=(select max(t_date) from t_b_skrace_tradedate where t_date<=v_month_end and is_trade=1) ;
      if to_char(sysdate,'yyyymmdd') = v_trade_dayrow.t_date then
         select * into v_account_info from t_sim_account where month_yield_rankings=1 and account_type=1 and state=1 and rank_type =tmp_stock_rank_type.rank_type;
         insert into t_sim_hist_champion(account_id,total_earn,earn_rate,champion_type,create_date,rank_type)
          values(v_account_info.account_id,v_account_info.month_earnings,v_account_info.month_yield,'1',to_char(sysdate,'yyyymmdd'),tmp_stock_rank_type.rank_type);
         commit;
      end if;
    end loop;
    close c_stock_rank_type;
    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_yield_rank_stock',po_retcod,v_err_msg);
    return;

EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_stock',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_stock',po_retcod,v_err_msg);
      return;
end proc_yield_rank_stock;

--大赛排名
procedure proc_yield_rank_match
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  cursor c_now_match is
   select * from t_sim_activity where match_state=1 and activity_trade_type=0;
  tmp_now_match c_now_match%rowtype;
  cursor c_match_account_day(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_sim_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(day_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_day c_match_account_day%rowtype;
  cursor c_match_account_week(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_sim_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(week_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_week c_match_account_week%rowtype;
  cursor c_match_account_month(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_sim_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(month_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_month c_match_account_month%rowtype;
  cursor c_match_account_total(p_match_id varchar2)
     is select rownum,day_yield_rankings,day_change,week_yield_rankings,week_change
        month_yield_rankings,month_change,total_yield_rankings,total_change,
        account_id from (select * from t_sim_account where account_type=2
  and act_id=p_match_id and state=1 and need_settlement=1 order by nvl(total_yield,0) desc,total_assets desc,create_date asc) ;
  tmp_match_account_total c_match_account_total%rowtype;
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time           varchar2(20); --存储过程执行结束时间
  v_trade_dayrow       t_b_skrace_tradedate%rowtype;
  v_account_info       t_sim_account%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
      --大赛账户日排名
      open c_match_account_day(tmp_now_match.act_id);
      loop
         fetch c_match_account_day into tmp_match_account_day;
         exit when c_match_account_day%notfound;
         update t_sim_account set day_yield_rankings=tmp_match_account_day.rownum,
               day_change=nvl2(tmp_match_account_day.day_yield_rankings,tmp_match_account_day.day_yield_rankings-tmp_match_account_day.rownum,0)
               where account_id = tmp_match_account_day.account_id;
         commit;
      end loop;
      close c_match_account_day;
      --大赛账户周排名
      open c_match_account_week(tmp_now_match.act_id);
      loop
         fetch c_match_account_week into tmp_match_account_week;
         exit when c_match_account_week%notfound;
         update t_sim_account set week_yield_rankings=tmp_match_account_week.rownum,
               week_change=nvl2(tmp_match_account_week.week_yield_rankings,tmp_match_account_week.week_yield_rankings-tmp_match_account_week.rownum,0)
               where account_id = tmp_match_account_week.account_id;
         commit;
      end loop;
      close c_match_account_week;
      --大赛账户月排名
      open c_match_account_month(tmp_now_match.act_id);
      loop
         fetch c_match_account_month into tmp_match_account_month;
         exit when c_match_account_month%notfound;
         update t_sim_account set month_yield_rankings=tmp_match_account_month.rownum,
               month_change=nvl2(tmp_match_account_month.month_yield_rankings,tmp_match_account_month.month_yield_rankings-tmp_match_account_month.rownum,0)
               where account_id = tmp_match_account_month.account_id;
         commit;
      end loop;
      close c_match_account_month;
      --大赛账户总排名
      open c_match_account_total(tmp_now_match.act_id);
      loop
         fetch c_match_account_total into tmp_match_account_total;
         exit when c_match_account_total%notfound;
         update t_sim_account set total_yield_rankings=tmp_match_account_total.rownum,
               month_change=nvl2(tmp_match_account_total.total_yield_rankings,tmp_match_account_total.total_yield_rankings-tmp_match_account_total.rownum,0)
               where account_id = tmp_match_account_total.account_id;
         commit;
      end loop;
      close c_match_account_total;
    end;
    --统计大赛冠军
    select * into v_trade_dayrow from t_b_skrace_tradedate t where t.t_date=(select max(t_date) from t_b_skrace_tradedate where t_date<=tmp_now_match.end_date and is_trade=1) ;
    if to_char(sysdate,'yyyymmdd') = v_trade_dayrow.t_date then
       select * into v_account_info from t_sim_account where total_yield_rankings=1 and account_type=2 and act_id=tmp_now_match.act_id;
       insert into t_sim_hist_champion(account_id,total_earn,earn_rate,champion_type,create_date)
        values(v_account_info.account_id,v_account_info.total_earnings,v_account_info.total_yield,'2',to_char(sysdate,'yyyymmdd'));
    end if;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_yield_rank_match',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_match',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_yield_rank_match',po_retcod,v_err_msg);
      return;
end proc_yield_rank_match;

procedure proc_history_transfer
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
v_err_msg            varchar2(1000); --错误信息
v_begin_time         varchar2(20);   --存储过程执行开始时间
v_end_time           varchar2(20); --存储过程执行结束时间
begin
     select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
    -- 历史成交数据迁移
    insert into t_sim_hist_exec_agge
    select a.* from t_sim_exec_agge a,t_sim_account b where a.account_id=b.account_id;

    insert into t_sim_hist_exec_collect
    select a.* from t_sim_exec_collect a,t_sim_account b where a.account_id=b.account_id;

    --历史委托数据迁移(处理状态均为已处理)
    insert into t_sim_hist_order
    (
         serial_num,account_id,order_date,order_time,market_id,stock_code,stock_name,
         trade_type,trade_status,order_qty,order_price,cancel_qty,stap_tax,fare,order_balance,transfer_free,
         remark,commissoin,total_fare,deal_flag,total_balance,bargain_qty,bargain_balance
    )
    select serial_num,a.account_id,order_date,order_time,market_id,stock_code,stock_name,
         trade_type,trade_status,order_qty,order_price,cancel_qty,stap_tax,fare,order_balance,transfer_free,
         a.remark,commissoin,total_fare,deal_flag,total_balance,bargain_qty,bargain_balance from t_sim_today_order a,t_sim_account b where a.account_id=b.account_id and deal_flag=2 ;

    delete from  t_sim_today_order where deal_flag=2 and account_id in (select account_id from t_sim_account);
    delete from t_sim_exec_agge where account_id in (select account_id from t_sim_account);
    delete from t_sim_exec_collect where account_id in (select account_id from t_sim_account);
    commit;

    --账户历史资产数据迁移
    delete from t_sim_hist_account where create_date = to_char(sysdate,'yyyymmdd');
    insert into t_sim_hist_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
    select account_id,money_id,to_char(sysdate,'yyyymmdd'),total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
    from t_sim_account where need_settlement=1 and state=1;
    commit;

    --清算数据缓存表
    delete from t_sim_settlement_account where create_date = to_char(sysdate,'yyyymmdd');
    insert into t_sim_settlement_account(account_id,money_id,create_date,total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings)
    select account_id,money_id,to_char(sysdate,'yyyymmdd'),total_assets,current_balance,total_market,total_earnings,total_yield,total_yield_rankings,week_earnings,week_yield,week_yield_rankings,month_earnings,month_yield,month_yield_rankings,day_earnings,day_yield,day_yield_rankings
    from t_sim_account where need_settlement=1 and state=1;
    commit;

    delete from t_sim_hist_information where trade_date = to_char(sysdate,'yyyymmdd') and sec_type in ('0','2','3','4','5','6','9','11','12','13','14','16','18','66');
    insert into t_sim_hist_information(stock_serino,trade_date,market_id,stock_code,stock_name,sec_type,buy_unit,close_price,open_price,highbuy_price,lowsell_price,now_price,remark)
    select stock_serino,trade_date,market_id,stock_code,stock_name,sec_type,buy_unit,close_price,open_price,highbuy_price,lowsell_price,now_price,remark from t_sim_information where sec_type in ('0','2','3','4','5','6','9','11','12','13','14','16','18','66');
    commit;

    select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
    po_retcod := '0';
    v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
    proc_settlement_log('proc_history_transfer',po_retcod,v_err_msg);
    return;

EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_history_transfer',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_history_transfer',po_retcod,v_err_msg);
      return;
end proc_history_transfer;

procedure proc_match_end_updateaccount
(
   po_retcod                     out     varchar2     --出参返回代码
)
is
  v_err_msg            varchar2(1000); --错误信息
  v_begin_time         varchar2(20);   --存储过程执行开始时间
  v_end_time                  varchar2(20);             --存储过程执行结束时间
  cursor c_now_match is
   select act_id, end_date from t_sim_activity where match_state=1 and activity_trade_type=0;
  tmp_now_match c_now_match%rowtype;
begin
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_begin_time from dual;
  open c_now_match;
  loop
    fetch c_now_match into tmp_now_match;
    exit when c_now_match%notfound;
    begin
      --如果是比赛的最后一天，更新大赛账户清算标志，以后不进行清算
      if tmp_now_match.end_date<=to_char(sysdate,'yyyymmdd') then
         update t_sim_account  set need_settlement=0 where act_id=tmp_now_match.act_id;
         commit;
      end if;
    end;
  end loop;
  close c_now_match;
  select to_char(sysdate,'yyyy-mm-dd hh24:mi:ss') into v_end_time from dual;
  po_retcod := '0';
  v_err_msg := '执行成功'||'--开始时间:'||v_begin_time||',结束时间:'||v_end_time;
  proc_settlement_log('proc_match_end_updateaccount',po_retcod,v_err_msg);
  return;
EXCEPTION
    WHEN no_data_found THEN
      --DBMS_OUTPUT.put_line('出现异常！！' || substr(sqlerrm,1,300));
      ROLLBACK;
      po_retcod := sqlcode;
      v_err_msg := '数据未找到!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_updateaccount',po_retcod,v_err_msg);
      return;
    when others then
      --dbms_output.put_line('出现异常！'|| substr(sqlerrm,1,300));
      rollback;
      po_retcod := sqlcode;
      v_err_msg := '其他异常!' || substr(sqlerrm,1,500);
      proc_settlement_log('proc_match_end_updateaccount',po_retcod,v_err_msg);
      return;
end proc_match_end_updateaccount;


--end stock_settlement;
end stock_settlement_bak;
/
grant execute on SISANSHDATA.STOCK_SETTLEMENT_BAK to SISANSHOPR;



spool off
