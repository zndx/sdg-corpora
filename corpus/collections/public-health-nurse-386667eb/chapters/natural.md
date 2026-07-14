## The Architecture of School-Based Public Health Surveillance

Public health nursing within school systems operates at the intersection of clinical practice, administrative oversight, and infectious disease management. A school district's capacity to monitor and respond to health threats depends on the coordinated work of assigned nurses, the governance of school boards, and the systematic tracking of infection prevention and control (IPAC) measures across individual campuses. The records that sustain this work capture who is responsible for which school, which board governs that school, what outbreaks have occurred, and whether preventive protocols are being followed. Understanding these records—and the relationships that bind them together—enables administrators to answer practical questions: Which nurse oversees a given campus? Which board is accountable for an outbreak? Are IPAC measures compliant at the schools where they are due?

**Table `public_health_nurses`**

| id | nurse_id | full_name | license_number | contact_phone | email | status | school_id | board_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 6969414 | Theodore Mcgrath | LIC-2589 | Joe Tsai | seasonal-email-11 | active | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name | LIC-2596 | Stephanie Collins | regional-email-12 | inactive | 2 | 168553 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 1250196 | Saipan International Airport | LIC-2603 | Tasha Rodriguez | legacy-email-13 | on_leave | 3 | 5006454 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 9125616 | Norma Fisher | LIC-2610 | Walter Pratt | compact-email-14 | active | 4 | 1437585 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The public health nurses table anchors the human element of school-based health services. Each record identifies a nurse by a unique internal identifier and a license number, such as LIC-2589 for Theodore Mcgrath or LIC-2610 for Norma Fisher. Contact information—including phone numbers and email addresses like seasonal-email-11 and regional-email-12—ensures that administrators can reach the assigned nurse. The status field tracks availability, with values ranging from active to inactive to on_leave. Saipan International Airport, recorded under license LIC-2603, holds on_leave status, while Account Name under LIC-2596 is marked inactive. Each nurse record carries a school_id and a board_id, establishing the primary assignment for that individual. Timestamps for created_at and updated_at provide an audit trail of when assignments were recorded and last modified.

**Table `schools`**

| id | school_id | school_name | address | board_id | risk_level | ipac_compliant | last_assessment_date | public_health_nurse_id | part_of_board_id | outbreak_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | distributed-address-72 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | low | false | 2025-12-11 | 1 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | bhavenger |
| 2 | 1186099 | Integrated Framework | baseline-address-73 | 168553 | medium | true | 2022-05-22 | 2 | 168553 | 1186096 |
| 3 | 7441154 | Extended Protocol D | pilot-address-74 | 5006454 | high | false | 2023-10-06 | 3 | 5006454 | 9085242 |
| 4 | 338514 | Pilot Programme | extended-address-75 | 1437585 | low | true | 2024-03-17 | 4 | 1437585 | gd_taxc_1211 |

Schools form the operational units where public health interventions take place. The schools table records each campus by its school_id and school_name—Seasonal Standard, Integrated Framework, Extended Protocol D, and Pilot Programme are four examples. An address field locates each campus, while the board_id column links the school to its governing board. The risk_level column classifies each school as low, medium, or high, a designation that directly influences the intensity of surveillance and response. The ipac_compliant flag indicates whether the school meets infection prevention and control standards, and last_assessment_date records when that compliance was last evaluated. Each school also carries a public_health_nurse_id, tying the campus to its assigned nurse, and an outbreak_id field that references any active or historical outbreak at that location.

**Table `school_boards`**

| board_id | board_name | jurisdiction | contact_email | contact_phone | program_manager_name | program_manager_phone | public_health_nurse_id |
|---|---|---|---|---|---|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 | Christopher Wilson | Joe Tsai | Integrated Protocol A | distributed-program-18 | 1 |
| 168553 | Legacy Assessment | legacy-jurisdic-31 | Charles Larsen | Stephanie Collins | Extended Programme | baseline-program-19 | 2 |
| 5006454 | Regional Survey A | compact-jurisdic-32 | Mary Alvarez | Tasha Rodriguez | Pilot Standard | pilot-program-20 | 3 |
| 1437585 | Seasonal Corridor | composite-jurisdic-33 | April Snyder | Walter Pratt | Baseline Framework D | extended-program-21 | 4 |

