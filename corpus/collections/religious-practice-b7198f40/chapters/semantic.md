## Ontology-Grounded Relational Modelling in Cultural Heritage Survey Data

The domain under examination captures the interplay between cultural practices, religious identities, and traditional healing systems as documented through structured survey instruments. At its core, the model distinguishes six entity types: `survey_responses` as the observational anchor, `religious_practices` and `religious_identities` as cultural classification layers, `traditional_healers` and `sacred_objects` as material and human agents of practice, and `traditional_medicines` as the therapeutic outputs of healer activity. Each entity is normalised into its own table, with foreign keys radiating from the central `survey_responses` table to bind every cultural observation to a concrete respondent, date, and demographic profile. The following sections walk through the entity definitions, the column-level encoding of attributes and cardinality constraints, and the view-level joins that reconstruct domain facts from the normalised schema.

**Table `survey_responses`**

| survey_response_id | response_id | survey_date | respondent_age | respondent_gender | country | household_size | is_sick_in_household | religious_identity_id | religious_practice_id | traditional_healer_id | sacred_object_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ChIJr7cItPtt5kcRM6ry7ecIYgw | 2024-07-23T18:30:00 | 11 | primary-responde-94 | compact-country-26 | 11 | true | 1 | 1 | 1 | 1 |
| 1001 | 9736917 | 2025-12-07T01:47:00 | 18 | adaptive-responde-95 | composite-country-27 | 22 | false | 2 | 2 | 2 | 2 |
| 1002 | 8189493 | 2022-05-18T08:04:00 | 25 | distributed-responde-96 | primary-country-28 | 33 | true | 3 | 3 | 3 | 3 |
| 1003 | Invoice | 2023-10-02T15:21:00 | 32 | baseline-responde-97 | adaptive-country-29 | 44 | false | 4 | 4 | 4 | 4 |

The `survey_responses` table is the observational nucleus of the schema. Its primary key, `survey_response_id`, is a synthetic integer (values 1000 through 1003 in the sample) that uniquely identifies each completed instrument. The natural identifier `response_id` carries UUID-style or alphanumeric codes such as `ChIJr7cItPtt5kcRM6ry7ecIYgw` and `Invoice`, providing a stable external reference. Demographic and contextual attributes — `survey_date` (e.g. `2024-07-23T18:30:00`), `respondent_age` (11, 18, 25, 32), `respondent_gender` (`primary-responde-94`, `adaptive-responde-95`), `country` (`compact-country-26`, `composite-country-27`), `household_size` (11, 22, 33, 44), and the boolean flag `is_sick_in_household` — form the respondent profile. Crucially, four foreign keys — `religious_identity_id`, `religious_practice_id`, `traditional_healer_id`, and `sacred_object_id` — each point to a single row in their respective dimension tables, enforcing a one-to-one association per survey response. In the sample data, response 1000 links to religious identity 1, practice 1, healer 1, and sacred object 1, establishing a tightly coupled cultural snapshot for that respondent.

**Table `religious_practices`**

| religious_practice_id | practice_id | practice_name | practice_type | prevalence_percentage | region | is_syncretic | survey_response_id | religious_identity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3 | Seasonal Survey | ancestor_veneration | 19.70 | distributed-region-12 | false | 1000 | 1 |
| 2 | 1562852 | Integrated Corridor | spirit_sacrifice | 23.40 | baseline-region-13 | true | 1001 | 2 |
| 3 | L683 | Extended Series D | charm_usage | 27.10 | pilot-region-14 | false | 1002 | 3 |
| 4 | organisational-alignment | Pilot Assessment | healing_ritual | 30.80 | extended-region-15 | true | 1003 | 4 |

The `religious_practices` table encodes the cultural practice dimension. Its surrogate key `religious_practice_id` (1–4) is distinct from the natural `practice_id`, which carries UUIDs like `fbc3f876-9bac-11eb-a8a2-19ed5c03f8d3` or domain-specific codes such as `organisational-alignment`. The `practice_name` column holds descriptive labels — `Seasonal Survey`, `Integrated Corridor`, `Extended Series D`, `Pilot Assessment` — while `practice_type` classifies the ritual modality (`ancestor_veneration`, `spirit_sacrifice`, `charm_usage`, `healing_ritual`). The numeric `prevalence_percentage` (19.70, 23.40, 27.10, 30.80) quantifies how widespread each practice is within its region, and `region` (e.g. `distributed-region-12`, `baseline-region-13`) provides geographic context. The boolean `is_syncretic` flag (true for practices 2 and 4) marks hybrid or blended traditions. Two foreign keys, `survey_response_id` and `religious_identity_id`, create bidirectional links back to the survey and identity tables, respectively.

