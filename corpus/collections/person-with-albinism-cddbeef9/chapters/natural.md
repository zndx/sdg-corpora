## The Ecosystem of Albinism Support in Educational Settings

Organizations that serve people with albinism must track a complex web of individual needs, educational interventions, institutional environments, and social barriers. At the center of this ecosystem are the individuals themselves—people whose medical profiles, geographic locations, and program enrollments form the foundation of every support decision. The records capture not only demographic information but also clinical indicators such as vision level and skin sensitivity, alongside operational flags like whether a person is currently enrolled in an education program. Understanding how these records relate to one another is essential for practitioners who coordinate care, allocate resources, and evaluate the effectiveness of interventions across schools and programs.

**Table `person_with_albinisms`**

| person_with_albinism_id | person_id | name | date_of_birth | vision_level | skin_sensitivity | current_location | enrolled_in_program | education_program_id | social_stigma_id | environmental_accommodation_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Dana Nguyen | 2025-04-02 | low | high | baseline-current-43 | true | 100 | 1 | 100 |
| 2 | Maria Rodriguez | Kimberly Myers | 2022-09-13 | severe | moderate | pilot-current-44 | false | 101 | 2 | 101 |
| 3 | Sarah Villanueva | Kimberly Myers | 2023-02-24 | blind | low | extended-current-45 | true | 102 | 3 | 102 |
| 4 | Susan Wagner | Guam International Airport | 2024-07-08 | low | high | integrated-current-46 | false | 103 | 4 | 103 |

The person records anchor the entire dataset. Each entry carries a unique identifier, a personal name, and a date of birth that situates the individual within a cohort. Clinical attributes—vision_level ranging from low to blind, and skin_sensitivity at high, moderate, or low levels—provide the medical context that drives accommodation decisions. The current_location field uses coded identifiers such as baseline-current-43 or pilot-current-44, which correspond to geographic or programmatic zones. The boolean enrolled_in_program flag indicates active participation in an educational intervention, while the foreign keys education_program_id, social_stigma_id, and environmental_accommodation_id link each person to the specific program, stigma context, and accommodation plan assigned to them. For instance, Dana Nguyen (person_id 1) presents with low vision and high skin sensitivity, is enrolled in program 100, and is associated with stigma record 1 and accommodation 100.

## Education Programs and Their Operational Parameters

Education programs represent the structured interventions through which support is delivered. Each program carries a program_id, a human-readable program_name, and a start_date and end_date that define its operational window. The status field—active, inactive, or planned—indicates the current lifecycle phase of the program, while target_demographic and funding_source provide the strategic context for resource allocation.

**Table `education_programs`**

| id | program_id | program_name | start_date | end_date | status | target_demographic | funding_source | mainstream_school_id | environmental_accommodation_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | active | regional-target-84 | baseline-funding-73 | 1 | 100 |
| 101 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | inactive | legacy-target-85 | pilot-funding-74 | 2 | 101 |
| 102 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | planned | compact-target-86 | extended-funding-75 | 3 | 102 |
| 103 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | active | composite-target-87 | integrated-funding-76 | 4 | 103 |

Program 100, named Extended Review, is currently active and targets the regional-target-84 demographic with baseline-funding-73. It runs from September 2022 and is associated with mainstream school 1 and environmental accommodation 100. Program 101, Pilot Initiative A, is marked inactive and targets legacy-target-85, funded through pilot-funding-74. Program 102, the Baseline Model, is in a planned state with compact-target-86 and extended-funding-75. Program 103, Distributed Cluster, is active and serves composite-target-87 with integrated-funding-76. The temporal data reveals that some programs have end dates preceding their start dates, suggesting either data entry conventions or retrospective scheduling practices that practitioners should verify.

## Mainstream Schools as Institutional Environments

Mainstream schools serve as the physical and policy environments where educational programs operate. Each school record includes a school_id, school_name, and location code, alongside an academic_standard that classifies the institution as above_average, average, or below_average. The enrollment_capacity field quantifies the school's student body size, while the has_inclusive_policy boolean indicates whether the school has adopted formal inclusive education policies. The last_inspection_date provides a compliance timestamp, and the created_at and updated_at fields track the record's maintenance history.

**Table `mainstream_schools`**

