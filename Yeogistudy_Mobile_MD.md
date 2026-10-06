# Yeogistudy Mobile ê°œë°œ ê°??´?“œ

> ìµœì¢… ? •ë¦?: 2026-07-18  
> ????ƒ: `YEOGICYBER_MAIN_2026\mobile` (Classic ASP / IIS / UTF-8)  
> **ë°°í¬:** WebÂ·Mobile ëª¨ë‘ **`YEOGICYBER_MAIN_2026`ë§?** (`Yeogistudy_Web_MD.md` Â§1)

---

## 1. Tools(LMS)????˜ ì°¨ì´ - ë°˜ë“œ?‹œ êµ¬ë¶„

| êµ¬ë¶„ | Tools (LMS) | Mobile |
|------|-------------|--------|
| ë¬¸ì„œ | `Yeogistudy_LMS_MD.md` | **ë³? ë¬¸ì„œ** |
| ?¸ì½”ë”© | **EUC-KR (CP949)** | **UTF-8 (CodePage 65001)** |
| ê²½ë¡œ | `YEOGICYBER_2024_TOOLS\Tools\` | `mobile\` |
| Cursor ê·œì¹™ | `yeogistudy-lms.mdc` | `yeogistudy-mobile.mdc` |

**Mobile ASPë¥? CP949ë¡? ????¥?•˜ê±°ë‚˜, Tools ASPë¥? UTF-8ë¡? ????¥?•˜ë©? ?•œê¸??´ ê¹¨ì§‘?‹ˆ?‹¤.**

---

## 2. ?”„ë¡œì ?Š¸Â·ë°°í¬ êµ¬ì¡°

| ?•­ëª? | ?‚´?š© |
|------|------|
| ?›Œ?¬?Š¤?˜?´?Š¤ | `u:\Homepage` |
| **ë°°í¬ ?Š¸ë¦? (WebÂ·Mobile)** | **`YEOGICYBER_MAIN_2026\`** (`web\`, `mobile\`) |
| ê°œë°œ URL ?˜ˆ | `https://www0.yeogicyber.co.kr/mobile/` |
| ë²„ì „ ê´?ë¦? | **SVN** (`.svn/pristine` ë³µêµ¬). git ?•„?‹˜ |

**`YEOGICYBER_2024_MAIN`??? ë°°í¬?— ?‚¬?š©?•˜ì§? ?•Š?Œ.** Agent?Š” MAIN_2026ë§? ?ˆ˜? •.

---

## 3. ?˜?´ì§? ? Œ?”ë§? ?ë¦? (Include ì§??„)

```
[?¼ë°? ëª¨ë°”?¼ ?˜?´ì§?]
top.asp (UTF-8, DB Conn, Session)
  ?”œ??? dbhelper.asp, form_01.asp, dbopen.asp, URLLink.asp ...
  ?”œ??? TopHeadShare.asp (jQuery, meta, CSS)
  ?””??? (?˜?´ì§? ë³¸ë¬¸?—?„œ Header.asp include)
       Header.asp
         ?””??? Gnb.asp  ?† ? „?—­ ë©”ë‰´Â·LNBÂ·?—¤?” ?•„?´ì½?
       ... ë³¸ë¬¸ ...
       Footer.asp
         ?”œ??? common_top.js
         ?”œ??? common.js   ?† Gnb ë©”ë‰´Â·SwiperÂ·ë°°ë„ˆ (Landing ? œ?™¸)
         ?””??? sub_common.js

[ë¡œê·¸?¸ ?“± Member ?˜?´ì§? ì¶”ê??]
login.asp
  ?”œ??? Header.asp ?†’ Gnb
  ?””??? Member_header.asp  ?† SSL/IP ë¦¬ë‹¤?´? ‰?Š¸ (500Â·ë£¨í”„ ì£¼ì˜)

[Landing ?˜?´ì§? ? Header/Gnb ê²½ë¡œê°? ?‹¤ë¦?]
Landing/include/Header.asp
  ?”œ??? top.asp
  ?”œ??? pkg_mobile_menu_show.asp  ?† ?Œ¨?‚¤ì§? ë©”ë‰´ ON/OFF ë³??ˆ˜
  ?””??? Landing/include/Gnb.asp   ?† ?Œ¨?‚¤ì§? ë§í¬ ì¡°ê±´ë¶? ?¬?•¨ ê°??Š¥
```

