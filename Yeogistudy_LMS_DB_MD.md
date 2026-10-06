# Yeogistudy LMS - yeogicyber DB 스키마

> 최종 생성: 2026-07-15  
> Database: **yeogicyber**  
> 출처: [`docs/db/yeogicyber_db.xlsx`](docs/db/yeogicyber_db.xlsx)

---

## 1. 개요

| 항목 | 값 |
|---|---|
| 테이블 수 | 437 |
| 컬럼 수 | 10667 |
| PK 정의 (행) | 739 |
| FK 정의 (행) | 1 |
| Index (행) | 485 |

`web/include/dbopen.asp` / Tools `include/dbopen.asp` ODBC 기준. **LMS 본체 DB = yeogicyber**.

`board`, `stat`, `phone`, `yeogicyber_log`, `MobileApp` 등 다른 ODBC는 본 문서 범위 밖.

---

## 2. 문서 구조

| 파일 | 내용 |
|---|---|
| [`docs/db/yeogicyber/CATALOG.md`](docs/db/yeogicyber/CATALOG.md) | 전체 테이블 목록 |
| [`docs/db/yeogicyber/FOREIGN_KEYS.md`](docs/db/yeogicyber/FOREIGN_KEYS.md) | FK 목록 |
| [`docs/db/yeogicyber/tables/*.md`](docs/db/yeogicyber/tables/) | 테이블별 Columns / PK / Index |
| [`docs/db/yeogicyber_db.xlsx`](docs/db/yeogicyber_db.xlsx) | SSMS export 원본 |

재생성:

```bash
python scripts/generate_yeogicyber_db_md.py
```

---

## 3. LMS 유지보수 - 도메인별 테이블

> FK 없이 JOIN 코드에서 관계 이용 더 높음. §4 핵심 테이블 및 Package/LMS MD 참고.

### 코드·설정 (4)

- [`dbo.CODE_DTL`](docs/db/yeogicyber/tables/dbo.CODE_DTL.md)
- [`dbo.CODE_DTL_SUB`](docs/db/yeogicyber/tables/dbo.CODE_DTL_SUB.md)
- [`dbo.CODE_MST`](docs/db/yeogicyber/tables/dbo.CODE_MST.md)
- [`dbo.code_dtl_20250801`](docs/db/yeogicyber/tables/dbo.code_dtl_20250801.md)

### 수강·등록 (7)

- [`dbo.CYBER_MEMBER_ETC`](docs/db/yeogicyber/tables/dbo.CYBER_MEMBER_ETC.md)
- [`dbo.CYBER_MEMBER_ETC_20260112`](docs/db/yeogicyber/tables/dbo.CYBER_MEMBER_ETC_20260112.md)
- [`dbo.CYBER_MEMBER_INFO`](docs/db/yeogicyber/tables/dbo.CYBER_MEMBER_INFO.md)
- [`dbo.CYBER_MEMBER_INFO_DEL`](docs/db/yeogicyber/tables/dbo.CYBER_MEMBER_INFO_DEL.md)
- [`dbo.CYBER_MEMBER_INFO_PKG`](docs/db/yeogicyber/tables/dbo.CYBER_MEMBER_INFO_PKG.md)
- [`dbo.CYBER_MEMBER_INFO_STAFF`](docs/db/yeogicyber/tables/dbo.CYBER_MEMBER_INFO_STAFF.md)
- [`dbo.CYBER_MEMBER_INFO_XLS`](docs/db/yeogicyber/tables/dbo.CYBER_MEMBER_INFO_XLS.md)

### 과제·학습 (7)

