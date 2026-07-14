## Institutional Accountability and Protected Disclosure Management

Higher education institutions operate under a complex web of regulatory obligations that require structured mechanisms for reporting, investigating, and resolving misconduct. The protected disclosure system captures the full lifecycle of an allegation—from the moment a whistleblower submits a report through investigation, resolution, and potential corrective action. This chapter documents the data architecture that supports this process, examining how disclosures, whistleblowers, improper conduct records, investigations, investigators, and affected college resources interlock to form a coherent audit trail.

**Table `protected_disclosures`**

| disclosure_id | disclosure_date | disclosure_method | is_good_faith | subject_matter | retaliation_status | whistleblower_id | investigation_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | email | true | seasonal-subject-29 | none | 1 | 100 | 2025-01-01 00:14:00 |
| 1250217 | 2022-01-13T02:50:00 | phone | false | regional-subject-30 | reported | 2 | 101 | 2025-02-06 03:14:00 |
| 4447022 | 2023-06-24T09:07:00 | in-person | true | legacy-subject-31 | investigating | 3 | 102 | 2025-03-11 06:14:00 |
| 1437596 | 2024-11-08T16:24:00 | written | false | compact-subject-32 | substantiated | 4 | 103 | 2025-04-16 09:14:00 |

A protected disclosure serves as the foundational event in the accountability pipeline. Each record captures when and how a concern was raised, whether the reporter acted in good faith, the subject matter category, and the current retaliation status. Disclosures arrive through four documented channels: email, phone, in-person meetings, and written submissions. The system tracks good-faith intent as a boolean flag, distinguishing between reports made with sincere belief in their accuracy and those that lack it. Subject matter categories such as seasonal-subject-29, regional-subject-30, legacy-subject-31, and compact-subject-32 provide a classification framework for routing and analysis. Retaliation status progresses through stages—none, reported, investigating, and substantiated—allowing the institution to monitor whether reporters face adverse consequences after coming forward.

**Table `whistleblowers`**

| whistleblower_id | person_id | role | campus_affiliation | contact_email | contact_phone | protection_status | disclosure_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | student | Davenport | Christopher Wilson | Joe Tsai | active | 195359 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Maria Rodriguez | employee | West | Charles Larsen | Stephanie Collins | inactive | 1250217 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Sarah Villanueva | faculty | Florida | Mary Alvarez | Tasha Rodriguez | active | 4447022 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Susan Wagner | affiliate | Davenport | April Snyder | Walter Pratt | inactive | 1437596 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The whistleblower table profiles the individuals behind each disclosure, linking them to their institutional role and campus affiliation. Roles span the full academic ecosystem: students, employees, faculty members, and affiliates. Campus affiliations include Davenport, West, and Florida, each representing a distinct operational unit. Protection status—active or inactive—indicates whether the individual currently qualifies for institutional safeguards. Contact information is preserved through both email and phone fields, though the stored values (such as Christopher Wilson for email and Joe Tsai for phone under whistleblower 1) serve as reference identifiers rather than literal contact strings. Each whistleblower record carries a disclosure_id that anchors it to the originating protected disclosure, creating a one-to-one correspondence in the base data.

**Table `improper_conducts`**

| id | conduct_id | conduct_date | conduct_type | severity_level | is_criminal | description | disclosure_id | investigation_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 2986238 | 2025-12-12T23:21:00 | legal_violation | 29 | false | Extended Survey | 195359 | 100 |
| 2 | 3744007 | 2022-05-23T06:38:00 | misuse_of_resources | 40 | true | Pilot Corridor A | 1250217 | 101 |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 | economic_waste | 51 | false | Baseline Series | 4447022 | 102 |
| 4 | 10238282 | 2024-03-18T20:12:00 | safety_threat | 62 | true | Distributed Assessment | 1437596 | 103 |

