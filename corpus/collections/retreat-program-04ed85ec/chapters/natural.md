## Foundations of Retreat Program Administration

The administration of spiritual retreat programs requires a structured approach to tracking participants, financial contributions, organizational affiliations, and the philosophical frameworks that guide each offering. At the core of this domain are five interconnected record types: retreat programs, donations, spiritual seekers, spiritual paths, and spiritual organizations. Each record type captures a distinct facet of the retreat ecosystem, and their relationships form the backbone of operational reporting and participant engagement analysis.

**Table `retreat_programs`**

| id | program_identifier | program_name | start_date | end_date | location | is_annual | spiritual_organization_id | donation_id |
|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | extended-location-99 | false | 1000 | 1000 |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | integrated-location-100 | true | 1001 | 1001 |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | seasonal-location-101 | false | 1002 | 1002 |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | regional-location-102 | true | 1003 | 1003 |

Retreat programs represent the primary service offerings within the domain. Each program is identified by a unique program identifier such as PRO-2198 or PRO-2205, and carries a descriptive program name like Extended Review, Pilot Initiative A, Baseline Model, or Distributed Cluster. Programs are scheduled with a start date and an end date, and are associated with a location designation—extended-location-99, integrated-location-100, seasonal-location-101, or regional-location-102. The is_annual flag distinguishes recurring annual programs from one-time offerings; Pilot Initiative A and Distributed Cluster are marked as annual, while Extended Review and Baseline Model are not. Each program record also carries a reference to its sponsoring spiritual organization and a linked donation record, establishing the financial and organizational context for the offering.

**Table `donations`**

| id | donation_id | amount | currency_code | donation_date | status | is_anonymous | spiritual_seeker_id | spiritual_organization_id | retreat_program_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1996936 | 13.49 | gd_fp_eu_acc3 | 2022-01-26T12:36:00 | pending | true | 100 | 1000 | 1 |
| 1001 | 10445623 | 25.47 | managing-resources | 2023-06-10T19:53:00 | received | false | 101 | 1001 | 2 |
| 1002 | 168 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-11-21T02:10:00 | allocated | true | 102 | 1002 | 3 |
| 1003 | supp1 | 12.74 | 10445649 | 2025-04-05T09:27:00 | pending | false | 103 | 1003 | 4 |

Donations form the financial layer of the retreat ecosystem. Each donation record carries a numeric donation_id such as 1996936, 10445623, 168, or supp1, and records a monetary amount—ranging from 12.74 to 25.47 in the current dataset. The currency_code field uses domain-specific codes like gd_fp_eu_acc3, managing-resources, f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3, and 10445649 to denote the currency context. Each donation has a donation_date, a status (pending, received, or allocated), and an is_anonymous flag indicating whether the contributor wishes to remain unidentified. Crucially, each donation links to a spiritual seeker, a spiritual organization, and a retreat program, making it the central pivot connecting participants, sponsors, and offerings.

**Table `spiritual_seekers`**

| spiritual_seeker_id | seeker_id | first_name | last_name | email_address | member_since | is_anonymous | donation_id | retreat_program_id | spiritual_path_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8387537 | Stephanie Collins | Paul Allen | primary-email-70 | 2022-01-12T00:36:00 | true | 1000 | 1 | 100 |
| 101 | 392498 | Janice Johnston | Heather Beasley | adaptive-email-71 | 2023-06-23T07:53:00 | false | 1001 | 2 | 101 |
| 102 | IVC20Iind | Upal Saha | Audrey Taylor | distributed-email-72 | 2024-11-07T14:10:00 | true | 1002 | 3 | 102 |
| 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | baseline-email-73 | 2025-04-18T21:27:00 | false | 1003 | 4 | 103 |

Spiritual seekers are the individuals who participate in retreat programs and contribute financially. Each seeker record contains a spiritual_seeker_id, a seeker_id (which may be numeric like 8387537 or 392498, or formatted as a UUID or alphanumeric string such as IVC20Iind), and personal details including first and last names—Stephanie Collins, Janice Johnston, Upal Saha, and Katherine Snyder in the current data. The email_address field provides contact information, while member_since records the date the seeker joined the organization. The is_anonymous flag mirrors the donation-level anonymity setting, and each seeker is linked to a donation record, a retreat program, and a spiritual path.