**Table `religious_identities`**

| religious_identity_id | identity_id | identity_label | is_primary | adherence_level | survey_response_id | religious_practice_id |
|---|---|---|---|---|---|---|
| 1 | 4155bf60-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Protocol | true | deeply_committed | 1000 | 1 |
| 2 | d87f6fa90b894eb8be0b031dcc4d667a | Primary Programme | false | moderately_committed | 1001 | 2 |
| 3 | 3744023 | Composite Standard D | true | casual | 1002 | 3 |
| 4 | 103179 | Compact Framework | false | non_practicing | 1003 | 4 |

`religious_identities` captures the self-reported or observed religious affiliation of respondents. The surrogate key `religious_identity_id` (1–4) maps to a natural `identity_id` (UUIDs like `4155bf60-8fcc-11eb-924d-9cd76263cbd0` or codes like `3744023`). The `identity_label` column provides human-readable names — `Adaptive Protocol`, `Primary Programme`, `Composite Standard D`, `Compact Framework` — while `is_primary` (true for identities 1 and 3) indicates whether this is the respondent's principal affiliation. The `adherence_level` column is an ordinal attribute with values `deeply_committed`, `moderately_committed`, `casual`, and `non_practicing`, encoding the intensity of religious observance. Foreign keys `survey_response_id` and `religious_practice_id` tie each identity to a specific survey response and a corresponding practice, reinforcing the one-to-one cardinality observed in the sample rows.

**Table `traditional_healers`**

| id | healer_id | specialist_type | region_of_practice | is_recognized | survey_response_id | traditional_medicine_id |
|---|---|---|---|---|---|---|
| 1 | Deskripsi | diviner | pilot-region-92 | false | 1000 | 1 |
| 2 | model_delegation_child0 | healer | extended-region-93 | true | 1001 | 2 |
| 3 | 2933461 | both | integrated-region-94 | false | 1002 | 3 |
| 4 | 4920 | diviner | seasonal-region-95 | true | 1003 | 4 |

The `traditional_healers` table documents the human agents of traditional medicine. Its primary key `id` (1–4) is a synthetic integer, while `healer_id` carries descriptive identifiers such as `Deskripsi`, `model_delegation_child0`, `2933461`, and `4920`. The `specialist_type` column distinguishes between `diviner`, `healer`, and `both` roles. The `region_of_practice` attribute (e.g. `pilot-region-92`, `extended-region-93`) specifies where the healer operates, and `is_recognized` (true for healers 2 and 4) indicates formal or community recognition. Foreign keys `survey_response_id` and `traditional_medicine_id` link each healer to the survey response that documented them and to the medicine they prepare.

**Table `sacred_objects`**

| id | object_id | object_type | protective_purpose | is_kept_at_home | survey_response_id | religious_practice_id |
|---|---|---|---|---|---|---|
| 1 | 392489 | animal_skin | adaptive-protecti-11 | true | 1000 | 1 |
| 2 | 9246331 | skull | distributed-protecti-12 | false | 1001 | 2 |
| 3 | lu_tax_code_template_b_VB-EC-6 | charm | baseline-protecti-13 | true | 1002 | 3 |
| 4 | demo | amulet | pilot-protecti-14 | false | 1003 | 4 |

`sacred_objects` records the material culture associated with religious practice. The surrogate key `id` (1–4) is paired with a natural `object_id` (`392489`, `9246331`, `lu_tax_code_template_b_VB-EC-6`, `demo`). The `object_type` column enumerates physical forms — `animal_skin`, `skull`, `charm`, `amulet` — while `protective_purpose` (e.g. `adaptive-protecti-11`, `distributed-protecti-12`) describes the intended spiritual function. The boolean `is_kept_at_home` (true for objects 1 and 3) indicates domestic versus communal or external placement. Foreign keys `survey_response_id` and `religious_practice_id` bind each object to the survey response and the practice it serves.