When a disclosure raises concerns about specific wrongdoing, the system records an improper conduct entry. The conduct table documents the nature of the alleged violation through a conduct_type field that accommodates categories including legal_violation, misuse_of_resources, economic_waste, and safety_threat. Severity levels are captured as numeric values ranging from 29 to 62 in the sample data, providing a quantitative measure for prioritization. The is_criminal flag distinguishes conduct that may warrant law enforcement referral from purely institutional matters. Descriptions such as Extended Survey, Pilot Corridor A, Baseline Series, and Distributed Assessment offer contextual summaries. Each improper conduct record links back to its originating disclosure and to the investigation that addresses it, forming a bridge between the report and the response.

**Table `investigations`**

| id | investigation_id | start_date | end_date | status | findings_summary | corrective_action_taken | disclosure_id | improper_conduct_id |
|---|---|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pending | pilot-findings-32 | true | 195359 | 1 |
| 101 | 8843769 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | active | extended-findings-33 | false | 1250217 | 2 |
| 102 | 974942 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | integrated-findings-34 | true | 4447022 | 3 |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | closed | seasonal-findings-35 | false | 1437596 | 4 |

Investigations represent the institutional response mechanism. Each investigation record spans a defined period with start_date and end_date timestamps, though the sample data reveals that end dates may precede start dates—a pattern that may reflect data entry conventions or retroactive documentation. The status field tracks progress through four states: pending, active, completed, and closed. Findings summaries (pilot-findings-32, extended-findings-33, integrated-findings-34, seasonal-findings-35) provide concise narrative conclusions. The corrective_action_taken flag indicates whether the investigation resulted in remedial measures. Investigations are linked to both the disclosure that triggered them and the specific improper conduct they examine, creating a tripartite relationship at the core of the system.

**Table `investigators`**

| investigator_id | person_id | role | assigned_campus | authorization_date | current_case_load | investigation_id |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | employee | Davenport | 2022-05-19T16:24:00 | 28 | 100 |
| 2 | Maria Rodriguez | faculty | West | 2023-10-03T23:41:00 | 34 | 101 |
| 3 | Sarah Villanueva | external | Florida | 2024-03-14T06:58:00 | 40 | 102 |
| 4 | Susan Wagner | employee | Davenport | 2025-08-25T13:15:00 | 46 | 103 |

Investigators are the personnel assigned to conduct inquiries. Their records include a person_id, a role designation (employee, faculty, external), and an assigned_campus that indicates their operational base. Authorization_date marks when the investigator received clearance to handle cases, while current_case_load provides a snapshot of their active workload—ranging from 28 to 46 cases in the sample. Each investigator is associated with a specific investigation through the investigation_id field, establishing the assignment relationship.

**Table `college_resources`**

| resource_id | resource_type | description | value | owner | improper_conduct_id |
|---|---|---|---|---|---|
| 1167 | cash | Extended Survey | 19.95 | Roger Graham | 1 |
| 2106708 | tangible_property | Pilot Corridor A | 21.90 | Corey Wood | 2 |
| 4180945 | intangible_property | Baseline Series | 23.85 | Jason Beltran | 3 |
| 10238270 | receivables | Distributed Assessment | 25.80 | Carlos Kennedy | 4 |

College resources table the assets impacted by improper conduct. Resource types include cash, tangible_property, intangible_property, and receivables, each representing a distinct category of institutional value. The value field quantifies the financial impact, with amounts such as 19.95, 21.90, 23.85, and 25.80 appearing in the sample. Owner names (Roger Graham, Corey Wood, Jason Beltran, Carlos Kennedy) identify the individuals associated with the affected resources. Each resource record ties back to a specific improper conduct through improper_conduct_id, enabling the institution to quantify the material consequences of misconduct.

**Table `investigations_investigators`**

| investigation_id | investigator_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The investigations_investigators junction table formalizes the many-to-many relationship between investigations and investigators. In practice, the base data shows a one-to-one mapping in the sample—investigation 100 assigned to investigator 1, investigation 101 to investigator 2, and so on—but the junction structure supports scenarios where multiple investigators collaborate on a single case or a single investigator handles multiple investigations over time. This table is the structural backbone that enables the detailed assignment views described below.

