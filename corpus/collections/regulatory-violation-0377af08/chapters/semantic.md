## Modelling Regulatory Compliance: From Ontology to Normalized Schema

The domain under examination captures the lifecycle of nuclear regulatory oversight: a licensee operates a facility, an inspector conducts an inspection, a violation is identified and classified, a corrective action plan is drafted and approved, and radiation surveys document the physical conditions that triggered or confirmed the finding. The data model must therefore support a chain of causation that runs from inspection report through violation to corrective action, while also anchoring every artifact to the responsible licensee and to the underlying radiation survey evidence. The resulting schema is a carefully normalised set of seven base tables and two junction tables, linked by foreign keys that enforce referential integrity, and a suite of ten materialised views that reconstruct the domain facts for reporting.

### Base Entities and Their Attributes

The central entity is the regulatory violation. Each violation is a discrete finding with a unique surrogate key, a business-level `violation_id`, a free-text `description`, a `regulatory_reference` pointing to the applicable rule, a `severity_level` drawn from a bounded enumeration, and a `status` tracking its lifecycle from identification through resolution. The table also carries a foreign key to the `inspection_reports` table via `inspection_report_id`, a timestamp `date_identified`, and a denormalised pointer `reported_in_inspection_report_id` that mirrors the inspection link for query convenience.

**Table `regulatory_violations`**

| regulatory_violation_id | violation_id | description | regulatory_reference | severity_level | status | inspection_report_id | date_identified | reported_in_inspection_report_id | corrective_action_plan_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3990166 | Extended Survey | adaptive-regulato-89 | A | pending | 2087738 | 2023-06-23T05:03:00 | 1 | 1 |
| 2 | m16 | Pilot Corridor A | distributed-regulato-90 | B | contested | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-07T12:20:00 | 2 | 2 |
| 3 | 7731883 | Baseline Series | baseline-regulato-91 | C | resolved | 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | 2025-04-18T19:37:00 | 3 | 3 |
| 4 | 325461 | Distributed Assessment | pilot-regulato-92 | D | escalated | L478 | 2022-09-02T02:54:00 | 4 | 4 |

Consider the first row: violation `3990166` titled "Extended Survey" was identified on 2023-06-23, classified at severity level `A`, and remains in `pending` status. It was reported in inspection report `1` and is linked to corrective action plan `1`. The second row, with business identifier `m16` and description "Pilot Corridor A", carries severity level `B` and a `contested` status, illustrating that not all findings are accepted by the licensee. The `regulatory_reference` column stores short codes such as `adaptive-regulato-89` and `distributed-regulato-90`, which serve as stable pointers to the regulatory framework without embedding verbose text in the operational table.

The inspection report table captures the administrative and procedural metadata of each regulatory visit. Its primary key `id` is a surrogate identifier, while `report_number` (e.g., `REP-2464`) provides a human-readable reference. The `issue_date` records when the report was finalised, `issuing_agency` names the inspecting body — `Technos Japan`, `Sanniquellie Mahn`, `Greater Houston Community Foundation`, `Lucas Industries` — and `docket_number` ties the report to a regulatory docket. The `classification` column (`public`, `non-public`, `sensitive`) controls access, while `adams_accession_number` (e.g., `ADA-2140`) links to the public records system. Crucially, `licensee_id` anchors the report to the responsible licensee.

**Table `inspection_reports`**

| id | report_number | issue_date | issuing_agency | docket_number | classification | adams_accession_number | licensee_id |
|---|---|---|---|---|---|---|---|
| 1 | REP-2464 | 2023-02-01T13:51:00 | Technos Japan | DOC-2732 | public | ADA-2140 | 100 |
| 2 | REP-2469 | 2024-07-12T20:08:00 | Sanniquellie Mahn | DOC-2735 | non-public | ADA-2146 | 101 |
| 3 | REP-2474 | 2025-12-23T03:25:00 | Greater Houston Community Foundation | DOC-2738 | sensitive | ADA-2152 | 102 |
| 4 | REP-2479 | 2022-05-07T10:42:00 | Lucas Industries | DOC-2741 | public | ADA-2158 | 103 |