**Table `spiritual_paths`**

| spiritual_path_id | path_id | path_name | core_principle | origin_tradition | is_universal | spiritual_seeker_id | retreat_program_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | Pilot Protocol | legacy-core-31 | regional-origin-54 | true | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 48753444 | Baseline Programme | compact-core-32 | legacy-origin-55 | false | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Standard A | composite-core-33 | compact-origin-56 | true | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | interpersonal | Adaptive Framework | primary-core-34 | composite-origin-57 | false | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Spiritual paths define the philosophical or practice frameworks that seekers follow. Each path has a spiritual_path_id, a path_id (such as b_VB-EC-15, 48753444, a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3, or interpersonal), and a path_name like Pilot Protocol, Baseline Programme, Distributed Standard A, or Adaptive Framework. The core_principle field captures the guiding tenet of the path, while origin_tradition identifies its cultural or doctrinal roots. The is_universal flag indicates whether the path is considered broadly applicable. Each path record is associated with a spiritual seeker and a retreat program, and includes timestamps for when the path was created and last updated.

**Table `spiritual_organizations`**

| spiritual_organization_id | org_id | org_name | founding_date | mission_statement | is_non_profit | retreat_program_id | donation_id | spiritual_seeker_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 2023-06-24T05:03:00 | compact-mission-14 | true | 1 | 1000 | 100 |
| 1001 | 1717 | Pilot Initiative A | 2024-11-08T12:20:00 | composite-mission-15 | false | 2 | 1001 | 101 |
| 1002 | 69437 | Baseline Model | 2025-04-19T19:37:00 | primary-mission-16 | true | 3 | 1002 | 102 |
| 1003 | m16 | Distributed Cluster | 2022-09-03T02:54:00 | adaptive-mission-17 | false | 4 | 1003 | 103 |

Spiritual organizations serve as the institutional sponsors of retreat programs. Each organization has a spiritual_organization_id, an org_id (such as 790471, 1717, 69437, or m16), and an org_name that often mirrors the associated program name—Extended Review, Pilot Initiative A, Baseline Model, and Distributed Cluster. The founding_date records when the organization was established, and the mission_statement field provides a brief description of its purpose. The is_non_profit flag indicates the organization's tax status. Each organization is linked to a retreat program, a donation, and a spiritual seeker, completing the triad of institutional, financial, and participant relationships.

### Organizational and Program Relationships

The relationship between retreat programs and their sponsoring organizations is captured in a dedicated view that joins the two base tables. This view answers the fundamental question of which organization sponsors which program, providing a clear mapping for administrative oversight and accountability.

**View `v_retreat_program_spiritual_organization`**

```sql
CREATE VIEW v_retreat_program_spiritual_organization AS
SELECT a.id, a.program_identifier, a.program_name, a.start_date, b.spiritual_organization_id AS organization_spiritual_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM retreat_programs a JOIN spiritual_organizations b ON a.spiritual_organization_id = b.spiritual_organization_id;
```

| id | program_identifier | program_name | start_date | organization_spiritual_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 1000 | 790471 | Extended Review |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 1001 | 1717 | Pilot Initiative A |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 1002 | 69437 | Baseline Model |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 1003 | m16 | Distributed Cluster |

The view v_retreat_program_spiritual_organization joins retreat programs with spiritual organizations on the spiritual_organization_id field, producing a consolidated record that pairs each program identifier and name with its sponsoring organization's internal ID and name. For example, the program PRO-2198 (Extended Review) is sponsored by the organization with org_id 790471, also named Extended Review. Similarly, PRO-2205 (Pilot Initiative A) maps to org_id 1717, and PRO-2219 (Distributed Cluster) maps to org_id m16. This one-to-one alignment in the current dataset reflects a design where each program is sponsored by a distinct organization, and the naming convention often mirrors the program name itself, suggesting a tight coupling between program identity and organizational branding.

### Financial and Program Relationships

Understanding the financial flow between donations and retreat programs is essential for budgeting and resource allocation. The view v_retreat_program_donation consolidates program details with their associated donation records, enabling administrators to trace funding back to specific offerings.

