## Incident Management in Domestic Violence Response Systems

Domestic violence response operates at the intersection of emergency services, legal intervention, and victim support. When an incident is reported, a chain of documentation and intervention begins: law enforcement responds, victims receive safety planning, offenders face accountability measures, and legal advocates coordinate protection orders and prosecution. The records that sustain this ecosystem capture everything from the initial police report through to court-ordered protections, each entity linked to the others through relational structures that preserve the full narrative of what occurred and what actions followed. Understanding how these records interconnect is essential for practitioners who must trace a case from first response through final disposition.

**Table `domestic_violence_incidents`**

| incident_id | report_date | severity_level | location | offender_id | victim_id | police_report_number | lethality_score | police_report_id | involves_victim_victim_id | involves_offender_offender_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1336174 | 2024-03-02T02:54:00 | low | extended-location-99 | 9125616 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | POL-2395 | 16.70 | 100 | 100 | 100 |
| state_uk_4 | 2025-08-13T09:11:00 | medium | integrated-location-100 | 671 | 99669 | POL-2399 | 18.40 | 101 | 101 | 101 |
| 2933483 | 2022-01-24T16:28:00 | high | seasonal-location-101 | 195352 | 1889772 | POL-2403 | 20.10 | 102 | 102 | 102 |
| 2986243 | 2023-06-08T23:45:00 | critical | regional-location-102 | 338522 | 9568439 | POL-2407 | 21.80 | 103 | 103 | 103 |

The domestic violence incidents table serves as the central record of each reported event. Every incident carries a unique identifier, a timestamp for when the report was filed, and a severity classification ranging from low to critical. The lethality score provides a quantitative risk assessment; in the recorded data, scores range from 16.70 for a low-severity incident to 21.80 for a critical one, reflecting the escalating danger associated with higher severity designations. Each incident is tied to a specific location, whether described as an extended-location, integrated-location, seasonal-location, or regional-location, and references the involved parties through the offender and victim identifiers. The police report number and police report ID link the incident to the corresponding law enforcement documentation. For example, incident 1336174, reported on March 2, 2024, at 02:54, was classified as low severity with a lethality score of 16.70 and is associated with police report 100.

**Table `police_reports`**

| id | report_id | officer_id | report_date | incident_id | status | narrative | evidence_collected | records_incident_incident_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | 103165 | 2024-03-02T02:54:00 | 1336174 | pending | legacy-narrativ-31 | false | 1336174 | 2025-01-01 00:14:00 |
| 101 | 8189500 | 2933464 | 2025-08-13T09:11:00 | state_uk_4 | reviewed | compact-narrativ-32 | true | state_uk_4 | 2025-02-06 03:14:00 |
| 102 | L355 | 10445622 | 2022-01-24T16:28:00 | 2933483 | submitted | composite-narrativ-33 | false | 2933483 | 2025-03-11 06:14:00 |
| 103 | 5844272 | 7441150 | 2023-06-08T23:45:00 | 2986243 | archived | primary-narrativ-34 | true | 2986243 | 2025-04-16 09:14:00 |

Law enforcement documentation begins with the police reports table, which captures the officer's response to each incident. Each report is assigned a report ID, such as 1202-0008-S or L355, and is linked to a specific officer identified by their officer ID. The report date typically matches the incident date, confirming that documentation was contemporaneous with the event. The status field tracks the lifecycle of the report through stages including pending, reviewed, submitted, and archived. A narrative field contains the officer's written account, with entries like legacy-narrativ-31 or primary-narrativ-34 providing context for the incident. The evidence_collected flag indicates whether physical or documentary evidence was gathered at the scene; in the recorded data, reports 101 and 103 show evidence was collected, while reports 100 and 102 do not. Each report is cross-referenced back to its originating incident through the records_incident_incident_id column.

**Table `victims`**

