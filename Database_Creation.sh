source ~/.bash_profile

source $commonConfigurationFilePath
dbDecryptPassword=$(java -jar  ${APP_HOME}/encryption_utility/PasswordDecryptor-0.1.jar spring.datasource.password)

mysql  -h$dbIp -P$dbPort -u$dbUsername -p${dbDecryptPassword} $appdbName <<EOFMYSQL


insert into sys_param(tag,value,feature_name) values  ('manual_pair_clean_up_days','90','manual_pairing_clean');

insert into sys_param(tag,value,feature_name) values  ('notification_sms_start_time','09:00','manual_pairing_clean');

insert into sys_param(tag,value,feature_name) values  ('notification_sms_end_time','18:00', 'manual_pairing_clean');


EOFMYSQL