**View `v_retreat_program_donation`**

```sql
CREATE VIEW v_retreat_program_donation AS
SELECT a.id, a.program_identifier, a.program_name, a.start_date, b.id AS donation_id, b.donation_id AS donation_donation_id, b.amount AS donation_amount
FROM retreat_programs a JOIN donations b ON a.donation_id = b.id;
```

| id | program_identifier | program_name | start_date | donation_id | donation_donation_id | donation_amount |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | 2022-09-05T20:24:00 | 1000 | 1996936 | 13.49 |
| 2 | PRO-2205 | Pilot Initiative A | 2023-02-16T03:41:00 | 1001 | 10445623 | 25.47 |
| 3 | PRO-2212 | Baseline Model | 2024-07-27T10:58:00 | 1002 | 168 | 19.72 |
| 4 | PRO-2219 | Distributed Cluster | 2025-12-11T17:15:00 | 1003 | supp1 | 12.74 |

This view links each retreat program to its corresponding donation record, revealing the financial support structure for each offering. The program PRO-2198 (Extended Review) is associated with donation_id 1996936, amounting to 13.49 in currency gd_fp_eu_acc3, with a status of pending. The program PRO-2205 (Pilot Initiative A) carries donation_id 10445623 for 25.47 in managing-resources currency, marked as received. The program PRO-2212 (Baseline Model) is linked to donation_id 168 for 19.72, with status allocated, while PRO-2219 (Distributed Cluster) connects to donation_id supp1 for 12.74, also pending. These pairings demonstrate that each program has a dedicated donation record, and the varying statuses—pending, received, allocated—reflect different stages of financial processing.

### Donor and Seeker Relationships

The view v_donation_spiritual_seeker connects donation records with the spiritual seekers who made them, providing a clear picture of who contributed what and when.

**View `v_donation_spiritual_seeker`**

```sql
CREATE VIEW v_donation_spiritual_seeker AS
SELECT a.id, a.donation_id, a.amount, a.currency_code, b.spiritual_seeker_id AS seeker_spiritual_seeker_id, b.seeker_id AS seeker_seeker_id, b.first_name AS seeker_first_name
FROM donations a JOIN spiritual_seekers b ON a.spiritual_seeker_id = b.spiritual_seeker_id;
```

| id | donation_id | amount | currency_code | seeker_spiritual_seeker_id | seeker_seeker_id | seeker_first_name |
|---|---|---|---|---|---|---|
| 1000 | 1996936 | 13.49 | gd_fp_eu_acc3 | 100 | 8387537 | Stephanie Collins |
| 1001 | 10445623 | 25.47 | managing-resources | 101 | 392498 | Janice Johnston |
| 1002 | 168 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 102 | IVC20Iind | Upal Saha |
| 1003 | supp1 | 12.74 | 10445649 | 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder |

This view joins donations with spiritual seekers on the spiritual_seeker_id field, producing records that pair each donation's amount, currency, and status with the contributor's identity. For instance, donation 1996936 (13.49, pending) is attributed to seeker 100, while donation 10445623 (25.47, received) is attributed to seeker 101. The is_anonymous flag on both the donation and seeker records provides an additional layer of privacy control; seeker 100 and seeker 102 are marked as anonymous, while seeker 101 and seeker 103 are not. This alignment ensures that anonymity preferences are consistently applied across both the financial and participant records.

### Donor and Organization Relationships

The view v_donation_spiritual_organization links donations to their sponsoring organizations, answering the question of which organization receives or manages each contribution.

**View `v_donation_spiritual_organization`**

```sql
CREATE VIEW v_donation_spiritual_organization AS
SELECT a.id, a.donation_id, a.amount, a.currency_code, b.spiritual_organization_id AS organization_spiritual_organization_id, b.org_id AS organization_org_id, b.org_name AS organization_org_name
FROM donations a JOIN spiritual_organizations b ON a.spiritual_organization_id = b.spiritual_organization_id;
```