The corrective action plan table records the licensee's response to a violation. Its surrogate key `corrective_action_plan_id` maps to a business `plan_id` (e.g., `505977`, `727038`). The `submission_date` marks when the plan was filed, and `compliance_deadline` sets the regulatory deadline — notably, some deadlines precede submission dates in the sample data, reflecting backdated or retroactive plans. The `status` column progresses through `draft`, `submitted`, `under_review`, and `approved`. The `corrective_steps_taken` and `preventive_measures` columns store coded identifiers such as `integrated-correcti-46` and `adaptive-preventi-53`, which reference a separate catalogue of remediation actions. Foreign keys `regulatory_violation_id` and `licensee_id` bind the plan to the violation it addresses and the licensee who submitted it.

**Table `corrective_action_plans`**

| corrective_action_plan_id | plan_id | submission_date | compliance_deadline | status | corrective_steps_taken | preventive_measures | regulatory_violation_id | licensee_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 505977 | 2025-04-24T03:57:00 | 2023-02-24T01:03:00 | draft | integrated-correcti-46 | adaptive-preventi-53 | 1 | 100 |
| 2 | 727038 | 2022-09-08T10:14:00 | 2024-07-08T08:20:00 | submitted | seasonal-correcti-47 | distributed-preventi-54 | 2 | 101 |
| 3 | 937726 | 2023-02-19T17:31:00 | 2025-12-19T15:37:00 | under_review | regional-correcti-48 | baseline-preventi-55 | 3 | 102 |
| 4 | 1290 | 2024-07-03T00:48:00 | 2022-05-03T22:54:00 | approved | legacy-correcti-49 | pilot-preventi-56 | 4 | 103 |

The licensees table is the anchor of the entire model. Each row represents a licensed operator with surrogate key `id`, a human-readable `license_number` (e.g., `LIC-2589`, `LIC-2596`), a `licensee_name` such as "Legacy Assessment D" or "Regional Survey", and a `license_type` drawn from a bounded set (`regional-license-78`, `legacy-license-79`, `compact-license-80`, `composite-license-81`). The `docket_number` links the licensee to its regulatory docket, `address` stores the facility location, and `radiation_safety_officer` names the responsible individual. The `regulatory_violation_id` column creates a direct one-to-one pointer from licensee to their most salient violation, though this relationship is more fully expressed through the junction and foreign-key structure.

**Table `licensees`**

| id | license_number | licensee_name | license_type | docket_number | address | radiation_safety_officer | regulatory_violation_id |
|---|---|---|---|---|---|---|---|
| 100 | LIC-2589 | Legacy Assessment D | regional-license-78 | DOC-2732 | distributed-address-72 | integrated-radiatio-82 | 1 |
| 101 | LIC-2596 | Regional Survey | legacy-license-79 | DOC-2735 | baseline-address-73 | seasonal-radiatio-83 | 2 |
| 102 | LIC-2603 | Seasonal Corridor | compact-license-80 | DOC-2738 | pilot-address-74 | regional-radiatio-84 | 3 |
| 103 | LIC-2610 | Integrated Series A | composite-license-81 | DOC-2741 | extended-address-75 | legacy-radiatio-85 | 4 |

The radiation surveys table captures the physical measurement evidence. Each survey has a surrogate `id`, a business `survey_id`, a `survey_date`, and an `area_type` (`controlled` or `unrestricted`). The `measured_dose_rate` column stores the numeric reading (e.g., `18.20`, `22.40`, `26.60`, `30.80`), and `unit_of_measure` references a coded unit system (`composite-unit-69`, `primary-unit-70`, `adaptive-unit-71`, `distributed-unit-72`). The `compliance_status` column (`compliant`, `non-compliant`, `pending_review`) summarises whether the measurement meets regulatory thresholds. Foreign keys `licensee_id` and `regulatory_violation_id` tie each survey to the operator and the violation it supports.

