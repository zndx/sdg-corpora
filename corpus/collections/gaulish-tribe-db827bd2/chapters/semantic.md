The study of ancient Gaulish ethnography, toponymy, and epigraphic record demands a data model that can simultaneously capture tribal identities, place names, inscribed texts, linguistic interpretations, territorial boundaries, and the documentary sources that bind them. The relational schema presented here normalises these concerns into six base tables and three junction tables, then reassembles them through twenty materialised views. Each view answers a specific historical question by joining the appropriate tables, and every join can be traced back to a foreign-key constraint in the underlying DDL.

## The Base Tables

The schema centres on six entity tables. The `gaulish_tribes` table stores one row per tribal group. Its primary key `id` is a synthetic integer (1000–1003 in the sample), while the ethnonym column carries values such as `seasonal-ethnonym-17` and `regional-ethnonym-18`. The boolean `is_celtic_origin` distinguishes tribes of confirmed Celtic descent from those of uncertain lineage, and `slavic_etymology` records a derived label like `regional-slavic-36` or `legacy-slavic-37`. Two foreign keys anchor each tribe to its territorial and epigraphic context: `historical_region_id` references `historical_regions.id`, and `epigraphic_inscription_id` references `epigraphic_inscriptions.epigraphic_inscription_id`. The `created_at` timestamp (e.g. `2025-01-01 00:14:00`) records when the record entered the database.

**Table `gaulish_tribes`**

| id | ethnonym | primary_occupation | settlement_area | is_celtic_origin | slavic_etymology | epigraphic_inscription_id | historical_region_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | baseline-settleme-37 | true | regional-slavic-36 | 100 | 1 | 2025-01-01 00:14:00 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | pilot-settleme-38 | false | legacy-slavic-37 | 101 | 2 | 2025-02-06 03:14:00 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | extended-settleme-39 | true | compact-slavic-38 | 102 | 3 | 2025-03-11 06:14:00 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | integrated-settleme-40 | false | composite-slavic-39 | 103 | 4 | 2025-04-16 09:14:00 |

The `toponyms` table records place names. Its primary key `id` (100–103) is shared with the epigraphic and linguistic tables to enable cross-referencing. The `name` column holds human-readable labels such as `Extended Review` and `Pilot Initiative A`, while `region` and `slavic_root` capture geographic and etymological metadata. The `confidence_level` column (values like `baseline-confiden-91` and `pilot-confiden-92`) quantifies the reliability of the toponymic attribution. Three foreign keys—`historical_region_id`, `gaulish_tribe_id`, and `historical_document_id`—tie each toponym to its territorial, tribal, and documentary provenance.

**Table `toponyms`**

| id | name | region | slavic_root | source_map | confidence_level | historical_region_id | gaulish_tribe_id | historical_document_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Extended Review | distributed-region-12 | primary-slavic-10 | adaptive-source-89 | baseline-confiden-91 | 1 | 1000 | 1 |
| 101 | Pilot Initiative A | baseline-region-13 | adaptive-slavic-11 | distributed-source-90 | pilot-confiden-92 | 2 | 1001 | 2 |
| 102 | Baseline Model | pilot-region-14 | distributed-slavic-12 | baseline-source-91 | extended-confiden-93 | 3 | 1002 | 3 |
| 103 | Distributed Cluster | extended-region-15 | baseline-slavic-13 | pilot-source-92 | integrated-confiden-94 | 4 | 1003 | 4 |

The `epigraphic_inscriptions` table stores one row per discovered inscription. Its primary key is `epigraphic_inscription_id` (100–103), and the `inscription_text` column carries values such as `distributed-inscript-78` and `baseline-inscript-79`. The `script_type` column (e.g. `regional-script-18`, `legacy-script-19`) classifies the writing system, while `discovery_location` and `deciphered_meaning` record where the text was found and what it means. The `source_reference` column (e.g. `integrated-source-58`) points to the publication or excavation report. Foreign keys `historical_region_id`, `linguistic_analysis_id`, and `gaulish_tribe_id` link each inscription to its territorial, analytical, and tribal context.

**Table `epigraphic_inscriptions`**

| epigraphic_inscription_id | inscription_text | script_type | discovery_location | deciphered_meaning | source_reference | historical_region_id | linguistic_analysis_id | gaulish_tribe_id |
|---|---|---|---|---|---|---|---|---|
| 100 | distributed-inscript-78 | regional-script-18 | baseline-discover-43 | baseline-decipher-85 | integrated-source-58 | 1 | 1000 | 1000 |
| 101 | baseline-inscript-79 | legacy-script-19 | pilot-discover-44 | pilot-decipher-86 | seasonal-source-59 | 2 | 1001 | 1001 |
| 102 | pilot-inscript-80 | compact-script-20 | extended-discover-45 | extended-decipher-87 | regional-source-60 | 3 | 1002 | 1002 |
| 103 | extended-inscript-81 | composite-script-21 | integrated-discover-46 | integrated-decipher-88 | legacy-source-61 | 4 | 1003 | 1003 |