| id | school_id | school_name | location | academic_standard | enrollment_capacity | has_inclusive_policy | last_inspection_date | environmental_accommodation_id | social_stigma_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | extended-location-99 | above_average | 47 | false | 2025-04-12 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1186099 | Integrated Framework | integrated-location-100 | average | 57 | true | 2022-09-23 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 7441154 | Extended Protocol D | seasonal-location-101 | below_average | 67 | false | 2023-02-07 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 338514 | Pilot Programme | regional-location-102 | above_average | 77 | true | 2024-07-18 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

School 1, Seasonal Standard, operates at extended-location-99 with an above_average academic standard and an enrollment capacity of 47 students. It does not have an inclusive policy and was last inspected on April 12, 2025. School 2, Integrated Framework, located at integrated-location-100, has an average academic standard, a capacity of 57, and does maintain an inclusive policy. School 3, Extended Protocol D, is at seasonal-location-101 with a below_average standard and capacity of 67, lacking an inclusive policy. School 4, Pilot Programme, at regional-location-102, holds an above_average standard, capacity of 77, and has an inclusive policy. The schools are linked to specific environmental accommodations and social stigma records, embedding each institution within a broader support and risk context.

## Environmental Accommodations: Physical and Sensory Interventions

Environmental accommodations are the tangible adjustments made to learning spaces to support people with albinism. The accommodation_type field categorizes the intervention—lighting, seating, sun_protection, or visual_aid—while the implementation_date records when the accommodation was put in place. The effectiveness_rating, a numeric score ranging from 4.20 to 13.80 in the current data, quantifies the perceived impact of the accommodation. The status field tracks whether an accommodation is active, pending, or removed, and the description field provides a narrative label for the intervention.

**Table `environmental_accommodations`**

| environmental_accommodation_id | accommodation_id | accommodation_type | implementation_date | effectiveness_rating | status | description | mainstream_school_id | education_program_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 4277036 | lighting | 2024-11-14T10:06:00 | 4.20 | active | Extended Survey | 1 | 100 |
| 101 | 5917290 | seating | 2025-04-25T17:23:00 | 7.40 | pending | Pilot Corridor A | 2 | 101 |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 2022-09-09T00:40:00 | 10.60 | removed | Baseline Series | 3 | 102 |
| 103 | 1186097 | visual_aid | 2023-02-20T07:57:00 | 13.80 | active | Distributed Assessment | 4 | 103 |

Accommodation 100 is a lighting adjustment with an effectiveness rating of 4.20, implemented on November 14, 2024, and currently active. It is described as Extended Survey and is associated with school 1 and program 100. Accommodation 101, a seating adjustment rated at 7.40, is pending and described as Pilot Corridor A, linked to school 2 and program 101. Accommodation 102 provides sun_protection with a notably high effectiveness rating of 10.60 but has been removed; it was part of the Baseline Series at school 3 and program 102. Accommodation 103, a visual_aid rated at 13.80, is active and described as Distributed Assessment, serving school 4 and program 103. The wide range in effectiveness ratings suggests significant variation in how well different accommodation types meet the needs of individuals.

## Social Stigmas: Documented Barriers and Their Context

Social stigmas represent the documented barriers that people with albinism encounter in educational and community settings. The stigma_type field classifies the nature of the barrier—segregation, discrimination, isolation, or myth_based—while the severity_level provides a numeric measure of intensity. The location field identifies where the stigma was observed, the date_reported records when it was documented, and the source field identifies the reporting entity.

**Table `social_stigmas`**

| id | stigma_id | stigma_type | severity_level | location | date_reported | source | mainstream_school_id | education_program_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2002007020160 | segregation | 29 | extended-location-99 | 2023-06-04 | seasonal-source-65 | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | 505987 | discrimination | 40 | integrated-location-100 | 2024-11-15 | regional-source-66 | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | 5844262 | isolation | 51 | seasonal-location-101 | 2025-04-26 | legacy-source-67 | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | 10207160 | myth_based | 62 | regional-location-102 | 2022-09-10 | compact-source-68 | 4 | 103 | 2025-04-16 09:14:00 |

Stigma record 1 documents a segregation incident with a severity level of 29, reported on June 4, 2023, at extended-location-99 and sourced from seasonal-source-65. Stigma record 2 records discrimination with a severity of 40 at integrated-location-100 on November 15, 2024, from regional-source-66. Stigma record 3 captures isolation with severity 51 at seasonal-location-101 on April 26, 2025, reported by legacy-source-67. Stigma record 4 documents a myth_based incident with the highest severity of 62 at regional-location-102 on September 10, 2022, from compact-source-68. Each stigma is linked to a specific mainstream school and education program, enabling practitioners to correlate barrier types with institutional and programmatic contexts.

