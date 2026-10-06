# yeogicyber

Yeogistudy / Yeogicyber Classic ASP platform (IIS + SQL Server).

## Repository layout

- `YEOGICYBER_MAIN_2026/` ? PC web + mobile (primary deploy)
- `YEOGICYBER_2024_TOOLS/` ? admin Tools (LMS)
- `scripts/` ? encoding checks and maintenance patches
- `docs/` ? local setup and environment examples
- `Yeogistudy_*.md` ? project conventions (encoding, deploy paths)

## Quick start

1. Read [docs/LOCAL_SETUP.md](docs/LOCAL_SETUP.md)
2. Copy [config/examples/dbopen.example.asp](config/examples/dbopen.example.asp) to local `include/dbopen.asp`
3. Configure values from [docs/ENV.example.md](docs/ENV.example.md)
4. Point IIS at the paths described in the docs

## Security

Production credentials, PG keys, and personal data paths must **not** be committed. They are listed in `.gitignore`. Use example files only.
