## Program Architecture and Delivery

Mental health education operates as a structured delivery system in which programs, speakers, audiences, and venues are coordinated to reach young people with evidence-informed content. The core record of this coordination is the education program itself, which captures what is being taught, to whom, where, and by whom. Each program carries a unique identifier such as PRO-2198 or PRO-2219, a title like Legacy Review D or Integrated Cluster A, and metadata that describes its scope and lifecycle. Programs are classified by the age group they target—middle school, high school, or college—and by their delivery mode, which is either in-school or community-wide. A boolean flag indicates whether the program is evidence-based, and date fields record the planned start and end, while a status column tracks whether the program is planned, running, completed, or cancelled.

**Table `mental_health_education_programs`**

| mental_health_education_program_id | program_identifier | program_title | target_age_group | delivery_mode | is_evidence_based | start_date | end_date | status | trained_speaker_id | youth_demographic_id | educational_venue_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | middle school | in-school | false | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | planned | 1 | 1 | 100 |
| 2 | PRO-2205 | Regional Initiative | high school | community-wide | true | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | running | 2 | 2 | 101 |
| 3 | PRO-2212 | Seasonal Model | college | in-school | false | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | completed | 3 | 3 | 102 |
| 4 | PRO-2219 | Integrated Cluster A | middle school | community-wide | true | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | cancelled | 4 | 4 | 103 |

The program record also anchors three foreign-key relationships that connect it to the people, audiences, and places involved in delivery. A trained speaker is assigned to each program, a youth demographic defines the target audience, and an educational venue specifies where the sessions take place. These relationships are not merely administrative; they determine the content focus, the logistical constraints, and the measurable reach of each initiative.

**Table `trained_speakers`**

| id | speaker_identifier | full_name | training_completion_date | specialization | presentation_count | is_available | bio_url | mental_health_issue_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | SPE-2108 | Theodore Mcgrath | 2024-11-27 | mood disorders | 54 | true | http://en.wikipedia.org/wiki/Arroyo_toad | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | SPE-2113 | Account Name | 2025-04-11 | suicide ideation | 8 | false | https://bugs.launchpad.net/rally/+bug/1596756 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | SPE-2118 | Saipan International Airport | 2022-09-22 | eating disorders | 0 | true | https://ecocyc.org/gene?orgid=ECOLI&id=EG10352 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | SPE-2123 | Norma Fisher | 2023-02-06 | addictive behavior | 56 | false | https://www.nature.com/articles/nphoton.2012.92 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Trained speakers are the human delivery layer of the system. Each speaker record includes a name, a training completion date, a specialization area, and a presentation count that reflects their experience level. The specialization field—mood disorders, suicide ideation, eating disorders, addictive behavior—indicates the domain of expertise the speaker brings to a program. An availability flag signals whether the speaker is currently assigned to active work, and a bio URL provides external context about their background. Speaker SPE-2108, Theodore Mcgrath, completed training on 2024-11-27, specializes in mood disorders, has delivered 54 presentations, and is currently available. By contrast, speaker SPE-2113, listed as Account Name, completed training more recently on 2025-04-11, specializes in suicide ideation, has only eight presentations to their name, and is not currently available.

**Table `youth_demographics`**

| youth_demographic_id | demographic_identifier | age_range_start | age_range_end | role | institution_type | total_reached | mental_health_education_program_id | mental_health_issue_id |
|---|---|---|---|---|---|---|---|---|
| 1 | DEM-2306 | 34 | 19 | student | middle school | 26 | 1 | 1 |
| 2 | DEM-2313 | 37 | 26 | teacher | high school | 9 | 2 | 2 |
| 3 | DEM-2320 | 40 | 33 | family | college | 28 | 3 | 3 |
| 4 | DEM-2327 | 43 | 40 | caregiver | community | 73 | 4 | 4 |

Youth demographics define the audience segment each program is designed to reach. The demographic record captures the age range of the target group, the role the audience members play within the institution (student, teacher, family, caregiver), the type of institution (middle school, high school, college, community), and the total number of individuals reached by the program. The demographic record also links to the mental health issue that the program addresses, creating a direct bridge between audience composition and clinical content focus. For example, demographic DEM-2306 targets students in middle school with a total reach of 26 individuals, while demographic DEM-2327 targets caregivers in community settings with a total reach of 73 individuals.