| id | victim_id | full_name | date_of_birth | contact_number | safety_plan_status | crisis_call_count | referral_status | legal_advocate_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 2025-04-02 | Peter Mcdowell | active | 4 | pending | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 99669 | Account Name | 2022-09-13 | Sophia Meyer | inactive | 3 | active | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 1889772 | Saipan International Airport | 2023-02-24 | Carol Gaines | under_review | 13 | completed | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 9568439 | Norma Fisher | 2024-07-08 | April Snyder | active | 4 | pending | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Victim records form the foundation of support services within the response system. The victims table stores personal identifiers including the victim's full name, date of birth, and contact information. Safety planning is a critical component of victim services, tracked through the safety_plan_status field which takes values such as active, inactive, or under_review. In the recorded data, Theodore Mcgrath (victim ID e29bafe2-8fd1-11eb-924d-9cd76263cbd0) has an active safety plan, while Account Name (victim ID 99669) has an inactive plan. The crisis_call_count records the number of crisis intervention contacts, ranging from 1 to 13 in the sample data, with Saipan International Airport (victim ID 1889772) showing the highest count at 13 calls. The referral_status field tracks the victim's progress through the referral pipeline, with values including pending, active, and completed. Each victim record is associated with a legal advocate through the legal_advocate_id column, establishing the support relationship that is essential for ongoing case management.

**Table `offenders`**

| id | offender_id | full_name | date_of_birth | criminal_history | accountability_status |
|---|---|---|---|---|---|
| 100 | 9125616 | Theodore Mcgrath | 2025-04-02 | extended-criminal-39 | pending |
| 101 | 671 | Account Name | 2022-09-13 | integrated-criminal-40 | prosecuting |
| 102 | 195352 | Saipan International Airport | 2023-02-24 | seasonal-criminal-41 | convicted |
| 103 | 338522 | Norma Fisher | 2024-07-08 | regional-criminal-42 | acquitted |

The offenders table documents individuals identified as perpetrators of domestic violence. Each offender record includes a full name, date of birth, and a description of their criminal history, which in the recorded data takes values such as extended-criminal-39, integrated-criminal-40, seasonal-criminal-41, and regional-criminal-42. The accountability_status field is particularly important for tracking the legal trajectory of each case, with values including pending, prosecuting, convicted, and acquitted. In the sample data, offender 671 (Account Name) is currently in the prosecuting stage, offender 195352 (Saipan International Airport) has been convicted, and offender 338522 (Norma Fisher) has been acquitted. These statuses provide a real-time view of where each offender stands in the justice process and inform decisions about protection orders and continued monitoring.

**Table `legal_advocates`**

| legal_advocate_id | advocate_id | full_name | education_level | on_call_rotation | supervisor_id | case_load | prosecutor_id | protection_order_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 727047 | Theodore Mcgrath | bachelor | active | account_pymes_255 | 23 | 1 | 1000 |
| 2 | 4277008 | Account Name | master | inactive | 328 | 33 | 2 | 1001 |
| 3 | 10238288 | Saipan International Airport | phd | active | 1996938 | 43 | 3 | 1002 |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | bachelor | inactive | ChIJIbRFlPtt5kcR5kM81XdpSfI | 53 | 4 | 1003 |

Legal advocates serve as the connective tissue between victims, the court system, and prosecution services. The legal_advocates table records each advocate's identifier, full name, and education level, which in the data includes bachelor, master, and phd degrees. The on_call_rotation field indicates whether an advocate is currently active or inactive in the rotation system. Case load management is tracked through the case_load column, with values ranging from 23 to 53 cases per advocate in the recorded data. Each advocate is assigned a supervisor, identified by supervisor_id, and is linked to a specific prosecutor through the prosecutor_id column. The protection_order_id field associates each advocate with a particular protection order, ensuring that the advocate who secured the order remains responsible for its enforcement and monitoring.

**Table `protection_orders`**

| id | order_id | issue_date | expiration_date | order_type | court_case_number | status | victim_id | offender_id | legal_advocate_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-01T13:51:00 | 2025-08-18T19:45:00 | temporary | COU-2209 | pending | 100 | 100 | 1 | 2025-01-01 00:14:00 |
| 1001 | comi | 2024-07-12T20:08:00 | 2022-01-02T02:02:00 | permanent | COU-2216 | active | 101 | 101 | 2 | 2025-02-06 03:14:00 |
| 1002 | state_uk_22 | 2025-12-23T03:25:00 | 2023-06-13T09:19:00 | emergency | COU-2223 | expired | 102 | 102 | 3 | 2025-03-11 06:14:00 |
| 1003 | 99669 | 2022-05-07T10:42:00 | 2024-11-24T16:36:00 | temporary | COU-2230 | revoked | 103 | 103 | 4 | 2025-04-16 09:14:00 |