| id | donation_id | amount | currency_code | organization_spiritual_organization_id | organization_org_id | organization_org_name |
|---|---|---|---|---|---|---|
| 1000 | 1996936 | 13.49 | gd_fp_eu_acc3 | 1000 | 790471 | Extended Review |
| 1001 | 10445623 | 25.47 | managing-resources | 1001 | 1717 | Pilot Initiative A |
| 1002 | 168 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 1002 | 69437 | Baseline Model |
| 1003 | supp1 | 12.74 | 10445649 | 1003 | m16 | Distributed Cluster |

This view joins donations with spiritual organizations on the spiritual_organization_id field, producing a consolidated record that shows which organization is associated with each donation. Donation 1996936 is linked to organization 1000, donation 10445623 to organization 1001, donation 168 to organization 1002, and donation supp1 to organization 1003. This mapping confirms that each donation is tied to a specific sponsoring organization, creating a clear audit trail for financial accountability and organizational reporting.

### Seeker and Donation Relationships

The view v_spiritual_seeker_donation provides the inverse perspective of the donor-seeker relationship, presenting seeker records alongside their associated donation details.

**View `v_spiritual_seeker_donation`**

```sql
CREATE VIEW v_spiritual_seeker_donation AS
SELECT a.spiritual_seeker_id, a.seeker_id, a.first_name, a.last_name, b.id AS donation_id, b.donation_id AS donation_donation_id, b.amount AS donation_amount
FROM spiritual_seekers a JOIN donations b ON a.donation_id = b.id;
```

| spiritual_seeker_id | seeker_id | first_name | last_name | donation_id | donation_donation_id | donation_amount |
|---|---|---|---|---|---|---|
| 100 | 8387537 | Stephanie Collins | Paul Allen | 1000 | 1996936 | 13.49 |
| 101 | 392498 | Janice Johnston | Heather Beasley | 1001 | 10445623 | 25.47 |
| 102 | IVC20Iind | Upal Saha | Audrey Taylor | 1002 | 168 | 19.72 |
| 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | 1003 | supp1 | 12.74 |

This view joins spiritual seekers with donations on the donation_id field, producing records that pair each seeker's personal information with their contribution details. Seeker 100 (Stephanie Collins) is associated with donation 1000 (13.49, pending, anonymous), while seeker 101 (Janice Johnston) is linked to donation 1001 (25.47, received, non-anonymous). Seeker 102 (Upal Saha) corresponds to donation 1002 (19.72, allocated, anonymous), and seeker 103 (Katherine Snyder) to donation 1003 (12.74, pending, non-anonymous). This perspective is particularly useful for participant engagement reports, as it presents the full picture of who contributed, how much, and in what capacity.

### Seeker and Program Relationships

The view v_spiritual_seeker_retreat_program connects spiritual seekers with the retreat programs they participate in, providing a clear view of participant-program alignment.

**View `v_spiritual_seeker_retreat_program`**

```sql
CREATE VIEW v_spiritual_seeker_retreat_program AS
SELECT a.spiritual_seeker_id, a.seeker_id, a.first_name, a.last_name, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM spiritual_seekers a JOIN retreat_programs b ON a.retreat_program_id = b.id;
```

| spiritual_seeker_id | seeker_id | first_name | last_name | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 100 | 8387537 | Stephanie Collins | Paul Allen | 1 | PRO-2198 | Extended Review |
| 101 | 392498 | Janice Johnston | Heather Beasley | 2 | PRO-2205 | Pilot Initiative A |
| 102 | IVC20Iind | Upal Saha | Audrey Taylor | 3 | PRO-2212 | Baseline Model |
| 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | 4 | PRO-2219 | Distributed Cluster |

This view joins spiritual seekers with retreat programs on the retreat_program_id field, producing records that pair each seeker's identity with the program they are enrolled in. Seeker 100 is associated with program PRO-2198 (Extended Review), seeker 101 with PRO-2205 (Pilot Initiative A), seeker 102 with PRO-2212 (Baseline Model), and seeker 103 with PRO-2219 (Distributed Cluster). This one-to-one mapping in the current dataset suggests that each seeker is enrolled in a single program, and the enrollment is tightly coupled with their donation and spiritual path affiliations.

### Seeker and Path Relationships