## Cross-Reference Tables: Mapping Many-to-Many Relationships

The support ecosystem involves many-to-many relationships that cannot be captured through simple foreign keys alone. The cross-reference tables resolve these relationships by creating explicit association records between entities.

**Table `programs_albinisms`**

| education_program_id | person_with_albinism_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The programs_albinisms table maps which people with albinisms are enrolled in which education programs. Person 1 (Dana Nguyen) is enrolled in programs 100 and 103. Person 2 (Maria Rodriguez) participates in programs 100 and 101. Person 3 (Sarah Villanueva) is linked to programs 101 and 102. Person 4 (Susan Wagner) is associated with programs 102 and 103. This creates a pattern where each person engages with two programs and each program serves two people, forming a balanced bipartite structure. The schools_albinisms, accommodations_albinisms, and stigmas_albinisms tables follow the same relational pattern, establishing the many-to-many links between people and their institutional environments, physical accommodations, and documented social barriers.

## Joined Views: Integrated Perspectives on Support Delivery

The joined views synthesize the base tables into actionable perspectives, answering specific operational questions by combining data across entity boundaries. Each view represents a particular analytical lens through which practitioners can evaluate the support ecosystem.

**View `vw_person_with_albinism_education_program`**

```sql
CREATE VIEW vw_person_with_albinism_education_program AS
SELECT a.person_with_albinism_id, a.person_id, a.name, a.date_of_birth, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM person_with_albinisms a JOIN education_programs b ON a.education_program_id = b.id;
```

| person_with_albinism_id | person_id | name | date_of_birth | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Dana Nguyen | 2025-04-02 | 100 | 103176 | Extended Review |
| 2 | Maria Rodriguez | Kimberly Myers | 2022-09-13 | 101 | 2986219 | Pilot Initiative A |
| 3 | Sarah Villanueva | Kimberly Myers | 2023-02-24 | 102 | 1186079 | Baseline Model |
| 4 | Susan Wagner | Guam International Airport | 2024-07-08 | 103 | 1562855 | Distributed Cluster |

This view answers the question of which education programs each person with albinism is enrolled in, combining personal identifiers with program details. Reading the joined result, Dana Nguyen appears associated with the Extended Review program (program_id 103176), which is active and targets the regional demographic. Maria Rodriguez is linked to Pilot Initiative A (program_id 2986219), currently inactive, suggesting a program that has concluded or been suspended. The view enables practitioners to see at a glance the programmatic footprint of each individual.

**View `vw_person_with_albinism_social_stigma`**

```sql
CREATE VIEW vw_person_with_albinism_social_stigma AS
SELECT a.person_with_albinism_id, a.person_id, a.name, a.date_of_birth, b.id AS stigma_id, b.stigma_id AS stigma_stigma_id, b.stigma_type AS stigma_stigma_type
FROM person_with_albinisms a JOIN social_stigmas b ON a.social_stigma_id = b.id;
```

| person_with_albinism_id | person_id | name | date_of_birth | stigma_id | stigma_stigma_id | stigma_stigma_type |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Dana Nguyen | 2025-04-02 | 1 | 2002007020160 | segregation |
| 2 | Maria Rodriguez | Kimberly Myers | 2022-09-13 | 2 | 505987 | discrimination |
| 3 | Sarah Villanueva | Kimberly Myers | 2023-02-24 | 3 | 5844262 | isolation |
| 4 | Susan Wagner | Guam International Airport | 2024-07-08 | 4 | 10207160 | myth_based |

This view connects individuals to the social stigmas they have encountered, providing a direct link between personal experience and documented barriers. Sarah Villanueva, for example, is associated with stigma record 3, which documents an isolation incident with severity level 51 at seasonal-location-101. Susan Wagner is linked to stigma record 4, a myth_based incident with the highest severity of 62. This perspective allows support coordinators to identify individuals who may require additional advocacy or intervention based on the severity and type of stigma they have experienced.

**View `vw_person_with_albinism_environmental_accommodation`**