**Table `educational_venues`**

| educational_venue_id | venue_identifier | venue_name | address | venue_type | capacity | is_accessible | mental_health_education_program_id | youth_demographic_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | VEN-2731 | Legacy Review D | distributed-address-72 | school | 32 | true | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | VEN-2734 | Regional Initiative | baseline-address-73 | community center | 41 | false | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | VEN-2737 | Seasonal Model | pilot-address-74 | conference hall | 50 | true | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | VEN-2740 | Integrated Cluster A | extended-address-75 | online | 59 | false | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Educational venues provide the physical or virtual space where programs are delivered. Each venue record includes a name, an address, a venue type (school, community center, conference hall, online), a capacity figure, and an accessibility flag. The venue capacity ranges from 32 seats at the Legacy Review D school venue to 59 at the Integrated Cluster A online venue. Accessibility is not universal: the Regional Initiative venue at a community center is marked as not accessible, while the Seasonal Model venue at a conference hall is accessible. The venue record is linked to both the program and the youth demographic, ensuring that logistical planning aligns with audience needs.

## Mental Health Issue Classification

The clinical content of mental health education is organized around a taxonomy of mental health issues. Each issue record carries a code, a name, a severity level (low, medium, or high), a treatability flag, a prevalence rate among teens expressed as a percentage, and a barrier to treatment that identifies the primary obstacle preventing affected individuals from seeking help.

**Table `mental_health_issues`**

| mental_health_issue_id | issue_code | issue_name | severity_level | is_treatable | prevalence_in_teens | barrier_to_treatment | youth_demographic_id |
|---|---|---|---|---|---|---|---|
| 1 | 505995 | Distributed Review | low | true | 17.95 | stigma | 1 |
| 2 | Harga | Adaptive Initiative D | medium | false | 21.90 | shame | 2 |
| 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model | high | true | 25.85 | lack of awareness | 3 |
| 4 | 4060640 | Composite Cluster | low | false | 29.80 | stigma | 4 |

The issue codes vary in format: some are numeric strings like 505995, others are descriptive phrases like Harga, and some are UUIDs such as 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3. The prevalence_in_teens field quantifies how common each issue is among adolescent populations, ranging from 17.95 percent for the Distributed Review issue to 29.80 percent for the Composite Cluster issue. The barrier_to_treatment field identifies stigma as the primary obstacle for two of the four issues, shame for one, and lack of awareness for the fourth. The is_treatable flag indicates clinical treatability, with Distributed Review and Primary Model marked as treatable, while Adaptive Initiative D and Composite Cluster are marked as not treatable.

The programs_issues and speakers_programs tables serve as junction records that enable many-to-many relationships between programs and mental health issues, and between programs and trained speakers, respectively. These junction tables allow a single program to address multiple issues and a single speaker to deliver multiple programs, reflecting the complexity of real-world mental health education where content and personnel are shared across initiatives.

**Table `programs_issues`**

| mental_health_education_program_id | mental_health_issue_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `speakers_programs`**

| trained_speaker_id | mental_health_education_program_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

A third junction table, issues_programs, provides an additional linkage layer between mental health issues and education programs, supporting flexible program design where issues can be mapped to programs through multiple association paths.

**Table `issues_programs`**

| mental_health_issue_id | mental_health_education_program_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Prevention Initiative Framework

Prevention initiatives represent the strategic layer of the mental health education ecosystem. Each initiative is tied to a specific education program and a specific mental health issue, and it defines the behavioral target (help-seeking, advocacy, or intervention), whether the initiative follows best practices, and whether it qualifies speakers for training.

**Table `prevention_initiatives`**

| id | initiative_identifier | initiative_name | launch_date | target_behavior | is_best_practice | qualifies_for_training | mental_health_education_program_id | mental_health_issue_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | INI-2234 | Baseline Corridor D | 2022-05-17 | help-seeking | true | true | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | INI-2237 | Distributed Series | 2023-10-01 | advocacy | false | false | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | INI-2240 | Adaptive Assessment | 2024-03-12 | intervention | true | true | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | INI-2243 | Primary Survey A | 2025-08-23 | help-seeking | false | false | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The Baseline Corridor D initiative (INI-2234) targets help-seeking behavior, follows best practices, and qualifies for training, making it a high-priority intervention. The Distributed Series initiative (INI-2237) targets advocacy, does not follow best practices, and does not qualify for training. The Adaptive Assessment initiative (INI-2240) targets intervention, follows best practices, and qualifies for training. The Primary Survey A initiative (INI-2243) targets help-seeking, does not follow best practices, and does not qualify for training. These distinctions matter for resource allocation and for determining which programs receive institutional support and which speakers are eligible for advanced training.

