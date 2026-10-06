# Yeogistudy ?Œ¨?‚¤ì§? ?ˆ˜ê°•ì‹ ì²? (Apply) ê°œë°œ ê°??´?“œ

> ìµœì¢… ? •ë¦?: 2026-07-18  
> ????ƒ: `YEOGICYBER_MAIN_2026\web\Page\Package\apply\`, `mobile\`, Tools PKG  
> **ë°°í¬:** **`YEOGICYBER_MAIN_2026`ë§?** (`Yeogistudy_Web_MD.md` Â§1)

---

## 1. ?˜?—­ êµ¬ë¶„ - Mobile Gnb ?‰  Apply ë³¸ì²´

| ? ˆ?´?–´ | ?—­?•  | ?¸ì½”ë”© |
|--------|------|--------|
| Mobile Gnb ë§í¬ | ë©”ë‰´?—?„œ ì§„ì… URL ? œê³? | UTF-8 |
| `mobile/Page/Package/apply.asp` | **ë¦¬ë‹¤?´? ‰?Š¸ë§?** | UTF-8 |
| `web/Page/Package/apply/` | ?‹¤? œ ?ˆ˜ê°•ì‹ ì²? UIÂ·ê²°ì œ | **CP949 (EUC-KR)** |
| Tools `03_Lecture/PKG/` | ?Œ¨?‚¤ì§? ?“±ë¡Â·ëª¨ë°”ì¼ ë©”ë‰´ ON/OFF | CP949 |

**Apply UX/ê²°ì œ ?ˆ˜? •??? `web/Page/Package/apply/`?—?„œ ?•˜ê³?, Mobile Gnb/common.js?Š” ê±´ë“œë¦¬ì?? ?•Š?Šµ?‹ˆ?‹¤.**

---

## 2. URL ?ë¦?

```
[ëª¨ë°”?¼ Gnb]
  "?Œ¨?‚¤ì§? ?ˆ˜ê°•ì‹ ì²?" ë§í¬
    ?†’ /Mobile/Page/Package/apply.asp
        ?†’ code ?—†?Œ: /web/page/package/apply/index.asp  (?—ˆë¸ŒÂ·ê³¼? • ?„ ?ƒ)
        ?†’ code ?ˆ?Œ: /web/page/package/apply/apply.asp?code=...

[PC]
  /web/page/package/apply/index.asp
  /web/page/package/apply/apply.asp?code=...
```

### 2.1 Mobile redirect (`mobile/Page/Package/apply.asp`)

```asp
If m_code = "" Then
  m_url = "/web/page/package/apply/index.asp"
Else
  m_url = "/web/page/package/apply/apply.asp?code=" & Server.URLEncode(m_code)
End If
Response.Redirect m_url
```

---

## 3. Apply ?˜?´ì§? êµ¬ì¡° (`web/Page/Package/apply/`)

```
apply/
?”œ?????? index.asp              # ?Œ¨?‚¤ì§? ?—ˆë¸? (ê³¼ì • ì¹´ë“œ ëª©ë¡)
?”œ?????? apply.asp              # ê°œë³„ ?Œ¨?‚¤ì§? ?ˆ˜ê°•ì‹ ì²?Â·ê²°ì œ
?”œ?????? apply_toss_test.asp    # Toss PG ?…Œ?Š¤?Š¸ ì§„ì… (?š´?˜ apply??? ë¶„ë¦¬)
?”œ?????? css/apply.css          # focus ? ˆ?´?•„?›ƒ + ëª¨ë°”?¼ @media
?””?????? include/
    ?”œ?????? Header_apply_focus.asp   # focus ?—¤?” (ë¡œê·¸?¸Â·ë©”ë‰´)
    ?”œ?????? Footer_apply_focus.asp
    ?”œ?????? pkg_apply_focus_vars.asp # Dim ì¤‘ë³µ ë°©ì?? ?†µ?•©
    ?”œ?????? pkg_apply_data.asp       # DBÂ·?Œ¨?‚¤ì§? ?°?´?„°
    ?”œ?????? pkg_apply_nav.asp        # ?ƒ?‹¨ nav (PC/ëª¨ë°”?¼)
    ?”œ?????? pkg_apply_hero.asp
    ?”œ?????? pkg_apply_steps.asp
    ?”œ?????? pkg_apply_pay.asp        # ê²°ì œ UX
    ?”œ?????? pkg_apply_support.asp    # ?•™?Šµì§??› ?„œë¹„ìŠ¤ ê·¸ë¦¬?“œ
    ?”œ?????? pkg_apply_meta.asp
    ?”œ?????? pkg_apply_remark_util.asp
    ?”œ?????? pkg_apply_copy_util.asp
    ?”œ?????? pkg_apply_copy_presets.asp
    ?””?????? pkg_apply_ai_config.asp