The view v_spiritual_seeker_spiritual_path links spiritual seekers with the philosophical paths they follow, providing insight into the doctrinal or practice frameworks that guide participant engagement.

**View `v_spiritual_seeker_spiritual_path`**

```sql
CREATE VIEW v_spiritual_seeker_spiritual_path AS
SELECT a.spiritual_seeker_id, a.seeker_id, a.first_name, a.last_name, b.spiritual_path_id AS path_spiritual_path_id, b.path_id AS path_path_id, b.path_name AS path_path_name
FROM spiritual_seekers a JOIN spiritual_paths b ON a.spiritual_path_id = b.spiritual_path_id;
```

| spiritual_seeker_id | seeker_id | first_name | last_name | path_spiritual_path_id | path_path_id | path_path_name |
|---|---|---|---|---|---|---|
| 100 | 8387537 | Stephanie Collins | Paul Allen | 100 | b_VB-EC-15 | Pilot Protocol |
| 101 | 392498 | Janice Johnston | Heather Beasley | 101 | 48753444 | Baseline Programme |
| 102 | IVC20Iind | Upal Saha | Audrey Taylor | 102 | a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Standard A |
| 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder | Susan Wagner | 103 | interpersonal | Adaptive Framework |

This view joins spiritual seekers with spiritual paths on the spiritual_path_id field, producing records that pair each seeker's identity with their path affiliation. Seeker 100 follows path 100 (Pilot Protocol, core principle legacy-core-31, origin regional-origin-54, universal), seeker 101 follows path 101 (Baseline Programme, core principle compact-core-32, origin legacy-origin-55, non-universal), seeker 102 follows path 102 (Distributed Standard A, core principle composite-core-33, origin compact-origin-56, universal), and seeker 103 follows path 103 (Adaptive Framework, core principle primary-core-34, origin composite-origin-57, non-universal). The is_universal flag distinguishes paths that are considered broadly applicable from those tied to specific traditions, offering a useful dimension for program design and participant matching.

### Path and Seeker Relationships

The view v_spiritual_path_spiritual_seeker presents the inverse perspective, showing path records alongside their associated seeker information.

**View `v_spiritual_path_spiritual_seeker`**

```sql
CREATE VIEW v_spiritual_path_spiritual_seeker AS
SELECT a.spiritual_path_id, a.path_id, a.path_name, a.core_principle, b.spiritual_seeker_id AS seeker_spiritual_seeker_id, b.seeker_id AS seeker_seeker_id, b.first_name AS seeker_first_name
FROM spiritual_paths a JOIN spiritual_seekers b ON a.spiritual_seeker_id = b.spiritual_seeker_id;
```

| spiritual_path_id | path_id | path_name | core_principle | seeker_spiritual_seeker_id | seeker_seeker_id | seeker_first_name |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | Pilot Protocol | legacy-core-31 | 100 | 8387537 | Stephanie Collins |
| 101 | 48753444 | Baseline Programme | compact-core-32 | 101 | 392498 | Janice Johnston |
| 102 | a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Standard A | composite-core-33 | 102 | IVC20Iind | Upal Saha |
| 103 | interpersonal | Adaptive Framework | primary-core-34 | 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder |

This view joins spiritual paths with spiritual seekers on the spiritual_seeker_id field, producing records that present each path's details alongside the seeker who follows it. Path 100 (Pilot Protocol) is followed by seeker 100, path 101 (Baseline Programme) by seeker 101, path 102 (Distributed Standard A) by seeker 102, and path 103 (Adaptive Framework) by seeker 103. This perspective is useful for path administrators who need to understand the participant base for each philosophical framework, and for tracking how many seekers follow each path over time.

### Path and Program Relationships

The view v_spiritual_path_retreat_program connects spiritual paths with the retreat programs that incorporate them, revealing how philosophical frameworks are embedded in program offerings.

**View `v_spiritual_path_retreat_program`**

```sql
CREATE VIEW v_spiritual_path_retreat_program AS
SELECT a.spiritual_path_id, a.path_id, a.path_name, a.core_principle, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM spiritual_paths a JOIN retreat_programs b ON a.retreat_program_id = b.id;
```