## Cross-Referenced Program Views

The relational structure of the system is best understood through its joined views, which combine data from multiple tables to answer specific operational questions. Each view represents a particular analytical lens on the program delivery ecosystem.

The view that links education programs to their assigned speakers answers the question of which speaker is responsible for which program and what expertise they bring. It joins the program record with the speaker record, surfacing the speaker's specialization, presentation count, and availability alongside the program's title, target age group, and status.

**View `v_mental_health_education_program_trained_speaker`**

```sql
CREATE VIEW v_mental_health_education_program_trained_speaker AS
SELECT a.mental_health_education_program_id, a.program_identifier, a.program_title, a.target_age_group, b.id AS speaker_id, b.speaker_identifier AS speaker_speaker_identifier, b.full_name AS speaker_full_name
FROM mental_health_education_programs a JOIN trained_speakers b ON a.trained_speaker_id = b.id;
```

| mental_health_education_program_id | program_identifier | program_title | target_age_group | speaker_id | speaker_speaker_identifier | speaker_full_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | middle school | 1 | SPE-2108 | Theodore Mcgrath |
| 2 | PRO-2205 | Regional Initiative | high school | 2 | SPE-2113 | Account Name |
| 3 | PRO-2212 | Seasonal Model | college | 3 | SPE-2118 | Saipan International Airport |
| 4 | PRO-2219 | Integrated Cluster A | middle school | 4 | SPE-2123 | Norma Fisher |

In this view, program PRO-2198 (Legacy Review D) is delivered by speaker SPE-2108 (Theodore Mcgrath), who specializes in mood disorders and has 54 presentations. Program PRO-2205 (Regional Initiative) is delivered by speaker SPE-2113 (Account Name), who specializes in suicide ideation and has only 8 presentations. The view makes it immediately apparent that speaker experience varies widely across programs, with presentation counts ranging from 0 to 56.

The view that links education programs to their target youth demographics answers the question of which audience segment each program is designed to reach and how many individuals are expected to be reached. It joins the program record with the demographic record, surfacing the age range, role, institution type, and total reach alongside the program's delivery mode and status.

**View `v_mental_health_education_program_youth_demographic`**

```sql
CREATE VIEW v_mental_health_education_program_youth_demographic AS
SELECT a.mental_health_education_program_id, a.program_identifier, a.program_title, a.target_age_group, b.youth_demographic_id AS demographic_youth_demographic_id, b.demographic_identifier AS demographic_demographic_identifier, b.age_range_start AS demographic_age_range_start
FROM mental_health_education_programs a JOIN youth_demographics b ON a.youth_demographic_id = b.youth_demographic_id;
```

| mental_health_education_program_id | program_identifier | program_title | target_age_group | demographic_youth_demographic_id | demographic_demographic_identifier | demographic_age_range_start |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | middle school | 1 | DEM-2306 | 34 |
| 2 | PRO-2205 | Regional Initiative | high school | 2 | DEM-2313 | 37 |
| 3 | PRO-2212 | Seasonal Model | college | 3 | DEM-2320 | 40 |
| 4 | PRO-2219 | Integrated Cluster A | middle school | 4 | DEM-2327 | 43 |

In this view, program PRO-2198 targets students in middle school with a total reach of 26 individuals, while program PRO-2219 targets caregivers in community settings with a total reach of 73 individuals. The age range fields show an unusual ordering where the start value exceeds the end value (for example, 34 to 19), which may reflect a data entry convention or a specific encoding of age bands that practitioners should verify.

The view that links education programs to their associated mental health issues provides a clinical content overlay on the program record. It joins the program with the issue record, surfacing the issue code, severity level, treatability, prevalence, and barrier to treatment alongside the program's title and status.

**View `v_mental_health_education_program_mental_health_issue_detail`**