**Table `radiation_surveys`**

| id | survey_id | survey_date | area_type | measured_dose_rate | unit_of_measure | compliance_status | licensee_id | regulatory_violation_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 21005921 | 2024-07-23T18:30:00 | controlled | 18.20 | composite-unit-69 | compliant | 100 | 1 |
| 101 | 726059 | 2025-12-07T01:47:00 | unrestricted | 22.40 | primary-unit-70 | non-compliant | 101 | 2 |
| 102 | 32814 | 2022-05-18T08:04:00 | controlled | 26.60 | adaptive-unit-71 | pending_review | 102 | 3 |
| 103 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2023-10-02T15:21:00 | unrestricted | 30.80 | distributed-unit-72 | compliant | 103 | 4 |

### Junction Tables and Many-to-Many Relationships

Not all relationships in the domain are one-to-many. An inspection report can identify multiple violations, and a violation can be referenced by multiple reports. This many-to-many relationship is resolved through the `reports_violations` junction table, which contains two columns: `inspection_report_id` and `regulatory_violation_id`. Each row asserts that a specific report identified a specific violation.

**Table `reports_violations`**

| inspection_report_id | regulatory_violation_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The data reveals a cyclic reporting pattern: inspection report `1` reports violations `1` and `2`; report `2` reports violations `2` and `3`; report `3` reports violations `3` and `4`; and report `4` reports violations `4` and `1`. This creates a chain where each report overlaps with its neighbours, suggesting a rolling inspection cycle where adjacent reports share findings. The junction table is the only place this relationship is explicitly stored, preserving the normalised form while allowing efficient join-based queries.

The `licensees_plans` table serves a similar purpose for the licensee–corrective action plan relationship. Although its data is not displayed in the payload, its existence indicates that a licensee may submit multiple plans and a plan may be associated with multiple licensees in certain organisational structures, or that the table captures a historical audit trail of plan ownership changes.

### Materialised Views: Reconstructing Domain Facts

The base tables are normalised to third normal form, which is ideal for data integrity but suboptimal for reporting. The materialised views denormalise specific slices of the schema by joining the relevant tables, producing flat result sets that answer concrete domain questions. Each view is described below with its join logic and representative output.

The view `vw_regulatory_violation_inspection_report` joins `regulatory_violations` to `inspection_reports` on the inspection report foreign key. It answers the question: "What violation was found in which inspection, and when?" A row from this view might show violation `3990166` ("Extended Survey") as identified in inspection report `REP-2464` issued by `Technos Japan` on 2023-02-01.

**View `vw_regulatory_violation_inspection_report`**

```sql
CREATE VIEW vw_regulatory_violation_inspection_report AS
SELECT a.regulatory_violation_id, a.violation_id, a.description, a.regulatory_reference, b.id AS report_id, b.report_number AS report_report_number, b.issue_date AS report_issue_date
FROM regulatory_violations a JOIN inspection_reports b ON a.reported_in_inspection_report_id = b.id;
```

| regulatory_violation_id | violation_id | description | regulatory_reference | report_id | report_report_number | report_issue_date |
|---|---|---|---|---|---|---|
| 1 | 3990166 | Extended Survey | adaptive-regulato-89 | 1 | REP-2464 | 2023-02-01T13:51:00 |
| 2 | m16 | Pilot Corridor A | distributed-regulato-90 | 2 | REP-2469 | 2024-07-12T20:08:00 |
| 3 | 7731883 | Baseline Series | baseline-regulato-91 | 3 | REP-2474 | 2025-12-23T03:25:00 |
| 4 | 325461 | Distributed Assessment | pilot-regulato-92 | 4 | REP-2479 | 2022-05-07T10:42:00 |