Protection orders are court-issued directives that establish legal boundaries between victims and offenders. The protection_orders table captures the order's type, which can be temporary, permanent, or emergency, along with its issue date and expiration date. The status field tracks the current state of each order, with values including pending, active, expired, and revoked. In the recorded data, order 1030 (associated with victim 100 and offender 100) is a temporary order with pending status, while order comi (associated with victim 101 and offender 101) is a permanent order that is currently active. The court_case_number field links each order to its originating court proceeding, such as COU-2209 or COU-2216. Each order references the victim and offender it protects, as well as the legal advocate responsible for its administration, creating a complete chain of accountability from court order to enforcement.

**Table `prosecutors`**

| id | prosecutor_id | full_name | case_load | court_assignment | legal_advocate_id |
|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m11 | Theodore Mcgrath | 23 | primary-court-88 | 1 |
| 2 | 8387530 | Account Name | 33 | adaptive-court-89 | 2 |
| 3 | 3744022 | Saipan International Airport | 43 | distributed-court-90 | 3 |
| 4 | 8928501 | Norma Fisher | 53 | baseline-court-91 | 4 |

Prosecutors oversee the legal proceedings that follow domestic violence incidents. The prosecutors table records each prosecutor's identifier, full name, and the cases they are handling. In the recorded data, prosecutors are linked to specific incidents through the prosecutors_incidents junction table, ensuring that the appropriate legal authority is assigned based on jurisdiction and case complexity. Each prosecutor works in coordination with legal advocates and is responsible for advancing cases through the judicial system, from initial filing through trial or plea resolution.

The relational structure of the system becomes apparent when examining the junction tables that connect core entities. The victims_incidents table establishes which victims are associated with which incidents, while the offenders_incidents table performs the same function for offenders. The advocates_victims table formalizes the relationship between legal advocates and the victims they support, and the prosecutors_incidents table links prosecutors to the specific incidents they are handling. These junction tables enable many-to-many relationships, allowing a single victim or offender to appear in multiple incidents and a single advocate or prosecutor to handle multiple cases.

**Table `victims_incidents`**

| victim_id | incident_id |
|---|---|
| 100 | 1336174 |
| 100 | state_uk_4 |
| 101 | state_uk_4 |
| 101 | 2933483 |
| 102 | 2933483 |
| 102 | 2986243 |
| 103 | 2986243 |
| 103 | 1336174 |

**Table `offenders_incidents`**

| offender_id | incident_id |
|---|---|
| 100 | 1336174 |
| 100 | state_uk_4 |
| 101 | state_uk_4 |
| 101 | 2933483 |
| 102 | 2933483 |
| 102 | 2986243 |
| 103 | 2986243 |
| 103 | 1336174 |

**Table `advocates_victims`**

| legal_advocate_id | victim_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `prosecutors_incidents`**

| prosecutor_id | incident_id |
|---|---|
| 1 | 1336174 |
| 1 | state_uk_4 |
| 2 | state_uk_4 |
| 2 | 2933483 |
| 3 | 2933483 |
| 3 | 2986243 |
| 4 | 2986243 |
| 4 | 1336174 |

The analytical views in the system synthesize these relational records into actionable information for practitioners. Each view answers a specific operational question by joining related tables and presenting the combined data in a single, queryable result set.

**View `domestic_violence_incident_police_report_view`**

```sql
CREATE VIEW domestic_violence_incident_police_report_view AS
SELECT a.incident_id, a.report_date, a.severity_level, a.location, b.id AS report_id, b.report_id AS report_report_id, b.officer_id AS report_officer_id
FROM domestic_violence_incidents a JOIN police_reports b ON a.police_report_id = b.id;
```