```sql
CREATE VIEW v_mental_health_education_program_mental_health_issue_detail AS
SELECT a.mental_health_education_program_id, a.program_identifier, a.program_title, b.mental_health_issue_id AS issue_mental_health_issue_id, b.issue_code AS issue_issue_code, b.issue_name AS issue_issue_name
FROM mental_health_education_programs a
  JOIN programs_issues j ON j.mental_health_education_program_id = a.mental_health_education_program_id
  JOIN mental_health_issues b ON b.mental_health_issue_id = j.mental_health_issue_id;
```

| mental_health_education_program_id | program_identifier | program_title | issue_mental_health_issue_id | issue_issue_code | issue_issue_name |
|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | 1 | 505995 | Distributed Review |
| 1 | PRO-2198 | Legacy Review D | 2 | Harga | Adaptive Initiative D |
| 2 | PRO-2205 | Regional Initiative | 2 | Harga | Adaptive Initiative D |
| 2 | PRO-2205 | Regional Initiative | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 3 | PRO-2212 | Seasonal Model | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 3 | PRO-2212 | Seasonal Model | 4 | 4060640 | Composite Cluster |
| 4 | PRO-2219 | Integrated Cluster A | 4 | 4060640 | Composite Cluster |
| 4 | PRO-2219 | Integrated Cluster A | 1 | 505995 | Distributed Review |

In this view, program PRO-2198 addresses the Distributed Review issue (code 505995), which has low severity, is treatable, affects 17.95 percent of teens, and faces stigma as a barrier. Program PRO-2212 addresses the Primary Model issue (code 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3), which has high severity, is treatable, affects 25.85 percent of teens, and faces lack of awareness as a barrier. The combination of severity and treatability creates a matrix that helps practitioners prioritize which programs warrant the most resources.

The view that links education programs to their educational venues answers the question of where each program is delivered and what logistical constraints apply. It joins the program with the venue record, surfacing the venue name, address, type, capacity, and accessibility alongside the program's title and delivery mode.

**View `v_mental_health_education_program_educational_venue`**

```sql
CREATE VIEW v_mental_health_education_program_educational_venue AS
SELECT a.mental_health_education_program_id, a.program_identifier, a.program_title, a.target_age_group, b.educational_venue_id AS venue_educational_venue_id, b.venue_identifier AS venue_venue_identifier, b.venue_name AS venue_venue_name
FROM mental_health_education_programs a JOIN educational_venues b ON a.educational_venue_id = b.educational_venue_id;
```

| mental_health_education_program_id | program_identifier | program_title | target_age_group | venue_educational_venue_id | venue_venue_identifier | venue_venue_name |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Legacy Review D | middle school | 100 | VEN-2731 | Legacy Review D |
| 2 | PRO-2205 | Regional Initiative | high school | 101 | VEN-2734 | Regional Initiative |
| 3 | PRO-2212 | Seasonal Model | college | 102 | VEN-2737 | Seasonal Model |
| 4 | PRO-2219 | Integrated Cluster A | middle school | 103 | VEN-2740 | Integrated Cluster A |

In this view, program PRO-2198 is delivered at the Legacy Review D venue (VEN-2731), a school with 32 seats that is accessible. Program PRO-2205 is delivered at the Regional Initiative venue (VEN-2734), a community center with 41 seats that is not accessible. The venue type ranges from traditional school settings to online platforms, reflecting the diversity of delivery environments in modern mental health education.

The reverse view—linking trained speakers to their education programs—answers the question of which programs a given speaker is assigned to and what the clinical and logistical context of each assignment is. It joins the speaker record with the program record, surfacing the program's title, target age group, delivery mode, evidence-based status, and dates alongside the speaker's name, specialization, and presentation count.

**View `v_trained_speaker_mental_health_education_program_detail`**

```sql
CREATE VIEW v_trained_speaker_mental_health_education_program_detail AS
SELECT a.id, a.speaker_identifier, a.full_name, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM trained_speakers a
  JOIN speakers_programs j ON j.trained_speaker_id = a.id
  JOIN mental_health_education_programs b ON b.mental_health_education_program_id = j.mental_health_education_program_id;
```