### Disclosure and Whistleblower Relationships

**View `protected_disclosure_whistleblower_view`**

```sql
CREATE VIEW protected_disclosure_whistleblower_view AS
SELECT a.disclosure_id, a.disclosure_date, a.disclosure_method, a.is_good_faith, b.whistleblower_id AS whistleblower_whistleblower_id, b.person_id AS whistleblower_person_id, b.role AS whistleblower_role
FROM protected_disclosures a JOIN whistleblowers b ON a.whistleblower_id = b.whistleblower_id;
```

| disclosure_id | disclosure_date | disclosure_method | is_good_faith | whistleblower_whistleblower_id | whistleblower_person_id | whistleblower_role |
|---|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | email | true | 1 | George Bernard Shaw | student |
| 1250217 | 2022-01-13T02:50:00 | phone | false | 2 | Maria Rodriguez | employee |
| 4447022 | 2023-06-24T09:07:00 | in-person | true | 3 | Sarah Villanueva | faculty |
| 1437596 | 2024-11-08T16:24:00 | written | false | 4 | Susan Wagner | affiliate |

This view joins protected_disclosures with whistleblowers to answer the question: who made each disclosure, and what are their institutional circumstances? The joined result combines the disclosure's method, date, subject matter, and retaliation status with the whistleblower's role, campus affiliation, protection status, and contact details. For example, the row corresponding to disclosure 195359 reveals that George Bernard Shaw, a student at Davenport with active protection status, submitted the report via email on 2025-08-02 regarding seasonal-subject-29, with no retaliation reported. The second row shows Maria Rodriguez, an employee at West with inactive protection status, filed a phone-based disclosure on 2022-01-13 concerning regional-subject-30, where retaliation was reported.

**View `whistleblower_protected_disclosure_view`**

```sql
CREATE VIEW whistleblower_protected_disclosure_view AS
SELECT a.whistleblower_id, a.person_id, a.role, a.campus_affiliation, b.disclosure_id AS disclosure_disclosure_id, b.disclosure_date AS disclosure_disclosure_date, b.disclosure_method AS disclosure_disclosure_method
FROM whistleblowers a JOIN protected_disclosures b ON a.disclosure_id = b.disclosure_id;
```

| whistleblower_id | person_id | role | campus_affiliation | disclosure_disclosure_id | disclosure_disclosure_date | disclosure_disclosure_method |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | student | Davenport | 195359 | 2025-08-02T19:33:00 | email |
| 2 | Maria Rodriguez | employee | West | 1250217 | 2022-01-13T02:50:00 | phone |
| 3 | Sarah Villanueva | faculty | Florida | 4447022 | 2023-06-24T09:07:00 | in-person |
| 4 | Susan Wagner | affiliate | Davenport | 1437596 | 2024-11-08T16:24:00 | written |

The inverse perspective—whistleblower_protected_disclosure_view—starts from the whistleblower profile and surfaces the associated disclosure details. This orientation is useful for compliance officers reviewing an individual's reporting history. The row for whistleblower 3 (Sarah Villanueva, faculty at Florida, active protection) shows a disclosure filed on 2023-06-24 through an in-person meeting, classified as good faith, with the subject matter legacy-subject-31 and retaliation status investigating. The view confirms that each whistleblower in the sample has exactly one associated disclosure, consistent with the one-to-one relationship in the base tables.

### Conduct and Disclosure Linkages

**View `improper_conduct_protected_disclosure_view`**

```sql
CREATE VIEW improper_conduct_protected_disclosure_view AS
SELECT a.id, a.conduct_id, a.conduct_date, a.conduct_type, b.disclosure_id AS disclosure_disclosure_id, b.disclosure_date AS disclosure_disclosure_date, b.disclosure_method AS disclosure_disclosure_method
FROM improper_conducts a JOIN protected_disclosures b ON a.disclosure_id = b.disclosure_id;
```

