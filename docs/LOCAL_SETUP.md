# Yeogicyber ? local development setup

Classic ASP (VBScript) + IIS + SQL Server monorepo.

## Active source trees

| Area | Path | Encoding | Deploy target |
|---|---|---|---|
| PC Web + Mobile | `YEOGICYBER_MAIN_2026/` | web/apply CP949, mobile UTF-8 | www production web root |
| Admin Tools (LMS) | `YEOGICYBER_2024_TOOLS/` | CP949 | Tools IIS site |
| Docs | `Yeogistudy_*.md`, `docs/` | UTF-8 markdown | ? |

Legacy mirrors (`YEOGICYBER_2024_MAIN`, `YEOGICYBER_2024_MAIN2`) are kept locally but not primary; see `Yeogistudy_Web_MD.md`.

## Prerequisites

- Windows Server or Windows 10/11 Pro
- IIS with Classic ASP enabled
- SQL Server (or remote dev DB) + ODBC Driver for SQL Server
- Optional: Python 3 for encoding check scripts (`scripts/check_asp_encoding.py`)

## IIS site layout (typical)

1. **Web (member site)**  
   - Physical path: `YEOGICYBER_MAIN_2026\web`  
   - URL example: `http://localhost/` or dev host

2. **Mobile**  
   - Physical path: `YEOGICYBER_MAIN_2026\mobile`  
   - Often separate site or `/mobile` app

3. **Tools (admin)**  
   - Physical path: `YEOGICYBER_2024_TOOLS`  
   - Virtual directory `/Tools` ¡æ `Tools` folder  
   - Virtual directory `/include` ¡æ `include` folder (shared ASP includes)

4. **Application pool**  
   - .NET CLR: No Managed Code  
   - Enable 32-bit apps if legacy COM upload components require it

## Configuration (secrets)

Real credentials live only in local `dbopen.asp` (gitignored).

```powershell
copy config\examples\dbopen.example.asp YEOGICYBER_2024_TOOLS\include\dbopen.asp
copy config\examples\dbopen.example.asp YEOGICYBER_MAIN_2026\web\include\dbopen.asp
```

Edit both files (or use one shared include via IIS virtual path) using `docs/ENV.example.md`.

## Encoding rules (important)

- **Tools / Web / apply ASP**: save as **CP949 (EUC-KR)**. UTF-8 save breaks Korean text.
- **Mobile ASP**: UTF-8 where documented in `Yeogistudy_Mobile_MD.md`.
- After editing ASP: `python scripts/check_asp_encoding.py tools <file.asp>`

## Python helper scripts

```powershell
cd u:\Homepage
python scripts/check_asp_encoding.py tools YEOGICYBER_2024_TOOLS\Tools\...
```

## Git / GitHub

- Remote: `https://github.com/hclud2-create/yeogicyber.git`
- Never commit: `.env`, `dbopen.asp`, uploads, `*.egg`, `.svn`, logs, DB dumps.
- See root `.gitignore`.

## Smoke test

1. Open Tools login page on local IIS.
2. Open a list page (e.g. member info) ? Korean labels must not show `?` or mojibake.
3. Open MAIN_2026 enrollment page ? initial load without SQL errors in IIS log.