The view `vw_regulatory_violation_corrective_action_plan` joins `regulatory_violations` to `corrective_action_plans` on the plan foreign key. It answers: "Which corrective action plan addresses which violation, and what is its status?" A representative row links violation `m16` ("Pilot Corridor A") to plan `727038`, which is in `submitted` status with corrective steps coded as `seasonal-correcti-47`.

**View `vw_regulatory_violation_corrective_action_plan`**

```sql
CREATE VIEW vw_regulatory_violation_corrective_action_plan AS
SELECT a.regulatory_violation_id, a.violation_id, a.description, a.regulatory_reference, b.corrective_action_plan_id AS plan_corrective_action_plan_id, b.plan_id AS plan_plan_id, b.submission_date AS plan_submission_date
FROM regulatory_violations a JOIN corrective_action_plans b ON a.corrective_action_plan_id = b.corrective_action_plan_id;
```

| regulatory_violation_id | violation_id | description | regulatory_reference | plan_corrective_action_plan_id | plan_plan_id | plan_submission_date |
|---|---|---|---|---|---|---|
| 1 | 3990166 | Extended Survey | adaptive-regulato-89 | 1 | 505977 | 2025-04-24T03:57:00 |
| 2 | m16 | Pilot Corridor A | distributed-regulato-90 | 2 | 727038 | 2022-09-08T10:14:00 |
| 3 | 7731883 | Baseline Series | baseline-regulato-91 | 3 | 937726 | 2023-02-19T17:31:00 |
| 4 | 325461 | Distributed Assessment | pilot-regulato-92 | 4 | 1290 | 2024-07-03T00:48:00 |

The view `vw_inspection_report_regulatory_violation_detail` performs the inverse join of the first view, starting from `inspection_reports` and joining to `regulatory_violations`. It answers: "For a given inspection report, what are the detailed violation findings?" Reading a row from this view, one might see inspection report `REP-2469` (issued by `Sanniquellie Mahn` on 2024-07-12) with its associated violation `m16` ("Pilot Corridor A", severity `B`, status `contested`).

**View `vw_inspection_report_regulatory_violation_detail`**

```sql
CREATE VIEW vw_inspection_report_regulatory_violation_detail AS
SELECT a.id, a.report_number, a.issue_date, b.regulatory_violation_id AS violation_regulatory_violation_id, b.violation_id AS violation_violation_id, b.description AS violation_description
FROM inspection_reports a
  JOIN reports_violations j ON j.inspection_report_id = a.id
  JOIN regulatory_violations b ON b.regulatory_violation_id = j.regulatory_violation_id;
```

| id | report_number | issue_date | violation_regulatory_violation_id | violation_violation_id | violation_description |
|---|---|---|---|---|---|
| 1 | REP-2464 | 2023-02-01T13:51:00 | 1 | 3990166 | Extended Survey |
| 1 | REP-2464 | 2023-02-01T13:51:00 | 2 | m16 | Pilot Corridor A |
| 2 | REP-2469 | 2024-07-12T20:08:00 | 2 | m16 | Pilot Corridor A |
| 2 | REP-2469 | 2024-07-12T20:08:00 | 3 | 7731883 | Baseline Series |
| 3 | REP-2474 | 2025-12-23T03:25:00 | 3 | 7731883 | Baseline Series |
| 3 | REP-2474 | 2025-12-23T03:25:00 | 4 | 325461 | Distributed Assessment |
| 4 | REP-2479 | 2022-05-07T10:42:00 | 4 | 325461 | Distributed Assessment |
| 4 | REP-2479 | 2022-05-07T10:42:00 | 1 | 3990166 | Extended Survey |

The view `vw_inspection_report_licensee` joins `inspection_reports` to `licensees` on the licensee foreign key. It answers: "Which licensee was subject to which inspection report?" A row from this view might show inspection report `REP-2464` issued to licensee `LIC-2589` ("Legacy Assessment D"), a regional licensee holding docket `DOC-2732`.