School boards provide the administrative and jurisdictional framework within which schools operate. The school_boards table lists each board by its board_id and board_name—Compact Series, Legacy Assessment, Regional Survey A, and Seasonal Corridor are four examples. The jurisdiction field describes the geographic or functional scope of each board's authority. Contact information for the board includes a primary contact name, email, and phone number, alongside the program manager's name and phone. The program_manager_name field identifies the individual responsible for overseeing health programs, such as Integrated Protocol A or Extended Programme. Each board record also carries a public_health_nurse_id, indicating the nurse assigned to that board's portfolio.

**Table `outbreaks`**

| outbreak_id | start_date | end_date | case_count | status | location | school_id | public_health_nurse_id | created_at |
|---|---|---|---|---|---|---|---|---|
| bhavenger | 2022-09-05 | 2022-09-01 | 88 | active | extended-location-99 | 1 | 1 | 2025-01-01 00:14:00 |
| 1186096 | 2023-02-16 | 2023-02-12 | 12 | contained | integrated-location-100 | 2 | 2 | 2025-02-06 03:14:00 |
| 9085242 | 2024-07-27 | 2024-07-23 | 10 | resolved | seasonal-location-101 | 3 | 3 | 2025-03-11 06:14:00 |
| gd_taxc_1211 | 2025-12-11 | 2025-12-07 | 4 | active | regional-location-102 | 4 | 4 | 2025-04-16 09:14:00 |

Outbreaks represent the acute events that trigger coordinated public health responses. The outbreaks table records each incident by its outbreak_id, start_date, and end_date, along with the total case_count. Status values—active, contained, and resolved—indicate the current phase of the outbreak lifecycle. Bhavenger, with 88 cases and active status, represents a significant ongoing event, while gd_taxc_1211, with only 4 cases, remains active despite its smaller scale. The location field describes where the outbreak occurred, and the school_id and public_health_nurse_id fields tie the outbreak to the affected campus and the responding nurse. The created_at timestamp records when the outbreak was logged into the system.

**Table `i_p_a_c_measures`**

| id | measure_id | measure_name | description | implementation_date | compliance_status | last_reviewed_date | school_id | public_health_nurse_id |
|---|---|---|---|---|---|---|---|---|
| 1 | invoice | Baseline Framework D | Extended Survey | 2024-11-14 | compliant | 2024-11-22 | 1 | 1 |
| 2 | 4180944 | Distributed Protocol | Pilot Corridor A | 2025-04-25 | non_compliant | 2025-04-06 | 2 | 2 |
| 3 | 6969441 | Adaptive Programme | Baseline Series | 2022-09-09 | pending_review | 2022-09-17 | 3 | 3 |
| 4 | 21280358 | Primary Standard A | Distributed Assessment | 2023-02-20 | compliant | 2023-02-01 | 4 | 4 |

Infection prevention and control measures are the procedural backbone of school-based health safety. The i_p_a_c_measures table documents each measure by its measure_id and measure_name—Baseline Framework D, Distributed Protocol, Adaptive Programme, and Primary Standard A are four examples. A description field provides additional context, such as Extended Survey or Pilot Corridor A. The implementation_date marks when the measure was put into effect, while compliance_status tracks whether the measure is compliant, non_compliant, or pending_review. The last_reviewed_date indicates when the measure was last evaluated. Each measure record is linked to a specific school and a specific public health nurse, ensuring accountability at both the campus and individual levels.

**Table `boards_schools`**

| board_id | school_id |
|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | 1 |
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | 2 |
| 168553 | 2 |
| 168553 | 3 |
| 5006454 | 3 |
| 5006454 | 4 |
| 1437585 | 4 |
| 1437585 | 1 |