| incident_id | report_date | severity_level | location | report_id | report_report_id | report_officer_id |
|---|---|---|---|---|---|---|
| 1336174 | 2024-03-02T02:54:00 | low | extended-location-99 | 100 | 1202-0008-S | 103165 |
| state_uk_4 | 2025-08-13T09:11:00 | medium | integrated-location-100 | 101 | 8189500 | 2933464 |
| 2933483 | 2022-01-24T16:28:00 | high | seasonal-location-101 | 102 | L355 | 10445622 |
| 2986243 | 2023-06-08T23:45:00 | critical | regional-location-102 | 103 | 5844272 | 7441150 |

The domestic_violence_incident_police_report_view joins incident records with their corresponding police reports, answering the question of how each incident was documented by law enforcement. This view allows practitioners to see the full picture of an incident alongside the officer's narrative, evidence collection status, and report lifecycle stage. For incident 1336174, the view reveals that police report 1202-0008-S was filed by officer 103165, is currently in pending status, and has no evidence collected.

**View `domestic_violence_incident_victim_view`**

```sql
CREATE VIEW domestic_violence_incident_victim_view AS
SELECT a.incident_id, a.report_date, a.severity_level, a.location, b.id AS victim_id, b.victim_id AS victim_victim_id, b.full_name AS victim_full_name
FROM domestic_violence_incidents a JOIN victims b ON a.involves_victim_victim_id = b.id;
```

| incident_id | report_date | severity_level | location | victim_id | victim_victim_id | victim_full_name |
|---|---|---|---|---|---|---|
| 1336174 | 2024-03-02T02:54:00 | low | extended-location-99 | 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| state_uk_4 | 2025-08-13T09:11:00 | medium | integrated-location-100 | 101 | 99669 | Account Name |
| 2933483 | 2022-01-24T16:28:00 | high | seasonal-location-101 | 102 | 1889772 | Saipan International Airport |
| 2986243 | 2023-06-08T23:45:00 | critical | regional-location-102 | 103 | 9568439 | Norma Fisher |

The domestic_violence_incident_victim_view connects incidents with victim records, providing a comprehensive view of who was affected and what support services are in place. This view is essential for case managers who need to assess both the incident details and the victim's current safety planning status simultaneously. For incident 1336174, the view shows that victim Theodore Mcgrath has an active safety plan, has made 4 crisis calls, and is currently in pending referral status.

**View `domestic_violence_incident_offender_view`**

```sql
CREATE VIEW domestic_violence_incident_offender_view AS
SELECT a.incident_id, a.report_date, a.severity_level, a.location, b.id AS offender_id, b.offender_id AS offender_offender_id, b.full_name AS offender_full_name
FROM domestic_violence_incidents a JOIN offenders b ON a.involves_offender_offender_id = b.id;
```

| incident_id | report_date | severity_level | location | offender_id | offender_offender_id | offender_full_name |
|---|---|---|---|---|---|---|
| 1336174 | 2024-03-02T02:54:00 | low | extended-location-99 | 100 | 9125616 | Theodore Mcgrath |
| state_uk_4 | 2025-08-13T09:11:00 | medium | integrated-location-100 | 101 | 671 | Account Name |
| 2933483 | 2022-01-24T16:28:00 | high | seasonal-location-101 | 102 | 195352 | Saipan International Airport |
| 2986243 | 2023-06-08T23:45:00 | critical | regional-location-102 | 103 | 338522 | Norma Fisher |

The domestic_violence_incident_offender_view links incidents with offender records, enabling practitioners to track the accountability status of individuals involved in each case. This view supports decisions about risk management and the need for additional protective measures. For incident 1336174, the view indicates that offender Theodore Mcgrath has a criminal history classified as extended-criminal-39 and is currently in pending accountability status.

**View `police_report_domestic_violence_incident_view`**

```sql
CREATE VIEW police_report_domestic_violence_incident_view AS
SELECT a.id, a.report_id, a.officer_id, a.report_date, b.incident_id AS incident_incident_id, b.report_date AS incident_report_date, b.severity_level AS incident_severity_level
FROM police_reports a JOIN domestic_violence_incidents b ON a.records_incident_incident_id = b.incident_id;
```