### 3.1 Gnb ?´ì¤? ê²½ë¡œ (?¥?•  ?‹¤ë°? êµ¬ê°„)

| ?š©?„ | Header | Gnb |
|------|--------|-----|
| ?¼ë°? ëª¨ë°”?¼ | `mobile/Include/Header.asp` | `mobile/Include/Gnb.asp` |
| Landing | `mobile/Landing/include/Header.asp` | `mobile/Landing/include/Gnb.asp` |

**?•œìª½ë§Œ ?ˆ˜? •?•˜ë©? ?‹¤ë¥? ìª? ë©”ë‰´Â·?Œ¨?‚¤ì§? ë§í¬Â·?•œê¸? ?ƒ?ƒœê°? ?‹¬?¼ì§‘ë‹ˆ?‹¤.**

### 3.2 ? „?—­ ?˜?–¥ ?ŒŒ?¼ (?™?‹œ ????ˆ˜?ˆ  ê¸ˆì??)

| ?ŒŒ?¼ | ?˜?–¥ |
|------|------|
| `Include/Gnb.asp` | Header ?“°?Š” **ê±°ì˜ ëª¨ë“  ?˜?´ì§?** |
| `Include/Header.asp` | include ì²´ì¸Â·ë³??ˆ˜ ? •?˜ |
| `Include/top.asp` | DBÂ·SessionÂ·ë¦¬ë‹¤?´? ‰?Š¸ |
| `Js/common.js` | ë©”ë‰´ ?† ê¸?Â·LNB SwiperÂ·ë©”ì¸ ë°°ë„ˆ |
| `Member/Member_header.asp` | Member/Login ê³„ì—´ |

---

## 4. ?¸ì½”ë”© ê·œì¹™ (Mobile ? „?š©)

### 4.1 ????¥ ê·œì¹™

- Mobile ASP: **UTF-8, BOM ?—†?Œ** ê¶Œì¥
- `top.asp` ?ƒ?‹¨: `CODEPAGE="65001"`, `Response.CharSet = "utf-8"`
- **Tools(CP949) ê·œì¹™?„ Mobile?— ? ?š©?•˜ì§? ?•Š?Œ**

### 4.2 Cursor / AI ?‘?—… ?‹œ

- `Gnb.asp`, `Header.asp` ?“± ?•œê¸? ë§ì?? ?ŒŒ?¼: **StrReplace/Writeë¡? ?•œê¸? ì§ì ‘ ?‚½?… ?‹œ ?¬?†?ƒ ?œ„?—˜**
- ASCII-only ?Œ¨ì¹? ?˜?Š” Python `open(..., encoding='utf-8')` ë¡? ????¥
- ????¥ ?›„ ê²?ì¦?:

```powershell
# BOM ?—†?Œ ?™•?¸ (EF BB BF ?•„?‹ˆ?–´?•¼ ?•¨)
Format-Hex -Path "mobile\Include\Gnb.asp" -Count 3
```

```python
# ?•œê¸? ?‚¤?›Œ?“œ ì¡´ì¬ ?™•?¸
"ë¡œê·¸?¸" in open("Gnb.asp", encoding="utf-8").read()
```

### 4.3 ë³µêµ¬ ê¸°ì?? ?›ë³?

| ?ŒŒ?¼ | ì°¸ê³  ?›ë³? (UTF-8 ? •?ƒ) |
|------|------------------------|
| Gnb.asp | SVN `.svn/pristine` ?˜?Š” ?‚¬?š©? ë°±ì—…ë³? (**`*.bak` golden source ê¸ˆì??**) |

### 4.4 ?‚¬? „ ê²??‚¬ ?Š¤?¬ë¦½íŠ¸

```powershell
python scripts/check_asp_encoding.py mobile YEOGICYBER_MAIN_2026/mobile/Include/Gnb.asp
```

- UTF-8 BOM ?—†?Œ Â· UTF-8 ?””ì½”ë“œ OK Â· `ë¡œê·¸?¸` ?“± ?‚¤?›Œ?“œ ?™•?¸
- ?ƒ?„¸ ì²´í¬ë¦¬ìŠ¤?Š¸: `Yeogistudy_LMS_MD.md` Â§2.5 (Tools/Mobile ê³µí†µ ë³µêµ¬ ?ˆœ?„œ)

---

## 5. JavaScript ? common.js ì£¼ì˜? 

ë¡œë“œ ?ˆœ?„œ (`Footer.asp`):