The boards_schools table serves as the bridge between governance and operations, mapping which schools fall under which board. This many-to-many relationship allows a single board to oversee multiple schools and, in principle, a school to be associated with multiple boards. The data shows that ChIJH2V4UYBt5kcR5doeFwuU7Ns (Compact Series) oversees schools 1 and 2, while 168553 (Legacy Assessment) oversees schools 2 and 3. Similarly, 5006454 (Regional Survey A) covers schools 3 and 4, and 1437585 (Seasonal Corridor) covers schools 4 and 1. This overlapping structure means that some schools, such as school 2, appear under multiple board assignments, reflecting the complex administrative realities of school district governance.

### Joined Perspectives on School Health Operations

The base tables alone provide a snapshot of individual records, but the true operational picture emerges when these tables are joined. Each view answers a specific question about the relationships between nurses, schools, boards, outbreaks, and IPAC measures.

**View `vw_public_health_nurse_school`**

```sql
CREATE VIEW vw_public_health_nurse_school AS
SELECT a.id, a.nurse_id, a.full_name, a.license_number, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM public_health_nurses a JOIN schools b ON a.school_id = b.id;
```

| id | nurse_id | full_name | license_number | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 1 | 6969414 | Theodore Mcgrath | LIC-2589 | 1 | 1152671 | Seasonal Standard |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name | LIC-2596 | 2 | 1186099 | Integrated Framework |
| 3 | 1250196 | Saipan International Airport | LIC-2603 | 3 | 7441154 | Extended Protocol D |
| 4 | 9125616 | Norma Fisher | LIC-2610 | 4 | 338514 | Pilot Programme |

This view pairs each public health nurse with their assigned school, answering the question of which campus each nurse is responsible for. The result shows Theodore Mcgrath (nurse_id 6969414) assigned to school 1152671 (Seasonal Standard), and Account Name (nurse_id 2b2bb518-8fcd-11eb-924d-9cd76263cbd0) assigned to school 1186099 (Integrated Framework). The join preserves the nurse's license number, contact details, and status alongside the school's name, risk level, and IPAC compliance flag. This pairing is the fundamental unit of assignment in the system.

**View `vw_public_health_nurse_school_board`**

```sql
CREATE VIEW vw_public_health_nurse_school_board AS
SELECT a.id, a.nurse_id, a.full_name, a.license_number, b.board_id AS board_board_id, b.board_name AS board_board_name, b.jurisdiction AS board_jurisdiction
FROM public_health_nurses a JOIN school_boards b ON a.board_id = b.board_id;
```

| id | nurse_id | full_name | license_number | board_board_id | board_board_name | board_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 6969414 | Theodore Mcgrath | LIC-2589 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 |
| 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name | LIC-2596 | 168553 | Legacy Assessment | legacy-jurisdic-31 |
| 3 | 1250196 | Saipan International Airport | LIC-2603 | 5006454 | Regional Survey A | compact-jurisdic-32 |
| 4 | 9125616 | Norma Fisher | LIC-2610 | 1437585 | Seasonal Corridor | composite-jurisdic-33 |

Extending the nurse-school pairing, this view adds the school board to each record, answering which board governs the school that a nurse is assigned to. The result shows Theodore Mcgrath at Seasonal Standard under the Compact Series board (ChIJH2V4UYBt5kcR5doeFwuU7Ns), and Account Name at Integrated Framework under the Legacy Assessment board (168553). The board's jurisdiction, contact email, and program manager name appear alongside the nurse and school data, providing a complete chain of accountability from individual nurse through campus to governing board.

**View `vw_school_public_health_nurse`**

```sql
CREATE VIEW vw_school_public_health_nurse AS
SELECT a.id, a.school_id, a.school_name, a.address, b.id AS nurse_id, b.nurse_id AS nurse_nurse_id, b.full_name AS nurse_full_name
FROM schools a JOIN public_health_nurses b ON a.public_health_nurse_id = b.id;
```

| id | school_id | school_name | address | nurse_id | nurse_nurse_id | nurse_full_name |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | distributed-address-72 | 1 | 6969414 | Theodore Mcgrath |
| 2 | 1186099 | Integrated Framework | baseline-address-73 | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name |
| 3 | 7441154 | Extended Protocol D | pilot-address-74 | 3 | 1250196 | Saipan International Airport |
| 4 | 338514 | Pilot Programme | extended-address-75 | 4 | 9125616 | Norma Fisher |

