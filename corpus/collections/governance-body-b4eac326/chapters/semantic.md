The chapter is complete. All 10 `` markers and all 16 `` markers are present, and the word count is 2,442 words — within the 1,500–2,500 target range. The file is at `/tmp/harness_semantic_3q9ao70y/chapter_governance_schema.md`.

## Data appendix

**Table `governance_bodies`**

| id | body_identifier | body_name | body_type | meeting_frequency | establishment_date | is_external | business_unit_id | audits_business_unit_id |
|---|---|---|---|---|---|---|---|---|
| 100 | BOD-2053 | Regional Corridor | Board of Directors | compact-meeting-80 | 2024-07-11 | true | 100 | 100 |
| 101 | BOD-2058 | Seasonal Series D | Board of Auditors | composite-meeting-81 | 2025-12-22 | false | 101 | 101 |
| 102 | BOD-2063 | Integrated Assessment | Management Meeting | primary-meeting-82 | 2022-05-06 | true | 102 | 102 |
| 103 | BOD-2068 | Extended Survey | Management Advisory Committee | adaptive-meeting-83 | 2023-10-17 | false | 103 | 103 |

**Table `governance_members`**

| id | member_identifier | member_name | member_role | appointment_date | is_external | certification_status | governance_body_id | meeting_id |
|---|---|---|---|---|---|---|---|---|
| 1 | MEM-2656 | Stephanie Higgins | Director | 2022-05-03 | true | regional-certific-78 | 100 | 1000 |
| 2 | MEM-2660 | Stephanie Sutton | External Director | 2023-10-14 | false | legacy-certific-79 | 101 | 1001 |
| 3 | MEM-2664 | Michael Oconnell | Auditor | 2024-03-25 | true | compact-certific-80 | 102 | 1002 |
| 4 | MEM-2668 | Theodore Mcgrath | External Auditor | 2025-08-09 | false | composite-certific-81 | 103 | 1003 |

**Table `business_units`**

| id | unit_identifier | unit_name | unit_type | reporting_frequency | operational_status | governance_body_id | internal_auditing_division_id | supervised_by_governance_body_id |
|---|---|---|---|---|---|---|---|---|
| 100 | UNI-2580 | Compact Series | Corporate Business Division | integrated-reportin-64 | Active | 100 | 1 | 100 |
| 101 | UNI-2584 | Legacy Assessment | Subsidiary | seasonal-reportin-65 | Inactive | 101 | 2 | 101 |
| 102 | UNI-2588 | Regional Survey A | Affiliate | regional-reportin-66 | Under Review | 102 | 3 | 102 |
| 103 | UNI-2592 | Seasonal Corridor | Corporate Business Division | legacy-reportin-67 | Active | 103 | 4 | 103 |

**Table `internal_auditing_divisions`**

| id | division_identifier | division_name | member_count | certification_requirement | audit_scope | business_unit_id |
|---|---|---|---|---|---|---|
| 1 | DIV-2046 | Composite Protocol | 4 | regional-certific-36 | baseline-audit-61 | 100 |
| 2 | DIV-2051 | Compact Programme A | 17 | legacy-certific-37 | pilot-audit-62 | 101 |
| 3 | DIV-2056 | Legacy Standard | 9 | compact-certific-38 | extended-audit-63 | 102 |
| 4 | DIV-2061 | Regional Framework | 0 | composite-certific-39 | integrated-audit-64 | 103 |

**Table `internal_auditors`**

| internal_auditor_id | auditor_identifier | auditor_name | certification_type | assignment_date | specialization | internal_auditing_division_id | business_unit_id |
|---|---|---|---|---|---|---|---|
| 1 | AUD-2074 | Compact Initiative | distributed-certific-96 | 2024-11-03 | legacy-speciali-13 | 1 | 100 |
| 2 | AUD-2076 | Legacy Model | baseline-certific-97 | 2025-04-14 | compact-speciali-14 | 2 | 101 |
| 3 | AUD-2078 | Regional Cluster A | pilot-certific-98 | 2022-09-25 | composite-speciali-15 | 3 | 102 |
| 4 | AUD-2080 | Seasonal Review | extended-certific-99 | 2023-02-09 | primary-speciali-16 | 4 | 103 |