1. jQuery (TopHeadShare.asp, head)
2. bxSlider, Swiper, classie
3. `common_top.js`
4. `common.js` (Landing URL ? œ?™¸)
5. `sub_common.js`

### 5.1 ?•Œ? ¤ì§? êµ¬ì¡° ?´?Šˆ (ë³µì›ë³? ê¸°ì??)

| ?´?Šˆ | ?‚´?š© |
|------|------|
| `showLeft` | `getElementById('showLeft')` ?—†?´ `showLeft.onclick` ?†’ ReferenceError ê°??Š¥ |
| ?„œë¸Œë©”?‰´ ???? ‰?„° | HTML: `.toggle_menu_list > ul > li` / JS: `.toggle_menu_list > li` ?†’ ì²? ë©”ë‰´ ??™ ?¼ì¹? ?‹¤?Œ¨ |
| Swiper | `.swiper-container` ?—†?Š” ?˜?´ì§??—?„œ ë¬´ì¡°ê±? `new Swiper(...)` ?†’ ?´?›„ JS ì¤‘ë‹¨ ê°??Š¥ |
| bxSlider | `.ban_list` ?—†?Š” ?˜?´ì§??—?„œ bxslider ì´ˆê¸°?™” ?†’ ?˜¤ë¥? ê°??Š¥ |

**ì¦ìƒ:** ë©”ì¸ ë©”ë‰´?Š” ?˜?Š”?° ?„œë¸Œë©”?‰´ ?•ˆ ?¨ / ë¡œê·¸?¸Â·ë°°ë„ˆê¹Œì?? ?—°?‡„ ?´?ƒ  
**?™•?¸:** Chrome DevTools ?†’ Console ë¹¨ê°„ ?˜¤ë¥?

### 5.2 common.js ?ˆ˜? • ?‹œ ?Š¤ëª¨í¬ ?…Œ?Š¤?Š¸ URL

- `/mobile/index.asp`
- `/Mobile/Member/Login/login.asp`
- Landing ?˜?´ì§? 1ê³?
- `/Mobile/Page/Package/apply.asp` (redirect ?™•?¸)

---

## 6. Member_header.asp (ë¡œê·¸?¸ 500Â·ë¦¬ë‹¤?´? ‰?Š¸)

`Member/Login/*.asp` ?“±?—?„œ Header ?‹¤?Œ?— include.

```asp
if session("my_server_ip") = "" or ... or (IP ë¶ˆì¼ì¹? and s_info = "on") then
  response.redirect(a_info & u_info & "?" & q_info)
end if
```

- `my_server_ip`?Š” `top.asp`?—?„œ ?„¤? • (?¼ë°? Mobile ê²½ë¡œ)
- SSL/ë¡œë“œë°¸ëŸ°?„œ ?™˜ê²½ì—?„œ IP ë¶ˆì¼ì¹? ?‹œ **ë¦¬ë‹¤?´? ‰?Š¸ ë£¨í”„Â·500** ê°??Š¥
- ë¡œê·¸?¸ 500 ?‹œ: IIS ?ƒ?„¸ ASP ?˜¤ë¥? + Network redirect ì²´ì¸ ?™•?¸

---

## 7. ì§„ë‹¨ URL

| URL | ê¸°ë?? ê²°ê³¼ |
|-----|-----------|
| `/Mobile/Include/pkg_mobile_menu_check.asp` | `PkgMobileMenuShow=0` ?˜?Š” `1` |
| `/Mobile/Member/Login/login.asp` | HTTP 200, ë¡œê·¸?¸ ?¼ |
| `/mobile/index.asp` | HTTP 200, GnbÂ·ë©”ë‰´ |

---

## 8. ?‘?—… ë¶„ë¥˜ ? ë¬´ì—‡?„ ?–´?””?„œ ?ˆ˜? •?• ì§?

| ?‘?—… ?œ ?˜• | ?ˆ˜? • ?œ„ì¹? | ê±´ë“œë¦¬ì?? ë§? ê²? |
|-----------|-----------|----------------|
| ëª¨ë°”?¼ ë©”ë‰´ UI/JS | `Gnb.asp`, `common.js` | `top.asp`, apply |
| ?Œ¨?‚¤ì§? apply UX/ê²°ì œ | `web/Page/Package/apply/` | Gnb, common.js |
| ?Œ¨?‚¤ì§? ë©”ë‰´ ë§í¬ë§? | `page_01_01_cate.asp` only | Gnb, Header, common.js |
| ?Œ¨?‚¤ì§? ë©”ë‰´ ON/OFF | DB + `pkg_mobile_menu_show.asp` | Gnb êµ¬ì¡° |
| ê´?ë¦¬ì PKG | `Tools/03_Lecture/PKG/` | Mobile Header |