- [`dbo.STUDY_LICENSE`](docs/db/yeogicyber/tables/dbo.STUDY_LICENSE.md)
- [`dbo.STUDY_PLAN`](docs/db/yeogicyber/tables/dbo.STUDY_PLAN.md)
- [`dbo.STUDY_PLAN_LICENSE`](docs/db/yeogicyber/tables/dbo.STUDY_PLAN_LICENSE.md)
- [`dbo.STUDY_RECARD_INFO`](docs/db/yeogicyber/tables/dbo.STUDY_RECARD_INFO.md)
- [`dbo.STUDY_SEASON_LICENSE`](docs/db/yeogicyber/tables/dbo.STUDY_SEASON_LICENSE.md)
- [`dbo.STUDY_SEASON_PLAN`](docs/db/yeogicyber/tables/dbo.STUDY_SEASON_PLAN.md)
- [`dbo.STUDY_SEASON_PLAN_INFO`](docs/db/yeogicyber/tables/dbo.STUDY_SEASON_PLAN_INFO.md)

### 회원 (57)

- [`dbo.MEMBERS`](docs/db/yeogicyber/tables/dbo.MEMBERS.md)
- [`dbo.MEMBERSHIP_CARD`](docs/db/yeogicyber/tables/dbo.MEMBERSHIP_CARD.md)
- [`dbo.MEMBERSSHIP_LIST`](docs/db/yeogicyber/tables/dbo.MEMBERSSHIP_LIST.md)
- [`dbo.MEMBERS_AGREE_HISTORY`](docs/db/yeogicyber/tables/dbo.MEMBERS_AGREE_HISTORY.md)
- [`dbo.MEMBERS_BANK_HISTORY`](docs/db/yeogicyber/tables/dbo.MEMBERS_BANK_HISTORY.md)
- [`dbo.MEMBERS_FILE`](docs/db/yeogicyber/tables/dbo.MEMBERS_FILE.md)
- [`dbo.MEMBERS_FILE_20260112`](docs/db/yeogicyber/tables/dbo.MEMBERS_FILE_20260112.md)
- [`dbo.MEMBERS_HAKJUK`](docs/db/yeogicyber/tables/dbo.MEMBERS_HAKJUK.md)
- [`dbo.MEMBERS_HISTORY`](docs/db/yeogicyber/tables/dbo.MEMBERS_HISTORY.md)
- [`dbo.MEMBERS_INFO`](docs/db/yeogicyber/tables/dbo.MEMBERS_INFO.md)
- [`dbo.MEMBERS_INFO_SHOW`](docs/db/yeogicyber/tables/dbo.MEMBERS_INFO_SHOW.md)
- [`dbo.MEMBERS_LOGIN`](docs/db/yeogicyber/tables/dbo.MEMBERS_LOGIN.md)
- [`dbo.MEMBERS_PHONE`](docs/db/yeogicyber/tables/dbo.MEMBERS_PHONE.md)
- [`dbo.MEMBERS_PLAN`](docs/db/yeogicyber/tables/dbo.MEMBERS_PLAN.md)
- [`dbo.MEMBERS_RATE_LOG`](docs/db/yeogicyber/tables/dbo.MEMBERS_RATE_LOG.md)
- [`dbo.MEMBERS_SALT`](docs/db/yeogicyber/tables/dbo.MEMBERS_SALT.md)
- [`dbo.MEMBERS_SALT2`](docs/db/yeogicyber/tables/dbo.MEMBERS_SALT2.md)
- [`dbo.MEMBERS_SCHOOL`](docs/db/yeogicyber/tables/dbo.MEMBERS_SCHOOL.md)
- [`dbo.MEMBERS_SCHOOL_IPZONE`](docs/db/yeogicyber/tables/dbo.MEMBERS_SCHOOL_IPZONE.md)
- [`dbo.MEMBERS_SCHOOL_LIST`](docs/db/yeogicyber/tables/dbo.MEMBERS_SCHOOL_LIST.md)
- [`dbo.MEMBERS_SCHOOL_REV`](docs/db/yeogicyber/tables/dbo.MEMBERS_SCHOOL_REV.md)
- [`dbo.MEMBERS_SIL_INFO`](docs/db/yeogicyber/tables/dbo.MEMBERS_SIL_INFO.md)
- [`dbo.MEMBERS_STAFF`](docs/db/yeogicyber/tables/dbo.MEMBERS_STAFF.md)
- [`dbo.MEMBERS_STAFF_ATTENDANCE`](docs/db/yeogicyber/tables/dbo.MEMBERS_STAFF_ATTENDANCE.md)
- [`dbo.MEMBERS_STAFF_ATTENDANCE_20230719`](docs/db/yeogicyber/tables/dbo.MEMBERS_STAFF_ATTENDANCE_20230719.md)
- [`dbo.MEMBERS_STAFF_ATTENDANCE_20230720`](docs/db/yeogicyber/tables/dbo.MEMBERS_STAFF_ATTENDANCE_20230720.md)
- [`dbo.MEMBERS_STAFF_ATTENDANCE_20230722`](docs/db/yeogicyber/tables/dbo.MEMBERS_STAFF_ATTENDANCE_20230722.md)
- [`dbo.MEMBERS_STAFF_ATTENDANCE_20240514`](docs/db/yeogicyber/tables/dbo.MEMBERS_STAFF_ATTENDANCE_20240514.md)
- [`dbo.MEMBERS_STAFF_ATTENDANCE_ADD`](docs/db/yeogicyber/tables/dbo.MEMBERS_STAFF_ATTENDANCE_ADD.md)
- [`dbo.MEMBERS_STAFF_DAY`](docs/db/yeogicyber/tables/dbo.MEMBERS_STAFF_DAY.md)
- [`dbo.MEMBERS_XLS`](docs/db/yeogicyber/tables/dbo.MEMBERS_XLS.md)
- [`dbo.OAUTH_MEMBERS`](docs/db/yeogicyber/tables/dbo.OAUTH_MEMBERS.md)
- [`dbo.cyber_member_info_20240929`](docs/db/yeogicyber/tables/dbo.cyber_member_info_20240929.md)
- [`dbo.cyber_member_info_20260112`](docs/db/yeogicyber/tables/dbo.cyber_member_info_20260112.md)
- [`dbo.cyber_member_info_20260527`](docs/db/yeogicyber/tables/dbo.cyber_member_info_20260527.md)
- [`dbo.cyber_member_info_20260603`](docs/db/yeogicyber/tables/dbo.cyber_member_info_20260603.md)
- [`dbo.cyber_member_info_20260615`](docs/db/yeogicyber/tables/dbo.cyber_member_info_20260615.md)
- [`dbo.cyber_member_info_20260617`](docs/db/yeogicyber/tables/dbo.cyber_member_info_20260617.md)
- [`dbo.cyber_member_info_20260702`](docs/db/yeogicyber/tables/dbo.cyber_member_info_20260702.md)
- [`dbo.cyber_member_info_2026_L1_2`](docs/db/yeogicyber/tables/dbo.cyber_member_info_2026_L1_2.md)
- [`dbo.cyber_member_info_exam_point`](docs/db/yeogicyber/tables/dbo.cyber_member_info_exam_point.md)
- [`dbo.member_back`](docs/db/yeogicyber/tables/dbo.member_back.md)
- [`dbo.members_20240923`](docs/db/yeogicyber/tables/dbo.members_20240923.md)
- [`dbo.members_20250106`](docs/db/yeogicyber/tables/dbo.members_20250106.md)
- [`dbo.members_20251119`](docs/db/yeogicyber/tables/dbo.members_20251119.md)
- [`dbo.members_20260112`](docs/db/yeogicyber/tables/dbo.members_20260112.md)
- [`dbo.members_20260610`](docs/db/yeogicyber/tables/dbo.members_20260610.md)
- [`dbo.members_convert`](docs/db/yeogicyber/tables/dbo.members_convert.md)
- [`dbo.members_dup_jumin_20260112`](docs/db/yeogicyber/tables/dbo.members_dup_jumin_20260112.md)
- [`dbo.members_list_20260613`](docs/db/yeogicyber/tables/dbo.members_list_20260613.md)
- [`dbo.members_list_202606131`](docs/db/yeogicyber/tables/dbo.members_list_202606131.md)
- [`dbo.members_list_2026061312`](docs/db/yeogicyber/tables/dbo.members_list_2026061312.md)
- [`dbo.members_list_202606132`](docs/db/yeogicyber/tables/dbo.members_list_202606132.md)
- [`dbo.members_list_20260626`](docs/db/yeogicyber/tables/dbo.members_list_20260626.md)
- [`dbo.members_salt_20240923`](docs/db/yeogicyber/tables/dbo.members_salt_20240923.md)
- [`dbo.members_salt_20260112`](docs/db/yeogicyber/tables/dbo.members_salt_20260112.md)
- [`dbo.members_school_apply_check`](docs/db/yeogicyber/tables/dbo.members_school_apply_check.md)