```sql
CREATE VIEW vw_person_with_albinism_environmental_accommodation AS
SELECT a.person_with_albinism_id, a.person_id, a.name, a.date_of_birth, b.environmental_accommodation_id AS accommodation_environmental_accommodation_id, b.accommodation_id AS accommodation_accommodation_id, b.accommodation_type AS accommodation_accommodation_type
FROM person_with_albinisms a JOIN environmental_accommodations b ON a.environmental_accommodation_id = b.environmental_accommodation_id;
```

| person_with_albinism_id | person_id | name | date_of_birth | accommodation_environmental_accommodation_id | accommodation_accommodation_id | accommodation_accommodation_type |
|---|---|---|---|---|---|---|
| 1 | George Bernard Shaw | Dana Nguyen | 2025-04-02 | 100 | 4277036 | lighting |
| 2 | Maria Rodriguez | Kimberly Myers | 2022-09-13 | 101 | 5917290 | seating |
| 3 | Sarah Villanueva | Kimberly Myers | 2023-02-24 | 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection |
| 4 | Susan Wagner | Guam International Airport | 2024-07-08 | 103 | 1186097 | visual_aid |

This view reveals the environmental accommodations assigned to each person, combining clinical needs with physical interventions. Dana Nguyen is associated with accommodation 100, a lighting adjustment with an effectiveness rating of 4.20. Maria Rodriguez has accommodation 101, a seating adjustment rated at 7.40 and currently pending. Sarah Villanueva is linked to accommodation 102, a sun_protection measure that has been removed despite its high effectiveness rating of 10.60. Susan Wagner has accommodation 103, a visual_aid with the highest effectiveness rating of 13.80. The view highlights the gap between accommodation effectiveness and current status, flagging cases where high-rated accommodations have been removed.

**View `vw_education_program_person_with_albinism_detail`**

```sql
CREATE VIEW vw_education_program_person_with_albinism_detail AS
SELECT a.id, a.program_id, a.program_name, b.person_with_albinism_id AS albinism_person_with_albinism_id, b.person_id AS albinism_person_id, b.name AS albinism_name
FROM education_programs a
  JOIN programs_albinisms j ON j.education_program_id = a.id
  JOIN person_with_albinisms b ON b.person_with_albinism_id = j.person_with_albinism_id;
```

| id | program_id | program_name | albinism_person_with_albinism_id | albinism_person_id | albinism_name |
|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 1 | George Bernard Shaw | Dana Nguyen |
| 100 | 103176 | Extended Review | 2 | Maria Rodriguez | Kimberly Myers |
| 101 | 2986219 | Pilot Initiative A | 2 | Maria Rodriguez | Kimberly Myers |
| 101 | 2986219 | Pilot Initiative A | 3 | Sarah Villanueva | Kimberly Myers |
| 102 | 1186079 | Baseline Model | 3 | Sarah Villanueva | Kimberly Myers |
| 102 | 1186079 | Baseline Model | 4 | Susan Wagner | Guam International Airport |
| 103 | 1562855 | Distributed Cluster | 4 | Susan Wagner | Guam International Airport |
| 103 | 1562855 | Distributed Cluster | 1 | George Bernard Shaw | Dana Nguyen |

This view inverts the perspective, showing which people with albinisms are served by each education program. Program 100 (Extended Review) serves persons 1 and 2, combining Dana Nguyen and Maria Rodriguez under a single active program. Program 101 (Pilot Initiative A) serves persons 2 and 3, while Program 102 (Baseline Model) serves persons 3 and 4. Program 103 (Distributed Cluster) serves persons 4 and 1. This view is particularly useful for program managers who need to understand the composition of their participant cohorts and identify potential cross-program overlaps.

**View `vw_education_program_mainstream_school`**

```sql
CREATE VIEW vw_education_program_mainstream_school AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM education_programs a JOIN mainstream_schools b ON a.mainstream_school_id = b.id;
```

| id | program_id | program_name | start_date | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 2022-09-05T20:24:00 | 1 | 1152671 | Seasonal Standard |
| 101 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 2 | 1186099 | Integrated Framework |
| 102 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 3 | 7441154 | Extended Protocol D |
| 103 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 4 | 338514 | Pilot Programme |

This view maps the relationship between education programs and the mainstream schools where they operate. Program 100 operates at school 1 (Seasonal Standard), Program 101 at school 2 (Integrated Framework), Program 102 at school 3 (Extended Protocol D), and Program 103 at school 4 (Pilot Programme). The view reveals that each program is associated with exactly one school, creating a one-to-one mapping in the current data. Practitioners can use this view to assess whether program effectiveness correlates with school characteristics such as academic standard or the presence of inclusive policies.