**View `vw_inspection_report_licensee`**

```sql
CREATE VIEW vw_inspection_report_licensee AS
SELECT a.id, a.report_number, a.issue_date, a.issuing_agency, b.id AS licensee_id, b.license_number AS licensee_license_number, b.licensee_name AS licensee_licensee_name
FROM inspection_reports a JOIN licensees b ON a.licensee_id = b.id;
```

| id | report_number | issue_date | issuing_agency | licensee_id | licensee_license_number | licensee_licensee_name |
|---|---|---|---|---|---|---|
| 1 | REP-2464 | 2023-02-01T13:51:00 | Technos Japan | 100 | LIC-2589 | Legacy Assessment D |
| 2 | REP-2469 | 2024-07-12T20:08:00 | Sanniquellie Mahn | 101 | LIC-2596 | Regional Survey |
| 3 | REP-2474 | 2025-12-23T03:25:00 | Greater Houston Community Foundation | 102 | LIC-2603 | Seasonal Corridor |
| 4 | REP-2479 | 2022-05-07T10:42:00 | Lucas Industries | 103 | LIC-2610 | Integrated Series A |

The view `vw_corrective_action_plan_regulatory_violation` joins `corrective_action_plans` to `regulatory_violations` in the reverse direction. It answers: "Given a corrective action plan, what violation does it remediate?" A representative row links plan `505977` (submitted 2025-04-24, status `draft`) to violation `3990166` ("Extended Survey", severity `A`).

**View `vw_corrective_action_plan_regulatory_violation`**

```sql
CREATE VIEW vw_corrective_action_plan_regulatory_violation AS
SELECT a.corrective_action_plan_id, a.plan_id, a.submission_date, a.compliance_deadline, b.regulatory_violation_id AS violation_regulatory_violation_id, b.violation_id AS violation_violation_id, b.description AS violation_description
FROM corrective_action_plans a JOIN regulatory_violations b ON a.regulatory_violation_id = b.regulatory_violation_id;
```

| corrective_action_plan_id | plan_id | submission_date | compliance_deadline | violation_regulatory_violation_id | violation_violation_id | violation_description |
|---|---|---|---|---|---|---|
| 1 | 505977 | 2025-04-24T03:57:00 | 2023-02-24T01:03:00 | 1 | 3990166 | Extended Survey |
| 2 | 727038 | 2022-09-08T10:14:00 | 2024-07-08T08:20:00 | 2 | m16 | Pilot Corridor A |
| 3 | 937726 | 2023-02-19T17:31:00 | 2025-12-19T15:37:00 | 3 | 7731883 | Baseline Series |
| 4 | 1290 | 2024-07-03T00:48:00 | 2022-05-03T22:54:00 | 4 | 325461 | Distributed Assessment |

The view `vw_corrective_action_plan_licensee` joins `corrective_action_plans` to `licensees` on the licensee foreign key. It answers: "Which licensee submitted which corrective action plan?" A row from this view might show plan `727038` submitted by licensee `LIC-2596` ("Regional Survey"), a legacy licensee with docket `DOC-2735`.

**View `vw_corrective_action_plan_licensee`**

```sql
CREATE VIEW vw_corrective_action_plan_licensee AS
SELECT a.corrective_action_plan_id, a.plan_id, a.submission_date, a.compliance_deadline, b.id AS licensee_id, b.license_number AS licensee_license_number, b.licensee_name AS licensee_licensee_name
FROM corrective_action_plans a JOIN licensees b ON a.licensee_id = b.id;
```

