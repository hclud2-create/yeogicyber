# Yeogistudy ?¸ì½”ë”©Â·Zone Crossing ë§ˆì´ê·¸ë ˆ?´?…˜ ê°??´?“œ

> ìµœì¢… ? •ë¦?: 2026-07-18  
> ????ƒ: Mobile(UTF-8) ?†” Web/Tools/Apply(CP949) ê²½ê³„ ë¬¸ì œ Â· v2 ? ì§? ?´? „

---

## 1. ë¬¸ì œ ? •?˜

### 1.1 ?˜?—­ë³? ?¸ì½”ë”© (?˜¼?š© ê¸ˆì??)

| ?˜?—­ | ê²½ë¡œ | ?¸ì½”ë”© | ë¬¸ì„œ |
|------|------|--------|------|
| Tools | `YEOGICYBER_2024_TOOLS\Tools\` | **CP949** | `Yeogistudy_LMS_MD.md` |
| Mobile | `mobile\`, `Mobile\` | **UTF-8** | `Yeogistudy_Mobile_MD.md` |
| ?Œ¨?‚¤ì§? apply (v1) | `web/Page/Package/apply/` | **CP949** | `Yeogistudy_Package_Apply_MD.md` |

### 1.2 Zone Crossing ? apply ?†’ ?™ˆ Â· PC?†”Mobile ë©”ë‰´ ê¹¨ì§

```
ëª¨ë°”?¼ Gnb (UTF-8)
  ?†’ /Mobile/Page/Package/apply.asp
    ?†’ /web/page/package/apply/apply.asp  (CP949, Web Top.asp)
      ?†’ ë¡œê³  "?™ˆ" (org_url)  ?† ê¹¨ì§ ë°œìƒ
        ?†’ /mobile/ (UTF-8, Gnb.asp)

PC Footer "ëª¨ë°”?¼" / Mobile Footer "PCë²„ì „"  ?† Session ê²½ê³„ ê¹¨ì§
```

**????‘ (2026-07-17):** `zone_enter.asp` + `zone_session_refresh.asp` ? Â§5.4  
**v2 ????•ˆ:** `go_home.asp`, apply_v2 ? Phase 1~2

**?›?¸ ?›„ë³? (ë³µí•©)**

| # | ?›?¸ | ?„¤ëª? |
|---|------|------|
| 1 | CodePage ê²½ê³„ + Session | CP949 ?˜?´ì§??—?„œ Session ?•œê¸??„ UTF-8 Gnb?—?„œ ê·¸ë??ë¡? ì¶œë ¥ |
| 2 | CP949 ?†” UTF-8 ì§ì ‘ ?™•ë³? | apply?Š” Web include, ?™ˆ??? Mobile Gnb ? charset ?‹¤ë¥? ?˜?´ì§? ?—°?† ë°©ë¬¸ |
| 3 | Gnb ?“± ????˜• ASP ?†?ƒ | UTF-8?´?–´?•¼ ?•  `Gnb.asp`?— CP949 ë°”ì´?Š¸ ?˜¼?… |

### 1.3 v1 ?œ ì§? ?›ì¹? (?š´?˜ ?‚¬?´?Š¸)

- **ê¸°ì¡´ `apply.asp`, `Gnb.asp`, `Header.asp`, `Top.asp` ????Ÿ‰ ?ˆ˜? • ê¸ˆì??**
- **?‹ ê·? URLÂ·includeÂ·API**ë§? ì¶”ê?? (Strangler Fig)
- **DB ?”Œ?˜ê·?**ë¡? v1/v2 ? „?™˜ ? ë¡¤ë°± = ?”Œ?˜ê·? OFF

---

## 2. v2 ?•„?‚¤?…ì²? ê°œìš”

```
[v1 ? ?œ ì§?]                         [v2 ? ?‹ ê·?]
mobile/Page/Package/apply.asp       mobile/Page/Package/apply_v2.asp
  ?†’ web apply (CP949)                 ?†’ mobile/Page/Package/v2/apply.asp (UTF-8)
