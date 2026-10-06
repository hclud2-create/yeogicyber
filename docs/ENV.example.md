# Environment / local configuration (example only)

> **Do not commit real passwords, API keys, or production connection strings.**
> Copy templates from `config/examples/` to the paths listed below on your machine.

## Database (SQL Server)

| Variable / setting | Example placeholder | Used in |
|---|---|---|
| `DB_HOST` | `localhost,1433` | `dbopen.asp` ¡æ `DbConnect` |
| `DB_NAME` | `yeogicyber` | main ODBC / connection string |
| `DB_USER` | `yeogi_web_local` | connection string UID |
| `DB_PASSWORD` | `change-me` | connection string PWD |
| `DB_LOG_NAME` | `yeogicyber_log` | `log_odbc_name` |
| `DB_BOARD_NAME` | `Board` | board ODBC |
| `DB_SMS_NAME` | `sms_db` | SMS ODBC |

Example connection string (replace placeholders):

```text
Provider=msoledbsql;Server=DB_HOST;Database=DB_NAME;UID=DB_USER;PWD=DB_PASSWORD;
```

## ODBC DSN (IIS / Windows)

Create system DSNs matching names in `dbopen.asp` (after you copy from example):

- `yeogicyber` ? main DB
- `yeogicyber_log` ? log DB (optional if `log_odbc_gubun = "N"`)
- `Board` ? board DB
- `sms_db` ? SMS DB
- `mobileapp` ? app log DB

## Payment gateway (Toss / legacy PG)

| Setting | Example | Notes |
|---|---|---|
| `pgoffice` | `toss` | PG vendor |
| `pgtestgubun` | `T` | `T` = test, `service` = production |
| `pay_mid1` | `your_merchant_id` | merchant ID |
| `pay_mid1_key` | `your_api_key` | **secret** |
| `pgCancelPW` | `change-me` | cancel password |
| `pg_configPath` | `C:\pg\lgdacom` | local PG config folder |
| `pgLog` | `C:\logs\pg` | PG log directory |

## Push / FCM (optional)

| Setting | Example |
|---|---|
| `app_fcm_key` | `AAAA...your_server_key...` |
| `app_admin_device` | `device_token_example` |

## File upload paths (local)

| Setting | Example |
|---|---|
| `DEXTUpload_Temp` | `C:\yeogi\upload\temp` |
| `DEXTUploadX_DownPath` | `C:\yeogi\upload` |
| `log_info` | `C:\yeogi\logs` |
| `c_info` | `\\fileserver\share` or local path |

## Personal info / admin flags

| Setting | Example | Meaning |
|---|---|---|
| `personal_passwd` | `local-dev-only` | personal-info unlock password |
| `personal_info_flag` | `N` | hide PII on dev |
| `otpGubun` | `N` | disable admin OTP locally |

## Setup steps

1. Copy `config/examples/dbopen.example.asp` ¡æ `YEOGICYBER_2024_TOOLS/include/dbopen.asp`
2. If IIS site uses `YEOGICYBER_MAIN_2026`, also copy to `YEOGICYBER_MAIN_2026/web/include/dbopen.asp` (or point IIS virtual `/include/` to TOOLS include).
3. Fill in placeholders above.
4. Create ODBC DSNs or use full connection string in `DbConnect`.
5. Never commit the filled `dbopen.asp` files.