---

## 9. ?‘?—… ì²´í¬ë¦¬ìŠ¤?Š¸

### ë³?ê²? ? „

- [ ] Tools / Mobile / Web apply ì¤? **?–´?Š ?˜?—­** ?‘?—…?¸ì§? ë¶„ë¥˜
- [ ] Include ?˜?–¥ ë²”ìœ„ ?™•?¸ (GnbÂ·Headerë©? ? „?—­)
- [ ] Gnb **?¼ë°? / Landing** ?‘˜ ?‹¤ ?•„?š”?•œì§? ?™•?¸
- [ ] **`YEOGICYBER_MAIN_2026`ë§?** ë°°í¬ (`Yeogistudy_Web_MD.md` Â§1)

### ë³?ê²? ?›„

- [ ] UTF-8 BOM ?—†?Œ, ?•œê¸? ?‚¤?›Œ?“œ(`ë¡œê·¸?¸`, `ë©”ë‰´`) ? •?ƒ
- [ ] ì§„ë‹¨ URL 3ì¢? HTTP 200
- [ ] DevTools Console ?˜¤ë¥? 0
- [ ] www0 ë°°í¬ ?›„ ?™?¼ ?™•?¸

### ?¥?•  ?‹œ 1ì°? ?™•?¸

1. **ASP 500** ?†’ include ?ŒŒ?¼ ?ˆ„?½ / ASP ë³??ˆ˜ ë¯¸ì •?˜ (`PkgMobileMenuShow` ?“±)
2. **ë©”ë‰´ ?•ˆ ?—´ë¦?** ?†’ Console `showLeft` ReferenceError
3. **?•œê¸? ê¹¨ì§** ?†’ ?ŒŒ?¼ ?¸ì½”ë”© ?˜¼?… ?†’ pristineÂ·ë°±ì—… ë³µêµ¬

---

## 10. ?´?Šˆ ?´? ¥ (2026-07)

1. ?Œ¨?‚¤ì§? ëª¨ë°”?¼ ë©”ë‰´ ì¶”ê?? ?‹œ `Gnb.asp`Â·`Header.asp`Â·`common.js` ?™?‹œ ?ˆ˜? • ?†’ ? „?—­ ?¥?• 
2. `Gnb.asp` ?¸ì½”ë”© ?†?ƒ(UTF-8/CP949 ?˜¼?•©) ?†’ ë©”ë‰´Â·ë¡œê·¸?¸ ?¼ë²? ê¹¨ì§
3. `Gnb`?— `iRate` ?“± Mobile include ì²´ì¸?— ?—†?Š” ë³??ˆ˜ ?‚½?… ?†’ **? „ ?˜?´ì§? 500**
4. `Include/Header.asp`?—?Š” pkg include ?—†ê³?, `Landing/include/Header.asp`?—ë§? ?ˆ?Š” **ë¶ˆì¼ì¹?** ?ƒ?ƒœë¡? ë³µì›?¨
5. **apply(CP949) ?†’ ?™ˆ(UTF-8)** ?´?™ ?‹œ Gnb ë©”ë‰´ ê¹¨ì§ ?†’ zone crossing. **Â§12Â·Â§14, `Yeogistudy_Encoding_Migration_MD.md` Â§5.4**
6. **Gnb.asp** ë©”ë‰´ ?•œê¸? ?†?ƒ ?†’ `Gnb_menu_utf8.inc.asp` ë¶„ë¦¬Â·entity ë³µêµ¬ (2026-07-17). alert/Validate ?“± **?¼ë¶? ?”?—¬ ?†?ƒ** ê°??Š¥
7. **PC?†”Mobile Footer ë§í¬** ì§ì ‘ ?´?™ ?‹œ Session ê¹¨ì§ ?†’ **`zone_enter.asp`** ê²½ìœ  (Â§14)

---

## 12. Mobile v2 ? GnbÂ·?™ˆÂ·Session ë¸Œë¦¿ì§? (?‹ ê·? ê²½ë¡œ)