The `linguistic_analysises` table captures scholarly interpretations of inscriptions and toponyms. Its primary key `id` (1000–1003) is distinct from the epigraphic IDs to avoid confusion, and the `methodology` column records the analytical approach (e.g. `compact-methodol-68`, `composite-methodol-69`). The `slavic_language_basis` column (e.g. `legacy-slavic-73`) indicates the comparative language used, while `interpretation_result` stores the conclusion (e.g. `baseline-interpre-91`). The `author` column names the scholar—Norma Fisher, Daniel Abbott, Chris Bennett, Ernest Hemingway—and `publication_year` records the year of publication (25, 33, 41, 49). Three foreign keys—`epigraphic_inscription_id`, `toponym_id`, and `historical_document_id`—tie each analysis to its source material.

**Table `linguistic_analysises`**

| id | methodology | slavic_language_basis | interpretation_result | author | publication_year | epigraphic_inscription_id | toponym_id | historical_document_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | compact-methodol-68 | legacy-slavic-73 | baseline-interpre-91 | Norma Fisher | 25 | 100 | 100 | 1 |
| 1001 | composite-methodol-69 | compact-slavic-74 | pilot-interpre-92 | Daniel Abbott | 33 | 101 | 101 | 2 |
| 1002 | primary-methodol-70 | composite-slavic-75 | extended-interpre-93 | Chris Bennett | 41 | 102 | 102 | 3 |
| 1003 | adaptive-methodol-71 | primary-slavic-76 | integrated-interpre-94 | Ernest Hemingway | 49 | 103 | 103 | 4 |

The `historical_regions` table defines territorial units. Its primary key `id` (1–4) is small to reflect the limited number of regions in the sample. The `region_name` column holds labels such as `Distributed Assessment` and `Adaptive Survey D`, while `geographical_bounds` and `dominant_culture` describe the spatial and cultural extent. The `slavic_influence_level` column (e.g. `distributed-slavic-60`) quantifies Slavic cultural penetration, and `historical_period` classifies the era (e.g. `compact-historic-26`). A single foreign key `epigraphic_inscription_id` links each region to a representative inscription.

**Table `historical_regions`**

| id | region_name | geographical_bounds | dominant_culture | slavic_influence_level | historical_period | epigraphic_inscription_id |
|---|---|---|---|---|---|---|
| 1 | Distributed Assessment | seasonal-geograph-59 | pilot-dominant-68 | distributed-slavic-60 | compact-historic-26 | 100 |
| 2 | Adaptive Survey D | regional-geograph-60 | extended-dominant-69 | baseline-slavic-61 | composite-historic-27 | 101 |
| 3 | Primary Corridor | legacy-geograph-61 | integrated-dominant-70 | pilot-slavic-62 | primary-historic-28 | 102 |
| 4 | Composite Series | compact-geograph-62 | seasonal-dominant-71 | extended-slavic-63 | adaptive-historic-29 | 103 |

The `historical_documents` table stores scholarly publications. Its primary key `id` (1–4) is small, and the `document_title` column holds labels such as `Compact Series` and `Legacy Assessment`. The `author` column repeats the scholar names seen in `linguistic_analysises`, and `publication_year` mirrors the same values (25, 33, 41, 49). The `document_type` column (e.g. `distributed-document-96`) classifies the genre, while `content_summary` provides a brief description. Three foreign keys—`linguistic_analysis_id`, `toponym_id`, and `epigraphic_inscription_id`—tie each document to its analytical, toponymic, and epigraphic anchors.

**Table `historical_documents`**

| id | document_title | author | publication_year | document_type | content_summary | linguistic_analysis_id | toponym_id | epigraphic_inscription_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Compact Series | Norma Fisher | 25 | distributed-document-96 | seasonal-content-41 | 1000 | 100 | 100 |
| 2 | Legacy Assessment | Daniel Abbott | 33 | baseline-document-97 | regional-content-42 | 1001 | 101 | 101 |
| 3 | Regional Survey A | Chris Bennett | 41 | pilot-document-98 | legacy-content-43 | 1002 | 102 | 102 |
| 4 | Seasonal Corridor | Ernest Hemingway | 49 | extended-document-99 | compact-content-44 | 1003 | 103 | 103 |

## Junction Tables and Many-to-Many Relationships

Three junction tables resolve many-to-many relationships that cannot be expressed through single foreign keys. The `tribes_toponyms` table links `gaulish_tribes` to `toponyms`, allowing a single tribe to be associated with multiple place names and vice versa. The `regions_toponyms` table links `historical_regions` to `toponyms`, enabling a place name to span multiple territorial boundaries and a region to contain multiple toponyms. The `regions_tribes` table links `historical_regions` to `gaulish_tribes`, supporting the historical reality that tribes migrated across regions and regions contained multiple tribal groups.