| id | conduct_id | conduct_date | conduct_type | disclosure_disclosure_id | disclosure_disclosure_date | disclosure_disclosure_method |
|---|---|---|---|---|---|---|
| 1 | 2986238 | 2025-12-12T23:21:00 | legal_violation | 195359 | 2025-08-02T19:33:00 | email |
| 2 | 3744007 | 2022-05-23T06:38:00 | misuse_of_resources | 1250217 | 2022-01-13T02:50:00 | phone |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 | economic_waste | 4447022 | 2023-06-24T09:07:00 | in-person |
| 4 | 10238282 | 2024-03-18T20:12:00 | safety_threat | 1437596 | 2024-11-08T16:24:00 | written |

This view connects improper conduct records to their originating disclosures, answering: what specific misconduct did each disclosure allege, and how was it reported? The joined result merges the conduct's type, severity, criminal status, and description with the disclosure's method, date, and subject matter. Row 1 shows that the legal_violation (severity 29, non-criminal, described as Extended Survey) originated from disclosure 195359, submitted by email. Row 2 links the misuse_of_resources conduct (severity 40, criminal, Pilot Corridor A) to disclosure 1250217, which was filed by phone and flagged as not made in good faith.

**View `improper_conduct_investigation_view`**

```sql
CREATE VIEW improper_conduct_investigation_view AS
SELECT a.id, a.conduct_id, a.conduct_date, a.conduct_type, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.start_date AS investigation_start_date
FROM improper_conducts a JOIN investigations b ON a.investigation_id = b.id;
```

| id | conduct_id | conduct_date | conduct_type | investigation_id | investigation_investigation_id | investigation_start_date |
|---|---|---|---|---|---|---|
| 1 | 2986238 | 2025-12-12T23:21:00 | legal_violation | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 |
| 2 | 3744007 | 2022-05-23T06:38:00 | misuse_of_resources | 101 | 8843769 | 2023-02-16T03:41:00 |
| 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 | economic_waste | 102 | 974942 | 2024-07-27T10:58:00 |
| 4 | 10238282 | 2024-03-18T20:12:00 | safety_threat | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 |

The improper_conduct_investigation_view ties misconduct records to the investigations that address them, revealing how the institution maps allegations to investigative responses. The joined data shows that conduct record 1 (legal_violation, Extended Survey) is handled by investigation 100, which has a status of pending and findings summarized as pilot-findings-32, with corrective action taken. Conduct record 4 (safety_threat, severity 62, criminal, Distributed Assessment) corresponds to investigation 103, which is closed, found seasonal-findings-35, and did not result in corrective action. This view enables auditors to trace from a specific misconduct allegation through to its investigative outcome.

### Investigation-Centric Perspectives

**View `investigation_protected_disclosure_view`**

```sql
CREATE VIEW investigation_protected_disclosure_view AS
SELECT a.id, a.investigation_id, a.start_date, a.end_date, b.disclosure_id AS disclosure_disclosure_id, b.disclosure_date AS disclosure_disclosure_date, b.disclosure_method AS disclosure_disclosure_method
FROM investigations a JOIN protected_disclosures b ON a.disclosure_id = b.disclosure_id;
```

| id | investigation_id | start_date | end_date | disclosure_disclosure_id | disclosure_disclosure_date | disclosure_disclosure_method |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 195359 | 2025-08-02T19:33:00 | email |
| 101 | 8843769 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1250217 | 2022-01-13T02:50:00 | phone |
| 102 | 974942 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 4447022 | 2023-06-24T09:07:00 | in-person |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1437596 | 2024-11-08T16:24:00 | written |

Starting from the investigation, this view surfaces the disclosure that triggered it, answering: what report initiated this inquiry? The joined result combines investigation metadata (start_date, end_date, status, findings_summary, corrective_action_taken) with the originating disclosure's details. Investigation 102, for instance, began on 2024-07-27, completed its work by 2024-07-23, produced integrated-findings-34, and resulted in corrective action. It was triggered by disclosure 4447022, filed on 2023-06-24 via in-person meeting, classified as good faith, concerning legacy-subject-31, with retaliation status investigating.

