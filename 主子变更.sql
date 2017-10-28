declare
   v_user_code  otcts.cuacct.user_code%type not null := 800594786;
   v_main_cuacct_code otcts.cuacct.cuacct_code%type not null :=301619010849;
   v_cuacct_count binary_integer;
   v_cuacct_flag  boolean default true;
   v_cuacct_update varchar2(600);
   v_cuacct_delete varchar2(600);
   v_cuacct_code varchar2(300);  
   type cuacct_table_type is table of otcts.cuacct.cuacct_code%type index by binary_integer;
   v_cuacct_table cuacct_table_type;  
   
   v_sql varchar2(2000);
begin
   --资金账户的处理
   begin
     v_cuacct_update := 'update otcts.cuacct t set t.cuacct_code = '||v_main_cuacct_code||' ,t.int_org = '||substr(v_main_cuacct_code,1,4)||' ,t.upd_timestamp = systimestamp where t.user_code = '
                     ||v_user_code||' and t.cuacct_code = ';
     v_cuacct_delete := 'delete from otcts.cuacct t where t.user_code = '||v_user_code||' and t.cuacct_code in ('; 
     select count(1) into v_cuacct_count from otcts.cuacct t where t.user_code = v_user_code and length(t.cuacct_code)= 12;
     if v_cuacct_count = 0 then
        dbms_output.put_line('--您输入的客户号在OTC未开通资金账户，请KBSS系统先同步资金账户过来');
        return;
     else
        select cuacct_code bulk collect into v_cuacct_table from otcts.cuacct t where t.user_code = v_user_code and length(t.cuacct_code)= 12;
        for i in v_cuacct_table.first..v_cuacct_table.last loop
             if v_cuacct_table(i) = v_main_cuacct_code then
                v_cuacct_flag := false;
                if v_cuacct_table.count = 1 then
                   dbms_output.put_line('--cuacct table is only an main account,no need update. eg: otcts.cuacct.cuacct_code = '||v_cuacct_table(i));
                end if;
             elsif i = v_cuacct_table.last and v_cuacct_flag then
               dbms_output.put_line(v_cuacct_update||v_cuacct_table(i)||';');
             else 
                v_cuacct_code := v_cuacct_code||v_cuacct_table(i)||',';
             end if;
        end loop;  
        if   v_cuacct_code is not null and  v_cuacct_code <> '' then
           dbms_output.put_line(v_cuacct_delete||trim(both ',' from v_cuacct_code)||');');   
        end if;  
        v_cuacct_table.delete; 
        v_cuacct_flag := true;  
        v_cuacct_code :='';
        v_cuacct_update :='';
        v_cuacct_delete :=''; 
     end if; 
   end; 
   --资金资产账户的处理 
   begin  
      v_cuacct_update := 'update otcts.CUACCT_FUND t set t.cuacct_code = '||v_main_cuacct_code||' ,t.int_org = '||substr(v_main_cuacct_code,1,4)||' ,t.upd_time = systimestamp where t.user_code = '
                       ||v_user_code||' and t.cuacct_code = ';
      v_cuacct_delete := 'delete from otcts.CUACCT_FUND t where t.user_code = '||v_user_code||' and t.cuacct_code in ('; 
      select cuacct_code bulk collect into v_cuacct_table from otcts.CUACCT_FUND t where t.user_code = v_user_code and length(t.cuacct_code)= 12;
      for i in v_cuacct_table.first..v_cuacct_table.last loop
           if v_cuacct_table(i) = v_main_cuacct_code then
              v_cuacct_flag := false;
              if v_cuacct_table.count = 1 then
                 dbms_output.put_line('--cuacct table is only an main account,no need update. eg: otcts.CUACCT_FUND.cuacct_code = '||v_cuacct_table(i));
              end if;
           elsif i = v_cuacct_table.last and v_cuacct_flag then
             dbms_output.put_line(v_cuacct_update||v_cuacct_table(i)||';');
           else 
              v_cuacct_code := v_cuacct_code||v_cuacct_table(i)||',';
           end if;
      end loop;  
      if   v_cuacct_code is not null and  v_cuacct_code <> '' then
           dbms_output.put_line(v_cuacct_delete||trim(both ',' from v_cuacct_code)||');');   
      end if;
      v_cuacct_table.delete; 
      v_cuacct_flag := true;  
      v_cuacct_code :='';
      v_cuacct_update :='';
      v_cuacct_delete :=''; 
    end;
    --支付账户的处理
    begin  
      v_cuacct_update := 'update otcts.OTC_CUST_PAYER t set t.cuacct_code = '||v_main_cuacct_code||',t.bank_code = '''',t.bank_acct = '''',t.pay_acct = '''' ,t.upd_timestamp = systimestamp 
                           where t.cust_code = '||v_user_code||' and t.cuacct_code = ';
      v_cuacct_delete := 'delete from otcts.OTC_CUST_PAYER t where t.user_code = '||v_user_code||' and t.cuacct_code in ('; 
      select cuacct_code bulk collect into v_cuacct_table from otcts.OTC_CUST_PAYER t where t.cust_code = v_user_code and length(t.cuacct_code)= 12;
      for i in v_cuacct_table.first..v_cuacct_table.last loop
           if v_cuacct_table(i) = v_main_cuacct_code then
              v_cuacct_flag := false;
              if v_cuacct_table.count = 1 then
                 dbms_output.put_line('--cuacct table is only an main account,no need update. eg: otcts.CUACCT_FUND.cuacct_code = '||v_cuacct_table(i));
              end if;
           elsif i = v_cuacct_table.last and v_cuacct_flag then
             dbms_output.put_line(v_cuacct_update||v_cuacct_table(i)||';');
           else 
              v_cuacct_code := v_cuacct_code||v_cuacct_table(i)||',';
           end if;
      end loop;
      if   v_cuacct_code is not null and  v_cuacct_code <> '' then
           dbms_output.put_line(v_cuacct_delete||trim(both ',' from v_cuacct_code)||');');   
      end if;
      v_cuacct_table.delete; 
      v_cuacct_flag := true;  
      v_cuacct_code :='';
      v_cuacct_update :='';
      v_cuacct_delete :=''; 
    end;
    --基金账户的处理
    declare
      type t_ta_acct_table is table of otcts.otc_ta_acct%rowtype 
      index by binary_integer;
      v_ta_acct_table t_ta_acct_table;
    begin  
      v_cuacct_update := 'update otcts.OTC_TA_ACCT t set t.cuacct_code = '||v_main_cuacct_code||',t.upd_timestamp = systimestamp 
                           where t.cust_code = '||v_user_code||' and t.cuacct_code = ';
      v_cuacct_delete := 'delete from otcts.OTC_TA_ACCT t where t.user_code = '||v_user_code||' and t.cuacct_code = '''' and t.ta_code = '; 
      select * bulk collect into v_ta_acct_table from otcts.OTC_TA_ACCT t where t.cust_code = v_user_code and length(t.cuacct_code)= 12;
      for i in v_cuacct_table.first..v_cuacct_table.last loop
           if v_cuacct_table(i) = v_main_cuacct_code then
              v_cuacct_flag := false;
              if v_cuacct_table.count = 1 then
                 dbms_output.put_line('--cuacct table is only an main account,no need update. eg: otcts.CUACCT_FUND.cuacct_code = '||v_cuacct_table(i));
              end if;
           elsif i = v_cuacct_table.last and v_cuacct_flag then
             dbms_output.put_line(v_cuacct_update||v_cuacct_table(i)||';');
           else 
              v_cuacct_code := v_cuacct_code||v_cuacct_table(i)||',';
           end if;
      end loop;
      if   v_cuacct_code is not null and  v_cuacct_code <> '' then
           dbms_output.put_line(v_cuacct_delete||trim(both ',' from v_cuacct_code)||');');   
      end if;
      v_cuacct_table.delete; 
      v_cuacct_flag := true;  
      v_cuacct_code :='';
      v_cuacct_update :='';
      v_cuacct_delete :=''; 
    end;
end;