**Table `tribes_toponyms`**

| gaulish_tribe_id | toponym_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `regions_toponyms`**

| historical_region_id | toponym_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `regions_tribes`**

| historical_region_id | gaulish_tribe_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

## Views: Reconstructing Domain Facts

The twenty views materialise the most common analytical queries by joining the base and junction tables. Each view answers a specific historical question and can be read as a denormalised fact table.

The view `v_gaulish_tribe_toponym_detail` joins `gaulish_tribes` to `toponyms` on `gaulish_tribes.id = toponyms.gaulish_tribe_id`, producing rows that pair a tribe's ethnonym with its associated place name. A sample row might show `seasonal-ethnonym-17` alongside `Extended Review`, revealing which toponym the tribe is historically linked to.

**View `v_gaulish_tribe_toponym_detail`**

```sql
CREATE VIEW v_gaulish_tribe_toponym_detail AS
SELECT a.id, a.ethnonym, a.primary_occupation, b.id AS toponym_id, b.name AS toponym_name, b.region AS toponym_region
FROM gaulish_tribes a
  JOIN tribes_toponyms j ON j.gaulish_tribe_id = a.id
  JOIN toponyms b ON b.id = j.toponym_id;
```

| id | ethnonym | primary_occupation | toponym_id | toponym_name | toponym_region |
|---|---|---|---|---|---|
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | 100 | Extended Review | distributed-region-12 |
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | 101 | Pilot Initiative A | baseline-region-13 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | 101 | Pilot Initiative A | baseline-region-13 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | 102 | Baseline Model | pilot-region-14 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | 102 | Baseline Model | pilot-region-14 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | 103 | Distributed Cluster | extended-region-15 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | 103 | Distributed Cluster | extended-region-15 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | 100 | Extended Review | distributed-region-12 |

The view `v_gaulish_tribe_epigraphic_inscription` joins `gaulish_tribes` to `epigraphic_inscriptions` on `gaulish_tribes.id = epigraphic_inscriptions.gaulish_tribe_id`, pairing tribal identities with their inscribed texts. A row might show `regional-ethnonym-18` alongside `baseline-inscript-79`, connecting a tribe to a specific archaeological find.

**View `v_gaulish_tribe_epigraphic_inscription`**

```sql
CREATE VIEW v_gaulish_tribe_epigraphic_inscription AS
SELECT a.id, a.ethnonym, a.primary_occupation, a.settlement_area, b.epigraphic_inscription_id AS inscription_epigraphic_inscription_id, b.inscription_text AS inscription_inscription_text, b.script_type AS inscription_script_type
FROM gaulish_tribes a JOIN epigraphic_inscriptions b ON a.epigraphic_inscription_id = b.epigraphic_inscription_id;
```

| id | ethnonym | primary_occupation | settlement_area | inscription_epigraphic_inscription_id | inscription_inscription_text | inscription_script_type |
|---|---|---|---|---|---|---|
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | baseline-settleme-37 | 100 | distributed-inscript-78 | regional-script-18 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | pilot-settleme-38 | 101 | baseline-inscript-79 | legacy-script-19 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | extended-settleme-39 | 102 | pilot-inscript-80 | compact-script-20 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | integrated-settleme-40 | 103 | extended-inscript-81 | composite-script-21 |

The view `v_gaulish_tribe_historical_region` joins `gaulish_tribes` to `historical_regions` on `gaulish_tribes.historical_region_id = historical_regions.id`, revealing the territorial context of each tribe. A row might show `legacy-ethnonym-19` alongside `Primary Corridor`, situating the tribe within a specific geographical and cultural zone.

**View `v_gaulish_tribe_historical_region`**

```sql
CREATE VIEW v_gaulish_tribe_historical_region AS
SELECT a.id, a.ethnonym, a.primary_occupation, a.settlement_area, b.id AS region_id, b.region_name AS region_region_name, b.geographical_bounds AS region_geographical_bounds
FROM gaulish_tribes a JOIN historical_regions b ON a.historical_region_id = b.id;
```

| id | ethnonym | primary_occupation | settlement_area | region_id | region_region_name | region_geographical_bounds |
|---|---|---|---|---|---|---|
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | baseline-settleme-37 | 1 | Distributed Assessment | seasonal-geograph-59 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | pilot-settleme-38 | 2 | Adaptive Survey D | regional-geograph-60 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | extended-settleme-39 | 3 | Primary Corridor | legacy-geograph-61 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | integrated-settleme-40 | 4 | Composite Series | compact-geograph-62 |

The view `v_toponym_historical_region` joins `toponyms` to `historical_regions` on `toponyms.historical_region_id = historical_regions.id`, answering which territorial unit a place name belongs to. A row might show `Extended Review` alongside `Distributed Assessment`, mapping a toponym to its governing region.

**View `v_toponym_historical_region`**