**View `vw_education_program_environmental_accommodation`**

```sql
CREATE VIEW vw_education_program_environmental_accommodation AS
SELECT a.id, a.program_id, a.program_name, a.start_date, b.environmental_accommodation_id AS accommodation_environmental_accommodation_id, b.accommodation_id AS accommodation_accommodation_id, b.accommodation_type AS accommodation_accommodation_type
FROM education_programs a JOIN environmental_accommodations b ON a.environmental_accommodation_id = b.environmental_accommodation_id;
```

| id | program_id | program_name | start_date | accommodation_environmental_accommodation_id | accommodation_accommodation_id | accommodation_accommodation_type |
|---|---|---|---|---|---|---|
| 100 | 103176 | Extended Review | 2022-09-05T20:24:00 | 100 | 4277036 | lighting |
| 101 | 2986219 | Pilot Initiative A | 2023-02-16T03:41:00 | 101 | 5917290 | seating |
| 102 | 1186079 | Baseline Model | 2024-07-27T10:58:00 | 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection |
| 103 | 1562855 | Distributed Cluster | 2025-12-11T17:15:00 | 103 | 1186097 | visual_aid |

This view links education programs to the environmental accommodations that support them. Program 100 uses accommodation 100 (lighting, rating 4.20, active). Program 101 uses accommodation 101 (seating, rating 7.40, pending). Program 102 uses accommodation 102 (sun_protection, rating 10.60, removed). Program 103 uses accommodation 103 (visual_aid, rating 13.80, active). The view enables program evaluators to correlate program status with accommodation status and effectiveness, identifying patterns such as the removal of highly effective accommodations or the pending status of moderately effective ones.

**View `vw_mainstream_school_person_with_albinism_detail`**

```sql
CREATE VIEW vw_mainstream_school_person_with_albinism_detail AS
SELECT a.id, a.school_id, a.school_name, b.person_with_albinism_id AS albinism_person_with_albinism_id, b.person_id AS albinism_person_id, b.name AS albinism_name
FROM mainstream_schools a
  JOIN schools_albinisms j ON j.mainstream_school_id = a.id
  JOIN person_with_albinisms b ON b.person_with_albinism_id = j.person_with_albinism_id;
```

| id | school_id | school_name | albinism_person_with_albinism_id | albinism_person_id | albinism_name |
|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | 1 | George Bernard Shaw | Dana Nguyen |
| 1 | 1152671 | Seasonal Standard | 2 | Maria Rodriguez | Kimberly Myers |
| 2 | 1186099 | Integrated Framework | 2 | Maria Rodriguez | Kimberly Myers |
| 2 | 1186099 | Integrated Framework | 3 | Sarah Villanueva | Kimberly Myers |
| 3 | 7441154 | Extended Protocol D | 3 | Sarah Villanueva | Kimberly Myers |
| 3 | 7441154 | Extended Protocol D | 4 | Susan Wagner | Guam International Airport |
| 4 | 338514 | Pilot Programme | 4 | Susan Wagner | Guam International Airport |
| 4 | 338514 | Pilot Programme | 1 | George Bernard Shaw | Dana Nguyen |

This view shows which people with albinisms are associated with each mainstream school, providing an institutional perspective on student distribution. School 1 (Seasonal Standard) is associated with person 1, Dana Nguyen. School 2 (Integrated Framework) serves person 2, Maria Rodriguez. School 3 (Extended Protocol D) serves person 3, Sarah Villanueva. School 4 (Pilot Programme) serves person 4, Susan Wagner. Each school currently serves one person in the direct person-to-school linkage, though the cross-reference tables reveal that individuals may participate in programs at multiple schools.

**View `vw_mainstream_school_environmental_accommodation`**

```sql
CREATE VIEW vw_mainstream_school_environmental_accommodation AS
SELECT a.id, a.school_id, a.school_name, a.location, b.environmental_accommodation_id AS accommodation_environmental_accommodation_id, b.accommodation_id AS accommodation_accommodation_id, b.accommodation_type AS accommodation_accommodation_type
FROM mainstream_schools a JOIN environmental_accommodations b ON a.environmental_accommodation_id = b.environmental_accommodation_id;
```