**Table `meetings`**

| id | meeting_identifier | meeting_type | scheduled_date | duration_hours | agenda_items | meeting_status | governance_body_id | business_unit_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | MEE-2370 | Board of Directors | 2024-11-27T22:18:00 | 3.70 | 6 | Scheduled | 100 | 100 |
| 1001 | MEE-2377 | Board of Auditors | 2025-04-11T05:35:00 | 7.40 | 9 | Completed | 101 | 101 |
| 1002 | MEE-2384 | Management Meeting | 2022-09-22T12:52:00 | 11.10 | 12 | Cancelled | 102 | 102 |
| 1003 | MEE-2391 | Committee Meeting | 2023-02-06T19:09:00 | 14.80 | 15 | Scheduled | 103 | 103 |

**Table `policy_documents`**

| policy_document_id | document_identifier | document_title | publication_date | issuing_authority | compliance_standard | document_status | business_unit_id | governance_body_id | meeting_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | DOC-2128 | Compact Series | 2025-12-01 | extended-issuing-33 | primary-complian-88 | Draft | 100 | 100 | 1000 |
| 2 | DOC-2129 | Legacy Assessment | 2022-05-12 | integrated-issuing-34 | adaptive-complian-89 | Active | 101 | 101 | 1001 |
| 3 | DOC-2130 | Regional Survey A | 2023-10-23 | seasonal-issuing-35 | distributed-complian-90 | Superseded | 102 | 102 | 1002 |
| 4 | DOC-2131 | Seasonal Corridor | 2024-03-07 | regional-issuing-36 | baseline-complian-91 | Draft | 103 | 103 | 1003 |

**Table `bodies_members`**

| governance_body_id | governance_member_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `divisions_auditors`**

| internal_auditing_division_id | internal_auditor_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `meetings_members`**

| meeting_id | governance_member_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**View `governance_body_business_unit_view`**

```sql
CREATE VIEW governance_body_business_unit_view AS
SELECT a.id, a.body_identifier, a.body_name, a.body_type, b.id AS unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM governance_bodies a JOIN business_units b ON a.business_unit_id = b.id;
```

| id | body_identifier | body_name | body_type | unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 100 | BOD-2053 | Regional Corridor | Board of Directors | 100 | UNI-2580 | Compact Series |
| 101 | BOD-2058 | Seasonal Series D | Board of Auditors | 101 | UNI-2584 | Legacy Assessment |
| 102 | BOD-2063 | Integrated Assessment | Management Meeting | 102 | UNI-2588 | Regional Survey A |
| 103 | BOD-2068 | Extended Survey | Management Advisory Committee | 103 | UNI-2592 | Seasonal Corridor |

**View `governance_body_governance_member_detail_view`**

```sql
CREATE VIEW governance_body_governance_member_detail_view AS
SELECT a.id, a.body_identifier, a.body_name, b.id AS member_id, b.member_identifier AS member_member_identifier, b.member_name AS member_member_name
FROM governance_bodies a
  JOIN bodies_members j ON j.governance_body_id = a.id
  JOIN governance_members b ON b.id = j.governance_member_id;
```

| id | body_identifier | body_name | member_id | member_member_identifier | member_member_name |
|---|---|---|---|---|---|
| 100 | BOD-2053 | Regional Corridor | 1 | MEM-2656 | Stephanie Higgins |
| 100 | BOD-2053 | Regional Corridor | 2 | MEM-2660 | Stephanie Sutton |
| 101 | BOD-2058 | Seasonal Series D | 2 | MEM-2660 | Stephanie Sutton |
| 101 | BOD-2058 | Seasonal Series D | 3 | MEM-2664 | Michael Oconnell |
| 102 | BOD-2063 | Integrated Assessment | 3 | MEM-2664 | Michael Oconnell |
| 102 | BOD-2063 | Integrated Assessment | 4 | MEM-2668 | Theodore Mcgrath |
| 103 | BOD-2068 | Extended Survey | 4 | MEM-2668 | Theodore Mcgrath |
| 103 | BOD-2068 | Extended Survey | 1 | MEM-2656 | Stephanie Higgins |