```sql
CREATE VIEW v_toponym_historical_region AS
SELECT a.id, a.name, a.region, a.slavic_root, b.id AS region_id, b.region_name AS region_region_name, b.geographical_bounds AS region_geographical_bounds
FROM toponyms a JOIN historical_regions b ON a.historical_region_id = b.id;
```

| id | name | region | slavic_root | region_id | region_region_name | region_geographical_bounds |
|---|---|---|---|---|---|---|
| 100 | Extended Review | distributed-region-12 | primary-slavic-10 | 1 | Distributed Assessment | seasonal-geograph-59 |
| 101 | Pilot Initiative A | baseline-region-13 | adaptive-slavic-11 | 2 | Adaptive Survey D | regional-geograph-60 |
| 102 | Baseline Model | pilot-region-14 | distributed-slavic-12 | 3 | Primary Corridor | legacy-geograph-61 |
| 103 | Distributed Cluster | extended-region-15 | baseline-slavic-13 | 4 | Composite Series | compact-geograph-62 |

The view `v_toponym_gaulish_tribe` joins `toponyms` to `gaulish_tribes` on `toponyms.gaulish_tribe_id = gaulish_tribes.id`, revealing which tribal group a place name is associated with. A row might show `Pilot Initiative A` alongside `regional-ethnonym-18`, connecting a toponym to its tribal provenance.

**View `v_toponym_gaulish_tribe`**

```sql
CREATE VIEW v_toponym_gaulish_tribe AS
SELECT a.id, a.name, a.region, a.slavic_root, b.id AS tribe_id, b.ethnonym AS tribe_ethnonym, b.primary_occupation AS tribe_primary_occupation
FROM toponyms a JOIN gaulish_tribes b ON a.gaulish_tribe_id = b.id;
```

| id | name | region | slavic_root | tribe_id | tribe_ethnonym | tribe_primary_occupation |
|---|---|---|---|---|---|---|
| 100 | Extended Review | distributed-region-12 | primary-slavic-10 | 1000 | seasonal-ethnonym-17 | composite-primary-39 |
| 101 | Pilot Initiative A | baseline-region-13 | adaptive-slavic-11 | 1001 | regional-ethnonym-18 | primary-primary-40 |
| 102 | Baseline Model | pilot-region-14 | distributed-slavic-12 | 1002 | legacy-ethnonym-19 | adaptive-primary-41 |
| 103 | Distributed Cluster | extended-region-15 | baseline-slavic-13 | 1003 | compact-ethnonym-20 | distributed-primary-42 |

The view `v_toponym_historical_document` joins `toponyms` to `historical_documents` on `toponyms.historical_document_id = historical_documents.id`, linking place names to the scholarly publications that discuss them. A row might show `Baseline Model` alongside `Regional Survey A`, tracing a toponym to its documentary source.

**View `v_toponym_historical_document`**

```sql
CREATE VIEW v_toponym_historical_document AS
SELECT a.id, a.name, a.region, a.slavic_root, b.id AS document_id, b.document_title AS document_document_title, b.author AS document_author
FROM toponyms a JOIN historical_documents b ON a.historical_document_id = b.id;
```

| id | name | region | slavic_root | document_id | document_document_title | document_author |
|---|---|---|---|---|---|---|
| 100 | Extended Review | distributed-region-12 | primary-slavic-10 | 1 | Compact Series | Norma Fisher |
| 101 | Pilot Initiative A | baseline-region-13 | adaptive-slavic-11 | 2 | Legacy Assessment | Daniel Abbott |
| 102 | Baseline Model | pilot-region-14 | distributed-slavic-12 | 3 | Regional Survey A | Chris Bennett |
| 103 | Distributed Cluster | extended-region-15 | baseline-slavic-13 | 4 | Seasonal Corridor | Ernest Hemingway |

The view `v_epigraphic_inscription_historical_region` joins `epigraphic_inscriptions` to `historical_regions` on `epigraphic_inscriptions.historical_region_id = historical_regions.id`, situating inscriptions within their territorial context. A row might show `distributed-inscript-78` alongside `Distributed Assessment`, connecting an archaeological find to its region.

**View `v_epigraphic_inscription_historical_region`**

```sql
CREATE VIEW v_epigraphic_inscription_historical_region AS
SELECT a.epigraphic_inscription_id, a.inscription_text, a.script_type, a.discovery_location, b.id AS region_id, b.region_name AS region_region_name, b.geographical_bounds AS region_geographical_bounds
FROM epigraphic_inscriptions a JOIN historical_regions b ON a.historical_region_id = b.id;
```