| id | speaker_identifier | full_name | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|
| 1 | SPE-2108 | Theodore Mcgrath | 1 | PRO-2198 | Legacy Review D |
| 1 | SPE-2108 | Theodore Mcgrath | 2 | PRO-2205 | Regional Initiative |
| 2 | SPE-2113 | Account Name | 2 | PRO-2205 | Regional Initiative |
| 2 | SPE-2113 | Account Name | 3 | PRO-2212 | Seasonal Model |
| 3 | SPE-2118 | Saipan International Airport | 3 | PRO-2212 | Seasonal Model |
| 3 | SPE-2118 | Saipan International Airport | 4 | PRO-2219 | Integrated Cluster A |
| 4 | SPE-2123 | Norma Fisher | 4 | PRO-2219 | Integrated Cluster A |
| 4 | SPE-2123 | Norma Fisher | 1 | PRO-2198 | Legacy Review D |

In this view, speaker SPE-2108 (Theodore Mcgrath) is assigned to program PRO-2198 (Legacy Review D), which targets middle school students and is delivered in-school. Speaker SPE-2123 (Norma Fisher) is assigned to program PRO-2219 (Integrated Cluster A), which targets middle school students and is delivered community-wide. The view makes it possible to assess speaker workload and specialization alignment across their full portfolio of assignments.

The view that links trained speakers to mental health issues answers the question of which clinical topics each speaker is equipped to address. It joins the speaker with the issue record, surfacing the issue code, name, severity, treatability, prevalence, and barrier to treatment alongside the speaker's name, specialization, and presentation count.

**View `v_trained_speaker_mental_health_issue`**

```sql
CREATE VIEW v_trained_speaker_mental_health_issue AS
SELECT a.id, a.speaker_identifier, a.full_name, a.training_completion_date, b.mental_health_issue_id AS issue_mental_health_issue_id, b.issue_code AS issue_issue_code, b.issue_name AS issue_issue_name
FROM trained_speakers a JOIN mental_health_issues b ON a.mental_health_issue_id = b.mental_health_issue_id;
```

| id | speaker_identifier | full_name | training_completion_date | issue_mental_health_issue_id | issue_issue_code | issue_issue_name |
|---|---|---|---|---|---|---|
| 1 | SPE-2108 | Theodore Mcgrath | 2024-11-27 | 1 | 505995 | Distributed Review |
| 2 | SPE-2113 | Account Name | 2025-04-11 | 2 | Harga | Adaptive Initiative D |
| 3 | SPE-2118 | Saipan International Airport | 2022-09-22 | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 4 | SPE-2123 | Norma Fisher | 2023-02-06 | 4 | 4060640 | Composite Cluster |

In this view, speaker SPE-2108 (Theodore Mcgrath) is associated with the Distributed Review issue (code 505995), which has low severity and a prevalence of 17.95 percent. Speaker SPE-2123 (Norma Fisher) is associated with the Composite Cluster issue (code 4060640), which has low severity but the highest prevalence at 29.80 percent. The specialization field on the speaker record should align with the issue name, and discrepancies between the two fields would indicate a potential mismatch in speaker assignment that requires review.

The view that links youth demographics to education programs provides a demographic-centric perspective on the program portfolio. It joins the demographic record with the program record, surfacing the program's title, target age group, delivery mode, evidence-based status, and dates alongside the demographic's age range, role, institution type, and total reach.

**View `v_youth_demographic_mental_health_education_program`**

```sql
CREATE VIEW v_youth_demographic_mental_health_education_program AS
SELECT a.youth_demographic_id, a.demographic_identifier, a.age_range_start, a.age_range_end, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM youth_demographics a JOIN mental_health_education_programs b ON a.mental_health_education_program_id = b.mental_health_education_program_id;
```

| youth_demographic_id | demographic_identifier | age_range_start | age_range_end | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|---|
| 1 | DEM-2306 | 34 | 19 | 1 | PRO-2198 | Legacy Review D |
| 2 | DEM-2313 | 37 | 26 | 2 | PRO-2205 | Regional Initiative |
| 3 | DEM-2320 | 40 | 33 | 3 | PRO-2212 | Seasonal Model |
| 4 | DEM-2327 | 43 | 40 | 4 | PRO-2219 | Integrated Cluster A |

In this view, demographic DEM-2306 (students in middle school, reach of 26) is linked to program PRO-2198 (Legacy Review D), which is planned and delivered in-school. Demographic DEM-2327 (caregivers in community settings, reach of 73) is linked to program PRO-2219 (Integrated Cluster A), which is cancelled and delivered community-wide. The view is useful for understanding whether the reach figures align with the program's delivery mode and target age group.

