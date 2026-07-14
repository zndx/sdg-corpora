## Foundations of Ethnographic Survey Research in Traditional Health Systems

The study of traditional health systems requires capturing the interwoven relationships between spiritual practice, identity formation, material culture, and healing knowledge. This domain centers on survey-based data collection that links individual respondents to the religious practices they observe, the identities they hold, the sacred objects they maintain, and the traditional healers and medicines they encounter. Each record in the system represents a point in a broader ethnographic survey, anchoring demographic information to the cultural and spiritual context of the respondent. The data model supports both granular record-keeping and cross-tabulated analysis, enabling researchers to trace how a single survey response connects to a healer's practice, a medicine's source, a sacred object's purpose, and a religious identity's adherence level.

**Table `religious_practices`**

| religious_practice_id | practice_id | practice_name | practice_type | prevalence_percentage | region | is_syncretic | survey_response_id | religious_identity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Seasonal Survey | ancestor_veneration | 19.70 | distributed-region-12 | false | 1000 | 1 |
| 2 | 1562852 | Integrated Corridor | spirit_sacrifice | 23.40 | baseline-region-13 | true | 1001 | 2 |
| 3 | L683 | Extended Series D | charm_usage | 27.10 | pilot-region-14 | false | 1002 | 3 |
| 4 | organisational-alignment | Pilot Assessment | healing_ritual | 30.80 | extended-region-15 | true | 1003 | 4 |

Religious practices form the foundational layer of cultural documentation. Each practice record captures a named activity—such as *Seasonal Survey*, *Integrated Corridor*, *Extended Series D*, or *Pilot Assessment*—alongside its classification as a type of ritual or observance. The `practice_type` column distinguishes between categories like `ancestor_veneration`, `spirit_sacrifice`, `charm_usage`, and `healing_ritual`. Prevalence is quantified as a percentage, ranging from 19.70% for the Seasonal Survey practice to 30.80% for the Pilot Assessment. Geographic distribution is recorded in the `region` field, with entries spanning `distributed-region-12` through `extended-region-15`. The `is_syncretic` flag indicates whether a practice blends elements from multiple traditions; for instance, the Integrated Corridor spirit sacrifice and the Pilot Assessment healing ritual are both marked as syncretic, while the Seasonal Survey ancestor veneration and Extended Series D charm usage are not. Each practice is linked to a survey response and a religious identity, establishing the first bridge between observed ritual behavior and the individuals who participate in it.

**Table `religious_identities`**

| religious_identity_id | identity_id | identity_label | is_primary | adherence_level | survey_response_id | religious_practice_id |
|---|---|---|---|---|---|---|
| 1 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Protocol | true | deeply_committed | 1000 | 1 |
| 2 | d87f6fa90b894eb8be0b031dcc4d667a | Primary Programme | false | moderately_committed | 1001 | 2 |
| 3 | 3744023 | Composite Standard D | true | casual | 1002 | 3 |
| 4 | 103179 | Compact Framework | false | non_practicing | 1003 | 4 |

Religious identities describe the self-reported affiliation and commitment level of survey respondents. The `identity_label` field uses designations such as *Adaptive Protocol*, *Primary Programme*, *Composite Standard D*, and *Compact Framework*. The `is_primary` flag identifies which identity a respondent considers their principal affiliation; in the sample data, Adaptive Protocol and Composite Standard D are marked as primary, while Primary Programme and Compact Framework are not. Adherence levels range from `deeply_committed` through `moderately_committed`, `casual`, and `non_practicing`, providing a graduated measure of engagement. Each identity record is tied to a specific survey response and a religious practice, creating a direct link between how people identify and what they actually do. The identity labeled *Adaptive Protocol*, for example, is deeply committed and primary, associated with survey response 1000 and the Seasonal Survey ancestor veneration practice.

**Table `survey_responses`**

