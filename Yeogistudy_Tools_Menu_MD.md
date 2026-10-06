# Yeogistudy Tools ë©”ë‰´ ?“±ë¡? ê°??´?“œ

> ìµœì¢… ? •ë¦?: 2026-09-28  
> ????ƒ: `YEOGICYBER_2024_TOOLS` ? `program_list` / `program_list_admin`  
> ?‚¬ë¡?: `Tools/03_Lecture/LESSON_PART` (ê³¼ëª© ? •ë³? ê´?ë¦?)

---

## 1. ê°œìš”

Tools ASP ?˜?´ì§??Š” **ë¡œê·¸?¸ + ë©”ë‰´ ê¶Œí•œ**?´ ?ˆ?–´?•¼ ? ‘ê·¼í•  ?ˆ˜ ?ˆ?Šµ?‹ˆ?‹¤.

| êµ¬ë¶„ | ?…Œ?´ë¸? | ?—­?•  |
|------|--------|------|
| ë©”ë‰´ ë§ˆìŠ¤?„° | `program_list` | ì¢Œì¸¡ ë©”ë‰´ ?Š¸ë¦?, URL, ?—­?• ë³? ? ‘ê·? ?”Œ?˜ê·? |
| ?‚¬?š©?ë³? ê¶Œí•œ | `program_list_admin` | ?Š¹? • `menu_id` + `userid` ê°œë³„ ?—ˆ?š© |

ê°? ASP/Ajax ?ŒŒ?¼ ?ƒ?‹¨?˜ `strpage_id`ê°? **ê¶Œí•œ ê²??‚¬ ?‚¤**?…?‹ˆ?‹¤.

```asp
Dim strpage_id
strpage_id = "0303040000"
<!--#include virtual="/Tools/Share/PathIndicator_non.asp"-->
```

`PathIndicator_non.asp`ê°? `strpage_id`ë¡? `program_list` ì¡´ì¬Â·ê¶Œí•œ?„ ?™•?¸?•©?‹ˆ?‹¤.

---

## 2. menu_id êµ¬ì¡° (10?ë¦?)

`menu_id`?Š” **2?ë¦? Ã— 5?‹¨ê³?**ë¡? ê³„ì¸µ?„ ?‘œ?˜„?•©?‹ˆ?‹¤.

```
menu_id = menu_01 + menu_02 + menu_03 + menu_04 + menu_05
          (2)      (2)      (2)      (2)      (2)
```

| menu_id | menu_01~05 | level | menu_up | ?˜ë¯? |
|---------|------------|-------|---------|------|
| `0300000000` | 03,00,00,00,00 | 1 | (?ƒ?œ„) | ê³¼ì •ê´?ë¦? ???ë¶„ë¥˜ |
| `0302000000` | 03,02,00,00,00 | 2 | 0300000000 | ?•™ë¶? ê´?ë¦? (ì¢Œì¸¡ ?´?”) |
| `0302010000` | 03,02,01,00,00 | 3 | 0302000000 | ?•™ë¶? ë¦¬ìŠ¤?Š¸ |
| `0303000000` | 03,03,00,00,00 | 2 | 0300000000 | ê³¼ëª© ê´?ë¦? (ì¢Œì¸¡ ?´?”) |
| `0303050000` | 03,03,05,00,00 | 3 | 0303000000 | ê³¼ëª© ë¦¬ìŠ¤?Š¸(GWAMOK) |
| **`0304000000`** | 03,04,00,00,00 | **2** | 0300000000 | **ê³¼ì •? •ë³´ê??ë¦?** (ì¢Œì¸¡ ?´?”) |
| **`0304010000`** | 03,04,01,00,00 | **3** | **0304000000** | **ê³¼ì •? •ë³´ë¦¬?Š¤?Š¸** |

**ê·œì¹™**

- `menu_level` = ?Š¸ë¦? ê¹Šì´ (1~5)
- `menu_up` = ë¶?ëª? `menu_id`
- ?•˜?œ„ ë©”ë‰´ ì¶”ê?? ?‹œ ë¶?ëª¨ì˜ `menu_01`~`menu_0(n-1)`?„ **ê·¸ë??ë¡? ?ƒ?†**?•˜ê³?, ?•´?‹¹ level ?ë¦¬ë§Œ ì¦ê??