| spiritual_path_id | path_id | path_name | core_principle | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-15 | Pilot Protocol | legacy-core-31 | 1 | PRO-2198 | Extended Review |
| 101 | 48753444 | Baseline Programme | compact-core-32 | 2 | PRO-2205 | Pilot Initiative A |
| 102 | a000e9cc-9bac-11eb-a8a2-19ed5c03f8d3 | Distributed Standard A | composite-core-33 | 3 | PRO-2212 | Baseline Model |
| 103 | interpersonal | Adaptive Framework | primary-core-34 | 4 | PRO-2219 | Distributed Cluster |

This view joins spiritual paths with retreat programs on the retreat_program_id field, producing records that pair each path with the program that utilizes it. Path 100 (Pilot Protocol) is associated with program PRO-2198 (Extended Review), path 101 (Baseline Programme) with PRO-2205 (Pilot Initiative A), path 102 (Distributed Standard A) with PRO-2212 (Baseline Model), and path 103 (Adaptive Framework) with PRO-2219 (Distributed Cluster). This alignment suggests that each program is designed around a specific spiritual path, and the path's core principles inform the program's structure and content.

### Organization and Program Relationships

The view v_spiritual_organization_retreat_program provides an alternative perspective on the organization-program relationship, presenting organization records alongside their associated program details.

**View `v_spiritual_organization_retreat_program`**

```sql
CREATE VIEW v_spiritual_organization_retreat_program AS
SELECT a.spiritual_organization_id, a.org_id, a.org_name, a.founding_date, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM spiritual_organizations a JOIN retreat_programs b ON a.retreat_program_id = b.id;
```

| spiritual_organization_id | org_id | org_name | founding_date | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 2023-06-24T05:03:00 | 1 | PRO-2198 | Extended Review |
| 1001 | 1717 | Pilot Initiative A | 2024-11-08T12:20:00 | 2 | PRO-2205 | Pilot Initiative A |
| 1002 | 69437 | Baseline Model | 2025-04-19T19:37:00 | 3 | PRO-2212 | Baseline Model |
| 1003 | m16 | Distributed Cluster | 2022-09-03T02:54:00 | 4 | PRO-2219 | Distributed Cluster |

This view joins spiritual organizations with retreat programs on the retreat_program_id field, producing records that pair each organization's founding date, mission statement, and non-profit status with its program details. Organization 1000 (Extended Review, founded 2023-06-24, non-profit) sponsors program PRO-2198, organization 1001 (Pilot Initiative A, founded 2024-11-08, not non-profit) sponsors PRO-2205, organization 1002 (Baseline Model, founded 2025-04-19, non-profit) sponsors PRO-2212, and organization 1003 (Distributed Cluster, founded 2022-09-03, not non-profit) sponsors PRO-2219. This view is particularly useful for organizational reporting, as it consolidates institutional and programmatic information in a single record.

### Organization and Donation Relationships

The view v_spiritual_organization_donation links spiritual organizations with their associated donations, providing a clear picture of the financial resources managed by each institution.

**View `v_spiritual_organization_donation`**

```sql
CREATE VIEW v_spiritual_organization_donation AS
SELECT a.spiritual_organization_id, a.org_id, a.org_name, a.founding_date, b.id AS donation_id, b.donation_id AS donation_donation_id, b.amount AS donation_amount
FROM spiritual_organizations a JOIN donations b ON a.donation_id = b.id;
```

| spiritual_organization_id | org_id | org_name | founding_date | donation_id | donation_donation_id | donation_amount |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 2023-06-24T05:03:00 | 1000 | 1996936 | 13.49 |
| 1001 | 1717 | Pilot Initiative A | 2024-11-08T12:20:00 | 1001 | 10445623 | 25.47 |
| 1002 | 69437 | Baseline Model | 2025-04-19T19:37:00 | 1002 | 168 | 19.72 |
| 1003 | m16 | Distributed Cluster | 2022-09-03T02:54:00 | 1003 | supp1 | 12.74 |