| id | report_id | officer_id | report_date | incident_incident_id | incident_report_date | incident_severity_level |
|---|---|---|---|---|---|---|
| 100 | 1202-0008-S | 103165 | 2024-03-02T02:54:00 | 1336174 | 2024-03-02T02:54:00 | low |
| 101 | 8189500 | 2933464 | 2025-08-13T09:11:00 | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 102 | L355 | 10445622 | 2022-01-24T16:28:00 | 2933483 | 2022-01-24T16:28:00 | high |
| 103 | 5844272 | 7441150 | 2023-06-08T23:45:00 | 2986243 | 2023-06-08T23:45:00 | critical |

The police_report_domestic_violence_incident_view presents the same relationship from the law enforcement perspective, starting with the police report and extending to the incident details. This view is particularly useful for officers and supervisors reviewing their case load and ensuring that all required documentation is complete. Report 101, for instance, shows that officer 2933464 responded to incident state_uk_4, collected evidence, and has submitted a review of the case.

**View `victim_domestic_violence_incident_detail_view`**

```sql
CREATE VIEW victim_domestic_violence_incident_detail_view AS
SELECT a.id, a.victim_id, a.full_name, b.incident_id AS incident_incident_id, b.report_date AS incident_report_date, b.severity_level AS incident_severity_level
FROM victims a
  JOIN victims_incidents j ON j.victim_id = a.id
  JOIN domestic_violence_incidents b ON b.incident_id = j.incident_id;
```

| id | victim_id | full_name | incident_incident_id | incident_report_date | incident_severity_level |
|---|---|---|---|---|---|
| 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 1336174 | 2024-03-02T02:54:00 | low |
| 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 101 | 99669 | Account Name | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 101 | 99669 | Account Name | 2933483 | 2022-01-24T16:28:00 | high |
| 102 | 1889772 | Saipan International Airport | 2933483 | 2022-01-24T16:28:00 | high |
| 102 | 1889772 | Saipan International Airport | 2986243 | 2023-06-08T23:45:00 | critical |
| 103 | 9568439 | Norma Fisher | 2986243 | 2023-06-08T23:45:00 | critical |
| 103 | 9568439 | Norma Fisher | 1336174 | 2024-03-02T02:54:00 | low |

The victim_domestic_violence_incident_detail_view provides an expanded view of the victim-incident relationship, incorporating additional contextual data that supports victim-centered case management. This view enables advocates and support workers to understand the full scope of harm and the corresponding support needs.

**View `victim_legal_advocate_view`**

```sql
CREATE VIEW victim_legal_advocate_view AS
SELECT a.id, a.victim_id, a.full_name, a.date_of_birth, b.legal_advocate_id AS advocate_legal_advocate_id, b.advocate_id AS advocate_advocate_id, b.full_name AS advocate_full_name
FROM victims a JOIN legal_advocates b ON a.legal_advocate_id = b.legal_advocate_id;
```

| id | victim_id | full_name | date_of_birth | advocate_legal_advocate_id | advocate_advocate_id | advocate_full_name |
|---|---|---|---|---|---|---|
| 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | 2025-04-02 | 1 | 727047 | Theodore Mcgrath |
| 101 | 99669 | Account Name | 2022-09-13 | 2 | 4277008 | Account Name |
| 102 | 1889772 | Saipan International Airport | 2023-02-24 | 3 | 10238288 | Saipan International Airport |
| 103 | 9568439 | Norma Fisher | 2024-07-08 | 4 | template_ivacode_pagata_20det10 | Norma Fisher |

The victim_legal_advocate_view connects victim records with their assigned legal advocates, answering the operational question of which advocate is responsible for supporting each victim. This view is critical for workload balancing and ensuring that victims have consistent advocacy support throughout their case.

**View `offender_domestic_violence_incident_detail_view`**