??™ ì±„ë²ˆ ë¡œì§: `Tools/08_Homepage/menu/menu_reg_ok.asp`

---

## 3. ë©”ë‰´ ?“±ë¡? ë°©ë²•

### ë°©ë²• A ? UI ?“±ë¡? (ê¶Œì¥)

1. Tools ?†’ **ë©”ë‰´ ?“±ë¡?/?ˆ˜? •** (`Tools/08_Homepage/menu/`)
2. ë¶?ëª? ë©”ë‰´ ?„ ?ƒ (?˜ˆ: `0303000000` 03 ê°•ì¢Œ)
3. ë©”ë‰´ëª?, URL, ????… ?…? ¥ ?›„ ????¥
4. `menu_reg_ok.asp`ê°? `menu_01`~`menu_05` ë°? ?•„?ˆ˜ ì»¬ëŸ¼?„ **??™ INSERT**

**?¥? :** NOT NULL ì»¬ëŸ¼ ?ˆ„?½ ?—†?Œ, `menu_order` ??™ ì¦ê??

### ë°©ë²• B ? SQL ì§ì ‘ INSERT

?‹ ê·? ê¸°ëŠ¥ ë°°í¬ ?‹œ SQL ?Š¤?¬ë¦½íŠ¸ë¡? ?¼ê´? ?“±ë¡í•  ?•Œ ?‚¬?š©?•©?‹ˆ?‹¤.

- LESSON_PART ?˜ˆ?‹œ:  
  `Tools/03_Lecture/LESSON_PART/sql/insert_lesson_part_menu.sql`
- **ë°˜ë“œ?‹œ** `menu_reg_ok.asp`??? ?™?¼?•œ ì»¬ëŸ¼ ?„¸?Š¸ë¥? ?‚¬?š©?•´?•¼ ?•©?‹ˆ?‹¤.

#### INSERT ?•„?ˆ˜ ì»¬ëŸ¼ (ìµœì†Œ)

`menu_reg_ok.asp` INSERT ëª©ë¡:

```
menu_01, menu_02, menu_03, menu_04, menu_05,
menu_id, menu_up, menu_level, menu_order, menu_type,
sub_gubun, menu_name, menu_url, menu_target, menu_comment,
menu_help_gubun, menu_help, w_width, w_height,
admin1_ck, cb1_ck, staff1_ck, staff2_ck, staff3_ck, staff4_ck,
prof1_ck, prof2_ck, asst1_ck, stud1_ck, guest1_ck,
admin1_ck1, cb1_ck1, staff1_ck1, staff2_ck1, staff3_ck1, staff4_ck1,
prof1_ck1, prof2_ck1, asst1_ck1, stud1_ck1, guest1_ck1,
show_gubun, s_date, e_date, show_msg, use_gubun,
reg_date, ac_userid, remote_ip, ssl_ck, html, tag,
meta_content, meta_title, meta_img, cert_info_gubun
```

#### ê¸°ë³¸ê°? (UI ë¯¸ì…? ¥ ?‹œ)

| ì»¬ëŸ¼ | ê¸°ë³¸ê°? |
|------|--------|
| `admin1_ck` ~ `guest1_ck` | `'N'` |
| `admin1_ck1` ~ `guest1_ck1` | `'N'` |
| `show_gubun` | `'N'` |
| `cert_info_gubun` | `'N'` |
| `ssl_ck` | `'N'` |
| `use_gubun` | `'Y'` |
| `sub_gubun`, `menu_comment`, URL ?™¸ ?…?Š¤?Š¸ | `''` |

---

## 4. ì¢Œì¸¡ ë©”ë‰´ ?…¸ì¶? ì¡°ê±´ (`Tools/share/Left.asp`)

`program_list` INSERTë§Œìœ¼ë¡? **ì¢Œì¸¡ ë©”ë‰´?— ?•ˆ ë³´ì¼ ?ˆ˜ ?ˆ?Šµ?‹ˆ?‹¤.** ?•„?˜ë¥? **ëª¨ë‘** ë§Œì¡±?•´?•¼ ?•©?‹ˆ?‹¤.