| survey_response_id | response_id | survey_date | respondent_age | respondent_gender | country | household_size | is_sick_in_household | religious_identity_id | religious_practice_id | traditional_healer_id | sacred_object_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 | 11 | primary-responde-94 | compact-country-26 | 11 | true | 1 | 1 | 1 | 1 |
| 1001 | 9736917 | 2025-12-07T01:47:00 | 18 | adaptive-responde-95 | composite-country-27 | 22 | false | 2 | 2 | 2 | 2 |
| 1002 | 8189493 | 2022-05-18T08:04:00 | 25 | distributed-responde-96 | primary-country-28 | 33 | true | 3 | 3 | 3 | 3 |
| 1003 | Invoice | 2023-10-02T15:21:00 | 32 | baseline-responde-97 | adaptive-country-29 | 44 | false | 4 | 4 | 4 | 4 |

Survey responses serve as the central hub of the entire data model. Each response record captures demographic and contextual information about the respondent: the `survey_date` (spanning from May 2022 through December 2025), `respondent_age` (from 11 to 32 years), `respondent_gender` (coded as values like `primary-responde-94` and `adaptive-responde-95`), `country` (such as `compact-country-26` and `composite-country-27`), and `household_size` (ranging from 11 to 44 members). The boolean flag `is_sick_in_household` indicates whether any household member is currently ill, a variable of particular relevance to health-related research. Critically, each survey response carries foreign keys to a religious identity, a religious practice, a traditional healer, and a sacred object, making the survey response the nexus through which all other domain entities are connected. Response 1000, for instance, comes from an 11-year-old respondent in compact-country-26 with a household of 11, reports illness in the household, and is linked to identity 1, practice 1, healer 1, and sacred object 1.

**Table `traditional_healers`**

| id | healer_id | specialist_type | region_of_practice | is_recognized | survey_response_id | traditional_medicine_id |
|---|---|---|---|---|---|---|
| 1 | Deskripsi | diviner | pilot-region-92 | false | 1000 | 1 |
| 2 | model_delegation_child0 | healer | extended-region-93 | true | 1001 | 2 |
| 3 | 2933461 | both | integrated-region-94 | false | 1002 | 3 |
| 4 | 4920 | diviner | seasonal-region-95 | true | 1003 | 4 |

Traditional healers represent the practitioners who deliver culturally embedded health services. Each healer record includes a `specialist_type`—categorized as `diviner`, `healer`, or `both`—and a `region_of_practice` that situates their work geographically. The `is_recognized` flag indicates whether the healer holds formal or community-acknowledged status; in the sample, model_delegation_child0 (a healer in extended-region-93) and healer 4920 (a diviner in seasonal-region-95) are recognized, while Deskripsi (a diviner in pilot-region-92) and healer 2933461 (practicing both roles in integrated-region-94) are not. Each healer is associated with a survey response and a traditional medicine, linking the practitioner to both the community context and the specific remedies they employ.

**Table `sacred_objects`**

| id | object_id | object_type | protective_purpose | is_kept_at_home | survey_response_id | religious_practice_id |
|---|---|---|---|---|---|---|
| 1 | 392489 | animal_skin | adaptive-protecti-11 | true | 1000 | 1 |
| 2 | 9246331 | skull | distributed-protecti-12 | false | 1001 | 2 |
| 3 | lu_tax_code_template_b_VB-EC-6 | charm | baseline-protecti-13 | true | 1002 | 3 |
| 4 | demo | amulet | pilot-protecti-14 | false | 1003 | 4 |

Sacred objects document the material culture surrounding religious and healing practices. The `object_type` field records physical forms such as `animal_skin`, `skull`, `charm`, and `amulet`. The `protective_purpose` column describes the intended function of each object, with values like `adaptive-protecti-11`, `distributed-protecti-12`, `baseline-protecti-13`, and `pilot-protecti-14`. The `is_kept_at_home` flag indicates whether the object is maintained within the household; animal skins and charms are kept at home, while skulls and amulets are not. Each sacred object is linked to a survey response and a religious practice, grounding material culture in both the respondent's context and the broader ritual framework.

**Table `traditional_medicines`**