The view that links youth demographics to mental health issues answers the question of which clinical topics are most relevant to each audience segment. It joins the demographic with the issue record, surfacing the issue code, name, severity, treatability, prevalence, and barrier to treatment alongside the demographic's age range, role, institution type, and total reach.

**View `v_youth_demographic_mental_health_issue`**

```sql
CREATE VIEW v_youth_demographic_mental_health_issue AS
SELECT a.youth_demographic_id, a.demographic_identifier, a.age_range_start, a.age_range_end, b.mental_health_issue_id AS issue_mental_health_issue_id, b.issue_code AS issue_issue_code, b.issue_name AS issue_issue_name
FROM youth_demographics a JOIN mental_health_issues b ON a.mental_health_issue_id = b.mental_health_issue_id;
```

| youth_demographic_id | demographic_identifier | age_range_start | age_range_end | issue_mental_health_issue_id | issue_issue_code | issue_issue_name |
|---|---|---|---|---|---|---|
| 1 | DEM-2306 | 34 | 19 | 1 | 505995 | Distributed Review |
| 2 | DEM-2313 | 37 | 26 | 2 | Harga | Adaptive Initiative D |
| 3 | DEM-2320 | 40 | 33 | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 4 | DEM-2327 | 43 | 40 | 4 | 4060640 | Composite Cluster |

In this view, demographic DEM-2306 (students, middle school) is linked to the Distributed Review issue (code 505995), which has low severity and a stigma barrier. Demographic DEM-2327 (caregivers, community) is linked to the Composite Cluster issue (code 4060640), which has low severity and a stigma barrier. The combination of audience role and issue barrier suggests that stigma is a cross-cutting challenge that affects multiple audience segments and requires tailored messaging strategies.

The view that links mental health issues to education programs provides an issue-centric perspective on the program portfolio. It joins the issue record with the program record, surfacing the program's title, target age group, delivery mode, evidence-based status, and dates alongside the issue's code, name, severity, treatability, prevalence, and barrier to treatment.

**View `v_mental_health_issue_mental_health_education_program_detail`**

```sql
CREATE VIEW v_mental_health_issue_mental_health_education_program_detail AS
SELECT a.mental_health_issue_id, a.issue_code, a.issue_name, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM mental_health_issues a
  JOIN issues_programs j ON j.mental_health_issue_id = a.mental_health_issue_id
  JOIN mental_health_education_programs b ON b.mental_health_education_program_id = j.mental_health_education_program_id;
```

| mental_health_issue_id | issue_code | issue_name | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|
| 1 | 505995 | Distributed Review | 1 | PRO-2198 | Legacy Review D |
| 1 | 505995 | Distributed Review | 2 | PRO-2205 | Regional Initiative |
| 2 | Harga | Adaptive Initiative D | 2 | PRO-2205 | Regional Initiative |
| 2 | Harga | Adaptive Initiative D | 3 | PRO-2212 | Seasonal Model |
| 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model | 3 | PRO-2212 | Seasonal Model |
| 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model | 4 | PRO-2219 | Integrated Cluster A |
| 4 | 4060640 | Composite Cluster | 4 | PRO-2219 | Integrated Cluster A |
| 4 | 4060640 | Composite Cluster | 1 | PRO-2198 | Legacy Review D |

In this view, the Distributed Review issue (code 505995) is addressed by program PRO-2198 (Legacy Review D), which targets middle school students and is delivered in-school. The Primary Model issue (code 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3) is addressed by program PRO-2212 (Seasonal Model), which targets college students and is delivered in-school. The view makes it possible to assess whether the severity of an issue is matched by the intensity and scope of the program designed to address it.

The view that links mental health issues to youth demographics answers the question of which audience segments are most affected by each clinical topic. It joins the issue with the demographic record, surfacing the demographic's age range, role, institution type, and total reach alongside the issue's code, name, severity, treatability, prevalence, and barrier to treatment.

**View `v_mental_health_issue_youth_demographic`**

```sql
CREATE VIEW v_mental_health_issue_youth_demographic AS
SELECT a.mental_health_issue_id, a.issue_code, a.issue_name, a.severity_level, b.youth_demographic_id AS demographic_youth_demographic_id, b.demographic_identifier AS demographic_demographic_identifier, b.age_range_start AS demographic_age_range_start
FROM mental_health_issues a JOIN youth_demographics b ON a.youth_demographic_id = b.youth_demographic_id;
```