| id | school_id | school_name | location | accommodation_environmental_accommodation_id | accommodation_accommodation_id | accommodation_accommodation_type |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | extended-location-99 | 100 | 4277036 | lighting |
| 2 | 1186099 | Integrated Framework | integrated-location-100 | 101 | 5917290 | seating |
| 3 | 7441154 | Extended Protocol D | seasonal-location-101 | 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection |
| 4 | 338514 | Pilot Programme | regional-location-102 | 103 | 1186097 | visual_aid |

This view connects mainstream schools to the environmental accommodations implemented at their locations. School 1 has accommodation 100 (lighting, active, rating 4.20). School 2 has accommodation 101 (seating, pending, rating 7.40). School 3 has accommodation 102 (sun_protection, removed, rating 10.60). School 4 has accommodation 103 (visual_aid, active, rating 13.80). The view is essential for facility managers who need to track the status and effectiveness of accommodations across their institutional portfolio.

**View `vw_mainstream_school_social_stigma`**

```sql
CREATE VIEW vw_mainstream_school_social_stigma AS
SELECT a.id, a.school_id, a.school_name, a.location, b.id AS stigma_id, b.stigma_id AS stigma_stigma_id, b.stigma_type AS stigma_stigma_type
FROM mainstream_schools a JOIN social_stigmas b ON a.social_stigma_id = b.id;
```

| id | school_id | school_name | location | stigma_id | stigma_stigma_id | stigma_stigma_type |
|---|---|---|---|---|---|---|
| 1 | 1152671 | Seasonal Standard | extended-location-99 | 1 | 2002007020160 | segregation |
| 2 | 1186099 | Integrated Framework | integrated-location-100 | 2 | 505987 | discrimination |
| 3 | 7441154 | Extended Protocol D | seasonal-location-101 | 3 | 5844262 | isolation |
| 4 | 338514 | Pilot Programme | regional-location-102 | 4 | 10207160 | myth_based |

This view maps social stigmas to the mainstream schools where they were documented. School 1 is associated with stigma record 1 (segregation, severity 29). School 2 with stigma record 2 (discrimination, severity 40). School 3 with stigma record 3 (isolation, severity 51). School 4 with stigma record 4 (myth_based, severity 62). The increasing severity levels across schools suggest a gradient of social barrier intensity that may correlate with school characteristics such as the presence or absence of inclusive policies.

**View `vw_environmental_accommodation_mainstream_school`**

```sql
CREATE VIEW vw_environmental_accommodation_mainstream_school AS
SELECT a.environmental_accommodation_id, a.accommodation_id, a.accommodation_type, a.implementation_date, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM environmental_accommodations a JOIN mainstream_schools b ON a.mainstream_school_id = b.id;
```

| environmental_accommodation_id | accommodation_id | accommodation_type | implementation_date | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 100 | 4277036 | lighting | 2024-11-14T10:06:00 | 1 | 1152671 | Seasonal Standard |
| 101 | 5917290 | seating | 2025-04-25T17:23:00 | 2 | 1186099 | Integrated Framework |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 2022-09-09T00:40:00 | 3 | 7441154 | Extended Protocol D |
| 103 | 1186097 | visual_aid | 2023-02-20T07:57:00 | 4 | 338514 | Pilot Programme |

This view presents the environmental accommodations from the perspective of the mainstream schools they serve, reversing the previous view's orientation. Accommodation 100 (lighting) is deployed at school 1, accommodation 101 (seating) at school 2, accommodation 102 (sun_protection) at school 3, and accommodation 103 (visual_aid) at school 4. This perspective is useful for accommodation coordinators who need to audit the deployment of specific intervention types across the institutional network.

**View `vw_environmental_accommodation_person_with_albinism_detail`**

```sql
CREATE VIEW vw_environmental_accommodation_person_with_albinism_detail AS
SELECT a.environmental_accommodation_id, a.accommodation_id, a.accommodation_type, b.person_with_albinism_id AS albinism_person_with_albinism_id, b.person_id AS albinism_person_id, b.name AS albinism_name
FROM environmental_accommodations a
  JOIN accommodations_albinisms j ON j.environmental_accommodation_id = a.environmental_accommodation_id
  JOIN person_with_albinisms b ON b.person_with_albinism_id = j.person_with_albinism_id;
```