| id | medicine_id | medicine_name | source_material | intended_effect | traditional_healer_id | survey_response_id |
|---|---|---|---|---|---|---|
| 1 | 1437596 | Adaptive Series | primary-source-34 | healing | 1 | 1000 |
| 2 | 4793466 | Primary Assessment | adaptive-source-35 | protection | 2 | 1001 |
| 3 | gd_taxc_2121 | Composite Survey D | distributed-source-36 | restoring_order | 3 | 1002 |
| 4 | 575213 | Compact Corridor | baseline-source-37 | counteracting_witchcraft | 4 | 1003 |

Traditional medicines capture the pharmacological knowledge embedded in healing systems. Each medicine record includes a `medicine_name` (such as *Adaptive Series*, *Primary Assessment*, *Composite Survey D*, and *Compact Corridor*), a `source_material` indicating the origin of the remedy (e.g., `primary-source-34`, `adaptive-source-35`), and an `intended_effect` describing the therapeutic goal—ranging from `healing` and `protection` to `restoring_order` and `counteracting_witchcraft`. Each medicine is associated with a specific traditional healer and a survey response, connecting the remedy to both its practitioner and the community context in which it is used.

The power of this data model emerges in its cross-tabulated views, which join these base tables to answer specific research questions. Each view represents a particular analytical lens through which the relationships between entities can be examined.

**View `vw_religious_practice_survey_response`**

```sql
CREATE VIEW vw_religious_practice_survey_response AS
SELECT a.religious_practice_id, a.practice_id, a.practice_name, a.practice_type, b.survey_response_id AS response_survey_response_id, b.response_id AS response_response_id, b.survey_date AS response_survey_date
FROM religious_practices a JOIN survey_responses b ON a.survey_response_id = b.survey_response_id;
```

| religious_practice_id | practice_id | practice_name | practice_type | response_survey_response_id | response_response_id | response_survey_date |
|---|---|---|---|---|---|---|
| 1 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Seasonal Survey | ancestor_veneration | 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 |
| 2 | 1562852 | Integrated Corridor | spirit_sacrifice | 1001 | 9736917 | 2025-12-07T01:47:00 |
| 3 | L683 | Extended Series D | charm_usage | 1002 | 8189493 | 2022-05-18T08:04:00 |
| 4 | organisational-alignment | Pilot Assessment | healing_ritual | 1003 | Invoice | 2023-10-02T15:21:00 |

The view `vw_religious_practice_survey_response` joins religious practices with survey responses, answering the question of which practices are associated with which respondents and their demographic profiles. For example, the Seasonal Survey ancestor veneration practice (19.70% prevalence, non-syncretic, in distributed-region-12) is linked to survey response 1000, a household of 11 in compact-country-26 where illness is present. The Integrated Corridor spirit sacrifice (23.40%, syncretic, baseline-region-13) connects to response 1001, a household of 22 in composite-country-27 with no reported illness. This view enables researchers to correlate practice prevalence and syncretism with household characteristics and health status.

**View `vw_religious_practice_religious_identity`**

```sql
CREATE VIEW vw_religious_practice_religious_identity AS
SELECT a.religious_practice_id, a.practice_id, a.practice_name, a.practice_type, b.religious_identity_id AS identity_religious_identity_id, b.identity_id AS identity_identity_id, b.identity_label AS identity_identity_label
FROM religious_practices a JOIN religious_identities b ON a.religious_identity_id = b.religious_identity_id;
```

| religious_practice_id | practice_id | practice_name | practice_type | identity_religious_identity_id | identity_identity_id | identity_identity_label |
|---|---|---|---|---|---|---|
| 1 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Seasonal Survey | ancestor_veneration | 1 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Protocol |
| 2 | 1562852 | Integrated Corridor | spirit_sacrifice | 2 | d87f6fa90b894eb8be0b031dcc4d667a | Primary Programme |
| 3 | L683 | Extended Series D | charm_usage | 3 | 3744023 | Composite Standard D |
| 4 | organisational-alignment | Pilot Assessment | healing_ritual | 4 | 103179 | Compact Framework |