| mental_health_issue_id | issue_code | issue_name | severity_level | demographic_youth_demographic_id | demographic_demographic_identifier | demographic_age_range_start |
|---|---|---|---|---|---|---|
| 1 | 505995 | Distributed Review | low | 1 | DEM-2306 | 34 |
| 2 | Harga | Adaptive Initiative D | medium | 2 | DEM-2313 | 37 |
| 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model | high | 3 | DEM-2320 | 40 |
| 4 | 4060640 | Composite Cluster | low | 4 | DEM-2327 | 43 |

In this view, the Distributed Review issue (code 505995) is linked to demographic DEM-2306 (students, middle school, reach of 26), while the Composite Cluster issue (code 4060640) is linked to demographic DEM-2327 (caregivers, community, reach of 73). The reach figures suggest that community-based caregiver programs may have broader impact than school-based student programs, a finding that could inform resource allocation decisions.

The view that links educational venues to education programs provides a venue-centric perspective on the program portfolio. It joins the venue record with the program record, surfacing the program's title, target age group, delivery mode, evidence-based status, and dates alongside the venue's name, address, type, capacity, and accessibility.

**View `v_educational_venue_mental_health_education_program`**

```sql
CREATE VIEW v_educational_venue_mental_health_education_program AS
SELECT a.educational_venue_id, a.venue_identifier, a.venue_name, a.address, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM educational_venues a JOIN mental_health_education_programs b ON a.mental_health_education_program_id = b.mental_health_education_program_id;
```

| educational_venue_id | venue_identifier | venue_name | address | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|---|
| 100 | VEN-2731 | Legacy Review D | distributed-address-72 | 1 | PRO-2198 | Legacy Review D |
| 101 | VEN-2734 | Regional Initiative | baseline-address-73 | 2 | PRO-2205 | Regional Initiative |
| 102 | VEN-2737 | Seasonal Model | pilot-address-74 | 3 | PRO-2212 | Seasonal Model |
| 103 | VEN-2740 | Integrated Cluster A | extended-address-75 | 4 | PRO-2219 | Integrated Cluster A |

In this view, venue VEN-2731 (Legacy Review D, school, capacity 32) hosts program PRO-2198 (Legacy Review D), which targets middle school students. Venue VEN-2740 (Integrated Cluster A, online, capacity 59) hosts program PRO-2219 (Integrated Cluster A), which targets middle school students. The view makes it possible to assess whether venue capacity is sufficient for the expected audience size and whether accessibility constraints might limit participation.

The view that links educational venues to youth demographics answers the question of which audience segments are served at each venue. It joins the venue with the demographic record, surfacing the demographic's age range, role, institution type, and total reach alongside the venue's name, address, type, capacity, and accessibility.

**View `v_educational_venue_youth_demographic`**

```sql
CREATE VIEW v_educational_venue_youth_demographic AS
SELECT a.educational_venue_id, a.venue_identifier, a.venue_name, a.address, b.youth_demographic_id AS demographic_youth_demographic_id, b.demographic_identifier AS demographic_demographic_identifier, b.age_range_start AS demographic_age_range_start
FROM educational_venues a JOIN youth_demographics b ON a.youth_demographic_id = b.youth_demographic_id;
```

| educational_venue_id | venue_identifier | venue_name | address | demographic_youth_demographic_id | demographic_demographic_identifier | demographic_age_range_start |
|---|---|---|---|---|---|---|
| 100 | VEN-2731 | Legacy Review D | distributed-address-72 | 1 | DEM-2306 | 34 |
| 101 | VEN-2734 | Regional Initiative | baseline-address-73 | 2 | DEM-2313 | 37 |
| 102 | VEN-2737 | Seasonal Model | pilot-address-74 | 3 | DEM-2320 | 40 |
| 103 | VEN-2740 | Integrated Cluster A | extended-address-75 | 4 | DEM-2327 | 43 |

In this view, venue VEN-2731 (Legacy Review D, school) serves demographic DEM-2306 (students, middle school, reach of 26), while venue VEN-2740 (Integrated Cluster A, online) serves demographic DEM-2327 (caregivers, community, reach of 73). The alignment between venue type and demographic role is generally consistent: school venues serve students, while online venues serve caregivers in community settings.