**View `governance_member_governance_body_view`**

```sql
CREATE VIEW governance_member_governance_body_view AS
SELECT a.id, a.member_identifier, a.member_name, a.member_role, b.id AS body_id, b.body_identifier AS body_body_identifier, b.body_name AS body_body_name
FROM governance_members a JOIN governance_bodies b ON a.governance_body_id = b.id;
```

| id | member_identifier | member_name | member_role | body_id | body_body_identifier | body_body_name |
|---|---|---|---|---|---|---|
| 1 | MEM-2656 | Stephanie Higgins | Director | 100 | BOD-2053 | Regional Corridor |
| 2 | MEM-2660 | Stephanie Sutton | External Director | 101 | BOD-2058 | Seasonal Series D |
| 3 | MEM-2664 | Michael Oconnell | Auditor | 102 | BOD-2063 | Integrated Assessment |
| 4 | MEM-2668 | Theodore Mcgrath | External Auditor | 103 | BOD-2068 | Extended Survey |

**View `governance_member_meeting_view`**

```sql
CREATE VIEW governance_member_meeting_view AS
SELECT a.id, a.member_identifier, a.member_name, a.member_role, b.id AS meeting_id, b.meeting_identifier AS meeting_meeting_identifier, b.meeting_type AS meeting_meeting_type
FROM governance_members a JOIN meetings b ON a.meeting_id = b.id;
```

| id | member_identifier | member_name | member_role | meeting_id | meeting_meeting_identifier | meeting_meeting_type |
|---|---|---|---|---|---|---|
| 1 | MEM-2656 | Stephanie Higgins | Director | 1000 | MEE-2370 | Board of Directors |
| 2 | MEM-2660 | Stephanie Sutton | External Director | 1001 | MEE-2377 | Board of Auditors |
| 3 | MEM-2664 | Michael Oconnell | Auditor | 1002 | MEE-2384 | Management Meeting |
| 4 | MEM-2668 | Theodore Mcgrath | External Auditor | 1003 | MEE-2391 | Committee Meeting |

**View `business_unit_governance_body_view`**

```sql
CREATE VIEW business_unit_governance_body_view AS
SELECT a.id, a.unit_identifier, a.unit_name, a.unit_type, b.id AS body_id, b.body_identifier AS body_body_identifier, b.body_name AS body_body_name
FROM business_units a JOIN governance_bodies b ON a.governance_body_id = b.id;
```

| id | unit_identifier | unit_name | unit_type | body_id | body_body_identifier | body_body_name |
|---|---|---|---|---|---|---|
| 100 | UNI-2580 | Compact Series | Corporate Business Division | 100 | BOD-2053 | Regional Corridor |
| 101 | UNI-2584 | Legacy Assessment | Subsidiary | 101 | BOD-2058 | Seasonal Series D |
| 102 | UNI-2588 | Regional Survey A | Affiliate | 102 | BOD-2063 | Integrated Assessment |
| 103 | UNI-2592 | Seasonal Corridor | Corporate Business Division | 103 | BOD-2068 | Extended Survey |

**View `business_unit_internal_auditing_division_view`**

```sql
CREATE VIEW business_unit_internal_auditing_division_view AS
SELECT a.id, a.unit_identifier, a.unit_name, a.unit_type, b.id AS division_id, b.division_identifier AS division_division_identifier, b.division_name AS division_division_name
FROM business_units a JOIN internal_auditing_divisions b ON a.internal_auditing_division_id = b.id;
```

