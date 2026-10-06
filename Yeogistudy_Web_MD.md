# Yeogistudy Web(PC) ê°œë°œ ê°??´?“œ

> ìµœì¢… ? •ë¦?: 2026-07-18  
> ????ƒ: `YEOGICYBER_MAIN_2026\web\` (Classic ASP / IIS / **CP949**)

---

## 1. ë°°í¬ ê²½ë¡œ (?•„?ˆ˜)

| êµ¬ë¶„ | ê²½ë¡œ | ë¹„ê³  |
|------|------|------|
| **WebÂ·Mobile ë°°í¬ (?œ ?¼)** | `u:\Homepage\YEOGICYBER_MAIN_2026\` | `web\`, `mobile\` ëª¨ë‘ ?´ ?Š¸ë¦¬ë§Œ ?ˆ˜? •Â·ë°°í¬ |
| Tools (LMS) | `YEOGICYBER_2024_TOOLS\Tools\` | ë³„ë„ ?Š¸ë¦? Â· `Yeogistudy_LMS_MD.md` |
| ~~`YEOGICYBER_2024_MAIN`~~ | **?‚¬?š© ?•ˆ ?•¨** | AgentÂ·?ˆ˜?™ ?‘?—… ëª¨ë‘ **?¸ì§‘Â·ë°°?¬ ????ƒ ?•„?‹˜** |

- www0 ?“± ê°œë°œ/?š´?˜ URL??? **`YEOGICYBER_MAIN_2026`** ?†Œ?Š¤ë¥? ë°°í¬?•œ?‹¤.
- Cursor Agent?Š” Web/Mobile/Apply/?ˆ˜ê°•ì‹ ì²? ë³?ê²? ?‹œ **`YEOGICYBER_MAIN_2026` ?‚´ë§?** ?Œ¨ì¹˜í•œ?‹¤.
- `YEOGICYBER_2024_MAIN`??? ?™ê¸°í™” ë³µì‚¬ë³¸ì´ ?•„?‹ˆë¯?ë¡? **?´ì¤? ?ˆ˜? •?•˜ì§? ?•Š?Š”?‹¤.**

### 1.1 ?˜?—­ë³? ê²½ë¡œ (MAIN_2026 ê¸°ì??)

| ?˜?—­ | ê²½ë¡œ | ?¸ì½”ë”© | ë¬¸ì„œ |
|------|------|--------|------|
| PC Web | `web\` | CP949 | **ë³? ë¬¸ì„œ** |
| Mobile | `mobile\` | UTF-8 | `Yeogistudy_Mobile_MD.md` |
| ?Œ¨?‚¤ì§? apply | `web\Page\Package\apply\` | CP949 | `Yeogistudy_Package_Apply_MD.md` |
| ? „ì²´ê³¼? • ?ˆ˜ê°•ì‹ ì²? | `web\Sub\enroll-in-classes\` | CP949 | ë³? ë¬¸ì„œ Â§2 |

---

## 2. ? „ì²´ê³¼? • ?ˆ˜ê°•ì‹ ì²? ? ì´ˆê¸° ë¡œë”© ê°œì„  (2026-07-18)

> URL: `/Web/Sub/enroll-in-classes/page_01_01.asp`  
> ë°°í¬: **`YEOGICYBER_MAIN_2026\web\Sub\enroll-in-classes\`** ë§?

### 2.1 ì¦ìƒ

- ì²? ì§„ì… ?‹œ ê³¼ëª© ëª©ë¡Â·?¥ë°”êµ¬?‹ˆ AJAXê°? ?™?‹œ?— DBë¥? ?‘?“œ? ¤ **ì²´ê° ë¡œë”© ì§??—°**
- `Table1_Ajax`?Š” HTML?— ?´ë¯? ?ˆ?Š” ?‹ ì²?ê¸°ê°„ ? •ë³´ì?? **ì¤‘ë³µ**
- `page_cart.asp`Â·?‹´?‹¹? COUNT SQL?´ ë¹„ë¡œê·¸ì¸Â·ë¯¸ì‚¬?š© ì¡°ê±´?—?„œ?„ ?‹¤?–‰

### 2.2 ë³?ê²? (`page_01_01.asp` Â· JS)

| ?•­ëª? | ë³?ê²? |
|------|------|
| ì´ˆê¸° `page_data()` | **? œê±?** (?•™ê¸? ?ƒ­ ?´ë¦? ?‹œë§? `Table1_Ajax` ?˜¸ì¶?) |
| ì´ˆê¸° `page_data3()` | **`page_data2()` ?™„ë£? ?›„** `scheduleCartLoad()` (idle) |
| Cart1 / Cart2 | **ë³‘ë ¬** AJAX (ê¸°ì¡´ Cart1 success ?•ˆ?—?„œ Cart2 ?ˆœì°? ?˜¸ì¶? ? œê±?) |
| ?Œ¨?‚¤ì§? ?‹´?‹¹? COUNT | `pkg_view_gubun="N"` ?´ë©? **SQL ?ƒ?µ** |

```javascript
// page_data2 success / error ?›„
scheduleCartLoad();  // requestIdleCallback ?˜?Š” setTimeout 150ms

