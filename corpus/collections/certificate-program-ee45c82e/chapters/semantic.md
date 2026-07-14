The chapter has been written and committed. Here's a summary of what was produced:

**File:** `chapter_7_certificate_admission_schema.md` (1,920 words, 93 lines)

**Structure:**
1. **Opening** — Frames the certificate admission domain as an ontology with six core entity types and three many-to-many associations
2. **The Core Entity Tables** — Describes each of the six base tables (`certificate_programs`, `admission_requirements`, `credentials`, `english_proficiency_tests`, `test_scores`, `applicants`) with their primary keys, foreign keys, attributes, and representative row values
3. **Junction Tables and Many-to-Many Associations** — Explains how `programs_requirements`, `applicants_requirements`, and `applicants_credentials` resolve many-to-many relationships
4. **Foreign-Key Topology and Cardinality** — Maps the directed acyclic FK graph from root entities through the central `admission_requirements` hub to leaf entities
5. **Denormalized Views** — All 11 views are interpreted with concrete row examples showing what domain question each join answers
6. **Synthesis** — Summarizes the schema's clean separation between ontology entities and relational materialization

**Payload markers:** All 20 markers (9 TABLE + 11 VIEW) present exactly once, each embedded alone on its own line.

## Data appendix

**Table `certificate_programs`**

| id | program_id | program_name | delivery_mode | effective_date | minimum_g_p_a | word_limit | credential_id |
|---|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | integrated-delivery-22 | 2023-02-14 | 17.20 | 4 | 168538 |
| 1001 | 2986219 | Pilot Initiative A | seasonal-delivery-23 | 2024-07-25 | 20.40 | 7 | default_chart_a_tax_10 |
| 1002 | 1186079 | Baseline Model | regional-delivery-24 | 2025-12-09 | 23.60 | 10 | ChIJIbRFlPtt5kcR5kM81XdpSfI |
| 1003 | 1562855 | Distributed Cluster | legacy-delivery-25 | 2022-05-20 | 26.80 | 13 | 2002007020220 |

**Table `admission_requirements`**

| id | requirement_id | requirement_type | description | is_mandatory | valid_from | certificate_program_id | admission_requirement_id |
|---|---|---|---|---|---|---|---|
| 1 | 778568 | composite-requirem-93 | Extended Survey | true | 2025-12-17 | 1000 | 1 |
| 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 | Pilot Corridor A | false | 2022-05-01 | 1001 | 2 |
| 3 | 99901 | adaptive-requirem-95 | Baseline Series | true | 2023-10-12 | 1002 | 3 |
| 4 | 5917277 | distributed-requirem-96 | Distributed Assessment | false | 2024-03-23 | 1003 | 4 |

**Table `credentials`**

| credential_id | credential_type | issuing_institution | issue_date | status | admission_requirement_id |
|---|---|---|---|---|---|
| 168538 | distributed-credenti-60 | distributed-issuing-96 | 2023-02-01 | regional-status-84 | 1 |
| default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 | 2024-07-12 | legacy-status-85 | 2 |
| ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 | 2025-12-23 | compact-status-86 | 3 |
| 2002007020220 | extended-credenti-63 | extended-issuing-99 | 2022-05-07 | composite-status-87 | 4 |

**Table `english_proficiency_tests`**

| id | test_id | test_name | min_score | test_format | admission_requirement_id | test_score_id |
|---|---|---|---|---|---|---|
| 1 | 2106696 | Legacy Assessment D | 21 | legacy-test-19 | 1 | 1000 |
| 2 | 7119774 | Regional Survey | 26 | compact-test-20 | 2 | 1001 |
| 3 | 7441144 | Seasonal Corridor | 31 | composite-test-21 | 3 | 1002 |
| 4 | 8350010 | Integrated Series A | 36 | primary-test-22 | 4 | 1003 |

**Table `test_scores`**

| id | score_id | score_value | test_date | valid_until | english_proficiency_test_id | applicant_id |
|---|---|---|---|---|---|---|
| 1000 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 11 | 2024-11-13 | 2023-06-09 | 1 | Retur |
| 1001 | 10449532 | 16 | 2025-04-24 | 2024-11-20 | 2 | 8387528 |
| 1002 | 4985159 | 21 | 2022-09-08 | 2025-04-04 | 3 | 3355769 |
| 1003 | 195363 | 26 | 2023-02-19 | 2022-09-15 | 4 | id_25 |