| ì¡°ê±´ | ?„¤ëª? |
|------|------|
| `use_gubun = 'Y'` | ?‚¬?š© ì¤? |
| **`sub_gubun = 'N'`** | **?¼ë°? ?˜?´ì§?** (`''` ?´ë©? ë©”ë‰´ SQL?—?„œ ? œ?™¸?¨) |
| `menu_level` / `menu_up` | **?˜•? œ ë©”ë‰´??? ?™?¼ ë¶?ëª?** (?˜ˆ: ê³¼ëª© ë¦¬ìŠ¤?Š¸ `0303050000`?˜ `menu_up`) |
| ê¶Œí•œ | `admin1_ck` ?“± ?—­?•  ì»¬ëŸ¼ `'Y'` **?˜?Š”** `program_list_admin`?— ë³¸ì¸ `userid` |

Left.asp level-3 ì¡°íšŒ (?š”?•½):

```sql
-- a.{ck_level}='Y' UNION program_list_admin b (b.userid = session)
WHERE menu_up = '{ë¶?ëª? menu_id}' AND sub_gubun = 'N' AND menu_level = '3'
```

**LESSON_PART(`0303040000`)** ?Š” **ê³¼ëª© ë¦¬ìŠ¤?Š¸(`0303050000`)??? ê°™ì?? `menu_up`** ?•„?˜?— ?ˆ?–´?•¼  
ê³¼ì •ê´?ë¦? ì¢Œì¸¡?—?„œ ??Œê³¼ëª? ê´?ë¦¬ã?? ê·¼ì²˜?— ?•¨ê»? ?‘œ?‹œ?©?‹ˆ?‹¤.

?ˆ˜? • SQL (UPDATE ? „?š©): `Tools/03_Lecture/LESSON_PART/sql/update_lesson_part_menu_visibility.sql`

---

## 5. ê¶Œí•œ ë¶??—¬ (?•„?ˆ˜ 2?‹¨ê³?)

`program_list` INSERTë§Œìœ¼ë¡œëŠ” **ë³¸ì¸ ê³„ì • ? ‘?† ë¶ˆê??**?¸ ê²½ìš°ê°? ë§ìŠµ?‹ˆ?‹¤.

### 4.1 ?—­?•  ?”Œ?˜ê·? (`program_list.*_ck`)

`PathIndicator_non.asp`ê°? `Session("memrate")`?— ?”°?¼ ì»¬ëŸ¼?„ ?„ ?ƒ?•©?‹ˆ?‹¤.

| memrate | ê²??‚¬ ì»¬ëŸ¼ |
|---------|-----------|
| A0 (ìµœê³ ê´?ë¦¬ì) | `admin1_ck` |
| B0~G0 | `staff1_ck` |
| G5 | `cb1_ck` |
| G7 | `staff2_ck` |
| ??? | ??? |

?•´?‹¹ `menu_id` ?–‰?—?„œ **?—­?•  ì»¬ëŸ¼?„ `'Y'`** ë¡? ë°”ê¾¸ê±°ë‚˜,

### 4.2 ê°œë³„ ê¶Œí•œ (`program_list_admin`) ? ?¼ë°˜ì 

**Tools ?†’ menu_modi** ?—?„œ ????ƒ `menu_id`?— ?‚¬?š©? ID ?“±ë¡?.

```sql
-- ?™•?¸
SELECT * FROM program_list_admin WITH (NOLOCK)
WHERE menu_id IN ('0303040000','0303040100','0303040200')
  AND userid = 'your_id';
```

LESSON_PART?Š” **ëª©ë¡Â·?“±ë¡Â·ìˆ˜? • page_id 3ê°? ëª¨ë‘** ê¶Œí•œ ë¶??—¬ ê¶Œì¥.

| page_id | ASP | ?š©?„ |
|---------|-----|------|
| `0303040000` | `lesson_part_list.asp`, LIST Ajax | ëª©ë¡ |
| `0303040100` | `lesson_part_reg.asp`, `lesson_part_reg_ok.asp` | ?“±ë¡? |
| `0303040200` | `lesson_part_mod.asp`, `mod_ok`, `del_ok` | ?ˆ˜? •Â·?‚­? œ |

---

## 6. LESSON_PART ?“±ë¡? ì²´í¬ë¦¬ìŠ¤?Š¸