The view `vw_religious_practice_religious_identity` links religious practices to religious identities, revealing how observed rituals map onto self-reported affiliations. The Seasonal Survey ancestor veneration practice pairs with the Adaptive Protocol identity, which is primary and deeply committed. The Integrated Corridor spirit sacrifice pairs with Primary Programme, which is non-primary and moderately committed. This relationship allows analysts to examine whether certain practice types attract particular levels of adherence or whether syncretic practices correlate with primary identity status.

**View `vw_religious_identity_survey_response`**

```sql
CREATE VIEW vw_religious_identity_survey_response AS
SELECT a.religious_identity_id, a.identity_id, a.identity_label, a.is_primary, b.survey_response_id AS response_survey_response_id, b.response_id AS response_response_id, b.survey_date AS response_survey_date
FROM religious_identities a JOIN survey_responses b ON a.survey_response_id = b.survey_response_id;
```

| religious_identity_id | identity_id | identity_label | is_primary | response_survey_response_id | response_response_id | response_survey_date |
|---|---|---|---|---|---|---|
| 1 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Protocol | true | 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 |
| 2 | d87f6fa90b894eb8be0b031dcc4d667a | Primary Programme | false | 1001 | 9736917 | 2025-12-07T01:47:00 |
| 3 | 3744023 | Composite Standard D | true | 1002 | 8189493 | 2022-05-18T08:04:00 |
| 4 | 103179 | Compact Framework | false | 1003 | Invoice | 2023-10-02T15:21:00 |

The view `vw_religious_identity_survey_response` connects religious identities directly to survey responses, providing a demographic portrait of each identity group. The Adaptive Protocol identity (deeply committed, primary) is associated with survey response 1000, an 11-year-old respondent from compact-country-26 with a household of 11 and reported illness. The Primary Programme identity (moderately committed, non-primary) links to response 1001, an 18-year-old from composite-country-27 with a household of 22 and no illness. This view supports analysis of how adherence level and primary status distribute across age, geography, and household health.

**View `vw_religious_identity_religious_practice`**

```sql
CREATE VIEW vw_religious_identity_religious_practice AS
SELECT a.religious_identity_id, a.identity_id, a.identity_label, a.is_primary, b.religious_practice_id AS practice_religious_practice_id, b.practice_id AS practice_practice_id, b.practice_name AS practice_practice_name
FROM religious_identities a JOIN religious_practices b ON a.religious_practice_id = b.religious_practice_id;
```

| religious_identity_id | identity_id | identity_label | is_primary | practice_religious_practice_id | practice_practice_id | practice_practice_name |
|---|---|---|---|---|---|---|
| 1 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Protocol | true | 1 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Seasonal Survey |
| 2 | d87f6fa90b894eb8be0b031dcc4d667a | Primary Programme | false | 2 | 1562852 | Integrated Corridor |
| 3 | 3744023 | Composite Standard D | true | 3 | L683 | Extended Series D |
| 4 | 103179 | Compact Framework | false | 4 | organisational-alignment | Pilot Assessment |

The view `vw_religious_identity_religious_practice` presents the inverse of the practice-to-identity join, organizing by identity and showing which practices each identity is associated with. The Adaptive Protocol identity is linked to the Seasonal Survey ancestor veneration practice; the Primary Programme identity to the Integrated Corridor spirit sacrifice; Composite Standard D to Extended Series D charm usage; and Compact Framework to Pilot Assessment healing ritual. This perspective is useful for understanding the practice portfolio of each identity category and for identifying whether non-primary identities are associated with syncretic practices.

**View `vw_survey_response_religious_identity`**

```sql
CREATE VIEW vw_survey_response_religious_identity AS
SELECT a.survey_response_id, a.response_id, a.survey_date, a.respondent_age, b.religious_identity_id AS identity_religious_identity_id, b.identity_id AS identity_identity_id, b.identity_label AS identity_identity_label
FROM survey_responses a JOIN religious_identities b ON a.religious_identity_id = b.religious_identity_id;
```

