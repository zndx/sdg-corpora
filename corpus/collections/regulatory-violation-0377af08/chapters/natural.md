# Radiation Regulatory Compliance and Enforcement Tracking

The oversight of licensed radiation facilities rests on a structured chain of documentation that begins with an inspection, proceeds through violation identification, and culminates in corrective action. Regulators at federal, state, and local levels rely on interconnected records to track compliance across thousands of facilities that operate radiation sources in medical, industrial, and research settings. Each facility holds a license, undergoes periodic inspections, and when deficiencies are found, must develop corrective action plans that address the root cause and prevent recurrence. Radiation surveys conducted at these sites provide the quantitative measurements that underpin compliance determinations, translating raw dose-rate readings into formal assessments of whether operational boundaries have been respected. The system described here captures every stage of this lifecycle, from the initial inspection report through the resolution or escalation of a regulatory violation.

## The Inspection Foundation

Every enforcement action originates in an inspection report, a formal document produced by the issuing agency that records findings at a specific facility on a specific date. The report carries a unique report number, an issue date, and a classification that governs its accessibility to the public.

**Table `inspection_reports`**

| id | report_number | issue_date | issuing_agency | docket_number | classification | adams_accession_number | licensee_id |
|---|---|---|---|---|---|---|---|
| 1 | REP-2464 | 2023-02-01T13:51:00 | Technos Japan | DOC-2732 | public | ADA-2140 | 100 |
| 2 | REP-2469 | 2024-07-12T20:08:00 | Sanniquellie Mahn | DOC-2735 | non-public | ADA-2146 | 101 |
| 3 | REP-2474 | 2025-12-23T03:25:00 | Greater Houston Community Foundation | DOC-2738 | sensitive | ADA-2152 | 102 |
| 4 | REP-2479 | 2022-05-07T10:42:00 | Lucas Industries | DOC-2741 | public | ADA-2158 | 103 |

An inspection report such as REP-2464, issued by Technos Japan on February 1, 2023, under docket DOC-2732, represents a single point in the regulatory timeline. The classification field—public, non-public, or sensitive—determines who may access the document, while the Adams accession number provides a persistent identifier for archival retrieval. Each report is tied to exactly one licensee, identified by the licensee_id foreign key, establishing the facility as the subject of the inspection. The issuing agency, whether a government body or an authorized third-party organization, assumes responsibility for the findings documented within.

## Identifying Regulatory Violations

When an inspection uncovers a deficiency, the inspector documents it as a regulatory violation. The violation record captures the nature of the nonconformance, the regulatory standard that was breached, and the severity with which the regulator classifies the finding.

**Table `regulatory_violations`**

| regulatory_violation_id | violation_id | description | regulatory_reference | severity_level | status | inspection_report_id | date_identified | reported_in_inspection_report_id | corrective_action_plan_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3990166 | Extended Survey | adaptive-regulato-89 | A | pending | 2087738 | 2023-06-23T05:03:00 | 1 | 1 |
| 2 | m16 | Pilot Corridor A | distributed-regulato-90 | B | contested | 5f8fcc36-8fcd-11eb-924d-9cd76263cbd0 | 2024-11-07T12:20:00 | 2 | 2 |
| 3 | 7731883 | Baseline Series | baseline-regulato-91 | C | resolved | 784e2c06-8fb2-11eb-924d-9cd76263cbd0 | 2025-04-18T19:37:00 | 3 | 3 |
| 4 | 325461 | Distributed Assessment | pilot-regulato-92 | D | escalated | L478 | 2022-09-02T02:54:00 | 4 | 4 |

The violation table stores each finding with a unique regulatory_violation_id, a human-readable description, and a regulatory_reference that points to the specific rule or standard at issue. Severity levels range from A through D, with A representing the most serious category. The status field tracks the lifecycle of the finding—pending, contested, resolved, or escalated—reflecting the dynamic nature of enforcement proceedings. Each violation is linked to the inspection report that identified it through the inspection_report_id foreign key, and may be associated with a corrective action plan through the corrective_action_plan_id foreign key. The reported_in_inspection_report_id column provides an additional linkage that supports the many-to-many relationship between inspections and violations, allowing a single inspection to surface multiple findings and a single violation type to be documented across multiple inspections.

## The Reporting Bridge

The reports_violations table serves as the junction that connects inspection reports to the regulatory violations they contain. This many-to-many relationship is essential because a single inspection frequently uncovers multiple violations, and the same violation category may appear across different inspections at the same or different facilities.

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

The record linking inspection report 1 to regulatory violations 1 and 2 demonstrates how a single inspection can generate multiple findings. Similarly, inspection report 4 references violations 4 and 1, showing that violations can recur across different inspection events. This bridge table ensures that the relationship between inspections and violations is explicit, auditable, and queryable without introducing data redundancy.

## Corrective Action Plans

Once a violation is identified and acknowledged, the licensee must develop a corrective action plan that outlines the steps to achieve compliance. The corrective_action_plans table captures the full lifecycle of this remediation effort, from initial draft through final approval.

