# Yeogistudy LMS 개발 가이드

> 최종 정리: 2026-07-18  
> 대상: `u:\Homepage\YEOGICYBER_2024_TOOLS` (Classic ASP / IIS / **CP949**)

---

## 1. 프로젝트 개요

| 항목 | 내용 |
|------|------|
| 워크스페이스 | `u:\Homepage` |
| 관리자/강사 도구 | `YEOGICYBER_2024_TOOLS\Tools\` |
| 학습·운영 메뉴 | `Tools\04_Study\` (차시별, 운영관리) |
| 기술 스택 | Classic ASP (VBScript), jQuery AJAX, SQL Server |
| 버전 관리 | **SVN** (`.svn` 존재, git 아님) |
| DB 접근 | `include/DBHelper.asp`, `DBHelper.ExecSQLReturnRS()` |
| 개발 URL 예 | `www0.yeogicyber.co.kr/Tools/04_Study/Homework/...` |
| Web·Mobile 배포 | **`YEOGICYBER_MAIN_2026`만** · `Yeogistudy_Web_MD.md` §1 |

**다른 영역과 인코딩이 다릅니다.**

| 영역 | 문서 | 인코딩 |
|------|------|--------|
| Tools (본 문서) | `Yeogistudy_LMS_MD.md` | **CP949** |
| Mobile | `Yeogistudy_Mobile_MD.md` | **UTF-8** |
| 패키지 apply | `Yeogistudy_Package_Apply_MD.md` | **CP949** (v2 Mobile은 UTF-8 ? Migration MD 참조) |

**Mobile ↔ apply zone crossing:** `Yeogistudy_Encoding_Migration_MD.md` §5.4 (`zone_enter`, 2026-07-17)

## 2. 개발 환경 주의사항 (필수)

### 2.1 파일 인코딩 ? 가장 중요

- ASP 소스는 **EUC-KR (CodePage 949)** 로 작성·저장.
- Ajax 파일 상단 예시:

  ```asp
  Session.CodePage  = 949
  Response.CharSet  = "euc-kr"
  ```

- **Cursor/VSCode에서 UTF-8로 저장하면 한글이 깨짐.**
  - `?` 연속 표시
  - `占쏙옙` 형태의 mojibake
  - 사이드바(include)는 정상, 본문 ASP만 깨지는 경우 많음
- 편집 전 에디터 인코딩을 **EUC-KR / CP949** 로 설정 후 저장.
- 이상 확인: 파일 바이트에서 `?`(0x3F) 개수 급증, 또는 UTF-8 BOM(EF BB BF) 존재.
- **ASP 수정 시 ASCII-only 패치 또는 CP949 바이너리 패치 권장.** 전체 파일 UTF-8 재저장 금지.

### 2.2 SVN 복구

- git 아님. `.svn/pristine/`에 원본 바이너리 보관.
- `member_Homework_list.asp` 등 **동일 경로 백업본이 없는 파일**은 SVN pristine이 유일한 복구 경로.
- 손상본은 `*.broken`, `*.asp.bak` 참고용으로만 보관 ? **golden source로 쓰지 않음** (이미 깨진 경우 많음).
- 파일이 **읽기 전용(R)** 이면 `attrib -R` 후 수정.

### 2.3 Cursor / AI 작업 시

- `member_Homework_list.asp`는 한글 일반문이 많아 **가능하면 건드리지 않음.**
- SQL·디버그·로직 변경은 **`Ajax/*.asp`만** 수정.
- **StrReplace/Write로 한글 literal 추가·수정 금지** ? Cursor AI가 UTF-8로 저장하는 경우가 많음.
- 한글이 꼭 필요하면: pristine·정상 형제 파일에서 복사, 또는 Python `write_bytes(data.encode('cp949'))`.

### 2.4 Cursor 에디터에서 깨져 보일 때

- **파일 자체가 깨진 것**과, **에디터 인코딩이 틀린 것**은 다름.
- 디스크에 있는 ASP는 EUC-KR이 정상인데 Cursor가 UTF-8로 열면 편집기에서만 깨져 보일 수 있음.
- `[asp].files.encoding` 설정은 **VS Code/Cursor에서 동작하지 않을 수 있음** (무시됨).

**권장 설정 (적용됨)**

- `u:\Homepage\.vscode\settings.json` → `"files.encoding": "euckr"`
- `u:\Homepage\.editorconfig` → `*.asp` = cp949, `*.md` = utf-8

**지금 열린 탭이 여전히 깨지면**

1. ASP 탭 닫기 → 다시 열기 (또는 하단 **UTF-8** → **Reopen with Encoding** → **Korean (EUC-KR)**)
2. **Ctrl+Shift+P** → `Developer: Reload Window`

**주의:** 저장 시 **Save with Encoding → EUC-KR**. UTF-8로 저장 시 서버에서도 깨짐.

### 2.5 인코딩 작업·복구 체크리스트 (신규)

#### 작업 전 (10초)

- [ ] **영역 분류**: Tools(CP949) / Mobile(UTF-8) / apply(CP949) ? 혼동 금지
- [ ] 수정 대상이 `list.asp`·`Top.asp`·`member_Homework_list.asp`인지 확인 → 가능하면 Ajax·include 유틸로 대체

#### 수정 방식

| 목적 | 수정할 파일 | 피할 파일 |
|------|-------------|-----------|
| 목록 SQL·검색 | `Ajax/*_ajax.asp` | `*_list.asp` |
| Tools 패키지 로직 | `PKG/Ajax/*.asp`, `pkg_apply_remark_util.asp` | `pkg_list.asp` 본문 대량 수정 |
| 모바일 ON/OFF | `pkg_mobile_menu_*.asp` | `Gnb.asp` 전체 재작성 |

#### 수정 후 (30초)

```powershell
# Tools (CP949)
python scripts/check_asp_encoding.py tools Tools/03_Lecture/PKG/pkg_list.asp

# Mobile (UTF-8)
python scripts/check_asp_encoding.py mobile YEOGICYBER_MAIN_2026/mobile/Include/Gnb.asp
```

- [ ] BOM 없음 · CP949/UTF-8 디코드 OK
- [ ] 브라우저: **탭 타이틀 + 본문 h2** 둘 다 한글 정상 (타이틀만 깨지는 경우 있음)
- [ ] Ajax 확인: Network → **Response** 탭 (list.asp 본문 말고)

#### 손상 발견 시 복구 순서

1. 증상 구간 특정 (탭만? 본문? Ajax만?)
2. **SVN `.svn/pristine`** 에서 해당 파일 바이트 복구
3. **ASCII-only** 또는 **Python CP949** 패치만 재적용
4. `scripts/check_asp_encoding.py` + 브라우저 30초 검증
5. `*.bak` / `*.broken` 은 참고만 ? pristine 우선

#### Agent 작업 시 프롬프트 템플릿

```
- Tools/apply: CP949 only. 한글 StrReplace/Write 금지. ASCII-only 또는 Python cp949 write_bytes.
- Mobile: UTF-8 only.
- list.asp / Top.asp / Gnb.asp / member_Homework_list.asp 최소 수정.
- 수정 후: python scripts/check_asp_encoding.py <tools|mobile> <파일>
- SVN pristine 복구 우선, .bak golden source 금지.
```

---

## 3. 대표 페이지: 과제 제출 리스트

| 파일 | 역할 |
|------|------|
| `Tools/04_Study/Homework/member_Homework_list.asp` | UI, 검색 폼, `page_data()` JS |
| `Tools/04_Study/Homework/Ajax/Member_Homework_list_ajax.asp` | **목록/건수 SQL 실행** |
| `page_id` | `0406010000` |

### 3.1 화면 ↔ 서버 흐름

```
[검색 버튼 / Enter]
    → page_data() (jQuery)
    → POST ajax_gubun=D → member_homework_List_ajax.asp  (목록 HTML <tr>)
    → success 후 GET ajax_gubun=C → COUNT_... (페이지 정보)
    → sub_page.asp, grade_ajax.asp, date_ajax.asp 등 연동 호출
```

- **list.asp 안의 SQL**(학기/결제유형/담당자 콤보 등) ≠ **검색 목록 SQL**.
- 검색어: ajax 255~257행 근처 `strsearch` → `sql_s`에 LIKE 조건 추가.

### 3.2 ajax_gubun

| 값 | 의미 | 응답 형식 |
|----|------|-----------|
| `D` | 데이터 목록 (첫 검색) | HTML `<tr>...</tr>` |
| `C` | 전체 건수·페이지 | `COUNT_페이지_페이지크기_...` (JS가 `_`로 split) |
| `A` | 더보기(추가 페이지) | HTML `<tr>...</tr>` |

- `C` 응답 앞에 HTML/텍스트를 붙이면 **페이지 파싱 깨짐.**

### 3.3 SQL 실행 위치 (ajax 파일)

| 구분 | 변수 | 위치 (대략) |
|------|------|-------------|
| 건수 SQL | `sql_c` | `ExecSQLReturnRS(sql_c,...)` 직전 (~394행) |
| 목록 SQL | `SQL` | `ExecSQLReturnRS(SQL,...)` 직전 (~695행) |

---

## 4. SQL 디버그 방법

### 4.1 원칙

- list.asp에 `Response.Write` → **검색 SQL 안 보임** (AJAX로 실행되므로).
- Network **Headers**가 아니라 **Response** 탭에서 확인.
- 대상 요청: `member_homework_List_ajax.asp` (not `date_ajax.asp` 등).

### 4.2 권장 코드 (ajax 파일만, ASCII만 추가)

**목록 SQL (`D` / `A`):**

```asp
If Request("sql_debug") = "1" Then
    Response.Write SQL
    Response.End
End If
Set rs = DBHelper.ExecSQLReturnRS(SQL, Nothing, conn)
```

**건수 SQL (`C`):**

```asp
If Request("sql_debug") = "2" Then
    Response.Write sql_c
    Response.End
End If
Set rs_c = DBHelper.ExecSQLReturnRS(sql_c, Nothing, conn)
```

**활성화:** 폼 hidden `sql_debug=1`(목록) 또는 `2`(건수), 또는 ajax URL/POST에 파라미터 추가.

### 4.3 주의

- `sql_debug=1`이면 해당 요청은 **SQL만** 반환, 목록 미표시 (정상).
- `Server.HTMLEncode` + 긴 SQL 조합 시 오류 가능 → plain `Response.Write` 또는 `Replace` 이스케이프.
- 디버그 종료: hidden `value=""` 또는 코드 제거.
- `DBHelper.asp`의 `err_sql`은 내부 IP(192.168.200.*)에서만 출력.

---

## 5. 공통 Include / 패턴

```
/include/DBHelper.asp
/include/dbopen.asp
/include/form_01.asp
/include/replace_01.asp
/Tools/share/Top.asp
/Tools/share/Team_Lavel.asp
```

- 권한: `Call TeamLevel("DEPARTCODE_00002","G000011_012")`
- 오류: `call err_num(SQL)` → `ErrorNum`, 끝에서 `FAIL_...` 응답
- AJAX JS 오류 메시지: `"데이터 페이지 도중 오류 발생"` → HTTP 500, 타임아웃, ASP 컴파일 오류 등

---

## 6. 폴더 구조 (04_Study)

```
Tools/04_Study/
├── Homework/
│   ├── member_Homework_list.asp
│   ├── Member_Homework_Reg.asp
│   └── Ajax/
│       └── Member_Homework_list_ajax.asp
├── ajax/              # 공통 콤보/연동 ajax
└── ...
```

---

## 7. 작업 체크리스트

- [ ] ASP 파일 **CP949** 저장 확인 (`?` / `占쏙옙` 없음)
- [ ] `python scripts/check_asp_encoding.py tools <파일>` 통과
- [ ] 목록 기능 → list.asp + Ajax 파일 **둘 다** 흐름 확인
- [ ] 페이지 이상 → `ajax_gubun=C` 응답이 `COUNT_`로 시작하는지
- [ ] 한글 깨짐 → SVN pristine 복구, UTF-8 저장 중단
- [ ] SQL 확인 → ajax + Network Response 탭
- [ ] list.asp 수정 최소화, ajax 위주 수정

---

## 8. 이슈 이력

### 2026-07-06 ? 과제 리스트 SQL 디버그

1. SQL 디버그 추가 중 ASP **UTF-8 저장** → `member_Homework_list.asp` / ajax 한글 전면 손상.
2. 증상: 필터 일부 `????` / mojibake, AJAX `"데이터 페이지 도중 오류 발생"`, 목록 0건.
3. 조치: SVN `.svn/pristine`에서 두 파일 원복.
4. 교훈: 디버그는 **ajax만 ASCII 패치**, list.asp hidden 추가도 CP949 바이너리 패치로.

### 2026-07-12 ? 인코딩 작업 효율화

1. Cursor StrReplace/Write가 CP949 ASP를 UTF-8로 저장 → 탭 타이틀·본문 깨짐 반복.
2. 조치: `.mdc` 규칙 강화, `scripts/check_asp_encoding.py` 추가, 본 문서 §2.5 체크리스트.

### 2026-07-15 ? 패키지 결제 후 과목 누락 · Tools 보완등록

**증상:** 패키지(예: code=29, 9과목) 결제 완료 후 `CYBER_MEMBER_INFO` / `PAY_INFO` 일부 과목만 등록.

**사례 (www0):** 회원 `gusrl7433`, 주문 `PKG_29_20260713101956_...`, MISS `pkg_info_num=24607` (`LESSON_ONLY_1617` 교육사회학).

#### MAIN ? 신규 결제 9과목 누락 방지

| 파일 | 내용 |
|------|------|
| `YEOGICYBER_MAIN_2026/web/include/asp/pg/nice/PKGSend_step02.asp` | INSERT JOIN 학기 조건 `a.cs_season` → **`b.cs_season`** (패키지 그룹 블록 학기) |

Apply PG·모바일 Nice 통일: **`Yeogistudy_Package_Apply_MD.md` §12**.

#### Tools ? 이미 결제된 회원 1과목 보완등록

| 파일 | 역할 |
|------|------|
| `Tools/01_member/member/info/info_04_02.asp` | 수강 목록 [보기] → 보완 팝업 |
| `Tools/01_member/member/info/info_04_02_pkg_fix_view.asp` | 결제 vs 등록 대조, MISS 행 **보완등록** UI |
| `Tools/01_member/member/info/info_03_pkg_one_enroll_ok.asp` | 1과목 INSERT (`CYBER_MEMBER_INFO` + `PAY_INFO` 템플릿) |

**처리 흐름**

1. `info_04_02.asp` → `info_04_02_pkg_fix_view.asp?pi_orderno=...` (팝업)
2. MISS 과목 **보완등록** → `info_03_pkg_one_enroll_ok.asp?pkg_info_num=...&pi_orderno=...&back_view=pkg_fix`
3. 성공 시 팝업 복귀 / 실패 시 「보완등록 중 오류가 발생하였습니다.」

**디버그 (`info_03_pkg_one_enroll_ok.asp`)**

| `sql_debug` | 출력 |
|-------------|------|
| `1` | MEMBER INSERT SQL |
| `2` | PAY INSERT SQL |

**`info_04_02_pkg_fix_view.asp` ? `sql_debug`**

| 값 | 용도 |
|----|------|
| `1` | PKG 헤더 |
| `2` | PAY 등록 과목 |
| `3` | 신청 PKG_INFO |
| `4`~`6` | 대조·학기 fallback SQL |

**학기 표시 fallback:** `ISNULL(pe.cs_season, ISNULL(h.cs_season, d.cs_season))`  
(`pe`=결제 PAY_INFO, `h`=주문 대표, `d`=CYBER_SEASON_SUBJECT 최신)

**구현 시 주의 (해결된 오류)**

- `CYBER_SUBJECT_ALL_VIEW`에 `pkg_num` 없음 → **`PI_ORDERNO`** 로 주문 연결
- `members.ms_group` 없음 → **`school_id`**, `recommend_id` / `MEM_MANAGER`
- `class_room_num` NULL → sibling `CYBER_MEMBER_INFO` fallback
- Tools ASP **CP949** 저장, ajax/처리 ASP 위주 ASCII·CP949 패치

**Tools 배포 파일:** `info_04_02.asp`, `info_04_02_pkg_fix_view.asp`, `info_03_pkg_one_enroll_ok.asp`

---

## 9. 관련 파일

| 파일 | 설명 |
|------|------|
| `Yeogistudy_Web_MD.md` | Web·Mobile **배포 경로(MAIN_2026)** · 수강신청 |
| `Yeogistudy_LMS_MD.md` | 본 문서 (Tools / CP949) |
| `Yeogistudy_Mobile_MD.md` | 모바일 UTF-8 · Gnb · common.js |
| `Yeogistudy_Package_Apply_MD.md` | 패키지 수강신청 · 모바일 메뉴 연동 |
| `Yeogistudy_LMS_DB_MD.md` | yeogicyber DB 스키마 (437 tables, Excel export 기반) |
| `Yeogistudy_Encoding_Migration_MD.md` | zone crossing · `zone_enter` §5.4 · apply/Gnb v2 로드맵 |
| `.cursor/rules/yeogistudy-lms.mdc` | Cursor AI Tools 규칙 |
| `.cursor/rules/yeogistudy-mobile.mdc` | Cursor AI Mobile 규칙 |
| `.cursor/rules/yeogistudy-package-apply.mdc` | Apply/Mobile v2 Agent 규칙 |
| `scripts/check_asp_encoding.py` | CP949/UTF-8 사전 검사 스크립트 |
| `scripts/generate_yeogicyber_db_md.py` | yeogicyber_db.xlsx → DB MD 재생성 |
| `docs/db/yeogicyber_db.xlsx` | yeogicyber SSMS 스키마 export 원본 |
| `*.asp.broken` | 손상 당시 백업 (참고용, golden source 아님) |