> **ê¸°ì¡´ `Gnb.asp`Â·`Header.asp`Â·`index.asp` ?ˆ˜? • ?—†?´** v2 ë³‘í–‰. ë¡œë“œë§?: `Yeogistudy_Encoding_Migration_MD.md`

### 12.1 ë¬¸ì œ??? ëª©í‘œ

- v1: ëª¨ë°”?¼ applyê°? Web CP949ë¡? redirect ?†’ ?™ˆ(`org_url`) ?´?™ ?‹œ **ë©”ë‰´Â·Session ?•œê¸? ê¹¨ì§**
- v2: Mobile UTF-8 êµ¬ê°„?— ë¨¸ë¬´ë¥´ê³ , ?™ˆ??? **ëª…ì‹œ?  ë¸Œë¦¿ì§?** ê²½ìœ 

### 12.2 v2 ?ŒŒ?¼ ë§? (ê³„íš)

```
mobile/Page/go_home.asp              # zone crossing ë¸Œë¦¿ì§? (?‹ ê·?)
mobile/Include/session_utf8.asp      # Session ?•œê¸? ?†’ DB ?¬ì¡°íšŒ (?‹ ê·?)
mobile/Include/v2_shell_vars.asp     # v2 metaÂ·?™ˆÂ·?Œ¨?‚¤ì§? ê²½ë¡œ (?‹ ê·?)
mobile/Include/Gnb_v2_shell.asp      # Mobile Gnb ë§ˆí¬?—… UTF-8 (?‹ ê·?)
mobile/Include/Header_v2_shell.asp   # body + wrap + Gnb_v2_shell (?‹ ê·?)
mobile/Include/Footer_v2_shell.asp   # Mobile Footer + common.js (?‹ ê·?)
mobile/Include/Gnb_v2.asp            # ?†’ Gnb_v2_shell ?œ„?„ (?˜¸?™˜)
mobile/Page/Package/v2/include/top_v2.asp    # top + Header_v2_shell
mobile/Page/Package/v2/include/footer_v2.asp # footer_v2_shell
mobile/index_v2.asp                  # v2 ?™ˆ ?—ˆë¸?
```

### 12.3 go_home.asp ? zone ë¸Œë¦¿ì§?

**?—­?• :** CP949 apply ë°©ë¬¸ ?›„ UTF-8 mobile ?™ˆ ì§„ì… ?‹œ CodePageÂ·?‘œ?‹œ?š© ?•œê¸? ? •ë¦?

- **`zone_session_refresh.asp`** include (2026-07-17) ? `session("username")` DB ?¬ì¡°íšŒ
- PC?†”Mobile Footer ? „?™˜??? **`zone_enter.asp`** (Â§14)

```asp
<%@Language="VBScript" CODEPAGE="65001"%>
<%
Session.CodePage = 65001
Response.CharSet = "utf-8"
' session("username") ì§ì ‘ ì¶œë ¥ ê¸ˆì?? ?†’ session_utf8.asp ?—?„œ DB ?¬ì¡°íšŒ
If MobileHomeV2Enabled Then
  Response.Redirect "/mobile/index_v2.asp"
Else
  Response.Redirect "/mobile/index.asp"
End If
%>
```

- apply v2 ?—¤?” ?™ˆ ë§í¬: **`/mobile/Page/go_home.asp`** (`org_url` ?‚¬?š© ê¸ˆì??)
- v1 apply?Š” ë³?ê²½í•˜ì§? ?•Š?Œ ? v2 ?—¤?”(`header_v2.asp`)?—?„œë§? ? ?š©

### 12.4 session_utf8.asp

- UTF-8 ?˜?´ì§? ê³µí†µ include
- `session("userid")`ë¡? **DB?—?„œ MEM_NAME ?¬ì¡°íšŒ** ?†’ `display_username` ?“± ë³„ë„ ë³??ˆ˜
- **`session("username")`?„ Gnb/?—¤?”?— ì§ì ‘ ì¶œë ¥?•˜ì§? ?•Š?Œ** (CP949 zone?—?„œ ?˜¤?—¼ ê°??Š¥)

### 12.5 Gnb_v2 vs Gnb (v1)

| | v1 | v2 |
|---|-----|-----|
| ?ŒŒ?¼ | `Include/Gnb.asp` | `Include/Gnb_v2.asp` |
| ?ˆ˜? • | ?œ ì§?Â·ìµœì†Œ | ?‹ ê·? UTF-8 ?‘?„± |
| ë©”ë‰´ ?¼ë²? | ASP literal | JSON/DB ê¶Œì¥ |
| Landing | `Landing/include/Gnb.asp` | `Landing/include/Gnb_v2.asp` (?Œ) |