**Table `applicants`**

| applicant_id | full_name | nationality | application_status | submission_date |
|---|---|---|---|---|
| Retur | Theodore Mcgrath | composite-national-39 | primary-applicat-16 | 2025-04-24 |
| 8387528 | Account Name | primary-national-40 | adaptive-applicat-17 | 2022-09-08 |
| 3355769 | Saipan International Airport | adaptive-national-41 | distributed-applicat-18 | 2023-02-19 |
| id_25 | Norma Fisher | distributed-national-42 | baseline-applicat-19 | 2024-07-03 |

**Table `programs_requirements`**

| certificate_program_id | admission_requirement_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `applicants_requirements`**

| applicant_id | admission_requirement_id |
|---|---|
| Retur | 1 |
| Retur | 2 |
| 8387528 | 2 |
| 8387528 | 3 |
| 3355769 | 3 |
| 3355769 | 4 |
| id_25 | 4 |
| id_25 | 1 |

**Table `applicants_credentials`**

| applicant_id | credential_id |
|---|---|
| Retur | 168538 |
| Retur | default_chart_a_tax_10 |
| 8387528 | default_chart_a_tax_10 |
| 8387528 | ChIJIbRFlPtt5kcR5kM81XdpSfI |
| 3355769 | ChIJIbRFlPtt5kcR5kM81XdpSfI |
| 3355769 | 2002007020220 |
| id_25 | 2002007020220 |
| id_25 | 168538 |

**View `certificate_program_admission_requirement_detail_view`**

```sql
CREATE VIEW certificate_program_admission_requirement_detail_view AS
SELECT a.id, a.program_id, a.program_name, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM certificate_programs a
  JOIN programs_requirements j ON j.certificate_program_id = a.id
  JOIN admission_requirements b ON b.id = j.admission_requirement_id;
```

| id | program_id | program_name | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | 1 | 778568 | composite-requirem-93 |
| 1000 | 103176 | Extended Review | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 1001 | 2986219 | Pilot Initiative A | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 1001 | 2986219 | Pilot Initiative A | 3 | 99901 | adaptive-requirem-95 |
| 1002 | 1186079 | Baseline Model | 3 | 99901 | adaptive-requirem-95 |
| 1002 | 1186079 | Baseline Model | 4 | 5917277 | distributed-requirem-96 |
| 1003 | 1562855 | Distributed Cluster | 4 | 5917277 | distributed-requirem-96 |
| 1003 | 1562855 | Distributed Cluster | 1 | 778568 | composite-requirem-93 |

**View `certificate_program_credential_view`**

```sql
CREATE VIEW certificate_program_credential_view AS
SELECT a.id, a.program_id, a.program_name, a.delivery_mode, b.credential_id AS credential_credential_id, b.credential_type AS credential_credential_type, b.issuing_institution AS credential_issuing_institution
FROM certificate_programs a JOIN credentials b ON a.credential_id = b.credential_id;
```

| id | program_id | program_name | delivery_mode | credential_credential_id | credential_credential_type | credential_issuing_institution |
|---|---|---|---|---|---|---|
| 1000 | 103176 | Extended Review | integrated-delivery-22 | 168538 | distributed-credenti-60 | distributed-issuing-96 |
| 1001 | 2986219 | Pilot Initiative A | seasonal-delivery-23 | default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 |
| 1002 | 1186079 | Baseline Model | regional-delivery-24 | ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 |
| 1003 | 1562855 | Distributed Cluster | legacy-delivery-25 | 2002007020220 | extended-credenti-63 | extended-issuing-99 |

**View `admission_requirement_certificate_program_view`**

```sql
CREATE VIEW admission_requirement_certificate_program_view AS
SELECT a.id, a.requirement_id, a.requirement_type, a.description, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM admission_requirements a JOIN certificate_programs b ON a.certificate_program_id = b.id;
```

| id | requirement_id | requirement_type | description | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 778568 | composite-requirem-93 | Extended Survey | 1000 | 103176 | Extended Review |
| 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 | Pilot Corridor A | 1001 | 2986219 | Pilot Initiative A |
| 3 | 99901 | adaptive-requirem-95 | Baseline Series | 1002 | 1186079 | Baseline Model |
| 4 | 5917277 | distributed-requirem-96 | Distributed Assessment | 1003 | 1562855 | Distributed Cluster |