**Table `traditional_medicines`**

| id | medicine_id | medicine_name | source_material | intended_effect | traditional_healer_id | survey_response_id |
|---|---|---|---|---|---|---|
| 1 | 1437596 | Adaptive Series | primary-source-34 | healing | 1 | 1000 |
| 2 | 4793466 | Primary Assessment | adaptive-source-35 | protection | 2 | 1001 |
| 3 | gd_taxc_2121 | Composite Survey D | distributed-source-36 | restoring_order | 3 | 1002 |
| 4 | 575213 | Compact Corridor | baseline-source-37 | counteracting_witchcraft | 4 | 1003 |

`traditional_medicines` captures the therapeutic products of healer activity. Its primary key `id` (1–4) is synthetic, while `medicine_id` carries numeric or alphanumeric codes (`1437596`, `4793466`, `gd_taxc_2121`, `575213`). The `medicine_name` column provides descriptive labels — `Adaptive Series`, `Primary Assessment`, `Composite Survey D`, `Compact Corridor` — and `source_material` (e.g. `primary-source-34`, `adaptive-source-35`) identifies the raw material origin. The `intended_effect` column is categorical, with values `healing`, `protection`, `restoring_order`, and `counteracting_witchcraft`. Foreign keys `traditional_healer_id` and `survey_response_id` link each medicine to its preparing healer and the survey response that recorded it.

The foreign-key topology of the schema forms a star pattern centred on `survey_responses`. Every dimension table — `religious_practices`, `religious_identities`, `traditional_healers`, `sacred_objects`, and `traditional_medicines` — carries a `survey_response_id` foreign key, ensuring that each cultural observation is anchored to a specific respondent. Additionally, cross-dimensional links exist: `religious_practices` references `religious_identity_id`, `religious_identities` references `religious_practice_id`, `traditional_healers` references `traditional_medicine_id`, and `sacred_objects` references `religious_practice_id`. These cross-links encode domain-level associations that are not mediated by the survey instrument itself, such as the inherent relationship between a healer and the medicine they prepare, or between a sacred object and the practice it supports.

The materialisation of this ontology into relational tables follows a normalised design where each entity type occupies its own table, attributes become columns, and relationships are expressed through foreign keys. The cardinality constraints are implicit in the schema: each `survey_response_id` appears exactly once in each dimension table (one-to-one association per response), while a single `traditional_healer_id` may appear in multiple rows of `traditional_medicines` if a healer prepares multiple medicines. The `is_syncretic`, `is_primary`, `is_kept_at_home`, and `is_sick_in_household` boolean columns serve as categorical flags that reduce multi-valued attributes to binary decisions, simplifying both storage and query logic.

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

The view `vw_religious_practice_survey_response` joins `religious_practices` to `survey_responses` on their shared `survey_response_id` and `religious_practice_id` columns. This join answers the question: "What cultural practice characteristics are associated with each survey respondent?" Reading the first row, we see that respondent 1000 (age 11, from `compact-country-26`, household size 11, with a sick member) is linked to the practice `Seasonal Survey` of type `ancestor_veneration`, with a prevalence of 19.70% in `distributed-region-12` and a non-syncretic classification. The second row reveals that respondent 1001 (age 18, from `composite-country-27`, household size 22, no sick member) is associated with the practice `Integrated Corridor` of type `spirit_sacrifice`, at 23.40% prevalence in `baseline-region-13`, classified as syncretic. This view enables direct correlation between respondent demographics and the specific practices they engage with.

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

The view `vw_religious_practice_religious_identity` joins `religious_practices` to `religious_identities` via their mutual `religious_practice_id` and `religious_identity_id` keys. It answers: "Which religious identities are associated with which practices?" The first row pairs practice `Seasonal Survey` (type `ancestor_veneration`) with identity `Adaptive Protocol` (deeply committed, primary). The second row links practice `Integrated Corridor` (type `spirit_sacrifice`, syncretic) to identity `Primary Programme` (moderately committed, not primary). This view exposes the practice-identity mapping that underlies the cultural classification layer, revealing how syncretic practices may co-occur with non-primary identities.

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