### 12.6 v2 ? „?™˜Â·ê²?ì¦?

- DB: `pkg_config` / `MOBILE_HOME_V2`
- ê²?ì¦?: apply_v2 ?†’ **go_home** ?†’ index_v2 ?†’ Gnb_v2 ë©”ë‰´ ?•œê¸?
- `python scripts/check_asp_encoding.py mobile Include/Gnb_v2.asp`

### 12.7 v2 ?‘?—… ?‹œ ê¸ˆì??

- v1 `Gnb.asp` CodePage ë³?ê²?
- v2 ?˜?´ì§??—?„œ Web `Top.asp`(949) include
- apply v2?—?„œ `org_url` ?™ˆ ë§í¬

---

## 14. zone_enter ? PC?†”Mobile ë¸Œë¦¿ì§? (2026-07-17, v1 ?š´?˜)

> ?ƒ?„¸: `Yeogistudy_Encoding_Migration_MD.md` Â§5.4

### 14.1 ëª©ì 

DB ?”Œ?˜ê·?(v2) **OFF** ?ƒ?ƒœ?—?„œ?„ FooterÂ·Gnb?˜ **PCë²„ì „ / ëª¨ë°”?¼** ë§í¬ ?´?™ ?‹œ Session ?•œê¸?Â·ë©”ë‰´ ê¹¨ì§ ë°©ì??.

### 14.2 URL

| ë°©í–¥ | ì§„ì… |
|------|------|
| PC ?†’ Mobile | `/mobile/Page/zone_enter.asp?to=<URL>` |
| Mobile ?†’ PC | `/web/Page/zone_enter.asp?to=<URL>` |

?—°ê²? ?œ„ì¹?: `web/Include/Footer.asp`, `mobile/Include/Footer.asp`, `Footer_v2_shell.asp`, `Gnb_v2_shell.asp`

### 14.3 go_home.asp (apply ?†’ ?™ˆ)

- `zone_session_refresh.asp` include ?›„ `index.asp` / `index_v2.asp` redirect
- apply v2 ?—¤?” ?™ˆ: **`/mobile/Page/go_home.asp`** (`org_url` ?‚¬?š© ê¸ˆì??)

### 14.4 Gnb_menu_utf8.inc.asp

- `Gnb.asp` ë©”ë‰´Â·LNB ë§ˆí¬?—…ë§? UTF-8 entityë¡? ë¶„ë¦¬
- v1 `Gnb.asp` ë³¸ë¬¸ ìµœì†Œ ?ˆ˜? • ? ë©”ë‰´ include êµì²´

### 14.5 ê²?ì¦?

- PC ë¡œê·¸?¸ ?†’ ëª¨ë°”?¼ Footer ?†’ Gnb ?•œê¸?
- Mobile ?†’ PCë²„ì „ ?†’ Web ?—¤?” ?•œê¸?
- `zone_probe.asp` refresh ? „?›„ username

---

## 13. ê´?? ¨ ë¬¸ì„œÂ·?ŒŒ?¼

| ?ŒŒ?¼ | ?„¤ëª? |
|------|------|
| `Yeogistudy_Web_MD.md` | **ë°°í¬ ê²½ë¡œ(MAIN_2026)** Â· PC Web Â· ?ˆ˜ê°•ì‹ ì²? Â§2 |
| `Yeogistudy_Mobile_MD.md` | ë³? ë¬¸ì„œ |
| `Yeogistudy_Encoding_Migration_MD.md` | zone crossing Â· Phase ë¡œë“œë§? Â· **Â§5.4 zone_enter** |
| `Yeogistudy_Package_Apply_MD.md` | apply v1/v2 Â· API Â· Â§15 ?•™ê¸°í‘œê¸? Â· Â§16 ëª¨ë°”?¼ UI |
| `Yeogistudy_LMS_MD.md` | Tools(LMS) ? CP949 |
| `scripts/check_asp_encoding.py` | CP949/UTF-8 ?‚¬? „ ê²??‚¬ |
| `.cursor/rules/yeogistudy-mobile.mdc` | Cursor AI Mobile ê·œì¹™ |
| `.cursor/rules/yeogistudy-package-apply.mdc` | Apply v2 Agent ê·œì¹™ |