**View `admission_requirement_admission_requirement_view`**

```sql
CREATE VIEW admission_requirement_admission_requirement_view AS
SELECT a.id, a.requirement_id, a.requirement_type, a.description, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM admission_requirements a JOIN admission_requirements b ON a.admission_requirement_id = b.id;
```

| id | requirement_id | requirement_type | description | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|---|
| 1 | 778568 | composite-requirem-93 | Extended Survey | 1 | 778568 | composite-requirem-93 |
| 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 | Pilot Corridor A | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 3 | 99901 | adaptive-requirem-95 | Baseline Series | 3 | 99901 | adaptive-requirem-95 |
| 4 | 5917277 | distributed-requirem-96 | Distributed Assessment | 4 | 5917277 | distributed-requirem-96 |

**View `credential_admission_requirement_view`**

```sql
CREATE VIEW credential_admission_requirement_view AS
SELECT a.credential_id, a.credential_type, a.issuing_institution, a.issue_date, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM credentials a JOIN admission_requirements b ON a.admission_requirement_id = b.id;
```

| credential_id | credential_type | issuing_institution | issue_date | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|---|
| 168538 | distributed-credenti-60 | distributed-issuing-96 | 2023-02-01 | 1 | 778568 | composite-requirem-93 |
| default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 | 2024-07-12 | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 | 2025-12-23 | 3 | 99901 | adaptive-requirem-95 |
| 2002007020220 | extended-credenti-63 | extended-issuing-99 | 2022-05-07 | 4 | 5917277 | distributed-requirem-96 |

**View `english_proficiency_test_admission_requirement_view`**

```sql
CREATE VIEW english_proficiency_test_admission_requirement_view AS
SELECT a.id, a.test_id, a.test_name, a.min_score, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM english_proficiency_tests a JOIN admission_requirements b ON a.admission_requirement_id = b.id;
```

| id | test_id | test_name | min_score | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|---|
| 1 | 2106696 | Legacy Assessment D | 21 | 1 | 778568 | composite-requirem-93 |
| 2 | 7119774 | Regional Survey | 26 | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 3 | 7441144 | Seasonal Corridor | 31 | 3 | 99901 | adaptive-requirem-95 |
| 4 | 8350010 | Integrated Series A | 36 | 4 | 5917277 | distributed-requirem-96 |

**View `english_proficiency_test_test_score_view`**

```sql
CREATE VIEW english_proficiency_test_test_score_view AS
SELECT a.id, a.test_id, a.test_name, a.min_score, b.id AS score_id, b.score_id AS score_score_id, b.score_value AS score_score_value
FROM english_proficiency_tests a JOIN test_scores b ON a.test_score_id = b.id;
```

| id | test_id | test_name | min_score | score_id | score_score_id | score_score_value |
|---|---|---|---|---|---|---|
| 1 | 2106696 | Legacy Assessment D | 21 | 1000 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 11 |
| 2 | 7119774 | Regional Survey | 26 | 1001 | 10449532 | 16 |
| 3 | 7441144 | Seasonal Corridor | 31 | 1002 | 4985159 | 21 |
| 4 | 8350010 | Integrated Series A | 36 | 1003 | 195363 | 26 |

**View `test_score_english_proficiency_test_view`**

```sql
CREATE VIEW test_score_english_proficiency_test_view AS
SELECT a.id, a.score_id, a.score_value, a.test_date, b.id AS test_id, b.test_id AS test_test_id, b.test_name AS test_test_name
FROM test_scores a JOIN english_proficiency_tests b ON a.english_proficiency_test_id = b.id;
```

| id | score_id | score_value | test_date | test_id | test_test_id | test_test_name |
|---|---|---|---|---|---|---|
| 1000 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 11 | 2024-11-13 | 1 | 2106696 | Legacy Assessment D |
| 1001 | 10449532 | 16 | 2025-04-24 | 2 | 7119774 | Regional Survey |
| 1002 | 4985159 | 21 | 2022-09-08 | 3 | 7441144 | Seasonal Corridor |
| 1003 | 195363 | 26 | 2023-02-19 | 4 | 8350010 | Integrated Series A |