This view reverses the perspective, starting from the school and showing its assigned nurse. Seasonal Standard (school 1152671) is linked to Theodore Mcgrath (LIC-2589), while Extended Protocol D (school 7441154) is linked to the nurse on leave, Saipan International Airport (LIC-2603). The view includes the school's risk level and IPAC compliance status alongside the nurse's full name, license number, and current status. This orientation is useful for school administrators who need to identify their assigned nurse at a glance.

**View `vw_school_school_board`**

```sql
CREATE VIEW vw_school_school_board AS
SELECT a.id, a.school_id, a.school_name, a.address, b.board_id AS board_board_id, b.board_name AS board_board_name, b.jurisdiction AS board_jurisdiction
FROM schools a JOIN school_boards b ON a.part_of_board_id = b.board_id;
```

| id | school_id | school_name | address | board_board_id | board_board_name | board_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | distributed-address-72 | ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 |
| 2 | 1186099 | Integrated Framework | baseline-address-73 | 168553 | Legacy Assessment | legacy-jurisdic-31 |
| 3 | 7441154 | Extended Protocol D | pilot-address-74 | 5006454 | Regional Survey A | compact-jurisdic-32 |
| 4 | 338514 | Pilot Programme | extended-address-75 | 1437585 | Seasonal Corridor | composite-jurisdic-33 |

This view connects each school to its governing board, answering the question of which board is responsible for a given campus. Seasonal Standard falls under Compact Series (ChIJH2V4UYBt5kcR5doeFwuU7Ns), while Integrated Framework falls under Legacy Assessment (168553). The view includes the board's jurisdiction, contact email, and program manager name, providing school administrators with the information they need to escalate issues or request support from their board.

**View `vw_school_outbreak`**

```sql
CREATE VIEW vw_school_outbreak AS
SELECT a.id, a.school_id, a.school_name, a.address, b.outbreak_id AS outbreak_outbreak_id, b.start_date AS outbreak_start_date, b.end_date AS outbreak_end_date
FROM schools a JOIN outbreaks b ON a.outbreak_id = b.outbreak_id;
```

| id | school_id | school_name | address | outbreak_outbreak_id | outbreak_start_date | outbreak_end_date |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | distributed-address-72 | bhavenger | 2022-09-05 | 2022-09-01 |
| 2 | 1186099 | Integrated Framework | baseline-address-73 | 1186096 | 2023-02-16 | 2023-02-12 |
| 3 | 7441154 | Extended Protocol D | pilot-address-74 | 9085242 | 2024-07-27 | 2024-07-23 |
| 4 | 338514 | Pilot Programme | extended-address-75 | gd_taxc_1211 | 2025-12-11 | 2025-12-07 |

This view links schools to their associated outbreaks, answering which outbreaks have occurred at each campus. Seasonal Standard is linked to the bhavenger outbreak, which had 88 cases and remains active. Integrated Framework is linked to outbreak 1186096, which had 12 cases and is now contained. Extended Protocol D is linked to outbreak 9085242, with 10 cases and resolved status. Pilot Programme is linked to gd_taxc_1211, with 4 cases and active status. The view includes the outbreak's start and end dates, case count, and status, providing a clear picture of each school's outbreak history.

**View `vw_school_board_public_health_nurse`**

```sql
CREATE VIEW vw_school_board_public_health_nurse AS
SELECT a.board_id, a.board_name, a.jurisdiction, a.contact_email, b.id AS nurse_id, b.nurse_id AS nurse_nurse_id, b.full_name AS nurse_full_name
FROM school_boards a JOIN public_health_nurses b ON a.public_health_nurse_id = b.id;
```

| board_id | board_name | jurisdiction | contact_email | nurse_id | nurse_nurse_id | nurse_full_name |
|---|---|---|---|---|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 | Christopher Wilson | 1 | 6969414 | Theodore Mcgrath |
| 168553 | Legacy Assessment | legacy-jurisdic-31 | Charles Larsen | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name |
| 5006454 | Regional Survey A | compact-jurisdic-32 | Mary Alvarez | 3 | 1250196 | Saipan International Airport |
| 1437585 | Seasonal Corridor | composite-jurisdic-33 | April Snyder | 4 | 9125616 | Norma Fisher |