**View `investigation_investigator_detail_view`**

```sql
CREATE VIEW investigation_investigator_detail_view AS
SELECT a.id, a.investigation_id, a.start_date, b.investigator_id AS investigator_investigator_id, b.person_id AS investigator_person_id, b.role AS investigator_role
FROM investigations a
  JOIN investigations_investigators j ON j.investigation_id = a.id
  JOIN investigators b ON b.investigator_id = j.investigator_id;
```

| id | investigation_id | start_date | investigator_investigator_id | investigator_person_id | investigator_role |
|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 1 | George Bernard Shaw | employee |
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 2 | Maria Rodriguez | faculty |
| 101 | 8843769 | 2023-02-16T03:41:00 | 2 | Maria Rodriguez | faculty |
| 101 | 8843769 | 2023-02-16T03:41:00 | 3 | Sarah Villanueva | external |
| 102 | 974942 | 2024-07-27T10:58:00 | 3 | Sarah Villanueva | external |
| 102 | 974942 | 2024-07-27T10:58:00 | 4 | Susan Wagner | employee |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 4 | Susan Wagner | employee |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 1 | George Bernard Shaw | employee |

This view links investigations to their assigned investigators, providing a complete picture of who is responsible for each inquiry. The joined result includes investigator details (person_id, role, assigned_campus, authorization_date, current_case_load) alongside investigation metadata. Investigation 100 is assigned to investigator 1 (George Bernard Shaw, employee, Davenport campus, authorized 2022-05-19, carrying 28 cases). Investigation 102 is handled by investigator 3 (Sarah Villanueva, external, Florida campus, authorized 2024-03-14, with a current case load of 40). The external designation for investigator 3 suggests the institution engages outside parties for certain inquiries, potentially to ensure independence.

**View `investigation_improper_conduct_view`**

```sql
CREATE VIEW investigation_improper_conduct_view AS
SELECT a.id, a.investigation_id, a.start_date, a.end_date, b.id AS conduct_id, b.conduct_id AS conduct_conduct_id, b.conduct_date AS conduct_conduct_date
FROM investigations a JOIN improper_conducts b ON a.improper_conduct_id = b.id;
```

| id | investigation_id | start_date | end_date | conduct_id | conduct_conduct_id | conduct_conduct_date |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 2986238 | 2025-12-12T23:21:00 |
| 101 | 8843769 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 3744007 | 2022-05-23T06:38:00 |
| 102 | 974942 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 10238282 | 2024-03-18T20:12:00 |

The investigation_improper_conduct_view connects investigations to the specific improper conduct they examine, completing the investigative triad. The joined result shows that investigation 101 (status active, findings extended-findings-33, no corrective action) addresses improper conduct record 2 (misuse_of_resources, severity 40, criminal, Pilot Corridor A). Investigation 103 (status closed, findings seasonal-findings-35, no corrective action) corresponds to conduct record 4 (safety_threat, severity 62, criminal, Distributed Assessment). This view supports oversight by allowing reviewers to assess whether the nature and severity of the conduct align with the investigation's scope and outcome.

### Resource Impact Analysis

**View `college_resource_improper_conduct_view`**

```sql
CREATE VIEW college_resource_improper_conduct_view AS
SELECT a.resource_id, a.resource_type, a.description, a.value, b.id AS conduct_id, b.conduct_id AS conduct_conduct_id, b.conduct_date AS conduct_conduct_date
FROM college_resources a JOIN improper_conducts b ON a.improper_conduct_id = b.id;
```

| resource_id | resource_type | description | value | conduct_id | conduct_conduct_id | conduct_conduct_date |
|---|---|---|---|---|---|---|
| 1167 | cash | Extended Survey | 19.95 | 1 | 2986238 | 2025-12-12T23:21:00 |
| 2106708 | tangible_property | Pilot Corridor A | 21.90 | 2 | 3744007 | 2022-05-23T06:38:00 |
| 4180945 | intangible_property | Baseline Series | 23.85 | 3 | e5a1c32e-8fc3-11eb-924d-9cd76263cbd0 | 2023-10-07T13:55:00 |
| 10238270 | receivables | Distributed Assessment | 25.80 | 4 | 10238282 | 2024-03-18T20:12:00 |