| epigraphic_inscription_id | inscription_text | script_type | discovery_location | region_id | region_region_name | region_geographical_bounds |
|---|---|---|---|---|---|---|
| 100 | distributed-inscript-78 | regional-script-18 | baseline-discover-43 | 1 | Distributed Assessment | seasonal-geograph-59 |
| 101 | baseline-inscript-79 | legacy-script-19 | pilot-discover-44 | 2 | Adaptive Survey D | regional-geograph-60 |
| 102 | pilot-inscript-80 | compact-script-20 | extended-discover-45 | 3 | Primary Corridor | legacy-geograph-61 |
| 103 | extended-inscript-81 | composite-script-21 | integrated-discover-46 | 4 | Composite Series | compact-geograph-62 |

The view `v_epigraphic_inscription_linguistic_analysis` joins `epigraphic_inscriptions` to `linguistic_analysises` on `epigraphic_inscriptions.epigraphic_inscription_id = linguistic_analysises.epigraphic_inscription_id`, pairing inscriptions with their scholarly interpretations. A row might show `distributed-inscript-78` alongside the analysis by Norma Fisher published in year 25, linking raw text to its linguistic reading.

**View `v_epigraphic_inscription_linguistic_analysis`**

```sql
CREATE VIEW v_epigraphic_inscription_linguistic_analysis AS
SELECT a.epigraphic_inscription_id, a.inscription_text, a.script_type, a.discovery_location, b.id AS analysis_id, b.methodology AS analysis_methodology, b.slavic_language_basis AS analysis_slavic_language_basis
FROM epigraphic_inscriptions a JOIN linguistic_analysises b ON a.linguistic_analysis_id = b.id;
```

| epigraphic_inscription_id | inscription_text | script_type | discovery_location | analysis_id | analysis_methodology | analysis_slavic_language_basis |
|---|---|---|---|---|---|---|
| 100 | distributed-inscript-78 | regional-script-18 | baseline-discover-43 | 1000 | compact-methodol-68 | legacy-slavic-73 |
| 101 | baseline-inscript-79 | legacy-script-19 | pilot-discover-44 | 1001 | composite-methodol-69 | compact-slavic-74 |
| 102 | pilot-inscript-80 | compact-script-20 | extended-discover-45 | 1002 | primary-methodol-70 | composite-slavic-75 |
| 103 | extended-inscript-81 | composite-script-21 | integrated-discover-46 | 1003 | adaptive-methodol-71 | primary-slavic-76 |

The view `v_epigraphic_inscription_gaulish_tribe` joins `epigraphic_inscriptions` to `gaulish_tribes` on `epigraphic_inscriptions.gaulish_tribe_id = gaulish_tribes.id`, connecting inscribed texts to the tribes that produced or were associated with them. A row might show `baseline-inscript-79` alongside `regional-ethnonym-18`, establishing a tribal provenance for the inscription.

**View `v_epigraphic_inscription_gaulish_tribe`**

```sql
CREATE VIEW v_epigraphic_inscription_gaulish_tribe AS
SELECT a.epigraphic_inscription_id, a.inscription_text, a.script_type, a.discovery_location, b.id AS tribe_id, b.ethnonym AS tribe_ethnonym, b.primary_occupation AS tribe_primary_occupation
FROM epigraphic_inscriptions a JOIN gaulish_tribes b ON a.gaulish_tribe_id = b.id;
```

| epigraphic_inscription_id | inscription_text | script_type | discovery_location | tribe_id | tribe_ethnonym | tribe_primary_occupation |
|---|---|---|---|---|---|---|
| 100 | distributed-inscript-78 | regional-script-18 | baseline-discover-43 | 1000 | seasonal-ethnonym-17 | composite-primary-39 |
| 101 | baseline-inscript-79 | legacy-script-19 | pilot-discover-44 | 1001 | regional-ethnonym-18 | primary-primary-40 |
| 102 | pilot-inscript-80 | compact-script-20 | extended-discover-45 | 1002 | legacy-ethnonym-19 | adaptive-primary-41 |
| 103 | extended-inscript-81 | composite-script-21 | integrated-discover-46 | 1003 | compact-ethnonym-20 | distributed-primary-42 |

The view `v_linguistic_analysis_epigraphic_inscription` joins `linguistic_analysises` to `epigraphic_inscriptions` on `linguistic_analysises.epigraphic_inscription_id = epigraphic_inscriptions.epigraphic_inscription_id`, presenting the analytical perspective: each row shows an interpretation alongside the inscription it deciphers. A row might show the methodology `compact-methodol-68` alongside `distributed-inscript-78`, revealing the analytical lens applied to the raw text.

**View `v_linguistic_analysis_epigraphic_inscription`**

```sql
CREATE VIEW v_linguistic_analysis_epigraphic_inscription AS
SELECT a.id, a.methodology, a.slavic_language_basis, a.interpretation_result, b.epigraphic_inscription_id AS inscription_epigraphic_inscription_id, b.inscription_text AS inscription_inscription_text, b.script_type AS inscription_script_type
FROM linguistic_analysises a JOIN epigraphic_inscriptions b ON a.epigraphic_inscription_id = b.epigraphic_inscription_id;
```