| survey_response_id | response_id | survey_date | respondent_age | identity_religious_identity_id | identity_identity_id | identity_identity_label |
|---|---|---|---|---|---|---|
| 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 | 11 | 1 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Protocol |
| 1001 | 9736917 | 2025-12-07T01:47:00 | 18 | 2 | d87f6fa90b894eb8be0b031dcc4d667a | Primary Programme |
| 1002 | 8189493 | 2022-05-18T08:04:00 | 25 | 3 | 3744023 | Composite Standard D |
| 1003 | Invoice | 2023-10-02T15:21:00 | 32 | 4 | 103179 | Compact Framework |

The view `vw_survey_response_religious_identity` presents the survey response as the starting point, showing the religious identity associated with each respondent. Response 1000 carries the Adaptive Protocol identity (deeply committed, primary); response 1001 carries Primary Programme (moderately committed, non-primary); response 1002 carries Composite Standard D (casual, primary); and response 1003 carries Compact Framework (non_practicing, non-primary). This view is particularly useful for demographic cross-tabulations, as it places identity attributes directly alongside respondent age, gender, country, and household size.

**View `vw_survey_response_religious_practice`**

```sql
CREATE VIEW vw_survey_response_religious_practice AS
SELECT a.survey_response_id, a.response_id, a.survey_date, a.respondent_age, b.religious_practice_id AS practice_religious_practice_id, b.practice_id AS practice_practice_id, b.practice_name AS practice_practice_name
FROM survey_responses a JOIN religious_practices b ON a.religious_practice_id = b.religious_practice_id;
```

| survey_response_id | response_id | survey_date | respondent_age | practice_religious_practice_id | practice_practice_id | practice_practice_name |
|---|---|---|---|---|---|---|
| 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 | 11 | 1 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Seasonal Survey |
| 1001 | 9736917 | 2025-12-07T01:47:00 | 18 | 2 | 1562852 | Integrated Corridor |
| 1002 | 8189493 | 2022-05-18T08:04:00 | 25 | 3 | L683 | Extended Series D |
| 1003 | Invoice | 2023-10-02T15:21:00 | 32 | 4 | organisational-alignment | Pilot Assessment |

The view `vw_survey_response_religious_practice` connects survey responses to their associated religious practices, enabling analysis of practice characteristics against respondent demographics. Response 1000 is linked to the Seasonal Survey ancestor veneration practice (19.70% prevalence, non-syncretic); response 1001 to the Integrated Corridor spirit sacrifice (23.40%, syncretic); response 1002 to Extended Series D charm usage (27.10%, non-syncretic); and response 1003 to Pilot Assessment healing ritual (30.80%, syncretic). This view supports questions about whether higher-prevalence practices are more or less likely to be syncretic, and whether syncretic practices cluster among particular demographic groups.

**View `vw_survey_response_traditional_healer`**

```sql
CREATE VIEW vw_survey_response_traditional_healer AS
SELECT a.survey_response_id, a.response_id, a.survey_date, a.respondent_age, b.id AS healer_id, b.healer_id AS healer_healer_id, b.specialist_type AS healer_specialist_type
FROM survey_responses a JOIN traditional_healers b ON a.traditional_healer_id = b.id;
```

| survey_response_id | response_id | survey_date | respondent_age | healer_id | healer_healer_id | healer_specialist_type |
|---|---|---|---|---|---|---|
| 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 | 11 | 1 | Deskripsi | diviner |
| 1001 | 9736917 | 2025-12-07T01:47:00 | 18 | 2 | model_delegation_child0 | healer |
| 1002 | 8189493 | 2022-05-18T08:04:00 | 25 | 3 | 2933461 | both |
| 1003 | Invoice | 2023-10-02T15:21:00 | 32 | 4 | 4920 | diviner |

The view `vw_survey_response_traditional_healer` links survey responses to the traditional healers associated with each respondent. Response 1000 is connected to healer Deskripsi, a diviner in pilot-region-92 who is not recognized. Response 1001 connects to model_delegation_child0, a healer in extended-region-93 who is recognized. Response 1002 links to healer 2933461, who practices both roles in integrated-region-94 and is not recognized. Response 1003 connects to healer 4920, a diviner in seasonal-region-95 who is recognized. This view enables analysis of healer recognition status against respondent demographics and household health conditions.

**View `vw_survey_response_sacred_object`**