The view `vw_religious_identity_survey_response` joins `religious_identities` to `survey_responses` on `survey_response_id` and `religious_identity_id`. It answers: "What demographic and contextual profile accompanies each religious identity?" The first row shows that the `Adaptive Protocol` identity (deeply committed, primary) is held by respondent 1000, age 11, from `compact-country-26`, in a household of 11 with a sick member. The third row reveals that the `Composite Standard D` identity (casual adherence, primary) corresponds to respondent 1002, age 25, from `primary-country-28`, in a household of 33 with a sick member. This view is essential for demographic analysis of religious adherence patterns.

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

The view `vw_religious_identity_religious_practice` joins `religious_identities` to `religious_practices` via their shared keys. It answers: "Which practices are linked to each religious identity?" The first row connects identity `Adaptive Protocol` (deeply committed) with practice `Seasonal Survey` (ancestor veneration, 19.70% prevalence). The fourth row links identity `Compact Framework` (non-practicing) with practice `Pilot Assessment` (healing ritual, 30.80% prevalence, syncretic). This view reveals an interesting pattern: the non-practicing identity is associated with the highest-prevalence practice, suggesting that even non-practicing individuals may be embedded in high-prevalence cultural contexts.

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

The view `vw_survey_response_religious_identity` joins `survey_responses` to `religious_identities` on `survey_response_id` and `religious_identity_id`. It answers: "What religious identity does each survey respondent hold?" The first row shows respondent 1000 (age 11, `primary-responde-94`, `compact-country-26`) holds the `Adaptive Protocol` identity with deep commitment. The fourth row shows respondent 1003 (age 32, `baseline-responde-97`, `adaptive-country-29`) holds the `Compact Framework` identity with non-practicing adherence. This view is the inverse of `vw_religious_identity_survey_response` and serves as the primary demographic-to-identity lookup.

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

The view `vw_survey_response_religious_practice` joins `survey_responses` to `religious_practices` on `survey_response_id` and `religious_practice_id`. It answers: "What practice is each respondent associated with?" The first row links respondent 1000 to practice `Seasonal Survey` (ancestor veneration, 19.70% prevalence). The third row links respondent 1002 to practice `Extended Series D` (charm usage, 27.10% prevalence). This view is critical for correlating respondent demographics with practice type and prevalence, enabling analyses such as whether older respondents (e.g., age 32 in row 4) are associated with higher-prevalence practices.

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

The view `vw_survey_response_traditional_healer` joins `survey_responses` to `traditional_healers` on `survey_response_id` and `traditional_healer_id`. It answers: "Which traditional healer is associated with each survey respondent?" The first row shows respondent 1000 is linked to healer `Deskripsi`, a diviner in `pilot-region-92` who is not formally recognized. The second row shows respondent 1001 is linked to healer `model_delegation_child0`, a healer in `extended-region-93` who is recognized. This view enables analysis of healer recognition status against respondent demographics and health status.

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

The view `vw_survey_response_sacred_object` joins `survey_responses` to `sacred_objects` on `survey_response_id` and `sacred_object_id`. It answers: "What sacred object is associated with each survey respondent?" The first row shows respondent 1000 is associated with an `animal_skin` object of type `adaptive-protecti-11` that is kept at home. The third row shows respondent 1002 is associated with a `charm` object (`baseline-protecti-13`) that is also kept at home. The second and fourth rows show objects (`skull` and `amulet`) that are not kept at home. This view enables analysis of domestic versus external sacred object placement across respondents.

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

The view `vw_traditional_healer_survey_response` joins `traditional_healers` to `survey_responses` on `survey_response_id` and `traditional_healer_id`. It answers: "What respondent profile is documented for each healer?" The first row shows healer `Deskripsi` (diviner, not recognized, `pilot-region-92`) is documented in survey response 1000, where the respondent is age 11, from `compact-country-26`, in a household of 11 with a sick member. The fourth row shows healer `4920` (diviner, recognized, `seasonal-region-95`) is documented in survey response 1003, where the respondent is age 32, from `adaptive-country-29`, in a household of 44 with no sick member. This view is useful for healer-centric demographic profiling.

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