| id | methodology | slavic_language_basis | interpretation_result | inscription_epigraphic_inscription_id | inscription_inscription_text | inscription_script_type |
|---|---|---|---|---|---|---|
| 1000 | compact-methodol-68 | legacy-slavic-73 | baseline-interpre-91 | 100 | distributed-inscript-78 | regional-script-18 |
| 1001 | composite-methodol-69 | compact-slavic-74 | pilot-interpre-92 | 101 | baseline-inscript-79 | legacy-script-19 |
| 1002 | primary-methodol-70 | composite-slavic-75 | extended-interpre-93 | 102 | pilot-inscript-80 | compact-script-20 |
| 1003 | adaptive-methodol-71 | primary-slavic-76 | integrated-interpre-94 | 103 | extended-inscript-81 | composite-script-21 |

The view `v_linguistic_analysis_toponym` joins `linguistic_analysises` to `toponyms` on `linguistic_analysises.toponym_id = toponyms.id`, linking scholarly interpretations to the place names they analyse. A row might show the interpretation `baseline-interpre-91` alongside the toponym `Extended Review`, connecting linguistic analysis to its toponymic subject.

**View `v_linguistic_analysis_toponym`**

```sql
CREATE VIEW v_linguistic_analysis_toponym AS
SELECT a.id, a.methodology, a.slavic_language_basis, a.interpretation_result, b.id AS toponym_id, b.name AS toponym_name, b.region AS toponym_region
FROM linguistic_analysises a JOIN toponyms b ON a.toponym_id = b.id;
```

| id | methodology | slavic_language_basis | interpretation_result | toponym_id | toponym_name | toponym_region |
|---|---|---|---|---|---|---|
| 1000 | compact-methodol-68 | legacy-slavic-73 | baseline-interpre-91 | 100 | Extended Review | distributed-region-12 |
| 1001 | composite-methodol-69 | compact-slavic-74 | pilot-interpre-92 | 101 | Pilot Initiative A | baseline-region-13 |
| 1002 | primary-methodol-70 | composite-slavic-75 | extended-interpre-93 | 102 | Baseline Model | pilot-region-14 |
| 1003 | adaptive-methodol-71 | primary-slavic-76 | integrated-interpre-94 | 103 | Distributed Cluster | extended-region-15 |

The view `v_linguistic_analysis_historical_document` joins `linguistic_analysises` to `historical_documents` on `linguistic_analysises.historical_document_id = historical_documents.id`, tracing each analysis back to its source publication. A row might show the analysis by Daniel Abbott alongside the document `Legacy Assessment`, establishing the bibliographic provenance of the interpretation.

**View `v_linguistic_analysis_historical_document`**

```sql
CREATE VIEW v_linguistic_analysis_historical_document AS
SELECT a.id, a.methodology, a.slavic_language_basis, a.interpretation_result, b.id AS document_id, b.document_title AS document_document_title, b.author AS document_author
FROM linguistic_analysises a JOIN historical_documents b ON a.historical_document_id = b.id;
```

| id | methodology | slavic_language_basis | interpretation_result | document_id | document_document_title | document_author |
|---|---|---|---|---|---|---|
| 1000 | compact-methodol-68 | legacy-slavic-73 | baseline-interpre-91 | 1 | Compact Series | Norma Fisher |
| 1001 | composite-methodol-69 | compact-slavic-74 | pilot-interpre-92 | 2 | Legacy Assessment | Daniel Abbott |
| 1002 | primary-methodol-70 | composite-slavic-75 | extended-interpre-93 | 3 | Regional Survey A | Chris Bennett |
| 1003 | adaptive-methodol-71 | primary-slavic-76 | integrated-interpre-94 | 4 | Seasonal Corridor | Ernest Hemingway |

The view `v_historical_region_toponym_detail` joins `historical_regions` to `toponyms` on `historical_regions.id = toponyms.historical_region_id`, presenting a territorial inventory: each row lists a region alongside the place names it contains. A row might show `Distributed Assessment` alongside `Extended Review`, building a geographic catalogue of toponyms per region.

**View `v_historical_region_toponym_detail`**

```sql
CREATE VIEW v_historical_region_toponym_detail AS
SELECT a.id, a.region_name, a.geographical_bounds, b.id AS toponym_id, b.name AS toponym_name, b.region AS toponym_region
FROM historical_regions a
  JOIN regions_toponyms j ON j.historical_region_id = a.id
  JOIN toponyms b ON b.id = j.toponym_id;
```