**Table `corrective_action_plans`**

| corrective_action_plan_id | plan_id | submission_date | compliance_deadline | status | corrective_steps_taken | preventive_measures | regulatory_violation_id | licensee_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 505977 | 2025-04-24T03:57:00 | 2023-02-24T01:03:00 | draft | integrated-correcti-46 | adaptive-preventi-53 | 1 | 100 |
| 2 | 727038 | 2022-09-08T10:14:00 | 2024-07-08T08:20:00 | submitted | seasonal-correcti-47 | distributed-preventi-54 | 2 | 101 |
| 3 | 937726 | 2023-02-19T17:31:00 | 2025-12-19T15:37:00 | under_review | regional-correcti-48 | baseline-preventi-55 | 3 | 102 |
| 4 | 1290 | 2024-07-03T00:48:00 | 2022-05-03T22:54:00 | approved | legacy-correcti-49 | pilot-preventi-56 | 4 | 103 |

Each plan carries a unique corrective_action_plan_id and a plan_id for internal tracking. The submission_date marks when the licensee formally presented the plan, while the compliance_deadline establishes the date by which all corrective measures must be completed. The status field—draft, submitted, under_review, or approved—tracks the plan's progression through the regulatory review process. The corrective_steps_taken and preventive_measures columns describe the specific actions the licensee committed to taking, with values such as integrated-correcti-46 and adaptive-preventi-53 providing coded references to the detailed remediation activities. Each plan is linked to the regulatory violation it addresses through the regulatory_violation_id foreign key and to the responsible licensee through the licensee_id foreign key.

## Licensee Records

At the center of the compliance ecosystem is the licensee—the organization or individual authorized to possess and use radiation sources. The licensees table maintains the authoritative record for each licensed entity.

**Table `licensees`**

| id | license_number | licensee_name | license_type | docket_number | address | radiation_safety_officer | regulatory_violation_id |
|---|---|---|---|---|---|---|---|
| 100 | LIC-2589 | Legacy Assessment D | regional-license-78 | DOC-2732 | distributed-address-72 | integrated-radiatio-82 | 1 |
| 101 | LIC-2596 | Regional Survey | legacy-license-79 | DOC-2735 | baseline-address-73 | seasonal-radiatio-83 | 2 |
| 102 | LIC-2603 | Seasonal Corridor | compact-license-80 | DOC-2738 | pilot-address-74 | regional-radiatio-84 | 3 |
| 103 | LIC-2610 | Integrated Series A | composite-license-81 | DOC-2741 | extended-address-75 | legacy-radiatio-85 | 4 |

Each licensee record includes the license_number (such as LIC-2589 for Legacy Assessment D), the licensee_name, and the license_type, which categorizes the scope of authorization—regional, legacy, compact, or composite. The docket_number ties the licensee to the regulatory proceeding under which the license was issued, while the address field provides the physical location of the facility. The radiation_safety_officer column identifies the individual responsible for day-to-day radiation safety management at the site. The regulatory_violation_id foreign key links the licensee to their most recent or primary violation, creating a direct association between the facility and its enforcement history.

## Radiation Surveys and Dose Measurements

Radiation surveys provide the empirical foundation for compliance determinations. These surveys measure dose rates at various locations within a licensed facility and classify the results against established regulatory thresholds.

**Table `radiation_surveys`**

| id | survey_id | survey_date | area_type | measured_dose_rate | unit_of_measure | compliance_status | licensee_id | regulatory_violation_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 21005921 | 2024-07-23T18:30:00 | controlled | 18.20 | composite-unit-69 | compliant | 100 | 1 |
| 101 | 726059 | 2025-12-07T01:47:00 | unrestricted | 22.40 | primary-unit-70 | non-compliant | 101 | 2 |
| 102 | 32814 | 2022-05-18T08:04:00 | controlled | 26.60 | adaptive-unit-71 | pending_review | 102 | 3 |
| 103 | b83e028a-8fcd-11eb-924d-9cd76263cbd0 | 2023-10-02T15:21:00 | unrestricted | 30.80 | distributed-unit-72 | compliant | 103 | 4 |

Each survey record includes a survey_id, the survey_date, and the area_type, which categorizes the surveyed zone as controlled or unrestricted. The measured_dose_rate column records the quantitative reading—such as 18.20 or 30.80—while the unit_of_measure column specifies the measurement convention, with values like composite-unit-69 and primary-unit-70 denoting different calibration standards. The compliance_status field—compliant, non-compliant, or pending_review—reflects the regulator's assessment of whether the measured dose rate falls within acceptable limits. Each survey is linked to the licensee that conducted it through the licensee_id foreign key and to the regulatory violation it may support through the regulatory_violation_id foreign key, enabling traceability from raw measurement to enforcement action.

## The Licensee-Plan Relationship

The licensees_plans table establishes the many-to-many relationship between licensees and corrective action plans. A single licensee may be responsible for multiple plans across different violations, and a plan may involve multiple licensees in complex, multi-party facilities.

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