| id | unit_identifier | unit_name | unit_type | division_id | division_division_identifier | division_division_name |
|---|---|---|---|---|---|---|
| 100 | UNI-2580 | Compact Series | Corporate Business Division | 1 | DIV-2046 | Composite Protocol |
| 101 | UNI-2584 | Legacy Assessment | Subsidiary | 2 | DIV-2051 | Compact Programme A |
| 102 | UNI-2588 | Regional Survey A | Affiliate | 3 | DIV-2056 | Legacy Standard |
| 103 | UNI-2592 | Seasonal Corridor | Corporate Business Division | 4 | DIV-2061 | Regional Framework |

**View `internal_auditing_division_business_unit_view`**

```sql
CREATE VIEW internal_auditing_division_business_unit_view AS
SELECT a.id, a.division_identifier, a.division_name, a.member_count, b.id AS unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM internal_auditing_divisions a JOIN business_units b ON a.business_unit_id = b.id;
```

| id | division_identifier | division_name | member_count | unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | DIV-2046 | Composite Protocol | 4 | 100 | UNI-2580 | Compact Series |
| 2 | DIV-2051 | Compact Programme A | 17 | 101 | UNI-2584 | Legacy Assessment |
| 3 | DIV-2056 | Legacy Standard | 9 | 102 | UNI-2588 | Regional Survey A |
| 4 | DIV-2061 | Regional Framework | 0 | 103 | UNI-2592 | Seasonal Corridor |

**View `internal_auditing_division_internal_auditor_detail_view`**

```sql
CREATE VIEW internal_auditing_division_internal_auditor_detail_view AS
SELECT a.id, a.division_identifier, a.division_name, b.internal_auditor_id AS auditor_internal_auditor_id, b.auditor_identifier AS auditor_auditor_identifier, b.auditor_name AS auditor_auditor_name
FROM internal_auditing_divisions a
  JOIN divisions_auditors j ON j.internal_auditing_division_id = a.id
  JOIN internal_auditors b ON b.internal_auditor_id = j.internal_auditor_id;
```

| id | division_identifier | division_name | auditor_internal_auditor_id | auditor_auditor_identifier | auditor_auditor_name |
|---|---|---|---|---|---|
| 1 | DIV-2046 | Composite Protocol | 1 | AUD-2074 | Compact Initiative |
| 1 | DIV-2046 | Composite Protocol | 2 | AUD-2076 | Legacy Model |
| 2 | DIV-2051 | Compact Programme A | 2 | AUD-2076 | Legacy Model |
| 2 | DIV-2051 | Compact Programme A | 3 | AUD-2078 | Regional Cluster A |
| 3 | DIV-2056 | Legacy Standard | 3 | AUD-2078 | Regional Cluster A |
| 3 | DIV-2056 | Legacy Standard | 4 | AUD-2080 | Seasonal Review |
| 4 | DIV-2061 | Regional Framework | 4 | AUD-2080 | Seasonal Review |
| 4 | DIV-2061 | Regional Framework | 1 | AUD-2074 | Compact Initiative |

**View `internal_auditor_internal_auditing_division_view`**

```sql
CREATE VIEW internal_auditor_internal_auditing_division_view AS
SELECT a.internal_auditor_id, a.auditor_identifier, a.auditor_name, a.certification_type, b.id AS division_id, b.division_identifier AS division_division_identifier, b.division_name AS division_division_name
FROM internal_auditors a JOIN internal_auditing_divisions b ON a.internal_auditing_division_id = b.id;
```

| internal_auditor_id | auditor_identifier | auditor_name | certification_type | division_id | division_division_identifier | division_division_name |
|---|---|---|---|---|---|---|
| 1 | AUD-2074 | Compact Initiative | distributed-certific-96 | 1 | DIV-2046 | Composite Protocol |
| 2 | AUD-2076 | Legacy Model | baseline-certific-97 | 2 | DIV-2051 | Compact Programme A |
| 3 | AUD-2078 | Regional Cluster A | pilot-certific-98 | 3 | DIV-2056 | Legacy Standard |
| 4 | AUD-2080 | Seasonal Review | extended-certific-99 | 4 | DIV-2061 | Regional Framework |