```

### 3.1 Include ?ˆœ?„œ (apply.asp)

```
TopHeadInfo.asp (Web ê³µí†µ, CP949)
  ?†’ pkg_apply_data.asp
  ?†’ Header_apply_focus.asp
       ?†’ pkg_apply_focus_vars.asp
  ?†’ (ë³¸ë¬¸ ?„¹?…˜ includes)
  ?†’ Footer_apply_focus.asp
```

### 3.2 Focus ? ˆ?´?•„?›ƒ

- PC/Web GNB ????‹  **? „?š© ?—¤?”** (`pkg-apply-focus-header`)
- ëª¨ë°”?¼: `@media (max-width: 768px)` in `apply.css`
- `Header_apply_focus.asp` ?ˆ˜? • ?‹œ **Dim ë³??ˆ˜ ì¤‘ë³µ** ì£¼ì˜ ?†’ `pkg_apply_focus_vars.asp` ?‚¬?š©

---

## 4. ëª¨ë°”?¼ ë©”ë‰´ ?…¸ì¶? (?Œ¨?‚¤ì§? ë§í¬) ? 3?‹¨ê³?

?Œ¨?‚¤ì§? ë©”ë‰´ê°? ë³´ì´? ¤ë©? **?•„?˜ ?…‹?´ ëª¨ë‘** ?•„?š”?•©?‹ˆ?‹¤.

| ?‹¨ê³? | ?‚´?š© |
|------|------|
| 1. DB | `CODE_DTL`: `GRP_COM_CODE='pkg_config'`, `COM_CODE='MOBILE_MENU'`, `USE_CHK='1'` |
| 2. Include | `pkg_mobile_menu_show.asp` ?†’ `PkgMobileMenuShow = True/False` |
| 3. Gnb | `<%If PkgMobileMenuShow Then%>` ë§í¬ 1ì¤? |

### 4.1 DB ?„¤? •

```sql
-- Tools/03_Lecture/PKG/sql/insert_pkg_config_mobile_menu.sql ì°¸ê³ 
SELECT USE_CHK FROM CODE_DTL
 WHERE GRP_COM_CODE = 'pkg_config' AND COM_CODE = 'MOBILE_MENU'