```sql
CREATE VIEW vw_survey_response_sacred_object AS
SELECT a.survey_response_id, a.response_id, a.survey_date, a.respondent_age, b.id AS object_id, b.object_id AS object_object_id, b.object_type AS object_object_type
FROM survey_responses a JOIN sacred_objects b ON a.sacred_object_id = b.id;
```

| survey_response_id | response_id | survey_date | respondent_age | object_id | object_object_id | object_object_type |
|---|---|---|---|---|---|---|
| 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 | 11 | 1 | 392489 | animal_skin |
| 1001 | 9736917 | 2025-12-07T01:47:00 | 18 | 2 | 9246331 | skull |
| 1002 | 8189493 | 2022-05-18T08:04:00 | 25 | 3 | lu_tax_code_template_b_VB-EC-6 | charm |
| 1003 | Invoice | 2023-10-02T15:21:00 | 32 | 4 | demo | amulet |

The view `vw_survey_response_sacred_object` connects survey responses to the sacred objects associated with each respondent. Response 1000 is linked to an animal skin with adaptive-protecti-11 purpose, kept at home. Response 1001 connects to a skull with distributed-protecti-12 purpose, not kept at home. Response 1002 links to a charm with baseline-protecti-13 purpose, kept at home. Response 1003 connects to an amulet with pilot-protecti-14 purpose, not kept at home. This view supports analysis of whether the type of sacred object, its protective purpose, or its location (home vs. non-home) correlates with household illness status or other demographic factors.

**View `vw_traditional_healer_survey_response`**

```sql
CREATE VIEW vw_traditional_healer_survey_response AS
SELECT a.id, a.healer_id, a.specialist_type, a.region_of_practice, b.survey_response_id AS response_survey_response_id, b.response_id AS response_response_id, b.survey_date AS response_survey_date
FROM traditional_healers a JOIN survey_responses b ON a.survey_response_id = b.survey_response_id;
```

| id | healer_id | specialist_type | region_of_practice | response_survey_response_id | response_response_id | response_survey_date |
|---|---|---|---|---|---|---|
| 1 | Deskripsi | diviner | pilot-region-92 | 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 |
| 2 | model_delegation_child0 | healer | extended-region-93 | 1001 | 9736917 | 2025-12-07T01:47:00 |
| 3 | 2933461 | both | integrated-region-94 | 1002 | 8189493 | 2022-05-18T08:04:00 |
| 4 | 4920 | diviner | seasonal-region-95 | 1003 | Invoice | 2023-10-02T15:21:00 |

The view `vw_traditional_healer_survey_response` presents the traditional healer as the starting point, showing the survey response and its associated demographic context for each healer. Healer Deskripsi (diviner, pilot-region-92, not recognized) is linked to response 1000, an 11-year-old from compact-country-26 with a household of 11 and reported illness. Healer model_delegation_child0 (healer, extended-region-93, recognized) connects to response 1001, an 18-year-old from composite-country-27 with a household of 22 and no illness. This perspective is valuable for understanding the community context in which each healer operates.

**View `vw_traditional_healer_traditional_medicine`**

```sql
CREATE VIEW vw_traditional_healer_traditional_medicine AS
SELECT a.id, a.healer_id, a.specialist_type, a.region_of_practice, b.id AS medicine_id, b.medicine_id AS medicine_medicine_id, b.medicine_name AS medicine_medicine_name
FROM traditional_healers a JOIN traditional_medicines b ON a.traditional_medicine_id = b.id;
```

| id | healer_id | specialist_type | region_of_practice | medicine_id | medicine_medicine_id | medicine_medicine_name |
|---|---|---|---|---|---|---|
| 1 | Deskripsi | diviner | pilot-region-92 | 1 | 1437596 | Adaptive Series |
| 2 | model_delegation_child0 | healer | extended-region-93 | 2 | 4793466 | Primary Assessment |
| 3 | 2933461 | both | integrated-region-94 | 3 | gd_taxc_2121 | Composite Survey D |
| 4 | 4920 | diviner | seasonal-region-95 | 4 | 575213 | Compact Corridor |