| corrective_action_plan_id | plan_id | submission_date | compliance_deadline | licensee_id | licensee_license_number | licensee_licensee_name |
|---|---|---|---|---|---|---|
| 1 | 505977 | 2025-04-24T03:57:00 | 2023-02-24T01:03:00 | 100 | LIC-2589 | Legacy Assessment D |
| 2 | 727038 | 2022-09-08T10:14:00 | 2024-07-08T08:20:00 | 101 | LIC-2596 | Regional Survey |
| 3 | 937726 | 2023-02-19T17:31:00 | 2025-12-19T15:37:00 | 102 | LIC-2603 | Seasonal Corridor |
| 4 | 1290 | 2024-07-03T00:48:00 | 2022-05-03T22:54:00 | 103 | LIC-2610 | Integrated Series A |

The view `vw_licensee_regulatory_violation` joins `licensees` to `regulatory_violations` on the violation foreign key. It answers: "What are the regulatory violations associated with a given licensee?" A representative row links licensee `LIC-2603` ("Seasonal Corridor", compact license type) to violation `7731883` ("Baseline Series", severity `C`, status `resolved`).

**View `vw_licensee_regulatory_violation`**

```sql
CREATE VIEW vw_licensee_regulatory_violation AS
SELECT a.id, a.license_number, a.licensee_name, a.license_type, b.regulatory_violation_id AS violation_regulatory_violation_id, b.violation_id AS violation_violation_id, b.description AS violation_description
FROM licensees a JOIN regulatory_violations b ON a.regulatory_violation_id = b.regulatory_violation_id;
```

| id | license_number | licensee_name | license_type | violation_regulatory_violation_id | violation_violation_id | violation_description |
|---|---|---|---|---|---|---|
| 100 | LIC-2589 | Legacy Assessment D | regional-license-78 | 1 | 3990166 | Extended Survey |
| 101 | LIC-2596 | Regional Survey | legacy-license-79 | 2 | m16 | Pilot Corridor A |
| 102 | LIC-2603 | Seasonal Corridor | compact-license-80 | 3 | 7731883 | Baseline Series |
| 103 | LIC-2610 | Integrated Series A | composite-license-81 | 4 | 325461 | Distributed Assessment |

The view `vw_licensee_corrective_action_plan_detail` joins `licensees` to `corrective_action_plans` and then to `regulatory_violations`, producing a three-table join. It answers: "For a given licensee, what corrective action plans have been submitted, and what violations do they address?" A row from this view might show licensee `LIC-2610` ("Integrated Series A") with plan `1290` (status `approved`) addressing violation `325461` ("Distributed Assessment", severity `D`, status `escalated`).

**View `vw_licensee_corrective_action_plan_detail`**

```sql
CREATE VIEW vw_licensee_corrective_action_plan_detail AS
SELECT a.id, a.license_number, a.licensee_name, b.corrective_action_plan_id AS plan_corrective_action_plan_id, b.plan_id AS plan_plan_id, b.submission_date AS plan_submission_date
FROM licensees a
  JOIN licensees_plans j ON j.licensee_id = a.id
  JOIN corrective_action_plans b ON b.corrective_action_plan_id = j.corrective_action_plan_id;
```

| id | license_number | licensee_name | plan_corrective_action_plan_id | plan_plan_id | plan_submission_date |
|---|---|---|---|---|---|
| 100 | LIC-2589 | Legacy Assessment D | 1 | 505977 | 2025-04-24T03:57:00 |
| 100 | LIC-2589 | Legacy Assessment D | 2 | 727038 | 2022-09-08T10:14:00 |
| 101 | LIC-2596 | Regional Survey | 2 | 727038 | 2022-09-08T10:14:00 |
| 101 | LIC-2596 | Regional Survey | 3 | 937726 | 2023-02-19T17:31:00 |
| 102 | LIC-2603 | Seasonal Corridor | 3 | 937726 | 2023-02-19T17:31:00 |
| 102 | LIC-2603 | Seasonal Corridor | 4 | 1290 | 2024-07-03T00:48:00 |
| 103 | LIC-2610 | Integrated Series A | 4 | 1290 | 2024-07-03T00:48:00 |
| 103 | LIC-2610 | Integrated Series A | 1 | 505977 | 2025-04-24T03:57:00 |