This view joins college_resources with improper_conducts to quantify the material impact of misconduct on institutional assets. The joined result pairs each resource's type, description, value, and owner with the associated conduct's type, severity, and criminal status. Row 1 shows that cash resources valued at 19.95, owned by Roger Graham and described as Extended Survey, are linked to a legal_violation (severity 29, non-criminal). Row 4 reveals that receivables valued at 25.80, owned by Carlos Kennedy and described as Distributed Assessment, correspond to a safety_threat (severity 62, criminal). The view enables financial officers to assess the economic consequences of different conduct types and prioritize resource recovery efforts.

### Investigator Workload and Assignment

**View `investigator_investigation_view`**

```sql
CREATE VIEW investigator_investigation_view AS
SELECT a.investigator_id, a.person_id, a.role, a.assigned_campus, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.start_date AS investigation_start_date
FROM investigators a JOIN investigations b ON a.investigation_id = b.id;
```

| investigator_id | person_id | role | assigned_campus | investigation_id | investigation_investigation_id | investigation_start_date |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | employee | Davenport | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 |
| 2 | Maria Rodriguez | faculty | West | 101 | 8843769 | 2023-02-16T03:41:00 |
| 3 | Sarah Villanueva | external | Florida | 102 | 974942 | 2024-07-27T10:58:00 |
| 4 | Susan Wagner | employee | Davenport | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 |

The investigator_investigation_view presents each investigator alongside their assigned investigation, providing a workload and assignment overview. The joined result combines investigator metadata (role, assigned_campus, authorization_date, current_case_load) with investigation details (start_date, end_date, status, findings_summary, corrective_action_taken). Investigator 2 (Maria Rodriguez, faculty, West campus, authorized 2023-10-03, case load 34) is assigned to investigation 101, which is active with findings extended-findings-33 and no corrective action taken. Investigator 4 (Susan Wagner, employee, Davenport campus, authorized 2025-08-25, case load 46) handles investigation 103, which is closed with findings seasonal-findings-35 and no corrective action. This view supports resource planning by revealing the distribution of cases across investigators and their institutional affiliations.

### Synthesis

The protected disclosure system forms an integrated accountability framework where each component serves a distinct function. Disclosures capture the initial report through structured metadata. Whistleblowers provide the human context behind each report. Improper conducts classify and quantify the alleged wrongdoing. Investigations document the institutional response from initiation through resolution. Investigators represent the personnel executing inquiries. College resources quantify the financial impact. The junction table and derived views bind these elements into navigable relationships, enabling compliance officers, auditors, and administrators to trace any allegation from its origin through to its material consequences. The sample data—spanning four disclosures, four whistleblowers, four conduct records, four investigations, four investigators, and four resource records—demonstrates a system designed for completeness, traceability, and institutional transparency.

## Data appendix

**View `protected_disclosure_investigation_view`**

```sql
CREATE VIEW protected_disclosure_investigation_view AS
SELECT a.disclosure_id, a.disclosure_date, a.disclosure_method, a.is_good_faith, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.start_date AS investigation_start_date
FROM protected_disclosures a JOIN investigations b ON a.investigation_id = b.id;
```

| disclosure_id | disclosure_date | disclosure_method | is_good_faith | investigation_id | investigation_investigation_id | investigation_start_date |
|---|---|---|---|---|---|---|
| 195359 | 2025-08-02T19:33:00 | email | true | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2022-09-05T20:24:00 |
| 1250217 | 2022-01-13T02:50:00 | phone | false | 101 | 8843769 | 2023-02-16T03:41:00 |
| 4447022 | 2023-06-24T09:07:00 | in-person | true | 102 | 974942 | 2024-07-27T10:58:00 |
| 1437596 | 2024-11-08T16:24:00 | written | false | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-12-11T17:15:00 |