```sql
CREATE VIEW offender_domestic_violence_incident_detail_view AS
SELECT a.id, a.offender_id, a.full_name, b.incident_id AS incident_incident_id, b.report_date AS incident_report_date, b.severity_level AS incident_severity_level
FROM offenders a
  JOIN offenders_incidents j ON j.offender_id = a.id
  JOIN domestic_violence_incidents b ON b.incident_id = j.incident_id;
```

| id | offender_id | full_name | incident_incident_id | incident_report_date | incident_severity_level |
|---|---|---|---|---|---|
| 100 | 9125616 | Theodore Mcgrath | 1336174 | 2024-03-02T02:54:00 | low |
| 100 | 9125616 | Theodore Mcgrath | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 101 | 671 | Account Name | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 101 | 671 | Account Name | 2933483 | 2022-01-24T16:28:00 | high |
| 102 | 195352 | Saipan International Airport | 2933483 | 2022-01-24T16:28:00 | high |
| 102 | 195352 | Saipan International Airport | 2986243 | 2023-06-08T23:45:00 | critical |
| 103 | 338522 | Norma Fisher | 2986243 | 2023-06-08T23:45:00 | critical |
| 103 | 338522 | Norma Fisher | 1336174 | 2024-03-02T02:54:00 | low |

The offender_domestic_violence_incident_detail_view offers an expanded perspective on the offender-incident relationship, incorporating additional data that supports accountability tracking and risk assessment.

**View `legal_advocate_victim_detail_view`**

```sql
CREATE VIEW legal_advocate_victim_detail_view AS
SELECT a.legal_advocate_id, a.advocate_id, a.full_name, b.id AS victim_id, b.victim_id AS victim_victim_id, b.full_name AS victim_full_name
FROM legal_advocates a
  JOIN advocates_victims j ON j.legal_advocate_id = a.legal_advocate_id
  JOIN victims b ON b.id = j.victim_id;
```

| legal_advocate_id | advocate_id | full_name | victim_id | victim_victim_id | victim_full_name |
|---|---|---|---|---|---|
| 1 | 727047 | Theodore Mcgrath | 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 1 | 727047 | Theodore Mcgrath | 101 | 99669 | Account Name |
| 2 | 4277008 | Account Name | 101 | 99669 | Account Name |
| 2 | 4277008 | Account Name | 102 | 1889772 | Saipan International Airport |
| 3 | 10238288 | Saipan International Airport | 102 | 1889772 | Saipan International Airport |
| 3 | 10238288 | Saipan International Airport | 103 | 9568439 | Norma Fisher |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | 103 | 9568439 | Norma Fisher |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |

The legal_advocate_victim_detail_view provides a comprehensive view of the advocate-victim relationship, including details about the victim's safety planning, crisis engagement, and referral status. This view supports advocates in prioritizing their case load and identifying victims who need immediate attention.

**View `legal_advocate_prosecutor_view`**

```sql
CREATE VIEW legal_advocate_prosecutor_view AS
SELECT a.legal_advocate_id, a.advocate_id, a.full_name, a.education_level, b.id AS prosecutor_id, b.prosecutor_id AS prosecutor_prosecutor_id, b.full_name AS prosecutor_full_name
FROM legal_advocates a JOIN prosecutors b ON a.prosecutor_id = b.id;
```

| legal_advocate_id | advocate_id | full_name | education_level | prosecutor_id | prosecutor_prosecutor_id | prosecutor_full_name |
|---|---|---|---|---|---|---|
| 1 | 727047 | Theodore Mcgrath | bachelor | 1 | lu_tax_code_template_m11 | Theodore Mcgrath |
| 2 | 4277008 | Account Name | master | 2 | 8387530 | Account Name |
| 3 | 10238288 | Saipan International Airport | phd | 3 | 3744022 | Saipan International Airport |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | bachelor | 4 | 8928501 | Norma Fisher |

The legal_advocate_prosecutor_view links legal advocates with their assigned prosecutors, ensuring that the support and prosecution teams are coordinated. This view is essential for maintaining communication between the victim support and legal prosecution functions.

**View `legal_advocate_protection_order_view`**