| environmental_accommodation_id | accommodation_id | accommodation_type | albinism_person_with_albinism_id | albinism_person_id | albinism_name |
|---|---|---|---|---|---|
| 100 | 4277036 | lighting | 1 | George Bernard Shaw | Dana Nguyen |
| 100 | 4277036 | lighting | 2 | Maria Rodriguez | Kimberly Myers |
| 101 | 5917290 | seating | 2 | Maria Rodriguez | Kimberly Myers |
| 101 | 5917290 | seating | 3 | Sarah Villanueva | Kimberly Myers |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 3 | Sarah Villanueva | Kimberly Myers |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 4 | Susan Wagner | Guam International Airport |
| 103 | 1186097 | visual_aid | 4 | Susan Wagner | Guam International Airport |
| 103 | 1186097 | visual_aid | 1 | George Bernard Shaw | Dana Nguyen |

This view links environmental accommodations to the specific people with albinisms they support, combining physical interventions with individual profiles. Accommodation 100 (lighting, active) supports Dana Nguyen, who has low vision and high skin sensitivity. Accommodation 101 (seating, pending) supports Maria Rodriguez, who has severe vision impairment and moderate skin sensitivity. Accommodation 102 (sun_protection, removed) supported Sarah Villanueva, who has blind-level vision and low skin sensitivity. Accommodation 103 (visual_aid, active) supports Susan Wagner, who has low vision and high skin sensitivity. The view enables practitioners to evaluate whether accommodation types are appropriately matched to individual clinical profiles.

**View `vw_environmental_accommodation_education_program`**

```sql
CREATE VIEW vw_environmental_accommodation_education_program AS
SELECT a.environmental_accommodation_id, a.accommodation_id, a.accommodation_type, a.implementation_date, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM environmental_accommodations a JOIN education_programs b ON a.education_program_id = b.id;
```

| environmental_accommodation_id | accommodation_id | accommodation_type | implementation_date | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 100 | 4277036 | lighting | 2024-11-14T10:06:00 | 100 | 103176 | Extended Review |
| 101 | 5917290 | seating | 2025-04-25T17:23:00 | 101 | 2986219 | Pilot Initiative A |
| 102 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | sun_protection | 2022-09-09T00:40:00 | 102 | 1186079 | Baseline Model |
| 103 | 1186097 | visual_aid | 2023-02-20T07:57:00 | 103 | 1562855 | Distributed Cluster |

This view connects environmental accommodations to the education programs that utilize them, creating a bridge between physical interventions and programmatic delivery. Accommodation 100 supports program 100 (Extended Review, active). Accommodation 101 supports program 101 (Pilot Initiative A, inactive). Accommodation 102 supports program 102 (Baseline Model, planned). Accommodation 103 supports program 103 (Distributed Cluster, active). This view helps program administrators understand the physical infrastructure supporting their interventions and identify programs that may be operating without adequate accommodations.

**View `vw_social_stigma_person_with_albinism_detail`**

```sql
CREATE VIEW vw_social_stigma_person_with_albinism_detail AS
SELECT a.id, a.stigma_id, a.stigma_type, b.person_with_albinism_id AS albinism_person_with_albinism_id, b.person_id AS albinism_person_id, b.name AS albinism_name
FROM social_stigmas a
  JOIN stigmas_albinisms j ON j.social_stigma_id = a.id
  JOIN person_with_albinisms b ON b.person_with_albinism_id = j.person_with_albinism_id;
```

| id | stigma_id | stigma_type | albinism_person_with_albinism_id | albinism_person_id | albinism_name |
|---|---|---|---|---|---|
| 1 | 2002007020160 | segregation | 1 | George Bernard Shaw | Dana Nguyen |
| 1 | 2002007020160 | segregation | 2 | Maria Rodriguez | Kimberly Myers |
| 2 | 505987 | discrimination | 2 | Maria Rodriguez | Kimberly Myers |
| 2 | 505987 | discrimination | 3 | Sarah Villanueva | Kimberly Myers |
| 3 | 5844262 | isolation | 3 | Sarah Villanueva | Kimberly Myers |
| 3 | 5844262 | isolation | 4 | Susan Wagner | Guam International Airport |
| 4 | 10207160 | myth_based | 4 | Susan Wagner | Guam International Airport |
| 4 | 10207160 | myth_based | 1 | George Bernard Shaw | Dana Nguyen |

