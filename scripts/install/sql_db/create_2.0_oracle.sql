create sequence SEQ_LAU_CRON start with 1 increment by 1;
create sequence SEQ_LAU_INBOX start with 1 increment by 1;
create sequence SEQ_LAU_INBOX_EVENT start with 1 increment by 1;
create sequence SEQ_LAU_INBOX_PAYLOAD start with 1 increment by 1;
create sequence SEQ_LAU_INBOX_PAYLOAD_PROP start with 1 increment by 1;
create sequence SEQ_LAU_INBOX_PROP start with 1 increment by 1;
create sequence SEQ_LAU_INTERC_INST_PROP start with 1 increment by 1;
create sequence SEQ_LAU_INTERC_RULE start with 1 increment by 1;
create sequence SEQ_LAU_INTERCEPTOR start with 1 increment by 1;
create sequence SEQ_LAU_OUTBOX start with 1 increment by 1;
create sequence SEQ_LAU_OUTBOX_EVENT start with 1 increment by 1;
create sequence SEQ_LAU_OUTBOX_PAYLOAD start with 1 increment by 1;
create sequence SEQ_LAU_OUTBOX_PAYLOAD_PROP start with 1 increment by 1;
create sequence SEQ_LAU_OUTBOX_PROP start with 1 increment by 1;
create sequence SEQ_LAU_PROC_INST_PROP start with 1 increment by 1;
create sequence SEQ_LAU_PROCESS_INSTANCE start with 1 increment by 1;
create sequence SEQ_LAU_PROCESSOR start with 1 increment by 1;
create sequence SEQ_LAU_PROCESSOR_RULE start with 1 increment by 1;
create sequence SEQ_LAU_TASK_INSTANCE start with 1 increment by 1;
create sequence SEQ_LAU_TASK_PROP start with 1 increment by 1;
create table LAU_APPLICATION (application_Id varchar2(512 char) not null, NAME varchar2(512 char), DESCRIPTION varchar2(1024 char), EMAIL varchar2(512 char), Active_Date_From timestamp, Active_Date_To timestamp, primary key (application_Id));
create table lau_application_sedbox (applicationId varchar2(512 char) not null, lau_box varchar2(512 char) not null);
create table LAU_BOX (LOCAL_BOX_NAME varchar2(512 char) not null, Active_Date_From timestamp, Active_Date_To timestamp, primary key (LOCAL_BOX_NAME));
create table LAU_CERT_PASSWD (ALIAS varchar2(64 char) not null, PASSWORD varchar2(64 char), KEY_PASSWORD number(1,0), primary key (ALIAS));
create table LAU_CRON (ID number(19,0) not null, NAME varchar2(128 char), ACTIVE number(1,0), CRON_SECOND varchar2(64 char), CRON_MINUTE varchar2(64 char), CRON_HOUR varchar2(64 char), CRON_DAY_OF_MONTH varchar2(64 char), CRON_MONTH varchar2(64 char), CRON_DAY_OF_WEEK varchar2(64 char), CRON_IGNORE_ON_WORK_FREE_DAYS number(1,0), primary key (ID));
create table LAU_INBOX (ID number(19,0) not null, MSG_ID varchar2(256 char) not null, REF_TO_MSG_ID varchar2(256 char), SENDER_MSG_ID varchar2(256 char), SERVICE varchar2(512 char) not null, ACTION varchar2(512 char) not null, CONV_Id varchar2(512 char), SUBJECT varchar2(512 char), RECEIVER_EBOX varchar2(512 char) not null, RECEIVER_NAME varchar2(512 char), SENDER_EBOX varchar2(512 char) not null, SENDER_NAME varchar2(512 char), STATUS varchar2(32 char), DATE_STATUS timestamp, DATE_SUBMITTED timestamp, DATE_SENT timestamp, DATE_RECEIVED timestamp, DATE_DELIVERED timestamp, primary key (ID));
create table LAU_INBOX_EVENT (ID number(19,0) not null, MAIL_ID number(19,0), STATUS varchar2(32 char), EVENT_DATE timestamp, DESCRIPTION varchar2(512 char), USER_ID varchar2(64 char), APPLICATION_ID varchar2(128 char), FILEPATH varchar2(1028 char), MIME_TYPE varchar2(128 char), primary key (ID));
create table LAU_INBOX_PAYLOAD (ID number(19,0) not null, MAIL_ID number(19,0), PART_EBMS_ID varchar2(256 char), PART_NAME varchar2(256 char), PART_DESCRIPTION varchar2(512 char), PART_TYPE varchar2(64 char), PART_FILENAME varchar2(256 char), PART_FILEPATH varchar2(1028 char), PART_MIME_TYPE varchar2(128 char), PART_ENCODING varchar2(128 char), PART_SHA256_VALUE varchar2(256 char), PART_SIZE number(19,0), PART_IS_ENCRYPTED number(1,0), PART_SOURCE varchar2(32 char), PART_IS_RECEIVED number(1,0), PART_IS_SENT number(1,0), PART_GENERATED_FROM_PART number(19,0), primary key (ID));
create table LAU_INBOX_PAYLOAD_PROPERTY (ID number(19,0) not null, NAME varchar2(128 char), TYPE varchar2(256 char), VALUE varchar2(512 char), INPART_ID number(19,0) not null, primary key (ID));
create table LAU_INBOX_PROPERTY (ID number(19,0) not null, NAME varchar2(128 char), TYPE varchar2(256 char), VALUE varchar2(512 char), MAIL_ID number(19,0) not null, primary key (ID));
create table LAU_INTERC_INST_PROPERTY (ID number(19,0) not null, INTC_PROP_KEY varchar2(64 char), INTC_PROP_VALUE varchar2(512 char), INTERCEPTOR_INSTANCE_ID number(19,0) not null, primary key (ID));
create table LAU_INTERC_RULE (ID number(19,0) not null, RULE_PROPERTY varchar2(64 char), RULE_PREDICATE varchar2(32 char), RULE_VALUE varchar2(512 char), INTERCEPTOR_ID number(19,0) not null, primary key (ID));
create table LAU_INTERCEPTOR (ID number(19,0) not null, NAME varchar2(128 char), ACTIVE number(1,0), INTERCEPT_EVENT varchar2(32 char), INTERCEPT_ROLE varchar2(32 char), INTERCEPTOR_TYPE varchar2(64 char), INTERCEPTOR_PLUGIN varchar2(64 char), INTERCEPTOR_PLUGIN_VERSION varchar2(32 char), primary key (ID));
create table LAU_OUTBOX (ID number(19,0) not null, MSG_ID varchar2(256 char) not null, REF_TO_MSG_ID varchar2(256 char), SENDER_MSG_ID varchar2(256 char), SERVICE varchar2(512 char) not null, ACTION varchar2(512 char) not null, CONV_ID varchar2(512 char), SUBJECT varchar2(512 char), RECEIVER_EBOX varchar2(512 char) not null, RECEIVER_NAME varchar2(512 char), SENDER_EBOX varchar2(512 char) not null, SENDER_NAME varchar2(512 char), STATUS varchar2(32 char), DATE_STATUS timestamp, DATE_SUBMITTED timestamp, DATE_SENT timestamp, DATE_RECEIVED timestamp, DATE_DELIVERED timestamp, primary key (ID));
create table LAU_OUTBOX_EVENT (ID number(19,0) not null, MAIL_ID number(19,0), SENDER_MSG_ID varchar2(256 char), STATUS varchar2(32 char), EVENT_DATE timestamp, DESCRIPTION varchar2(512 char), USER_ID varchar2(64 char), APPLICATION_ID varchar2(128 char), FILEPATH varchar2(1028 char), MIME_TYPE varchar2(128 char), primary key (ID));
create table LAU_OUTBOX_PAYLOAD (ID number(19,0) not null, MAIL_ID number(19,0), PART_EBMS_ID varchar2(256 char), PART_NAME varchar2(256 char), PART_DESCRIPTION varchar2(512 char), PART_TYPE varchar2(64 char), PART_FILENAME varchar2(256 char), PART_FILEPATH varchar2(1028 char), PART_MIME_TYPE varchar2(128 char), PART_ENCODING varchar2(128 char), PART_SHA256_VALUE varchar2(256 char), PART_SIZE number(19,0), PART_IS_ENCRYPTED number(1,0), PART_SOURCE varchar2(32 char), PART_IS_RECEIVED number(1,0), PART_IS_SENT number(1,0), PART_GENERATED_FROM_PART number(19,0), primary key (ID));
create table LAU_OUTBOX_PAYLOAD_PROPERTY (ID number(19,0) not null, NAME varchar2(128 char), TYPE varchar2(256 char), VALUE varchar2(512 char), OUTPART_ID number(19,0) not null, primary key (ID));
create table LAU_OUTBOX_PROPERTY (ID number(19,0) not null, NAME varchar2(128 char), TYPE varchar2(256 char), VALUE varchar2(512 char), MAIL_ID number(19,0) not null, primary key (ID));
create table LAU_PROC_INST_PROPERTY (ID number(19,0) not null, PROC_PROP_KEY varchar2(64 char), PROC_PROP_VALUE varchar2(512 char), PROCESSOR_INSTANCE_ID number(19,0) not null, primary key (ID));
create table LAU_PROCESS_INSTANCE (ID number(19,0) not null, TYPE varchar2(64 char), PLUGIN varchar2(64 char), PLUGIN_VERSION varchar2(32 char), PROCESSOR_ID number(19,2), IDX number(10,0), primary key (ID));
create table LAU_PROCESSOR (ID number(19,0) not null, NAME varchar2(128 char), ACTIVE number(1,0), SET_DELIVERED_ON_SUCCESS number(1,0), primary key (ID));
create table LAU_PROCESSOR_RULE (ID number(19,0) not null, RULE_PROPERTY varchar2(64 char), RULE_PREDICATE varchar2(32 char), RULE_VALUE varchar2(512 char), PROCESSOR_ID number(19,0) not null, primary key (ID));
create table LAU_SETTINGS (PROP_KEY varchar2(512 char) not null, PROP_VALUE varchar2(1024 char), LAU_GROUP varchar2(32 char), primary key (PROP_KEY));
create table LAU_TASK_INSTANCE (TASK_ID number(19,0) not null, TASK_TYPE varchar2(64 char), TASK_PLUGIN varchar2(64 char), TASK_PLUGIN_VERSION varchar2(32 char), TASK_NAME varchar2(128 char), TASK_ACTIVE number(1,0), CRON_ID number(19,2), IDX number(10,0), primary key (TASK_ID));
create table LAU_TASK_PROPERTY (ID number(19,0) not null, TASK_PROP_KEY varchar2(64 char), TASK_PROP_VALUE varchar2(512 char), TASK_ID number(19,0) not null, primary key (ID));
create table LAU_USER (userid varchar2(512 char) not null, NAME varchar2(512 char), DESCRIPTION varchar2(1024 char), EMAIL varchar2(512 char), Active_Date_From timestamp, Active_Date_To timestamp, primary key (userid));
create table lau_user_sedbox (userid varchar2(512 char) not null, lau_box varchar2(512 char) not null);
create table Status (ID varchar2(255 char) not null, SERVICE varchar2(255 char), STATUS varchar2(255 char), COUNT number(19,2), primary key (ID));
alter table LAU_CRON add constraint UK_p4lugycxfd6vfse3wtg92vok0 unique (NAME);
create index Idx_in_msg_id on LAU_INBOX (MSG_ID);
create index idx_in_ref_msg_id on LAU_INBOX (REF_TO_MSG_ID);
create index Idx_sender_msg_id on LAU_INBOX (SENDER_MSG_ID);
create index Idx_conv_id on LAU_INBOX (CONV_Id);
create index Idx_status on LAU_INBOX (STATUS);
create index Idx_date_status on LAU_INBOX (DATE_STATUS);
create index Idx_date_submit on LAU_INBOX (DATE_SUBMITTED);
create index Idx_date_sent on LAU_INBOX (DATE_SENT);
create index Idx_date_received on LAU_INBOX (DATE_RECEIVED);
create index Idx_date_delivered on LAU_INBOX (DATE_DELIVERED);
create index idx_inev_mid on LAU_INBOX_EVENT (MAIL_ID);
create index idx_inpart_mid on LAU_INBOX_PAYLOAD (MAIL_ID);
create index idx_inpart_ebmsid on LAU_INBOX_PAYLOAD (PART_EBMS_ID);
alter table LAU_INTERCEPTOR add constraint UK_2yn4pf1e0fcqtx9wimeve8ng2 unique (NAME);
create index idx_out_msg_id on LAU_OUTBOX (MSG_ID);
create index idx_out_ref_msg_id on LAU_OUTBOX (REF_TO_MSG_ID);
create index idx_out_sender_msg_id on LAU_OUTBOX (SENDER_MSG_ID);
create index idx_out_conv_id on LAU_OUTBOX (CONV_ID);
create index idx_out_status on LAU_OUTBOX (STATUS);
create index idx_out_date_status on LAU_OUTBOX (DATE_STATUS);
create index idx_out_date_submit on LAU_OUTBOX (DATE_SUBMITTED);
create index idx_out_date_sent on LAU_OUTBOX (DATE_SENT);
create index idx_out_date_received on LAU_OUTBOX (DATE_RECEIVED);
create index idx_out_date_delivered on LAU_OUTBOX (DATE_DELIVERED);
create index idx_outev_mid on LAU_OUTBOX_EVENT (MAIL_ID);
create index idx_oute_smid on LAU_OUTBOX_EVENT (SENDER_MSG_ID);
create index idx_outpart_mid on LAU_OUTBOX_PAYLOAD (MAIL_ID);
create index idx_outpart_ebmsid on LAU_OUTBOX_PAYLOAD (PART_EBMS_ID);
create index Idx_proc_name on LAU_PROCESSOR (NAME);
alter table LAU_PROCESSOR add constraint UK_q3kusunk2g5xmrl2bpv2qp86w unique (NAME);
alter table lau_application_sedbox add constraint FKfh4o2fkuupgbg3fbs01oqok98 foreign key (lau_box) references LAU_BOX;
alter table lau_application_sedbox add constraint FKo0vipa03a8x1qeen7v59jnj5g foreign key (applicationId) references LAU_APPLICATION;
alter table LAU_INBOX_PAYLOAD add constraint FKhfeuj7x6gu79rwjb51yjgm6na foreign key (MAIL_ID) references LAU_INBOX;
alter table LAU_INBOX_PAYLOAD_PROPERTY add constraint FKcffyndj75961psteakf0bgcpv foreign key (INPART_ID) references LAU_INBOX_PAYLOAD;
alter table LAU_INBOX_PROPERTY add constraint FKoxlhcbysl1wyb8y61s7ji6rix foreign key (MAIL_ID) references LAU_INBOX;
alter table LAU_INTERC_INST_PROPERTY add constraint FK25lg28ch3j0sm93otq1t3i0qq foreign key (INTERCEPTOR_INSTANCE_ID) references LAU_INTERCEPTOR;
alter table LAU_INTERC_RULE add constraint FKry3q0vilbnmnjn3si8praj09u foreign key (INTERCEPTOR_ID) references LAU_INTERCEPTOR;
alter table LAU_OUTBOX_PAYLOAD add constraint FKdnhy6eicnlt3x90tbm0s8hl4i foreign key (MAIL_ID) references LAU_OUTBOX;
alter table LAU_OUTBOX_PAYLOAD_PROPERTY add constraint FK4br36icwb4ykah4c1dn96e7x foreign key (OUTPART_ID) references LAU_OUTBOX_PAYLOAD;
alter table LAU_OUTBOX_PROPERTY add constraint FKjuvytr3148ok3wkgnafbx86uc foreign key (MAIL_ID) references LAU_OUTBOX;
alter table LAU_PROC_INST_PROPERTY add constraint FKswnd8ofr9a9i914a3jnsowcj2 foreign key (PROCESSOR_INSTANCE_ID) references LAU_PROCESS_INSTANCE;
alter table LAU_PROCESS_INSTANCE add constraint FKh8rl7cuwpmwlykan7c9k1qsal foreign key (PROCESSOR_ID) references LAU_PROCESSOR;
alter table LAU_PROCESSOR_RULE add constraint FKnqhnt0ifieah239jvl4j89efr foreign key (PROCESSOR_ID) references LAU_PROCESSOR;
alter table LAU_TASK_INSTANCE add constraint FK3dq8n8wou6jjjra0hksqi74ni foreign key (CRON_ID) references LAU_CRON;
alter table LAU_TASK_PROPERTY add constraint FK6yaein29p27bgvlvu7uj7tytk foreign key (TASK_ID) references LAU_TASK_INSTANCE;
alter table lau_user_sedbox add constraint FKskjfj7e21bd85ms4680q9t72n foreign key (lau_box) references LAU_BOX;
alter table lau_user_sedbox add constraint FKedyfksnua3b07c0jt0cpj4l3c foreign key (userid) references LAU_USER;