```

### 4.2 `pkg_mobile_menu_show.asp`

- ê²½ë¡œ: `mobile/Include/pkg_mobile_menu_show.asp`
- `Conn`Â·`DBHelper` ?•„?š” ?†’ **top.asp ?´?›„**, DB ?—°ê²°ëœ Header?—?„œ include
- `On Error Resume Next`ë¡? DB ?‹¤?Œ¨ ?‹œ `PkgMobileMenuShow = False` (?˜?´ì§? 500 ë°©ì??)

### 4.3 Gnb ë§í¬ (?˜ˆ: Landing Gnb ?ˆ˜ê°•ì‹ ì²? toggle_sub ?‚´ë¶?)

```asp
<%If PkgMobileMenuShow Then%>
<a href="/Mobile/Page/Package/apply.asp" title="?Œ¨?‚¤ì§? ?ˆ˜ê°•ì‹ ì²?">- ?Œ¨?‚¤ì§? ?ˆ˜ê°•ì‹ ì²?</a>
<%End If%>
```

### 4.4 ?—°?™ ë²”ìœ„ (2026-07-11)

| ?œ„ì¹? | ê´?ë¦¬ì MOBILE_MENU ?—°?™ |
|------|------------------------|
| `Sub/enroll-in-classes/page_01_01_cate.asp` **?Œ¨?‚¤ì§? ë°”ë¡œê°?ê¸?** | **?—°?™ (?…¸ì¶?/ë¹„ë…¸ì¶?)** |
| `Include/Gnb.asp` ?–„ë²„ê±° ë©”ë‰´ | **?—°?™ ?•ˆ ?•¨** |
| `Landing/include/Gnb.asp` | **?—°?™ ?•ˆ ?•¨** |

- ?ˆ˜ê°•ì‹ ì²? ?ƒ­?˜ ?Œ¨?‚¤ì§? ë°”ë¡œê°?ê¸?: `page_01_01.asp`?—?„œ DB ì¡°íšŒ ?›„ `page_01_01_cate.asp`?— `PkgMobileMenuShow` ? „?‹¬ (**`cate.asp` ?‚´ë¶? virtual include ?‚¬?š© ê¸ˆì??** ? IIS 500 ?›?¸)
- Gnb/Header?—?Š” pkg include ?—†?Œ.

### 4.5 Header ë¶ˆì¼ì¹? (ê³¼ê±°)

| Header | pkg include | Gnb | ?Œ¨?‚¤ì§? ë§í¬ |
|--------|-------------|-----|-------------|
| `Include/Header.asp` | **?—†?Œ** | `Include/Gnb.asp` | **?—†?Œ** |
| `Landing/include/Header.asp` | **?ˆ?Œ** | `Landing/include/Gnb.asp` | **?ˆ?Œ** |

?¼ë°? ëª¨ë°”?¼?—?„ ?…¸ì¶œí•˜? ¤ë©? **?¼ë°? Header + Include/Gnb**?— ?™?¼ ?Œ¨?„´ ? ?š© (?‹¨ê³„ì ).

---

## 5. ?•ˆ? „?•œ ëª¨ë°”?¼ ë©”ë‰´ ì¶”ê?? ?ˆœ?„œ (?¬? ?š© ?‹œ)

1. DB `USE_CHK` ?™•?¸ (?˜?Š” ê´?ë¦¬ì `pkg_list.asp` ëª¨ë°”?¼ ë©”ë‰´ UI)
2. `/Mobile/Include/pkg_mobile_menu_check.asp` ?†’ `PkgMobileMenuShow=1` ?™•?¸
3. `Header.asp`?— include **?•œ ì¤?** ì¶”ê??:

   ```asp
   <!--#include virtual="/Mobile/Include/pkg_mobile_menu_show.asp"-->
   ```

4. `Gnb.asp` `toggle_sub`(?ˆ˜ê°•ì‹ ì²? ë¸”ë¡)?— ë§í¬ **?•œ ì¤?** (?œ„ 4.3)
5. **`common.js`, `Member_header.asp`, `top.asp` ?ˆ˜? •?•˜ì§? ?•Š?Œ**
6. `/Mobile/Page/Package/apply.asp` ?†’ web apply redirect ?™•?¸

---

## 6. Tools (ê´?ë¦¬ì) ?—°?™

| ?ŒŒ?¼ | ?—­?•  |
|------|------|
| `Tools/03_Lecture/PKG/pkg_list.asp` | ?Œ¨?‚¤ì§? ëª©ë¡ + ëª¨ë°”?¼ ë©”ë‰´ ON/OFF UI |
| `Tools/03_Lecture/PKG/Ajax/pkg_mobile_menu_ajax.asp` | `MOBILE_MENU` USE_CHK ????¥ |
| `Tools/03_Lecture/PKG/sql/insert_pkg_config_mobile_menu.sql` | ì´ˆê¸° CODE_DTL |

- Tools?Š” **CP949** ? `Yeogistudy_LMS_MD.md` ê·œì¹™ ?”°ë¦?
- ê´?ë¦¬ì ?™•?¸ URL: `{ORG_URL}/Mobile/Include/pkg_mobile_menu_check.asp`

---

## 7. Apply ê°œë°œ ì²´í¬ë¦¬ìŠ¤?Š¸

### UX/ê¸°ëŠ¥ (web apply)

- [ ] `index.asp` ?—ˆë¸? ì¹´ë“œÂ·ë§í¬
- [ ] `apply.asp` ê³¼ëª© ?„ ?ƒÂ·ê²°ì œÂ·?™?˜
- [ ] `apply.css` ëª¨ë°”?¼ 768px ?´?•˜
- [ ] focus ?—¤?” ë¡œê·¸?¸ return URL (`focus_login_return`)

### Mobile ë©”ë‰´ ?—°?™ (ë³„ë„ ?‘?—…)

- [ ] DB USE_CHK
- [ ] check.asp = 1
- [ ] Header include + Gnb ë§í¬ (?¼ë°?/Landing ?–‘ìª? ?•„?š” ?‹œ ?‘˜ ?‹¤)
- [ ] apply.asp redirect

### ë°°í¬

- [ ] **`YEOGICYBER_MAIN_2026`ë§?** ë°°í¬ (www0 Â· `2024_MAIN` ?‚¬?š© ?•ˆ ?•¨)
- [ ] Mobile(UTF-8)ê³? Web apply(CP949) **?˜¼?™ ????¥ ê¸ˆì??**

---

## 8. ?¥?•  ?Œ¨?„´

| ì¦ìƒ | ?›?¸ |
|------|------|
| ? „ ëª¨ë°”?¼ 500 | Gnb/Header?— ë¯¸ì •?˜ ASP ë³??ˆ˜, include ?ŒŒ?¼ 404 |
| ë©”ë‰´?— ?Œ¨?‚¤ì§? ?•ˆ ë³´ì„ | DB USE_CHK=0, Header?— pkg include ?—†?Œ, Gnb ë§í¬ ?—†?Œ |
| ?Œ¨?‚¤ì§? ?´ë¦? ?‹œ 404 | `apply.asp` redirect ê²½ë¡œÂ·web apply ë¯¸ë°°?¬ |
| apply ?•œê¸? ê¹¨ì§ | web apply CP949 ?ŒŒ?¼ UTF-8 ????¥ |
| apply?†’?™ˆ ?´?™ ?‹œ ë©”ë‰´ ê¹¨ì§ | zone crossing (CP949 apply ?†’ UTF-8 mobile). **`go_home.asp` / `zone_enter`** ? Â§10Â·Â§14, Migration MD Â§5.4 |
| ë©”ë‰´Â·ë¡œê·¸?¸ ? „ì²? ?´?ƒ | Mobile Gnb/common.js ?™?‹œ ?ˆ˜? • (Apply??? ë¬´ê???•˜ê²? ? „?—­ ?¥?• ) |
| ëª¨ë°”?¼ ì¹´ë“œ ê²°ì œ ë¬´í•œ ë¡œë”© | Toss `PKGSend_step01_mobile.asp` ? ?š´?˜??? Niceë¡? ?†µ?¼ (**Â§12**) |
| ì¹´ë“œ ê²°ì œ ì·¨ì†Œ ?‹œ PC applyë¡? ?´?™ | `PKGSend_step01_mobile.asp`ê°? `a_referer`ë§? ?‚¬?š© ? Form `referer_url` ?š°?„  (**Â§12.2**) |
| ??Œí•™?Šµì§??› ?„œë¹„ìŠ¤??? ?•„?˜ `` ê¹¨ì§ | `apply.css` `content:"?˜…"` ? `\2605` Unicode escape ?‚¬?š© (**Â§12.4**) |

---

## 10. Apply v2 (Mobile UTF-8 Â· ?‹ ê·? ê²½ë¡œ)

> **ê¸°ì¡´ v1 ?ŒŒ?¼ ?ˆ˜? • ?—†?´** ?‹ ê·? ?ŒŒ?¼ë§? ì¶”ê??. ?ƒ?„¸ ë¡œë“œë§?: `Yeogistudy_Encoding_Migration_MD.md`

### 10.1 v1 vs v2

| | v1 (?œ ì§?) | v2 (?‹ ê·?) |
|---|-----------|-----------|
| ëª¨ë°”?¼ ì§„ì… | `mobile/Page/Package/apply.asp` | `mobile/Page/Package/apply_v2.asp` |
| ë³¸ë¬¸ | `web/.../apply/apply.asp` (**CP949**) | `mobile/Page/Package/v2/apply.asp` (**UTF-8**) |
| ?™ˆ ë§í¬ | `org_url` (Web ë£¨íŠ¸) | `/mobile/Page/go_home.asp` |
| ? „?™˜ | ê¸°ë³¸ | DB `pkg_config` / `APPLY_MOBILE_V2` |

### 10.2 v2 ?””? ‰?„°ë¦? (ê³„íš)

```
mobile/Page/Package/
  apply.asp              # v1 ?œ ì§?
  apply_v2.asp           # ?”Œ?˜ê·? ë¶„ê¸° ?¼?š°?„° (?‹ ê·?)
  v2/
    apply.asp            # UTF-8 ë³¸ë¬¸
    index.asp            # UTF-8 ?—ˆë¸?
    include/
      top_v2.asp         # CodePage 65001, Web Top.asp include ê¸ˆì??
      header_v2.asp      # ?™ˆ ?†’ go_home.asp
      data_loader.asp    # DB ?†’ UTF-8