The view that links prevention initiatives to education programs provides a strategic overlay on the program portfolio. It joins the initiative record with the program record, surfacing the program's title, target age group, delivery mode, evidence-based status, and dates alongside the initiative's name, launch date, target behavior, best practice status, and training qualification.

**View `v_prevention_initiative_mental_health_education_program`**

```sql
CREATE VIEW v_prevention_initiative_mental_health_education_program AS
SELECT a.id, a.initiative_identifier, a.initiative_name, a.launch_date, b.mental_health_education_program_id AS program_mental_health_education_program_id, b.program_identifier AS program_program_identifier, b.program_title AS program_program_title
FROM prevention_initiatives a JOIN mental_health_education_programs b ON a.mental_health_education_program_id = b.mental_health_education_program_id;
```

| id | initiative_identifier | initiative_name | launch_date | program_mental_health_education_program_id | program_program_identifier | program_program_title |
|---|---|---|---|---|---|---|
| 1 | INI-2234 | Baseline Corridor D | 2022-05-17 | 1 | PRO-2198 | Legacy Review D |
| 2 | INI-2237 | Distributed Series | 2023-10-01 | 2 | PRO-2205 | Regional Initiative |
| 3 | INI-2240 | Adaptive Assessment | 2024-03-12 | 3 | PRO-2212 | Seasonal Model |
| 4 | INI-2243 | Primary Survey A | 2025-08-23 | 4 | PRO-2219 | Integrated Cluster A |

In this view, initiative INI-2234 (Baseline Corridor D) is linked to program PRO-2198 (Legacy Review D), which targets middle school students and is delivered in-school. Initiative INI-2240 (Adaptive Assessment) is linked to program PRO-2212 (Seasonal Model), which targets college students and is delivered in-school. The best practice and training qualification flags on the initiative record indicate which programs are prioritized for institutional support and which speakers are eligible for advanced training.

The view that links prevention initiatives to mental health issues answers the question of which clinical topics are the focus of each prevention initiative. It joins the initiative with the issue record, surfacing the issue's code, name, severity, treatability, prevalence, and barrier to treatment alongside the initiative's name, launch date, target behavior, best practice status, and training qualification.

**View `v_prevention_initiative_mental_health_issue`**

```sql
CREATE VIEW v_prevention_initiative_mental_health_issue AS
SELECT a.id, a.initiative_identifier, a.initiative_name, a.launch_date, b.mental_health_issue_id AS issue_mental_health_issue_id, b.issue_code AS issue_issue_code, b.issue_name AS issue_issue_name
FROM prevention_initiatives a JOIN mental_health_issues b ON a.mental_health_issue_id = b.mental_health_issue_id;
```

| id | initiative_identifier | initiative_name | launch_date | issue_mental_health_issue_id | issue_issue_code | issue_issue_name |
|---|---|---|---|---|---|---|
| 1 | INI-2234 | Baseline Corridor D | 2022-05-17 | 1 | 505995 | Distributed Review |
| 2 | INI-2237 | Distributed Series | 2023-10-01 | 2 | Harga | Adaptive Initiative D |
| 3 | INI-2240 | Adaptive Assessment | 2024-03-12 | 3 | 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Model |
| 4 | INI-2243 | Primary Survey A | 2025-08-23 | 4 | 4060640 | Composite Cluster |

In this view, initiative INI-2234 (Baseline Corridor D) targets the Distributed Review issue (code 505995), which has low severity and a stigma barrier. Initiative INI-2240 (Adaptive Assessment) targets the Primary Model issue (code 27cf055a-9bad-11eb-a8a2-19ed5c03f8d3), which has high severity and a lack of awareness barrier. The target behavior field—help-seeking, advocacy, or intervention—indicates the specific behavioral change the initiative is designed to promote, and this should align with the barrier to treatment identified in the issue record.

## Closing Synthesis

The mental health education system described here is a coordinated network of programs, speakers, audiences, venues, and prevention initiatives, all linked through a set of relational tables and views. The base tables capture the core entities and their attributes, while the junction tables enable flexible many-to-many relationships between programs, speakers, and issues. The views provide analytical lenses that combine data from multiple tables to answer specific operational questions about speaker assignments, audience demographics, clinical content, venue logistics, and prevention strategy. Practitioners who understand the structure of these tables and the relationships between them can use the views to assess program effectiveness, identify resource gaps, and make informed decisions about speaker training, audience targeting, and venue selection.