The view `vw_traditional_healer_traditional_medicine` links traditional healers to the medicines they employ. Healer Deskripsi is associated with Adaptive Series, a medicine sourced from primary-source-34 with the intended effect of healing. Healer model_delegation_child0 uses Primary Assessment, sourced from adaptive-source-35 for protection. Healer 2933461 employs Composite Survey D, sourced from distributed-source-36 for restoring_order. Healer 4920 uses Compact Corridor, sourced from baseline-source-37 for counteracting_witchcraft. This view reveals the mapping between healer types and the therapeutic goals of the medicines they practice, supporting analysis of whether certain specialist types preferentially use medicines targeting specific effects.

**View `vw_sacred_object_survey_response`**

```sql
CREATE VIEW vw_sacred_object_survey_response AS
SELECT a.id, a.object_id, a.object_type, a.protective_purpose, b.survey_response_id AS response_survey_response_id, b.response_id AS response_response_id, b.survey_date AS response_survey_date
FROM sacred_objects a JOIN survey_responses b ON a.survey_response_id = b.survey_response_id;
```

| id | object_id | object_type | protective_purpose | response_survey_response_id | response_response_id | response_survey_date |
|---|---|---|---|---|---|---|
| 1 | 392489 | animal_skin | adaptive-protecti-11 | 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 |
| 2 | 9246331 | skull | distributed-protecti-12 | 1001 | 9736917 | 2025-12-07T01:47:00 |
| 3 | lu_tax_code_template_b_VB-EC-6 | charm | baseline-protecti-13 | 1002 | 8189493 | 2022-05-18T08:04:00 |
| 4 | demo | amulet | pilot-protecti-14 | 1003 | Invoice | 2023-10-02T15:21:00 |

The view `vw_sacred_object_survey_response` presents the sacred object as the starting point, showing the survey response and its demographic context for each object. The animal skin (adaptive-protecti-11, kept at home) connects to response 1000, a household of 11 with illness. The skull (distributed-protecti-12, not kept at home) links to response 1001, a household of 22 without illness. The charm (baseline-protecti-13, kept at home) connects to response 1002, a household of 33 with illness. The amulet (pilot-protecti-14, not kept at home) links to response 1003, a household of 44 without illness. This view supports analysis of whether objects kept at home are more or less associated with household illness.

**View `vw_sacred_object_religious_practice`**

```sql
CREATE VIEW vw_sacred_object_religious_practice AS
SELECT a.id, a.object_id, a.object_type, a.protective_purpose, b.religious_practice_id AS practice_religious_practice_id, b.practice_id AS practice_practice_id, b.practice_name AS practice_practice_name
FROM sacred_objects a JOIN religious_practices b ON a.religious_practice_id = b.religious_practice_id;
```

| id | object_id | object_type | protective_purpose | practice_religious_practice_id | practice_practice_id | practice_practice_name |
|---|---|---|---|---|---|---|
| 1 | 392489 | animal_skin | adaptive-protecti-11 | 1 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Seasonal Survey |
| 2 | 9246331 | skull | distributed-protecti-12 | 2 | 1562852 | Integrated Corridor |
| 3 | lu_tax_code_template_b_VB-EC-6 | charm | baseline-protecti-13 | 3 | L683 | Extended Series D |
| 4 | demo | amulet | pilot-protecti-14 | 4 | organisational-alignment | Pilot Assessment |

The view `vw_sacred_object_religious_practice` connects sacred objects to the religious practices they are associated with. The animal skin with adaptive-protecti-11 purpose is linked to the Seasonal Survey ancestor veneration practice. The skull with distributed-protecti-12 purpose connects to the Integrated Corridor spirit sacrifice. The charm with baseline-protecti-13 purpose links to Extended Series D charm usage. The amulet with pilot-protecti-14 purpose connects to Pilot Assessment healing ritual. This view enables analysis of whether certain object types or protective purposes are more commonly associated with syncretic versus non-syncretic practices.

**View `vw_traditional_medicine_traditional_healer`**