**View `test_score_applicant_view`**

```sql
CREATE VIEW test_score_applicant_view AS
SELECT a.id, a.score_id, a.score_value, a.test_date, b.applicant_id AS applicant_applicant_id, b.full_name AS applicant_full_name, b.nationality AS applicant_nationality
FROM test_scores a JOIN applicants b ON a.applicant_id = b.applicant_id;
```

| id | score_id | score_value | test_date | applicant_applicant_id | applicant_full_name | applicant_nationality |
|---|---|---|---|---|---|---|
| 1000 | a854635a-9bad-11eb-a8a2-19ed5c03f8d3 | 11 | 2024-11-13 | Retur | Theodore Mcgrath | composite-national-39 |
| 1001 | 10449532 | 16 | 2025-04-24 | 8387528 | Account Name | primary-national-40 |
| 1002 | 4985159 | 21 | 2022-09-08 | 3355769 | Saipan International Airport | adaptive-national-41 |
| 1003 | 195363 | 26 | 2023-02-19 | id_25 | Norma Fisher | distributed-national-42 |

**View `applicant_admission_requirement_detail_view`**

```sql
CREATE VIEW applicant_admission_requirement_detail_view AS
SELECT a.applicant_id, a.full_name, a.nationality, b.id AS requirement_id, b.requirement_id AS requirement_requirement_id, b.requirement_type AS requirement_requirement_type
FROM applicants a
  JOIN applicants_requirements j ON j.applicant_id = a.applicant_id
  JOIN admission_requirements b ON b.id = j.admission_requirement_id;
```

| applicant_id | full_name | nationality | requirement_id | requirement_requirement_id | requirement_requirement_type |
|---|---|---|---|---|---|
| Retur | Theodore Mcgrath | composite-national-39 | 1 | 778568 | composite-requirem-93 |
| Retur | Theodore Mcgrath | composite-national-39 | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 8387528 | Account Name | primary-national-40 | 2 | lu_tax_code_template_b_VB-EC-0 | primary-requirem-94 |
| 8387528 | Account Name | primary-national-40 | 3 | 99901 | adaptive-requirem-95 |
| 3355769 | Saipan International Airport | adaptive-national-41 | 3 | 99901 | adaptive-requirem-95 |
| 3355769 | Saipan International Airport | adaptive-national-41 | 4 | 5917277 | distributed-requirem-96 |
| id_25 | Norma Fisher | distributed-national-42 | 4 | 5917277 | distributed-requirem-96 |
| id_25 | Norma Fisher | distributed-national-42 | 1 | 778568 | composite-requirem-93 |

**View `applicant_credential_detail_view`**

```sql
CREATE VIEW applicant_credential_detail_view AS
SELECT a.applicant_id, a.full_name, a.nationality, b.credential_id AS credential_credential_id, b.credential_type AS credential_credential_type, b.issuing_institution AS credential_issuing_institution
FROM applicants a
  JOIN applicants_credentials j ON j.applicant_id = a.applicant_id
  JOIN credentials b ON b.credential_id = j.credential_id;
```

| applicant_id | full_name | nationality | credential_credential_id | credential_credential_type | credential_issuing_institution |
|---|---|---|---|---|---|
| Retur | Theodore Mcgrath | composite-national-39 | 168538 | distributed-credenti-60 | distributed-issuing-96 |
| Retur | Theodore Mcgrath | composite-national-39 | default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 |
| 8387528 | Account Name | primary-national-40 | default_chart_a_tax_10 | baseline-credenti-61 | baseline-issuing-97 |
| 8387528 | Account Name | primary-national-40 | ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 |
| 3355769 | Saipan International Airport | adaptive-national-41 | ChIJIbRFlPtt5kcR5kM81XdpSfI | pilot-credenti-62 | pilot-issuing-98 |
| 3355769 | Saipan International Airport | adaptive-national-41 | 2002007020220 | extended-credenti-63 | extended-issuing-99 |
| id_25 | Norma Fisher | distributed-national-42 | 2002007020220 | extended-credenti-63 | extended-issuing-99 |
| id_25 | Norma Fisher | distributed-national-42 | 168538 | distributed-credenti-60 | distributed-issuing-96 |