```sql
CREATE VIEW legal_advocate_protection_order_view AS
SELECT a.legal_advocate_id, a.advocate_id, a.full_name, a.education_level, b.id AS order_id, b.order_id AS order_order_id, b.issue_date AS order_issue_date
FROM legal_advocates a JOIN protection_orders b ON a.protection_order_id = b.id;
```

| legal_advocate_id | advocate_id | full_name | education_level | order_id | order_order_id | order_issue_date |
|---|---|---|---|---|---|---|
| 1 | 727047 | Theodore Mcgrath | bachelor | 1000 | 1030 | 2023-02-01T13:51:00 |
| 2 | 4277008 | Account Name | master | 1001 | comi | 2024-07-12T20:08:00 |
| 3 | 10238288 | Saipan International Airport | phd | 1002 | state_uk_22 | 2025-12-23T03:25:00 |
| 4 | template_ivacode_pagata_20det10 | Norma Fisher | bachelor | 1003 | 99669 | 2022-05-07T10:42:00 |

The legal_advocate_protection_order_view connects legal advocates with the protection orders they administer, providing a clear view of each advocate's order management responsibilities. This view supports oversight of order compliance and renewal tracking.

**View `protection_order_victim_view`**

```sql
CREATE VIEW protection_order_victim_view AS
SELECT a.id, a.order_id, a.issue_date, a.expiration_date, b.id AS victim_id, b.victim_id AS victim_victim_id, b.full_name AS victim_full_name
FROM protection_orders a JOIN victims b ON a.victim_id = b.id;
```

| id | order_id | issue_date | expiration_date | victim_id | victim_victim_id | victim_full_name |
|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-01T13:51:00 | 2025-08-18T19:45:00 | 100 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 1001 | comi | 2024-07-12T20:08:00 | 2022-01-02T02:02:00 | 101 | 99669 | Account Name |
| 1002 | state_uk_22 | 2025-12-23T03:25:00 | 2023-06-13T09:19:00 | 102 | 1889772 | Saipan International Airport |
| 1003 | 99669 | 2022-05-07T10:42:00 | 2024-11-24T16:36:00 | 103 | 9568439 | Norma Fisher |

The protection_order_victim_view links protection orders with the victims they protect, enabling practitioners to verify that every victim with an active order has appropriate support and monitoring in place.

**View `protection_order_offender_view`**

```sql
CREATE VIEW protection_order_offender_view AS
SELECT a.id, a.order_id, a.issue_date, a.expiration_date, b.id AS offender_id, b.offender_id AS offender_offender_id, b.full_name AS offender_full_name
FROM protection_orders a JOIN offenders b ON a.offender_id = b.id;
```

| id | order_id | issue_date | expiration_date | offender_id | offender_offender_id | offender_full_name |
|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-01T13:51:00 | 2025-08-18T19:45:00 | 100 | 9125616 | Theodore Mcgrath |
| 1001 | comi | 2024-07-12T20:08:00 | 2022-01-02T02:02:00 | 101 | 671 | Account Name |
| 1002 | state_uk_22 | 2025-12-23T03:25:00 | 2023-06-13T09:19:00 | 102 | 195352 | Saipan International Airport |
| 1003 | 99669 | 2022-05-07T10:42:00 | 2024-11-24T16:36:00 | 103 | 338522 | Norma Fisher |

The protection_order_offender_view connects protection orders with the offenders they restrict, supporting enforcement monitoring and ensuring that order violations are properly documented and reported.

**View `protection_order_legal_advocate_view`**

```sql
CREATE VIEW protection_order_legal_advocate_view AS
SELECT a.id, a.order_id, a.issue_date, a.expiration_date, b.legal_advocate_id AS advocate_legal_advocate_id, b.advocate_id AS advocate_advocate_id, b.full_name AS advocate_full_name
FROM protection_orders a JOIN legal_advocates b ON a.legal_advocate_id = b.legal_advocate_id;
```