The view `vw_radiation_survey_licensee` joins `radiation_surveys` to `licensees` on the licensee foreign key. It answers: "Which licensee conducted which radiation survey, and what were the results?" A representative row links survey `21005921` (measured dose rate `18.20`, area type `controlled`) to licensee `LIC-2589` ("Legacy Assessment D"), with a `compliant` compliance status.

**View `vw_radiation_survey_licensee`**

```sql
CREATE VIEW vw_radiation_survey_licensee AS
SELECT a.id, a.survey_id, a.survey_date, a.area_type, b.id AS licensee_id, b.license_number AS licensee_license_number, b.licensee_name AS licensee_licensee_name
FROM radiation_surveys a JOIN licensees b ON a.licensee_id = b.id;
```

| id | survey_id | survey_date | area_type | licensee_id | licensee_license_number | licensee_licensee_name |
|---|---|---|---|---|---|---|
| 100 | 21005921 | 2024-07-23T18:30:00 | controlled | 100 | LIC-2589 | Legacy Assessment D |
| 101 | 726059 | 2025-12-07T01:47:00 | unrestricted | 101 | LIC-2596 | Regional Survey |
| 102 | 32814 | 2022-05-18T08:04:00 | controlled | 102 | LIC-2603 | Seasonal Corridor |
| 103 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2023-10-02T15:21:00 | unrestricted | 103 | LIC-2610 | Integrated Series A |

The view `vw_radiation_survey_regulatory_violation` joins `radiation_surveys` to `regulatory_violations` on the violation foreign key. It answers: "Which radiation survey supports which violation finding?" A row from this view might show survey `726059` (measured dose rate `22.40`, area type `unrestricted`, status `non-compliant`) supporting violation `m16` ("Pilot Corridor A", severity `B`, status `contested`).

**View `vw_radiation_survey_regulatory_violation`**

```sql
CREATE VIEW vw_radiation_survey_regulatory_violation AS
SELECT a.id, a.survey_id, a.survey_date, a.area_type, b.regulatory_violation_id AS violation_regulatory_violation_id, b.violation_id AS violation_violation_id, b.description AS violation_description
FROM radiation_surveys a JOIN regulatory_violations b ON a.regulatory_violation_id = b.regulatory_violation_id;
```

| id | survey_id | survey_date | area_type | violation_regulatory_violation_id | violation_violation_id | violation_description |
|---|---|---|---|---|---|---|
| 100 | 21005921 | 2024-07-23T18:30:00 | controlled | 1 | 3990166 | Extended Survey |
| 101 | 726059 | 2025-12-07T01:47:00 | unrestricted | 2 | m16 | Pilot Corridor A |
| 102 | 32814 | 2022-05-18T08:04:00 | controlled | 3 | 7731883 | Baseline Series |
| 103 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2023-10-02T15:21:00 | unrestricted | 4 | 325461 | Distributed Assessment |

### Synthesis

The schema models the regulatory compliance domain as a directed graph of entities: inspections produce violations, violations trigger corrective action plans, licensees own both inspections and plans, and radiation surveys provide the physical evidence linking measurements to findings. The normalised base tables enforce this structure through foreign keys — `regulatory_violations.inspection_report_id` references `inspection_reports.id`, `corrective_action_plans.regulatory_violation_id` references `regulatory_violations.regulatory_violation_id`, and so on — while the junction table `reports_violations` resolves the many-to-many relationship between inspections and violations. The ten materialised views flatten specific paths through this graph, each answering a distinct reporting question by joining two or three tables and presenting the result as a single flat row. Together, the tables and views form a complete, queryable representation of the regulatory lifecycle, from the initial inspection report through the final corrective action plan, with every fact traceable to its source table and every join reconstructing a domain fact from its normalised components.

## Data appendix

**Table `licensees_plans`**

| licensee_id | corrective_action_plan_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