web/Page/Package/apply/apply.asp    web/Page/Package/apply/api/*.asp (JSON UTF-8)
mobile/Include/Gnb.asp              mobile/Include/Gnb_v2.asp
mobile/index.asp                    mobile/index_v2.asp (?„ ?ƒ)
                                    mobile/Page/go_home.asp (zone ë¸Œë¦¿ì§?)
```

**? ˆê±°ì‹œ CP949??? v2 UTF-8 ?—°ê²?:** ASP include ê³µìœ  ìµœì†Œ?™” ?†’ **JSON API + DB ?¬ì¡°íšŒ**

---

## 3. Phase ë¡œë“œë§?

| Phase | ?‘?—… | ?š¨ê³? | ë¦¬ìŠ¤?¬ |
|-------|------|------|--------|
| **0** | `zone_probe.asp` ì§„ë‹¨ | Session vs Gnb ?ŒŒ?¼ ?›?¸ ë¶„ë¦¬ | ?—†?Œ |
| **1** | `apply_v2` + `go_home.asp` | apply?†’?™ˆ Session ê¹¨ì§ ?™„?™” | ?‚®?Œ |
| **1.5** | **`zone_enter` + `zone_session_refresh`** | **PC?†”Mobile ?–‘ë°©í–¥ SessionÂ·?•œê¸? ? •?ƒ?™” (2026-07-17)** | ?‚®?Œ |
| **2** | `api/pkg_get.asp` JSON | ë¡œì§Â·?•œê¸? ì¶œë ¥ CP949 ê²©ë¦¬ | ?‚®?Œ |
| **3** | `Gnb_v2` + `Header_v2` + `index_v2` | ë©”ë‰´ ê¹¨ì§ ê·¼ë³¸ | ì¤‘ê°„ (v1 ?œ ì§?) |
| **4** | PC apply v2 (UTF-8) | Web ? „ì²? ?†µ?¼ | ?†’?Œ (?›„?ˆœ?œ„) |

?ƒ?„¸ ?ŒŒ?¼Â·URL: `Yeogistudy_Package_Apply_MD.md` Â§10, `Yeogistudy_Mobile_MD.md` Â§12

---

## 4. DB ?”Œ?˜ê·? (? œ?•ˆ)

| GRP_COM_CODE | COM_CODE | USE_CHK=1 ?˜ë¯? |
|--------------|----------|----------------|
| `pkg_config` | `MOBILE_MENU` | (ê¸°ì¡´) ëª¨ë°”?¼ ?Œ¨?‚¤ì§? ë©”ë‰´ ?…¸ì¶? |
| `pkg_config` | `APPLY_MOBILE_V2` | ëª¨ë°”?¼ apply ?†’ v2 ê²½ë¡œ |
| `pkg_config` | `MOBILE_HOME_V2` | ?™ˆ ?†’ `index_v2` / `Gnb_v2` |

- www0?—?„œë§? ON ?†’ ê²?ì¦? ?†’ ?š´?˜ ?ˆœ
- **ë¡¤ë°±:** `USE_CHK='0'` (ì½”ë“œ ?¬ë°°í¬ ë¶ˆí•„?š”)

---

## 5. ? „?™˜Â·ê²?ì¦Â·ë¡¤ë°?

### 5.0 Phase 0~1 êµ¬í˜„ ?ŒŒ?¼ (2026-07-12)

| ?ŒŒ?¼ | ?—­?•  |
|------|------|
| `mobile/Include/pkg_v2_config.asp` | DB ?”Œ?˜ê·? APPLY_MOBILE_V2, MOBILE_HOME_V2 |
| `mobile/Include/session_utf8.asp` | userid ?†’ DB MEM_NAME ?¬ì¡°íšŒ |
| `mobile/Include/zone_probe.asp` | ì§„ë‹¨ (plain text) |
| `mobile/Include/Gnb_v2.asp` | v2 ë¯¸ë‹ˆ Gnb |
| `mobile/Page/go_home.asp` | zone ë¸Œë¦¿ì§? ?†’ index / index_v2 |
| `mobile/Page/Package/apply_v2.asp` | v1/v2 ?¼?š°?„° (v1 apply.asp ë¯¸ìˆ˜? •) |
| `mobile/Page/Package/v2/include/top_v2.asp` | Mobile Gnb/Footer shell head |
| `mobile/Include/Gnb_v2_shell.asp` | Gnb+LNB ë§ˆí¬?—… (v1 Gnb ë¯¸ìˆ˜? •) |
| `mobile/Include/Footer_v2_shell.asp` | Footer+common.js |
| `mobile/Page/Package/v2/index.asp` | UTF-8 ?—ˆë¸? |
| `mobile/index_v2.asp` | UTF-8 ?™ˆ v2 |
| `web/Page/Package/apply/api/pkg_get.asp` | JSON API (UTF-8 ?‘?‹µ) |
| `Tools/.../sql/insert_pkg_config_v2_flags.sql` | DB ?”Œ?˜ê·? ì´ˆê¸° INSERT |

**www0 ?…Œ?Š¤?Š¸ (?”Œ?˜ê·? OFF?—¬?„ force ?ŒŒ?¼ë¯¸í„°):**

- `/Mobile/Include/zone_probe.asp`
- `/mobile/Page/Package/apply_v2.asp?code=122&force_v2=1`
- `/mobile/Page/Package/v2/apply.asp?code=122`
- `/mobile/Page/go_home.asp?force_home_v2=1` ?†’ index_v2
- `/web/page/package/apply/api/pkg_get.asp?code=122`

### 5.1 ? „?™˜ ?ˆœ?„œ

1. Phase 0 ì§„ë‹¨ (apply ?†’ ?™ˆ ?¬?˜„, probe URL ?™•?¸)
2. v2 ?ŒŒ?¼ ë°°í¬ (?”Œ?˜ê·? OFF ? v1 ?™?‘ ?œ ì§?)
3. www0 DB ?”Œ?˜ê·? ON (APPLY_MOBILE_V2)
4. ?Š¤ëª¨í¬: apply_v2 ?†’ go_home ?†’ Gnb_v2 ë©”ë‰´ ?•œê¸?
5. ë¬¸ì œ ?‹œ ?”Œ?˜ê·? OFF

### 5.2 ê²?ì¦? ì²´í¬ë¦¬ìŠ¤?Š¸

- [ ] `python scripts/check_asp_encoding.py mobile <v2?ŒŒ?¼>`
- [ ] apply(code=122) ?†’ ?™ˆ ?†’ **?ƒ­+Gnb ë©”ë‰´** ?•œê¸? ? •?ƒ
- [ ] DevTools Console ?˜¤ë¥? 0
- [ ] v1 ê²½ë¡œ(?”Œ?˜ê·? OFF) ê¸°ì¡´ê³? ?™?¼

### 5.3 ì§„ë‹¨ URL (Phase 0)

| URL | ?š©?„ |
|-----|------|
| `/Mobile/Include/pkg_mobile_menu_check.asp` | DBÂ·PkgMobileMenuShow |
| `/Mobile/Include/zone_probe.asp` | (?‹ ê·?) CodePageÂ·Session ?ƒ˜?”Œ |
| `/web/page/package/apply/apply.asp?code=122` | v1 apply |

### 5.4 `zone_enter` ? PC?†”Mobile Session ë¸Œë¦¿ì§? (2026-07-17~18)

v1 ?š´?˜ ê²½ë¡œ?—?„œ **FooterÂ·Gnb?˜ PC/ëª¨ë°”?¼ ? „?™˜ ë§í¬**ê°? CodePage ê²½ê³„ë¥? ê·¸ë??ë¡? ?„˜ê¸°ë©´ Session ?•œê¸?Â·ë©”ë‰´ê°? ê¹¨ì§.  
?”Œ?˜ê·?(v2) ?—†?´?„ ?™?‘?•˜?„ë¡? **?–‘ë°©í–¥ ë¸Œë¦¿ì§?**ë¥? ì¶”ê??.

#### 5.4.1 ?ë¦?

```
[PC ?†’ Mobile]
web/Footer "ëª¨ë°”?¼" ë§í¬
  ?†’ /mobile/Page/zone_enter.asp?to=<ëª©ì  URL>
    ?†’ zone_session_refresh (UTF-8, DB MEM_NAME ?¬ì¡°íšŒ)
      ?†’ to ?ŒŒ?¼ë¯¸í„°ë¡? redirect

[Mobile ?†’ PC]
mobile/FooterÂ·Gnb "PCë²„ì „" ë§í¬
  ?†’ /web/Page/zone_enter.asp?to=<ëª©ì  URL>
    ?†’ zone_session_refresh (CP949)
      ?†’ to ?ŒŒ?¼ë¯¸í„°ë¡? redirect

[apply ?†’ Mobile ?™ˆ]
mobile/Page/go_home.asp
  ?†’ zone_session_refresh include ?›„ index / index_v2
```

#### 5.4.2 êµ¬í˜„ ?ŒŒ?¼

| ?ŒŒ?¼ | ?¸ì½”ë”© | ?—­?•  |
|------|--------|------|
| `mobile/Page/zone_enter.asp` | UTF-8 | PC?†’Mobile ì§„ì… ë¸Œë¦¿ì§? (?‹ ê·?) |
| `web/Page/zone_enter.asp` | CP949 | Mobile?†’PC ì§„ì… ë¸Œë¦¿ì§? (?‹ ê·?) |
| `mobile/Include/zone_session_refresh.asp` | UTF-8 | `session("userid")` ?†’ DB `MEM_NAME` ?†’ `session("username")` ê°±ì‹  (?‹ ê·?) |
| `web/Include/zone_session_refresh.asp` | CP949 | ?™?¼ (Web zone) (?‹ ê·?) |
| `mobile/Include/session_utf8.asp` | UTF-8 | UTF-8 ?˜?´ì§??š© display ë³??ˆ˜ + DB ?¬ì¡°íšŒ (ê¸°ì¡´ ë³´ê°•) |
| `mobile/Page/go_home.asp` | UTF-8 | `zone_session_refresh` ê²½ìœ  ?›„ ?™ˆ redirect |
| `web/Include/Footer.asp` | CP949 | ëª¨ë°”?¼ ë§í¬ ?†’ `zone_enter.asp?to=...` |
| `mobile/Include/Footer.asp` | UTF-8 | PCë²„ì „ ?†’ `web/Page/zone_enter.asp?to=...` |
| `mobile/Include/Footer_v2_shell.asp` | UTF-8 | PC ë§í¬ zone_enter ê²½ìœ  |
| `mobile/Include/Gnb_v2_shell.asp` | UTF-8 | PC ë§í¬ zone_enter ê²½ìœ  |
| `mobile/Include/Gnb_menu_utf8.inc.asp` | UTF-8 | Gnb ë©”ë‰´ HTML entity ë³µêµ¬?š© include (?‹ ê·?) |
| `mobile/Include/Gnb.asp` | UTF-8 | ë©”ë‰´ ?†’ `Gnb_menu_utf8.inc.asp`, ?—¤?” ?¼ë¶? entity |
| `mobile/Include/zone_probe.asp` | UTF-8 | `zone_session_refresh` include ì¶”ê?? |

#### 5.4.3 `zone_enter.asp` ?ŒŒ?¼ë¯¸í„°

| ?ŒŒ?¼ë¯¸í„° | ?„¤ëª? |
|----------|------|
| `to` | ?´?™?•  ?ƒ???/? ˆ??? URL (?•„?ˆ˜). ë¯¸ì??? • ?‹œ ê°? zone ê¸°ë³¸ ?™ˆ |

- ë¸Œë¦¿ì§? ?˜?´ì§??—?„œ **Session refresh ?›„** `to`ë¡? redirect ? CP949?†”UTF-8 ?™•ë³? ?‹œ `username` ?˜¤?—¼ ë°©ì??.

#### 5.4.4 Gnb ?•œê¸? ë³µêµ¬ (2026-07-17)

| ì¦ìƒ | ì¡°ì¹˜ |
|------|------|
| Gnb ë©”ë‰´Â·alert ?“± ?•œê¸? ê¹¨ì§ | ë©”ë‰´ ë¸”ë¡?„ `Gnb_menu_utf8.inc.asp`ë¡? ë¶„ë¦¬Â·entity ë³µêµ¬ |
| Gnb ?ƒ?‹¨ alert/Validate ?“± ?¼ë¶? ?†?ƒ | **?”?—¬** ? pristine/SVN ?ˆ˜?™ ë³µêµ¬ ?•„?š” ?‹œ Â§6 ê¸ˆì?? ?‚¬?•­ ì¤??ˆ˜ |

#### 5.4.5 ê²?ì¦?

- [ ] PC ë¡œê·¸?¸ ?†’ Footer **ëª¨ë°”?¼** ?†’ GnbÂ·ë¡œê·¸?¸ëª? ?•œê¸? ? •?ƒ
- [ ] Mobile ë¡œê·¸?¸ ?†’ Footer/Gnb **PCë²„ì „** ?†’ Web ?—¤?” ?•œê¸? ? •?ƒ
- [ ] apply(v1 CP949) ?†’ `go_home.asp` ?†’ Mobile Gnb ? •?ƒ
- [ ] `/Mobile/Include/zone_probe.asp` ? refresh ? „?›„ `username` ë¹„êµ

---

## 6. ?•˜ì§? ë§ì•„?•¼ ?•  ê²?

| ê¸ˆì?? | ?´?œ  |
|------|------|
| ê¸°ì¡´ `Gnb.asp` / `apply.asp` CodePageë§? ë³?ê²? | ? „?—­ ?¥?•  |
| Mobile redirectë¥? Web CP949ë¡? ?œ ì§??•œ ì±? Gnbë§? ?ˆ˜? • | zone crossing ?¬ë°? |
| `.bak` / AI StrReplaceë¡? Gnb ?•œê¸? ????Ÿ‰ ?ˆ˜? • | ?¸ì½”ë”© ?†?ƒ ë°˜ë³µ |
| v1Â·v2 include ì²´ì¸ ?˜¼?•© (Web Top.asp + Mobile Gnb) | 500Â·ê¹¨ì§ |
| `err_num` ?˜¸ì¶? without `Level.asp` | `admin_ip_check` ë³??ˆ˜Â·?•¨?ˆ˜ ì¶©ëŒ ?†’ 500 |

### 6.1 v2 500 ?´?Šˆ (2026-07-12)

- **ì¦ìƒ:** `/mobile/Page/Package/v2/apply.asp?code=122` ?‚´ë¶? ?„œë²? ?˜¤ë¥?
- **?›?¸:** `data_loader.asp`?˜ `Call err_num(SQL)` + `Level.asp` ë¯¸í¬?•¨ (`dbopen`?˜ `admin_ip_check="Y"` ë¬¸ì?—´?„ Subë¡? Call)
- **ì¡°ì¹˜:** `top_v2.asp`?— `URLLink.asp`Â·`Level.asp` ì¶”ê??, `err_num` ? œê±?, `virtual` include ?‚¬?š©

---

## 7. ê´?? ¨ ë¬¸ì„œ

| ë¬¸ì„œ | ?‚´?š© |
|------|------|
| `Yeogistudy_Encoding_Migration_MD.md` | **ë³? ë¬¸ì„œ** (ë¡œë“œë§µÂ·zone crossing) |
| `Yeogistudy_Package_Apply_MD.md` | apply v1/v2Â·APIÂ·URL |
| `Yeogistudy_Mobile_MD.md` | Gnb_v2Â·go_homeÂ·session_utf8 |
| `Yeogistudy_LMS_MD.md` | Tools CP949 (v2 ?•´?‹¹ ?—†?Œ) |
| `scripts/check_asp_encoding.py` | ë°°í¬ ? „ ?¸ì½”ë”© ê²??‚¬ |
| `.cursor/rules/yeogistudy-package-apply.mdc` | Apply/Mobile v2 Agent ê·œì¹™ |
