------------------------------------------------
-- Export file for user SISANSHDATA           --
-- Created by LIWU645 on 2017-10-23, 15:19:51 --
------------------------------------------------

spool sisanshdata_normal.log

prompt
prompt Creating table ACCOUNT_1218BAK
prompt ==============================
prompt
create table SISANSHDATA.ACCOUNT_1218BAK
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.ACCOUNT_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table ACCOUNT_1228BAK
prompt ==============================
prompt
create table SISANSHDATA.ACCOUNT_1228BAK
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.ACCOUNT_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table ACCOUNT_SETTLE_TEMP
prompt ==================================
prompt
create table SISANSHDATA.ACCOUNT_SETTLE_TEMP
(
  V_TOTAL_MARKET NUMBER,
  ACCOUNT_ID     VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.INDEX_ACCOUNT_SETTLE_TEMP on SISANSHDATA.ACCOUNT_SETTLE_TEMP (ACCOUNT_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.ACCOUNT_SETTLE_TEMP to SISANSHOPR;

prompt
prompt Creating table ACTIVITY_1218BAK
prompt ===============================
prompt
create table SISANSHDATA.ACTIVITY_1218BAK
(
  ACT_ID              VARCHAR2(50) not null,
  ACT_NAME            VARCHAR2(100) not null,
  AD_MESSAGE          VARCHAR2(200),
  INIT_MONEY          NUMBER(16,4) not null,
  INTRODUCTION        VARCHAR2(1000),
  APPLY_BEGIN_DATE    CHAR(8) not null,
  APPLY_END_DATE      CHAR(8) not null,
  BEGIN_DATE          CHAR(8) not null,
  END_DATE            CHAR(8) not null,
  CREATE_DATE         VARCHAR2(30),
  MODIFY_DATE         VARCHAR2(30),
  PARTNER             VARCHAR2(50),
  CONTACT             VARCHAR2(50),
  PHONE1              VARCHAR2(20),
  PHONE2              VARCHAR2(20),
  EMAIL               VARCHAR2(50),
  REMARK              VARCHAR2(100),
  IS_HOT              CHAR(2),
  MATCH_STATE         CHAR(2),
  APPLY_STATE         CHAR(2) not null,
  ACTIVITY_TYPE       NUMBER(1),
  ACTIVITY_TRADE_TYPE NUMBER(1),
  STATUS              NUMBER(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.ACTIVITY_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table ACTIVITY_1228BAK
prompt ===============================
prompt
create table SISANSHDATA.ACTIVITY_1228BAK
(
  ACT_ID              VARCHAR2(50) not null,
  ACT_NAME            VARCHAR2(100) not null,
  AD_MESSAGE          VARCHAR2(200),
  INIT_MONEY          NUMBER(16,4) not null,
  INTRODUCTION        VARCHAR2(1000),
  APPLY_BEGIN_DATE    CHAR(8) not null,
  APPLY_END_DATE      CHAR(8) not null,
  BEGIN_DATE          CHAR(8) not null,
  END_DATE            CHAR(8) not null,
  CREATE_DATE         VARCHAR2(30),
  MODIFY_DATE         VARCHAR2(30),
  PARTNER             VARCHAR2(50),
  CONTACT             VARCHAR2(50),
  PHONE1              VARCHAR2(20),
  PHONE2              VARCHAR2(20),
  EMAIL               VARCHAR2(50),
  REMARK              VARCHAR2(100),
  IS_HOT              CHAR(2),
  MATCH_STATE         CHAR(2),
  APPLY_STATE         CHAR(2) not null,
  ACTIVITY_TYPE       NUMBER(1),
  ACTIVITY_TRADE_TYPE NUMBER(1),
  STATUS              NUMBER(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
grant select on SISANSHDATA.ACTIVITY_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table CANORDER_1218BAK
prompt ===============================
prompt
create table SISANSHDATA.CANORDER_1218BAK
(
  CANCEL_NO     NUMBER(10) not null,
  ORDER_NO      NUMBER(10) not null,
  ACCOUNT_ID    NUMBER(10) not null,
  CREATE_DATE   VARCHAR2(30) not null,
  CANCEL_STATUS CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.CANORDER_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table CANORDER_1228BAK
prompt ===============================
prompt
create table SISANSHDATA.CANORDER_1228BAK
(
  CANCEL_NO     NUMBER(10) not null,
  ORDER_NO      NUMBER(10) not null,
  ACCOUNT_ID    NUMBER(10) not null,
  CREATE_DATE   VARCHAR2(30) not null,
  CANCEL_STATUS CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.CANORDER_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table COMPLETEPROFIT_1218BAK
prompt =====================================
prompt
create table SISANSHDATA.COMPLETEPROFIT_1218BAK
(
  PROFIT_ID          NUMBER not null,
  STOCK_CODE         VARCHAR2(10),
  MARKET_ID          VARCHAR2(3),
  STOCK_NAME         VARCHAR2(30),
  TRADE_TERM         NUMBER,
  STK_QTY            NUMBER(10),
  CLOST_PRICE        NUMBER(10,2),
  SELL_AVERAGE_PRICE NUMBER(10,2),
  EARN_RATE          NUMBER(10,4),
  EARN               NUMBER(10,2),
  TRADE_FARE         NUMBER(10,2),
  START_DATE         VARCHAR2(30),
  END_DATE           VARCHAR2(30),
  HOLD_SRLNUM        NUMBER(10),
  ACCOUNT_ID         VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.COMPLETEPROFIT_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table COMPLETEPROFIT_1228BAK
prompt =====================================
prompt
create table SISANSHDATA.COMPLETEPROFIT_1228BAK
(
  PROFIT_ID          NUMBER not null,
  STOCK_CODE         VARCHAR2(10),
  MARKET_ID          VARCHAR2(3),
  STOCK_NAME         VARCHAR2(30),
  TRADE_TERM         NUMBER,
  STK_QTY            NUMBER(10),
  CLOST_PRICE        NUMBER(10,2),
  SELL_AVERAGE_PRICE NUMBER(10,2),
  EARN_RATE          NUMBER(10,4),
  EARN               NUMBER(10,2),
  TRADE_FARE         NUMBER(10,2),
  START_DATE         VARCHAR2(30),
  END_DATE           VARCHAR2(30),
  HOLD_SRLNUM        NUMBER(10),
  ACCOUNT_ID         VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.COMPLETEPROFIT_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table EXECAGGE_1218BAK
prompt ===============================
prompt
create table SISANSHDATA.EXECAGGE_1218BAK
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(50),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
grant select on SISANSHDATA.EXECAGGE_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table EXECAGGE_1228BAK
prompt ===============================
prompt
create table SISANSHDATA.EXECAGGE_1228BAK
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(50),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
grant select on SISANSHDATA.EXECAGGE_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISHOLDSTO_1218BAK
prompt =================================
prompt
create table SISANSHDATA.HISHOLDSTO_1218BAK
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISHOLDSTO_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISHOLDSTO_1228BAK
prompt =================================
prompt
create table SISANSHDATA.HISHOLDSTO_1228BAK
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISHOLDSTO_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISTACCOUNT_1218BAK
prompt ==================================
prompt
create table SISANSHDATA.HISTACCOUNT_1218BAK
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISTACCOUNT_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISTACCOUNT_1228BAK
prompt ==================================
prompt
create table SISANSHDATA.HISTACCOUNT_1228BAK
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISTACCOUNT_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISTCHAMPION_1218BAK
prompt ===================================
prompt
create table SISANSHDATA.HISTCHAMPION_1218BAK
(
  ACCOUNT_ID    NUMBER(10) not null,
  TOTAL_EARN    NUMBER(16,2),
  EARN_RATE     NUMBER(10,4),
  CHAMPION_TYPE VARCHAR2(2),
  CREATE_DATE   VARCHAR2(30),
  TRADE_TYPE    CHAR(1),
  RANK_TYPE     CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISTCHAMPION_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISTCHAMPION_1228BAK
prompt ===================================
prompt
create table SISANSHDATA.HISTCHAMPION_1228BAK
(
  ACCOUNT_ID    NUMBER(10) not null,
  TOTAL_EARN    NUMBER(16,2),
  EARN_RATE     NUMBER(10,4),
  CHAMPION_TYPE VARCHAR2(2),
  CREATE_DATE   VARCHAR2(30),
  TRADE_TYPE    CHAR(1),
  RANK_TYPE     CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISTCHAMPION_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISTEXECAGGE_1218BAK
prompt ===================================
prompt
create table SISANSHDATA.HISTEXECAGGE_1218BAK
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISTEXECAGGE_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISTEXECAGGE_1228BAK
prompt ===================================
prompt
create table SISANSHDATA.HISTEXECAGGE_1228BAK
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISTEXECAGGE_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISTORDER_1218BAK
prompt ================================
prompt
create table SISANSHDATA.HISTORDER_1218BAK
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISTORDER_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HISTORDER_1228BAK
prompt ================================
prompt
create table SISANSHDATA.HISTORDER_1228BAK
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HISTORDER_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HOLDSTOCK_1218BAK
prompt ================================
prompt
create table SISANSHDATA.HOLDSTOCK_1218BAK
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HOLDSTOCK_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table HOLDSTOCK_1228BAK
prompt ================================
prompt
create table SISANSHDATA.HOLDSTOCK_1228BAK
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.HOLDSTOCK_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table RECOMSTATIS_1218BAK
prompt ==================================
prompt
create table SISANSHDATA.RECOMSTATIS_1218BAK
(
  RS_ID                 NUMBER(12) not null,
  USER_ID               VARCHAR2(30) not null,
  LASTUPDATE            VARCHAR2(30),
  WEEK_SUM_COUNT        NUMBER(12),
  WEEK_SUM_RIGHT_COUNT  NUMBER(12),
  WEEK_SUM_RATE         NUMBER(5,2),
  WEEK_RANK             NUMBER(10),
  MONTH_SUM_COUNT       NUMBER(12),
  MONTH_SUM_RIGHT_COUNT NUMBER(12),
  MONTH_SUM_RATE        NUMBER(5,2),
  MONTH_RANK            NUMBER(10),
  TOTAL_SUM_COUNT       NUMBER(12),
  TOTAL_SUM_RIGHT_COUNT NUMBER(12),
  TOTAL_SUM_RATE        NUMBER(5,2),
  TOTAL_RANK            NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.RECOMSTATIS_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table RECOMSTATIS_1228BAK
prompt ==================================
prompt
create table SISANSHDATA.RECOMSTATIS_1228BAK
(
  RS_ID                 NUMBER(12) not null,
  USER_ID               VARCHAR2(30) not null,
  LASTUPDATE            VARCHAR2(30),
  WEEK_SUM_COUNT        NUMBER(12),
  WEEK_SUM_RIGHT_COUNT  NUMBER(12),
  WEEK_SUM_RATE         NUMBER(5,2),
  WEEK_RANK             NUMBER(10),
  MONTH_SUM_COUNT       NUMBER(12),
  MONTH_SUM_RIGHT_COUNT NUMBER(12),
  MONTH_SUM_RATE        NUMBER(5,2),
  MONTH_RANK            NUMBER(10),
  TOTAL_SUM_COUNT       NUMBER(12),
  TOTAL_SUM_RIGHT_COUNT NUMBER(12),
  TOTAL_SUM_RATE        NUMBER(5,2),
  TOTAL_RANK            NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.RECOMSTATIS_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table RECOMSTOCK_1218BAK
prompt =================================
prompt
create table SISANSHDATA.RECOMSTOCK_1218BAK
(
  R_ID          NUMBER(12) not null,
  USER_ID       VARCHAR2(20) not null,
  STOCK_CODE    VARCHAR2(10) not null,
  STOCK_NAME    VARCHAR2(30),
  EXPECT_DATE   NUMBER(3) not null,
  EXPECT_INCOME NUMBER(4,2),
  BEGIN_TIME    VARCHAR2(30),
  BEGIN_PRICE   NUMBER(6,2),
  TARGET_PRICE  NUMBER(6,2),
  REASON        VARCHAR2(500),
  STATE         CHAR(1),
  END_TIME      VARCHAR2(30),
  END_INCOME    NUMBER(4,2),
  END_PRICE     NUMBER(6,2),
  IS_GIVEUP     CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.RECOMSTOCK_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table RECOMSTOCK_1228BAK
prompt =================================
prompt
create table SISANSHDATA.RECOMSTOCK_1228BAK
(
  R_ID          NUMBER(12) not null,
  USER_ID       VARCHAR2(20) not null,
  STOCK_CODE    VARCHAR2(10) not null,
  STOCK_NAME    VARCHAR2(30),
  EXPECT_DATE   NUMBER(3) not null,
  EXPECT_INCOME NUMBER(4,2),
  BEGIN_TIME    VARCHAR2(30),
  BEGIN_PRICE   NUMBER(6,2),
  TARGET_PRICE  NUMBER(6,2),
  REASON        VARCHAR2(500),
  STATE         CHAR(1),
  END_TIME      VARCHAR2(30),
  END_INCOME    NUMBER(4,2),
  END_PRICE     NUMBER(6,2),
  IS_GIVEUP     CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.RECOMSTOCK_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table RECOVER_DATA_TIME
prompt ================================
prompt
create table SISANSHDATA.RECOVER_DATA_TIME
(
  COUNT_DATE VARCHAR2(30),
  RUN_DATE   DATE
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.RECOVER_DATA_TIME to R_SISANSHDATA_QRY;

prompt
prompt Creating table SCOREFLOW_1218BAK
prompt ================================
prompt
create table SISANSHDATA.SCOREFLOW_1218BAK
(
  FLOW_ID     NUMBER(10),
  USER_ID     VARCHAR2(20),
  SCORE       NUMBER,
  REASON      VARCHAR2(1000),
  CREATE_DATE VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.SCOREFLOW_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table SCOREFLOW_1228BAK
prompt ================================
prompt
create table SISANSHDATA.SCOREFLOW_1228BAK
(
  FLOW_ID     NUMBER(10),
  USER_ID     VARCHAR2(20),
  SCORE       NUMBER,
  REASON      VARCHAR2(1000),
  CREATE_DATE VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.SCOREFLOW_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table SETLOG_1218BAK
prompt =============================
prompt
create table SISANSHDATA.SETLOG_1218BAK
(
  ID             NUMBER not null,
  PROCEDURE_NAME VARCHAR2(50),
  ERR_CODE       VARCHAR2(30) not null,
  ERR_MSG        VARCHAR2(1000) not null,
  CREATE_DATE    VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.SETLOG_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table SETLOG_1228BAK
prompt =============================
prompt
create table SISANSHDATA.SETLOG_1228BAK
(
  ID             NUMBER not null,
  PROCEDURE_NAME VARCHAR2(50),
  ERR_CODE       VARCHAR2(30) not null,
  ERR_MSG        VARCHAR2(1000) not null,
  CREATE_DATE    VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.SETLOG_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table SIM_ACTIVITY_APPLY_1228_BAK
prompt ==========================================
prompt
create table SISANSHDATA.SIM_ACTIVITY_APPLY_1228_BAK
(
  ID          NUMBER(20) not null,
  USER_ID     VARCHAR2(20) not null,
  ACT_ID      VARCHAR2(50) not null,
  STATE       NUMBER(2),
  REALNAME    VARCHAR2(50),
  MOBILE      VARCHAR2(30),
  CREATE_DATE VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
grant select on SISANSHDATA.SIM_ACTIVITY_APPLY_1228_BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table SUBSCRIBE_1218BAK
prompt ================================
prompt
create table SISANSHDATA.SUBSCRIBE_1218BAK
(
  SUBSCRIBE_ID    NUMBER(10) not null,
  SUBSCRIBE_STATE CHAR(1),
  USER_ID         VARCHAR2(20),
  SUBSCRIBE_PRICE NUMBER(10),
  SUBSCRIBE_TYPE  CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.SUBSCRIBE_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table SUBSCRIBE_1228BAK
prompt ================================
prompt
create table SISANSHDATA.SUBSCRIBE_1228BAK
(
  SUBSCRIBE_ID    NUMBER(10) not null,
  SUBSCRIBE_STATE CHAR(1),
  USER_ID         VARCHAR2(20),
  SUBSCRIBE_PRICE NUMBER(10),
  SUBSCRIBE_TYPE  CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.SUBSCRIBE_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table SUBSUSER_1218BAK
prompt ===============================
prompt
create table SISANSHDATA.SUBSUSER_1218BAK
(
  SERI_NUM       NUMBER(10) not null,
  FROM_USER_ID   VARCHAR2(20) not null,
  TO_USER_ID     VARCHAR2(20) not null,
  SUBSCRIBE_TERM NUMBER not null,
  START_DATE     VARCHAR2(30) not null,
  END_DATE       VARCHAR2(30) not null,
  STATE          CHAR(1) not null,
  SUBSCRIBE_TYPE CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.SUBSUSER_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table SUBSUSER_1228BAK
prompt ===============================
prompt
create table SISANSHDATA.SUBSUSER_1228BAK
(
  SERI_NUM       NUMBER(10) not null,
  FROM_USER_ID   VARCHAR2(20) not null,
  TO_USER_ID     VARCHAR2(20) not null,
  SUBSCRIBE_TERM NUMBER not null,
  START_DATE     VARCHAR2(30) not null,
  END_DATE       VARCHAR2(30) not null,
  STATE          CHAR(1) not null,
  SUBSCRIBE_TYPE CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
grant select on SISANSHDATA.SUBSUSER_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table TODAYORDER_1218BAK
prompt =================================
prompt
create table SISANSHDATA.TODAYORDER_1218BAK
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(50),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
grant select on SISANSHDATA.TODAYORDER_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table TODAYORDER_1228BAK
prompt =================================
prompt
create table SISANSHDATA.TODAYORDER_1228BAK
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(50),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
grant select on SISANSHDATA.TODAYORDER_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_AD
prompt ===================
prompt
create table SISANSHDATA.T_AD
(
  AD_ID         NUMBER(10) not null,
  SITENO        VARCHAR2(50),
  GROUP_NO      VARCHAR2(50),
  TYPE          NUMBER(10),
  NAME          VARCHAR2(255),
  URL           VARCHAR2(255),
  PICTURE       VARCHAR2(255),
  WIDTH         NUMBER(10),
  HEIGHT        NUMBER(10),
  ORDERLINE     NUMBER(10),
  STATE         NUMBER(10),
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(20),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(20),
  START_TIME    VARCHAR2(30),
  END_TIME      VARCHAR2(30),
  FILE_TYPE     VARCHAR2(5),
  DESCRIPTION   CLOB,
  FILE_STATE    VARCHAR2(5),
  TEMPLATE      VARCHAR2(5),
  TEMPLATE_SIZE VARCHAR2(5),
  TITLE         VARCHAR2(500),
  SMALL_PICTURE VARCHAR2(255),
  SMALL_WIDTH   NUMBER(10),
  SMALL_HEIGHT  NUMBER(10),
  GROUP_ID      VARCHAR2(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_AD
  is 'T_AD';
comment on column SISANSHDATA.T_AD.AD_ID
  is 'AD_ID';
comment on column SISANSHDATA.T_AD.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_AD.GROUP_NO
  is 'GROUP_NO';
comment on column SISANSHDATA.T_AD.TYPE
  is 'TYPE';
comment on column SISANSHDATA.T_AD.NAME
  is 'NAME';
comment on column SISANSHDATA.T_AD.URL
  is 'URL';
comment on column SISANSHDATA.T_AD.PICTURE
  is 'PICTURE';
comment on column SISANSHDATA.T_AD.WIDTH
  is 'WIDTH';
comment on column SISANSHDATA.T_AD.HEIGHT
  is 'HEIGHT';
comment on column SISANSHDATA.T_AD.ORDERLINE
  is 'ORDERLINE';
comment on column SISANSHDATA.T_AD.STATE
  is 'STATE';
comment on column SISANSHDATA.T_AD.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_AD.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_AD.MODIFIED_BY
  is 'MODIFIED_BY';
comment on column SISANSHDATA.T_AD.MODIFIED_DATE
  is 'MODIFIED_DATE';
comment on column SISANSHDATA.T_AD.START_TIME
  is 'START_TIME';
comment on column SISANSHDATA.T_AD.END_TIME
  is 'END_TIME';
comment on column SISANSHDATA.T_AD.FILE_TYPE
  is 'FILE_TYPE';
comment on column SISANSHDATA.T_AD.DESCRIPTION
  is 'DESCRIPTION';
comment on column SISANSHDATA.T_AD.FILE_STATE
  is 'FILE_STATE';
comment on column SISANSHDATA.T_AD.TEMPLATE
  is 'TEMPLATE';
comment on column SISANSHDATA.T_AD.TEMPLATE_SIZE
  is 'TEMPLATE_SIZE';
comment on column SISANSHDATA.T_AD.TITLE
  is 'TITLE';
comment on column SISANSHDATA.T_AD.SMALL_PICTURE
  is 'SMALL_PICTURE';
comment on column SISANSHDATA.T_AD.SMALL_WIDTH
  is 'SMALL_WIDTH';
comment on column SISANSHDATA.T_AD.SMALL_HEIGHT
  is 'SMALL_HEIGHT';
comment on column SISANSHDATA.T_AD.GROUP_ID
  is 'GROUP_ID';
alter table SISANSHDATA.T_AD
  add constraint PK_T_AD primary key (AD_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_AD to SISANSHOPR;

prompt
prompt Creating table T_AD_GROUP
prompt =========================
prompt
create table SISANSHDATA.T_AD_GROUP
(
  ID            NUMBER(10) not null,
  NAME          VARCHAR2(255) not null,
  SITENO        VARCHAR2(50) not null,
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(20),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(20),
  ORDERLINE     NUMBER(10),
  GROUP_NO      VARCHAR2(50),
  INTERVALL     VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_AD_GROUP
  is 'T_AD_GROUP';
comment on column SISANSHDATA.T_AD_GROUP.ID
  is 'ID';
comment on column SISANSHDATA.T_AD_GROUP.NAME
  is 'NAME';
comment on column SISANSHDATA.T_AD_GROUP.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_AD_GROUP.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_AD_GROUP.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_AD_GROUP.MODIFIED_BY
  is 'MODIFIED_BY';
comment on column SISANSHDATA.T_AD_GROUP.MODIFIED_DATE
  is 'MODIFIED_DATE';
comment on column SISANSHDATA.T_AD_GROUP.ORDERLINE
  is 'ORDERLINE';
comment on column SISANSHDATA.T_AD_GROUP.GROUP_NO
  is 'GROUP_NO';
comment on column SISANSHDATA.T_AD_GROUP.INTERVALL
  is 'INTERVALL';
alter table SISANSHDATA.T_AD_GROUP
  add constraint PK_AD_GROUP primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_AD_GROUP to SISANSHOPR;

prompt
prompt Creating table T_ARTICLE
prompt ========================
prompt
create table SISANSHDATA.T_ARTICLE
(
  ARTICLE_ID      NUMBER(10) not null,
  TITLE           VARCHAR2(500) not null,
  SHOW_TITLE      VARCHAR2(500),
  BRIEF           VARCHAR2(4000),
  URL             VARCHAR2(255),
  KEYWORD         VARCHAR2(255),
  REL_KEYWORD     VARCHAR2(50),
  AUTHOR          VARCHAR2(255),
  SOURCE          VARCHAR2(500),
  IS_PICTURE      NUMBER(10),
  PICTURE_URL     VARCHAR2(255),
  IS_HOT          NUMBER(10) default 0,
  IS_NEW          NUMBER(10) default 0,
  IS_HEAD         NUMBER(10) default 0,
  PUBLISH_BY      VARCHAR2(50),
  PUBLISH_DATE    VARCHAR2(30),
  CATALOG_ID      NUMBER(10),
  SITENO          VARCHAR2(50),
  TYPE            NUMBER(10) not null,
  LINK_URL        VARCHAR2(200),
  STATE           NUMBER(10),
  ORDERLINE       NUMBER(10),
  REVIEW          NUMBER(10),
  COMMENT_TIMES   NUMBER(10),
  HITS            NUMBER(10),
  IN_FLAG         NUMBER(10),
  USER_RIGHT      VARCHAR2(2000),
  ROLE_RIGHT      VARCHAR2(2000),
  CREATE_BY       VARCHAR2(50),
  CREATE_DATE     VARCHAR2(30),
  MODIFIED_BY     VARCHAR2(50),
  MODIFIED_DATE   VARCHAR2(30),
  REL_SECU        VARCHAR2(1000),
  BEGIN_TIME      VARCHAR2(20),
  END_TIME        VARCHAR2(20),
  IMPORTANT_LEVEL VARCHAR2(20),
  GUID            VARCHAR2(100),
  NETWORK_NAME    VARCHAR2(30),
  GPDM            VARCHAR2(100),
  DATA_TYPE       VARCHAR2(10),
  CATALOG_NO      VARCHAR2(255),
  SOURCE_UNIQUE   VARCHAR2(30),
  FOREWORD        VARCHAR2(1000),
  REL_SECU_NAME   VARCHAR2(20),
  LASTMODIFYTIME  VARCHAR2(30),
  INDUSTRY_TYPE   VARCHAR2(30),
  COLUMN_LEVEL    NUMBER(10),
  PUBLISH_TIMING  VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_ARTICLE
  is '���±�';
comment on column SISANSHDATA.T_ARTICLE.ARTICLE_ID
  is 'ARTICLE_ID';
comment on column SISANSHDATA.T_ARTICLE.TITLE
  is 'TITLE';
comment on column SISANSHDATA.T_ARTICLE.SHOW_TITLE
  is 'SHOW_TITLE';
comment on column SISANSHDATA.T_ARTICLE.BRIEF
  is 'BRIEF';
comment on column SISANSHDATA.T_ARTICLE.URL
  is 'URL';
comment on column SISANSHDATA.T_ARTICLE.KEYWORD
  is 'KEYWORD';
comment on column SISANSHDATA.T_ARTICLE.REL_KEYWORD
  is 'REL_KEYWORD';
comment on column SISANSHDATA.T_ARTICLE.AUTHOR
  is 'AUTHOR';
comment on column SISANSHDATA.T_ARTICLE.SOURCE
  is 'SOURCE';
comment on column SISANSHDATA.T_ARTICLE.IS_PICTURE
  is 'IS_PICTURE';
comment on column SISANSHDATA.T_ARTICLE.PICTURE_URL
  is 'PICTURE_URL';
comment on column SISANSHDATA.T_ARTICLE.IS_HOT
  is 'IS_HOT';
comment on column SISANSHDATA.T_ARTICLE.IS_NEW
  is 'IS_NEW';
comment on column SISANSHDATA.T_ARTICLE.IS_HEAD
  is 'IS_HEAD';
comment on column SISANSHDATA.T_ARTICLE.PUBLISH_BY
  is 'PUBLISH_BY';
comment on column SISANSHDATA.T_ARTICLE.PUBLISH_DATE
  is 'PUBLISH_DATE';
comment on column SISANSHDATA.T_ARTICLE.CATALOG_ID
  is 'CATALOG_ID';
comment on column SISANSHDATA.T_ARTICLE.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_ARTICLE.TYPE
  is 'TYPE';
comment on column SISANSHDATA.T_ARTICLE.LINK_URL
  is 'LINK_URL';
comment on column SISANSHDATA.T_ARTICLE.STATE
  is 'STATE';
comment on column SISANSHDATA.T_ARTICLE.ORDERLINE
  is 'ORDERLINE';
comment on column SISANSHDATA.T_ARTICLE.REVIEW
  is 'REVIEW';
comment on column SISANSHDATA.T_ARTICLE.COMMENT_TIMES
  is 'COMMENT_TIMES';
comment on column SISANSHDATA.T_ARTICLE.HITS
  is 'HITS';
comment on column SISANSHDATA.T_ARTICLE.IN_FLAG
  is 'IN_FLAG';
comment on column SISANSHDATA.T_ARTICLE.USER_RIGHT
  is 'USER_RIGHT';
comment on column SISANSHDATA.T_ARTICLE.ROLE_RIGHT
  is 'ROLE_RIGHT';
comment on column SISANSHDATA.T_ARTICLE.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_ARTICLE.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_ARTICLE.MODIFIED_BY
  is 'MODIFIED_BY';
comment on column SISANSHDATA.T_ARTICLE.MODIFIED_DATE
  is 'MODIFIED_DATE';
comment on column SISANSHDATA.T_ARTICLE.REL_SECU
  is 'REL_SECU';
comment on column SISANSHDATA.T_ARTICLE.BEGIN_TIME
  is 'BEGIN_TIME';
comment on column SISANSHDATA.T_ARTICLE.END_TIME
  is 'END_TIME';
comment on column SISANSHDATA.T_ARTICLE.IMPORTANT_LEVEL
  is 'IMPORTANT_LEVEL';
comment on column SISANSHDATA.T_ARTICLE.GUID
  is 'GUID';
comment on column SISANSHDATA.T_ARTICLE.NETWORK_NAME
  is 'NETWORK_NAME';
comment on column SISANSHDATA.T_ARTICLE.GPDM
  is 'GPDM';
comment on column SISANSHDATA.T_ARTICLE.DATA_TYPE
  is 'DATA_TYPE';
comment on column SISANSHDATA.T_ARTICLE.CATALOG_NO
  is 'CATALOG_NO';
comment on column SISANSHDATA.T_ARTICLE.SOURCE_UNIQUE
  is 'SOURCE_UNIQUE';
comment on column SISANSHDATA.T_ARTICLE.FOREWORD
  is 'FOREWORD';
comment on column SISANSHDATA.T_ARTICLE.REL_SECU_NAME
  is 'REL_SECU_NAME';
comment on column SISANSHDATA.T_ARTICLE.LASTMODIFYTIME
  is 'LASTMODIFYTIME';
comment on column SISANSHDATA.T_ARTICLE.INDUSTRY_TYPE
  is 'INDUSTRY_TYPE';
comment on column SISANSHDATA.T_ARTICLE.COLUMN_LEVEL
  is 'COLUMN_LEVEL';
comment on column SISANSHDATA.T_ARTICLE.PUBLISH_TIMING
  is '�����Զ���ʱ�䷢��';
alter table SISANSHDATA.T_ARTICLE
  add constraint PK_T_ARTICLE primary key (ARTICLE_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
create index SISANSHDATA.INX_T_ARTICLE_CATALOGID on SISANSHDATA.T_ARTICLE (CATALOG_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
create index SISANSHDATA.INX_T_ARTICLE_CATALOGNO on SISANSHDATA.T_ARTICLE (CATALOG_NO)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
create index SISANSHDATA.INX_T_ARTICLE_GPDM on SISANSHDATA.T_ARTICLE (GPDM)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
create index SISANSHDATA.INX_T_ARTICLE_GUID on SISANSHDATA.T_ARTICLE (GUID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
create index SISANSHDATA.INX_T_ARTICLE_ISHOT on SISANSHDATA.T_ARTICLE (IS_HOT)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
create index SISANSHDATA.INX_T_ARTICLE_SU on SISANSHDATA.T_ARTICLE (SOURCE_UNIQUE)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_ARTICLE to SISANSHOPR;

prompt
prompt Creating table T_ARTICLE_SOURCE
prompt ===============================
prompt
create table SISANSHDATA.T_ARTICLE_SOURCE
(
  ID            NUMBER(10) not null,
  NAME          VARCHAR2(100) not null,
  URL           VARCHAR2(255),
  SITENO        VARCHAR2(50) not null,
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(20),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(20)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_ARTICLE_SOURCE
  is 'T_ARTICLE_SOURCE';
comment on column SISANSHDATA.T_ARTICLE_SOURCE.ID
  is 'ID';
comment on column SISANSHDATA.T_ARTICLE_SOURCE.NAME
  is 'NAME';
comment on column SISANSHDATA.T_ARTICLE_SOURCE.URL
  is 'URL';
comment on column SISANSHDATA.T_ARTICLE_SOURCE.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_ARTICLE_SOURCE.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_ARTICLE_SOURCE.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_ARTICLE_SOURCE.MODIFIED_BY
  is 'MODIFIED_BY';
comment on column SISANSHDATA.T_ARTICLE_SOURCE.MODIFIED_DATE
  is 'MODIFIED_DATE';
alter table SISANSHDATA.T_ARTICLE_SOURCE
  add constraint PK_T_ARTICLE_SOURCE primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_ARTICLE_SOURCE to SISANSHOPR;

prompt
prompt Creating table T_B_CLIENT_BUSINFO
prompt =================================
prompt
create table SISANSHDATA.T_B_CLIENT_BUSINFO
(
  ID          NUMBER(30) not null,
  CLIENT_ID   VARCHAR2(30),
  CLIENT_NAME VARCHAR2(50),
  BUSTYPE     VARCHAR2(2),
  BUSCONTENT  CLOB,
  CREATE_DATE VARCHAR2(30),
  CHANCEL     VARCHAR2(2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column SISANSHDATA.T_B_CLIENT_BUSINFO.ID
  is 'id������';
comment on column SISANSHDATA.T_B_CLIENT_BUSINFO.CLIENT_ID
  is '�ͻ����';
comment on column SISANSHDATA.T_B_CLIENT_BUSINFO.CLIENT_NAME
  is '�ͻ�����';
comment on column SISANSHDATA.T_B_CLIENT_BUSINFO.BUSTYPE
  is 'ҵ������';
comment on column SISANSHDATA.T_B_CLIENT_BUSINFO.BUSCONTENT
  is 'ҵ������';
comment on column SISANSHDATA.T_B_CLIENT_BUSINFO.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_B_CLIENT_BUSINFO.CHANCEL
  is '��������:0��PC��ҳ��1��PC�ͻ��ˣ�2��android��3��ios�� 9������';
alter table SISANSHDATA.T_B_CLIENT_BUSINFO
  add constraint PK_CLIENT_BUSINFO primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
create index SISANSHDATA.INDEX_CLIENT_BUSINFO_CLIENT_ID on SISANSHDATA.T_B_CLIENT_BUSINFO (CLIENT_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_B_CLIENT_BUSINFO to SISANSHOPR;

prompt
prompt Creating table T_B_CLIENT_MSG
prompt =============================
prompt
create table SISANSHDATA.T_B_CLIENT_MSG
(
  ID           NUMBER(20) not null,
  TYPE         VARCHAR2(1),
  LINK         VARCHAR2(200),
  TITLE        VARCHAR2(200),
  CONTENT      VARCHAR2(3000),
  STATE        VARCHAR2(1),
  READFLAG     VARCHAR2(1),
  SOURCE       VARCHAR2(100),
  CREATETIME   VARCHAR2(30),
  CREATEBY     VARCHAR2(50),
  PUBLISHBY    VARCHAR2(50),
  PASSBY       VARCHAR2(50),
  EDITBY       VARCHAR2(50),
  CLIENTID     VARCHAR2(100),
  CONTENT_TYPE VARCHAR2(1),
  PUBLISHTIME  VARCHAR2(30),
  CLIENTNAME   VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column SISANSHDATA.T_B_CLIENT_MSG.ID
  is '����(��Ϣid)';
comment on column SISANSHDATA.T_B_CLIENT_MSG.TYPE
  is '��Ϣ���(0:��Ѷ��1��Ͷ��)';
comment on column SISANSHDATA.T_B_CLIENT_MSG.LINK
  is '��Ϣ����';
comment on column SISANSHDATA.T_B_CLIENT_MSG.TITLE
  is '����';
comment on column SISANSHDATA.T_B_CLIENT_MSG.CONTENT
  is '����';
comment on column SISANSHDATA.T_B_CLIENT_MSG.STATE
  is '״̬(0:�༭״̬,1:���״̬,2:����״̬,3:�鵵״̬)';
comment on column SISANSHDATA.T_B_CLIENT_MSG.READFLAG
  is '�Ķ�״̬(0:δ����1���Ѷ�)';
comment on column SISANSHDATA.T_B_CLIENT_MSG.SOURCE
  is '��Դ';
comment on column SISANSHDATA.T_B_CLIENT_MSG.CREATETIME
  is '����ʱ��';
comment on column SISANSHDATA.T_B_CLIENT_MSG.CREATEBY
  is '������';
comment on column SISANSHDATA.T_B_CLIENT_MSG.PUBLISHBY
  is '������';
comment on column SISANSHDATA.T_B_CLIENT_MSG.PASSBY
  is '�����';
comment on column SISANSHDATA.T_B_CLIENT_MSG.EDITBY
  is '�޸���';
comment on column SISANSHDATA.T_B_CLIENT_MSG.CLIENTID
  is '�ͻ�id';
comment on column SISANSHDATA.T_B_CLIENT_MSG.CONTENT_TYPE
  is '��Ϣ����(0:�ı����ݣ�1:����)';
comment on column SISANSHDATA.T_B_CLIENT_MSG.PUBLISHTIME
  is '����ʱ��';
comment on column SISANSHDATA.T_B_CLIENT_MSG.CLIENTNAME
  is '�ͻ�����';
alter table SISANSHDATA.T_B_CLIENT_MSG
  add constraint PK_CLIENT_MSG primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
create index SISANSHDATA.INDEX_CLIENT_MSG_CREATETIME on SISANSHDATA.T_B_CLIENT_MSG (CREATETIME)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_B_CLIENT_MSG to SISANSHOPR;

prompt
prompt Creating table T_B_CLINETMGR
prompt ============================
prompt
create table SISANSHDATA.T_B_CLINETMGR
(
  MGRID       NUMBER(30) not null,
  MGRNO       VARCHAR2(50) not null,
  MGRNAME     VARCHAR2(50) not null,
  MGRLEVEL    VARCHAR2(1),
  BRANCHNO    VARCHAR2(30),
  SMALLPICURL VARCHAR2(200),
  BIGPICURL   VARCHAR2(200),
  SCORE       NUMBER,
  DESCRIPTION VARCHAR2(3000)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on column SISANSHDATA.T_B_CLINETMGR.MGRID
  is '����';
comment on column SISANSHDATA.T_B_CLINETMGR.MGRNO
  is '�ͻ�������';
comment on column SISANSHDATA.T_B_CLINETMGR.MGRNAME
  is '�ͻ���������';
comment on column SISANSHDATA.T_B_CLINETMGR.MGRLEVEL
  is '�ͻ�������(�����ֶ�)';
comment on column SISANSHDATA.T_B_CLINETMGR.BRANCHNO
  is 'Ӫҵ������';
comment on column SISANSHDATA.T_B_CLINETMGR.SMALLPICURL
  is 'Сͷ���ַ';
comment on column SISANSHDATA.T_B_CLINETMGR.BIGPICURL
  is '��ͷ���ַ';
comment on column SISANSHDATA.T_B_CLINETMGR.SCORE
  is '�ʻ���Ŀ';
comment on column SISANSHDATA.T_B_CLINETMGR.DESCRIPTION
  is '����';
alter table SISANSHDATA.T_B_CLINETMGR
  add constraint PK_CLINETMGR primary key (MGRID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_B_CLINETMGR to SISANSHOPR;

prompt
prompt Creating table T_B_NOTEPAD
prompt ==========================
prompt
create table SISANSHDATA.T_B_NOTEPAD
(
  N_ID         NUMBER,
  V_TITLE      VARCHAR2(1024),
  C_CONTEXT    CLOB,
  D_CREATEDATE DATE default sysdate,
  D_LASTUPDATE VARCHAR2(30),
  N_USERID     NUMBER,
  N_STATUS     NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SISANSHDATA.T_B_NOTEPAD.N_ID
  is '����id';
comment on column SISANSHDATA.T_B_NOTEPAD.V_TITLE
  is '����';
comment on column SISANSHDATA.T_B_NOTEPAD.C_CONTEXT
  is '����';
comment on column SISANSHDATA.T_B_NOTEPAD.D_CREATEDATE
  is '����ʱ��';
comment on column SISANSHDATA.T_B_NOTEPAD.D_LASTUPDATE
  is '������ʱ��';
comment on column SISANSHDATA.T_B_NOTEPAD.N_USERID
  is '�û�id';
comment on column SISANSHDATA.T_B_NOTEPAD.N_STATUS
  is '����״̬';
grant select on SISANSHDATA.T_B_NOTEPAD to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_B_NOTEPAD to SISANSHOPR;

prompt
prompt Creating table T_B_NOTEPAD_20141015
prompt ===================================
prompt
create table SISANSHDATA.T_B_NOTEPAD_20141015
(
  N_ID         NUMBER,
  V_TITLE      VARCHAR2(1024),
  C_CONTEXT    CLOB,
  D_CREATEDATE DATE,
  D_LASTUPDATE VARCHAR2(30),
  N_USERID     NUMBER,
  N_STATUS     NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_B_NOTEPAD_20141015 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_B_SKRACE_TRADEDATE
prompt ===================================
prompt
create table SISANSHDATA.T_B_SKRACE_TRADEDATE
(
  T_DATE      NVARCHAR2(8) not null,
  IS_TRADE    NUMBER(38),
  RACE_WEEK   NUMBER(38),
  IS_RACEWEEK NUMBER(38)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_B_SKRACE_TRADEDATE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_B_SKRACE_TRADEDATE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_B_SKRACE_TRADEDATE to SISANSHOPR;

prompt
prompt Creating table T_B_VISIT_LOG
prompt ============================
prompt
create table SISANSHDATA.T_B_VISIT_LOG
(
  N_ID         NUMBER,
  N_NOTEPAD_ID NUMBER,
  D_CREATEDATE DATE default sysdate,
  N_USERID     NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SISANSHDATA.T_B_VISIT_LOG.N_ID
  is '����id';
comment on column SISANSHDATA.T_B_VISIT_LOG.N_NOTEPAD_ID
  is '��־id';
comment on column SISANSHDATA.T_B_VISIT_LOG.D_CREATEDATE
  is '����ʱ��';
comment on column SISANSHDATA.T_B_VISIT_LOG.N_USERID
  is '�����û�id';
grant select on SISANSHDATA.T_B_VISIT_LOG to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_B_VISIT_LOG to SISANSHOPR;

prompt
prompt Creating table T_CATALOG
prompt ========================
prompt
create table SISANSHDATA.T_CATALOG
(
  CATALOG_ID    NUMBER(10) not null,
  PARENT_ID     NUMBER(10) not null,
  NAME          VARCHAR2(255) not null,
  CATALOG_NO    VARCHAR2(30) not null,
  SITENO        VARCHAR2(100) not null,
  DESCRIPTION   VARCHAR2(4000),
  ORDERLINE     NUMBER(10),
  LAYER         NUMBER(10),
  ROUTE         VARCHAR2(2000),
  STATE         NUMBER(10),
  NEED_PUBLISH  NUMBER(10),
  NEED_APPROVE  NUMBER(10),
  IS_ROOT       NUMBER(10),
  IS_SYSTEM     NUMBER(10) default 0 not null,
  PAGE_TYPE     NUMBER(10),
  LINK_URL      VARCHAR2(255),
  PUBLISH_PATH  VARCHAR2(255),
  FILE_TYPE     VARCHAR2(10),
  SMALL_IMAGE   VARCHAR2(255),
  LARGE_IMAGE   VARCHAR2(255),
  TYPE          NUMBER(10) not null,
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(20),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(20),
  USER_RIGHT    NUMBER(10) default 0,
  SPECIAL_URL   VARCHAR2(200),
  COLUMN_LEVEL  NUMBER(10),
  CHILDRENNUM   NUMBER(10),
  INHERIT_MODE  NUMBER(10),
  INHERIT_FIELD NUMBER(10) default 0,
  ATTRIBUTE     NUMBER(10) default 0,
  SOURCE_ID     NUMBER(10),
  CATALOG_TYPE  CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_CATALOG
  is 'վ����Ŀ��';
comment on column SISANSHDATA.T_CATALOG.CATALOG_ID
  is 'CATALOG_ID';
comment on column SISANSHDATA.T_CATALOG.PARENT_ID
  is 'PARENT_ID';
comment on column SISANSHDATA.T_CATALOG.NAME
  is 'NAME';
comment on column SISANSHDATA.T_CATALOG.CATALOG_NO
  is 'CATALOG_NO';
comment on column SISANSHDATA.T_CATALOG.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_CATALOG.DESCRIPTION
  is 'DESCRIPTION';
comment on column SISANSHDATA.T_CATALOG.ORDERLINE
  is 'ORDERLINE';
comment on column SISANSHDATA.T_CATALOG.LAYER
  is 'LAYER';
comment on column SISANSHDATA.T_CATALOG.ROUTE
  is 'ROUTE';
comment on column SISANSHDATA.T_CATALOG.STATE
  is 'STATE';
comment on column SISANSHDATA.T_CATALOG.NEED_PUBLISH
  is 'NEED_PUBLISH';
comment on column SISANSHDATA.T_CATALOG.NEED_APPROVE
  is 'NEED_APPROVE';
comment on column SISANSHDATA.T_CATALOG.IS_ROOT
  is 'IS_ROOT';
comment on column SISANSHDATA.T_CATALOG.IS_SYSTEM
  is 'IS_SYSTEM';
comment on column SISANSHDATA.T_CATALOG.PAGE_TYPE
  is 'PAGE_TYPE';
comment on column SISANSHDATA.T_CATALOG.LINK_URL
  is 'LINK_URL';
comment on column SISANSHDATA.T_CATALOG.PUBLISH_PATH
  is 'PUBLISH_PATH';
comment on column SISANSHDATA.T_CATALOG.FILE_TYPE
  is 'FILE_TYPE';
comment on column SISANSHDATA.T_CATALOG.SMALL_IMAGE
  is 'SMALL_IMAGE';
comment on column SISANSHDATA.T_CATALOG.LARGE_IMAGE
  is 'LARGE_IMAGE';
comment on column SISANSHDATA.T_CATALOG.TYPE
  is 'TYPE';
comment on column SISANSHDATA.T_CATALOG.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_CATALOG.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_CATALOG.MODIFIED_BY
  is 'MODIFIED_BY';
comment on column SISANSHDATA.T_CATALOG.MODIFIED_DATE
  is 'MODIFIED_DATE';
comment on column SISANSHDATA.T_CATALOG.USER_RIGHT
  is 'USER_RIGHT';
comment on column SISANSHDATA.T_CATALOG.SPECIAL_URL
  is 'SPECIAL_URL';
comment on column SISANSHDATA.T_CATALOG.COLUMN_LEVEL
  is 'COLUMN_LEVEL';
comment on column SISANSHDATA.T_CATALOG.CHILDRENNUM
  is 'CHILDRENNUM';
comment on column SISANSHDATA.T_CATALOG.INHERIT_MODE
  is 'INHERIT_MODE';
comment on column SISANSHDATA.T_CATALOG.INHERIT_FIELD
  is 'INHERIT_FIELD';
comment on column SISANSHDATA.T_CATALOG.ATTRIBUTE
  is '��Ŀ���� 0:ʵ����Ŀ��ȱʡ�� 1��������Ŀֻ�� 2��������Ŀ��д';
comment on column SISANSHDATA.T_CATALOG.SOURCE_ID
  is '��Ŀ���ͷ�ʵ����Ŀʱ��Ч��ָ����Ӧ��Դ��ĿID';
comment on column SISANSHDATA.T_CATALOG.CATALOG_TYPE
  is '��Ŀ����0Ϊ��վ��Ŀ';
alter table SISANSHDATA.T_CATALOG
  add constraint PK_T_CATALOG primary key (CATALOG_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_CATALOG to SISANSHOPR;

prompt
prompt Creating table T_DEMO
prompt =====================
prompt
create table SISANSHDATA.T_DEMO
(
  AD_ID         NUMBER(10) not null,
  SITENO        VARCHAR2(50),
  GROUP_NO      VARCHAR2(50),
  TYPE          NUMBER(10),
  NAME          VARCHAR2(255),
  URL           VARCHAR2(255),
  PICTURE       VARCHAR2(255),
  WIDTH         NUMBER(10),
  HEIGHT        NUMBER(10),
  ORDERLINE     NUMBER(10),
  STATE         NUMBER(10),
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(20),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(20),
  START_TIME    VARCHAR2(30),
  END_TIME      VARCHAR2(30),
  FILE_TYPE     VARCHAR2(5),
  DESCRIPTION   CLOB,
  FILE_STATE    VARCHAR2(5),
  TEMPLATE      VARCHAR2(5),
  TEMPLATE_SIZE VARCHAR2(5),
  TITLE         VARCHAR2(500),
  SMALL_PICTURE VARCHAR2(255),
  SMALL_WIDTH   NUMBER(10),
  SMALL_HEIGHT  NUMBER(10),
  GROUP_ID      VARCHAR2(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_DEMO
  is 'T_DEMO';
comment on column SISANSHDATA.T_DEMO.AD_ID
  is 'AD_ID';
comment on column SISANSHDATA.T_DEMO.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_DEMO.GROUP_NO
  is 'GROUP_NO';
comment on column SISANSHDATA.T_DEMO.TYPE
  is 'TYPE';
comment on column SISANSHDATA.T_DEMO.NAME
  is 'NAME';
comment on column SISANSHDATA.T_DEMO.URL
  is 'URL';
comment on column SISANSHDATA.T_DEMO.PICTURE
  is 'PICTURE';
comment on column SISANSHDATA.T_DEMO.WIDTH
  is 'WIDTH';
comment on column SISANSHDATA.T_DEMO.HEIGHT
  is 'HEIGHT';
comment on column SISANSHDATA.T_DEMO.ORDERLINE
  is 'ORDERLINE';
comment on column SISANSHDATA.T_DEMO.STATE
  is 'STATE';
comment on column SISANSHDATA.T_DEMO.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_DEMO.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_DEMO.MODIFIED_BY
  is 'MODIFIED_BY';
comment on column SISANSHDATA.T_DEMO.MODIFIED_DATE
  is 'MODIFIED_DATE';
comment on column SISANSHDATA.T_DEMO.START_TIME
  is 'START_TIME';
comment on column SISANSHDATA.T_DEMO.END_TIME
  is 'END_TIME';
comment on column SISANSHDATA.T_DEMO.FILE_TYPE
  is 'FILE_TYPE';
comment on column SISANSHDATA.T_DEMO.DESCRIPTION
  is 'DESCRIPTION';
comment on column SISANSHDATA.T_DEMO.FILE_STATE
  is 'FILE_STATE';
comment on column SISANSHDATA.T_DEMO.TEMPLATE
  is 'TEMPLATE';
comment on column SISANSHDATA.T_DEMO.TEMPLATE_SIZE
  is 'TEMPLATE_SIZE';
comment on column SISANSHDATA.T_DEMO.TITLE
  is 'TITLE';
comment on column SISANSHDATA.T_DEMO.SMALL_PICTURE
  is 'SMALL_PICTURE';
comment on column SISANSHDATA.T_DEMO.SMALL_WIDTH
  is 'SMALL_WIDTH';
comment on column SISANSHDATA.T_DEMO.SMALL_HEIGHT
  is 'SMALL_HEIGHT';
comment on column SISANSHDATA.T_DEMO.GROUP_ID
  is 'GROUP_ID';
alter table SISANSHDATA.T_DEMO
  add constraint PK_T_DEMO primary key (AD_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_DEMO to SISANSHOPR;

prompt
prompt Creating table T_DEMO_GROUP
prompt ===========================
prompt
create table SISANSHDATA.T_DEMO_GROUP
(
  ID            NUMBER(10) not null,
  NAME          VARCHAR2(255) not null,
  SITENO        VARCHAR2(50) not null,
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(20),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(20),
  ORDERLINE     NUMBER(10),
  GROUP_NO      VARCHAR2(50),
  INTERVALL     VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_DEMO_GROUP
  is 'T_DEMO_GROUP';
comment on column SISANSHDATA.T_DEMO_GROUP.ID
  is 'ID';
comment on column SISANSHDATA.T_DEMO_GROUP.NAME
  is 'NAME';
comment on column SISANSHDATA.T_DEMO_GROUP.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_DEMO_GROUP.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_DEMO_GROUP.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_DEMO_GROUP.MODIFIED_BY
  is 'MODIFIED_BY';
comment on column SISANSHDATA.T_DEMO_GROUP.MODIFIED_DATE
  is 'MODIFIED_DATE';
comment on column SISANSHDATA.T_DEMO_GROUP.ORDERLINE
  is 'ORDERLINE';
comment on column SISANSHDATA.T_DEMO_GROUP.GROUP_NO
  is 'GROUP_NO';
comment on column SISANSHDATA.T_DEMO_GROUP.INTERVALL
  is 'INTERVALL';
alter table SISANSHDATA.T_DEMO_GROUP
  add constraint PK_DEMO_GROUP primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_DEMO_GROUP to SISANSHOPR;

prompt
prompt Creating table T_ENUM_TYPE
prompt ==========================
prompt
create table SISANSHDATA.T_ENUM_TYPE
(
  ENUM_NAME  VARCHAR2(50) not null,
  ENUM_VALUE VARCHAR2(50) not null,
  SITENO     VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_ENUM_TYPE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_ENUM_TYPE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_ENUM_TYPE to SISANSHOPR;

prompt
prompt Creating table T_ENUM_VALUE
prompt ===========================
prompt
create table SISANSHDATA.T_ENUM_VALUE
(
  ENUM_TYPE  VARCHAR2(50) not null,
  ITEM_NAME  VARCHAR2(50) not null,
  ITEM_VALUE VARCHAR2(50) not null,
  IS_SYSTEM  NUMBER(10) not null,
  ORDERLINE  NUMBER(10) not null,
  ITEM_CODE  VARCHAR2(50),
  SITENO     VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_ENUM_VALUE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_ENUM_VALUE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_ENUM_VALUE to SISANSHOPR;

prompt
prompt Creating table T_PLAT_BUSI_LOG
prompt ==============================
prompt
create table SISANSHDATA.T_PLAT_BUSI_LOG
(
  LOG_ID       NUMBER(10) not null,
  LOGIN_ID     VARCHAR2(50) not null,
  SOURCE_IP    VARCHAR2(100),
  SOURCE_MAC   VARCHAR2(100),
  OPERATE_DATE DATE,
  BUSI_NAME    VARCHAR2(100),
  BUSI_DESC    VARCHAR2(500),
  AUDIT_ID     VARCHAR2(50),
  AUDIT_CAUSE  VARCHAR2(1000),
  AUDIT_DATE   DATE
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_BUSI_LOG
  is '�û�ҵ�������־��';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.LOG_ID
  is '��־ID';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.LOGIN_ID
  is '������Ա��¼ID';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.SOURCE_IP
  is '��ԴIP��ַ';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.SOURCE_MAC
  is '��ԴMAC��ַ';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.OPERATE_DATE
  is 'ҵ�����ʱ��';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.BUSI_NAME
  is 'ҵ���������';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.BUSI_DESC
  is 'ҵ���������';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.AUDIT_ID
  is '������Ա��¼ID';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.AUDIT_CAUSE
  is '������Ա����';
comment on column SISANSHDATA.T_PLAT_BUSI_LOG.AUDIT_DATE
  is '��������';
alter table SISANSHDATA.T_PLAT_BUSI_LOG
  add constraint PK_T_PLAT_BUSI_LOG primary key (LOG_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_BUSI_LOG to SISANSHOPR;

prompt
prompt Creating table T_PLAT_CATALOG
prompt =============================
prompt
create table SISANSHDATA.T_PLAT_CATALOG
(
  CATALOG_ID    NUMBER(10) not null,
  PARENT_ID     INTEGER,
  NAME          VARCHAR2(200),
  CATALOG_NO    VARCHAR2(200),
  DESCRIPTION   VARCHAR2(500),
  ORDERLINE     NUMBER(10),
  CHILDRENNUM   NUMBER(10),
  ROUTE         VARCHAR2(500),
  STATE         NUMBER(10),
  IS_ROOT       NUMBER(10),
  IS_SYSTEM     NUMBER(10),
  LINK_URL      VARCHAR2(255),
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(30),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(30),
  FUNCTION_NO   NUMBER(15),
  TEMPLATE_ADDR VARCHAR2(255),
  LOGO_URL      VARCHAR2(255),
  IS_POPUP      CHAR(1) default '0',
  GROUP_ID      VARCHAR2(64)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_CATALOG
  is '��վ��Ŀ';
comment on column SISANSHDATA.T_PLAT_CATALOG.CATALOG_ID
  is '��ĿID';
comment on column SISANSHDATA.T_PLAT_CATALOG.PARENT_ID
  is '��ID��';
comment on column SISANSHDATA.T_PLAT_CATALOG.NAME
  is 'Ŀ¼����';
comment on column SISANSHDATA.T_PLAT_CATALOG.CATALOG_NO
  is 'Ŀ¼Ӣ�����Ʊ��';
comment on column SISANSHDATA.T_PLAT_CATALOG.DESCRIPTION
  is '��Ŀ������Ϣ';
comment on column SISANSHDATA.T_PLAT_CATALOG.ORDERLINE
  is '����';
comment on column SISANSHDATA.T_PLAT_CATALOG.CHILDRENNUM
  is '����Ŀ����';
comment on column SISANSHDATA.T_PLAT_CATALOG.ROUTE
  is '·��ֵ';
comment on column SISANSHDATA.T_PLAT_CATALOG.STATE
  is '״̬��0:�ر�״̬��1:��״̬���ر�֮������ǰ̨Ŀ¼�б��п�������';
comment on column SISANSHDATA.T_PLAT_CATALOG.IS_ROOT
  is '�Ƿ�Ϊվ��ĸ�Ŀ¼��0:���ǣ�1���ǣ�';
comment on column SISANSHDATA.T_PLAT_CATALOG.IS_SYSTEM
  is '�Ƿ���ϵͳĿ¼��NUMBER(1)��';
comment on column SISANSHDATA.T_PLAT_CATALOG.LINK_URL
  is '��̨����URL';
comment on column SISANSHDATA.T_PLAT_CATALOG.CREATE_BY
  is '������';
comment on column SISANSHDATA.T_PLAT_CATALOG.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_PLAT_CATALOG.MODIFIED_BY
  is '����޸����ʺ�';
comment on column SISANSHDATA.T_PLAT_CATALOG.MODIFIED_DATE
  is '����޸�ʱ��';
comment on column SISANSHDATA.T_PLAT_CATALOG.FUNCTION_NO
  is 'ҵ���ܺ�';
comment on column SISANSHDATA.T_PLAT_CATALOG.TEMPLATE_ADDR
  is '����ģ���ļ�·��';
comment on column SISANSHDATA.T_PLAT_CATALOG.LOGO_URL
  is 'logo';
comment on column SISANSHDATA.T_PLAT_CATALOG.IS_POPUP
  is '�Ƿ�Ϊ������(0:���� 1:��)';
comment on column SISANSHDATA.T_PLAT_CATALOG.GROUP_ID
  is '����ID';
alter table SISANSHDATA.T_PLAT_CATALOG
  add constraint PK_T_PLAT_CATALOG primary key (CATALOG_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_CATALOG to SISANSHOPR;

prompt
prompt Creating table T_PLAT_CATALOG_FUNCTION
prompt ======================================
prompt
create table SISANSHDATA.T_PLAT_CATALOG_FUNCTION
(
  CATALOG_ID NUMBER(10) not null,
  FUNC_NO    NUMBER(10),
  FUNC_NAME  VARCHAR2(255),
  IS_RIGHTS  CHAR(1),
  ID         NUMBER(10) not null,
  ORDERLINE  NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_CATALOG_FUNCTION
  is 'ϵͳ��Ŀ��Ӧ���ܱ�';
comment on column SISANSHDATA.T_PLAT_CATALOG_FUNCTION.CATALOG_ID
  is '��ĿID';
comment on column SISANSHDATA.T_PLAT_CATALOG_FUNCTION.FUNC_NO
  is '���ܺ�';
comment on column SISANSHDATA.T_PLAT_CATALOG_FUNCTION.FUNC_NAME
  is '��������';
comment on column SISANSHDATA.T_PLAT_CATALOG_FUNCTION.IS_RIGHTS
  is '�Ƿ���Ҫ�ж�Ȩ�� 0:����Ҫ 1:��Ҫ';
comment on column SISANSHDATA.T_PLAT_CATALOG_FUNCTION.ID
  is 'ϵͳ����ID';
comment on column SISANSHDATA.T_PLAT_CATALOG_FUNCTION.ORDERLINE
  is '����ֵ';
alter table SISANSHDATA.T_PLAT_CATALOG_FUNCTION
  add constraint PK_CATALOG_FUNC_ID primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SISANSHDATA.T_PLAT_CATALOG_FUNCTION
  add constraint UK_CATALOG_FUNC_NO unique (CATALOG_ID, FUNC_NO)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_CATALOG_FUNCTION to SISANSHOPR;

prompt
prompt Creating table T_PLAT_CATALOG_PAGEINFO
prompt ======================================
prompt
create table SISANSHDATA.T_PLAT_CATALOG_PAGEINFO
(
  ID           NUMBER(10) not null,
  CATALOG_ID   NUMBER(10) not null,
  WINDOW_ID    VARCHAR2(50) not null,
  STATE        CHAR(1),
  PUBLISH_DATE VARCHAR2(30),
  LINK_URL     VARCHAR2(500),
  PAGE_TYPE    VARCHAR2(20),
  PAGE_WIDTH   VARCHAR2(50),
  PAGE_HEIGHT  VARCHAR2(50),
  PAGE_TITLE   VARCHAR2(255),
  IS_MAXIMIZE  CHAR(1),
  PAGE_CONTENT CLOB,
  CREATE_DATE  VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_CATALOG_PAGEINFO
  is '��Ŀ������ҳ����Ϣ  ';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.ID
  is '��ˮID';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.CATALOG_ID
  is '��ĿID';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.WINDOW_ID
  is '��Ӧtemplate.xml�е�windowid';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.STATE
  is '0:��Ч 1:��Ч';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.PUBLISH_DATE
  is '��󷢲�ʱ��';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.LINK_URL
  is 'ҳ�����·��';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.PAGE_TYPE
  is '�Ƿ���ҳ�� main:��ҳ�� ��:������ҳ��';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.PAGE_WIDTH
  is 'ҳ����';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.PAGE_HEIGHT
  is 'ҳ��߶�';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.PAGE_TITLE
  is 'ҳ�����';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.IS_MAXIMIZE
  is '�Ƿ���󻯴��� 1:���';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.PAGE_CONTENT
  is 'ҳ������';
comment on column SISANSHDATA.T_PLAT_CATALOG_PAGEINFO.CREATE_DATE
  is '����ʱ��';
alter table SISANSHDATA.T_PLAT_CATALOG_PAGEINFO
  add constraint PK_CATALOG_PAGEINFO_ID primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table SISANSHDATA.T_PLAT_CATALOG_PAGEINFO
  add constraint UK_CATALOG_PAGEINFO unique (CATALOG_ID, WINDOW_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_CATALOG_PAGEINFO to SISANSHOPR;

prompt
prompt Creating table T_PLAT_COMMON_TEMPLATE
prompt =====================================
prompt
create table SISANSHDATA.T_PLAT_COMMON_TEMPLATE
(
  ID            NUMBER(10) not null,
  TEMPLATE_NO   VARCHAR2(255),
  NAME          VARCHAR2(255),
  DESCRIPTION   VARCHAR2(1000),
  CONTENT       CLOB,
  IS_SYSTEM     CHAR(1),
  CREATE_BY     VARCHAR2(30),
  CREATE_DATE   VARCHAR2(50),
  MODIFIED_BY   VARCHAR2(30),
  MODIFIED_DATE VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_PLAT_COMMON_TEMPLATE
  is '��¼ģ����Ϣ���������ģ��';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.ID
  is '��ˮID';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.TEMPLATE_NO
  is 'ģ��Ӣ������';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.NAME
  is 'ģ������';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.DESCRIPTION
  is 'ģ��˵��';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.CONTENT
  is 'ģ������';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.IS_SYSTEM
  is '�Ƿ�ϵͳģ��';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.CREATE_BY
  is '������';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.MODIFIED_BY
  is '����޸���';
comment on column SISANSHDATA.T_PLAT_COMMON_TEMPLATE.MODIFIED_DATE
  is '����޸�ʱ��';
alter table SISANSHDATA.T_PLAT_COMMON_TEMPLATE
  add constraint PK_T_PLAT_COMMON_TEMPLATE primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_PLAT_COMMON_TEMPLATE to SISANSHOPR;

prompt
prompt Creating table T_PLAT_CONFIG
prompt ============================
prompt
create table SISANSHDATA.T_PLAT_CONFIG
(
  ID          NUMBER(10) not null,
  NAME        VARCHAR2(255),
  CAPTION     VARCHAR2(255),
  CUR_VALUE   VARCHAR2(255),
  DESCRIPTION VARCHAR2(500),
  IS_SYSTEM   CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_PLAT_CONFIG
  is 'ϵͳ������Ϣ��';
comment on column SISANSHDATA.T_PLAT_CONFIG.ID
  is '�Զ����';
comment on column SISANSHDATA.T_PLAT_CONFIG.NAME
  is '���������';
comment on column SISANSHDATA.T_PLAT_CONFIG.CAPTION
  is '����������';
comment on column SISANSHDATA.T_PLAT_CONFIG.CUR_VALUE
  is '������ֵ';
comment on column SISANSHDATA.T_PLAT_CONFIG.DESCRIPTION
  is '������������Ϣ';
comment on column SISANSHDATA.T_PLAT_CONFIG.IS_SYSTEM
  is '�Ƿ�ϵͳ����';
alter table SISANSHDATA.T_PLAT_CONFIG
  add constraint PK_T_PLAT_CONFIG primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_PLAT_CONFIG to SISANSHOPR;

prompt
prompt Creating table T_PLAT_ENUM_TYPE
prompt ===============================
prompt
create table SISANSHDATA.T_PLAT_ENUM_TYPE
(
  ID        NUMBER(10) not null,
  ENUM_NAME VARCHAR2(100),
  ENUM_NO   VARCHAR2(50),
  IS_SYSTEM CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_PLAT_ENUM_TYPE
  is '�����ֵ�ö�����Ͷ����';
comment on column SISANSHDATA.T_PLAT_ENUM_TYPE.ID
  is '�Զ����';
comment on column SISANSHDATA.T_PLAT_ENUM_TYPE.ENUM_NAME
  is '�������ı���';
comment on column SISANSHDATA.T_PLAT_ENUM_TYPE.ENUM_NO
  is '�ֵ�����Ӣ������';
comment on column SISANSHDATA.T_PLAT_ENUM_TYPE.IS_SYSTEM
  is '�Ƿ�ϵͳ����0������ 1����';
alter table SISANSHDATA.T_PLAT_ENUM_TYPE
  add constraint PK_T_PLAT_ENUM_TYPE primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_PLAT_ENUM_TYPE to SISANSHOPR;

prompt
prompt Creating table T_PLAT_ENUM_VALUE
prompt ================================
prompt
create table SISANSHDATA.T_PLAT_ENUM_VALUE
(
  ID         NUMBER(10) not null,
  ENUM_NO    VARCHAR2(50),
  ITEM_NAME  VARCHAR2(50),
  ITEM_VALUE VARCHAR2(50),
  ORDERLINE  NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_PLAT_ENUM_VALUE
  is '�����ֵ�ö��ֵ����';
comment on column SISANSHDATA.T_PLAT_ENUM_VALUE.ID
  is '�Զ����';
comment on column SISANSHDATA.T_PLAT_ENUM_VALUE.ENUM_NO
  is '����Ӣ�ı���';
comment on column SISANSHDATA.T_PLAT_ENUM_VALUE.ITEM_NAME
  is 'ö������';
comment on column SISANSHDATA.T_PLAT_ENUM_VALUE.ITEM_VALUE
  is 'ö��ֵ';
comment on column SISANSHDATA.T_PLAT_ENUM_VALUE.ORDERLINE
  is '����ֵ';
alter table SISANSHDATA.T_PLAT_ENUM_VALUE
  add constraint PK_T_PLAT_ENUM_VALUE primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_PLAT_ENUM_VALUE to SISANSHOPR;

prompt
prompt Creating table T_PLAT_GROUPS
prompt ============================
prompt
create table SISANSHDATA.T_PLAT_GROUPS
(
  ID        VARCHAR2(64) not null,
  NAME      VARCHAR2(50),
  STATE     CHAR(1),
  IS_SYSTEM CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_PLAT_GROUPS
  is '�û�����';
comment on column SISANSHDATA.T_PLAT_GROUPS.ID
  is 'key';
comment on column SISANSHDATA.T_PLAT_GROUPS.NAME
  is '��������';
comment on column SISANSHDATA.T_PLAT_GROUPS.STATE
  is '���ñ�־';
grant select, insert, update, delete on SISANSHDATA.T_PLAT_GROUPS to SISANSHOPR;

prompt
prompt Creating table T_PLAT_LOG
prompt =========================
prompt
create table SISANSHDATA.T_PLAT_LOG
(
  LOG_ID      NUMBER(10) not null,
  SOURCE_IP   VARCHAR2(50),
  LOGIN_ID    VARCHAR2(50),
  FUNC_NO     NUMBER(15),
  ERROR_NO    NUMBER(10),
  CATALOG_ID  NUMBER(15),
  CREATE_DATE DATE,
  FUNC_DESC   VARCHAR2(255)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_LOG
  is '��¼�û��ڹ���ƽ̨����Ϊ��־';
comment on column SISANSHDATA.T_PLAT_LOG.LOG_ID
  is '��־ID';
comment on column SISANSHDATA.T_PLAT_LOG.SOURCE_IP
  is '��ԴIP';
comment on column SISANSHDATA.T_PLAT_LOG.LOGIN_ID
  is '��¼�û���';
comment on column SISANSHDATA.T_PLAT_LOG.FUNC_NO
  is '���ܺ�';
comment on column SISANSHDATA.T_PLAT_LOG.ERROR_NO
  is '������';
comment on column SISANSHDATA.T_PLAT_LOG.CATALOG_ID
  is '��Ŀid';
comment on column SISANSHDATA.T_PLAT_LOG.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_PLAT_LOG.FUNC_DESC
  is '����˵��';
alter table SISANSHDATA.T_PLAT_LOG
  add constraint PK_T_PLAT_LOG primary key (LOG_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_LOG to SISANSHOPR;

prompt
prompt Creating table T_PLAT_LOG_CONTENT
prompt =================================
prompt
create table SISANSHDATA.T_PLAT_LOG_CONTENT
(
  LOG_ID        NUMBER(10) not null,
  PARAM_CONTENT VARCHAR2(4000),
  ERROR_MESSAGE VARCHAR2(4000)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_LOG_CONTENT
  is '��¼��־���';
comment on column SISANSHDATA.T_PLAT_LOG_CONTENT.LOG_ID
  is '��־ID';
comment on column SISANSHDATA.T_PLAT_LOG_CONTENT.PARAM_CONTENT
  is '���';
comment on column SISANSHDATA.T_PLAT_LOG_CONTENT.ERROR_MESSAGE
  is '������Ϣ';
alter table SISANSHDATA.T_PLAT_LOG_CONTENT
  add constraint PK_T_PLAT_LOG_CONTENT primary key (LOG_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_LOG_CONTENT to SISANSHOPR;

prompt
prompt Creating table T_PLAT_PASS_LOG
prompt ==============================
prompt
create table SISANSHDATA.T_PLAT_PASS_LOG
(
  ID          NUMBER(10) not null,
  LOGIN_ID    VARCHAR2(50),
  PASSWORD    VARCHAR2(50),
  RANDOM_NO   VARCHAR2(10),
  CREATE_DATE VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_PASS_LOG
  is 'ϵͳ�û�����ʹ����־��';
comment on column SISANSHDATA.T_PLAT_PASS_LOG.ID
  is '�Զ����';
comment on column SISANSHDATA.T_PLAT_PASS_LOG.LOGIN_ID
  is '��¼�û���';
comment on column SISANSHDATA.T_PLAT_PASS_LOG.PASSWORD
  is '����';
comment on column SISANSHDATA.T_PLAT_PASS_LOG.RANDOM_NO
  is '�����4λ';
comment on column SISANSHDATA.T_PLAT_PASS_LOG.CREATE_DATE
  is '����ʱ��';
alter table SISANSHDATA.T_PLAT_PASS_LOG
  add constraint PK_T_PLAT_PASS_LOG primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_PASS_LOG to SISANSHOPR;

prompt
prompt Creating table T_PLAT_ROLE
prompt ==========================
prompt
create table SISANSHDATA.T_PLAT_ROLE
(
  ROLE_ID       NUMBER(10) not null,
  ROLENO        VARCHAR2(50),
  NAME          VARCHAR2(255),
  SORT_ID       NUMBER(10),
  IS_SYSTEM     CHAR(1),
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(30),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(30),
  GROUP_ID      VARCHAR2(64)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_ROLE
  is '��ɫ';
comment on column SISANSHDATA.T_PLAT_ROLE.ROLE_ID
  is '��ɫID';
comment on column SISANSHDATA.T_PLAT_ROLE.ROLENO
  is '��ɫ����(һ��ΪӢ���ַ�,ͬվ�����ظ�)';
comment on column SISANSHDATA.T_PLAT_ROLE.NAME
  is '��ɫ����';
comment on column SISANSHDATA.T_PLAT_ROLE.SORT_ID
  is '��ɫ����';
comment on column SISANSHDATA.T_PLAT_ROLE.IS_SYSTEM
  is 'ϵͳ��ɫ��־(0:��ϵͳ��ɫ��1:ϵͳ��ɫ)';
comment on column SISANSHDATA.T_PLAT_ROLE.CREATE_BY
  is '�������ʺ�';
comment on column SISANSHDATA.T_PLAT_ROLE.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_PLAT_ROLE.MODIFIED_BY
  is '�޸����ʺ�';
comment on column SISANSHDATA.T_PLAT_ROLE.MODIFIED_DATE
  is '�޸�ʱ��';
comment on column SISANSHDATA.T_PLAT_ROLE.GROUP_ID
  is '����ID';
alter table SISANSHDATA.T_PLAT_ROLE
  add constraint PK_T_PLAT_ROLE primary key (ROLE_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_ROLE to SISANSHOPR;

prompt
prompt Creating table T_PLAT_ROLE_CATALOG_RIGHTS
prompt =========================================
prompt
create table SISANSHDATA.T_PLAT_ROLE_CATALOG_RIGHTS
(
  ID              NUMBER(10) not null,
  ROLENO          VARCHAR2(50),
  CATALOG_NO_LIST CLOB
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_ROLE_CATALOG_RIGHTS
  is '��ɫӵ�е�ϵͳ��ĿȨ�ޱ�';
comment on column SISANSHDATA.T_PLAT_ROLE_CATALOG_RIGHTS.ID
  is '��¼��ID';
comment on column SISANSHDATA.T_PLAT_ROLE_CATALOG_RIGHTS.ROLENO
  is '��ɫ���';
comment on column SISANSHDATA.T_PLAT_ROLE_CATALOG_RIGHTS.CATALOG_NO_LIST
  is 'ϵͳ��Ŀ����б�';
alter table SISANSHDATA.T_PLAT_ROLE_CATALOG_RIGHTS
  add constraint PK_T_PLAT_ROLE_CATALOG_RIGHTS primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_ROLE_CATALOG_RIGHTS to SISANSHOPR;

prompt
prompt Creating table T_PLAT_ROLE_FUNCTION_RIGHTS
prompt ==========================================
prompt
create table SISANSHDATA.T_PLAT_ROLE_FUNCTION_RIGHTS
(
  ID            NUMBER(10) not null,
  ROLENO        VARCHAR2(50),
  FUNCTION_LIST CLOB
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_ROLE_FUNCTION_RIGHTS
  is '��ɫӵ�е�ҵ����Ȩ�ޱ�';
comment on column SISANSHDATA.T_PLAT_ROLE_FUNCTION_RIGHTS.ID
  is '��¼��ID';
comment on column SISANSHDATA.T_PLAT_ROLE_FUNCTION_RIGHTS.ROLENO
  is '��ɫ���';
comment on column SISANSHDATA.T_PLAT_ROLE_FUNCTION_RIGHTS.FUNCTION_LIST
  is 'ҵ���ܺ��б�';
alter table SISANSHDATA.T_PLAT_ROLE_FUNCTION_RIGHTS
  add constraint PK_T_PLAT_ROLE_FUNCTION_RIGHTS primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_ROLE_FUNCTION_RIGHTS to SISANSHOPR;

prompt
prompt Creating table T_PLAT_ROLE_SORT
prompt ===============================
prompt
create table SISANSHDATA.T_PLAT_ROLE_SORT
(
  SORT_ID       NUMBER(10) not null,
  NAME          VARCHAR2(50),
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(30),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_ROLE_SORT
  is '��ɫ�����';
comment on column SISANSHDATA.T_PLAT_ROLE_SORT.SORT_ID
  is '����ID';
comment on column SISANSHDATA.T_PLAT_ROLE_SORT.NAME
  is '��������';
comment on column SISANSHDATA.T_PLAT_ROLE_SORT.CREATE_BY
  is '�������ʺ�';
comment on column SISANSHDATA.T_PLAT_ROLE_SORT.CREATE_DATE
  is '����ʱ���ʽΪ:2004-12-12 20:10:10';
comment on column SISANSHDATA.T_PLAT_ROLE_SORT.MODIFIED_BY
  is '�޸����ʺ�';
comment on column SISANSHDATA.T_PLAT_ROLE_SORT.MODIFIED_DATE
  is '�޸�ʱ��(��ʽΪ:2004-12-12 20:10:10)';
alter table SISANSHDATA.T_PLAT_ROLE_SORT
  add constraint PK_T_PLAT_ROLE_SORT primary key (SORT_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_ROLE_SORT to SISANSHOPR;

prompt
prompt Creating table T_PLAT_ROLE_USER
prompt ===============================
prompt
create table SISANSHDATA.T_PLAT_ROLE_USER
(
  ID      NUMBER(10) not null,
  ROLE_NO VARCHAR2(50),
  USER_ID NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_ROLE_USER
  is '��ɫ-�û�';
comment on column SISANSHDATA.T_PLAT_ROLE_USER.ID
  is '��¼��ID';
comment on column SISANSHDATA.T_PLAT_ROLE_USER.ROLE_NO
  is '��ɫӢ����';
comment on column SISANSHDATA.T_PLAT_ROLE_USER.USER_ID
  is '�û����';
alter table SISANSHDATA.T_PLAT_ROLE_USER
  add constraint PK_T_PLAT_ROLE_USER primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_ROLE_USER to SISANSHOPR;

prompt
prompt Creating table T_PLAT_USER
prompt ==========================
prompt
create table SISANSHDATA.T_PLAT_USER
(
  USER_ID       NUMBER(10) not null,
  LOGIN_ID      VARCHAR2(50),
  NAME          VARCHAR2(50),
  PASSWORD      VARCHAR2(50),
  RANDOM_NO     VARCHAR2(10),
  STATE         CHAR(1),
  IS_SYSTEM     CHAR(1),
  LOGIN_TIMES   NUMBER(10),
  LAST_TIME     VARCHAR2(30),
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(30),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(30),
  ORGNO         VARCHAR2(20),
  GROUP_ID      VARCHAR2(64)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_USER
  is 'ϵͳ�û�';
comment on column SISANSHDATA.T_PLAT_USER.USER_ID
  is '�û���ID';
comment on column SISANSHDATA.T_PLAT_USER.LOGIN_ID
  is '��¼�û���';
comment on column SISANSHDATA.T_PLAT_USER.NAME
  is '����';
comment on column SISANSHDATA.T_PLAT_USER.PASSWORD
  is '����';
comment on column SISANSHDATA.T_PLAT_USER.RANDOM_NO
  is '�����4λ';
comment on column SISANSHDATA.T_PLAT_USER.STATE
  is '�û�״̬';
comment on column SISANSHDATA.T_PLAT_USER.IS_SYSTEM
  is '�Ƿ񳬼�����Ա';
comment on column SISANSHDATA.T_PLAT_USER.LOGIN_TIMES
  is '��¼����';
comment on column SISANSHDATA.T_PLAT_USER.LAST_TIME
  is '����¼ʱ��';
comment on column SISANSHDATA.T_PLAT_USER.CREATE_BY
  is '�������˺�';
comment on column SISANSHDATA.T_PLAT_USER.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_PLAT_USER.MODIFIED_BY
  is '����޸����˺�';
comment on column SISANSHDATA.T_PLAT_USER.MODIFIED_DATE
  is '����޸�ʱ��';
comment on column SISANSHDATA.T_PLAT_USER.ORGNO
  is '��������';
comment on column SISANSHDATA.T_PLAT_USER.GROUP_ID
  is '����ID';
alter table SISANSHDATA.T_PLAT_USER
  add constraint PK_T_PLAT_USER primary key (USER_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_USER to SISANSHOPR;

prompt
prompt Creating table T_PLAT_USER_INFO
prompt ===============================
prompt
create table SISANSHDATA.T_PLAT_USER_INFO
(
  INFO_ID      NUMBER(10) not null,
  USER_ID      NUMBER(10),
  EMAIL        VARCHAR2(80),
  MOBILE_PHONE VARCHAR2(20),
  TELEPHONE    VARCHAR2(20),
  ADDRESS      VARCHAR2(200),
  AGE          NUMBER(3),
  BIRTHDAY     VARCHAR2(20),
  INFO1        VARCHAR2(100),
  INFO2        VARCHAR2(100),
  INFO3        VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PLAT_USER_INFO
  is '�û���չ��Ϣ��';
comment on column SISANSHDATA.T_PLAT_USER_INFO.INFO_ID
  is '�û���ϢID';
comment on column SISANSHDATA.T_PLAT_USER_INFO.USER_ID
  is '�û�ID';
comment on column SISANSHDATA.T_PLAT_USER_INFO.EMAIL
  is '��������';
comment on column SISANSHDATA.T_PLAT_USER_INFO.MOBILE_PHONE
  is '�ֻ�����';
comment on column SISANSHDATA.T_PLAT_USER_INFO.TELEPHONE
  is '��ϵ�绰';
comment on column SISANSHDATA.T_PLAT_USER_INFO.ADDRESS
  is 'סַ';
comment on column SISANSHDATA.T_PLAT_USER_INFO.AGE
  is '����';
comment on column SISANSHDATA.T_PLAT_USER_INFO.BIRTHDAY
  is '����';
comment on column SISANSHDATA.T_PLAT_USER_INFO.INFO1
  is 'Ԥ����Ϣ1';
comment on column SISANSHDATA.T_PLAT_USER_INFO.INFO2
  is 'Ԥ����Ϣ2';
comment on column SISANSHDATA.T_PLAT_USER_INFO.INFO3
  is 'Ԥ����Ϣ3';
alter table SISANSHDATA.T_PLAT_USER_INFO
  add constraint PK_T_PLAT_USER_INFO primary key (INFO_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PLAT_USER_INFO to SISANSHOPR;

prompt
prompt Creating table T_PORTFOLIO_SUM
prompt ==============================
prompt
create table SISANSHDATA.T_PORTFOLIO_SUM
(
  PORTFOLIO_ID             NUMBER not null,
  SUB_NUM                  NUMBER default 0,
  SUB_NUM_RANKINGS         NUMBER,
  COMMENT_NUM              NUMBER default 0,
  BEATGRAIL_NUM            NUMBER default 0,
  THIRTY_TRADE_NUM         NUMBER default 0,
  SEVEN_TRADE_NUM          NUMBER default 0,
  TOTAL_TRADE_NUM          NUMBER default 0,
  STOCK_HOLDDAYS_AVG       NUMBER default 0,
  STOCK_NUM_AVG            NUMBER default 0,
  RETRACE_RATE_SEVEN       NUMBER(10,4) default 0,
  RETRACE_RATE_THIRTY      NUMBER(10,4) default 0,
  RETRACE_RATE_YEAR        NUMBER(10,4) default 0,
  RETRACE_RATE_TOTAL       NUMBER(10,4) default 0,
  TURNOVER_TOTAL_MONEY     NUMBER(20,2) default 0,
  TURNOVER_TOTAL_RATE      NUMBER(10,4),
  TURNOVER_TOTAL_RANKINGS  NUMBER,
  TURNOVER_SEVEN_MONEY     NUMBER(16,2),
  TURNOVER_SEVEN_RATE      NUMBER(10,4),
  TURNOVER_SEVEN_RANKINGS  NUMBER,
  TURNOVER_THIRTY_MONEY    NUMBER(16,2),
  TURNOVER_THIRTY_RATE     NUMBER(10,4),
  TURNOVER_THIRTY_RANKINGS NUMBER,
  TURNOVER_TODAY_MONEY     NUMBER(16,2),
  TURNOVER_TODAY_RATE      NUMBER(10,4),
  TURNOVER_TODAY_RANKINGS  NUMBER,
  CHOOSE_TOTAL_SUM         NUMBER default 0,
  CHOOSE_SUCCESS_SUM       NUMBER default 0,
  CHOOSE_SUCCESS_RATE      NUMBER(10,4),
  CHOOSE_SUCCESS_RANKINGS  NUMBER,
  TRADE_LOSS_SUM           NUMBER default 0,
  TRADE_SUCCESS_SUM        NUMBER default 0,
  NEW_TRADE_TIME           VARCHAR2(30),
  PORTFOLIO_STYLE          CHAR(1),
  HOLD_STOCK_NUM           NUMBER default 0
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PORTFOLIO_SUM
  is '�������ͳ�Ʊ�';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.PORTFOLIO_ID
  is '���ID';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.SUB_NUM
  is '��ע��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.SUB_NUM_RANKINGS
  is '��ע������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.COMMENT_NUM
  is '������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.BEATGRAIL_NUM
  is '��Ӯ���̴���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.THIRTY_TRADE_NUM
  is '��30�ս��״���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.SEVEN_TRADE_NUM
  is '��7�ս��״���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TOTAL_TRADE_NUM
  is '�ܽ��״���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.STOCK_HOLDDAYS_AVG
  is 'ƽ���ֹ�����';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.STOCK_NUM_AVG
  is 'ƽ��ÿ��ֹ���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.RETRACE_RATE_SEVEN
  is '��7�����س���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.RETRACE_RATE_THIRTY
  is '��30�����س���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.RETRACE_RATE_YEAR
  is '��һ�����س���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.RETRACE_RATE_TOTAL
  is '�ۼ����س���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_TOTAL_MONEY
  is '����ת�ʽ�';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_TOTAL_RATE
  is '����ת��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_TOTAL_RANKINGS
  is '����ת������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_SEVEN_MONEY
  is '��������ת�ʽ�';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_SEVEN_RATE
  is '��������ת��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_SEVEN_RANKINGS
  is '��������ת������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_THIRTY_MONEY
  is '��30����ת�ʽ�';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_THIRTY_RATE
  is '��30����ת��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_THIRTY_RANKINGS
  is '��30����ת������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_TODAY_MONEY
  is '������ת�ʽ�';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_TODAY_RATE
  is '������ת��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TURNOVER_TODAY_RANKINGS
  is '������ת������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.CHOOSE_TOTAL_SUM
  is 'ѡ���ܴ���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.CHOOSE_SUCCESS_SUM
  is 'ѡ�ɳɹ�����';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.CHOOSE_SUCCESS_RATE
  is 'ѡ�ɳɹ���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.CHOOSE_SUCCESS_RANKINGS
  is 'ѡ�ɳɹ�������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TRADE_LOSS_SUM
  is '���������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.TRADE_SUCCESS_SUM
  is 'ӯ��������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.NEW_TRADE_TIME
  is '���²���ʱ�䣨yyyy-MM-dd hh24:mi:ss��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.PORTFOLIO_STYLE
  is '��Ϸ��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM.HOLD_STOCK_NUM
  is '�ֹ���';
alter table SISANSHDATA.T_PORTFOLIO_SUM
  add constraint PORTFOLIO_UNIQUE unique (PORTFOLIO_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_PORTFOLIO_SUM to SISANSHOPR;

prompt
prompt Creating table T_PORTFOLIO_SUM_HIST
prompt ===================================
prompt
create table SISANSHDATA.T_PORTFOLIO_SUM_HIST
(
  PORTFOLIO_ID             NUMBER not null,
  SUB_NUM                  NUMBER,
  SUB_NUM_RANKINGS         NUMBER,
  COMMENT_NUM              NUMBER default 0,
  BEATGRAIL_NUM            NUMBER default 0,
  THIRTY_TRADE_NUM         NUMBER default 0,
  SEVEN_TRADE_NUM          NUMBER default 0,
  TOTAL_TRADE_NUM          NUMBER default 0,
  STOCK_HOLDDAYS_AVG       NUMBER default 0,
  STOCK_NUM_AVG            NUMBER default 0,
  RETRACE_RATE_SEVEN       NUMBER(10,4) default 0,
  RETRACE_RATE_THIRTY      NUMBER(10,4) default 0,
  RETRACE_RATE_YEAR        NUMBER(10,4) default 0,
  RETRACE_RATE_TOTAL       NUMBER(10,4) default 0,
  TURNOVER_TOTAL_MONEY     NUMBER(20,2),
  TURNOVER_TOTAL_RATE      NUMBER(10,4),
  TURNOVER_TOTAL_RANKINGS  NUMBER,
  TURNOVER_SEVEN_MONEY     NUMBER(16,2),
  TURNOVER_SEVEN_RATE      NUMBER(10,4),
  TURNOVER_SEVEN_RANKINGS  NUMBER,
  TURNOVER_THIRTY_MONEY    NUMBER(16,2),
  TURNOVER_THIRTY_RATE     NUMBER(10,4),
  TURNOVER_THIRTY_RANKINGS NUMBER,
  TURNOVER_TODAY_MONEY     NUMBER(16,2),
  TURNOVER_TODAY_RATE      NUMBER(10,4),
  TURNOVER_TODAY_RANKINGS  NUMBER,
  CHOOSE_TOTAL_SUM         NUMBER default 0,
  CHOOSE_SUCCESS_SUM       NUMBER default 0,
  CHOOSE_SUCCESS_RATE      NUMBER(10,4),
  CHOOSE_SUCCESS_RANKINGS  NUMBER,
  TRADE_LOSS_SUM           NUMBER default 0,
  TRADE_SUCCESS_SUM        NUMBER default 0,
  NEW_TRADE_TIME           VARCHAR2(30),
  CREATE_DATE              VARCHAR2(30),
  PORTFOLIO_STYLE          CHAR(1),
  HOLD_STOCK_NUM           NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_PORTFOLIO_SUM_HIST
  is '�������ͳ����ʷ��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.PORTFOLIO_ID
  is '���ID';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.SUB_NUM
  is '��ע��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.SUB_NUM_RANKINGS
  is '��ע������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.COMMENT_NUM
  is '������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.BEATGRAIL_NUM
  is '��Ӯ���̴���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.THIRTY_TRADE_NUM
  is '��30�ս��״���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.SEVEN_TRADE_NUM
  is '��7�ս��״���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TOTAL_TRADE_NUM
  is '�ܽ��״���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.STOCK_HOLDDAYS_AVG
  is 'ƽ���ֹ�����';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.STOCK_NUM_AVG
  is 'ƽ��ÿ��ֹ���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.RETRACE_RATE_SEVEN
  is '��7�����س���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.RETRACE_RATE_THIRTY
  is '��30�����س���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.RETRACE_RATE_YEAR
  is '��һ�����س���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.RETRACE_RATE_TOTAL
  is '�ۼ����س���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_TOTAL_MONEY
  is '����ת�ʽ�';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_TOTAL_RATE
  is '����ת��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_TOTAL_RANKINGS
  is '����ת������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_SEVEN_MONEY
  is '��������ת�ʽ�';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_SEVEN_RATE
  is '��������ת��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_SEVEN_RANKINGS
  is '��������ת������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_THIRTY_MONEY
  is '��30����ת�ʽ�';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_THIRTY_RATE
  is '��30����ת��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_THIRTY_RANKINGS
  is '��30����ת������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_TODAY_MONEY
  is '������ת�ʽ�';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_TODAY_RATE
  is '������ת��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TURNOVER_TODAY_RANKINGS
  is '������ת������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.CHOOSE_TOTAL_SUM
  is 'ѡ���ܴ���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.CHOOSE_SUCCESS_SUM
  is 'ѡ�ɳɹ�����';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.CHOOSE_SUCCESS_RATE
  is 'ѡ�ɳɹ���';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.CHOOSE_SUCCESS_RANKINGS
  is 'ѡ�ɳɹ�������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TRADE_LOSS_SUM
  is '���������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.TRADE_SUCCESS_SUM
  is 'ӯ��������';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.NEW_TRADE_TIME
  is '���²���ʱ�䣨yyyy-MM-dd hh24:mi:ss��';
comment on column SISANSHDATA.T_PORTFOLIO_SUM_HIST.CREATE_DATE
  is '��������';
grant select, insert, update, delete on SISANSHDATA.T_PORTFOLIO_SUM_HIST to SISANSHOPR;

prompt
prompt Creating table T_PUBLISH_ATTACH
prompt ===============================
prompt
create table SISANSHDATA.T_PUBLISH_ATTACH
(
  ID                NUMBER(10) not null,
  CATALOG_ID        NUMBER(10) not null,
  ATTACH_CATALOG_ID NUMBER(10) not null,
  SITENO            VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_PUBLISH_ATTACH
  is '�踽����������Ϣ';
comment on column SISANSHDATA.T_PUBLISH_ATTACH.ID
  is 'ID';
comment on column SISANSHDATA.T_PUBLISH_ATTACH.CATALOG_ID
  is '��ĿID';
comment on column SISANSHDATA.T_PUBLISH_ATTACH.ATTACH_CATALOG_ID
  is '������������ĿID';
comment on column SISANSHDATA.T_PUBLISH_ATTACH.SITENO
  is 'վ����';
grant select, insert, update, delete on SISANSHDATA.T_PUBLISH_ATTACH to SISANSHOPR;

prompt
prompt Creating table T_PUBLISH_LOG
prompt ============================
prompt
create table SISANSHDATA.T_PUBLISH_LOG
(
  ID          NUMBER(10) not null,
  QUEUE_ID    NUMBER(10) not null,
  DESCRIPTION VARCHAR2(1000),
  CREATE_BY   VARCHAR2(50),
  CREATE_DATE VARCHAR2(20)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_PUBLISH_LOG
  is 'T_PUBLISH_LOG';
comment on column SISANSHDATA.T_PUBLISH_LOG.ID
  is 'ID';
comment on column SISANSHDATA.T_PUBLISH_LOG.QUEUE_ID
  is 'QUEUE_ID';
comment on column SISANSHDATA.T_PUBLISH_LOG.DESCRIPTION
  is 'DESCRIPTION';
comment on column SISANSHDATA.T_PUBLISH_LOG.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_PUBLISH_LOG.CREATE_DATE
  is 'CREATE_DATE';
alter table SISANSHDATA.T_PUBLISH_LOG
  add constraint PK_T_PUBLISH_LOG primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_PUBLISH_LOG to SISANSHOPR;

prompt
prompt Creating table T_PUBLISH_PLAN
prompt =============================
prompt
create table SISANSHDATA.T_PUBLISH_PLAN
(
  ID          NUMBER(10) not null,
  CATALOG_ID  NUMBER(10) not null,
  TYPE        NUMBER(10) not null,
  TIME        VARCHAR2(30) not null,
  PUBLISHTIME VARCHAR2(30),
  RECURSION   NUMBER(10),
  STATE       NUMBER(10) default 0,
  MACHINE_ID  VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_PUBLISH_PLAN
  is '�����ƻ�';
comment on column SISANSHDATA.T_PUBLISH_PLAN.ID
  is '�����ɣ�';
comment on column SISANSHDATA.T_PUBLISH_PLAN.CATALOG_ID
  is '��ĿID';
comment on column SISANSHDATA.T_PUBLISH_PLAN.TYPE
  is '���� 0:�̶�ʱ�䷢�� 1:���ʱ�䷢��';
comment on column SISANSHDATA.T_PUBLISH_PLAN.TIME
  is '�̶�������ʱ��';
comment on column SISANSHDATA.T_PUBLISH_PLAN.PUBLISHTIME
  is '������ʱ��';
comment on column SISANSHDATA.T_PUBLISH_PLAN.RECURSION
  is '�Ƿ�̳з�������Ŀ 0:����Ҫ 1:��Ҫ';
comment on column SISANSHDATA.T_PUBLISH_PLAN.STATE
  is '0:δ���� 1:���ڴ����� 2:�Ѵ���';
comment on column SISANSHDATA.T_PUBLISH_PLAN.MACHINE_ID
  is '����ID';
alter table SISANSHDATA.T_PUBLISH_PLAN
  add constraint PK_T_PUBLISH_PLAN primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_PUBLISH_PLAN to SISANSHOPR;

prompt
prompt Creating table T_PUBLISH_QUEUE
prompt ==============================
prompt
create table SISANSHDATA.T_PUBLISH_QUEUE
(
  ID          NUMBER(10) not null,
  CMD_STR     VARCHAR2(255),
  SHOW_INFO   VARCHAR2(255),
  STATE       NUMBER(10),
  SITENO      VARCHAR2(50),
  CREATE_BY   VARCHAR2(50),
  CREATE_DATE VARCHAR2(20),
  MACHINE_ID  VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_PUBLISH_QUEUE
  is 'T_PUBLISH_QUEUE';
comment on column SISANSHDATA.T_PUBLISH_QUEUE.ID
  is 'ID';
comment on column SISANSHDATA.T_PUBLISH_QUEUE.CMD_STR
  is 'CMD_STR';
comment on column SISANSHDATA.T_PUBLISH_QUEUE.SHOW_INFO
  is 'SHOW_INFO';
comment on column SISANSHDATA.T_PUBLISH_QUEUE.STATE
  is 'STATE';
comment on column SISANSHDATA.T_PUBLISH_QUEUE.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_PUBLISH_QUEUE.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_PUBLISH_QUEUE.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_PUBLISH_QUEUE.MACHINE_ID
  is 'MACHINE_ID';
alter table SISANSHDATA.T_PUBLISH_QUEUE
  add constraint PK_T_PUBLISH_QUEUE primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_PUBLISH_QUEUE to SISANSHOPR;

prompt
prompt Creating table T_RECOMMEND_STATISTICS
prompt =====================================
prompt
create table SISANSHDATA.T_RECOMMEND_STATISTICS
(
  RS_ID                 NUMBER(12) not null,
  USER_ID               VARCHAR2(30) not null,
  LASTUPDATE            VARCHAR2(30),
  WEEK_SUM_COUNT        NUMBER(12),
  WEEK_SUM_RIGHT_COUNT  NUMBER(12),
  WEEK_SUM_RATE         NUMBER(5,2),
  WEEK_RANK             NUMBER(10),
  MONTH_SUM_COUNT       NUMBER(12),
  MONTH_SUM_RIGHT_COUNT NUMBER(12),
  MONTH_SUM_RATE        NUMBER(5,2),
  MONTH_RANK            NUMBER(10),
  TOTAL_SUM_COUNT       NUMBER(12),
  TOTAL_SUM_RIGHT_COUNT NUMBER(12),
  TOTAL_SUM_RATE        NUMBER(5,2),
  TOTAL_RANK            NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.RS_ID
  is '���к�';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.USER_ID
  is '�û�id';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.LASTUPDATE
  is '����ʱ��';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.WEEK_SUM_COUNT
  is '������ɼ�����';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.WEEK_SUM_RIGHT_COUNT
  is '������ɼ�����ȷ��';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.WEEK_SUM_RATE
  is '���ܼ�����ȷ��';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.WEEK_RANK
  is '������ȷ������';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.MONTH_SUM_COUNT
  is '������ɼ�����';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.MONTH_SUM_RIGHT_COUNT
  is '������ɼ�����ȷ��';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.MONTH_SUM_RATE
  is '���¼�����ȷ��';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.MONTH_RANK
  is '������ȷ������';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.TOTAL_SUM_COUNT
  is '�ۼ���ɼ�����';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.TOTAL_SUM_RIGHT_COUNT
  is '�ۼ���ɼ�����ȷ��';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.TOTAL_SUM_RATE
  is '�ۼƼ�����ȷ��';
comment on column SISANSHDATA.T_RECOMMEND_STATISTICS.TOTAL_RANK
  is '�ۼ���ȷ������';
alter table SISANSHDATA.T_RECOMMEND_STATISTICS
  add primary key (RS_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_RECOMMEND_STATISTICS to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RECOMMEND_STATISTICS to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RECOMMEND_STATISTICS to SISANSHOPR;

prompt
prompt Creating table T_RECOMMEND_STOCK
prompt ================================
prompt
create table SISANSHDATA.T_RECOMMEND_STOCK
(
  R_ID          NUMBER(12) not null,
  USER_ID       VARCHAR2(20) not null,
  STOCK_CODE    VARCHAR2(10) not null,
  STOCK_NAME    VARCHAR2(30),
  EXPECT_DATE   NUMBER(3) not null,
  EXPECT_INCOME NUMBER(4,2),
  BEGIN_TIME    VARCHAR2(30),
  BEGIN_PRICE   NUMBER(6,2),
  TARGET_PRICE  NUMBER(6,2),
  REASON        VARCHAR2(500),
  STATE         CHAR(1),
  END_TIME      VARCHAR2(30),
  END_INCOME    NUMBER(4,2),
  END_PRICE     NUMBER(6,2),
  IS_GIVEUP     CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RECOMMEND_STOCK
  is '���ɱ�';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.R_ID
  is '���к�';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.USER_ID
  is '�û�id';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.STOCK_NAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.EXPECT_DATE
  is 'Ԥ�ƶ��ٽ�����';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.EXPECT_INCOME
  is 'Ԥ������';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.BEGIN_TIME
  is '�Ƽ�ʱ��';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.BEGIN_PRICE
  is '�Ƽ��۸�';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.TARGET_PRICE
  is 'Ŀ��۸�';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.REASON
  is '�Ƽ�ԭ��';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.STATE
  is '״̬0������1�ɹ�2ʧ��';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.END_TIME
  is '����ʱ��';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.END_INCOME
  is '�����ǵ�';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.END_PRICE
  is '�����۸� ';
comment on column SISANSHDATA.T_RECOMMEND_STOCK.IS_GIVEUP
  is '����0δ����1����';
alter table SISANSHDATA.T_RECOMMEND_STOCK
  add primary key (R_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_RECOMMEND_STOCK to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RECOMMEND_STOCK to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RECOMMEND_STOCK to SISANSHOPR;

prompt
prompt Creating table T_ROLE_CATALOG_RIGHT
prompt ===================================
prompt
create table SISANSHDATA.T_ROLE_CATALOG_RIGHT
(
  ID              NUMBER(10) not null,
  ROLE_NO         VARCHAR2(50) not null,
  TYPE            NUMBER(10),
  CATALOG_ID_LIST CLOB,
  SITENO          VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_ROLE_CATALOG_RIGHT
  is 'T_ROLE_CATALOG_RIGHT';
comment on column SISANSHDATA.T_ROLE_CATALOG_RIGHT.ID
  is 'ID';
comment on column SISANSHDATA.T_ROLE_CATALOG_RIGHT.ROLE_NO
  is 'ROLE_NO';
comment on column SISANSHDATA.T_ROLE_CATALOG_RIGHT.TYPE
  is 'TYPE';
comment on column SISANSHDATA.T_ROLE_CATALOG_RIGHT.CATALOG_ID_LIST
  is 'CATALOG_ID_LIST';
comment on column SISANSHDATA.T_ROLE_CATALOG_RIGHT.SITENO
  is 'SITENO';
alter table SISANSHDATA.T_ROLE_CATALOG_RIGHT
  add constraint PK_T_ROLE_CATALOG_RIGHT primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_ROLE_CATALOG_RIGHT to SISANSHOPR;

prompt
prompt Creating table T_RQ_MATTER
prompt ==========================
prompt
create table SISANSHDATA.T_RQ_MATTER
(
  SERI_NUM   NUMBER not null,
  STOCK_CODE VARCHAR2(6),
  MARKET_ID  VARCHAR2(3),
  STOCK_NAME VARCHAR2(30),
  RQ_RATE    NUMBER(5,2),
  RQ_LIMIT   NUMBER(16),
  RQ_REMARK  VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RQ_MATTER
  is '��ȯ���ȯ';
comment on column SISANSHDATA.T_RQ_MATTER.SERI_NUM
  is '���к�';
comment on column SISANSHDATA.T_RQ_MATTER.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_RQ_MATTER.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_RQ_MATTER.STOCK_NAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_RQ_MATTER.RQ_RATE
  is '��ȯ��֤�����';
comment on column SISANSHDATA.T_RQ_MATTER.RQ_LIMIT
  is '��ȯ���';
comment on column SISANSHDATA.T_RQ_MATTER.RQ_REMARK
  is '��ȯ��ע';
grant select, insert, update, delete on SISANSHDATA.T_RQ_MATTER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RQ_MATTER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RQ_MATTER to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_ACCOUNT
prompt =============================
prompt
create table SISANSHDATA.T_RZRQ_ACCOUNT
(
  ACCOUNT_ID           NUMBER(10) not null,
  USER_ID              VARCHAR2(20) not null,
  ACCOUNT_TYPE         CHAR(1) not null,
  ACT_ID               VARCHAR2(50),
  MONEY_ID             CHAR(3),
  INIT_CAPITAL         NUMBER(16,2) not null,
  CAPITAL_BALANCE      NUMBER(16,2),
  FINANCING_LOAN       NUMBER(16,2),
  SECURITIES_LOAN      NUMBER(16,2),
  USED_MARGIN          NUMBER(16,2),
  USABLE_CREDIT_LINE   NUMBER(16,2),
  USED_CREDIT_LINE     NUMBER(16,2),
  TOTAL_ASSETS         NUMBER(16,2),
  TOTAL_MARKET         NUMBER(16,2),
  CREATE_DATE          VARCHAR2(20),
  MODIFY_DATE          VARCHAR2(20),
  STATE                CHAR(1) not null,
  NEED_SETTLEMENT      CHAR(1) default 1 not null,
  USABLE_BALANCE       NUMBER(16,2),
  NET_ASSETS           NUMBER(16,2),
  TOTAL_EARNINGS       NUMBER(16,2),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,2),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,2),
  MONTH_YIELD          NUMBER(10,4),
  MONTH_YIELD_RANKINGS NUMBER(10),
  DAY_EARNINGS         NUMBER(16,2),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  TOTAL_CHANGE         NUMBER(10),
  MONTH_CHANGE         NUMBER(10),
  WEEK_CHANGE          NUMBER(10),
  DAY_CHANGE           NUMBER(10),
  APPLY_STATE          NUMBER(1) default 1,
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_ACCOUNT
  is '������ȯ�˻���';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.ACCOUNT_ID
  is '�˻�id';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.USER_ID
  is '�����û�id';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.ACCOUNT_TYPE
  is '�˻����� 1Ϊ��ͨ������ȯ�˻�2Ϊ����������ȯ�˻�';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.ACT_ID
  is '�������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.MONEY_ID
  is '����,CNY-�����,USD-��Ԫ,HKD-�۱�';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.INIT_CAPITAL
  is '��ʼ�ʽ�';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.CAPITAL_BALANCE
  is '�ֽ��ʲ�';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.FINANCING_LOAN
  is '���ʸ�ծ';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.SECURITIES_LOAN
  is '��ȯ��ծ';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.USED_MARGIN
  is '���ñ�֤��';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.USABLE_CREDIT_LINE
  is '�������ö��';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.USED_CREDIT_LINE
  is '�������ö��';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.TOTAL_ASSETS
  is '���ʲ�';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.TOTAL_MARKET
  is '�ο���ֵ';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.CREATE_DATE
  is '�˻�����ʱ��';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.MODIFY_DATE
  is '������ʱ��';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.STATE
  is '״̬:1����;0�ر�';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.NEED_SETTLEMENT
  is '�˺��Ƿ���Ҫ����0������1����';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.USABLE_BALANCE
  is 'ʣ���ֽ�';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.NET_ASSETS
  is '���ʲ�';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.TOTAL_EARNINGS
  is '������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.TOTAL_YIELD
  is '��������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.TOTAL_YIELD_RANKINGS
  is '������������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.WEEK_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.WEEK_YIELD
  is '����������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.WEEK_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.MONTH_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.MONTH_YIELD
  is '����������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.MONTH_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.DAY_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.DAY_YIELD
  is '����������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.DAY_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.TOTAL_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.MONTH_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.WEEK_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.DAY_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.APPLY_STATE
  is '�����˻�����״̬0�����1ͨ��2δͨ��';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT.RANK_TYPE
  is '�˻���������';
alter table SISANSHDATA.T_RZRQ_ACCOUNT
  add constraint PK_RZRQ_ACCOUNT primary key (ACCOUNT_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.INDEX_ACT_ID on SISANSHDATA.T_RZRQ_ACCOUNT (ACT_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_ACCOUNT to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RZRQ_ACCOUNT to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_ACCOUNT to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_ACCOUNT_FORCESELL
prompt =======================================
prompt
create table SISANSHDATA.T_RZRQ_ACCOUNT_FORCESELL
(
  ACCOUNT_ID   NUMBER(10) not null,
  IS_FORCESELL CHAR(1) not null,
  CREATE_DATE  VARCHAR2(20) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_ACCOUNT_FORCESELL
  is '�ʻ�ǿ��ƽ�ּ�¼����¼�ʻ�ǿ��ƽ����Ϣ';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT_FORCESELL.ACCOUNT_ID
  is '�ʻ�ID';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT_FORCESELL.IS_FORCESELL
  is '�Ƿ�ǿ��ƽ�֣�0��1��';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT_FORCESELL.CREATE_DATE
  is '����ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_ACCOUNT_FORCESELL to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_ACCOUNT_MAINTAIN_RATE
prompt ===========================================
prompt
create table SISANSHDATA.T_RZRQ_ACCOUNT_MAINTAIN_RATE
(
  ACCOUNT_ID    NUMBER(10) not null,
  MAINTAIN_RATE NUMBER(16,2) not null,
  CREATE_DATE   VARCHAR2(30) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_ACCOUNT_MAINTAIN_RATE
  is '������ȯά�ֵ�����';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT_MAINTAIN_RATE.ACCOUNT_ID
  is '�ʻ�ID';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT_MAINTAIN_RATE.MAINTAIN_RATE
  is 'ά������';
comment on column SISANSHDATA.T_RZRQ_ACCOUNT_MAINTAIN_RATE.CREATE_DATE
  is '����ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_ACCOUNT_MAINTAIN_RATE to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_ARTICLE
prompt =============================
prompt
create table SISANSHDATA.T_RZRQ_ARTICLE
(
  ID            VARCHAR2(12) not null,
  TITLE         VARCHAR2(600),
  KEYWORD       VARCHAR2(600),
  CREATE_TIME   VARCHAR2(20),
  UPDATE_TIME   VARCHAR2(20),
  CREATE_AUTHER VARCHAR2(60),
  UPDATE_AUTHER VARCHAR2(60),
  CONTENT       CLOB,
  LINK          VARCHAR2(600),
  PUBLISH_STATE CHAR(1),
  ARTICLE_TYPE  VARCHAR2(10) default 1
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_ARTICLE
  is '������ȯ����';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.ID
  is '����ID';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.TITLE
  is '����';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.KEYWORD
  is '�ؼ���';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.CREATE_TIME
  is '����ʱ��';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.UPDATE_TIME
  is '�޸�ʱ��';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.CREATE_AUTHER
  is '������';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.UPDATE_AUTHER
  is '�޸���';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.CONTENT
  is '����';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.LINK
  is '����';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.PUBLISH_STATE
  is '����״̬ 0,δ���� 1,������ 2,�Ѳ��� 3,�ѷ��� 4,��ɾ��';
comment on column SISANSHDATA.T_RZRQ_ARTICLE.ARTICLE_TYPE
  is '������Ŀ 1��Ͷ��֧�� 2������� 3��������';
alter table SISANSHDATA.T_RZRQ_ARTICLE
  add constraint T_RZRQ_ARTICLE primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_ARTICLE to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_COLLATERAL
prompt ================================
prompt
create table SISANSHDATA.T_RZRQ_COLLATERAL
(
  SERI_NUM     NUMBER not null,
  STOCK_CODE   VARCHAR2(6),
  MARKET_ID    VARCHAR2(3),
  STOCK_NAME   VARCHAR2(30),
  EXCHANG_RATE NUMBER(5,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_COLLATERAL
  is '������ȯ����Ʒ';
comment on column SISANSHDATA.T_RZRQ_COLLATERAL.SERI_NUM
  is '�������к�';
comment on column SISANSHDATA.T_RZRQ_COLLATERAL.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_RZRQ_COLLATERAL.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_RZRQ_COLLATERAL.STOCK_NAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_RZRQ_COLLATERAL.EXCHANG_RATE
  is '������';
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_COLLATERAL to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RZRQ_COLLATERAL to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_COLLATERAL to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_CONSULT_INFO
prompt ==================================
prompt
create table SISANSHDATA.T_RZRQ_CONSULT_INFO
(
  ID                 VARCHAR2(11) not null,
  CREATE_DATE        VARCHAR2(20),
  CREATE_AUTHER      VARCHAR2(60),
  TRADER_SAY_TITLE   VARCHAR2(300),
  COMMENT_BEFORE     VARCHAR2(600),
  STUDY_TITLE        VARCHAR2(300),
  COMMENT_CENTER     VARCHAR2(600),
  COMMENT_AFTER      VARCHAR2(600),
  STUDY_CONTENT      CLOB,
  TRADER_SAY_CONTENT CLOB,
  PUBLISH_STATE      CHAR(1),
  UPDATE_DATE        VARCHAR2(20),
  UPDATE_AUTHER      VARCHAR2(60)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_CONSULT_INFO
  is '��ѯ��Ϣ��';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.ID
  is '����id';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.CREATE_AUTHER
  is '������';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.TRADER_SAY_TITLE
  is '��������¼����';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.COMMENT_BEFORE
  is 'ÿ�չ�������ǰ';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.STUDY_TITLE
  is '�б�����';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.COMMENT_CENTER
  is 'ÿ�չ���������';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.COMMENT_AFTER
  is 'ÿ�չ������̺�';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.STUDY_CONTENT
  is '�б�����';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.TRADER_SAY_CONTENT
  is '��������¼����';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.PUBLISH_STATE
  is '����״̬ 0,δ���� 1,������ 2,�Ѳ��� 3,�ѷ��� 4,��ɾ��';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.UPDATE_DATE
  is '�޸�ʱ��';
comment on column SISANSHDATA.T_RZRQ_CONSULT_INFO.UPDATE_AUTHER
  is '�޸���';
alter table SISANSHDATA.T_RZRQ_CONSULT_INFO
  add constraint T_RZRQ_CONSULT_ID primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_CONSULT_INFO to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_CREDIT_CONTRACTS
prompt ======================================
prompt
create table SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS
(
  CONTRACTS_NO           NUMBER not null,
  CREATE_TIME            VARCHAR2(30),
  CONTRACTS_STATE        CHAR(1),
  MARKET_ID              VARCHAR2(3),
  STOCK_CODE             VARCHAR2(6),
  STOCK_NAME             VARCHAR2(30),
  CONTRACTS_TYPE         CHAR(1),
  CONTRACTS_QTY          NUMBER,
  CONTRACTS_BALANCE      NUMBER(16,2),
  CONTRACTS_FARE         NUMBER(10,2),
  MARGIN_RATE            NUMBER(10,2),
  USED_MARGIN            NUMBER(16,2),
  CONTRACTS_INTEREST     NUMBER(16,2),
  RETURNED_QTY           NUMBER,
  RETURNED_BALANCE       NUMBER(16,2),
  RETURNED_FARE          NUMBER(16,2),
  RETURNED_INTEREST      NUMBER(16,2),
  TODAY_RETURNED_QTY     NUMBER(16,2),
  TODAY_RETURNED_BALANCE NUMBER(16,2),
  ORDER_NO               NUMBER,
  ACCOUNT_ID             NUMBER,
  MODIFY_DATE            VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS
  is '������ȯ���ú�Լ';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.CONTRACTS_NO
  is '��Լ���';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.CREATE_TIME
  is '����ʱ��';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.CONTRACTS_STATE
  is '��Լ״̬';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.STOCK_NAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.CONTRACTS_TYPE
  is '��Լ����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.CONTRACTS_QTY
  is '��Լ����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.CONTRACTS_BALANCE
  is '��Լ���';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.CONTRACTS_FARE
  is '��Լ����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.MARGIN_RATE
  is '��֤�����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.USED_MARGIN
  is '��֤�����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.CONTRACTS_INTEREST
  is '��Լ��Ϣ';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.RETURNED_QTY
  is '�ѻ�����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.RETURNED_BALANCE
  is '�ѻ����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.RETURNED_FARE
  is '�ѻ�����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.RETURNED_INTEREST
  is '�ѻ���Ϣ';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.TODAY_RETURNED_QTY
  is '�����ѻ�����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.TODAY_RETURNED_BALANCE
  is '�����ѻ����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.ORDER_NO
  is 'ί�б��';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.ACCOUNT_ID
  is '�˻����';
comment on column SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS.MODIFY_DATE
  is '�޸�ʱ�䣬���г������ʱ����¼��ǰ����ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_CREDIT_CONTRACTS to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_HIST_ACCOUNT
prompt ==================================
prompt
create table SISANSHDATA.T_RZRQ_HIST_ACCOUNT
(
  ACCOUNT_ID           NUMBER(10) not null,
  MONEY_ID             CHAR(3),
  CAPITAL_BALANCE      NUMBER(16,2),
  FINANCING_LOAN       NUMBER(16,2),
  SECURITIES_LOAN      NUMBER(16,2),
  TOTAL_ASSETS         NUMBER(16,2),
  TOTAL_MARKET         NUMBER(16,2),
  CREATE_DATE          VARCHAR2(20),
  USABLE_BALANCE       NUMBER(16,2),
  NET_ASSETS           NUMBER(16,2),
  TOTAL_EARNINGS       NUMBER(16,2),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,2),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,2),
  MONTH_YIELD          NUMBER(10,4),
  MONTH_YIELD_RANKINGS NUMBER(10),
  DAY_EARNINGS         NUMBER(16,2),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  TOTAL_CHANGE         NUMBER(10),
  MONTH_CHANGE         NUMBER(10),
  WEEK_CHANGE          NUMBER(10),
  DAY_CHANGE           NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_HIST_ACCOUNT
  is '������ȯ�˻���';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.ACCOUNT_ID
  is '�˻�id';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.MONEY_ID
  is '����,CNY-�����,USD-��Ԫ,HKD-�۱�';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.CAPITAL_BALANCE
  is '�ʽ����';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.FINANCING_LOAN
  is '���ʸ�ծ';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.SECURITIES_LOAN
  is '��ȯ��ծ';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.TOTAL_ASSETS
  is '���ʲ�';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.TOTAL_MARKET
  is '�ο���ֵ';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.USABLE_BALANCE
  is '�������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.NET_ASSETS
  is '���ʲ�';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.TOTAL_EARNINGS
  is '������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.TOTAL_YIELD
  is '��������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.TOTAL_YIELD_RANKINGS
  is '������������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.WEEK_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.WEEK_YIELD
  is '����������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.WEEK_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.MONTH_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.MONTH_YIELD
  is '����������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.MONTH_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.DAY_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.DAY_YIELD
  is '����������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.DAY_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.TOTAL_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.MONTH_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.WEEK_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.DAY_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_RZRQ_HIST_ACCOUNT.RANK_TYPE
  is '��������';
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_HIST_ACCOUNT to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RZRQ_HIST_ACCOUNT to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_HIST_ACCOUNT to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_HIST_ACCOUNT_BK
prompt =====================================
prompt
create table SISANSHDATA.T_RZRQ_HIST_ACCOUNT_BK
(
  ACCOUNT_ID           NUMBER(10) not null,
  MONEY_ID             CHAR(3),
  CAPITAL_BALANCE      NUMBER(16,2),
  FINANCING_LOAN       NUMBER(16,2),
  SECURITIES_LOAN      NUMBER(16,2),
  TOTAL_ASSETS         NUMBER(16,2),
  TOTAL_MARKET         NUMBER(16,2),
  CREATE_DATE          VARCHAR2(20),
  USABLE_BALANCE       NUMBER(16,2),
  NET_ASSETS           NUMBER(16,2),
  TOTAL_EARNINGS       NUMBER(16,2),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,2),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,2),
  MONTH_YIELD          NUMBER(10,4),
  MONTH_YIELD_RANKINGS NUMBER(10),
  DAY_EARNINGS         NUMBER(16,2),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  TOTAL_CHANGE         NUMBER(10),
  MONTH_CHANGE         NUMBER(10),
  WEEK_CHANGE          NUMBER(10),
  DAY_CHANGE           NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_HIST_ACCOUNT_BK to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_HIST_ORDER
prompt ================================
prompt
create table SISANSHDATA.T_RZRQ_HIST_ORDER
(
  ORDER_NUM     NUMBER(10) not null,
  CONTRACT_NO   VARCHAR2(50),
  FREEZE_MARGIN NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_HIST_ORDER
  is '������ȯ��ʷί�б�';
comment on column SISANSHDATA.T_RZRQ_HIST_ORDER.ORDER_NUM
  is 'ί�б��';
comment on column SISANSHDATA.T_RZRQ_HIST_ORDER.CONTRACT_NO
  is 'ָ��ƽ�ֺ�Լ���';
comment on column SISANSHDATA.T_RZRQ_HIST_ORDER.FREEZE_MARGIN
  is '���ᱣ֤��';
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_HIST_ORDER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RZRQ_HIST_ORDER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_HIST_ORDER to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_HOLD_STOCK
prompt ================================
prompt
create table SISANSHDATA.T_RZRQ_HOLD_STOCK
(
  SERIAL_NUM           NUMBER(10) not null,
  CREDIT_USBALE_QTY    NUMBER(16),
  FINANCING_USABLE_QTY NUMBER(16),
  CREDIT_QTY           NUMBER(16),
  FINANCING_QTY        NUMBER(16)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_HOLD_STOCK
  is '�˻��ֱֲ�';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK.SERIAL_NUM
  is '����ID�ֱֲ����t_sim_hold_stock.SERIAL_NUM����';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK.CREDIT_USBALE_QTY
  is '�����������';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK.FINANCING_USABLE_QTY
  is '�����������';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK.CREDIT_QTY
  is '��������';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK.FINANCING_QTY
  is '��������';
alter table SISANSHDATA.T_RZRQ_HOLD_STOCK
  add constraint PK_T_RZRQ_HOLD_STOCK primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_HOLD_STOCK to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RZRQ_HOLD_STOCK to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_HOLD_STOCK to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_HOLD_STOCK_HIST
prompt =====================================
prompt
create table SISANSHDATA.T_RZRQ_HOLD_STOCK_HIST
(
  SERIAL_NUM           NUMBER(10) not null,
  CREDIT_USBALE_QTY    NUMBER(16),
  FINANCING_USABLE_QTY NUMBER(16),
  CREDIT_QTY           NUMBER(16),
  FINANCING_QTY        NUMBER(16),
  CREATE_DATE          VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_HOLD_STOCK_HIST
  is '�˻��ֱֲ�ÿ�ձ���';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK_HIST.SERIAL_NUM
  is '����ID�ֱֲ����t_sim_hold_stock.SERIAL_NUM����';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK_HIST.CREDIT_USBALE_QTY
  is '�����������';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK_HIST.FINANCING_USABLE_QTY
  is '�����������';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK_HIST.CREDIT_QTY
  is '��������';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK_HIST.FINANCING_QTY
  is '��������';
comment on column SISANSHDATA.T_RZRQ_HOLD_STOCK_HIST.CREATE_DATE
  is '��������';
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_HOLD_STOCK_HIST to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_SETTLEMENT_ACCOUNT
prompt ========================================
prompt
create table SISANSHDATA.T_RZRQ_SETTLEMENT_ACCOUNT
(
  ACCOUNT_ID           NUMBER(10) not null,
  MONEY_ID             CHAR(3),
  CAPITAL_BALANCE      NUMBER(16,2),
  FINANCING_LOAN       NUMBER(16,2),
  SECURITIES_LOAN      NUMBER(16,2),
  TOTAL_ASSETS         NUMBER(16,2),
  TOTAL_MARKET         NUMBER(16,2),
  CREATE_DATE          VARCHAR2(20),
  USABLE_BALANCE       NUMBER(16,2),
  NET_ASSETS           NUMBER(16,2),
  TOTAL_EARNINGS       NUMBER(16,2),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,2),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,2),
  MONTH_YIELD          NUMBER(10,4),
  MONTH_YIELD_RANKINGS NUMBER(10),
  DAY_EARNINGS         NUMBER(16,2),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  TOTAL_CHANGE         NUMBER(10),
  MONTH_CHANGE         NUMBER(10),
  WEEK_CHANGE          NUMBER(10),
  DAY_CHANGE           NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.RZRQ_SETTLEMENT_INDEX on SISANSHDATA.T_RZRQ_SETTLEMENT_ACCOUNT (CREATE_DATE)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.RZRQ_SETTLEMENT_INDEX_ID on SISANSHDATA.T_RZRQ_SETTLEMENT_ACCOUNT (ACCOUNT_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_SETTLEMENT_ACCOUNT to SISANSHOPR;

prompt
prompt Creating table T_RZRQ_TODAY_ORDER
prompt =================================
prompt
create table SISANSHDATA.T_RZRQ_TODAY_ORDER
(
  ORDER_NUM     NUMBER(10) not null,
  CONTRACT_NO   VARCHAR2(50),
  FREEZE_MARGIN NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZRQ_TODAY_ORDER
  is '������ȯ����ί�б�';
comment on column SISANSHDATA.T_RZRQ_TODAY_ORDER.ORDER_NUM
  is 'ί�б��';
comment on column SISANSHDATA.T_RZRQ_TODAY_ORDER.CONTRACT_NO
  is 'ָ��ƽ�ֺ�Լ���';
comment on column SISANSHDATA.T_RZRQ_TODAY_ORDER.FREEZE_MARGIN
  is '���ᱣ֤��';
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_TODAY_ORDER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RZRQ_TODAY_ORDER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RZRQ_TODAY_ORDER to SISANSHOPR;

prompt
prompt Creating table T_RZ_MATTER
prompt ==========================
prompt
create table SISANSHDATA.T_RZ_MATTER
(
  STOCK_CODE VARCHAR2(6),
  MARKET_ID  VARCHAR2(3),
  STOCK_NAME VARCHAR2(30),
  RZ_RATE    NUMBER(5,2),
  RZ_LIMIT   NUMBER(16,2),
  RZ_REMARK  VARCHAR2(50),
  SERI_NUM   NUMBER not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_RZ_MATTER
  is '���ʱ��ȯ';
comment on column SISANSHDATA.T_RZ_MATTER.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_RZ_MATTER.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_RZ_MATTER.STOCK_NAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_RZ_MATTER.RZ_RATE
  is '���ʱ�֤�����';
comment on column SISANSHDATA.T_RZ_MATTER.RZ_LIMIT
  is '�����޶�';
comment on column SISANSHDATA.T_RZ_MATTER.RZ_REMARK
  is '��ע';
comment on column SISANSHDATA.T_RZ_MATTER.SERI_NUM
  is '���к�';
grant select, insert, update, delete on SISANSHDATA.T_RZ_MATTER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RZ_MATTER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_RZ_MATTER to SISANSHOPR;

prompt
prompt Creating table T_SCORE_FLOW
prompt ===========================
prompt
create table SISANSHDATA.T_SCORE_FLOW
(
  FLOW_ID     NUMBER(10),
  USER_ID     VARCHAR2(20),
  SCORE       NUMBER,
  REASON      VARCHAR2(1000),
  CREATE_DATE VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SCORE_FLOW
  is '������ˮ';
comment on column SISANSHDATA.T_SCORE_FLOW.FLOW_ID
  is '��ˮ���';
comment on column SISANSHDATA.T_SCORE_FLOW.USER_ID
  is '�û�id';
comment on column SISANSHDATA.T_SCORE_FLOW.SCORE
  is '������ˮ';
comment on column SISANSHDATA.T_SCORE_FLOW.REASON
  is 'ԭ��';
comment on column SISANSHDATA.T_SCORE_FLOW.CREATE_DATE
  is 'ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_SCORE_FLOW to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SCORE_FLOW to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SCORE_FLOW to SISANSHOPR;

prompt
prompt Creating table T_SEQUENCE
prompt =========================
prompt
create table SISANSHDATA.T_SEQUENCE
(
  NAME          VARCHAR2(50) not null,
  CURRENT_VALUE VARCHAR2(20) not null,
  STEP          VARCHAR2(20) not null,
  ROLL_BACK     VARCHAR2(20) not null,
  START_VALUE   VARCHAR2(20) not null,
  MAX_VALUE     VARCHAR2(20) not null,
  SITENO        VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
alter table SISANSHDATA.T_SEQUENCE
  add constraint T_SEQUENCE_PRI primary key (NAME)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SEQUENCE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SEQUENCE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SEQUENCE to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACCOUNT
prompt ============================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(100),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1) default 1,
  NEED_SETTLEMENT          NUMBER(1) default 1,
  RANK_TYPE                CHAR(1),
  RECENT_WEEK_YIELD        NUMBER(10,4),
  RECENT_MONTH_YIELD       NUMBER(10,4),
  RECENT_WEEK_EARNINGS     NUMBER(16,2),
  RECENT_MONTH_EARNINGS    NUMBER(16,2),
  RECENT_YEAR_YIELD        NUMBER(10,4),
  RECENT_YEAR_EARNINGS     NUMBER(16,2),
  FACE_IMAGE_SMALL         VARCHAR2(300),
  SEASON_EARNINGS          NUMBER(16,2),
  SEASON_YIELD             NUMBER(10,4),
  SEASON_YIELD_RANKINGS    NUMBER(10),
  SEASON_CHANGE            NUMBER(16)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_ACCOUNT
  is '�˻���';
comment on column SISANSHDATA.T_SIM_ACCOUNT.ACCOUNT_ID
  is '�˻�ID';
comment on column SISANSHDATA.T_SIM_ACCOUNT.ACCOUNT_NAME
  is '�˻�����';
comment on column SISANSHDATA.T_SIM_ACCOUNT.ACCOUNT_TYPE
  is '�˻�����1:�Խ��˻�;2:�����˻�';
comment on column SISANSHDATA.T_SIM_ACCOUNT.USER_ID
  is '�����û�ID';
comment on column SISANSHDATA.T_SIM_ACCOUNT.ACT_ID
  is '����ID';
comment on column SISANSHDATA.T_SIM_ACCOUNT.MONEY_ID
  is '����,CNY-�����,USD-��Ԫ,HKD-�۱�';
comment on column SISANSHDATA.T_SIM_ACCOUNT.INIT_BALANCE
  is '��ʼ�ʲ�(�ֽ�)';
comment on column SISANSHDATA.T_SIM_ACCOUNT.USERABLE_BALANCE
  is '�����ʲ�(�ֽ�)';
comment on column SISANSHDATA.T_SIM_ACCOUNT.CURRENT_BALANCE
  is '��ǰ�ʲ�(�ֽ�)';
comment on column SISANSHDATA.T_SIM_ACCOUNT.TOTAL_ASSETS
  is '���ʲ�';
comment on column SISANSHDATA.T_SIM_ACCOUNT.TOTAL_EARNINGS
  is '������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.TOTAL_YIELD
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.TOTAL_YIELD_RANKINGS
  is '������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.TOTAL_MARKET
  is '�ֲֹ�Ʊ����ֵ';
comment on column SISANSHDATA.T_SIM_ACCOUNT.TOTAL_MARKET_RANKINGS
  is '��ֵ������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.WEEK_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.WEEK_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.WEEK_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.LAST_WEEK_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.MONTH_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.MONTH_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.MONTH_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.CREATE_DATE
  is '�˻�����ʱ��';
comment on column SISANSHDATA.T_SIM_ACCOUNT.MODIFY_DATE
  is '������ʱ��';
comment on column SISANSHDATA.T_SIM_ACCOUNT.STATE
  is '״̬:1����;0�ر�';
comment on column SISANSHDATA.T_SIM_ACCOUNT.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_ACCOUNT.PK_ACCOUNT
  is '�Ƿ�Ϊ���˺�:1��;0��';
comment on column SISANSHDATA.T_SIM_ACCOUNT.DESCRIPTION
  is '�˻�����';
comment on column SISANSHDATA.T_SIM_ACCOUNT.DAY_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.DAY_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.DAY_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.TOTAL_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_SIM_ACCOUNT.MONTH_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_SIM_ACCOUNT.WEEK_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_SIM_ACCOUNT.DAY_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_SIM_ACCOUNT.APPLY_STATE
  is '�����˻�����״̬0�����1ͨ��2δͨ��';
comment on column SISANSHDATA.T_SIM_ACCOUNT.NEED_SETTLEMENT
  is '�˻��Ƿ���Ҫ����0��������1����';
comment on column SISANSHDATA.T_SIM_ACCOUNT.RANK_TYPE
  is '�˻���������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.RECENT_WEEK_YIELD
  is '������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.RECENT_MONTH_YIELD
  is '��30��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.RECENT_YEAR_YIELD
  is '��һ��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.FACE_IMAGE_SMALL
  is '�û�ͷ��';
comment on column SISANSHDATA.T_SIM_ACCOUNT.SEASON_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.SEASON_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.SEASON_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT.SEASON_CHANGE
  is '�������仯';
alter table SISANSHDATA.T_SIM_ACCOUNT
  add constraint PK_T_SIM_ACCOUNT primary key (ACCOUNT_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.INDEX_SIM_ACT_ID on SISANSHDATA.T_SIM_ACCOUNT (ACT_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACCOUNT to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_ACCOUNT to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACCOUNT to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACCOUNT20140523
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT20140523
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(100),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT20140523 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT20170710
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT20170710
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(100),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT20170710 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_2013
prompt =================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_2013
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_2013 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_20130118
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_20130118
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_20130118 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_20130201
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_20130201
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_20130201 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_20130219
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_20130219
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_20130219 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_20130220
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_20130220
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_20130220 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_20130221
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_20130221
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_20130221 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_20130222
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_20130222
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_20130222 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_20130227
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_20130227
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_20130227 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_20130506
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_20130506
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_20130506 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_20130918
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_20130918
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_20130918 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_201407281612
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_201407281612
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(100),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_201407281612 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_201409231630
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_201409231630
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(100),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_201409231630 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_201409250949
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_201409250949
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(100),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_201409250949 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_201410300917
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_201410300917
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(100),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_201410300917 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_201412301612
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_201412301612
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(100),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_201412301612 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_201504201111
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_201504201111
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(100),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  APPLY_STATE              NUMBER(1),
  NEED_SETTLEMENT          NUMBER(1),
  RANK_TYPE                CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_ACCOUNT_201504201111 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_ACCOUNT_BK
prompt ===============================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_BK
(
  ACCOUNT_ID               NUMBER(10) not null,
  ACCOUNT_NAME             VARCHAR2(20),
  ACCOUNT_TYPE             CHAR(1) not null,
  USER_ID                  VARCHAR2(20) not null,
  ACT_ID                   VARCHAR2(50),
  MONEY_ID                 CHAR(3) not null,
  INIT_BALANCE             NUMBER(16,2) not null,
  USERABLE_BALANCE         NUMBER(16,2) not null,
  CURRENT_BALANCE          NUMBER(16,2) not null,
  TOTAL_ASSETS             NUMBER(16,2) not null,
  TOTAL_EARNINGS           NUMBER(16,2),
  TOTAL_YIELD              NUMBER(10,4),
  TOTAL_YIELD_RANKINGS     NUMBER(10),
  TOTAL_MARKET             NUMBER(16,2),
  TOTAL_MARKET_RANKINGS    NUMBER(10),
  WEEK_EARNINGS            NUMBER(16,2),
  WEEK_YIELD               NUMBER(10,4),
  WEEK_YIELD_RANKINGS      NUMBER(10),
  LAST_WEEK_YIELD_RANKINGS NUMBER(10),
  MONTH_EARNINGS           NUMBER(16,2),
  MONTH_YIELD              NUMBER(10,4),
  MONTH_YIELD_RANKINGS     NUMBER(10),
  CREATE_DATE              VARCHAR2(20) not null,
  MODIFY_DATE              VARCHAR2(20),
  STATE                    CHAR(1),
  REMARK                   VARCHAR2(100),
  PK_ACCOUNT               CHAR(1),
  DESCRIPTION              VARCHAR2(1000),
  DAY_EARNINGS             NUMBER(16,2),
  DAY_YIELD                NUMBER(10,4),
  DAY_YIELD_RANKINGS       NUMBER(10),
  TOTAL_CHANGE             NUMBER(16),
  MONTH_CHANGE             NUMBER(16),
  WEEK_CHANGE              NUMBER(16),
  DAY_CHANGE               NUMBER(16),
  NEED_SETTLEMENT          CHAR(1) default 1,
  APPLY_STATE              NUMBER(1),
  RANK_TYPE                CHAR(1),
  RECENT_WEEK_YIELD        NUMBER(10,4),
  RECENT_MONTH_YIELD       NUMBER(10,4),
  RECENT_WEEK_EARNINGS     NUMBER(16,2),
  RECENT_MONTH_EARNINGS    NUMBER(16,2),
  RECENT_YEAR_YIELD        NUMBER(10,4),
  RECENT_YEAR_EARNINGS     NUMBER(16,2),
  FACE_IMAGE_SMALL         VARCHAR2(300),
  SEASON_EARNINGS          NUMBER(16,2),
  SEASON_YIELD             NUMBER(10,4),
  SEASON_YIELD_RANKINGS    NUMBER(10),
  SEASON_CHANGE            NUMBER(16)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_ACCOUNT_BK
  is '�˻���';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.ACCOUNT_ID
  is '�˻�ID';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.ACCOUNT_NAME
  is '�˻�����';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.ACCOUNT_TYPE
  is '�˻�����1:�Խ��˻�;2:�����˻�';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.USER_ID
  is '�����û�ID';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.ACT_ID
  is '����ID';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.MONEY_ID
  is '����,CNY-�����,USD-��Ԫ,HKD-�۱�';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.INIT_BALANCE
  is '��ʼ�ʲ�(�ֽ�)';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.USERABLE_BALANCE
  is '�����ʲ�(�ֽ�)';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.CURRENT_BALANCE
  is '��ǰ�ʲ�(�ֽ�)';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.TOTAL_ASSETS
  is '���ʲ�';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.TOTAL_EARNINGS
  is '������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.TOTAL_YIELD
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.TOTAL_YIELD_RANKINGS
  is '������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.TOTAL_MARKET
  is '�ֲֹ�Ʊ����ֵ';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.TOTAL_MARKET_RANKINGS
  is '��ֵ������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.WEEK_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.WEEK_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.WEEK_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.LAST_WEEK_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.MONTH_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.MONTH_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.MONTH_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.CREATE_DATE
  is '�˻�����ʱ��';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.MODIFY_DATE
  is '������ʱ��';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.STATE
  is '״̬:1����;0�ر�';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.PK_ACCOUNT
  is '�Ƿ�Ϊ���˺�:1��;0��';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.DESCRIPTION
  is '�˻�����';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.DAY_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.DAY_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.DAY_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.TOTAL_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.MONTH_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.WEEK_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.DAY_CHANGE
  is '�������仯';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.NEED_SETTLEMENT
  is '�˺��Ƿ���Ҫ����0������1����';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.APPLY_STATE
  is '�����˻�����״̬0�����1ͨ��2δͨ��';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.RECENT_WEEK_YIELD
  is '������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.RECENT_MONTH_YIELD
  is '��30��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.RECENT_YEAR_YIELD
  is '��һ��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.FACE_IMAGE_SMALL
  is '�û�ͷ��';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.SEASON_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.SEASON_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.SEASON_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_BK.SEASON_CHANGE
  is '�������仯';
alter table SISANSHDATA.T_SIM_ACCOUNT_BK
  add constraint PK_T_SIM_ACCOUNT_BK primary key (ACCOUNT_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACCOUNT_BK to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_ACCOUNT_BK to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACCOUNT_BK to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACCOUNT_CHANGE
prompt ===================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_CHANGE
(
  SERI_NUM            NUMBER not null,
  ORDER_SRLNUM        NUMBER not null,
  ACCOUNT_BE_POSITION NUMBER(10,4),
  ACCOUNT_AF_POSITION NUMBER(10,4),
  STOCK_BE_POSITION   NUMBER(10,4),
  STOCK_AF_POSITION   NUMBER(10,4)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on column SISANSHDATA.T_SIM_ACCOUNT_CHANGE.SERI_NUM
  is '����';
comment on column SISANSHDATA.T_SIM_ACCOUNT_CHANGE.ORDER_SRLNUM
  is 'ί�б��';
comment on column SISANSHDATA.T_SIM_ACCOUNT_CHANGE.ACCOUNT_BE_POSITION
  is '�ɽ�ǰ�ʺ��ܲ�λ';
comment on column SISANSHDATA.T_SIM_ACCOUNT_CHANGE.ACCOUNT_AF_POSITION
  is '�ɽ����ʺ��ò�λ';
comment on column SISANSHDATA.T_SIM_ACCOUNT_CHANGE.STOCK_BE_POSITION
  is '�ɽ�ǰ��Ʊ��λ';
comment on column SISANSHDATA.T_SIM_ACCOUNT_CHANGE.STOCK_AF_POSITION
  is '�ɽ����Ʊ��λ';
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACCOUNT_CHANGE to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACCOUNT_ORDER_COMMENT
prompt ==========================================
prompt
create table SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT
(
  SERIAL_NUM      NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  COMMENT_CONTENT VARCHAR2(500) not null,
  COMMENT_DATE    CHAR(8) not null,
  COMMENT_TIME    VARCHAR2(20) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT
  is '�˻�ί�����۱�';
comment on column SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT.SERIAL_NUM
  is '����ID(ͬT_SIM_TODAY_ORDER��������ȫƥ��)';
comment on column SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT.ACCOUNT_ID
  is '�����˻�ID';
comment on column SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT.COMMENT_CONTENT
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT.COMMENT_DATE
  is '��������';
comment on column SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT.COMMENT_TIME
  is '����ʱ��';
alter table SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT
  add constraint PK_T_SIM_ACCOUNT_ORDER_COMMENT primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACCOUNT_ORDER_COMMENT to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACTIVITY
prompt =============================
prompt
create table SISANSHDATA.T_SIM_ACTIVITY
(
  ACT_ID                VARCHAR2(50) not null,
  ACT_NAME              VARCHAR2(100) not null,
  AD_MESSAGE            VARCHAR2(200),
  INIT_MONEY            NUMBER(16,4) not null,
  INTRODUCTION          VARCHAR2(1000),
  APPLY_BEGIN_DATE      CHAR(8) not null,
  APPLY_END_DATE        CHAR(8) not null,
  BEGIN_DATE            CHAR(8) not null,
  END_DATE              CHAR(8) not null,
  CREATE_DATE           VARCHAR2(30),
  MODIFY_DATE           VARCHAR2(30),
  PARTNER               VARCHAR2(50),
  CONTACT               VARCHAR2(50),
  PHONE1                VARCHAR2(20),
  PHONE2                VARCHAR2(20),
  EMAIL                 VARCHAR2(50),
  REMARK                VARCHAR2(100),
  IS_HOT                CHAR(2) default 0,
  MATCH_STATE           CHAR(2),
  APPLY_STATE           CHAR(2) not null,
  ACTIVITY_TYPE         NUMBER(1),
  ACTIVITY_TRADE_TYPE   NUMBER(1),
  STATUS                NUMBER(1),
  SHARE_TITLE           VARCHAR2(100),
  SHARE_CONTENT         VARCHAR2(512),
  SHARE_URL             VARCHAR2(256),
  ACT_MATCH_PICT        VARCHAR2(256),
  IS_SHOW_INDEX         VARCHAR2(1) default 0,
  SINGLE_STOCK_POSITION VARCHAR2(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_ACTIVITY
  is '������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.ACT_ID
  is '�������к�';
comment on column SISANSHDATA.T_SIM_ACTIVITY.ACT_NAME
  is '��������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.AD_MESSAGE
  is '���������Ϣ';
comment on column SISANSHDATA.T_SIM_ACTIVITY.INIT_MONEY
  is '������ʼ���';
comment on column SISANSHDATA.T_SIM_ACTIVITY.INTRODUCTION
  is '��������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.APPLY_BEGIN_DATE
  is '������ʼ����';
comment on column SISANSHDATA.T_SIM_ACTIVITY.APPLY_END_DATE
  is '������������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.BEGIN_DATE
  is '������ʼ����';
comment on column SISANSHDATA.T_SIM_ACTIVITY.END_DATE
  is '������������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_ACTIVITY.MODIFY_DATE
  is '�޸�����';
comment on column SISANSHDATA.T_SIM_ACTIVITY.PARTNER
  is '�������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.CONTACT
  is '������ϵ��';
comment on column SISANSHDATA.T_SIM_ACTIVITY.PHONE1
  is '��ϵ�绰1';
comment on column SISANSHDATA.T_SIM_ACTIVITY.PHONE2
  is '��ϵ�绰2';
comment on column SISANSHDATA.T_SIM_ACTIVITY.EMAIL
  is '������������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_ACTIVITY.IS_HOT
  is '�Ƿ�Ϊ���Ŵ���';
comment on column SISANSHDATA.T_SIM_ACTIVITY.MATCH_STATE
  is '����״̬:0δ��ʼ��1�����У�2�ѽ���';
comment on column SISANSHDATA.T_SIM_ACTIVITY.APPLY_STATE
  is '����״̬:0δ��ʼ��1�����У�2�ѽ���';
comment on column SISANSHDATA.T_SIM_ACTIVITY.ACTIVITY_TYPE
  is '�������ԣ�0������������1��������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.ACTIVITY_TRADE_TYPE
  is '�����������ͣ�0��ͨ����1������ȯ����';
comment on column SISANSHDATA.T_SIM_ACTIVITY.STATUS
  is 'ģ�⳴�ɴ�������״̬,1������,0δ����,2�ѷ���';
comment on column SISANSHDATA.T_SIM_ACTIVITY.SHARE_TITLE
  is '�������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.SHARE_CONTENT
  is '��������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.SHARE_URL
  is '��������';
comment on column SISANSHDATA.T_SIM_ACTIVITY.ACT_MATCH_PICT
  is '������ͼƬ';
comment on column SISANSHDATA.T_SIM_ACTIVITY.IS_SHOW_INDEX
  is '�Ƿ���ҳ��ʾ';
comment on column SISANSHDATA.T_SIM_ACTIVITY.SINGLE_STOCK_POSITION
  is '��������е��ɹ�Ʊ��λ���ƣ����ó������ֵ��0-1֮�䣩';
alter table SISANSHDATA.T_SIM_ACTIVITY
  add constraint PK_T_SIM_ACTIVITY primary key (ACT_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_ACTIVITY to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACTIVITY_APPLY
prompt ===================================
prompt
create table SISANSHDATA.T_SIM_ACTIVITY_APPLY
(
  ID          NUMBER(20) not null,
  USER_ID     VARCHAR2(20) not null,
  ACT_ID      VARCHAR2(50) not null,
  STATE       NUMBER(2) default 0,
  REALNAME    VARCHAR2(50),
  MOBILE      VARCHAR2(30),
  CREATE_DATE VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_ACTIVITY_APPLY
  is '���������û���';
comment on column SISANSHDATA.T_SIM_ACTIVITY_APPLY.ID
  is '����id';
comment on column SISANSHDATA.T_SIM_ACTIVITY_APPLY.USER_ID
  is '�û�id ����t_sim_user�û���';
comment on column SISANSHDATA.T_SIM_ACTIVITY_APPLY.ACT_ID
  is '����id ����t_sim_activity������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_APPLY.STATE
  is '�����û�״̬ 0��δ��ˣ�1���ͨ����2 ���δͨ��';
comment on column SISANSHDATA.T_SIM_ACTIVITY_APPLY.REALNAME
  is '��ʵ����';
comment on column SISANSHDATA.T_SIM_ACTIVITY_APPLY.MOBILE
  is '��ϵ�绰';
comment on column SISANSHDATA.T_SIM_ACTIVITY_APPLY.CREATE_DATE
  is '����ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_APPLY to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_ACTIVITY_APPLY to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_APPLY to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACTIVITY_COMMENT
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_ACTIVITY_COMMENT
(
  ID            NUMBER(20) not null,
  ACT_ID        VARCHAR2(50) not null,
  ACT_COMMENT   VARCHAR2(500) default '' not null,
  COMMENT_USER  VARCHAR2(20) not null,
  MODIFY_USER   VARCHAR2(20) default '',
  COMMENT_TITLE VARCHAR2(50) default '',
  CREATE_DATE   VARCHAR2(10) default to_char(sysdate,'yyyymmdd') not null,
  MODIFY_DATE   VARCHAR2(10) default to_char(sysdate,'yyyymmdd')
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_ACTIVITY_COMMENT
  is '�������۱�';
comment on column SISANSHDATA.T_SIM_ACTIVITY_COMMENT.ID
  is '����id';
comment on column SISANSHDATA.T_SIM_ACTIVITY_COMMENT.ACT_ID
  is '����id ����t_sim_activity������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_COMMENT.ACT_COMMENT
  is '������������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_COMMENT.COMMENT_USER
  is '������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_COMMENT.MODIFY_USER
  is '�޸���';
comment on column SISANSHDATA.T_SIM_ACTIVITY_COMMENT.COMMENT_TITLE
  is '��������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_COMMENT.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_ACTIVITY_COMMENT.MODIFY_DATE
  is '�޸�ʱ��';
alter table SISANSHDATA.T_SIM_ACTIVITY_COMMENT
  add primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_COMMENT to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_ACTIVITY_COMMENT to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_COMMENT to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACTIVITY_STAGE
prompt ===================================
prompt
create table SISANSHDATA.T_SIM_ACTIVITY_STAGE
(
  SERIAL_NUM    NUMBER(10) not null,
  STATE_NAME    VARCHAR2(30) not null,
  ACT_ID        VARCHAR2(50) not null,
  BEGIN_DATE    CHAR(8) not null,
  END_DATE      CHAR(8) not null,
  PROMOTION_NUM NUMBER(5) not null,
  CREATE_DATE   CHAR(8),
  MODIFY_DATE   CHAR(8),
  IS_CURRENT    CHAR(1),
  REMARK        VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_ACTIVITY_STAGE
  is '�����׶����̱�';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.STATE_NAME
  is '��������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.ACT_ID
  is '��������ID�������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.BEGIN_DATE
  is '���̿�ʼ����';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.END_DATE
  is '���̽�������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.PROMOTION_NUM
  is '�����̽�������һ��������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.MODIFY_DATE
  is '�޸�����';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.IS_CURRENT
  is '�Ƿ�Ϊ��ǰ���̣�0��1��';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STAGE.REMARK
  is '��ע';
alter table SISANSHDATA.T_SIM_ACTIVITY_STAGE
  add constraint PK_T_SIM_ACTIVITY_STAGE primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
alter table SISANSHDATA.T_SIM_ACTIVITY_STAGE
  add unique (ACT_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_STAGE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_ACTIVITY_STAGE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_STAGE to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACTIVITY_STOCKPOOL
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_ACTIVITY_STOCKPOOL
(
  SERI_NUM    NUMBER,
  ACT_ID      VARCHAR2(50),
  STOCK_CODE  VARCHAR2(6),
  CREATE_DATE VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_ACTIVITY_STOCKPOOL
  is '���ô������׹�Ʊ��';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STOCKPOOL.SERI_NUM
  is '���к�';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STOCKPOOL.ACT_ID
  is '�������';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STOCKPOOL.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STOCKPOOL.CREATE_DATE
  is '����ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_STOCKPOOL to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_ACTIVITY_STOCKPOOL to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_STOCKPOOL to SISANSHOPR;

prompt
prompt Creating table T_SIM_ACTIVITY_STOCKTYPE
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_ACTIVITY_STOCKTYPE
(
  SERIAL_NUM NUMBER(10) not null,
  ACT_ID     VARCHAR2(50) not null,
  SEC_TYPE   VARCHAR2(30) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_ACTIVITY_STOCKTYPE
  is '�����ɽ��׹�Ʊ���ͱ�';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STOCKTYPE.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STOCKTYPE.ACT_ID
  is '����ID';
comment on column SISANSHDATA.T_SIM_ACTIVITY_STOCKTYPE.SEC_TYPE
  is '֤ȯ����';
alter table SISANSHDATA.T_SIM_ACTIVITY_STOCKTYPE
  add constraint PK_T_SIM_ACTIVITY_STOCK primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_STOCKTYPE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_ACTIVITY_STOCKTYPE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_ACTIVITY_STOCKTYPE to SISANSHOPR;

prompt
prompt Creating table T_SIM_BONUS
prompt ==========================
prompt
create table SISANSHDATA.T_SIM_BONUS
(
  ID          NUMBER(10) not null,
  MARKET_ID   VARCHAR2(3),
  STOCK_CODE  VARCHAR2(10),
  BONUS_DATE  VARCHAR2(30),
  CREATE_DATE VARCHAR2(30),
  RATE        NUMBER(10,4),
  TYPE        VARCHAR2(3)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_BONUS
  is '�ֺ��¼��';
comment on column SISANSHDATA.T_SIM_BONUS.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_BONUS.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_BONUS.BONUS_DATE
  is '�ֺ�����';
comment on column SISANSHDATA.T_SIM_BONUS.CREATE_DATE
  is '��������';
comment on column SISANSHDATA.T_SIM_BONUS.RATE
  is '�ֺ����';
comment on column SISANSHDATA.T_SIM_BONUS.TYPE
  is '�ֺ����� 1 ��� 0 ���� ';
alter table SISANSHDATA.T_SIM_BONUS
  add constraint PK_T_T_SIM_BONUS primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_BONUS to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_BONUS to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_BONUS to SISANSHOPR;

prompt
prompt Creating table T_SIM_BONUS_20130508
prompt ===================================
prompt
create table SISANSHDATA.T_SIM_BONUS_20130508
(
  ID          NUMBER(10) not null,
  MARKET_ID   VARCHAR2(3),
  STOCK_CODE  VARCHAR2(10),
  BONUS_DATE  VARCHAR2(30),
  CREATE_DATE VARCHAR2(30),
  RATE        NUMBER(10,4),
  TYPE        VARCHAR2(3)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_BONUS_20130508 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_CANCEL_ORDER
prompt =================================
prompt
create table SISANSHDATA.T_SIM_CANCEL_ORDER
(
  CANCEL_NO     NUMBER(10) not null,
  ORDER_NO      NUMBER(10) not null,
  ACCOUNT_ID    NUMBER(10) not null,
  CREATE_DATE   VARCHAR2(30) not null,
  CANCEL_STATUS CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_CANCEL_ORDER
  is '������';
comment on column SISANSHDATA.T_SIM_CANCEL_ORDER.CANCEL_NO
  is '�������';
comment on column SISANSHDATA.T_SIM_CANCEL_ORDER.ORDER_NO
  is 'ί�б��';
comment on column SISANSHDATA.T_SIM_CANCEL_ORDER.ACCOUNT_ID
  is '�˻�id';
comment on column SISANSHDATA.T_SIM_CANCEL_ORDER.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_CANCEL_ORDER.CANCEL_STATUS
  is '����״̬ 0 �ɹ� 1ʧ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_CANCEL_ORDER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_CANCEL_ORDER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_CANCEL_ORDER to SISANSHOPR;

prompt
prompt Creating table T_SIM_CANCEL_ORDER_BK20170417
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_CANCEL_ORDER_BK20170417
(
  CANCEL_NO     NUMBER(10) not null,
  ORDER_NO      NUMBER(10) not null,
  ACCOUNT_ID    NUMBER(10) not null,
  CREATE_DATE   VARCHAR2(30) not null,
  CANCEL_STATUS CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_CANCEL_ORDER_BK20170417 to SISANSHOPR;

prompt
prompt Creating table T_SIM_CASH_PRODUCT
prompt =================================
prompt
create table SISANSHDATA.T_SIM_CASH_PRODUCT
(
  FUND_NAME       VARCHAR2(50),
  FUND_CODE       VARCHAR2(20),
  FUND_TYPE       VARCHAR2(2),
  FUND_INCOME     VARCHAR2(20),
  YIELD           VARCHAR2(20),
  FUND_DAY_INCOME VARCHAR2(20),
  TRADING_DATE    VARCHAR2(20),
  FUND_STATUS     VARCHAR2(2),
  IS_SHOW         VARCHAR2(2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_CASH_PRODUCT
  is '�ֽ𱦲�Ʒ�����';
comment on column SISANSHDATA.T_SIM_CASH_PRODUCT.FUND_CODE
  is '��Ʒ����';
comment on column SISANSHDATA.T_SIM_CASH_PRODUCT.FUND_TYPE
  is '��Ʒ���� 0����Ʊ�� 1��ծȯ�� 2�������� 3��ƽ���� 4���޶��� 5�����޶��� 9������';
comment on column SISANSHDATA.T_SIM_CASH_PRODUCT.FUND_INCOME
  is 'Ԥ���������';
comment on column SISANSHDATA.T_SIM_CASH_PRODUCT.YIELD
  is 'Ԥ��7���껪������';
comment on column SISANSHDATA.T_SIM_CASH_PRODUCT.FUND_DAY_INCOME
  is 'Ԥ���껯������';
comment on column SISANSHDATA.T_SIM_CASH_PRODUCT.TRADING_DATE
  is '��������';
comment on column SISANSHDATA.T_SIM_CASH_PRODUCT.FUND_STATUS
  is '����״̬ 0���������� 1������ 2�����гɹ� 3������ʧ�� 4���ƻ�ֹͣ���� 5��ֹͣ�깺 6��ֹͣ��� 7��Ȩ��Ǽ� 8���������� 9���ƻ���� A���ƻ���ֹ F���ƻ���յ��� J���ƻ������еĿ����ڵĽ��� K���ƻ������еĿ����� L���ƻ����ڵ���';
comment on column SISANSHDATA.T_SIM_CASH_PRODUCT.IS_SHOW
  is '�Ƿ���ʾ';
grant select, insert, update, delete on SISANSHDATA.T_SIM_CASH_PRODUCT to SISANSHOPR;

prompt
prompt Creating table T_SIM_COMPLETE_PROFIT
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_COMPLETE_PROFIT
(
  PROFIT_ID          NUMBER not null,
  STOCK_CODE         VARCHAR2(10),
  MARKET_ID          VARCHAR2(3),
  STOCK_NAME         VARCHAR2(30),
  TRADE_TERM         NUMBER,
  STK_QTY            NUMBER(10),
  CLOST_PRICE        NUMBER(10,2),
  SELL_AVERAGE_PRICE NUMBER(10,2),
  EARN_RATE          NUMBER(10,4),
  EARN               NUMBER(10,2),
  TRADE_FARE         NUMBER(10,2),
  START_DATE         VARCHAR2(30),
  END_DATE           VARCHAR2(30),
  HOLD_SRLNUM        NUMBER(10),
  ACCOUNT_ID         VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_COMPLETE_PROFIT
  is '���������';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.PROFIT_ID
  is '������';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.MARKET_ID
  is '��Ʊ�г�����';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.STOCK_NAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.TRADE_TERM
  is '��������';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.STK_QTY
  is '��Ʊ������';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.CLOST_PRICE
  is '�ɱ���';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.SELL_AVERAGE_PRICE
  is '��������';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.EARN_RATE
  is 'ӯ����';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.EARN
  is 'ӯ��';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.TRADE_FARE
  is '�ܽ��׷���';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.START_DATE
  is '��������';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.END_DATE
  is '�������';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.HOLD_SRLNUM
  is '�ֱֲ��';
comment on column SISANSHDATA.T_SIM_COMPLETE_PROFIT.ACCOUNT_ID
  is '�˺�';
grant select, insert, update, delete on SISANSHDATA.T_SIM_COMPLETE_PROFIT to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_COMPLETE_PROFIT to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_COMPLETE_PROFIT to SISANSHOPR;

prompt
prompt Creating table T_SIM_CONVERT
prompt ============================
prompt
create table SISANSHDATA.T_SIM_CONVERT
(
  PK_ID        NUMBER(10) not null,
  MARKET_ID    VARCHAR2(3),
  FUND_CODE    VARCHAR2(10),
  CONVERT_DATE VARCHAR2(40),
  CREATE_TIME  VARCHAR2(40),
  NETWORTH     NUMBER(20,4),
  CONVERTTYPE  VARCHAR2(10),
  EXECUTED     VARCHAR2(10),
  FUNDTYPE     VARCHAR2(1),
  CONVERTRATE  NUMBER(20,10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_CONVERT
  is '�ּ����������¼��';
comment on column SISANSHDATA.T_SIM_CONVERT.PK_ID
  is '��ţ�������';
comment on column SISANSHDATA.T_SIM_CONVERT.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_CONVERT.FUND_CODE
  is '�������';
comment on column SISANSHDATA.T_SIM_CONVERT.CONVERT_DATE
  is '��������';
comment on column SISANSHDATA.T_SIM_CONVERT.CREATE_TIME
  is '��¼����ʱ��';
comment on column SISANSHDATA.T_SIM_CONVERT.NETWORTH
  is '����ֵ';
comment on column SISANSHDATA.T_SIM_CONVERT.CONVERTTYPE
  is '�������� up:���� down������ ';
comment on column SISANSHDATA.T_SIM_CONVERT.EXECUTED
  is '�Ƿ��Ѵ��� yes:��ִ��  no(Ĭ��)��δִ�� ';
comment on column SISANSHDATA.T_SIM_CONVERT.FUNDTYPE
  is '�������� A��A����B��B��';
comment on column SISANSHDATA.T_SIM_CONVERT.CONVERTRATE
  is '������';
alter table SISANSHDATA.T_SIM_CONVERT
  add primary key (PK_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_CONVERT to SISANSHOPR;

prompt
prompt Creating table T_SIM_CONVERT_RECORD
prompt ===================================
prompt
create table SISANSHDATA.T_SIM_CONVERT_RECORD
(
  PK_ID       NUMBER(10) not null,
  ACCOUNT_ID  NUMBER(10),
  HOLDNUM     NUMBER(10),
  CONVERT_ID  NUMBER(10),
  HOLDBF      NUMBER(10),
  HOLDAF      NUMBER(10),
  MUMFUND     NUMBER(16,2),
  RECORD_TIME VARCHAR2(40)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_CONVERT_RECORD
  is '�ּ���������ִ�н����';
comment on column SISANSHDATA.T_SIM_CONVERT_RECORD.PK_ID
  is '��ţ�������';
comment on column SISANSHDATA.T_SIM_CONVERT_RECORD.ACCOUNT_ID
  is '�˻�id';
comment on column SISANSHDATA.T_SIM_CONVERT_RECORD.HOLDNUM
  is '�ֱֲ��';
comment on column SISANSHDATA.T_SIM_CONVERT_RECORD.CONVERT_ID
  is '��Ӧ�������¼id';
comment on column SISANSHDATA.T_SIM_CONVERT_RECORD.HOLDBF
  is '����ǰ�ֲ�����';
comment on column SISANSHDATA.T_SIM_CONVERT_RECORD.HOLDAF
  is '�����ֲ�����';
comment on column SISANSHDATA.T_SIM_CONVERT_RECORD.MUMFUND
  is '���ӵĿ����ʽ�ĸ����ת����';
comment on column SISANSHDATA.T_SIM_CONVERT_RECORD.RECORD_TIME
  is 'ִ�н������ʱ��';
alter table SISANSHDATA.T_SIM_CONVERT_RECORD
  add primary key (PK_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_CONVERT_RECORD to SISANSHOPR;

prompt
prompt Creating table T_SIM_EXEC_AGGE
prompt ==============================
prompt
create table SISANSHDATA.T_SIM_EXEC_AGGE
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(50),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_EXEC_AGGE
  is '�˻����ճɽ����ܱ�';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.ORDER_SRLNUM
  is '��Ӧί�б��';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.ACCOUNT_ID
  is '�˻�ID';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.EXEC_DATE
  is '�ɽ�����';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.EXEC_TIME
  is '�ɽ�ʱ��';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.STOCK_NAME
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.TRADE_TYPE
  is '��������buy:����;sell:����';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.EXEC_QTY
  is '�ɽ�����(��)';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.EXEC_PRICE
  is '�ɽ��۸�';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.STAP_TAX
  is '�ɽ���ӡ��˰';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.COMMISSOIN
  is '�ɽ���������';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.FARE
  is '��������';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.TOTAL_BALANCE
  is '�ܽ��';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.TRANSFER_FREE
  is '������';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.TOTAL_FARE
  is '�ܷ���';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.HOLD_SRLNUM
  is '��Ӧ�ĳֱֲ��';
comment on column SISANSHDATA.T_SIM_EXEC_AGGE.BARGAIN_BALANCE
  is '�ɽ����';
alter table SISANSHDATA.T_SIM_EXEC_AGGE
  add constraint PK_T_SIM_EXEC_AGGE primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.IDX_T_SIM_EXEC_AGE_ACCOUNT_ID on SISANSHDATA.T_SIM_EXEC_AGGE (ACCOUNT_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_EXEC_AGGE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_EXEC_AGGE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_EXEC_AGGE to SISANSHOPR;

prompt
prompt Creating table T_SIM_EXEC_COLLECT
prompt =================================
prompt
create table SISANSHDATA.T_SIM_EXEC_COLLECT
(
  SERI_NUM        NUMBER not null,
  EXEC_DATE       CHAR(8),
  MARKET_ID       VARCHAR2(3) not null,
  STOCK_CODE      VARCHAR2(10) not null,
  STOCK_NAME      VARCHAR2(50) not null,
  TRADE_TYPE      VARCHAR2(10),
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TRANSFER_FREE   NUMBER(10,2),
  BARGAIN_BALANCE NUMBER(16,2),
  ORDER_SRLNUM    NUMBER(10),
  TOTAL_BALANCE   NUMBER(16,2),
  HOLD_SRLNUM     NUMBER(10),
  ACCOUNT_ID      VARCHAR2(50) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_EXEC_COLLECT
  is '�ɽ�����';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.SERI_NUM
  is '�ɽ��������к�';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.EXEC_DATE
  is '�ɽ�����';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.STOCK_NAME
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.TRADE_TYPE
  is '��������';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.EXEC_QTY
  is '�ɽ�������';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.EXEC_PRICE
  is '�ɽ�����';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.STAP_TAX
  is '�ɽ���ӡ��˰';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.COMMISSOIN
  is '�ɽ���������';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.FARE
  is '��������';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.TRANSFER_FREE
  is '�ܹ�����';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.BARGAIN_BALANCE
  is '�ɽ����(����������)';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.ORDER_SRLNUM
  is 'ί�б��';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.TOTAL_BALANCE
  is '�ܳɽ����������ѣ�';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.HOLD_SRLNUM
  is '�ֱֲ��';
comment on column SISANSHDATA.T_SIM_EXEC_COLLECT.ACCOUNT_ID
  is '�˻�id';
create unique index SISANSHDATA.IDX_COLLECT_ORDER on SISANSHDATA.T_SIM_EXEC_COLLECT (ORDER_SRLNUM)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_EXEC_COLLECT to SISANSHOPR;

prompt
prompt Creating table T_SIM_EXEC_ERROR
prompt ===============================
prompt
create table SISANSHDATA.T_SIM_EXEC_ERROR
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MARKET_ID            VARCHAR2(3) not null,
  STOCK_CODE           VARCHAR2(10) not null,
  TOTAL_BALANCE        NUMBER(16,4) not null,
  DEVIDE_TOTAL_BALANCE NUMBER(16,4) not null,
  EXEC_PRICE           NUMBER(10,4) not null,
  ORDER_QTY            NUMBER(16,4) not null,
  EXEC_QTY             NUMBER(16,4) not null,
  DEVIDE_EXEC_QTY      NUMBER(16,4) not null,
  TRADE_TYPE           VARCHAR2(10) not null,
  EXEC_DATE            CHAR(8) not null,
  EXEC_TIME            VARCHAR2(20) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_EXEC_ERROR
  is '�쳣�ɽ����ݱ�';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.ACCOUNT_ID
  is '�����˻�ID';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.TOTAL_BALANCE
  is '�����ѳɽ��ܽ��';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.DEVIDE_TOTAL_BALANCE
  is '��ʱ���ܵ��ѳɽ��ܽ��';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.EXEC_PRICE
  is '�ѻ��ܳɽ��۸�';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.ORDER_QTY
  is 'ί������(��)';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.EXEC_QTY
  is '�ѳɽ�����(��)';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.DEVIDE_EXEC_QTY
  is '��ʱ���ܵ��ѳɽ�����(��)';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.TRADE_TYPE
  is '��������buy:����;sell:����';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.EXEC_DATE
  is '�ɽ�����';
comment on column SISANSHDATA.T_SIM_EXEC_ERROR.EXEC_TIME
  is '�ɽ�ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_EXEC_ERROR to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_EXEC_ERROR to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_EXEC_ERROR to SISANSHOPR;

prompt
prompt Creating table T_SIM_EXPONENT
prompt =============================
prompt
create table SISANSHDATA.T_SIM_EXPONENT
(
  EXPONENT_ID      NUMBER(10) not null,
  EXPONENT_NAME    VARCHAR2(20) not null,
  EXPONENT_CODE    VARCHAR2(20) not null,
  EXPONENT_MARKET  VARCHAR2(20),
  EXPONENT         VARCHAR2(20) not null,
  CREATE_TIME      VARCHAR2(30) not null,
  EXPONENT_DYNAMIC VARCHAR2(20),
  YESTERDAY        VARCHAR2(20)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_EXPONENT
  is 'ģ�⳴��ָ����¼';
comment on column SISANSHDATA.T_SIM_EXPONENT.EXPONENT_ID
  is '����id';
comment on column SISANSHDATA.T_SIM_EXPONENT.EXPONENT_NAME
  is 'ָ������';
comment on column SISANSHDATA.T_SIM_EXPONENT.EXPONENT_CODE
  is 'ָ�����';
comment on column SISANSHDATA.T_SIM_EXPONENT.EXPONENT_MARKET
  is 'ָ���г�����';
comment on column SISANSHDATA.T_SIM_EXPONENT.EXPONENT
  is 'ָ��';
comment on column SISANSHDATA.T_SIM_EXPONENT.CREATE_TIME
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_EXPONENT.EXPONENT_DYNAMIC
  is 'ָ���Ƿ���̬';
comment on column SISANSHDATA.T_SIM_EXPONENT.YESTERDAY
  is '����ָ��';
alter table SISANSHDATA.T_SIM_EXPONENT
  add primary key (EXPONENT_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_EXPONENT to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_EXPONENT to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_EXPONENT to SISANSHOPR;

prompt
prompt Creating table T_SIM_FARE
prompt =========================
prompt
create table SISANSHDATA.T_SIM_FARE
(
  SERIAL_NUM NUMBER(10) not null,
  SEC_TYPE   VARCHAR2(10) not null,
  FARE_TYPE  VARCHAR2(20) not null,
  FARE_RATE  NUMBER(10,4) not null,
  REMARK     VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_FARE
  is '��Ʊ���׷��ʱ�';
comment on column SISANSHDATA.T_SIM_FARE.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_FARE.SEC_TYPE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_FARE.FARE_TYPE
  is '��������(ӡ��˰:stam_tax;������:commission)';
comment on column SISANSHDATA.T_SIM_FARE.FARE_RATE
  is '����';
comment on column SISANSHDATA.T_SIM_FARE.REMARK
  is '��ע';
alter table SISANSHDATA.T_SIM_FARE
  add constraint PK_T_SIM_FARE primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_FARE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_FARE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_FARE to SISANSHOPR;

prompt
prompt Creating table T_SIM_FARE_2014_06_11
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_FARE_2014_06_11
(
  SERIAL_NUM NUMBER(10) not null,
  SEC_TYPE   VARCHAR2(10) not null,
  FARE_TYPE  VARCHAR2(20) not null,
  FARE_RATE  NUMBER(10,4) not null,
  REMARK     VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_FARE_2014_06_11 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_GROUP
prompt ==========================
prompt
create table SISANSHDATA.T_SIM_GROUP
(
  GROUP_ID     NUMBER(10) not null,
  GROUP_NAME   VARCHAR2(20) not null,
  GROUP_MASTER VARCHAR2(30) not null,
  JOIN_CODE    VARCHAR2(30) not null,
  CREATE_DATE  VARCHAR2(50),
  MODIFY_DATE  VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_GROUP
  is 'Ⱥ���';
comment on column SISANSHDATA.T_SIM_GROUP.GROUP_ID
  is 'ȺID';
comment on column SISANSHDATA.T_SIM_GROUP.GROUP_NAME
  is 'Ⱥ����';
comment on column SISANSHDATA.T_SIM_GROUP.GROUP_MASTER
  is 'Ⱥ�����û�ID';
comment on column SISANSHDATA.T_SIM_GROUP.JOIN_CODE
  is '��Ⱥ������';
comment on column SISANSHDATA.T_SIM_GROUP.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_GROUP.MODIFY_DATE
  is '�޸�ʱ��';
alter table SISANSHDATA.T_SIM_GROUP
  add constraint PK_T_SIM_GROUP primary key (GROUP_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_GROUP to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_GROUP to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_GROUP to SISANSHOPR;

prompt
prompt Creating table T_SIM_GROUP_USER
prompt ===============================
prompt
create table SISANSHDATA.T_SIM_GROUP_USER
(
  SERIAL_NUM NUMBER(10) not null,
  GROUP_ID   NUMBER(10) not null,
  USER_ID    VARCHAR2(20) not null,
  JOIN_DATE  VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_GROUP_USER
  is 'Ⱥ���û���';
comment on column SISANSHDATA.T_SIM_GROUP_USER.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_GROUP_USER.GROUP_ID
  is 'ȺID';
comment on column SISANSHDATA.T_SIM_GROUP_USER.USER_ID
  is '�û�ID';
comment on column SISANSHDATA.T_SIM_GROUP_USER.JOIN_DATE
  is '����Ⱥʱ��';
alter table SISANSHDATA.T_SIM_GROUP_USER
  add constraint PK_T_SIM_GROUP_USER primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_GROUP_USER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_GROUP_USER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_GROUP_USER to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT
prompt =================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT
(
  ACCOUNT_ID            VARCHAR2(50) not null,
  MONEY_ID              CHAR(3) not null,
  CREATE_DATE           CHAR(8) not null,
  TOTAL_ASSETS          NUMBER(16,4) not null,
  CURRENT_BALANCE       NUMBER(16,4) not null,
  TOTAL_MARKET          NUMBER(16,4),
  TOTAL_EARNINGS        NUMBER(16,4),
  TOTAL_YIELD           NUMBER(10,4),
  TOTAL_YIELD_RANKINGS  NUMBER(10),
  WEEK_EARNINGS         NUMBER(16,4),
  WEEK_YIELD            NUMBER(10,4),
  WEEK_YIELD_RANKINGS   NUMBER(10),
  MONTH_EARNINGS        NUMBER(16,4),
  MONTH_YIELD           NUMBER(10,3),
  MONTH_YIELD_RANKINGS  NUMBER(10),
  REMARK                VARCHAR2(100),
  DAY_EARNINGS          NUMBER(16,4),
  DAY_YIELD             NUMBER(10,4),
  DAY_YIELD_RANKINGS    NUMBER(10),
  RANK_TYPE             CHAR(1),
  RECENT_WEEK_YIELD     NUMBER(10,4),
  RECENT_MONTH_YIELD    NUMBER(10,4),
  RECENT_WEEK_EARNINGS  NUMBER(16,2),
  RECENT_MONTH_EARNINGS NUMBER(16,2),
  RECENT_YEAR_YIELD     NUMBER(10,4),
  RECENT_YEAR_EARNINGS  NUMBER(16,2),
  SEASON_EARNINGS       NUMBER(16,4),
  SEASON_YIELD          NUMBER(10,4),
  SEASON_YIELD_RANKINGS NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HIST_ACCOUNT
  is '�˻���ʷ�ʲ���';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.ACCOUNT_ID
  is '�����˻�ID';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.MONEY_ID
  is '����,CNY:�����;USD:��Ԫ;HKD:�۱�';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.CREATE_DATE
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.TOTAL_ASSETS
  is '���ʲ�';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.CURRENT_BALANCE
  is '��ǰ�ʲ�(�ֽ�)';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.TOTAL_MARKET
  is '�ֲֹ�Ʊ����ֵ';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.TOTAL_EARNINGS
  is '������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.TOTAL_YIELD
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.TOTAL_YIELD_RANKINGS
  is '������������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.WEEK_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.WEEK_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.WEEK_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.MONTH_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.MONTH_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.MONTH_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.DAY_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.DAY_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.DAY_YIELD_RANKINGS
  is '��������������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.RANK_TYPE
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.RECENT_WEEK_YIELD
  is '������������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.RECENT_MONTH_YIELD
  is '��30��������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.RECENT_YEAR_YIELD
  is '��һ��������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.SEASON_EARNINGS
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.SEASON_YIELD
  is '����������';
comment on column SISANSHDATA.T_SIM_HIST_ACCOUNT.SEASON_YIELD_RANKINGS
  is '��������������';
create index SISANSHDATA.IDX_SIMHISTACCOUNTID on SISANSHDATA.T_SIM_HIST_ACCOUNT (ACCOUNT_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.IDX_SIMHISTCREATEDATE on SISANSHDATA.T_SIM_HIST_ACCOUNT (ACCOUNT_ID, CREATE_DATE)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_ACCOUNT to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_ACCOUNT to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT170113
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT170113
(
  ACCOUNT_ID            VARCHAR2(50) not null,
  MONEY_ID              CHAR(3) not null,
  CREATE_DATE           CHAR(8) not null,
  TOTAL_ASSETS          NUMBER(16,4) not null,
  CURRENT_BALANCE       NUMBER(16,4) not null,
  TOTAL_MARKET          NUMBER(16,4),
  TOTAL_EARNINGS        NUMBER(16,4),
  TOTAL_YIELD           NUMBER(10,4),
  TOTAL_YIELD_RANKINGS  NUMBER(10),
  WEEK_EARNINGS         NUMBER(16,4),
  WEEK_YIELD            NUMBER(10,4),
  WEEK_YIELD_RANKINGS   NUMBER(10),
  MONTH_EARNINGS        NUMBER(16,4),
  MONTH_YIELD           NUMBER(10,3),
  MONTH_YIELD_RANKINGS  NUMBER(10),
  REMARK                VARCHAR2(100),
  DAY_EARNINGS          NUMBER(16,4),
  DAY_YIELD             NUMBER(10,4),
  DAY_YIELD_RANKINGS    NUMBER(10),
  RANK_TYPE             CHAR(1),
  RECENT_WEEK_YIELD     NUMBER(10,4),
  RECENT_MONTH_YIELD    NUMBER(10,4),
  RECENT_WEEK_EARNINGS  NUMBER(16,2),
  RECENT_MONTH_EARNINGS NUMBER(16,2),
  RECENT_YEAR_YIELD     NUMBER(10,4),
  RECENT_YEAR_EARNINGS  NUMBER(16,2),
  SEASON_EARNINGS       NUMBER(16,4),
  SEASON_YIELD          NUMBER(10,4),
  SEASON_YIELD_RANKINGS NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_ACCOUNT170113 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT20140710
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT20140710
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT20140710 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT20140826
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT20140826
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT20140826 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT20161017
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT20161017
(
  ACCOUNT_ID            VARCHAR2(50) not null,
  MONEY_ID              CHAR(3) not null,
  CREATE_DATE           CHAR(8) not null,
  TOTAL_ASSETS          NUMBER(16,4) not null,
  CURRENT_BALANCE       NUMBER(16,4) not null,
  TOTAL_MARKET          NUMBER(16,4),
  TOTAL_EARNINGS        NUMBER(16,4),
  TOTAL_YIELD           NUMBER(10,4),
  TOTAL_YIELD_RANKINGS  NUMBER(10),
  WEEK_EARNINGS         NUMBER(16,4),
  WEEK_YIELD            NUMBER(10,4),
  WEEK_YIELD_RANKINGS   NUMBER(10),
  MONTH_EARNINGS        NUMBER(16,4),
  MONTH_YIELD           NUMBER(10,3),
  MONTH_YIELD_RANKINGS  NUMBER(10),
  REMARK                VARCHAR2(100),
  DAY_EARNINGS          NUMBER(16,4),
  DAY_YIELD             NUMBER(10,4),
  DAY_YIELD_RANKINGS    NUMBER(10),
  RANK_TYPE             CHAR(1),
  RECENT_WEEK_YIELD     NUMBER(10,4),
  RECENT_MONTH_YIELD    NUMBER(10,4),
  RECENT_WEEK_EARNINGS  NUMBER(16,2),
  RECENT_MONTH_EARNINGS NUMBER(16,2),
  RECENT_YEAR_YIELD     NUMBER(10,4),
  RECENT_YEAR_EARNINGS  NUMBER(16,2),
  SEASON_EARNINGS       NUMBER(16,4),
  SEASON_YIELD          NUMBER(10,4),
  SEASON_YIELD_RANKINGS NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_ACCOUNT20161017 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_10300917
prompt ==========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_10300917
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_10300917 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_2013
prompt ======================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_2013
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_2013 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_20130118
prompt ==========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_20130118
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_20130118 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_20130201
prompt ==========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_20130201
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_20130201 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_20130219
prompt ==========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_20130219
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_20130219 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_20130220
prompt ==========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_20130220
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_20130220 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_20130221
prompt ==========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_20130221
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_20130221 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_20130222
prompt ==========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_20130222
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_20130222 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_20130227
prompt ==========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_20130227
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_20130227 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_2014_06_06
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_2014_06_06
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_2014_06_06 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_2015042011
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_2015042011
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_2015042011 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ACCOUNT_SJXF_201403
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_HIST_ACCOUNT_SJXF_201403
(
  ACCOUNT_ID           VARCHAR2(50) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ACCOUNT_SJXF_201403 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_CHAMPION
prompt ==================================
prompt
create table SISANSHDATA.T_SIM_HIST_CHAMPION
(
  ACCOUNT_ID    NUMBER(10) not null,
  TOTAL_EARN    NUMBER(16,2),
  EARN_RATE     NUMBER(10,4),
  CHAMPION_TYPE VARCHAR2(2),
  CREATE_DATE   VARCHAR2(30),
  TRADE_TYPE    CHAR(1),
  RANK_TYPE     CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HIST_CHAMPION
  is '��ʷ�ھ���';
comment on column SISANSHDATA.T_SIM_HIST_CHAMPION.ACCOUNT_ID
  is '�˻����';
comment on column SISANSHDATA.T_SIM_HIST_CHAMPION.TOTAL_EARN
  is '����';
comment on column SISANSHDATA.T_SIM_HIST_CHAMPION.EARN_RATE
  is '������';
comment on column SISANSHDATA.T_SIM_HIST_CHAMPION.CHAMPION_TYPE
  is '�ھ�����0��1��2�����ھ�';
comment on column SISANSHDATA.T_SIM_HIST_CHAMPION.CREATE_DATE
  is '�ھ�����ʱ��';
comment on column SISANSHDATA.T_SIM_HIST_CHAMPION.TRADE_TYPE
  is '��������0��ͨ����1������ȯ';
comment on column SISANSHDATA.T_SIM_HIST_CHAMPION.RANK_TYPE
  is '��������';
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_CHAMPION to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_HIST_CHAMPION to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_CHAMPION to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE
prompt ===================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HIST_EXEC_AGGE
  is '�˻���ʷ�ɽ����ܱ�';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.ORDER_SRLNUM
  is '��Ӧί�б��';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.ACCOUNT_ID
  is '�˻�ID';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.EXEC_DATE
  is '�ɽ�����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.EXEC_TIME
  is '�ɽ�ʱ��';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.STOCK_NAME
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.TRADE_TYPE
  is '��������buy:����;sell:����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.EXEC_QTY
  is '�ɽ�����(��)';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.EXEC_PRICE
  is '�ɽ��۸�';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.STAP_TAX
  is '�ɽ���ӡ��˰';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.COMMISSOIN
  is '�ɽ���������';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.FARE
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.TOTAL_BALANCE
  is '�ܽ��';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.TRANSFER_FREE
  is '������';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.TOTAL_FARE
  is '�ܷ���';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.HOLD_SRLNUM
  is '��Ӧ�ĳֱֲ��';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_AGGE.BARGAIN_BALANCE
  is '�ɽ����';
alter table SISANSHDATA.T_SIM_HIST_EXEC_AGGE
  add constraint PK_T_SIM_HIST_EXEC_AGGE primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.IDX_HIST_EXTC_AGGE_ACCOUNT_ID on SISANSHDATA.T_SIM_HIST_EXEC_AGGE (ACCOUNT_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_EXEC_AGGE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_EXEC_AGGE to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE160730
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE160730
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_EXEC_AGGE160730 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE170228
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE170228
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_EXEC_AGGE170228 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE20161017
prompt ===========================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE20161017
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_EXEC_AGGE20161017 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE_10300917
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE_10300917
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE_10300917 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE_2013
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE_2013
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE_2013 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE_20130118
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130118
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130118 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE_20130201
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130201
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130201 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE_20130219
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130219
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130219 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE_20130220
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130220
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130220 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE_20130221
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130221
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130221 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE_20130222
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130222
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130222 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_EXEC_AGGE_20130227
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130227
(
  SERIAL_NUM      NUMBER(10) not null,
  ORDER_SRLNUM    NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  EXEC_DATE       CHAR(8) not null,
  EXEC_TIME       VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TOTAL_BALANCE   NUMBER(16,2),
  REMARK          VARCHAR2(100),
  TRANSFER_FREE   NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  HOLD_SRLNUM     NUMBER(10),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_EXEC_AGGE_20130227 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_EXEC_COLLECT
prompt ======================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_COLLECT
(
  SERI_NUM        NUMBER not null,
  EXEC_DATE       CHAR(8),
  MARKET_ID       VARCHAR2(3) not null,
  STOCK_CODE      VARCHAR2(10) not null,
  STOCK_NAME      VARCHAR2(50) not null,
  TRADE_TYPE      VARCHAR2(10),
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TRANSFER_FREE   NUMBER(10,2),
  BARGAIN_BALANCE NUMBER(16,2),
  ORDER_SRLNUM    NUMBER(10),
  TOTAL_BALANCE   NUMBER(16,2),
  HOLD_SRLNUM     NUMBER(10),
  ACCOUNT_ID      VARCHAR2(50) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HIST_EXEC_COLLECT
  is '�ɽ�������ʷ';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.SERI_NUM
  is '�ɽ��������к�';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.EXEC_DATE
  is '�ɽ�����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.STOCK_NAME
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.TRADE_TYPE
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.EXEC_QTY
  is '�ɽ�������';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.EXEC_PRICE
  is '�ɽ�����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.STAP_TAX
  is '�ɽ���ӡ��˰';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.COMMISSOIN
  is '�ɽ���������';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.FARE
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.TRANSFER_FREE
  is '�ܹ�����';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.BARGAIN_BALANCE
  is '�ɽ����(����������)';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.ORDER_SRLNUM
  is 'ί�б��';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.TOTAL_BALANCE
  is '�ܳɽ����������ѣ�';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.HOLD_SRLNUM
  is '�ֱֲ��';
comment on column SISANSHDATA.T_SIM_HIST_EXEC_COLLECT.ACCOUNT_ID
  is '�˻�id';
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_EXEC_COLLECT to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_EXEC_COLLECT160730
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_COLLECT160730
(
  SERI_NUM        NUMBER not null,
  EXEC_DATE       CHAR(8),
  MARKET_ID       VARCHAR2(3) not null,
  STOCK_CODE      VARCHAR2(10) not null,
  STOCK_NAME      VARCHAR2(50) not null,
  TRADE_TYPE      VARCHAR2(10),
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TRANSFER_FREE   NUMBER(10,2),
  BARGAIN_BALANCE NUMBER(16,2),
  ORDER_SRLNUM    NUMBER(10),
  TOTAL_BALANCE   NUMBER(16,2),
  HOLD_SRLNUM     NUMBER(10),
  ACCOUNT_ID      VARCHAR2(50) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_EXEC_COLLECT160730 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_EXEC_COLLECT170228
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_EXEC_COLLECT170228
(
  SERI_NUM        NUMBER not null,
  EXEC_DATE       CHAR(8),
  MARKET_ID       VARCHAR2(3) not null,
  STOCK_CODE      VARCHAR2(10) not null,
  STOCK_NAME      VARCHAR2(50) not null,
  TRADE_TYPE      VARCHAR2(10),
  EXEC_QTY        NUMBER(16) not null,
  EXEC_PRICE      NUMBER(10,3) not null,
  STAP_TAX        NUMBER(10,2),
  COMMISSOIN      NUMBER(10,2),
  FARE            NUMBER(10,2),
  TRANSFER_FREE   NUMBER(10,2),
  BARGAIN_BALANCE NUMBER(16,2),
  ORDER_SRLNUM    NUMBER(10),
  TOTAL_BALANCE   NUMBER(16,2),
  HOLD_SRLNUM     NUMBER(10),
  ACCOUNT_ID      VARCHAR2(50) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_EXEC_COLLECT170228 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HIST_HOLD_STOCK
  is '�˻���ʷ�ֱֲ�';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.ACCOUNT_ID
  is '�����˻�ID';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.TOTAL_QTY
  is 'ʵ�ʳֲ�����(��)';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.USABLE_QTY
  is '����֤ȯ����(��)';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.COST_PRICE
  is '�ۺ�����ɱ�(������ط���)';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_HIST_HOLD_STOCK.HOLD_SRLNUM
  is '�ֱֲ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_HOLD_STOCK to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_HOLD_STOCK to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK_10300917
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK_10300917
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK_10300917 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK_2013
prompt =========================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK_2013
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK_2013 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK_20130118
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130118
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130118 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK_20130201
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130201
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130201 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK_20130219
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130219
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130219 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK_20130220
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130220
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130220 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK_20130221
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130221
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130221 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK_20130222
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130222
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130222 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_HOLD_STOCK_20130227
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130227
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  HOLD_SRLNUM NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_HOLD_STOCK_20130227 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_INFORMATION
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_HIST_INFORMATION
(
  STOCK_SERINO  NUMBER(10) not null,
  TRADE_DATE    CHAR(8),
  MARKET_ID     VARCHAR2(3) not null,
  STOCK_CODE    VARCHAR2(10) not null,
  STOCK_NAME    VARCHAR2(40) not null,
  SEC_TYPE      VARCHAR2(10) not null,
  BUY_UNIT      INTEGER not null,
  CLOSE_PRICE   NUMBER(10,3),
  OPEN_PRICE    NUMBER(10,3),
  HIGHBUY_PRICE NUMBER(10,3),
  LOWSELL_PRICE NUMBER(10,3),
  NOW_PRICE     NUMBER(10,3),
  REMARK        VARCHAR2(100),
  IND_NAME      VARCHAR2(50),
  ISSUSPEND     VARCHAR2(3)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HIST_INFORMATION
  is '��Ʊ��Ϣ��';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.STOCK_SERINO
  is '��Ʊϵ�к�';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.TRADE_DATE
  is '��������';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.STOCK_NAME
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.SEC_TYPE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.BUY_UNIT
  is '���׵�λ';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.CLOSE_PRICE
  is '�������̼�';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.OPEN_PRICE
  is '���տ��̼�';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.HIGHBUY_PRICE
  is '������ͣ��';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.LOWSELL_PRICE
  is '���յ�ͣ��';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.NOW_PRICE
  is '��������ʱ��ǰ�ּ�';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.IND_NAME
  is '������ҵ';
comment on column SISANSHDATA.T_SIM_HIST_INFORMATION.ISSUSPEND
  is '�Ƿ�ͣ�� 1 ͣ�� 2 ��ͣ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_INFORMATION to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_HIST_INFORMATION to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_INFORMATION to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_ORDER
prompt ===============================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER
(
  SERIAL_NUM      NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  ORDER_DATE      CHAR(8) not null,
  ORDER_TIME      VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  TRADE_STATUS    CHAR(1) not null,
  ORDER_QTY       NUMBER(16) not null,
  ORDER_PRICE     NUMBER(10,3) not null,
  CANCEL_QTY      NUMBER(16),
  STAP_TAX        NUMBER(10,2),
  FARE            NUMBER(10,2),
  ORDER_BALANCE   NUMBER(16,2) not null,
  TRANSFER_FREE   NUMBER(10,2),
  REMARK          VARCHAR2(100),
  COMMISSOIN      NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  DEAL_FLAG       CHAR(1),
  TOTAL_BALANCE   NUMBER(16,2),
  BARGAIN_QTY     NUMBER(16),
  BARGAIN_BALANCE NUMBER(16,2),
  ORDERTYPE       VARCHAR2(20),
  MATCH_NO        NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HIST_ORDER
  is '�˻�����ί�б�';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.ACCOUNT_ID
  is '�˻�ID';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.ORDER_DATE
  is 'ί������';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.ORDER_TIME
  is 'ί��ʱ��';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.STOCK_NAME
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.TRADE_TYPE
  is '��������buy:����;sell:����';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.TRADE_STATUS
  is '����״̬';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.ORDER_QTY
  is 'ί������(��)';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.ORDER_PRICE
  is 'ί�м۸�';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.CANCEL_QTY
  is '��������(��)';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.STAP_TAX
  is 'Ԥ��ӡ��˰';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.FARE
  is 'Ԥ������������';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.ORDER_BALANCE
  is 'ί�н��';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.TRANSFER_FREE
  is 'Ԥ�ƹ�����';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.COMMISSOIN
  is 'Ԥ��������';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.TOTAL_FARE
  is 'Ԥ���ܷ���';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.DEAL_FLAG
  is '��������״̬0δ����1������2�������';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.TOTAL_BALANCE
  is 'ί���ܽ��=ί�н��+���з���';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.BARGAIN_QTY
  is '�ѳɽ�����';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.BARGAIN_BALANCE
  is '�ѳɽ����';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.ORDERTYPE
  is 'ί������(����)��marketprice �м�ί�У�limitprice �޼�ί��';
comment on column SISANSHDATA.T_SIM_HIST_ORDER.MATCH_NO
  is 'ƥ����(����)';
alter table SISANSHDATA.T_SIM_HIST_ORDER
  add constraint PK_T_SIM_HIST_ORDER primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_ORDER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_HIST_ORDER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_ORDER to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_ORDER160730
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER160730
(
  SERIAL_NUM      NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  ORDER_DATE      CHAR(8) not null,
  ORDER_TIME      VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  TRADE_STATUS    CHAR(1) not null,
  ORDER_QTY       NUMBER(16) not null,
  ORDER_PRICE     NUMBER(10,3) not null,
  CANCEL_QTY      NUMBER(16),
  STAP_TAX        NUMBER(10,2),
  FARE            NUMBER(10,2),
  ORDER_BALANCE   NUMBER(16,2) not null,
  TRANSFER_FREE   NUMBER(10,2),
  REMARK          VARCHAR2(100),
  COMMISSOIN      NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  DEAL_FLAG       CHAR(1),
  TOTAL_BALANCE   NUMBER(16,2),
  BARGAIN_QTY     NUMBER(16),
  BARGAIN_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_ORDER160730 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_ORDER170228
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER170228
(
  SERIAL_NUM      NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  ORDER_DATE      CHAR(8) not null,
  ORDER_TIME      VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  TRADE_STATUS    CHAR(1) not null,
  ORDER_QTY       NUMBER(16) not null,
  ORDER_PRICE     NUMBER(10,3) not null,
  CANCEL_QTY      NUMBER(16),
  STAP_TAX        NUMBER(10,2),
  FARE            NUMBER(10,2),
  ORDER_BALANCE   NUMBER(16,2) not null,
  TRANSFER_FREE   NUMBER(10,2),
  REMARK          VARCHAR2(100),
  COMMISSOIN      NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  DEAL_FLAG       CHAR(1),
  TOTAL_BALANCE   NUMBER(16,2),
  BARGAIN_QTY     NUMBER(16),
  BARGAIN_BALANCE NUMBER(16,2),
  ORDERTYPE       VARCHAR2(20),
  MATCH_NO        NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_ORDER170228 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_ORDER20161017
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER20161017
(
  SERIAL_NUM      NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  ORDER_DATE      CHAR(8) not null,
  ORDER_TIME      VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(20),
  TRADE_TYPE      VARCHAR2(10) not null,
  TRADE_STATUS    CHAR(1) not null,
  ORDER_QTY       NUMBER(16) not null,
  ORDER_PRICE     NUMBER(10,3) not null,
  CANCEL_QTY      NUMBER(16),
  STAP_TAX        NUMBER(10,2),
  FARE            NUMBER(10,2),
  ORDER_BALANCE   NUMBER(16,2) not null,
  TRANSFER_FREE   NUMBER(10,2),
  REMARK          VARCHAR2(100),
  COMMISSOIN      NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  DEAL_FLAG       CHAR(1),
  TOTAL_BALANCE   NUMBER(16,2),
  BARGAIN_QTY     NUMBER(16),
  BARGAIN_BALANCE NUMBER(16,2),
  ORDERTYPE       VARCHAR2(20),
  MATCH_NO        NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_ORDER20161017 to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_ORDER_2013
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER_2013
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ORDER_2013 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ORDER_20130118
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER_20130118
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ORDER_20130118 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ORDER_20130201
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER_20130201
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ORDER_20130201 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ORDER_20130219
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER_20130219
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ORDER_20130219 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ORDER_20130220
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER_20130220
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ORDER_20130220 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ORDER_20130221
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER_20130221
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ORDER_20130221 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ORDER_20130222
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER_20130222
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ORDER_20130222 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ORDER_20130227
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER_20130227
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ORDER_20130227 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_ORDER_201410300917
prompt ============================================
prompt
create table SISANSHDATA.T_SIM_HIST_ORDER_201410300917
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(20),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HIST_ORDER_201410300917 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HIST_STOCKPOOL
prompt ===================================
prompt
create table SISANSHDATA.T_SIM_HIST_STOCKPOOL
(
  OUT_NUM        NUMBER not null,
  IN_NUM         NUMBER not null,
  OUT_POOL_PRICE NUMBER(10,2),
  OUT_POOL_TIME  VARCHAR2(30),
  OUT_REASON     VARCHAR2(500),
  EARN_RATE      NUMBER(10,2),
  OUT_EXPONENT   NUMBER(10,2),
  EXPONENT_RATE  NUMBER(10,2),
  STOCKCODE      VARCHAR2(10),
  MARKET_ID      VARCHAR2(3),
  STOCKNAME      VARCHAR2(20),
  IN_POOL_PRICE  NUMBER(10,2),
  IN_POOL_TIME   VARCHAR2(30),
  AIM_PRICE      NUMBER(10,2),
  HOLD_PERCENT   NUMBER(10,2),
  IN_EXPONENT    NUMBER(10,2),
  IN_REASON      VARCHAR2(500),
  POOL_NO        NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_HIST_STOCKPOOL
  is '��Ʊ�س��ر�';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.OUT_NUM
  is '�������';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.IN_NUM
  is '������';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.OUT_POOL_PRICE
  is '���ؼ۸�';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.OUT_POOL_TIME
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.OUT_REASON
  is '����ԭ��';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.EARN_RATE
  is 'ӯ��%';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.OUT_EXPONENT
  is '����ʱ��ָ֤��';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.EXPONENT_RATE
  is 'ͬ��ָ���Ƿ�%';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.STOCKCODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.STOCKNAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.IN_POOL_PRICE
  is '��ؼ۸�';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.IN_POOL_TIME
  is '���ʱ��';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.AIM_PRICE
  is 'Ŀ���';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.HOLD_PERCENT
  is '��λ%';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.IN_EXPONENT
  is '���ʱָ��';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.IN_REASON
  is '���ԭ��';
comment on column SISANSHDATA.T_SIM_HIST_STOCKPOOL.POOL_NO
  is '������Ʊ�ر��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_STOCKPOOL to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_HIST_STOCKPOOL to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_STOCKPOOL to SISANSHOPR;

prompt
prompt Creating table T_SIM_HIST_XJB_RECORD
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_HIST_XJB_RECORD
(
  ACCOUNT_ID       NUMBER(10) not null,
  XJB_CODE         VARCHAR2(20),
  XJB_PROFIT       NUMBER(16,4),
  XJB_MARKET_VALUE NUMBER(16,4),
  USABLEBALANCE    NUMBER(16,4),
  CREATE_DATE      VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HIST_XJB_RECORD
  is '�ֽ���ʷ���ݼ�¼��';
comment on column SISANSHDATA.T_SIM_HIST_XJB_RECORD.ACCOUNT_ID
  is '�ʻ�id';
comment on column SISANSHDATA.T_SIM_HIST_XJB_RECORD.XJB_CODE
  is '��Ʒ����';
comment on column SISANSHDATA.T_SIM_HIST_XJB_RECORD.XJB_PROFIT
  is '�����ֽ�����';
comment on column SISANSHDATA.T_SIM_HIST_XJB_RECORD.XJB_MARKET_VALUE
  is '�ֽ���ֵ';
comment on column SISANSHDATA.T_SIM_HIST_XJB_RECORD.USABLEBALANCE
  is '�����ʽ�';
comment on column SISANSHDATA.T_SIM_HIST_XJB_RECORD.CREATE_DATE
  is '��������';
grant select, insert, update, delete on SISANSHDATA.T_SIM_HIST_XJB_RECORD to SISANSHOPR;

prompt
prompt Creating table T_SIM_HOLD_STOCK
prompt ===============================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HOLD_STOCK
  is '�˻��ֱֲ�';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.ACCOUNT_ID
  is '�����˻�ID';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.TOTAL_QTY
  is 'ʵ�ʳֲ�����(��)';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.USABLE_QTY
  is '����֤ȯ����(��)';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.COST_PRICE
  is '�ۺ�����ɱ�(������ط���)';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.MODIFY_DATE
  is '����޸�ʱ��';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK.REMARK
  is '��ע';
alter table SISANSHDATA.T_SIM_HOLD_STOCK
  add constraint PK_T_SIM_HOLD_STOCK primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HOLD_STOCK to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_HOLD_STOCK to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HOLD_STOCK to SISANSHOPR;

prompt
prompt Creating table T_SIM_HOLD_STOCK20140709
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK20140709
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK20140709 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK20140710
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK20140710
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK20140710 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK20140806
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK20140806
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK20140806 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK20140819
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK20140819
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK20140819 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK20140820
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK20140820
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK20140820 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_2013
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_2013
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_2013 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_20130118
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_20130118
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_20130118 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_20130201
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_20130201
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_20130201 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_20130219
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_20130219
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_20130219 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_20130220
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_20130220
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_20130220 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_20130221
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_20130221
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_20130221 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_20130222
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_20130222
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_20130222 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_20130227
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_20130227
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_20130227 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_20130918
prompt ========================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_20130918
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_20130918 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_HOLD_STOCK_BK
prompt ==================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_BK
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(10) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HOLD_STOCK_BK
  is '�˻��ֱֲ�';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.ACCOUNT_ID
  is '�����˻�ID';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.TOTAL_QTY
  is 'ʵ�ʳֲ�����(��)';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.USABLE_QTY
  is '����֤ȯ����(��)';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.COST_PRICE
  is '�ۺ�����ɱ�(������ط���)';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.MODIFY_DATE
  is '����޸�ʱ��';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_BK.REMARK
  is '��ע';
alter table SISANSHDATA.T_SIM_HOLD_STOCK_BK
  add constraint PK_T_SIM_HOLD_STOCK_BK primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_HOLD_STOCK_BK to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_HOLD_STOCK_BK to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_HOLD_STOCK_BK to SISANSHOPR;

prompt
prompt Creating table T_SIM_HOLD_STOCK_DAILY
prompt =====================================
prompt
create table SISANSHDATA.T_SIM_HOLD_STOCK_DAILY
(
  SERIAL_NUM  NUMBER(10) not null,
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3) not null,
  STOCK_CODE  VARCHAR2(6) not null,
  TOTAL_QTY   NUMBER(10) not null,
  USABLE_QTY  NUMBER(10) not null,
  COST_PRICE  NUMBER(10,3) not null,
  CREATE_DATE VARCHAR2(30) not null,
  MODIFY_DATE VARCHAR2(30) not null,
  REMARK      VARCHAR2(100),
  BACKUP_DATE VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_HOLD_STOCK_DAILY
  is '�˻��ֲ����б��ݱ�';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.SERIAL_NUM
  is '�ֲ�����ID';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.ACCOUNT_ID
  is '�����˻�ID';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.TOTAL_QTY
  is 'ʵ�ʳֲ�����(��)';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.USABLE_QTY
  is '����֤ȯ����(��)';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.COST_PRICE
  is '�ۺ�����ɱ�(������ط���)';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.MODIFY_DATE
  is '����޸�ʱ��';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_HOLD_STOCK_DAILY.BACKUP_DATE
  is '��������';
grant select, insert, update, delete on SISANSHDATA.T_SIM_HOLD_STOCK_DAILY to SISANSHOPR;

prompt
prompt Creating table T_SIM_HSL
prompt ========================
prompt
create table SISANSHDATA.T_SIM_HSL
(
  ACCOUNT_ID NUMBER,
  STAT_MONTH VARCHAR2(30),
  HSL        NUMBER(16,4)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_HSL to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_INDUSTRY
prompt =============================
prompt
create table SISANSHDATA.T_SIM_INDUSTRY
(
  STOCK_CODE VARCHAR2(10),
  STOCK_NAME VARCHAR2(50),
  FINDUCODE  VARCHAR2(20),
  FINDUNAME  VARCHAR2(200),
  SINDUCODE  VARCHAR2(20),
  SINDUNAME  VARCHAR2(200),
  TINDUCODE  VARCHAR2(20),
  TINDUNAME  VARCHAR2(200),
  MARKET_ID  CHAR(2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_INDUSTRY to SISANSHOPR;

prompt
prompt Creating table T_SIM_INFORMATION
prompt ================================
prompt
create table SISANSHDATA.T_SIM_INFORMATION
(
  SERIAL_NUM    NUMBER(10) not null,
  STOCK_SERINO  NUMBER(10) not null,
  TRADE_DATE    CHAR(8),
  MARKET_ID     VARCHAR2(3) not null,
  STOCK_CODE    VARCHAR2(10) not null,
  STOCK_NAME    VARCHAR2(40) not null,
  SEC_TYPE      VARCHAR2(10) not null,
  BUY_UNIT      INTEGER not null,
  CLOSE_PRICE   NUMBER(10,3),
  OPEN_PRICE    NUMBER(10,3),
  HIGHBUY_PRICE NUMBER(10,3),
  LOWSELL_PRICE NUMBER(10,3),
  NOW_PRICE     NUMBER(10,3),
  REMARK        VARCHAR2(100),
  IND_NAME      VARCHAR2(50),
  ISSUSPEND     VARCHAR2(3)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_INFORMATION
  is '��Ʊ��Ϣ��';
comment on column SISANSHDATA.T_SIM_INFORMATION.SERIAL_NUM
  is '�������';
comment on column SISANSHDATA.T_SIM_INFORMATION.STOCK_SERINO
  is '��Ʊϵ�к�';
comment on column SISANSHDATA.T_SIM_INFORMATION.TRADE_DATE
  is '��������';
comment on column SISANSHDATA.T_SIM_INFORMATION.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_INFORMATION.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_INFORMATION.STOCK_NAME
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_INFORMATION.SEC_TYPE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_INFORMATION.BUY_UNIT
  is '���׵�λ';
comment on column SISANSHDATA.T_SIM_INFORMATION.CLOSE_PRICE
  is '�������̼�';
comment on column SISANSHDATA.T_SIM_INFORMATION.OPEN_PRICE
  is '���տ��̼�';
comment on column SISANSHDATA.T_SIM_INFORMATION.HIGHBUY_PRICE
  is '������ͣ��';
comment on column SISANSHDATA.T_SIM_INFORMATION.LOWSELL_PRICE
  is '���յ�ͣ��';
comment on column SISANSHDATA.T_SIM_INFORMATION.NOW_PRICE
  is '��������ʱ��ǰ�ּ�';
comment on column SISANSHDATA.T_SIM_INFORMATION.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_INFORMATION.IND_NAME
  is '������ҵ';
comment on column SISANSHDATA.T_SIM_INFORMATION.ISSUSPEND
  is '�Ƿ�ͣ�� 1 ͣ�� 2 ��ͣ��';
alter table SISANSHDATA.T_SIM_INFORMATION
  add constraint PK_T_SIM_INFORMATION primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_INFORMATION to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_INFORMATION to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_INFORMATION to SISANSHOPR;

prompt
prompt Creating table T_SIM_POSITION_CHANGE
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_POSITION_CHANGE
(
  BARGAIN_NO           NUMBER not null,
  BEFORE_TOTAL_BALANCE NUMBER(16,2) not null,
  BEFORE_MARKET        NUMBER(16,2) not null,
  AFTER_MARKET         NUMBER(16,2) not null,
  CHANGE_RATE          NUMBER(16,4) not null,
  CREATE_DATE          VARCHAR2(30),
  AFTER_TOTAL_BALANCE  NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_POSITION_CHANGE
  is '��λ�仯��';
comment on column SISANSHDATA.T_SIM_POSITION_CHANGE.BARGAIN_NO
  is '�ɽ����';
comment on column SISANSHDATA.T_SIM_POSITION_CHANGE.BEFORE_TOTAL_BALANCE
  is '�ɽ�ǰ���ʲ�';
comment on column SISANSHDATA.T_SIM_POSITION_CHANGE.BEFORE_MARKET
  is '�ɽ�ǰ��ֵ';
comment on column SISANSHDATA.T_SIM_POSITION_CHANGE.AFTER_MARKET
  is '�ɽ�����ֵ';
comment on column SISANSHDATA.T_SIM_POSITION_CHANGE.CHANGE_RATE
  is '��λ�仯����';
comment on column SISANSHDATA.T_SIM_POSITION_CHANGE.CREATE_DATE
  is 'ʱ��';
comment on column SISANSHDATA.T_SIM_POSITION_CHANGE.AFTER_TOTAL_BALANCE
  is '�ɽ������ʲ�';
grant select on SISANSHDATA.T_SIM_POSITION_CHANGE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_POSITION_CHANGE to SISANSHOPR;

prompt
prompt Creating table T_SIM_RESET_LOG
prompt ==============================
prompt
create table SISANSHDATA.T_SIM_RESET_LOG
(
  ACCOUNT_ID NUMBER(10) not null,
  RESET_DATE VARCHAR2(30) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_RESET_LOG
  is '�˺����ü�¼��';
comment on column SISANSHDATA.T_SIM_RESET_LOG.ACCOUNT_ID
  is '�����˻�id';
comment on column SISANSHDATA.T_SIM_RESET_LOG.RESET_DATE
  is '��������';
grant select, insert, update, delete on SISANSHDATA.T_SIM_RESET_LOG to SISANSHOPR;

prompt
prompt Creating table T_SIM_SCHOOL
prompt ===========================
prompt
create table SISANSHDATA.T_SIM_SCHOOL
(
  SCHOOL_ID   VARCHAR2(30) not null,
  SCHOOL_NAME VARCHAR2(100) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_SCHOOL
  is 'ѧУ��';
comment on column SISANSHDATA.T_SIM_SCHOOL.SCHOOL_ID
  is 'ѧУid';
comment on column SISANSHDATA.T_SIM_SCHOOL.SCHOOL_NAME
  is 'ѧУ����';
grant select, insert, update, delete on SISANSHDATA.T_SIM_SCHOOL to SISANSHOPR;

prompt
prompt Creating table T_SIM_SELF_STOCK
prompt ===============================
prompt
create table SISANSHDATA.T_SIM_SELF_STOCK
(
  ACCOUNT_ID  VARCHAR2(50) not null,
  MARKET_ID   VARCHAR2(3),
  STOCK_CODE  VARCHAR2(10),
  CREATE_DATE VARCHAR2(30),
  SERIAL_NUM  NUMBER(10) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_SELF_STOCK
  is '��ѡ��';
comment on column SISANSHDATA.T_SIM_SELF_STOCK.ACCOUNT_ID
  is '�˻�id';
comment on column SISANSHDATA.T_SIM_SELF_STOCK.MARKET_ID
  is '��Ʊ�г�����';
comment on column SISANSHDATA.T_SIM_SELF_STOCK.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_SELF_STOCK.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_SELF_STOCK.SERIAL_NUM
  is '���';
grant select, insert, update, delete on SISANSHDATA.T_SIM_SELF_STOCK to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_SELF_STOCK to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_SELF_STOCK to SISANSHOPR;

prompt
prompt Creating table T_SIM_SETTLEMENT_ACCOUNT
prompt =======================================
prompt
create table SISANSHDATA.T_SIM_SETTLEMENT_ACCOUNT
(
  ACCOUNT_ID           NUMBER(10) not null,
  MONEY_ID             CHAR(3) not null,
  CREATE_DATE          CHAR(8) not null,
  TOTAL_ASSETS         NUMBER(16,4) not null,
  CURRENT_BALANCE      NUMBER(16,4) not null,
  TOTAL_MARKET         NUMBER(16,4),
  TOTAL_EARNINGS       NUMBER(16,4),
  TOTAL_YIELD          NUMBER(10,4),
  TOTAL_YIELD_RANKINGS NUMBER(10),
  WEEK_EARNINGS        NUMBER(16,4),
  WEEK_YIELD           NUMBER(10,4),
  WEEK_YIELD_RANKINGS  NUMBER(10),
  MONTH_EARNINGS       NUMBER(16,4),
  MONTH_YIELD          NUMBER(10,3),
  MONTH_YIELD_RANKINGS NUMBER(10),
  REMARK               VARCHAR2(100),
  DAY_EARNINGS         NUMBER(16,4),
  DAY_YIELD            NUMBER(10,4),
  DAY_YIELD_RANKINGS   NUMBER(10),
  RANK_TYPE            CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.INDEX_T_SETTLEMENT_ACCOUNT on SISANSHDATA.T_SIM_SETTLEMENT_ACCOUNT (ACCOUNT_ID)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
create index SISANSHDATA.SETTLE_ACCOUNT_IDX on SISANSHDATA.T_SIM_SETTLEMENT_ACCOUNT (ACCOUNT_ID, CREATE_DATE)
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_SETTLEMENT_ACCOUNT to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_SETTLEMENT_ACCOUNT to SISANSHOPR;

prompt
prompt Creating table T_SIM_SETTLEMENT_LOG
prompt ===================================
prompt
create table SISANSHDATA.T_SIM_SETTLEMENT_LOG
(
  ID             NUMBER not null,
  PROCEDURE_NAME VARCHAR2(50),
  ERR_CODE       VARCHAR2(30) not null,
  ERR_MSG        VARCHAR2(1000) not null,
  CREATE_DATE    VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_SETTLEMENT_LOG
  is '������־��';
comment on column SISANSHDATA.T_SIM_SETTLEMENT_LOG.ID
  is '���';
comment on column SISANSHDATA.T_SIM_SETTLEMENT_LOG.PROCEDURE_NAME
  is '�洢��������';
comment on column SISANSHDATA.T_SIM_SETTLEMENT_LOG.ERR_CODE
  is '�������';
comment on column SISANSHDATA.T_SIM_SETTLEMENT_LOG.ERR_MSG
  is '������Ϣ';
comment on column SISANSHDATA.T_SIM_SETTLEMENT_LOG.CREATE_DATE
  is 'ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_SETTLEMENT_LOG to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_SETTLEMENT_LOG to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_SETTLEMENT_LOG to SISANSHOPR;

prompt
prompt Creating table T_SIM_STATEMENT
prompt ==============================
prompt
create table SISANSHDATA.T_SIM_STATEMENT
(
  ID          NUMBER,
  CONTENT     CLOB,
  STATE       CHAR(1) default 1,
  CREATE_TIME VARCHAR2(20),
  MODIFY_TIME VARCHAR2(20),
  TITLE       VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_STATEMENT
  is '��վʹ������';
comment on column SISANSHDATA.T_SIM_STATEMENT.ID
  is '����';
comment on column SISANSHDATA.T_SIM_STATEMENT.CONTENT
  is 'Э������';
comment on column SISANSHDATA.T_SIM_STATEMENT.STATE
  is '״̬��0����Ч��1����Ч��';
comment on column SISANSHDATA.T_SIM_STATEMENT.CREATE_TIME
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_STATEMENT.MODIFY_TIME
  is '�޸�ʱ��';
comment on column SISANSHDATA.T_SIM_STATEMENT.TITLE
  is '����';
grant select, insert, update, delete on SISANSHDATA.T_SIM_STATEMENT to SISANSHOPR;

prompt
prompt Creating table T_SIM_STOCKPOOL
prompt ==============================
prompt
create table SISANSHDATA.T_SIM_STOCKPOOL
(
  STOCKCODE     VARCHAR2(10) not null,
  MARKET_ID     VARCHAR2(3) not null,
  STOCKNAME     VARCHAR2(20) not null,
  IN_POOL_PRICE NUMBER(10,2) not null,
  IN_POOL_TIME  VARCHAR2(30),
  AIM_PRICE     NUMBER(10,2),
  HOLD_PERCENT  NUMBER(10,2),
  IN_EXPONENT   NUMBER(10,2),
  IN_NUM        NUMBER,
  IN_REASON     VARCHAR2(500),
  POOL_NO       NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_STOCKPOOL
  is '��Ʊ��';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.STOCKCODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.STOCKNAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.IN_POOL_PRICE
  is '��ؼ۸�';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.IN_POOL_TIME
  is '���ʱ��';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.AIM_PRICE
  is 'Ŀ���';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.HOLD_PERCENT
  is '��λ%';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.IN_EXPONENT
  is '���ʱָ��';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.IN_NUM
  is '��ر��';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.IN_REASON
  is '���ԭ��';
comment on column SISANSHDATA.T_SIM_STOCKPOOL.POOL_NO
  is '������Ʊ�ر��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_STOCKPOOL to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_STOCKPOOL to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_STOCKPOOL to SISANSHOPR;

prompt
prompt Creating table T_SIM_STOCKPOOL_INFO
prompt ===================================
prompt
create table SISANSHDATA.T_SIM_STOCKPOOL_INFO
(
  POOL_NO         NUMBER not null,
  POOL_NAME       VARCHAR2(100) not null,
  SUCCESS_RATE    NUMBER(10,4),
  POOL_INTRO      VARCHAR2(1000),
  CREATE_DATE     VARCHAR2(30),
  MODIFY_DATE     VARCHAR2(30),
  USER_ID         VARCHAR2(30) not null,
  HIST_EARN_RATE  NUMBER(10,2),
  USEABLE_PERCENT NUMBER(10,2) default 100
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_STOCKPOOL_INFO
  is '��Ʊ�ػ�����Ϣ��';
comment on column SISANSHDATA.T_SIM_STOCKPOOL_INFO.POOL_NO
  is '��Ʊ�ر��';
comment on column SISANSHDATA.T_SIM_STOCKPOOL_INFO.POOL_NAME
  is '��Ʊ������';
comment on column SISANSHDATA.T_SIM_STOCKPOOL_INFO.SUCCESS_RATE
  is '��Ʊʵ��ӯ������Ӯ���̵ı���';
comment on column SISANSHDATA.T_SIM_STOCKPOOL_INFO.POOL_INTRO
  is '��Ʊ�ؽ���';
comment on column SISANSHDATA.T_SIM_STOCKPOOL_INFO.CREATE_DATE
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_STOCKPOOL_INFO.MODIFY_DATE
  is '�����޸�ʱ��';
comment on column SISANSHDATA.T_SIM_STOCKPOOL_INFO.USER_ID
  is '�����û�id';
comment on column SISANSHDATA.T_SIM_STOCKPOOL_INFO.HIST_EARN_RATE
  is '��ʷ����';
comment on column SISANSHDATA.T_SIM_STOCKPOOL_INFO.USEABLE_PERCENT
  is '���ò�λ';
grant select, insert, update, delete on SISANSHDATA.T_SIM_STOCKPOOL_INFO to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_STOCKPOOL_INFO to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_STOCKPOOL_INFO to SISANSHOPR;

prompt
prompt Creating table T_SIM_SYS_CONFIG
prompt ===============================
prompt
create table SISANSHDATA.T_SIM_SYS_CONFIG
(
  ID          NUMBER(10) not null,
  NAME        VARCHAR2(255) not null,
  CAPTION     VARCHAR2(255) not null,
  CUR_VALUE   VARCHAR2(255),
  DESCRIPTION VARCHAR2(500),
  IS_SYSTEM   NUMBER(10) not null,
  SITENO      VARCHAR2(50),
  CONFIG_TYPE VARCHAR2(10) default '1' not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_SYS_CONFIG
  is '��Ʊ���׷��ʱ�';
comment on column SISANSHDATA.T_SIM_SYS_CONFIG.ID
  is '����ID';
comment on column SISANSHDATA.T_SIM_SYS_CONFIG.NAME
  is '��������,һ��ΪӢ��';
comment on column SISANSHDATA.T_SIM_SYS_CONFIG.CAPTION
  is '����������ʾ';
comment on column SISANSHDATA.T_SIM_SYS_CONFIG.CUR_VALUE
  is '����ֵ';
comment on column SISANSHDATA.T_SIM_SYS_CONFIG.DESCRIPTION
  is '��������';
comment on column SISANSHDATA.T_SIM_SYS_CONFIG.IS_SYSTEM
  is '�Ƿ�Ϊϵͳ����(0:����;1:��)';
comment on column SISANSHDATA.T_SIM_SYS_CONFIG.SITENO
  is '����վ��';
comment on column SISANSHDATA.T_SIM_SYS_CONFIG.CONFIG_TYPE
  is '1:ģ�⳴�� 2:������ȯ';
alter table SISANSHDATA.T_SIM_SYS_CONFIG
  add constraint PK_T_SIM_SYS_CONFIG primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_SYS_CONFIG to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_SYS_CONFIG to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_SYS_CONFIG to SISANSHOPR;

prompt
prompt Creating table T_SIM_TODAY_ORDER
prompt ================================
prompt
create table SISANSHDATA.T_SIM_TODAY_ORDER
(
  SERIAL_NUM      NUMBER(10) not null,
  ACCOUNT_ID      VARCHAR2(50) not null,
  ORDER_DATE      CHAR(8) not null,
  ORDER_TIME      VARCHAR2(20) not null,
  MARKET_ID       VARCHAR2(3),
  STOCK_CODE      VARCHAR2(10),
  STOCK_NAME      VARCHAR2(50),
  TRADE_TYPE      VARCHAR2(10) not null,
  TRADE_STATUS    CHAR(1) not null,
  ORDER_QTY       NUMBER(16) not null,
  ORDER_PRICE     NUMBER(10,3) not null,
  CANCEL_QTY      NUMBER(16),
  STAP_TAX        NUMBER(10,2),
  FARE            NUMBER(10,2),
  ORDER_BALANCE   NUMBER(16,2) not null,
  TRANSFER_FREE   NUMBER(10,2),
  REMARK          VARCHAR2(100),
  COMMISSOIN      NUMBER(10,2),
  TOTAL_FARE      NUMBER(10,2),
  DEAL_FLAG       CHAR(1),
  TOTAL_BALANCE   NUMBER(16,2),
  BARGAIN_QTY     NUMBER(16),
  BARGAIN_BALANCE NUMBER(16,2),
  ORDERTYPE       VARCHAR2(20),
  MATCH_NO        NUMBER
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_TODAY_ORDER
  is '�˻�����ί�б�';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.ACCOUNT_ID
  is '�˻�ID';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.ORDER_DATE
  is 'ί������';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.ORDER_TIME
  is 'ί��ʱ��';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.MARKET_ID
  is '�г�����';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.STOCK_CODE
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.STOCK_NAME
  is '֤ȯ����';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.TRADE_TYPE
  is '��������buy:����;sell:����';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.TRADE_STATUS
  is '����״̬';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.ORDER_QTY
  is 'ί������(��)';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.ORDER_PRICE
  is 'ί�м۸�';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.CANCEL_QTY
  is '��������(��)';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.STAP_TAX
  is 'Ԥ��ӡ��˰';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.FARE
  is 'Ԥ������������';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.ORDER_BALANCE
  is 'ί�н��';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.TRANSFER_FREE
  is 'Ԥ�ƹ�����';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.REMARK
  is '��ע';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.COMMISSOIN
  is 'Ԥ��������';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.TOTAL_FARE
  is 'Ԥ���ܷ���';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.DEAL_FLAG
  is '��������״̬0δ����1������2�������';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.TOTAL_BALANCE
  is 'ί���ܽ��=ί�н��+���з���';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.BARGAIN_QTY
  is '�ѳɽ�����';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.BARGAIN_BALANCE
  is '�ѳɽ����';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.ORDERTYPE
  is 'ί������(����)��marketprice �м�ί�У�limitprice �޼�ί��';
comment on column SISANSHDATA.T_SIM_TODAY_ORDER.MATCH_NO
  is 'ƥ����(����)';
alter table SISANSHDATA.T_SIM_TODAY_ORDER
  add constraint PK_T_SIM_TODAY_ORDER primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_TODAY_ORDER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_TODAY_ORDER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_TODAY_ORDER to SISANSHOPR;

prompt
prompt Creating table T_SIM_TODAY_ORDER_201410300917
prompt =============================================
prompt
create table SISANSHDATA.T_SIM_TODAY_ORDER_201410300917
(
  SERIAL_NUM    NUMBER(10) not null,
  ACCOUNT_ID    VARCHAR2(50) not null,
  ORDER_DATE    CHAR(8) not null,
  ORDER_TIME    VARCHAR2(20) not null,
  MARKET_ID     VARCHAR2(3),
  STOCK_CODE    VARCHAR2(10),
  STOCK_NAME    VARCHAR2(50),
  TRADE_TYPE    VARCHAR2(10) not null,
  TRADE_STATUS  CHAR(1) not null,
  ORDER_QTY     NUMBER(16) not null,
  ORDER_PRICE   NUMBER(10,3) not null,
  CANCEL_QTY    NUMBER(16),
  STAP_TAX      NUMBER(10,2),
  FARE          NUMBER(10,2),
  ORDER_BALANCE NUMBER(16,2) not null,
  TRANSFER_FREE NUMBER(10,2),
  REMARK        VARCHAR2(100),
  COMMISSOIN    NUMBER(10,2),
  TOTAL_FARE    NUMBER(10,2),
  DEAL_FLAG     CHAR(1),
  TOTAL_BALANCE NUMBER(16,2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_TODAY_ORDER_201410300917 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_TRADE_BLACKLIST
prompt ====================================
prompt
create table SISANSHDATA.T_SIM_TRADE_BLACKLIST
(
  SERI_NUM      NUMBER not null,
  STOCK_CODE    VARCHAR2(6) not null,
  STOCK_NAME    VARCHAR2(100),
  STOCK_STAT    VARCHAR2(6),
  ADD_REASON    VARCHAR2(1000),
  CREATE_DATE   VARCHAR2(30),
  CHANGE_DATE   VARCHAR2(30),
  CREATE_PERSON VARCHAR2(100)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_TRADE_BLACKLIST
  is 'Ͷ�˽��׺�����';
comment on column SISANSHDATA.T_SIM_TRADE_BLACKLIST.SERI_NUM
  is '���к�';
comment on column SISANSHDATA.T_SIM_TRADE_BLACKLIST.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_TRADE_BLACKLIST.STOCK_NAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_TRADE_BLACKLIST.STOCK_STAT
  is '��Ʊ״̬ 0������  1�Ƴ�';
comment on column SISANSHDATA.T_SIM_TRADE_BLACKLIST.ADD_REASON
  is '�������';
comment on column SISANSHDATA.T_SIM_TRADE_BLACKLIST.CREATE_DATE
  is '����������ʱ��';
comment on column SISANSHDATA.T_SIM_TRADE_BLACKLIST.CHANGE_DATE
  is '���ĺ�����ʱ��';
comment on column SISANSHDATA.T_SIM_TRADE_BLACKLIST.CREATE_PERSON
  is '��Ӻ�������';
grant select, insert, update, delete on SISANSHDATA.T_SIM_TRADE_BLACKLIST to SISANSHOPR;

prompt
prompt Creating table T_SIM_TRADE_LOG
prompt ==============================
prompt
create table SISANSHDATA.T_SIM_TRADE_LOG
(
  STOCK_CODE  VARCHAR2(6) not null,
  STOCK_NAME  VARCHAR2(100),
  OPER_STAT   VARCHAR2(6),
  STOCK_STAT  VARCHAR2(6),
  OPER_PERSON VARCHAR2(100),
  OPER_TIME   VARCHAR2(30),
  OPER_REASON VARCHAR2(1000)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_TRADE_LOG
  is '�ڰ�����������¼��';
comment on column SISANSHDATA.T_SIM_TRADE_LOG.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_TRADE_LOG.STOCK_NAME
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_TRADE_LOG.OPER_STAT
  is '����״̬��1 ɾ����0 ������';
comment on column SISANSHDATA.T_SIM_TRADE_LOG.STOCK_STAT
  is '��Ʊ״̬��1��������0 ��������';
comment on column SISANSHDATA.T_SIM_TRADE_LOG.OPER_PERSON
  is '������Ա';
comment on column SISANSHDATA.T_SIM_TRADE_LOG.OPER_TIME
  is '����ʱ��';
comment on column SISANSHDATA.T_SIM_TRADE_LOG.OPER_REASON
  is '����ԭ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_TRADE_LOG to SISANSHOPR;

prompt
prompt Creating table T_SIM_TRADE_POOL
prompt ===============================
prompt
create table SISANSHDATA.T_SIM_TRADE_POOL
(
  SERI_NUM    NUMBER not null,
  STOCK_CODE  VARCHAR2(6) not null,
  CREATE_DATE VARCHAR2(30) not null
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_TRADE_POOL
  is 'Ͷ�˽��׹�Ʊ��';
comment on column SISANSHDATA.T_SIM_TRADE_POOL.SERI_NUM
  is '���к�';
comment on column SISANSHDATA.T_SIM_TRADE_POOL.STOCK_CODE
  is '��Ʊ����';
comment on column SISANSHDATA.T_SIM_TRADE_POOL.CREATE_DATE
  is '����ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_TRADE_POOL to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_TRADE_POOL to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_TRADE_POOL to SISANSHOPR;

prompt
prompt Creating table T_SIM_USER
prompt =========================
prompt
create table SISANSHDATA.T_SIM_USER
(
  USER_ID           VARCHAR2(20) not null,
  NAME              VARCHAR2(50),
  LOGIN_ID          VARCHAR2(50) not null,
  PASSWORD          VARCHAR2(50) not null,
  SALT              CHAR(6),
  STATE             NUMBER(10),
  LAST_TIME         VARCHAR2(20),
  EMAIL             VARCHAR2(50),
  PHONE             VARCHAR2(50),
  MOBILE            VARCHAR2(50),
  CREATE_DATE       VARCHAR2(50) not null,
  MODIFIED_DATE     VARCHAR2(50),
  TYPE              CHAR(1),
  ASSET_ACCOUNT     VARCHAR2(20),
  SITE_NO           VARCHAR2(50),
  LOGIN_COUNT       NUMBER(10),
  SEX               CHAR(1),
  PASSWORD_QUESTION VARCHAR2(200),
  PASSWORD_ANSWER   VARCHAR2(200),
  FACE_IMAGE        VARCHAR2(200),
  INVESTMENT_STYLE  VARCHAR2(1000),
  FACE_IMAGE_SMALL  VARCHAR2(200),
  SCORE             NUMBER(10),
  NRH_USERID        NUMBER,
  SCHOOL_ID         VARCHAR2(30),
  INTRODUCTION      VARCHAR2(300),
  HJGACCOUNT        VARCHAR2(50),
  CHANNEL           VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_USER
  is '�û���';
comment on column SISANSHDATA.T_SIM_USER.USER_ID
  is '�û�ID';
comment on column SISANSHDATA.T_SIM_USER.NAME
  is '��ʵ����';
comment on column SISANSHDATA.T_SIM_USER.LOGIN_ID
  is '��¼ID';
comment on column SISANSHDATA.T_SIM_USER.PASSWORD
  is '�û�����';
comment on column SISANSHDATA.T_SIM_USER.SALT
  is '����ļ�����';
comment on column SISANSHDATA.T_SIM_USER.STATE
  is '�û�״̬��0 ����  1 ����   2  �ر�';
comment on column SISANSHDATA.T_SIM_USER.LAST_TIME
  is '���µ�¼ʱ��';
comment on column SISANSHDATA.T_SIM_USER.EMAIL
  is '��������';
comment on column SISANSHDATA.T_SIM_USER.PHONE
  is '�绰';
comment on column SISANSHDATA.T_SIM_USER.MOBILE
  is '�ƶ��绰';
comment on column SISANSHDATA.T_SIM_USER.CREATE_DATE
  is 'ע��ʱ��';
comment on column SISANSHDATA.T_SIM_USER.MODIFIED_DATE
  is '�޸�ʱ��';
comment on column SISANSHDATA.T_SIM_USER.TYPE
  is '�ͻ����0ע���û�1�����û�2Ͷ�ʹ���';
comment on column SISANSHDATA.T_SIM_USER.ASSET_ACCOUNT
  is '�ʽ��ʺ�';
comment on column SISANSHDATA.T_SIM_USER.SITE_NO
  is '����վ��';
comment on column SISANSHDATA.T_SIM_USER.LOGIN_COUNT
  is '�ͻ���½����';
comment on column SISANSHDATA.T_SIM_USER.SEX
  is '�Ա�';
comment on column SISANSHDATA.T_SIM_USER.PASSWORD_QUESTION
  is '���뱣������';
comment on column SISANSHDATA.T_SIM_USER.PASSWORD_ANSWER
  is '���뱣����';
comment on column SISANSHDATA.T_SIM_USER.FACE_IMAGE
  is '��ͷ��·��';
comment on column SISANSHDATA.T_SIM_USER.INVESTMENT_STYLE
  is 'Ͷ�ʷ��';
comment on column SISANSHDATA.T_SIM_USER.FACE_IMAGE_SMALL
  is 'Сͷ��·��';
comment on column SISANSHDATA.T_SIM_USER.SCORE
  is '�û�����';
comment on column SISANSHDATA.T_SIM_USER.NRH_USERID
  is '���˼��';
comment on column SISANSHDATA.T_SIM_USER.SCHOOL_ID
  is 'ѧУid';
alter table SISANSHDATA.T_SIM_USER
  add constraint PK_T_SIM_USER primary key (USER_ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SIM_USER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_USER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_USER to SISANSHOPR;

prompt
prompt Creating table T_SIM_USER_201407281612
prompt ======================================
prompt
create table SISANSHDATA.T_SIM_USER_201407281612
(
  USER_ID           VARCHAR2(20) not null,
  NAME              VARCHAR2(50),
  LOGIN_ID          VARCHAR2(30) not null,
  PASSWORD          VARCHAR2(50) not null,
  SALT              CHAR(6),
  STATE             NUMBER(10),
  LAST_TIME         VARCHAR2(20),
  EMAIL             VARCHAR2(50),
  PHONE             VARCHAR2(50),
  MOBILE            VARCHAR2(50),
  CREATE_DATE       VARCHAR2(50) not null,
  MODIFIED_DATE     VARCHAR2(50),
  TYPE              CHAR(1),
  ASSET_ACCOUNT     VARCHAR2(20),
  SITE_NO           VARCHAR2(50),
  LOGIN_COUNT       NUMBER(10),
  SEX               CHAR(1),
  PASSWORD_QUESTION VARCHAR2(200),
  PASSWORD_ANSWER   VARCHAR2(200),
  FACE_IMAGE        VARCHAR2(200),
  INVESTMENT_STYLE  VARCHAR2(1000),
  FACE_IMAGE_SMALL  VARCHAR2(200),
  SCORE             NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_USER_201407281612 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_USER_201412301612
prompt ======================================
prompt
create table SISANSHDATA.T_SIM_USER_201412301612
(
  USER_ID           VARCHAR2(20) not null,
  NAME              VARCHAR2(50),
  LOGIN_ID          VARCHAR2(30) not null,
  PASSWORD          VARCHAR2(50) not null,
  SALT              CHAR(6),
  STATE             NUMBER(10),
  LAST_TIME         VARCHAR2(20),
  EMAIL             VARCHAR2(50),
  PHONE             VARCHAR2(50),
  MOBILE            VARCHAR2(50),
  CREATE_DATE       VARCHAR2(50) not null,
  MODIFIED_DATE     VARCHAR2(50),
  TYPE              CHAR(1),
  ASSET_ACCOUNT     VARCHAR2(20),
  SITE_NO           VARCHAR2(50),
  LOGIN_COUNT       NUMBER(10),
  SEX               CHAR(1),
  PASSWORD_QUESTION VARCHAR2(200),
  PASSWORD_ANSWER   VARCHAR2(200),
  FACE_IMAGE        VARCHAR2(200),
  INVESTMENT_STYLE  VARCHAR2(1000),
  FACE_IMAGE_SMALL  VARCHAR2(200),
  SCORE             NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_USER_201412301612 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_USER_201504201111
prompt ======================================
prompt
create table SISANSHDATA.T_SIM_USER_201504201111
(
  USER_ID           VARCHAR2(20) not null,
  NAME              VARCHAR2(50),
  LOGIN_ID          VARCHAR2(30) not null,
  PASSWORD          VARCHAR2(50) not null,
  SALT              CHAR(6),
  STATE             NUMBER(10),
  LAST_TIME         VARCHAR2(20),
  EMAIL             VARCHAR2(50),
  PHONE             VARCHAR2(50),
  MOBILE            VARCHAR2(50),
  CREATE_DATE       VARCHAR2(50) not null,
  MODIFIED_DATE     VARCHAR2(50),
  TYPE              CHAR(1),
  ASSET_ACCOUNT     VARCHAR2(20),
  SITE_NO           VARCHAR2(50),
  LOGIN_COUNT       NUMBER(10),
  SEX               CHAR(1),
  PASSWORD_QUESTION VARCHAR2(200),
  PASSWORD_ANSWER   VARCHAR2(200),
  FACE_IMAGE        VARCHAR2(200),
  INVESTMENT_STYLE  VARCHAR2(1000),
  FACE_IMAGE_SMALL  VARCHAR2(200),
  SCORE             NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.T_SIM_USER_201504201111 to R_SISANSHDATA_QRY;

prompt
prompt Creating table T_SIM_USER_EXT
prompt =============================
prompt
create table SISANSHDATA.T_SIM_USER_EXT
(
  USER_ID     VARCHAR2(20) not null,
  NICKNAME    VARCHAR2(60),
  ID_CARD     VARCHAR2(60),
  ADRESS      VARCHAR2(150),
  KH_BANCH    VARCHAR2(150),
  KINDS       VARCHAR2(2),
  BANCH_NO    VARCHAR2(10),
  IS_INNER    VARCHAR2(10),
  APP_USER_ID VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_USER_EXT
  is '�û���չ��';
comment on column SISANSHDATA.T_SIM_USER_EXT.USER_ID
  is '����t_sim_user��id';
comment on column SISANSHDATA.T_SIM_USER_EXT.NICKNAME
  is '�ǳ�';
comment on column SISANSHDATA.T_SIM_USER_EXT.ID_CARD
  is '���֤����';
comment on column SISANSHDATA.T_SIM_USER_EXT.ADRESS
  is 'ͨѶסַ';
comment on column SISANSHDATA.T_SIM_USER_EXT.KH_BANCH
  is '�⿪��Ӫҵ��';
comment on column SISANSHDATA.T_SIM_USER_EXT.KINDS
  is '�û����1 �ʽ��˻��û� 2 ע���û�';
comment on column SISANSHDATA.T_SIM_USER_EXT.IS_INNER
  is '�Ƿ��ڲ���Ա 0:�ⲿ 1:֤ȯԱ�� 2:����Ա�� 3:Ͷ��';
comment on column SISANSHDATA.T_SIM_USER_EXT.APP_USER_ID
  is 'ͳһ��½ϵͳ�û�ID';
grant select, insert, update, delete on SISANSHDATA.T_SIM_USER_EXT to SISANSHOPR;

prompt
prompt Creating table T_SIM_USER_MESSAGE
prompt =================================
prompt
create table SISANSHDATA.T_SIM_USER_MESSAGE
(
  SERIAL_NUM       NUMBER(10) not null,
  USER_ID1         VARCHAR2(20),
  USER_ID2         VARCHAR2(20),
  CREATE_DATE      VARCHAR2(50),
  INITIATIVE_STATE CHAR(2),
  MESSAGE          VARCHAR2(500),
  PASSIVE_STATE    CHAR(2)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_USER_MESSAGE
  is '���������Ϣ��';
comment on column SISANSHDATA.T_SIM_USER_MESSAGE.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_USER_MESSAGE.USER_ID1
  is '�û�ID1';
comment on column SISANSHDATA.T_SIM_USER_MESSAGE.USER_ID2
  is '�û�ID2';
comment on column SISANSHDATA.T_SIM_USER_MESSAGE.CREATE_DATE
  is '������������';
comment on column SISANSHDATA.T_SIM_USER_MESSAGE.INITIATIVE_STATE
  is '���Ӻ���������������״̬:0��������;1ͨ������;2�ܾ�����';
comment on column SISANSHDATA.T_SIM_USER_MESSAGE.MESSAGE
  is '������֤��Ϣ';
comment on column SISANSHDATA.T_SIM_USER_MESSAGE.PASSIVE_STATE
  is '���Ӻ������뱻������״̬:0��������;1ͨ������;2�ܾ�����';
alter table SISANSHDATA.T_SIM_USER_MESSAGE
  add constraint PK_T_SIM_USER_MESSAGE primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_USER_MESSAGE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_USER_MESSAGE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_USER_MESSAGE to SISANSHOPR;

prompt
prompt Creating table T_SIM_USER_RELATION
prompt ==================================
prompt
create table SISANSHDATA.T_SIM_USER_RELATION
(
  SERIAL_NUM  NUMBER(10) not null,
  USER_ID1    VARCHAR2(20) not null,
  USER_ID2    VARCHAR2(20) not null,
  RELA_TYPE   VARCHAR2(20) not null,
  CREATE_DATE VARCHAR2(50)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_SIM_USER_RELATION
  is '�û�������';
comment on column SISANSHDATA.T_SIM_USER_RELATION.SERIAL_NUM
  is '����ID';
comment on column SISANSHDATA.T_SIM_USER_RELATION.USER_ID1
  is '�û�ID1';
comment on column SISANSHDATA.T_SIM_USER_RELATION.USER_ID2
  is '�û�ID2';
comment on column SISANSHDATA.T_SIM_USER_RELATION.RELA_TYPE
  is '�ͻ���������(friend:����,subscribe:����)';
comment on column SISANSHDATA.T_SIM_USER_RELATION.CREATE_DATE
  is '��������ʱ��';
alter table SISANSHDATA.T_SIM_USER_RELATION
  add constraint PK_T_SIM_USER_RELATION primary key (SERIAL_NUM)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_SIM_USER_RELATION to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_USER_RELATION to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_USER_RELATION to SISANSHOPR;

prompt
prompt Creating table T_SIM_VISITOR
prompt ============================
prompt
create table SISANSHDATA.T_SIM_VISITOR
(
  SERI_NUM     NUMBER(10) not null,
  FROM_USER_ID VARCHAR2(20),
  TO_USER_ID   VARCHAR2(20),
  CREATE_DATE  VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_VISITOR
  is '�ÿͱ�';
comment on column SISANSHDATA.T_SIM_VISITOR.SERI_NUM
  is '���';
comment on column SISANSHDATA.T_SIM_VISITOR.FROM_USER_ID
  is '�����û�id';
comment on column SISANSHDATA.T_SIM_VISITOR.TO_USER_ID
  is '�û�id';
comment on column SISANSHDATA.T_SIM_VISITOR.CREATE_DATE
  is '����ʱ��';
grant select, insert, update, delete on SISANSHDATA.T_SIM_VISITOR to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SIM_VISITOR to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SIM_VISITOR to SISANSHOPR;

prompt
prompt Creating table T_SIM_XJB_RECORD
prompt ===============================
prompt
create table SISANSHDATA.T_SIM_XJB_RECORD
(
  ACCOUNT_ID       NUMBER(10) not null,
  XJB_CODE         VARCHAR2(20),
  XJB_PROFIT       NUMBER(16,4),
  XJB_MARKET_VALUE NUMBER(16,4),
  USABLEBALANCE    NUMBER(16,4),
  CREATE_DATE      VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SIM_XJB_RECORD
  is '�ֽ����ݼ�¼��';
comment on column SISANSHDATA.T_SIM_XJB_RECORD.ACCOUNT_ID
  is '�ʻ�id';
comment on column SISANSHDATA.T_SIM_XJB_RECORD.XJB_CODE
  is '��Ʒ����';
comment on column SISANSHDATA.T_SIM_XJB_RECORD.XJB_PROFIT
  is '�����ֽ�����';
comment on column SISANSHDATA.T_SIM_XJB_RECORD.XJB_MARKET_VALUE
  is '�ֽ���ֵ';
comment on column SISANSHDATA.T_SIM_XJB_RECORD.USABLEBALANCE
  is '�����ʽ�';
comment on column SISANSHDATA.T_SIM_XJB_RECORD.CREATE_DATE
  is '��������';
grant select, insert, update, delete on SISANSHDATA.T_SIM_XJB_RECORD to SISANSHOPR;

prompt
prompt Creating table T_SITE
prompt =====================
prompt
create table SISANSHDATA.T_SITE
(
  ID            NUMBER(10) not null,
  SITENO        VARCHAR2(50) not null,
  NAME          VARCHAR2(50) not null,
  STATE         NUMBER(10) not null,
  IS_MAIN       NUMBER(10) not null,
  PUBLISH_PATH  VARCHAR2(255),
  DESCRIPTION   VARCHAR2(200),
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(20),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(20),
  GROUP_ID      VARCHAR2(64)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SITE
  is 'վ���';
comment on column SISANSHDATA.T_SITE.ID
  is 'ID';
comment on column SISANSHDATA.T_SITE.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_SITE.NAME
  is 'NAME';
comment on column SISANSHDATA.T_SITE.STATE
  is 'STATE';
comment on column SISANSHDATA.T_SITE.IS_MAIN
  is 'IS_MAIN';
comment on column SISANSHDATA.T_SITE.PUBLISH_PATH
  is 'PUBLISH_PATH';
comment on column SISANSHDATA.T_SITE.DESCRIPTION
  is 'DESCRIPTION';
comment on column SISANSHDATA.T_SITE.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_SITE.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_SITE.MODIFIED_BY
  is 'MODIFIED_BY';
comment on column SISANSHDATA.T_SITE.MODIFIED_DATE
  is 'MODIFIED_DATE';
comment on column SISANSHDATA.T_SITE.GROUP_ID
  is '����ID';
alter table SISANSHDATA.T_SITE
  add constraint PK_T_SITE primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select, insert, update, delete on SISANSHDATA.T_SITE to SISANSHOPR;

prompt
prompt Creating table T_SUBSCRIBE
prompt ==========================
prompt
create table SISANSHDATA.T_SUBSCRIBE
(
  SUBSCRIBE_ID    NUMBER(10) not null,
  SUBSCRIBE_STATE CHAR(1),
  USER_ID         VARCHAR2(20),
  SUBSCRIBE_PRICE NUMBER(10),
  SUBSCRIBE_TYPE  CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SUBSCRIBE
  is '�������Ա�';
comment on column SISANSHDATA.T_SUBSCRIBE.SUBSCRIBE_ID
  is '���к�';
comment on column SISANSHDATA.T_SUBSCRIBE.SUBSCRIBE_STATE
  is '����״̬0�ر�1����';
comment on column SISANSHDATA.T_SUBSCRIBE.USER_ID
  is '�û�id';
comment on column SISANSHDATA.T_SUBSCRIBE.SUBSCRIBE_PRICE
  is '���Ļ��ּ۸�30��Ϊ������λ';
comment on column SISANSHDATA.T_SUBSCRIBE.SUBSCRIBE_TYPE
  is '��������0���ֶ���1�ֽ���';
grant select, insert, update, delete on SISANSHDATA.T_SUBSCRIBE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SUBSCRIBE to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SUBSCRIBE to SISANSHOPR;

prompt
prompt Creating table T_SUBSCRIBE_USER
prompt ===============================
prompt
create table SISANSHDATA.T_SUBSCRIBE_USER
(
  SERI_NUM       NUMBER(10) not null,
  FROM_USER_ID   VARCHAR2(20) not null,
  TO_USER_ID     VARCHAR2(20) not null,
  SUBSCRIBE_TERM NUMBER not null,
  START_DATE     VARCHAR2(30) not null,
  END_DATE       VARCHAR2(30) not null,
  STATE          CHAR(1) not null,
  SUBSCRIBE_TYPE CHAR(1)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table SISANSHDATA.T_SUBSCRIBE_USER
  is '�����û�';
comment on column SISANSHDATA.T_SUBSCRIBE_USER.SERI_NUM
  is '���к�';
comment on column SISANSHDATA.T_SUBSCRIBE_USER.FROM_USER_ID
  is '�������û�id';
comment on column SISANSHDATA.T_SUBSCRIBE_USER.TO_USER_ID
  is '��������id';
comment on column SISANSHDATA.T_SUBSCRIBE_USER.SUBSCRIBE_TERM
  is '��������';
comment on column SISANSHDATA.T_SUBSCRIBE_USER.START_DATE
  is '���Ŀ�ʼʱ��';
comment on column SISANSHDATA.T_SUBSCRIBE_USER.END_DATE
  is '���Ľ�ֹʱ��';
comment on column SISANSHDATA.T_SUBSCRIBE_USER.STATE
  is '״̬0ȡ������1����2����';
comment on column SISANSHDATA.T_SUBSCRIBE_USER.SUBSCRIBE_TYPE
  is '0���ֶ���1�ֽ���';
grant select, insert, update, delete on SISANSHDATA.T_SUBSCRIBE_USER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_SUBSCRIBE_USER to R_SISANSHDATA_QRY;
grant select, insert, update, delete on SISANSHDATA.T_SUBSCRIBE_USER to SISANSHOPR;

prompt
prompt Creating table T_TEMPLATE
prompt =========================
prompt
create table SISANSHDATA.T_TEMPLATE
(
  ID            NUMBER(10) not null,
  NAME          VARCHAR2(255) not null,
  CATALOG_ID    NUMBER(10) not null,
  FILEPATH      VARCHAR2(255),
  TYPE          NUMBER(10) not null,
  STATE         NUMBER(10) not null,
  SITENO        VARCHAR2(50) not null,
  CREATE_BY     VARCHAR2(50),
  CREATE_DATE   VARCHAR2(20),
  MODIFIED_BY   VARCHAR2(50),
  MODIFIED_DATE VARCHAR2(20),
  CONTENT       CLOB,
  ENCODING      VARCHAR2(20)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_TEMPLATE
  is 'վ��ģ��';
comment on column SISANSHDATA.T_TEMPLATE.ID
  is 'ID';
comment on column SISANSHDATA.T_TEMPLATE.NAME
  is 'NAME';
comment on column SISANSHDATA.T_TEMPLATE.CATALOG_ID
  is 'CATALOG_ID';
comment on column SISANSHDATA.T_TEMPLATE.FILEPATH
  is 'FILEPATH';
comment on column SISANSHDATA.T_TEMPLATE.TYPE
  is 'TYPE';
comment on column SISANSHDATA.T_TEMPLATE.STATE
  is 'STATE';
comment on column SISANSHDATA.T_TEMPLATE.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_TEMPLATE.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_TEMPLATE.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_TEMPLATE.MODIFIED_BY
  is 'MODIFIED_BY';
comment on column SISANSHDATA.T_TEMPLATE.MODIFIED_DATE
  is 'MODIFIED_DATE';
comment on column SISANSHDATA.T_TEMPLATE.CONTENT
  is 'CONTENT';
comment on column SISANSHDATA.T_TEMPLATE.ENCODING
  is '�ļ����룬ȱʡΪGBK';
alter table SISANSHDATA.T_TEMPLATE
  add constraint PK_T_TEMPLATE primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_TEMPLATE to SISANSHOPR;

prompt
prompt Creating table T_TEMPLATE_HISTORY
prompt =================================
prompt
create table SISANSHDATA.T_TEMPLATE_HISTORY
(
  id          NUMBER(10) not null,
  template_id NUMBER(10),
  CREATE_BY   VARCHAR2(50),
  CREATE_DATE VARCHAR2(20),
  CONTENT     CLOB
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_TEMPLATE_HISTORY
  is 'վ��ģ��ʷ����';
comment on column SISANSHDATA.T_TEMPLATE_HISTORY.id
  is 'ID';
comment on column SISANSHDATA.T_TEMPLATE_HISTORY.template_id
  is 'ģ��id';
comment on column SISANSHDATA.T_TEMPLATE_HISTORY.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_TEMPLATE_HISTORY.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_TEMPLATE_HISTORY.CONTENT
  is 'CONTENT';
alter table SISANSHDATA.T_TEMPLATE_HISTORY
  add constraint PK_T_TEMPLATE_HISTORY primary key (id)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_TEMPLATE_HISTORY to SISANSHOPR;

prompt
prompt Creating table T_TEMPLATE_VAR
prompt =============================
prompt
create table SISANSHDATA.T_TEMPLATE_VAR
(
  ID          NUMBER(10) not null,
  ITEM_NAME   VARCHAR2(255) not null,
  ITEM_VALUE  VARCHAR2(4000),
  STATE       NUMBER(10) not null,
  SITENO      VARCHAR2(10),
  CREATE_BY   VARCHAR2(50),
  CREATE_DATE VARCHAR2(50),
  DESCRIPTION VARCHAR2(200)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table SISANSHDATA.T_TEMPLATE_VAR
  is 'T_TEMPLATE_VAR';
comment on column SISANSHDATA.T_TEMPLATE_VAR.ID
  is 'ID';
comment on column SISANSHDATA.T_TEMPLATE_VAR.ITEM_NAME
  is 'ITEM_NAME';
comment on column SISANSHDATA.T_TEMPLATE_VAR.ITEM_VALUE
  is 'ITEM_VALUE';
comment on column SISANSHDATA.T_TEMPLATE_VAR.STATE
  is 'STATE';
comment on column SISANSHDATA.T_TEMPLATE_VAR.SITENO
  is 'SITENO';
comment on column SISANSHDATA.T_TEMPLATE_VAR.CREATE_BY
  is 'CREATE_BY';
comment on column SISANSHDATA.T_TEMPLATE_VAR.CREATE_DATE
  is 'CREATE_DATE';
comment on column SISANSHDATA.T_TEMPLATE_VAR.DESCRIPTION
  is 'DESCRIPTION';
alter table SISANSHDATA.T_TEMPLATE_VAR
  add constraint PK_T_TEMPLATE_VAR primary key (ID)
  using index 
  tablespace SISANSHDATA
  pctfree 10
  initrans 2
  maxtrans 255;
grant select, insert, update, delete on SISANSHDATA.T_TEMPLATE_VAR to SISANSHOPR;

prompt
prompt Creating table USER_1218BAK
prompt ===========================
prompt
create table SISANSHDATA.USER_1218BAK
(
  USER_ID           VARCHAR2(20) not null,
  NAME              VARCHAR2(50),
  LOGIN_ID          VARCHAR2(30) not null,
  PASSWORD          VARCHAR2(50) not null,
  SALT              CHAR(6),
  STATE             NUMBER(10),
  LAST_TIME         VARCHAR2(20),
  EMAIL             VARCHAR2(50),
  PHONE             VARCHAR2(50),
  MOBILE            VARCHAR2(50),
  CREATE_DATE       VARCHAR2(50) not null,
  MODIFIED_DATE     VARCHAR2(50),
  TYPE              CHAR(1),
  ASSET_ACCOUNT     VARCHAR2(20),
  SITE_NO           VARCHAR2(50),
  LOGIN_COUNT       NUMBER(10),
  SEX               CHAR(1),
  PASSWORD_QUESTION VARCHAR2(200),
  PASSWORD_ANSWER   VARCHAR2(200),
  FACE_IMAGE        VARCHAR2(200),
  INVESTMENT_STYLE  VARCHAR2(1000),
  FACE_IMAGE_SMALL  VARCHAR2(200),
  SCORE             NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.USER_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table USER_1228BAK
prompt ===========================
prompt
create table SISANSHDATA.USER_1228BAK
(
  USER_ID           VARCHAR2(20) not null,
  NAME              VARCHAR2(50),
  LOGIN_ID          VARCHAR2(30) not null,
  PASSWORD          VARCHAR2(50) not null,
  SALT              CHAR(6),
  STATE             NUMBER(10),
  LAST_TIME         VARCHAR2(20),
  EMAIL             VARCHAR2(50),
  PHONE             VARCHAR2(50),
  MOBILE            VARCHAR2(50),
  CREATE_DATE       VARCHAR2(50) not null,
  MODIFIED_DATE     VARCHAR2(50),
  TYPE              CHAR(1),
  ASSET_ACCOUNT     VARCHAR2(20),
  SITE_NO           VARCHAR2(50),
  LOGIN_COUNT       NUMBER(10),
  SEX               CHAR(1),
  PASSWORD_QUESTION VARCHAR2(200),
  PASSWORD_ANSWER   VARCHAR2(200),
  FACE_IMAGE        VARCHAR2(200),
  INVESTMENT_STYLE  VARCHAR2(1000),
  FACE_IMAGE_SMALL  VARCHAR2(200),
  SCORE             NUMBER(10)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.USER_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table VISITOR_1218BAK
prompt ==============================
prompt
create table SISANSHDATA.VISITOR_1218BAK
(
  SERI_NUM     NUMBER(10) not null,
  FROM_USER_ID VARCHAR2(20),
  TO_USER_ID   VARCHAR2(20),
  CREATE_DATE  VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.VISITOR_1218BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating table VISITOR_1228BAK
prompt ==============================
prompt
create table SISANSHDATA.VISITOR_1228BAK
(
  SERI_NUM     NUMBER(10) not null,
  FROM_USER_ID VARCHAR2(20),
  TO_USER_ID   VARCHAR2(20),
  CREATE_DATE  VARCHAR2(30)
)
tablespace SISANSHDATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
grant select on SISANSHDATA.VISITOR_1228BAK to R_SISANSHDATA_QRY;

prompt
prompt Creating sequence ACTIVITY_COMMENT_SEQ
prompt ======================================
prompt
create sequence SISANSHDATA.ACTIVITY_COMMENT_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.ACTIVITY_COMMENT_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.ACTIVITY_COMMENT_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.ACTIVITY_COMMENT_SEQ to SISANSHOPR;


prompt
prompt Creating sequence RZRQ_CREDIT_CONTRACTS_SEQ
prompt ===========================================
prompt
create sequence SISANSHDATA.RZRQ_CREDIT_CONTRACTS_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 2883
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.RZRQ_CREDIT_CONTRACTS_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.RZRQ_CREDIT_CONTRACTS_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.RZRQ_CREDIT_CONTRACTS_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SEQ_ARTICLE
prompt =============================
prompt
create sequence SISANSHDATA.SEQ_ARTICLE
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_ARTICLE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_ARTICLE_CONTENT
prompt =====================================
prompt
create sequence SISANSHDATA.SEQ_ARTICLE_CONTENT
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_ARTICLE_CONTENT to SISANSHOPR;


prompt
prompt Creating sequence SEQ_B_CLIENT_BUSINFO
prompt ======================================
prompt
create sequence SISANSHDATA.SEQ_B_CLIENT_BUSINFO
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_B_CLIENT_BUSINFO to SISANSHOPR;


prompt
prompt Creating sequence SEQ_B_CLIENT_MSG
prompt ==================================
prompt
create sequence SISANSHDATA.SEQ_B_CLIENT_MSG
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_B_CLIENT_MSG to SISANSHOPR;


prompt
prompt Creating sequence SEQ_B_CLINETMGR
prompt =================================
prompt
create sequence SISANSHDATA.SEQ_B_CLINETMGR
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_B_CLINETMGR to SISANSHOPR;


prompt
prompt Creating sequence SEQ_CATALOG
prompt =============================
prompt
create sequence SISANSHDATA.SEQ_CATALOG
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_CATALOG to SISANSHOPR;


prompt
prompt Creating sequence SEQ_DEMO
prompt ==========================
prompt
create sequence SISANSHDATA.SEQ_DEMO
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_DEMO to SISANSHOPR;


prompt
prompt Creating sequence SEQ_DEMO_GROUP
prompt ================================
prompt
create sequence SISANSHDATA.SEQ_DEMO_GROUP
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_DEMO_GROUP to SISANSHOPR;


prompt
prompt Creating sequence SEQ_NOTEPAD_ID
prompt ================================
prompt
create sequence SISANSHDATA.SEQ_NOTEPAD_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 4181
increment by 1
cache 20;
grant select on SISANSHDATA.SEQ_NOTEPAD_ID to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_BUSI_LOG
prompt ===================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_BUSI_LOG
minvalue 1
maxvalue 999999999999
start with 31742
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_BUSI_LOG to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_CATALOG
prompt ==================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_CATALOG
minvalue 1
maxvalue 999999999999
start with 1020
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_CATALOG to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_CATALOG_FUNCTION
prompt ===========================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_CATALOG_FUNCTION
minvalue 1
maxvalue 999999999999
start with 1046
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_CATALOG_FUNCTION to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_CATALOG_PAGEINFO
prompt ===========================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_CATALOG_PAGEINFO
minvalue 1
maxvalue 999999999999
start with 1090
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_CATALOG_PAGEINFO to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_COMMON_TEMPLATE
prompt ==========================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_COMMON_TEMPLATE
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_COMMON_TEMPLATE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_CONFIG
prompt =================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_CONFIG
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_CONFIG to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_ENUM_TYPE
prompt ====================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_ENUM_TYPE
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_ENUM_TYPE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_ENUM_VALUE
prompt =====================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_ENUM_VALUE
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_ENUM_VALUE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_LOG
prompt ==============================
prompt
create sequence SISANSHDATA.SEQ_PLAT_LOG
minvalue 1
maxvalue 999999999999
start with 2341
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_LOG to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_LOG_CONTENT
prompt ======================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_LOG_CONTENT
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_LOG_CONTENT to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_PASS_LOG
prompt ===================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_PASS_LOG
minvalue 1
maxvalue 999999999999
start with 1015
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_PASS_LOG to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_ROLE
prompt ===============================
prompt
create sequence SISANSHDATA.SEQ_PLAT_ROLE
minvalue 1
maxvalue 999999999999
start with 1001
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_ROLE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_ROLE_CATALOG_RIGHTS
prompt ==============================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_ROLE_CATALOG_RIGHTS
minvalue 1
maxvalue 999999999999
start with 1003
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_ROLE_CATALOG_RIGHTS to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_ROLE_FUNCTION_RIGHTS
prompt ===============================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_ROLE_FUNCTION_RIGHTS
minvalue 1
maxvalue 999999999999
start with 1003
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_ROLE_FUNCTION_RIGHTS to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_ROLE_SORT
prompt ====================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_ROLE_SORT
minvalue 1
maxvalue 999999999999
start with 1002
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_ROLE_SORT to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_ROLE_USER
prompt ====================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_ROLE_USER
minvalue 1
maxvalue 999999999999
start with 1005
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_ROLE_USER to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_USER
prompt ===============================
prompt
create sequence SISANSHDATA.SEQ_PLAT_USER
minvalue 1
maxvalue 999999999999
start with 1015
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_USER to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PLAT_USER_INFO
prompt ====================================
prompt
create sequence SISANSHDATA.SEQ_PLAT_USER_INFO
minvalue 1
maxvalue 999999999999
start with 1011
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PLAT_USER_INFO to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PORTFOLIO_SUM
prompt ===================================
prompt
create sequence SISANSHDATA.SEQ_PORTFOLIO_SUM
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 10;
grant select, alter on SISANSHDATA.SEQ_PORTFOLIO_SUM to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PUBLISH_ATTACH
prompt ====================================
prompt
create sequence SISANSHDATA.SEQ_PUBLISH_ATTACH
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PUBLISH_ATTACH to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PUBLISH_LOG
prompt =================================
prompt
create sequence SISANSHDATA.SEQ_PUBLISH_LOG
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PUBLISH_LOG to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PUBLISH_PLAN
prompt ==================================
prompt
create sequence SISANSHDATA.SEQ_PUBLISH_PLAN
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PUBLISH_PLAN to SISANSHOPR;


prompt
prompt Creating sequence SEQ_PUBLISH_QUEUE
prompt ===================================
prompt
create sequence SISANSHDATA.SEQ_PUBLISH_QUEUE
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_PUBLISH_QUEUE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_RECOMMEND_STOCK
prompt =====================================
prompt
create sequence SISANSHDATA.SEQ_RECOMMEND_STOCK
minvalue 1
maxvalue 9999999999999999999999999999
start with 6344
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_RECOMMEND_STOCK to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_RECOMMEND_STOCK to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_RECOMMEND_STOCK to SISANSHOPR;


prompt
prompt Creating sequence SEQ_ROLE_CATALOG_RIGHT
prompt ========================================
prompt
create sequence SISANSHDATA.SEQ_ROLE_CATALOG_RIGHT
minvalue 1
maxvalue 999999999999
start with 1001
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_ROLE_CATALOG_RIGHT to SISANSHOPR;


prompt
prompt Creating sequence SEQ_RQ_MATTER
prompt ===============================
prompt
create sequence SISANSHDATA.SEQ_RQ_MATTER
minvalue 1000
maxvalue 999999999999999
start with 1960
increment by 1
cache 20;
grant select, alter on SISANSHDATA.SEQ_RQ_MATTER to SISANSHOPR;


prompt
prompt Creating sequence SEQ_RZRQ_ACCOUNT_FORCESELL
prompt ============================================
prompt
create sequence SISANSHDATA.SEQ_RZRQ_ACCOUNT_FORCESELL
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_RZRQ_ACCOUNT_FORCESELL to SISANSHOPR;


prompt
prompt Creating sequence SEQ_RZRQ_ACCOUNT_MAINTAIN_RATE
prompt ================================================
prompt
create sequence SISANSHDATA.SEQ_RZRQ_ACCOUNT_MAINTAIN_RATE
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_RZRQ_ACCOUNT_MAINTAIN_RATE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_RZRQ_ARTICLE
prompt ==================================
prompt
create sequence SISANSHDATA.SEQ_RZRQ_ARTICLE
minvalue 1
maxvalue 99999999999999999999
start with 61
increment by 1
cache 20;
grant select, alter on SISANSHDATA.SEQ_RZRQ_ARTICLE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_RZRQ_COLLATERAL
prompt =====================================
prompt
create sequence SISANSHDATA.SEQ_RZRQ_COLLATERAL
minvalue 1000
maxvalue 99999999999999
start with 3820
increment by 1
cache 20;
grant select, alter on SISANSHDATA.SEQ_RZRQ_COLLATERAL to SISANSHOPR;


prompt
prompt Creating sequence SEQ_RZRQ_CONSULT_INFO
prompt =======================================
prompt
create sequence SISANSHDATA.SEQ_RZRQ_CONSULT_INFO
minvalue 1
maxvalue 99999999999999999999
start with 222
increment by 1
cache 20;
grant select, alter on SISANSHDATA.SEQ_RZRQ_CONSULT_INFO to SISANSHOPR;


prompt
prompt Creating sequence SEQ_RZ_MATTER
prompt ===============================
prompt
create sequence SISANSHDATA.SEQ_RZ_MATTER
minvalue 1000
maxvalue 99999999999999
start with 1940
increment by 1
cache 20;
grant select, alter on SISANSHDATA.SEQ_RZ_MATTER to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SCORE_FLOW
prompt ================================
prompt
create sequence SISANSHDATA.SEQ_SCORE_FLOW
minvalue 1
maxvalue 9999999999999999999999999999
start with 319824
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SCORE_FLOW to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SCORE_FLOW to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SCORE_FLOW to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SEQUENCE
prompt ==============================
prompt
create sequence SISANSHDATA.SEQ_SEQUENCE
minvalue 1
maxvalue 999999999999
start with 1002
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_SEQUENCE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_ACCOUNT
prompt =================================
prompt
create sequence SISANSHDATA.SEQ_SIM_ACCOUNT
minvalue 1
maxvalue 999999999999
start with 3000281
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_SIM_ACCOUNT to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_ACCOUNT_CHANGE
prompt ========================================
prompt
create sequence SISANSHDATA.SEQ_SIM_ACCOUNT_CHANGE
minvalue 1
maxvalue 999999999999
start with 1544
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_SIM_ACCOUNT_CHANGE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_ACCOUNT_SEQ
prompt =====================================
prompt
create sequence SISANSHDATA.SEQ_SIM_ACCOUNT_SEQ
minvalue 1
maxvalue 999999999999
start with 3000135
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_SIM_ACCOUNT_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_ACTIVITY
prompt ==================================
prompt
create sequence SISANSHDATA.SEQ_SIM_ACTIVITY
minvalue 1
maxvalue 9999999999999999999999999999
start with 1180
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_ACTIVITY_APPLY
prompt ========================================
prompt
create sequence SISANSHDATA.SEQ_SIM_ACTIVITY_APPLY
minvalue 1
maxvalue 9999999999999999999999999999
start with 1060
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY_APPLY to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY_APPLY to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY_APPLY to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_ACTIVITY_STOCKPOOL
prompt ============================================
prompt
create sequence SISANSHDATA.SEQ_SIM_ACTIVITY_STOCKPOOL
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY_STOCKPOOL to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY_STOCKPOOL to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY_STOCKPOOL to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_ACTIVITY_STOCKTYPE
prompt ============================================
prompt
create sequence SISANSHDATA.SEQ_SIM_ACTIVITY_STOCKTYPE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1150
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY_STOCKTYPE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY_STOCKTYPE to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SIM_ACTIVITY_STOCKTYPE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_BONUS
prompt ===============================
prompt
create sequence SISANSHDATA.SEQ_SIM_BONUS
minvalue 1
maxvalue 9999999999999999999999999999
start with 14657999
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SIM_BONUS to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SIM_BONUS to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SIM_BONUS to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_CONVERT
prompt =================================
prompt
create sequence SISANSHDATA.SEQ_SIM_CONVERT
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 10;
grant select, alter on SISANSHDATA.SEQ_SIM_CONVERT to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_CONVERT_RECORD
prompt ========================================
prompt
create sequence SISANSHDATA.SEQ_SIM_CONVERT_RECORD
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 10;
grant select, alter on SISANSHDATA.SEQ_SIM_CONVERT_RECORD to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_EXEC_COLLECT
prompt ======================================
prompt
create sequence SISANSHDATA.SEQ_SIM_EXEC_COLLECT
minvalue 1
maxvalue 999999999999
start with 1
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_SIM_EXEC_COLLECT to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_SCHOOL
prompt ================================
prompt
create sequence SISANSHDATA.SEQ_SIM_SCHOOL
minvalue 1
maxvalue 999999999999
start with 20
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_SIM_SCHOOL to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_TRADE_BLACKLIST
prompt =========================================
prompt
create sequence SISANSHDATA.SEQ_SIM_TRADE_BLACKLIST
minvalue 1
maxvalue 999999999999
start with 17
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_SIM_TRADE_BLACKLIST to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_TRADE_POOL
prompt ====================================
prompt
create sequence SISANSHDATA.SEQ_SIM_TRADE_POOL
minvalue 1
maxvalue 9999999999999999999999999999
start with 20650
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SIM_TRADE_POOL to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SIM_TRADE_POOL to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SIM_TRADE_POOL to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_USER
prompt ==============================
prompt
create sequence SISANSHDATA.SEQ_SIM_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 93557
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SIM_USER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SIM_USER to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SIM_USER to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SIM_VISITOR
prompt =================================
prompt
create sequence SISANSHDATA.SEQ_SIM_VISITOR
minvalue 1
maxvalue 9999999999999999999999999999
start with 82054
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SIM_VISITOR to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SIM_VISITOR to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SIM_VISITOR to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SUBSCRIBE
prompt ===============================
prompt
create sequence SISANSHDATA.SEQ_SUBSCRIBE
minvalue 1
maxvalue 9999999999999999999999999999
start with 8779
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SUBSCRIBE to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SUBSCRIBE to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SUBSCRIBE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_SUBSCRIBE_USER
prompt ====================================
prompt
create sequence SISANSHDATA.SEQ_SUBSCRIBE_USER
minvalue 1
maxvalue 9999999999999999999999999999
start with 2380
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SEQ_SUBSCRIBE_USER to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SEQ_SUBSCRIBE_USER to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SEQ_SUBSCRIBE_USER to SISANSHOPR;


prompt
prompt Creating sequence SEQ_TEMPLATE
prompt ==============================
prompt
create sequence SISANSHDATA.SEQ_TEMPLATE
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_TEMPLATE to SISANSHOPR;


prompt
prompt Creating sequence SEQ_TEMPLATE_HISTORY
prompt ======================================
prompt
create sequence SISANSHDATA.SEQ_TEMPLATE_HISTORY
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_TEMPLATE_HISTORY to SISANSHOPR;


prompt
prompt Creating sequence SEQ_TEMPLATE_VAR
prompt ==================================
prompt
create sequence SISANSHDATA.SEQ_TEMPLATE_VAR
minvalue 1
maxvalue 999999999999
start with 1000
increment by 1
nocache;
grant select, alter on SISANSHDATA.SEQ_TEMPLATE_VAR to SISANSHOPR;


prompt
prompt Creating sequence SEQ_VISIT_ID
prompt ==============================
prompt
create sequence SISANSHDATA.SEQ_VISIT_ID
minvalue 1
maxvalue 999999999999999999999999999
start with 621
increment by 1
cache 20;
grant select on SISANSHDATA.SEQ_VISIT_ID to SISANSHOPR;


prompt
prompt Creating sequence SIM_ACCOUNT_SEQ
prompt =================================
prompt
create sequence SISANSHDATA.SIM_ACCOUNT_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 2299405
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_ACCOUNT_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_ACCOUNT_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_ACCOUNT_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_ACTIVITY_SEQ
prompt ==================================
prompt
create sequence SISANSHDATA.SIM_ACTIVITY_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_ACTIVITY_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_ACTIVITY_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_ACTIVITY_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_CANCEL_ORDER_SEQ
prompt ======================================
prompt
create sequence SISANSHDATA.SIM_CANCEL_ORDER_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 86720
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_CANCEL_ORDER_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_CANCEL_ORDER_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_CANCEL_ORDER_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_COMPLETE_PROFIT_SEQ
prompt =========================================
prompt
create sequence SISANSHDATA.SIM_COMPLETE_PROFIT_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 126024
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_COMPLETE_PROFIT_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_COMPLETE_PROFIT_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_COMPLETE_PROFIT_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_EXEC_AGGE_SEQ
prompt ===================================
prompt
create sequence SISANSHDATA.SIM_EXEC_AGGE_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 151531397
increment by 1
cache 30
order;
grant select on SISANSHDATA.SIM_EXEC_AGGE_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_EXEC_AGGE_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_EXEC_AGGE_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_EXEC_COLLECT_SEQ
prompt ======================================
prompt
create sequence SISANSHDATA.SIM_EXEC_COLLECT_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 16171
increment by 1
cache 20;
grant select, alter on SISANSHDATA.SIM_EXEC_COLLECT_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_FARE_SEQ
prompt ==============================
prompt
create sequence SISANSHDATA.SIM_FARE_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1030
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_FARE_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_FARE_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_FARE_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_GROUP_SEQ
prompt ===============================
prompt
create sequence SISANSHDATA.SIM_GROUP_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_GROUP_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_GROUP_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_GROUP_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_GROUP_USER_SEQ
prompt ====================================
prompt
create sequence SISANSHDATA.SIM_GROUP_USER_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_GROUP_USER_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_GROUP_USER_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_GROUP_USER_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_HIST_HOLD_STOCK_SEQ
prompt =========================================
prompt
create sequence SISANSHDATA.SIM_HIST_HOLD_STOCK_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 648732
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_HIST_HOLD_STOCK_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_HIST_HOLD_STOCK_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_HIST_HOLD_STOCK_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_HIST_STOCKPOLL_SEQ
prompt ========================================
prompt
create sequence SISANSHDATA.SIM_HIST_STOCKPOLL_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_HIST_STOCKPOLL_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_HIST_STOCKPOLL_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_HIST_STOCKPOLL_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_HOLD_STOCK_SEQ
prompt ====================================
prompt
create sequence SISANSHDATA.SIM_HOLD_STOCK_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 158367
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_HOLD_STOCK_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_HOLD_STOCK_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_HOLD_STOCK_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_INFORMATION_SEQ
prompt =====================================
prompt
create sequence SISANSHDATA.SIM_INFORMATION_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_INFORMATION_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_INFORMATION_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_INFORMATION_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_SELF_STOCK_SEQ
prompt ====================================
prompt
create sequence SISANSHDATA.SIM_SELF_STOCK_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_SELF_STOCK_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_SELF_STOCK_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_SELF_STOCK_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_SETTLEMENT_LOG_SEQ
prompt ========================================
prompt
create sequence SISANSHDATA.SIM_SETTLEMENT_LOG_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 53872
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_SETTLEMENT_LOG_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_SETTLEMENT_LOG_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_SETTLEMENT_LOG_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_STOCKPOLL_SEQ
prompt ===================================
prompt
create sequence SISANSHDATA.SIM_STOCKPOLL_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_STOCKPOLL_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_STOCKPOLL_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_STOCKPOLL_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_TODAY_ORDER_SEQ
prompt =====================================
prompt
create sequence SISANSHDATA.SIM_TODAY_ORDER_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 12773539
increment by 1
cache 30
order;
grant select on SISANSHDATA.SIM_TODAY_ORDER_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_TODAY_ORDER_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_TODAY_ORDER_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_USER_MESSAGE_SEQ
prompt ======================================
prompt
create sequence SISANSHDATA.SIM_USER_MESSAGE_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_USER_MESSAGE_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_USER_MESSAGE_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_USER_MESSAGE_SEQ to SISANSHOPR;


prompt
prompt Creating sequence SIM_USER_RELATION_SEQ
prompt =======================================
prompt
create sequence SISANSHDATA.SIM_USER_RELATION_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 1000
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.SIM_USER_RELATION_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.SIM_USER_RELATION_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.SIM_USER_RELATION_SEQ to SISANSHOPR;


prompt
prompt Creating sequence T_RECOMMEND_STATISTICS_SEQ
prompt ============================================
prompt
create sequence SISANSHDATA.T_RECOMMEND_STATISTICS_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 5290
increment by 1
cache 30
cycle;
grant select on SISANSHDATA.T_RECOMMEND_STATISTICS_SEQ to R_SISANSHDATA_DML;
grant select on SISANSHDATA.T_RECOMMEND_STATISTICS_SEQ to R_SISANSHDATA_QRY;
grant select on SISANSHDATA.T_RECOMMEND_STATISTICS_SEQ to SISANSHOPR;



spool off