This view presents social stigmas from the perspective of the individuals who have experienced them, combining barrier documentation with personal profiles. Stigma record 1 (segregation, severity 29) is associated with Dana Nguyen, who is enrolled in program 100. Stigma record 2 (discrimination, severity 40) is linked to Maria Rodriguez, who is not currently enrolled in a program. Stigma record 3 (isolation, severity 51) is associated with Sarah Villanueva, who is enrolled in program 102. Stigma record 4 (myth_based, severity 62) is linked to Susan Wagner, who is not enrolled in a program. The view reveals a potential correlation between program enrollment status and the severity of stigmas experienced, suggesting that active program participation may or may not mitigate social barriers.

**View `vw_social_stigma_mainstream_school`**

```sql
CREATE VIEW vw_social_stigma_mainstream_school AS
SELECT a.id, a.stigma_id, a.stigma_type, a.severity_level, b.id AS school_id, b.school_id AS school_school_id, b.school_name AS school_school_name
FROM social_stigmas a JOIN mainstream_schools b ON a.mainstream_school_id = b.id;
```

| id | stigma_id | stigma_type | severity_level | school_id | school_school_id | school_school_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020160 | segregation | 29 | 1 | 1152671 | Seasonal Standard |
| 2 | 505987 | discrimination | 40 | 2 | 1186099 | Integrated Framework |
| 3 | 5844262 | isolation | 51 | 3 | 7441154 | Extended Protocol D |
| 4 | 10207160 | myth_based | 62 | 4 | 338514 | Pilot Programme |

This view maps social stigmas to the mainstream schools where they were documented, providing an institutional risk assessment perspective. Stigma record 1 (segregation) was documented at school 1 (Seasonal Standard, no inclusive policy). Stigma record 2 (discrimination) at school 2 (Integrated Framework, has inclusive policy). Stigma record 3 (isolation) at school 3 (Extended Protocol D, no inclusive policy). Stigma record 4 (myth_based) at school 4 (Pilot Programme, has inclusive policy). The view complicates the assumption that inclusive policies alone eliminate social barriers, as schools with inclusive policies still report significant stigma incidents.

**View `vw_social_stigma_education_program`**

```sql
CREATE VIEW vw_social_stigma_education_program AS
SELECT a.id, a.stigma_id, a.stigma_type, a.severity_level, b.id AS program_id, b.program_id AS program_program_id, b.program_name AS program_program_name
FROM social_stigmas a JOIN education_programs b ON a.education_program_id = b.id;
```

| id | stigma_id | stigma_type | severity_level | program_id | program_program_id | program_program_name |
|---|---|---|---|---|---|---|
| 1 | 2002007020160 | segregation | 29 | 100 | 103176 | Extended Review |
| 2 | 505987 | discrimination | 40 | 101 | 2986219 | Pilot Initiative A |
| 3 | 5844262 | isolation | 51 | 102 | 1186079 | Baseline Model |
| 4 | 10207160 | myth_based | 62 | 103 | 1562855 | Distributed Cluster |

This view connects social stigmas to the education programs operating in the same institutional context, enabling practitioners to assess whether programmatic interventions are associated with reduced stigma exposure. Stigma record 1 is associated with program 100 (Extended Review, active). Stigma record 2 with program 101 (Pilot Initiative A, inactive). Stigma record 3 with program 102 (Baseline Model, planned). Stigma record 4 with program 103 (Distributed Cluster, active). The view allows evaluators to compare stigma severity and type across programs with different statuses and target demographics.

## Synthesis

The data ecosystem for albinism support in educational settings reveals a tightly interwoven network of individuals, programs, schools, accommodations, and social barriers. Each entity type carries its own set of attributes and lifecycle states, and the cross-reference tables and joined views provide the analytical lenses necessary to understand how these elements interact in practice. Practitioners can use the base tables to maintain accurate records of individuals and their assigned supports, the cross-reference tables to understand the many-to-many relationships that define real-world participation, and the joined views to answer specific operational questions about program effectiveness, accommodation deployment, and stigma patterns. The current data shows a balanced structure where each person engages with two programs, each program serves two people, and each school, program, accommodation, and stigma record is linked to exactly one counterpart in each related entity. This structure, while simplified, provides a clear foundation for more complex analyses as the dataset grows and the support ecosystem evolves.

## Data appendix

**Table `schools_albinisms`**

| mainstream_school_id | person_with_albinism_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `accommodations_albinisms`**

| environmental_accommodation_id | person_with_albinism_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `stigmas_albinisms`**

| social_stigma_id | person_with_albinism_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