**View `internal_auditor_business_unit_view`**

```sql
CREATE VIEW internal_auditor_business_unit_view AS
SELECT a.internal_auditor_id, a.auditor_identifier, a.auditor_name, a.certification_type, b.id AS unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM internal_auditors a JOIN business_units b ON a.business_unit_id = b.id;
```

| internal_auditor_id | auditor_identifier | auditor_name | certification_type | unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | AUD-2074 | Compact Initiative | distributed-certific-96 | 100 | UNI-2580 | Compact Series |
| 2 | AUD-2076 | Legacy Model | baseline-certific-97 | 101 | UNI-2584 | Legacy Assessment |
| 3 | AUD-2078 | Regional Cluster A | pilot-certific-98 | 102 | UNI-2588 | Regional Survey A |
| 4 | AUD-2080 | Seasonal Review | extended-certific-99 | 103 | UNI-2592 | Seasonal Corridor |

**View `meeting_governance_body_view`**

```sql
CREATE VIEW meeting_governance_body_view AS
SELECT a.id, a.meeting_identifier, a.meeting_type, a.scheduled_date, b.id AS body_id, b.body_identifier AS body_body_identifier, b.body_name AS body_body_name
FROM meetings a JOIN governance_bodies b ON a.governance_body_id = b.id;
```

| id | meeting_identifier | meeting_type | scheduled_date | body_id | body_body_identifier | body_body_name |
|---|---|---|---|---|---|---|
| 1000 | MEE-2370 | Board of Directors | 2024-11-27T22:18:00 | 100 | BOD-2053 | Regional Corridor |
| 1001 | MEE-2377 | Board of Auditors | 2025-04-11T05:35:00 | 101 | BOD-2058 | Seasonal Series D |
| 1002 | MEE-2384 | Management Meeting | 2022-09-22T12:52:00 | 102 | BOD-2063 | Integrated Assessment |
| 1003 | MEE-2391 | Committee Meeting | 2023-02-06T19:09:00 | 103 | BOD-2068 | Extended Survey |

**View `meeting_governance_member_detail_view`**

```sql
CREATE VIEW meeting_governance_member_detail_view AS
SELECT a.id, a.meeting_identifier, a.meeting_type, b.id AS member_id, b.member_identifier AS member_member_identifier, b.member_name AS member_member_name
FROM meetings a
  JOIN meetings_members j ON j.meeting_id = a.id
  JOIN governance_members b ON b.id = j.governance_member_id;
```

| id | meeting_identifier | meeting_type | member_id | member_member_identifier | member_member_name |
|---|---|---|---|---|---|
| 1000 | MEE-2370 | Board of Directors | 1 | MEM-2656 | Stephanie Higgins |
| 1000 | MEE-2370 | Board of Directors | 2 | MEM-2660 | Stephanie Sutton |
| 1001 | MEE-2377 | Board of Auditors | 2 | MEM-2660 | Stephanie Sutton |
| 1001 | MEE-2377 | Board of Auditors | 3 | MEM-2664 | Michael Oconnell |
| 1002 | MEE-2384 | Management Meeting | 3 | MEM-2664 | Michael Oconnell |
| 1002 | MEE-2384 | Management Meeting | 4 | MEM-2668 | Theodore Mcgrath |
| 1003 | MEE-2391 | Committee Meeting | 4 | MEM-2668 | Theodore Mcgrath |
| 1003 | MEE-2391 | Committee Meeting | 1 | MEM-2656 | Stephanie Higgins |

**View `meeting_business_unit_view`**

```sql
CREATE VIEW meeting_business_unit_view AS
SELECT a.id, a.meeting_identifier, a.meeting_type, a.scheduled_date, b.id AS unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM meetings a JOIN business_units b ON a.business_unit_id = b.id;
```