This comprehensive view joins schools, boards, and nurses into a single record, answering the question of which nurse is assigned to which school under which board. The result shows Seasonal Standard under Compact Series with Theodore Mcgrath as the assigned nurse, and Integrated Framework under Legacy Assessment with Account Name as the assigned nurse. This triple join is the most complete operational view, capturing the full chain of responsibility from individual nurse through campus to governing board.

**View `vw_school_board_school_detail`**

```sql
CREATE VIEW vw_school_board_school_detail AS
SELECT a.board_id, a.board_name, a.jurisdiction, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM school_boards a
  JOIN boards_schools j ON j.board_id = a.board_id
  JOIN schools b ON b.id = j.school_id;
```

| board_id | board_name | jurisdiction | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 | 1 | 1152671 | Seasonal Standard |
| ChIJH2V4UYBt5kcR5doeFwuU7Ns | Compact Series | regional-jurisdic-30 | 2 | 1186099 | Integrated Framework |
| 168553 | Legacy Assessment | legacy-jurisdic-31 | 2 | 1186099 | Integrated Framework |
| 168553 | Legacy Assessment | legacy-jurisdic-31 | 3 | 7441154 | Extended Protocol D |
| 5006454 | Regional Survey A | compact-jurisdic-32 | 3 | 7441154 | Extended Protocol D |
| 5006454 | Regional Survey A | compact-jurisdic-32 | 4 | 338514 | Pilot Programme |
| 1437585 | Seasonal Corridor | composite-jurisdic-33 | 4 | 338514 | Pilot Programme |
| 1437585 | Seasonal Corridor | composite-jurisdic-33 | 1 | 1152671 | Seasonal Standard |

This view provides detailed information about schools within the context of their boards, answering which schools belong to which board and what their operational characteristics are. Compact Series (ChIJH2V4UYBt5kcR5doeFwuU7Ns) oversees Seasonal Standard (risk level low, IPAC compliant false) and Integrated Framework (risk level medium, IPAC compliant true). Legacy Assessment (168553) oversees Integrated Framework and Extended Protocol D (risk level high, IPAC compliant false). This view is particularly useful for board-level administrators who need to assess the health risk profile of all schools under their jurisdiction.

**View `vw_outbreak_school`**

```sql
CREATE VIEW vw_outbreak_school AS
SELECT a.outbreak_id, a.start_date, a.end_date, a.case_count, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM outbreaks a JOIN schools b ON a.school_id = b.id;
```

| outbreak_id | start_date | end_date | case_count | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| bhavenger | 2022-09-05 | 2022-09-01 | 88 | 1 | 1152671 | Seasonal Standard |
| 1186096 | 2023-02-16 | 2023-02-12 | 12 | 2 | 1186099 | Integrated Framework |
| 9085242 | 2024-07-27 | 2024-07-23 | 10 | 3 | 7441154 | Extended Protocol D |
| gd_taxc_1211 | 2025-12-11 | 2025-12-07 | 4 | 4 | 338514 | Pilot Programme |

This view links outbreaks to their associated schools, answering which school each outbreak occurred at. The bhavenger outbreak (88 cases, active) occurred at school 1152671 (Seasonal Standard), while 1186096 (12 cases, contained) occurred at school 1186099 (Integrated Framework). The view includes the school's name, risk level, and IPAC compliance status alongside the outbreak's case count, start and end dates, and status. This perspective is essential for understanding the relationship between outbreak severity and school characteristics.

**View `vw_outbreak_public_health_nurse`**

```sql
CREATE VIEW vw_outbreak_public_health_nurse AS
SELECT a.outbreak_id, a.start_date, a.end_date, a.case_count, b.id AS nurse_id, b.nurse_id AS nurse_nurse_id, b.full_name AS nurse_full_name
FROM outbreaks a JOIN public_health_nurses b ON a.public_health_nurse_id = b.id;
```