web/Page/Package/apply/
  apply.asp              # v1 ?œ ì§?
  api/                   # JSON API (?‹ ê·?)
    pkg_get.asp          # code ?†’ ?Œ¨?‚¤ì§? JSON
    pkg_list.asp         # ?—ˆë¸? ëª©ë¡ JSON
```

### 10.3 API ? ˆ?´?–´ ?›ì¹?

- `Response.CharSet = "utf-8"` Â· JSON ì¶œë ¥
- ?‚´ë¶? DBHelper(CP949 include) ?‚¬?š© ê°??Š¥ ? **?‘?‹µë§? UTF-8**
- v2 UI?Š” API ?˜¸ì¶? ?˜?Š” `data_loader.asp` ? **Web apply include ì²´ì¸ ê³µìœ  ê¸ˆì??**

### 10.4 apply_v2 ?¼?š°?„° (?‹ ê·? ?ŒŒ?¼ ?˜ˆ?‹œ)

```asp
' mobile/Page/Package/apply_v2.asp ? apply.asp ?Š” ?ˆ˜? •?•˜ì§? ?•Š?Œ
If PkgApplyMobileV2Enabled Then
  Response.Redirect "/mobile/Page/Package/v2/apply.asp?code=" & Server.URLEncode(m_code)
Else
  Response.Redirect "/web/page/package/apply/apply.asp?code=" & Server.URLEncode(m_code)