function page_data3() {
  // Cart1_Ajax, Cart2_Ajax ê°ê° $.ajax (ë³‘ë ¬)
}
```

### 2.3 ë³?ê²? (`page_cart.asp`)

- **ë¹„ë¡œê·¸ì¸** (`session("userid")` ?—†?Œ): ?Œ¨?‚¤ì§?/ì¿ í° coop SQLÂ·?‹´?‹¹? ?¥ë°”êµ¬?‹ˆ COUNT SQL **?Š¤?‚µ**
- ?¥ë°”êµ¬?‹ˆ ?ˆ«?Â·ëª©ë¡??? AJAX(`Cart1`/`Cart2`)ë¡? ê°±ì‹  (ê¸°ì¡´ê³? ?™?¼)

### 2.4 ë°°í¬ ?ŒŒ?¼

| ?ŒŒ?¼ |
|------|
| `web/Sub/enroll-in-classes/page_01_01.asp` |
| `web/Sub/enroll-in-classes/page_cart.asp` |

### 2.5 ê²?ì¦?

- Network: ì²? ë¡œë“œ?— `Table1_Ajax` **?—†?Œ**
- `Table2_Ajax` ?†’ (?•½ê°? ?›„) `Cart1`Â·`Cart2` **?™?‹œ** ?˜?Š” idle ?´?›„
- ?•™ê¸? ?ƒ­ ?´ë¦? ?‹œ `Table1_Ajax` ? •?ƒ
- ?¥ë°”êµ¬?‹ˆ ?‹´ê¸?/?‚­? œ ?›„ `page_data3()` ì¦‰ì‹œ ?˜¸ì¶? (Table2_Ajax ?‚´ ê¸°ì¡´ ?™?‘)

### 2.6 Table2 SQL ?””ë²„ê·¸

| ?ŒŒ?¼ë¯¸í„° | ?ŒŒ?¼ | ?š©?„ |
|----------|------|------|
| `sql_debug=1` | `ajax/page_01_01_Table2_Ajax.asp` | ê³¼ëª© ëª©ë¡ **?‹¤?–‰ SQL** plain text ì¶œë ¥ (`Response.End`) |

POST body(`#forms` serialize) ?˜?Š” GET?— `sql_debug=1` ì¶”ê??.

**?˜?´ì§? URL (ê¶Œì¥):**

```
/Web/Sub/enroll-in-classes/page_01_01.asp?sql_debug=1
```

?†’ Table2 URL?„ **?ƒˆ ì°? GET**?œ¼ë¡? ?—´?–´ SQL ?‘œ?‹œ (`charset=euc-kr` Â· CP949).

**Ajax ì§ì ‘ (GET):**

```
/Web/Sub/enroll-in-classes/ajax/page_01_01_Table2_Ajax.asp?cs_season=2026-L2-3&gubun=A&hakwi=0&code=AAAA&sql_debug=1
```

?†’ ë¸Œë¼?š°????— SQLë§? ?‘œ?‹œ (`Content-Type: text/plain`).

www0 **ë°°í¬ ?›„** ?…Œ?Š¤?Š¸. ?Œ?—… ì°¨ë‹¨ ?‹œ ?—ˆ?š© ?•„?š”.

### 2.7 ?”?—¬ (ë¯¸ì ?š© Â· Table2 SQL)

- **`ajax/page_01_01_Table2_Ajax.asp`** ????˜• SQLÂ·?–‰ë§ˆë‹¤ UDF ?†’ ê·¼ë³¸ ë³‘ëª©
- SSMS ?‹¤?–‰ ê³„íšÂ·UDF?†’JOINÂ·?˜?´ì§•ì?? **ë³„ë„ DB ?Šœ?‹** ê³¼ì œ

---

## 3. ê´?? ¨ ë¬¸ì„œ

| ë¬¸ì„œ | ?‚´?š© |
|------|------|
| `Yeogistudy_Web_MD.md` | **ë³? ë¬¸ì„œ** Â· ë°°í¬ ê²½ë¡œ Â· ?ˆ˜ê°•ì‹ ì²? |
| `Yeogistudy_LMS_MD.md` | Tools CP949 |
| `Yeogistudy_Mobile_MD.md` | Mobile UTF-8 (?™?¼ MAIN_2026 ?Š¸ë¦?) |
| `Yeogistudy_Package_Apply_MD.md` | ?Œ¨?‚¤ì§? apply |
| `Yeogistudy_Encoding_Migration_MD.md` | zone crossing |
| `scripts/check_asp_encoding.py` | CP949/UTF-8 ê²??‚¬ |
