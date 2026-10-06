<%
' EXAMPLE ONLY ? copy to include/dbopen.asp and fill real values locally.
' Do NOT commit dbopen.asp with production secrets.

sms_odbc_name     = "sms_db"
Db_Odbc_Name      = "Board"
Board_Odbc_Name   = "Board"
main_odbc_name    = "yeogicyber"
app_odbc_name     = "mobileapp"
app_fcm_key       = "YOUR_FCM_SERVER_KEY"

sitecode = 1
app_send_gubun    = "A"
app_admin_device  = "YOUR_ADMIN_DEVICE_TOKEN"
app_sms_gubun     = "N"
app_use_gubun     = "N"

log_odbc_name     = "yeogicyber_log"
log_odbc_gubun    = "Y"

Db_Odbc_User      = "ebook"

DbConnect = "Provider=msoledbsql;Server=YOUR_DB_HOST,1433;Database=yeogicyber;UID=YOUR_DB_USER;PWD=YOUR_DB_PASSWORD;"
SET DBConn = Server.CreateObject("ADODB.Connection")
DBConn.Open DbConnect

a_info = "https://" & Request.ServerVariables("HTTP_HOST")
main_site = "https://www.example.local"
log_info = "C:\yeogi\logs"

personal_passwd     = "local-dev-password"
personal_info_flag  = "N"
personal_info_flag2 = "N"
personal_info_flag3 = "Y"
personal_info_flag4 = "N"

pgoffice      = "toss"
pgtestgubun   = "T"
pgCancelPW    = "change-me"
pg_configPath = "C:\pg\lgdacom"
pgLog         = "C:\logs\pg"
pay_mid1      = "your_merchant_id"
pay_mid1_key  = "your_api_key"
pay_mid2      = "your_merchant_id_2"
pay_mid2_key  = "your_api_key_2"

DEXTUpload_Temp       = "C:\yeogi\upload\temp"
DEXTUploadX_DownPath  = "C:\yeogi\upload"
max_uploadsize        = 1024 * 1024 * 30

otpGubun = "N"
SQLVerGubun = "Y"
%>