| id | order_id | issue_date | expiration_date | advocate_legal_advocate_id | advocate_advocate_id | advocate_full_name |
|---|---|---|---|---|---|---|
| 1000 | 1030 | 2023-02-01T13:51:00 | 2025-08-18T19:45:00 | 1 | 727047 | Theodore Mcgrath |
| 1001 | comi | 2024-07-12T20:08:00 | 2022-01-02T02:02:00 | 2 | 4277008 | Account Name |
| 1002 | state_uk_22 | 2025-12-23T03:25:00 | 2023-06-13T09:19:00 | 3 | 10238288 | Saipan International Airport |
| 1003 | 99669 | 2022-05-07T10:42:00 | 2024-11-24T16:36:00 | 4 | template_ivacode_pagata_20det10 | Norma Fisher |

The protection_order_legal_advocate_view presents the protection order from the advocate's perspective, showing which advocate is responsible for each order and its current status.

**View `prosecutor_domestic_violence_incident_detail_view`**

```sql
CREATE VIEW prosecutor_domestic_violence_incident_detail_view AS
SELECT a.id, a.prosecutor_id, a.full_name, b.incident_id AS incident_incident_id, b.report_date AS incident_report_date, b.severity_level AS incident_severity_level
FROM prosecutors a
  JOIN prosecutors_incidents j ON j.prosecutor_id = a.id
  JOIN domestic_violence_incidents b ON b.incident_id = j.incident_id;
```

| id | prosecutor_id | full_name | incident_incident_id | incident_report_date | incident_severity_level |
|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m11 | Theodore Mcgrath | 1336174 | 2024-03-02T02:54:00 | low |
| 1 | lu_tax_code_template_m11 | Theodore Mcgrath | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 2 | 8387530 | Account Name | state_uk_4 | 2025-08-13T09:11:00 | medium |
| 2 | 8387530 | Account Name | 2933483 | 2022-01-24T16:28:00 | high |
| 3 | 3744022 | Saipan International Airport | 2933483 | 2022-01-24T16:28:00 | high |
| 3 | 3744022 | Saipan International Airport | 2986243 | 2023-06-08T23:45:00 | critical |
| 4 | 8928501 | Norma Fisher | 2986243 | 2023-06-08T23:45:00 | critical |
| 4 | 8928501 | Norma Fisher | 1336174 | 2024-03-02T02:54:00 | low |

The prosecutor_domestic_violence_incident_detail_view provides prosecutors with a comprehensive view of the incidents they are handling, including all relevant incident details and supporting documentation.

**View `prosecutor_legal_advocate_view`**

```sql
CREATE VIEW prosecutor_legal_advocate_view AS
SELECT a.id, a.prosecutor_id, a.full_name, a.case_load, b.legal_advocate_id AS advocate_legal_advocate_id, b.advocate_id AS advocate_advocate_id, b.full_name AS advocate_full_name
FROM prosecutors a JOIN legal_advocates b ON a.legal_advocate_id = b.legal_advocate_id;
```

| id | prosecutor_id | full_name | case_load | advocate_legal_advocate_id | advocate_advocate_id | advocate_full_name |
|---|---|---|---|---|---|---|
| 1 | lu_tax_code_template_m11 | Theodore Mcgrath | 23 | 1 | 727047 | Theodore Mcgrath |
| 2 | 8387530 | Account Name | 33 | 2 | 4277008 | Account Name |
| 3 | 3744022 | Saipan International Airport | 43 | 3 | 10238288 | Saipan International Airport |
| 4 | 8928501 | Norma Fisher | 53 | 4 | template_ivacode_pagata_20det10 | Norma Fisher |

The prosecutor_legal_advocate_view links prosecutors with their assigned legal advocates, ensuring coordinated case management between prosecution and victim support functions.

## Synthesis

The domestic violence response ecosystem relies on the precise interconnection of incident records, law enforcement documentation, victim support data, offender accountability tracking, legal advocacy coordination, and court-ordered protections. Each table captures a distinct dimension of the response process, while the junction tables and analytical views weave these dimensions into a coherent operational picture. Practitioners who understand how these records relate — how an incident with a lethality score of 21.80 connects to a permanent protection order, an active legal advocate, and a convicted offender — are better equipped to manage cases effectively, allocate resources appropriately, and ensure that every victim receives the support and protection they require.