This junction table ensures that the responsibility for corrective action is explicitly documented and can be queried independently of the violation or inspection records. It supports the operational reality that compliance remediation often involves coordinated effort across organizational boundaries.

## Integrated Compliance Views

The regulatory domain provides a set of composite views that join the base tables to answer specific operational questions. These views synthesize data across the inspection, violation, corrective action, licensee, and survey layers to produce actionable summaries.

The view vw_regulatory_violation_inspection_report combines the violation record with its originating inspection report, answering the question: "Which inspection report identified this violation, and what are the details of both?" This view is essential for auditors who need to trace a violation back to its source documentation.

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

The view vw_regulatory_violation_corrective_action_plan links each violation to its associated corrective action plan, answering: "What plan has been developed to address this violation, and what is its current status?" For example, regulatory violation 1 (Extended Survey, severity A, status pending) is linked to corrective action plan 1 (submission date 2025-04-24, status draft), showing that the remediation effort is still in its earliest phase.

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

The view vw_inspection_report_regulatory_violation_detail provides the reverse perspective, joining inspection reports with their associated violations to answer: "What violations were found during this inspection, and how severe are they?" This view supports inspection follow-up by presenting all findings from a single report in one consolidated record.

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

The view vw_inspection_report_licensee connects inspection reports to their corresponding licensee records, answering: "Which facility was inspected, and what are the details of the licensed entity?" This view is particularly useful for generating inspection summaries that include both the report details and the licensee's organizational information.

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

The view vw_corrective_action_plan_regulatory_violation joins corrective action plans with their associated violations, providing a comprehensive view of the remediation effort. It answers: "What violation is this plan addressing, and what corrective and preventive measures has the licensee committed to implementing?" For instance, plan 2 (seasonal-correcti-47, distributed-preventi-54) addresses violation 2 (Pilot Corridor A, severity B, status contested), revealing that the licensee has proposed remediation steps even as the violation itself remains disputed.

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

The view vw_corrective_action_plan_licensee links corrective action plans to their responsible licensees, answering: "Which licensee is accountable for this plan, and what is the scope of their authorization?" This view supports accountability tracking by presenting the plan details alongside the licensee's license_number, license_type, and radiation_safety_officer information.

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

The view vw_licensee_regulatory_violation joins licensee records with their associated violations, answering: "What violations has this licensee incurred, and what is the severity and status of each finding?" This view is critical for regulators conducting facility risk assessments, as it consolidates the licensee's identity with their enforcement history. Licensee 100 (Legacy Assessment D, license type regional-license-78) is linked to violation 1 (Extended Survey, severity A, status pending), indicating a high-severity finding that remains unresolved.

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

The view vw_licensee_corrective_action_plan_detail provides a comprehensive picture of a licensee's remediation obligations by joining the licensee record with their corrective action plans and the underlying violations. It answers: "What corrective action plans is this licensee responsible for, what violations do they address, and what is the current status of each plan?" This view supports compliance monitoring by presenting the full chain from licensee through plan to violation in a single queryable structure.

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

The view vw_radiation_survey_licensee connects radiation survey measurements to the licensee that conducted them, answering: "Which licensee performed this survey, and what were the measured dose rates in the surveyed areas?" This view is essential for correlating survey results with licensee accountability. Survey 100, conducted on 2024-07-23 in a controlled area with a measured dose rate of 18.20, is linked to licensee 100 (Legacy Assessment D), showing that the facility's radiation safety program produced a compliant reading.

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

The view vw_radiation_survey_regulatory_violation links radiation survey data to the regulatory violations they may support or contradict, answering: "What survey measurements are associated with this violation, and do they indicate compliance or non-compliance?" This view enables regulators to cross-reference quantitative survey data with formal violation findings. Survey 101, with a measured dose rate of 22.40 in an unrestricted area and a non-compliant status, is linked to violation 2 (Pilot Corridor A, severity B, status contested), suggesting that the survey data may underpin the contested finding.

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

## Synthesis

The regulatory compliance ecosystem described here operates as an integrated system of records, each table and view serving a distinct function in the lifecycle of oversight. Inspections generate reports, which surface violations, which trigger corrective action plans, all anchored to licensed facilities whose radiation surveys provide the empirical evidence for compliance determinations. The foreign-key relationships—inspection_report_id on violations, regulatory_violation_id on corrective action plans and surveys, licensee_id on inspections, plans, and surveys—create a navigable graph that supports both granular investigation and aggregate analysis. The junction tables (reports_violations and licensees_plans) handle the many-to-many relationships that arise when a single inspection reveals multiple violations or a licensee manages multiple remediation efforts. The composite views translate this relational structure into operational answers, enabling regulators to trace a violation from its identification through its remediation, to correlate survey measurements with enforcement findings, and to assess the compliance posture of any licensee across all their authorized activities. Together, these records form the documentary backbone of radiation safety oversight, ensuring that every finding is documented, every plan is tracked, and every facility remains accountable to the standards under which it operates.