This view joins spiritual organizations with donations on the spiritual_organization_id field, producing records that pair each organization's details with its donation records. Organization 1000 is linked to donation 1000 (13.49, pending, anonymous), organization 1001 to donation 1001 (25.47, received, non-anonymous), organization 1002 to donation 1002 (19.72, allocated, anonymous), and organization 1003 to donation 1003 (12.74, pending, non-anonymous). This view enables financial oversight at the organizational level, allowing administrators to track total contributions, processing status, and anonymity patterns for each institution.

### Organization and Seeker Relationships

The view v_spiritual_organization_spiritual_seeker connects spiritual organizations with the seekers they serve, providing a comprehensive view of participant engagement at the institutional level.

**View `v_spiritual_organization_spiritual_seeker`**

```sql
CREATE VIEW v_spiritual_organization_spiritual_seeker AS
SELECT a.spiritual_organization_id, a.org_id, a.org_name, a.founding_date, b.spiritual_seeker_id AS seeker_spiritual_seeker_id, b.seeker_id AS seeker_seeker_id, b.first_name AS seeker_first_name
FROM spiritual_organizations a JOIN spiritual_seekers b ON a.spiritual_seeker_id = b.spiritual_seeker_id;
```

| spiritual_organization_id | org_id | org_name | founding_date | seeker_spiritual_seeker_id | seeker_seeker_id | seeker_first_name |
|---|---|---|---|---|---|---|
| 1000 | 790471 | Extended Review | 2023-06-24T05:03:00 | 100 | 8387537 | Stephanie Collins |
| 1001 | 1717 | Pilot Initiative A | 2024-11-08T12:20:00 | 101 | 392498 | Janice Johnston |
| 1002 | 69437 | Baseline Model | 2025-04-19T19:37:00 | 102 | IVC20Iind | Upal Saha |
| 1003 | m16 | Distributed Cluster | 2022-09-03T02:54:00 | 103 | c7df85b0-8fcd-11eb-924d-9cd76263cbd0 | Katherine Snyder |

This view joins spiritual organizations with spiritual seekers on the spiritual_seeker_id field, producing records that pair each organization's details with its associated seeker information. Organization 1000 is linked to seeker 100 (Stephanie Collins, member since 2022-01-12, anonymous), organization 1001 to seeker 101 (Janice Johnston, member since 2023-06-23, non-anonymous), organization 1002 to seeker 102 (Upal Saha, member since 2024-11-07, anonymous), and organization 1003 to seeker 103 (Katherine Snyder, member since 2025-04-18, non-anonymous). This view is essential for organizational outreach and engagement planning, as it consolidates institutional and participant information in a single record, enabling targeted communication and program recommendations.

### Synthesis

The retreat program administration domain is built on five foundational record types that together capture the full lifecycle of participant engagement, from initial affiliation through financial contribution to program participation and philosophical alignment. The base tables establish the core entities—programs, donations, seekers, paths, and organizations—while the views provide the joined perspectives necessary for operational reporting and analysis. Each view answers a specific question about the relationships between entities, from organizational sponsorship and financial tracking to participant-path alignment and program enrollment. The consistent use of identifier fields across tables ensures that records can be reliably joined, and the presence of flags such as is_annual, is_anonymous, is_non_profit, and is_universal provides additional dimensions for filtering and segmentation. Together, these records and their relationships form a coherent framework for managing the complex interplay between institutions, participants, finances, and philosophical frameworks in the retreat program ecosystem.

## Data appendix

**View `v_donation_retreat_program`**

```sql
CREATE VIEW v_donation_retreat_program AS
SELECT a.id, a.donation_id, a.amount, a.currency_code, b.id AS program_id, b.program_identifier AS program_program_identifier, b.program_name AS program_program_name
FROM donations a JOIN retreat_programs b ON a.retreat_program_id = b.id;
```

| id | donation_id | amount | currency_code | program_id | program_program_identifier | program_program_name |
|---|---|---|---|---|---|---|
| 1000 | 1996936 | 13.49 | gd_fp_eu_acc3 | 1 | PRO-2198 | Extended Review |
| 1001 | 10445623 | 25.47 | managing-resources | 2 | PRO-2205 | Pilot Initiative A |
| 1002 | 168 | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 3 | PRO-2212 | Baseline Model |
| 1003 | supp1 | 12.74 | 10445649 | 4 | PRO-2219 | Distributed Cluster |