```sql
CREATE VIEW vw_traditional_medicine_traditional_healer AS
SELECT a.id, a.medicine_id, a.medicine_name, a.source_material, b.id AS healer_id, b.healer_id AS healer_healer_id, b.specialist_type AS healer_specialist_type
FROM traditional_medicines a JOIN traditional_healers b ON a.traditional_healer_id = b.id;
```

| id | medicine_id | medicine_name | source_material | healer_id | healer_healer_id | healer_specialist_type |
|---|---|---|---|---|---|---|
| 1 | 1437596 | Adaptive Series | primary-source-34 | 1 | Deskripsi | diviner |
| 2 | 4793466 | Primary Assessment | adaptive-source-35 | 2 | model_delegation_child0 | healer |
| 3 | gd_taxc_2121 | Composite Survey D | distributed-source-36 | 3 | 2933461 | both |
| 4 | 575213 | Compact Corridor | baseline-source-37 | 4 | 4920 | diviner |

The view `vw_traditional_medicine_traditional_healer` presents the traditional medicine as the starting point, showing the healer who employs it. Adaptive Series (healing effect, primary-source-34) is used by healer Deskripsi, a non-recognized diviner. Primary Assessment (protection, adaptive-source-35) is used by healer model_delegation_child0, a recognized healer. Composite Survey D (restoring_order, distributed-source-36) is used by healer 2933461, a non-recognized practitioner of both roles. Compact Corridor (counteracting_witchcraft, baseline-source-37) is used by healer 4920, a recognized diviner. This view supports analysis of whether certain therapeutic effects are associated with healer recognition status or specialist type.

**View `vw_traditional_medicine_survey_response`**

```sql
CREATE VIEW vw_traditional_medicine_survey_response AS
SELECT a.id, a.medicine_id, a.medicine_name, a.source_material, b.survey_response_id AS response_survey_response_id, b.response_id AS response_response_id, b.survey_date AS response_survey_date
FROM traditional_medicines a JOIN survey_responses b ON a.survey_response_id = b.survey_response_id;
```

| id | medicine_id | medicine_name | source_material | response_survey_response_id | response_response_id | response_survey_date |
|---|---|---|---|---|---|---|
| 1 | 1437596 | Adaptive Series | primary-source-34 | 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 |
| 2 | 4793466 | Primary Assessment | adaptive-source-35 | 1001 | 9736917 | 2025-12-07T01:47:00 |
| 3 | gd_taxc_2121 | Composite Survey D | distributed-source-36 | 1002 | 8189493 | 2022-05-18T08:04:00 |
| 4 | 575213 | Compact Corridor | baseline-source-37 | 1003 | Invoice | 2023-10-02T15:21:00 |

The view `vw_traditional_medicine_survey_response` links traditional medicines to their associated survey responses, connecting remedy characteristics to respondent demographics. Adaptive Series (healing, primary-source-34) connects to response 1000, an 11-year-old from compact-country-26 with a household of 11 and reported illness. Primary Assessment (protection, adaptive-source-35) links to response 1001, an 18-year-old from composite-country-27 with a household of 22 and no illness. Composite Survey D (restoring_order, distributed-source-36) connects to response 1002, a 25-year-old from primary-country-28 with a household of 33 and reported illness. Compact Corridor (counteracting_witchcraft, baseline-source-37) links to response 1003, a 32-year-old from adaptive-country-29 with a household of 44 and no illness. This view enables analysis of whether intended therapeutic effects correlate with respondent age, household size, or illness status.

The data model described here supports a comprehensive ethnographic survey framework that captures the full spectrum of traditional health systems—from the individual respondent and their household context, through the religious identities and practices that shape their worldview, to the material objects, healers, and medicines that constitute the practical infrastructure of healing. The cross-tabulated views provide the analytical flexibility needed to answer diverse research questions, whether the focus is on the demographic distribution of religious adherence, the relationship between healer recognition and medicine type, or the association between sacred object placement and household health. By maintaining these relationships as explicit, queryable connections rather than implicit assumptions, the model ensures that every analytical result can be traced back to its source records, supporting both rigorous quantitative analysis and grounded qualitative interpretation.