The view `vw_traditional_healer_traditional_medicine` joins `traditional_healers` to `traditional_medicines` on `traditional_healer_id` and `id`. It answers: "Which medicines does each healer prepare?" The first row shows healer `Deskripsi` prepares `Adaptive Series` medicine from `primary-source-34` with intended effect `healing`. The second row shows healer `model_delegation_child0` prepares `Primary Assessment` from `adaptive-source-35` with intended effect `protection`. The third row shows healer `2933461` prepares `Composite Survey D` from `distributed-source-36` with intended effect `restoring_order`. The fourth row shows healer `4920` prepares `Compact Corridor` from `baseline-source-37` with intended effect `counteracting_witchcraft`. This view directly maps healer specialisation to therapeutic output.

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

The view `vw_sacred_object_survey_response` joins `sacred_objects` to `survey_responses` on `survey_response_id` and `id`. It answers: "What respondent profile is associated with each sacred object?" The first row shows the `animal_skin` object (`adaptive-protecti-11`, kept at home) is associated with respondent 1000 (age 11, `compact-country-26`, household 11, sick member). The fourth row shows the `amulet` object (`pilot-protecti-14`, not kept at home) is associated with respondent 1003 (age 32, `adaptive-country-29`, household 44, no sick member). This view enables analysis of whether certain object types or placement patterns correlate with respondent characteristics.

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

The view `vw_sacred_object_religious_practice` joins `sacred_objects` to `religious_practices` on `religious_practice_id` and `id`. It answers: "Which practices are associated with which sacred objects?" The first row links the `animal_skin` object to practice `Seasonal Survey` (ancestor veneration, 19.70% prevalence). The second row links the `skull` object to practice `Integrated Corridor` (spirit sacrifice, 23.40% prevalence, syncretic). The third row links the `charm` object to practice `Extended Series D` (charm usage, 27.10% prevalence). The fourth row links the `amulet` object to practice `Pilot Assessment` (healing ritual, 30.80% prevalence, syncretic). This view reveals the material-practice association, showing how different object types map onto different ritual modalities.

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

The view `vw_traditional_medicine_traditional_healer` joins `traditional_medicines` to `traditional_healers` on `traditional_healer_id` and `id`. It answers: "Which healer prepares each medicine?" The first row shows `Adaptive Series` medicine (source `primary-source-34`, effect `healing`) is prepared by healer `Deskripsi` (diviner, not recognized). The second row shows `Primary Assessment` medicine (source `adaptive-source-35`, effect `protection`) is prepared by healer `model_delegation_child0` (healer, recognized). The third row shows `Composite Survey D` medicine (source `distributed-source-36`, effect `restoring_order`) is prepared by healer `2933461` (both, not recognized). The fourth row shows `Compact Corridor` medicine (source `baseline-source-37`, effect `counteracting_witchcraft`) is prepared by healer `4920` (diviner, recognized). This view is the inverse of `vw_traditional_healer_traditional_medicine` and serves as the primary medicine-to-healer lookup.

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

The view `vw_traditional_medicine_survey_response` joins `traditional_medicines` to `survey_responses` on `survey_response_id` and `id`. It answers: "What respondent profile is documented for each traditional medicine?" The first row shows `Adaptive Series` medicine (healing effect) is documented in survey response 1000, where the respondent is age 11, from `compact-country-26`, in a household of 11 with a sick member. The fourth row shows `Compact Corridor` medicine (counteracting witchcraft effect) is documented in survey response 1003, where the respondent is age 32, from `adaptive-country-29`, in a household of 44 with no sick member. This view enables analysis of medicine purpose against respondent health status and household composition.

The relational schema, as materialised through these tables and views, faithfully encodes the ontology of cultural heritage survey data. Each entity type is represented by a dedicated table with attributes mapped to columns, and relationships are expressed through foreign keys that enforce referential integrity. The views provide denormalised projections that reconstruct domain facts by joining the normalised tables, enabling analysts to answer specific questions without writing explicit join clauses. The schema supports both respondent-centric queries (starting from `survey_responses`) and entity-centric queries (starting from any dimension table), reflecting the bidirectional nature of the underlying domain relationships. All organisations, people, and products referenced in the data are fictional, and the schema design ensures that any analysis performed on this data remains bounded by the observational scope of the survey instrument.