### 패키지 (3)

- [`dbo.CYBER_PKG_GROUP`](docs/db/yeogicyber/tables/dbo.CYBER_PKG_GROUP.md)
- [`dbo.CYBER_PKG_GROUP_backup`](docs/db/yeogicyber/tables/dbo.CYBER_PKG_GROUP_backup.md)
- [`dbo.CYBER_PKG_INFO`](docs/db/yeogicyber/tables/dbo.CYBER_PKG_INFO.md)

### 결제 (17)

- [`dbo.AD_PAY`](docs/db/yeogicyber/tables/dbo.AD_PAY.md)
- [`dbo.AD_PAY_DAY`](docs/db/yeogicyber/tables/dbo.AD_PAY_DAY.md)
- [`dbo.CYBER_ORDER_NO`](docs/db/yeogicyber/tables/dbo.CYBER_ORDER_NO.md)
- [`dbo.MEMBER_SUPPORT_PAY_MONTH`](docs/db/yeogicyber/tables/dbo.MEMBER_SUPPORT_PAY_MONTH.md)
- [`dbo.MEMBER_TEACHER_PAY_MONTH`](docs/db/yeogicyber/tables/dbo.MEMBER_TEACHER_PAY_MONTH.md)
- [`dbo.PAY_INFO`](docs/db/yeogicyber/tables/dbo.PAY_INFO.md)
- [`dbo.PAY_INFO_BALANCE`](docs/db/yeogicyber/tables/dbo.PAY_INFO_BALANCE.md)
- [`dbo.PAY_INFO_BOOK`](docs/db/yeogicyber/tables/dbo.PAY_INFO_BOOK.md)
- [`dbo.PAY_INFO_DEL`](docs/db/yeogicyber/tables/dbo.PAY_INFO_DEL.md)
- [`dbo.PAY_INFO_Doc`](docs/db/yeogicyber/tables/dbo.PAY_INFO_Doc.md)
- [`dbo.PAY_INFO_LICENSE`](docs/db/yeogicyber/tables/dbo.PAY_INFO_LICENSE.md)
- [`dbo.PAY_INFO_NOW_COUNT`](docs/db/yeogicyber/tables/dbo.PAY_INFO_NOW_COUNT.md)
- [`dbo.PAY_INFO_PKG`](docs/db/yeogicyber/tables/dbo.PAY_INFO_PKG.md)
- [`dbo.PAY_INFO_REFUND`](docs/db/yeogicyber/tables/dbo.PAY_INFO_REFUND.md)
- [`dbo.PAY_INFO_REPORT`](docs/db/yeogicyber/tables/dbo.PAY_INFO_REPORT.md)
- [`dbo.pay_info_20260112`](docs/db/yeogicyber/tables/dbo.pay_info_20260112.md)
- [`dbo.pay_refund_202508`](docs/db/yeogicyber/tables/dbo.pay_refund_202508.md)