| id | region_name | geographical_bounds | toponym_id | toponym_name | toponym_region |
|---|---|---|---|---|---|
| 1 | Distributed Assessment | seasonal-geograph-59 | 100 | Extended Review | distributed-region-12 |
| 1 | Distributed Assessment | seasonal-geograph-59 | 101 | Pilot Initiative A | baseline-region-13 |
| 2 | Adaptive Survey D | regional-geograph-60 | 101 | Pilot Initiative A | baseline-region-13 |
| 2 | Adaptive Survey D | regional-geograph-60 | 102 | Baseline Model | pilot-region-14 |
| 3 | Primary Corridor | legacy-geograph-61 | 102 | Baseline Model | pilot-region-14 |
| 3 | Primary Corridor | legacy-geograph-61 | 103 | Distributed Cluster | extended-region-15 |
| 4 | Composite Series | compact-geograph-62 | 103 | Distributed Cluster | extended-region-15 |
| 4 | Composite Series | compact-geograph-62 | 100 | Extended Review | distributed-region-12 |

The view `v_historical_region_gaulish_tribe_detail` joins `historical_regions` to `gaulish_tribes` on `historical_regions.id = gaulish_tribes.historical_region_id`, presenting a tribal census per region. A row might show `Distributed Assessment` alongside `seasonal-ethnonym-17`, revealing which tribes inhabited each territorial unit.

**View `v_historical_region_gaulish_tribe_detail`**

```sql
CREATE VIEW v_historical_region_gaulish_tribe_detail AS
SELECT a.id, a.region_name, a.geographical_bounds, b.id AS tribe_id, b.ethnonym AS tribe_ethnonym, b.primary_occupation AS tribe_primary_occupation
FROM historical_regions a
  JOIN regions_tribes j ON j.historical_region_id = a.id
  JOIN gaulish_tribes b ON b.id = j.gaulish_tribe_id;
```

| id | region_name | geographical_bounds | tribe_id | tribe_ethnonym | tribe_primary_occupation |
|---|---|---|---|---|---|
| 1 | Distributed Assessment | seasonal-geograph-59 | 1000 | seasonal-ethnonym-17 | composite-primary-39 |
| 1 | Distributed Assessment | seasonal-geograph-59 | 1001 | regional-ethnonym-18 | primary-primary-40 |
| 2 | Adaptive Survey D | regional-geograph-60 | 1001 | regional-ethnonym-18 | primary-primary-40 |
| 2 | Adaptive Survey D | regional-geograph-60 | 1002 | legacy-ethnonym-19 | adaptive-primary-41 |
| 3 | Primary Corridor | legacy-geograph-61 | 1002 | legacy-ethnonym-19 | adaptive-primary-41 |
| 3 | Primary Corridor | legacy-geograph-61 | 1003 | compact-ethnonym-20 | distributed-primary-42 |
| 4 | Composite Series | compact-geograph-62 | 1003 | compact-ethnonym-20 | distributed-primary-42 |
| 4 | Composite Series | compact-geograph-62 | 1000 | seasonal-ethnonym-17 | composite-primary-39 |

The view `v_historical_region_epigraphic_inscription` joins `historical_regions` to `epigraphic_inscriptions` on `historical_regions.id = epigraphic_inscriptions.historical_region_id`, situating archaeological finds within their territorial context. A row might show `Adaptive Survey D` alongside `baseline-inscript-79`, mapping an inscription to its region of discovery.

**View `v_historical_region_epigraphic_inscription`**

```sql
CREATE VIEW v_historical_region_epigraphic_inscription AS
SELECT a.id, a.region_name, a.geographical_bounds, a.dominant_culture, b.epigraphic_inscription_id AS inscription_epigraphic_inscription_id, b.inscription_text AS inscription_inscription_text, b.script_type AS inscription_script_type
FROM historical_regions a JOIN epigraphic_inscriptions b ON a.epigraphic_inscription_id = b.epigraphic_inscription_id;
```

| id | region_name | geographical_bounds | dominant_culture | inscription_epigraphic_inscription_id | inscription_inscription_text | inscription_script_type |
|---|---|---|---|---|---|---|
| 1 | Distributed Assessment | seasonal-geograph-59 | pilot-dominant-68 | 100 | distributed-inscript-78 | regional-script-18 |
| 2 | Adaptive Survey D | regional-geograph-60 | extended-dominant-69 | 101 | baseline-inscript-79 | legacy-script-19 |
| 3 | Primary Corridor | legacy-geograph-61 | integrated-dominant-70 | 102 | pilot-inscript-80 | compact-script-20 |
| 4 | Composite Series | compact-geograph-62 | seasonal-dominant-71 | 103 | extended-inscript-81 | composite-script-21 |

The view `v_historical_document_linguistic_analysis` joins `historical_documents` to `linguistic_analysises` on `historical_documents.id = linguistic_analysises.historical_document_id`, presenting a bibliographic index: each row lists a publication alongside the analyses it contains. A row might show `Compact Series` alongside the analysis by Norma Fisher, building a scholarly catalogue per document.

**View `v_historical_document_linguistic_analysis`**