End If
```

### 10.5 v2 ì²´í¬ë¦¬ìŠ¤?Š¸

- [ ] v1 `apply.asp`Â·`Header_apply_focus.asp` **ë¯¸ìˆ˜? •**
- [ ] v2 top: Web `Top.asp`(949) include **?—†?Œ**
- [ ] ?™ˆ: `go_home.asp` ê²½ìœ  (`Yeogistudy_Mobile_MD.md` Â§12)
- [ ] ?”Œ?˜ê·? OFF ?‹œ v1ê³? ?™?¼ ?™?‘
- [ ] `check_asp_encoding.py mobile` v2 ?ŒŒ?¼ ?†µê³?

---

## 12. ê²°ì œ PG (2026-07-15)

### 12.1 ?š´?˜ ë¶„ê¸° (`apply.asp`)

`Pay()` ?†’ `getPkgPgStep01Url()`:

| ?™˜ê²? | ê²½ë¡œ |
|------|------|
| PC | `/Web/include/asp/pg/nice/PKGSend_step01.asp` |
| Mobile (ê¸°ë³¸) | `/Web/include/asp/pg/nice/PKGSend_step01_mobile.asp` |
| Mobile + **`pg=toss`** (?…Œ?Š¤?Š¸ë§?) | `/mobile/include/asp/pg/toss/PKGSend_step01_mobile.asp` |

- **2026-07-15:** ëª¨ë°”?¼ ?‹ ?š©ì¹´ë“œ(`CARD`)?„ ê°??ƒê³„ì¢Œ ?“±ê³? ?™?¼?•˜ê²? **NicePay mobile** ?‚¬?š© (Toss ?š´?˜ ?—°ê²? ì¤‘ë‹¨).
- Toss ?¬ê°? ? „ê¹Œì?? ?š´?˜ URL(`apply.asp?code=...`)??? Niceë§? ?‚¬?š©.

### 12.2 Toss ?…Œ?Š¤?Š¸ (?š´?˜ê³? ë¶„ë¦¬)

| ì§„ì… | ?„¤ëª? |
|------|------|
| `apply_toss_test.asp?code=29&embed=mobile_v2&zone=mobile` | `apply.asp?pg=toss&...` ë¡? redirect, ?ƒ?‹¨ **Toss PG ?…Œ?Š¤?Š¸ ëª¨ë“œ** ë°°ë„ˆ |
| `apply.asp?code=29&pg=toss&embed=mobile_v2&zone=mobile` | ?™?¼ (ì§ì ‘ ? ‘ê·?) |

Toss ?•ˆ? •?™”Â·?„ë©”ì¸ ?“±ë¡? ?™•?¸ ?›„?—ë§? `getPkgPgStep01Url()` ?š´?˜ ë¶„ê¸° ? „?™˜.

### 12.3 ì·¨ì†ŒÂ·?‹¤?Œ¨ ë³µê?? URL

**`pkg_apply_data.asp` ? `apply_return_url`**

- ê¸°ë³¸: `/Web/page/package/apply/apply.asp?code=...`
- `zone=mobile` **?˜?Š”** `embed=mobile_v2`: `/mobile/Page/Package/v2/apply.asp?code=...`

**`PKGSend_step01_mobile.asp` (nice)**

1. `Request.Form("referer_url")` ?š°?„  (apply hidden ?•„?“œ)
2. ?—†?œ¼ë©? `a_referer`
3. web apply + embed/mobile ?´ë©? ?†’ mobile v2 apply URLë¡? ? •ê·œí™”
4. `session("se_pkg_referer_url")` ????¥

**`PKGSend_step02.asp` (nice)**

1. `Request.Form("referer_url")` ?†’ ?—†?œ¼ë©? `session("se_pkg_referer_url")`
2. embed/mobile web apply URL?´ë©? mobile v2ë¡? ? •ê·œí™”

**ë³??ˆ˜ëª? ì£¼ì˜ (?Œ¨?‚¤ì§? PG ê³µí†µ)**

| Form name | ?˜ë¯? |
|-----------|------|
| `pkg_code` | ?Œ¨?‚¤ì§? ë²ˆí˜¸ (`PKG_CODE`, ?˜ˆ: 29) |
| `pkg_num` | ?•™ê¸? `gubun_code` (?„ ?ƒ ?¼?””?˜¤ ê°?) |

step01/02 ?‚´ë¶? ë³??ˆ˜ `strpkg_num`/`strpkg_code`?Š” **?œ„??? ë°˜ë??ë¡? ë§¤í•‘**?˜?–´ ?ˆ?Œ ? ë³µê?? URLÂ·SQL ?ˆ˜? • ?‹œ ?˜¼?™ ê¸ˆì??.

### 12.4 UIÂ·ê¸°í??

| ?•­ëª? | ?ŒŒ?¼ | ?‚´?š© |
|------|------|------|
| ?˜?ˆ˜ì¦? ?¸?‡„ ë¹„ë…¸ì¶? | `include/pkg_apply_pay.asp` | ê²°ì œ?™„ë£? NicePay TID ?Œ?—… ? `If False And` ë¡? ë¹„í™œ?„± (ë³µêµ¬ ?‹œ ì¡°ê±´ ? œê±?) |
| ?•™?Šµì§??› ë³? ?¥?‹ | `css/apply.css` | `.pkg-apply-support-stars span::before { content:"\2605"; }` ? EUC-KR ?˜?´ì§??—?„œ `?˜…` literal CSS ê¸ˆì?? |

### 12.5 ?ˆ˜? • ?ŒŒ?¼ (www0 ë°°í¬)

| ?ŒŒ?¼ | ?š”?•½ |
|------|------|
| `web/Page/Package/apply/apply.asp` | Nice ?†µ?¼, `getPkgPgStep01Url()`, `pgTossTest` |
| `web/Page/Package/apply/apply_toss_test.asp` | Toss ?…Œ?Š¤?Š¸ ì§„ì… (?‹ ê·?) |
| `web/Page/Package/apply/include/pkg_apply_data.asp` | `embed=mobile_v2` ë³µê?? URL |
| `web/Page/Package/apply/include/pkg_apply_pay.asp` | ?˜?ˆ˜ì¦? ë²„íŠ¼ ë¹„ë…¸ì¶? |
| `web/Page/Package/apply/css/apply.css` | ë³? `\2605` |
| `web/include/asp/pg/nice/PKGSend_step01_mobile.asp` | referer_url ?š°?„ Â·mobile ? •ê·œí™” |
| `web/include/asp/pg/nice/PKGSend_step02.asp` | referer session fallback Â· 9ê³¼ëª© INSERT JOIN `b.cs_season` (Â§13Â·LMS MD) |
| `include/pkg_apply_data.asp` | `PkgApplyHakgiLabel` ?•™ê¸°Â·ì°¨ ?ŒŒ?‹± (Â§15) |
| `include/pkg_apply_seasons.asp` | ëª¨ì§‘ ?•™ê¸°Â·ê³¼ëª©ë³´ê¸? UI ë§ˆí¬?—… (Â§16) |
| `css/apply.css` | ëª¨ë°”?¼ ê³¼ëª© ì¹´ë“œÂ·ê°•ì˜ê³„íš?„œÂ·?ˆ˜ê°•ë£Œ (Â§16) |

---

## 13. ?Œ¨?‚¤ì§? ê²°ì œ ?›„ ê³¼ëª© ?ˆ„?½ Â· Tools ë³´ì™„?“±ë¡?

> Tools ?ƒ?„¸Â·SQL ?””ë²„ê·¸: **`Yeogistudy_LMS_MD.md` Â§8 (2026-07-15)** ì°¸ì¡°.

| êµ¬ë¶„ | ?‚´?š© |
|------|------|
| ì¦ìƒ | ?Œ¨?‚¤ì§? ê²°ì œ ?™„ë£? ?›„ ?¼ë¶? ê³¼ëª©ë§? `CYBER_MEMBER_INFO` ?“±ë¡? (?˜ˆ: 9ê³¼ëª© ì¤? 8ê³¼ëª©) |
| ?‹ ê·? ê²°ì œ ë°©ì?? | MAIN `PKGSend_step02.asp` INSERT JOIN `b.cs_season` (ë¸”ë¡ ?•™ê¸? ê¸°ì??) |
| ê¸°ë“±ë¡? ?šŒ?› ë³´ì™„ | Tools `info_04_02.asp` [ë³´ê¸°] ?†’ `info_04_02_pkg_fix_view.asp` ?†’ MISS ?–‰ **ë³´ì™„?“±ë¡?** |
| 1ê³¼ëª© ì²˜ë¦¬ | `info_03_pkg_one_enroll_ok.asp` (GET, `PI_ORDERNO` ê¸°ì?? PAY_INFO ?…œ?”Œë¦? ë³µì‚¬) |

---

## 15. ëª¨ì§‘ ?•™ê¸? ?‘œê¸? (`PkgApplyHakgiLabel`) - 2026-07-17

### 15.1 ì¦ìƒ

| ?‘œ?‹œ (?˜ëª?) | ê¸°ë?? |
|-------------|------|
| `[07?›” 18?¼ ê°œê°•] 2026?…„ 2?•™ê¸? 1ì°?` (ê°œê°•ë°˜ë§ˆ?‹¤ ?™?¼) | `2026-L2-2` ?†’ **2ì°?**, `2026-L2-3` ?†’ **3ì°?** |

### 15.2 ?›?¸

- `include/pkg_apply_data.asp` - `PkgApplyHakgiLabel(csSeason, csSeasonNum)`
- **ì°?(æ¬?)** ë¥? DB `cs_season_num`(?Œ¨?‚¤ì§? ê·¸ë£¹ ?“±ë¡ìš©, ???ë¶?ë¶? `1`)?œ¼ë¡? ë¶™ì„
- ?‹¤? œ ?‘œê¸? ì°¨ìˆ˜?Š” **`cs_season` ì½”ë“œ ë§ˆì??ë§? êµ¬ê°„** (`2026-L2-**2**`)

### 15.3 ?ˆ˜? • (2026-07-17)

| ê·œì¹™ | ?ŒŒ?‹± |
|------|------|
| ?…„?„ | `Left(csSeason, 4)` |
| ?•™ê¸? | `Mid(csSeason, 7, 1)` (`L2` ?†’ 2?•™ê¸?) |
| ì°? | `Split(csSeason, "-")` ë§ˆì??ë§? ?† ?° (fallback: `cs_season_num`) |

**VBScript ì£¼ì˜:** `And`?Š” **?‹¨?½ ?‰ê°? ?•ˆ ?¨** ?†’ `cs_season_num`?´ NULL?¼ ?•Œ `CInt(Null)` ?Ÿ°????„ ?˜¤ë¥? ?†’ ?•™ê¸? ?¼ë²? **? „ì²? ê³µë°±**.  
?†’ `If` ì¤‘ì²© + `Trim("" & csSeasonNum)` ë¡? ?•ˆ? „ ì²˜ë¦¬.

### 15.4 ê´?? ¨ ?ŒŒ?¼

| ?ŒŒ?¼ | ?‚´?š© |
|------|------|
| `include/pkg_apply_data.asp` | `PkgApplyHakgiLabel` |
| `include/pkg_apply_seasons.asp` | ëª©ë¡ `grp_hakgi_range`, ê³¼ëª© SQL `hakgi` ì»¬ëŸ¼(ì°? ?¬?•¨) |

### 15.5 ?•™ê¸? ì½”ë“œ ?˜ˆ

| `cs_season` | ?‘œê¸? |
|-------------|------|
| `2026-L2-2` | 2026?…„ 2?•™ê¸? 2ì°? |
| `2026-L2-3` | 2026?…„ 2?•™ê¸? 3ì°? |
| `2026-L2-10` | 2026?…„ 2?•™ê¸? 10ì°? (?‘ ?ë¦?) |

---

## 16. ëª¨ë°”?¼ ê³¼ëª©ë³´ê¸° UI (`apply.css`) - 2026-07-17

ëª¨ë°”?¼Â·embed(`body.pkg-apply-embed-body`)?—?„œ **ê³¼ëª©ë³´ê¸°** ?¼ì¹? ?‹œ ì¹´ë“œ?˜• ?…Œ?´ë¸?(`@media max-width:768px`).

### 16.1 ê°•ì˜ê³„íš?„œ ë²„íŠ¼

| ì¦ìƒ | ?›?¸ |
|------|------|
| ë²„íŠ¼ ê°?ë¡œë¡œ ê³¼ë„?•˜ê²? ?Š˜?–´?‚¨, ê¸?? ?˜¤ë¥¸ìª½ ë¶™ìŒ | `td` flex + ??‹ `flex:1 1 auto` |

| ì¡°ì¹˜ | ?ŒŒ?¼ |
|------|------|
| `td.pkg-apply-plan-cell`, ë²„íŠ¼ `flex:0 0 auto`, `inline-flex` ê°??š´?° ? •? ¬ | `css/apply.css`, `pkg_apply_seasons.asp` |

### 16.2 ?ˆ˜ê°•ë£Œ ?‘œê¸?

| ë³?ê²? ? „ | ë³?ê²? ?›„ |
|---------|---------|
| ? •ê°?(ì·¨ì†Œ?„ )??? ?• ?¸ê°?ê°? ?–‘ìª½ìœ¼ë¡? ë¶„ë¦¬ | **`35,000?› (150,000)`** - ?• ?¸ê°? + ê´„í˜¸ ? •ê°? |
| | `sl_pay > pkg_pay` ?¼ ?•Œë§? ê´„í˜¸ ?‘œ?‹œ |

| ì¡°ì¹˜ | ?´?˜?Š¤ |
|------|--------|
| HTML wrap | `pkg-apply-pay-wrap` |
| flex ?•œ ?©?–´ë¦? ? •? ¬ | `td.pkg-apply-pay-cell` |

### 16.3 ë°°í¬ ?ŒŒ?¼

| ?ŒŒ?¼ |
|------|
| `include/pkg_apply_seasons.asp` |
| `css/apply.css` |

---

## 17. ê´?? ¨ ë¬¸ì„œ

| ë¬¸ì„œ | ?‚´?š© |
|------|------|
| `Yeogistudy_Web_MD.md` | **ë°°í¬ ê²½ë¡œ(MAIN_2026)** Â· PC Web Â· ?ˆ˜ê°•ì‹ ì²? |
| `Yeogistudy_Package_Apply_MD.md` | ë³? ë¬¸ì„œ |
| `Yeogistudy_Encoding_Migration_MD.md` | zone crossing Â· `zone_enter` Â§5.4 |
| `Yeogistudy_Mobile_MD.md` | Gnb Â· go_home Â· zone_enter Â§14 |
| `Yeogistudy_LMS_MD.md` | Tools PKG ê´?ë¦¬ì(CP949) Â§8 |
| `Yeogistudy_LMS_DB_MD.md` | yeogicyber DB ?Š¤?‚¤ë§? Â· CATALOG Â· tables |
| `.cursor/rules/yeogistudy-package-apply.mdc` | Apply v2 Agent ê·œì¹™ |