### 학기·과목 (24)

- [`dbo.CYBER_SEASON`](docs/db/yeogicyber/tables/dbo.CYBER_SEASON.md)
- [`dbo.CYBER_SEASON_LEVEL`](docs/db/yeogicyber/tables/dbo.CYBER_SEASON_LEVEL.md)
- [`dbo.CYBER_SEASON_SUBJECT`](docs/db/yeogicyber/tables/dbo.CYBER_SEASON_SUBJECT.md)
- [`dbo.CYBER_SEASON_SUBJECT_BUNBAN`](docs/db/yeogicyber/tables/dbo.CYBER_SEASON_SUBJECT_BUNBAN.md)
- [`dbo.CYBER_SEASON_WEEK`](docs/db/yeogicyber/tables/dbo.CYBER_SEASON_WEEK.md)
- [`dbo.CYBER_SUBJECT`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT.md)
- [`dbo.CYBER_SUBJECT_20250505`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_20250505.md)
- [`dbo.CYBER_SUBJECT_BOOK`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_BOOK.md)
- [`dbo.CYBER_SUBJECT_BOOK_FREE`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_BOOK_FREE.md)
- [`dbo.CYBER_SUBJECT_BOOK_INFO`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_BOOK_INFO.md)
- [`dbo.CYBER_SUBJECT_BOOK_MOVE`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_BOOK_MOVE.md)
- [`dbo.CYBER_SUBJECT_CLASS`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_CLASS.md)
- [`dbo.CYBER_SUBJECT_CODE`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_CODE.md)
- [`dbo.CYBER_SUBJECT_LICENSE`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_LICENSE.md)
- [`dbo.CYBER_SUBJECT_NEW_20251216`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_NEW_20251216.md)
- [`dbo.CYBER_SUBJECT_NEW_book`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_NEW_book.md)
- [`dbo.CYBER_SUBJECT_OT`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_OT.md)
- [`dbo.CYBER_SUBJECT_OT_RESULT`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_OT_RESULT.md)
- [`dbo.CYBER_SUBJECT_SCHEDULE`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_SCHEDULE.md)
- [`dbo.CYBER_SUBJECT_SCHEDULE_MOBILE`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_SCHEDULE_MOBILE.md)
- [`dbo.CYBER_SUBJECT_STUDENT`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_STUDENT.md)
- [`dbo.CYBER_SUBJECT_SUPPORT`](docs/db/yeogicyber/tables/dbo.CYBER_SUBJECT_SUPPORT.md)
- [`dbo.LCMS_CYBER_SUBJECT`](docs/db/yeogicyber/tables/dbo.LCMS_CYBER_SUBJECT.md)
- [`dbo.LESSON_PART`](docs/db/yeogicyber/tables/dbo.LESSON_PART.md)