```
[ ] 1. ë¶?ëª? ë©”ë‰´ 0303000000 ì¡´ì¬ ?™•?¸
[ ] 2. insert_lesson_part_menu.sql ?‹¤?–‰ (?˜?Š” menu UI ?“±ë¡?)
[ ] 3. program_list 3ê±? ?™•?¸ (0303040000 / 0100 / 0200)
[ ] 4. program_list_admin ê¶Œí•œ ë¶??—¬
[ ] 5. ë¸Œë¼?š°??? ? ‘?†: /Tools/03_Lecture/LESSON_PART/lesson_part_list.asp
[ ] 6. ?ƒ­ ????´???Â·ë³¸ë¬¸ ?•œê¸? ? •?ƒ (CP949)
```

### ?™•?¸ SQL

```sql
SELECT menu_id, menu_01, menu_02, menu_03, menu_04, menu_05,
       menu_up, menu_level, menu_name, menu_url, use_gubun
FROM program_list WITH (NOLOCK)
WHERE menu_id LIKE '030304%'
ORDER BY menu_id;
```

### ê¸°ì¡´ ë©”ë‰´ ë³µì‚¬ ?…œ?”Œë¦? (?•ˆ? „?•œ SQL ?‘?„±)

?™?¼ 03 ê°•ì¢Œ ?•˜?œ„ ë©”ë‰´(?˜ˆ: `0303050000` ê³¼ëª© ë¦¬ìŠ¤?Š¸)ê°? ?ˆ?œ¼ë©?:

```sql
SELECT menu_01, menu_02, menu_03, menu_04, menu_05,
       menu_level, menu_type, admin1_ck, show_gubun, use_gubun
FROM program_list WITH (NOLOCK)
WHERE menu_id = '0303050000';
```

?´ ?–‰?„ ê¸°ì???œ¼ë¡? `menu_id`, `menu_04`/`menu_05`, `menu_name`, `menu_url`ë§? ë°”ê¿” INSERT.

---

## 7. ?ì£? ë°œìƒ?•˜?Š” ?˜¤ë¥?

### ?˜¤ë¥?: `menu_01`?— NULL ?‚½?… ë¶ˆê?? (Msg 515)

**?›?¸:** INSERT?— `menu_01`~`menu_05` ë¯¸í¬?•¨

```sql
-- ?˜ëª»ëœ ?˜ˆ (ì»¬ëŸ¼ ë¶?ì¡?)
INSERT INTO program_list (menu_id, menu_up, menu_level, ...)
```

**?•´ê²?:** Â§3 ë°©ë²• A(UI) ?˜?Š” Â§3 INSERT ?•„?ˆ˜ ì»¬ëŸ¼ ? „ì²? ?¬?•¨ SQL ?‚¬?š©

### ì¦ìƒ: DB INSERT ?–ˆ?Š”?° ì¢Œì¸¡ ë©”ë‰´?— ?•ˆ ë³´ì„

**?›?¸ (ë³µí•© ê°??Š¥):**

1. `sub_gubun`?´ `''` ?†’ Left.aspê°? ? œ?™¸
2. `program_list_admin` ë¯¸ë“±ë¡? + ëª¨ë“  `*_ck = 'N'`
3. `menu_up`?´ ê³¼ëª© ë¦¬ìŠ¤?Š¸(`0303050000`)??? ?‹¤ë¦? ?†’ ?‹¤ë¥? ë©”ë‰´ ê·¸ë£¹?— ë¶™ìŒ

**?•´ê²?:** `update_lesson_part_menu_visibility.sql` ?‹¤?–‰ ?›„ ë¸Œë¼?š°??? ?ƒˆë¡œê³ ì¹?

> ?´ë¯? INSERT ?•œ ?’¤?¼ë©? **INSERT ?¬?‹¤?–‰?´ ?•„?‹ˆ?¼ UPDATE** ë¡? `sub_gubun`, `menu_up`, `*_ck`, `program_list_admin` ?„ ë§ì¶°?•¼ ?•©?‹ˆ?‹¤.

### ?˜¤ë¥?: ë¡œê·¸?¸ ?›„ "ê¶Œí•œ ?—†?Œ" / ë¹? ?™”ë©?

**?›?¸:** `program_list`?Š” ?ˆ?œ¼?‚˜ `program_list_admin` ?˜?Š” `*_ck` ë¯¸ì„¤? •

**?•´ê²?:** menu_modi?—?„œ ?•´?‹¹ `menu_id` + ?‚¬?š©? ?“±ë¡?