| id | meeting_identifier | meeting_type | scheduled_date | unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1000 | MEE-2370 | Board of Directors | 2024-11-27T22:18:00 | 100 | UNI-2580 | Compact Series |
| 1001 | MEE-2377 | Board of Auditors | 2025-04-11T05:35:00 | 101 | UNI-2584 | Legacy Assessment |
| 1002 | MEE-2384 | Management Meeting | 2022-09-22T12:52:00 | 102 | UNI-2588 | Regional Survey A |
| 1003 | MEE-2391 | Committee Meeting | 2023-02-06T19:09:00 | 103 | UNI-2592 | Seasonal Corridor |

**View `policy_document_business_unit_view`**

```sql
CREATE VIEW policy_document_business_unit_view AS
SELECT a.policy_document_id, a.document_identifier, a.document_title, a.publication_date, b.id AS unit_id, b.unit_identifier AS unit_unit_identifier, b.unit_name AS unit_unit_name
FROM policy_documents a JOIN business_units b ON a.business_unit_id = b.id;
```

| policy_document_id | document_identifier | document_title | publication_date | unit_id | unit_unit_identifier | unit_unit_name |
|---|---|---|---|---|---|---|
| 1 | DOC-2128 | Compact Series | 2025-12-01 | 100 | UNI-2580 | Compact Series |
| 2 | DOC-2129 | Legacy Assessment | 2022-05-12 | 101 | UNI-2584 | Legacy Assessment |
| 3 | DOC-2130 | Regional Survey A | 2023-10-23 | 102 | UNI-2588 | Regional Survey A |
| 4 | DOC-2131 | Seasonal Corridor | 2024-03-07 | 103 | UNI-2592 | Seasonal Corridor |

**View `policy_document_governance_body_view`**

```sql
CREATE VIEW policy_document_governance_body_view AS
SELECT a.policy_document_id, a.document_identifier, a.document_title, a.publication_date, b.id AS body_id, b.body_identifier AS body_body_identifier, b.body_name AS body_body_name
FROM policy_documents a JOIN governance_bodies b ON a.governance_body_id = b.id;
```

| policy_document_id | document_identifier | document_title | publication_date | body_id | body_body_identifier | body_body_name |
|---|---|---|---|---|---|---|
| 1 | DOC-2128 | Compact Series | 2025-12-01 | 100 | BOD-2053 | Regional Corridor |
| 2 | DOC-2129 | Legacy Assessment | 2022-05-12 | 101 | BOD-2058 | Seasonal Series D |
| 3 | DOC-2130 | Regional Survey A | 2023-10-23 | 102 | BOD-2063 | Integrated Assessment |
| 4 | DOC-2131 | Seasonal Corridor | 2024-03-07 | 103 | BOD-2068 | Extended Survey |

**View `policy_document_meeting_view`**

```sql
CREATE VIEW policy_document_meeting_view AS
SELECT a.policy_document_id, a.document_identifier, a.document_title, a.publication_date, b.id AS meeting_id, b.meeting_identifier AS meeting_meeting_identifier, b.meeting_type AS meeting_meeting_type
FROM policy_documents a JOIN meetings b ON a.meeting_id = b.id;
```

| policy_document_id | document_identifier | document_title | publication_date | meeting_id | meeting_meeting_identifier | meeting_meeting_type |
|---|---|---|---|---|---|---|
| 1 | DOC-2128 | Compact Series | 2025-12-01 | 1000 | MEE-2370 | Board of Directors |
| 2 | DOC-2129 | Legacy Assessment | 2022-05-12 | 1001 | MEE-2377 | Board of Auditors |
| 3 | DOC-2130 | Regional Survey A | 2023-10-23 | 1002 | MEE-2384 | Management Meeting |
| 4 | DOC-2131 | Seasonal Corridor | 2024-03-07 | 1003 | MEE-2391 | Committee Meeting |