| outbreak_id | start_date | end_date | case_count | nurse_id | nurse_nurse_id | nurse_full_name |
|---|---|---|---|---|---|---|
| bhavenger | 2022-09-05 | 2022-09-01 | 88 | 1 | 6969414 | Theodore Mcgrath |
| 1186096 | 2023-02-16 | 2023-02-12 | 12 | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name |
| 9085242 | 2024-07-27 | 2024-07-23 | 10 | 3 | 1250196 | Saipan International Airport |
| gd_taxc_1211 | 2025-12-11 | 2025-12-07 | 4 | 4 | 9125616 | Norma Fisher |

This view connects outbreaks to the public health nurses responsible for responding to them, answering which nurse is assigned to each outbreak. The bhavenger outbreak is assigned to nurse 6969414 (Theodore Mcgrath), while 1186096 is assigned to nurse 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 (Account Name). The view includes the nurse's license number, contact information, and current status alongside the outbreak's details. This pairing is critical for ensuring that outbreak response is coordinated through the correct assigned nurse.

**View `vw_i_p_a_c_measure_school`**

```sql
CREATE VIEW vw_i_p_a_c_measure_school AS
SELECT a.id, a.measure_id, a.measure_name, a.description, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM i_p_a_c_measures a JOIN schools b ON a.school_id = b.id;
```

| id | measure_id | measure_name | description | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 1 | invoice | Baseline Framework D | Extended Survey | 1 | 1152671 | Seasonal Standard |
| 2 | 4180944 | Distributed Protocol | Pilot Corridor A | 2 | 1186099 | Integrated Framework |
| 3 | 6969441 | Adaptive Programme | Baseline Series | 3 | 7441154 | Extended Protocol D |
| 4 | 21280358 | Primary Standard A | Distributed Assessment | 4 | 338514 | Pilot Programme |

This view links IPAC measures to their associated schools, answering which measures are implemented at each campus. Baseline Framework D is implemented at school 1152671 (Seasonal Standard) with compliant status, while Distributed Protocol is implemented at school 1186099 (Integrated Framework) with non_compliant status. The view includes the measure's implementation date, compliance status, and last reviewed date alongside the school's name and risk level. This perspective is essential for identifying which schools have compliance gaps that need to be addressed.

**View `vw_i_p_a_c_measure_public_health_nurse`**

```sql
CREATE VIEW vw_i_p_a_c_measure_public_health_nurse AS
SELECT a.id, a.measure_id, a.measure_name, a.description, b.id AS nurse_id, b.nurse_id AS nurse_nurse_id, b.full_name AS nurse_full_name
FROM i_p_a_c_measures a JOIN public_health_nurses b ON a.public_health_nurse_id = b.id;
```

| id | measure_id | measure_name | description | nurse_id | nurse_nurse_id | nurse_full_name |
|---|---|---|---|---|---|---|
| 1 | invoice | Baseline Framework D | Extended Survey | 1 | 6969414 | Theodore Mcgrath |
| 2 | 4180944 | Distributed Protocol | Pilot Corridor A | 2 | 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 | Account Name |
| 3 | 6969441 | Adaptive Programme | Baseline Series | 3 | 1250196 | Saipan International Airport |
| 4 | 21280358 | Primary Standard A | Distributed Assessment | 4 | 9125616 | Norma Fisher |

This view connects IPAC measures to the public health nurses responsible for overseeing their implementation, answering which nurse is accountable for each measure. Baseline Framework D is overseen by nurse 6969414 (Theodore Mcgrath), while Distributed Protocol is overseen by nurse 2b2bb518-8fcd-11eb-924d-9cd76263cbd0 (Account Name). The view includes the nurse's license number and contact information alongside the measure's compliance status and last reviewed date. This pairing ensures that accountability for IPAC compliance is clearly assigned to individual nurses.

### Synthesis

The records and views described above form a coherent system for managing school-based public health operations. At the core are the base tables—public health nurses, schools, school boards, outbreaks, IPAC measures, and the boards-schools mapping—which capture the fundamental entities and their attributes. The views then assemble these entities into meaningful combinations that answer specific operational questions: which nurse is assigned to which school, which board governs which campus, which outbreaks have occurred where, and which IPAC measures are compliant or non-compliant. Together, they provide the informational infrastructure that enables school districts to monitor health risks, assign responsibility, and coordinate responses to infectious disease events.