### ?˜¤ë¥?: ë¶?ëª? menu_id ?—†?Œ

**?›?¸:** `menu_up = '0303000000'` ?¸?° ë¶?ëª? ?–‰ ?—†?Œ

**?•´ê²?:**

```sql
SELECT menu_id, menu_name FROM program_list WITH (NOLOCK)
WHERE menu_id = '0303000000';
```

---

## 8. ?‹ ê·? Tools ê¸°ëŠ¥ ì¶”ê?? ?‹œ page_id ?„¤ê³?

1. **???ë¶„ë¥˜ ?™•?¸** ? 03 ê°•ì¢Œë©? `03xx` ????—­ ?‚¬?š©
2. **menu_id 10?ë¦? ?• ?‹¹** ? ê¸°ì¡´ MAX ì¡°íšŒ ?›„ ë¹? ë²ˆí˜¸ ?„ ?ƒ  
   (?˜ˆ: GWAMOK `030305`, LESSON_PART `030304`)
3. **ASP `strpage_id` = menu_id** ? list / reg / mod ê°ê° 00 / 01 / 02 suffix
4. **SQL ?˜?Š” UIë¡? program_list ?“±ë¡?**
5. **program_list_admin ê¶Œí•œ**
6. **ë°°í¬:** `YEOGICYBER_2024_TOOLS` (Tools ? „?š©)

---

## 9. ê´?? ¨ ?ŒŒ?¼

| ?ŒŒ?¼ | ?„¤ëª? |
|------|------|
| `Tools/Share/PathIndicator_non.asp` | page_id ê¶Œí•œ ê²??‚¬ |
| `Tools/08_Homepage/menu/menu_reg_ok.asp` | ë©”ë‰´ INSERT ?‘œì¤? ë¡œì§ |
| `Tools/08_Homepage/menu/menu_modi.asp` | ë©”ë‰´Â·ê¶Œí•œ ?ˆ˜? • UI |
| `Tools/03_Lecture/LESSON_PART/sql/insert_lesson_part_menu.sql` | LESSON_PART ë©”ë‰´ SQL |
| `Tools/03_Lecture/LESSON_PART/sql/update_lesson_part_menu_visibility.sql` | ë©”ë‰´ ë¯¸ë…¸ì¶? UPDATE SQL |
| `Yeogistudy_LMS_MD.md` | Tools CP949Â·Ajax ê·œì¹™ |

---

## 10. LESSON_PART page_id ?†” ASP ë§¤í•‘

```
ê³¼ì •ê´?ë¦?(03)
?”” ê³¼ì •? •ë³´ê??ë¦?          0304000000  level 2
   ?”” ê³¼ì •? •ë³´ë¦¬?Š¤?Š¸     0304010000  level 3  ?†’ lesson_part_list.asp
      (?“±ë¡?/?ˆ˜? •)       030402/4040000  sub_gubun=Y (ì¢Œì¸¡ ë¯¸ë…¸ì¶?)
```

| menu_id | menu_name | ASP |
|---------|-----------|-----|
| 0304000000 | ê³¼ì •? •ë³´ê??ë¦? | (?´?”, url `#`) |
| 0304010000 | ê³¼ì •? •ë³´ë¦¬?Š¤?Š¸ | `lesson_part_list.asp`, `Ajax/lesson_part_LIST_AJAX.asp` |
| 0304020000 | ê³¼ì •? •ë³? ?“±ë¡? | `lesson_part_reg.asp`, `lesson_part_reg_ok.asp` |
| 0304040000 | ê³¼ì •? •ë³? ?ˆ˜? • | `lesson_part_mod.asp`, `lesson_part_mod_ok.asp`, `lesson_part_del_ok.asp` |

**?˜ëª»ëœ ?“±ë¡?(030304xxxx)** ??? `ê³¼ëª© ê´?ë¦?` ?•˜?œ„ level-3 ë¡? ë¶™ì–´ ì¢Œì¸¡?— ?•ˆ ë³´ì???„ ?ˆ˜ ?ˆ?Œ.  
?†’ `migrate_lesson_part_menu_structure.sql` + `insert_lesson_part_menu.sql` ë¡? ? „?™˜.

AjaxÂ·ok ì²˜ë¦¬ ASP?—?„ ?™?¼ `strpage_id` + `PathIndicator_non.asp` include ?•„?š”.