---

## 4. 유지보수 핵심 테이블

| 업무 | 테이블 | 비고 |
|---|---|---|
| 회원 | `members` | `mem_userid` |
| 수강 | `CYBER_MEMBER_INFO` | 학기/과목 등록 |
| 결제 | `PAY_INFO` | `PI_ORDERNO`, `pi_priceyn` |
| 패키지 결제 | `PAY_INFO_PKG_VIEW`, `PAY_INFO_PKG` | Tools 보완등록 |
| 패키지 | `cyber_pkg_group`, `cyber_pkg_info` | `pkg_num`, `gubun_code` |
| 학기 | `cyber_season` | `cs_season`, `cs_ssday` |
| 과목 | `CYBER_SEASON_SUBJECT` | `sc_onlycode` |
| 코드 | `CODE_DTL`, `CODE_MST` | `pkg_config` |
| 주문 | `CYBER_ORDER_NO` | PG step01 |
| 뷰 | `CYBER_SUBJECT_ALL_VIEW` | `pkg_num` 없음 - `PI_ORDERNO` 사용 |

---

## 5. Excel 시트

| Sheet | 내용 |
|---|---|
| schema / table | 테이블 메타 |
| columns | 컬럼 타입 |
| pk | Primary Key |
| fk | Foreign Key (1 rows) |
| index | 인덱스 메타 |
| Sheet1 | SSMS SQL 원문 |

---

## 6. 관련 문서

| 문서 |
|---|
| [`Yeogistudy_LMS_MD.md`](Yeogistudy_LMS_MD.md) |
| [`Yeogistudy_Package_Apply_MD.md`](Yeogistudy_Package_Apply_MD.md) |