```sql
CREATE VIEW v_historical_document_linguistic_analysis AS
SELECT a.id, a.document_title, a.author, a.publication_year, b.id AS analysis_id, b.methodology AS analysis_methodology, b.slavic_language_basis AS analysis_slavic_language_basis
FROM historical_documents a JOIN linguistic_analysises b ON a.linguistic_analysis_id = b.id;
```

| id | document_title | author | publication_year | analysis_id | analysis_methodology | analysis_slavic_language_basis |
|---|---|---|---|---|---|---|
| 1 | Compact Series | Norma Fisher | 25 | 1000 | compact-methodol-68 | legacy-slavic-73 |
| 2 | Legacy Assessment | Daniel Abbott | 33 | 1001 | composite-methodol-69 | compact-slavic-74 |
| 3 | Regional Survey A | Chris Bennett | 41 | 1002 | primary-methodol-70 | composite-slavic-75 |
| 4 | Seasonal Corridor | Ernest Hemingway | 49 | 1003 | adaptive-methodol-71 | primary-slavic-76 |

The view `v_historical_document_toponym` joins `historical_documents` to `toponyms` on `historical_documents.id = toponyms.historical_document_id`, linking publications to the place names they discuss. A row might show `Compact Series` alongside `Extended Review`, tracing a toponym to its documentary source.

**View `v_historical_document_toponym`**

```sql
CREATE VIEW v_historical_document_toponym AS
SELECT a.id, a.document_title, a.author, a.publication_year, b.id AS toponym_id, b.name AS toponym_name, b.region AS toponym_region
FROM historical_documents a JOIN toponyms b ON a.toponym_id = b.id;
```

| id | document_title | author | publication_year | toponym_id | toponym_name | toponym_region |
|---|---|---|---|---|---|---|
| 1 | Compact Series | Norma Fisher | 25 | 100 | Extended Review | distributed-region-12 |
| 2 | Legacy Assessment | Daniel Abbott | 33 | 101 | Pilot Initiative A | baseline-region-13 |
| 3 | Regional Survey A | Chris Bennett | 41 | 102 | Baseline Model | pilot-region-14 |
| 4 | Seasonal Corridor | Ernest Hemingway | 49 | 103 | Distributed Cluster | extended-region-15 |

The view `v_historical_document_epigraphic_inscription` joins `historical_documents` to `epigraphic_inscriptions` on `historical_documents.id = epigraphic_inscriptions.epigraphic_inscription_id`, connecting publications to the inscriptions they reference. A row might show `Compact Series` alongside `distributed-inscript-78`, establishing the epigraphic basis of a scholarly work.

**View `v_historical_document_epigraphic_inscription`**

```sql
CREATE VIEW v_historical_document_epigraphic_inscription AS
SELECT a.id, a.document_title, a.author, a.publication_year, b.epigraphic_inscription_id AS inscription_epigraphic_inscription_id, b.inscription_text AS inscription_inscription_text, b.script_type AS inscription_script_type
FROM historical_documents a JOIN epigraphic_inscriptions b ON a.epigraphic_inscription_id = b.epigraphic_inscription_id;
```

| id | document_title | author | publication_year | inscription_epigraphic_inscription_id | inscription_inscription_text | inscription_script_type |
|---|---|---|---|---|---|---|
| 1 | Compact Series | Norma Fisher | 25 | 100 | distributed-inscript-78 | regional-script-18 |
| 2 | Legacy Assessment | Daniel Abbott | 33 | 101 | baseline-inscript-79 | legacy-script-19 |
| 3 | Regional Survey A | Chris Bennett | 41 | 102 | pilot-inscript-80 | compact-script-20 |
| 4 | Seasonal Corridor | Ernest Hemingway | 49 | 103 | extended-inscript-81 | composite-script-21 |

## Synthesis

The schema models the Gaulish ethnographic domain as a network of six entity tables connected by foreign keys and three junction tables that resolve many-to-many relationships. The base tables capture tribal identities (`gaulish_tribes`), place names (`toponyms`), inscribed texts (`epigraphic_inscriptions`), scholarly interpretations (`linguistic_analysises`), territorial units (`historical_regions`), and documentary sources (`historical_documents`). Each entity carries attributes that reflect the domain's complexity: boolean flags for Celtic origin, confidence levels for toponymic reliability, script types for epigraphic classification, and Slavic influence metrics for cultural analysis.

The twenty views materialise the most common analytical queries by joining the appropriate tables. They answer questions such as which toponyms belong to which tribes, which inscriptions were found in which regions, which analyses interpret which texts, and which documents reference which place names. Each view can be traced back to a specific foreign-key relationship in the base schema, ensuring that the denormalised output is always grounded in the normalised source data. The junction tables (`tribes_toponyms`, `regions_toponyms`, `regions_tribes`) provide additional flexibility for queries that require explicit many-to-many mappings beyond the single foreign keys embedded in the entity tables.

Together, the base tables and views form a complete analytical layer for the Gaulish ethnographic domain, supporting both granular entity-level queries and cross-entity synthesis through the materialised views.