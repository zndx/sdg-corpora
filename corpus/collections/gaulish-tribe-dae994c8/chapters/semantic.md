## The Archaeology of Gaulish Linguistic Heritage

The domain under examination captures the material and linguistic traces of Gaulish tribal societies — their settlements, the place-names they left behind, the inscriptions they carved, the writing systems they employed, and the etymological roots embedded in their toponyms. Six base tables encode these entities in a normalized relational schema, while twelve views reconstruct the multidimensional relationships that archaeologists and historical linguists need to query. The foreign-key graph is deliberately dense: each entity type carries at least one FK pointing to another, ensuring that any domain fact can be reassembled from the normalized tables through a single join.

**Table `gaulish_tribes`**

| gaulish_tribe_id | tribe_name | primary_occupation | settlement_region | ethnicity | is_celtic | settlement_area_id | ancient_inscription_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Extended Corridor | composite-primary-39 | baseline-settleme-61 | primary-ethnicit-28 | false | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Pilot Series A | primary-primary-40 | pilot-settleme-62 | adaptive-ethnicit-29 | true | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | Baseline Assessment | adaptive-primary-41 | extended-settleme-63 | distributed-ethnicit-30 | false | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Distributed Survey | distributed-primary-42 | integrated-settleme-64 | baseline-ethnicit-31 | true | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `gaulish_tribes` table is the central tribal registry. Its primary key `gaulish_tribe_id` (values 100–103) identifies each tribe. The column `tribe_name` carries human-readable labels such as `Extended Corridor` and `Pilot Series A`. The boolean `is_celtic` distinguishes Celtic from non-Celtic groups — row 101 (`Pilot Series A`) is `true`, while row 100 (`Extended Corridor`) is `false`. The columns `primary_occupation`, `settlement_region`, and `ethnicity` store categorical descriptors like `composite-primary-40` and `baseline-settleme-61`. Two foreign keys anchor the tribe to its material context: `settlement_area_id` points to `settlement_areas`, and `ancient_inscription_id` points to `ancient_inscriptions`. Audit timestamps `created_at` and `updated_at` record the lifecycle of each row.

**Table `settlement_areas`**

| settlement_area_id | region_name | geographic_coordinates | historical_period | is_coastal | gaulish_tribe_id | toponym_id |
|---|---|---|---|---|---|---|
| 100 | Distributed Assessment | baseline-geograph-43 | compact-historic-26 | false | 100 | 1 |
| 101 | Adaptive Survey D | pilot-geograph-44 | composite-historic-27 | true | 101 | 2 |
| 102 | Primary Corridor | extended-geograph-45 | primary-historic-28 | false | 102 | 3 |
| 103 | Composite Series | integrated-geograph-46 | adaptive-historic-29 | true | 103 | 4 |

`settlement_areas` records the geographic footprint of each tribe. Its PK `settlement_area_id` (100–103) aligns one-to-one with `gaulish_tribe_id` in the sample data, though the FK `gaulish_tribe_id` on this table makes the relationship formally many-to-one from the tribe's perspective. The column `region_name` holds values like `Distributed Assessment` and `Adaptive Survey D`. `geographic_coordinates` and `historical_period` store spatial and temporal metadata (e.g., `baseline-geograph-43`, `compact-historic-26`). The boolean `is_coastal` flags coastal settlements — rows 101 and 103 are `true`. The FK `toponym_id` links each settlement to its place-name record.

**Table `toponyms`**

| id | place_name | etymological_root | linguistic_family | location_reference | confidence_score | settlement_area_id | linguistic_root_id |
|---|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | distributed-etymolog-96 | pilot-linguist-92 | extended-location-15 | 8.20 | 100 | 100 |
| 2 | Adaptive Review D | baseline-etymolog-97 | extended-linguist-93 | integrated-location-16 | 10.40 | 101 | 101 |
| 3 | Primary Initiative | pilot-etymolog-98 | integrated-linguist-94 | seasonal-location-17 | 12.60 | 102 | 102 |
| 4 | Composite Model | extended-etymolog-99 | seasonal-linguist-95 | regional-location-18 | 14.80 | 103 | 103 |

The `toponyms` table captures place-names and their etymological provenance. Its PK `id` (1–4) corresponds to the settlement areas. `place_name` carries readable labels such as `Distributed Cluster` and `Adaptive Review D`. `etymological_root` and `linguistic_family` store categorical descriptors (e.g., `distributed-etymolog-96`, `pilot-linguist-92`). `location_reference` and `confidence_score` (ranging from 8.20 to 14.80) provide spatial and evidentiary metadata. The FK `settlement_area_id` ties the toponym to its geographic context, while `linguistic_root_id` points to `linguistic_roots`, establishing the etymological lineage.

**Table `ancient_inscriptions`**

| ancient_inscription_id | inscription_i_d | script_type | discovery_location | date_discovered | deciphered_text | linguistic_interpretation | settlement_area_id | gaulish_tribe_id | writing_system_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | INS-2612 | regional-script-18 | baseline-discover-43 | 2023-06-01 | integrated-decipher-64 | seasonal-linguist-29 | 100 | 100 | 1 |
| 2 | INS-2617 | legacy-script-19 | pilot-discover-44 | 2024-11-12 | seasonal-decipher-65 | regional-linguist-30 | 101 | 101 | 2 |
| 3 | INS-2622 | compact-script-20 | extended-discover-45 | 2025-04-23 | regional-decipher-66 | legacy-linguist-31 | 102 | 102 | 3 |
| 4 | INS-2627 | composite-script-21 | integrated-discover-46 | 2022-09-07 | legacy-decipher-67 | compact-linguist-32 | 103 | 103 | 4 |

`ancient_inscriptions` documents epigraphic finds. Its PK `ancient_inscription_id` (1–4) aligns with the sample tribes. `inscription_i_d` carries human-readable codes like `INS-2612` and `INS-2617`. `script_type` categorizes the writing (e.g., `regional-script-18`, `legacy-script-19`). `discovery_location` and `date_discovered` record where and when the artifact was found. `deciphered_text` and `linguistic_interpretation` store the scholarly readings. Three foreign keys anchor the inscription: `settlement_area_id` to the geographic context, `gaulish_tribe_id` to the tribal owner, and `writing_system_id` to the script system.

**Table `writing_systems`**

| id | system_name | origin_region | usage_period | is_alphabetic | gaulish_tribe_id | ancient_inscription_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | Legacy Programme D | baseline-origin-61 | seasonal-usage-53 | false | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | Regional Standard | pilot-origin-62 | regional-usage-54 | true | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | Seasonal Framework | extended-origin-63 | legacy-usage-55 | false | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | Integrated Protocol A | integrated-origin-64 | compact-usage-56 | true | 103 | 4 | 2025-04-16 09:14:00 |

`writing_systems` catalogs the scripts used by the tribes. Its PK `id` (1–4) links to the inscriptions. `system_name` carries labels such as `Legacy Programme D` and `Regional Standard`. `origin_region` and `usage_period` store provenance metadata. The boolean `is_alphabetic` distinguishes alphabetic from non-alphabetic scripts — rows 2 and 4 are `true`. Two FKs connect the system to its users: `gaulish_tribe_id` and `ancient_inscription_id`. The `created_at` timestamp records when the system was catalogued.

**Table `linguistic_roots`**

| id | root_word | meaning | source_language | semantic_field | toponym_id | gaulish_tribe_id |
|---|---|---|---|---|---|---|
| 100 | legacy-root-85 | regional-meaning-78 | regional-source-84 | regional-semantic-90 | 1 | 100 |
| 101 | compact-root-86 | legacy-meaning-79 | legacy-source-85 | legacy-semantic-91 | 2 | 101 |
| 102 | composite-root-87 | compact-meaning-80 | compact-source-86 | compact-semantic-92 | 3 | 102 |
| 103 | primary-root-88 | composite-meaning-81 | composite-source-87 | composite-semantic-93 | 4 | 103 |

`linguistic_roots` stores the etymological primitives underlying the toponyms. Its PK `id` (100–103) corresponds to the toponym IDs. `root_word` carries forms like `legacy-root-85` and `compact-root-86`. `meaning`, `source_language`, and `semantic_field` store the linguistic analysis (e.g., `regional-meaning-78`, `regional-source-84`, `regional-semantic-90`). The FK `toponym_id` ties the root to its place-name, and `gaulish_tribe_id` connects it to the tribe that used it.

The foreign-key topology forms a tightly interlocked graph. `gaulish_tribes` references both `settlement_areas` and `ancient_inscriptions`. `settlement_areas` references `gaulish_tribes` and `toponyms`. `toponyms` references `settlement_areas` and `linguistic_roots`. `ancient_inscriptions` references `settlement_areas`, `gaulish_tribes`, and `writing_systems`. `writing_systems` references `gaulish_tribes` and `ancient_inscriptions`. `linguistic_roots` references `toponyms` and `gaulish_tribes`. This bidirectional referencing means that every entity type can be reached from every other through at most two hops, and the twelve views materialize these paths as flat, queryable relations.

### View: `v_gaulish_tribe_settlement_area`

This view joins `gaulish_tribes` to `settlement_areas` on the shared key, answering the question: *which settlement area does each tribe occupy?* Reading row 100, the tribe `Extended Corridor` (PK 100) is linked to settlement area `Distributed Assessment` (PK 100), with `is_coastal` set to `false`. Row 101 pairs `Pilot Series A` with `Adaptive Survey D`, a coastal settlement (`is_coastal = true`). The view collapses the FK round-trip into a single denormalized row per tribe, making it trivial to filter tribes by coastal geography or to aggregate settlement statistics by tribe.

### View: `v_gaulish_tribe_ancient_inscription`

This view joins `gaulish_tribes` to `ancient_inscriptions`, answering: *which inscription is associated with each tribe?* Row 100 shows `Extended Corridor` linked to inscription `INS-2612` (script type `regional-script-18`, discovered `2023-06-01`). Row 103 pairs `Distributed Survey` with `INS-2627` (script type `composite-script-21`, deciphered text `legacy-decipher-67`). The view surfaces the epigraphic record alongside tribal metadata, enabling queries such as "list all inscriptions found by non-Celtic tribes."

### View: `v_settlement_area_gaulish_tribe`

The inverse of the first view, this relation joins `settlement_areas` to `gaulish_tribes`, answering: *which tribe inhabits each settlement area?* Row 100 presents `Distributed Assessment` as inhabited by `Extended Corridor` (ethnicity `primary-ethnicit-28`, `is_celtic = false`). Row 102 shows `Primary Corridor` inhabited by `Baseline Assessment` (ethnicity `distributed-ethnicit-30`, `is_celtic = false`). This orientation is useful when the query starts from geography — for example, "find all tribes in non-coastal settlements."

### View: `v_settlement_area_toponym`

This view joins `settlement_areas` to `toponyms`, answering: *what place-name is associated with each settlement?* Row 100 links `Distributed Assessment` to the toponym `Distributed Cluster` (etymological root `distributed-etymolog-96`, confidence score 8.20). Row 103 links `Composite Series` to `Composite Model` (confidence score 14.80). The view enables geographic-to-linguistic queries, such as "which settlements have toponyms with confidence above 12."

### View: `v_toponym_settlement_area`

The inverse of the previous view, this relation joins `toponyms` to `settlement_areas`, answering: *in which settlement area does this toponym appear?* Row 1 shows `Distributed Cluster` located in settlement area `Distributed Assessment` (historical period `compact-historic-26`). Row 3 shows `Primary Initiative` in `Primary Corridor` (geographic coordinates `extended-geograph-45`). This orientation is natural for etymological research that starts from a place-name and seeks its geographic context.

### View: `v_toponym_linguistic_root`

This view joins `toponyms` to `linguistic_roots`, answering: *what is the etymological root of each toponym?* Row 1 links `Distributed Cluster` to root `legacy-root-85` (meaning `regional-meaning-78`, source language `regional-source-84`, semantic field `regional-semantic-90`). Row 4 links `Composite Model` to root `primary-root-88` (meaning `composite-meaning-81`, source language `composite-source-87`). The view materializes the toponym-to-root lineage, enabling queries such as "list all toponyms derived from roots in the regional semantic field."

### View: `v_ancient_inscription_settlement_area`

This view joins `ancient_inscriptions` to `settlement_areas`, answering: *in which settlement area was each inscription discovered?* Row 1 shows `INS-2612` discovered in `Distributed Assessment` (coordinates `baseline-geograph-43`). Row 3 shows `INS-2622` discovered in `Primary Corridor` (coordinates `extended-geograph-45`). The view supports spatial archaeology queries, such as "find all inscriptions discovered in coastal settlements."

### View: `v_ancient_inscription_gaulish_tribe`

This view joins `ancient_inscriptions` to `gaulish_tribes`, answering: *which tribe is associated with each inscription?* Row 1 links `INS-2612` to `Extended Corridor` (primary occupation `composite-primary-39`, `is_celtic = false`). Row 2 links `INS-2617` to `Pilot Series A` (`is_celtic = true`). The view enables epigraphic queries filtered by tribal attributes, such as "list all inscriptions from Celtic tribes."

### View: `v_ancient_inscription_writing_system`

This view joins `ancient_inscriptions` to `writing_systems`, answering: *which writing system was used for each inscription?* Row 1 shows `INS-2612` (script type `regional-script-18`) written in `Legacy Programme D` (origin `baseline-origin-61`, `is_alphabetic = false`). Row 2 shows `INS-2617` (script type `legacy-script-19`) written in `Regional Standard` (origin `pilot-origin-62`, `is_alphabetic = true`). The view materializes the inscription-to-script mapping, enabling queries such as "list all inscriptions written in alphabetic scripts."

### View: `v_writing_system_gaulish_tribe`

This view joins `writing_systems` to `gaulish_tribes`, answering: *which tribe adopted each writing system?* Row 1 links `Legacy Programme D` to `Extended Corridor` (ethnicity `primary-ethnicit-28`). Row 4 links `Integrated Protocol A` to `Distributed Survey` (ethnicity `baseline-ethnicit-31`, `is_celtic = true`). The view supports typological studies of script adoption across tribal groups.

### View: `v_writing_system_ancient_inscription`

This view joins `writing_systems` to `ancient_inscriptions`, answering: *which inscriptions employ each writing system?* Row 1 shows `Legacy Programme D` used in `INS-2612` (discovered `2023-06-01`, deciphered text `integrated-decipher-64`). Row 4 shows `Integrated Protocol A` used in `INS-2627` (discovered `2022-09-07`, deciphered text `legacy-decipher-67`). The view enables script-level analysis of the epigraphic corpus.

### View: `v_linguistic_root_toponym`

This view joins `linguistic_roots` to `toponyms`, answering: *which toponym derives from each linguistic root?* Row 100 links root `legacy-root-85` (meaning `regional-meaning-78`) to toponym `Distributed Cluster` (confidence score 8.20). Row 103 links root `primary-root-88` (meaning `composite-meaning-81`) to toponym `Composite Model` (confidence score 14.80). The view inverts the toponym-to-root direction, useful for root-centric etymological research.

### View: `v_linguistic_root_gaulish_tribe`

This view joins `linguistic_roots` to `gaulish_tribes`, answering: *which tribe is associated with each linguistic root?* Row 100 links root `legacy-root-85` to `Extended Corridor` (`is_celtic = false`). Row 103 links root `primary-root-88` to `Distributed Survey` (`is_celtic = true`). The view materializes the tribal-linguistic connection, enabling queries such as "list all roots used by Celtic tribes."

### Synthesis

The schema models a domain where tribes, settlements, place-names, inscriptions, scripts, and etymological roots are all mutually referential. Each base table stores one entity type with its intrinsic attributes; foreign keys encode the relationships as column-level constraints. The twelve views materialize every pairwise relationship as a flat join, so that any domain question — "which Celtic tribe used an alphabetic script to inscribe a toponym with confidence above 12 in a coastal settlement?" — can be answered by querying a single view or composing two. The normalized base tables guarantee update consistency; the views provide the analytical surface that archaeologists and linguists actually query.

## Data appendix

**View `v_gaulish_tribe_settlement_area`**

```sql
CREATE VIEW v_gaulish_tribe_settlement_area AS
SELECT a.gaulish_tribe_id, a.tribe_name, a.primary_occupation, a.settlement_region, b.settlement_area_id AS area_settlement_area_id, b.region_name AS area_region_name, b.geographic_coordinates AS area_geographic_coordinates
FROM gaulish_tribes a JOIN settlement_areas b ON a.settlement_area_id = b.settlement_area_id;
```

| gaulish_tribe_id | tribe_name | primary_occupation | settlement_region | area_settlement_area_id | area_region_name | area_geographic_coordinates |
|---|---|---|---|---|---|---|
| 100 | Extended Corridor | composite-primary-39 | baseline-settleme-61 | 100 | Distributed Assessment | baseline-geograph-43 |
| 101 | Pilot Series A | primary-primary-40 | pilot-settleme-62 | 101 | Adaptive Survey D | pilot-geograph-44 |
| 102 | Baseline Assessment | adaptive-primary-41 | extended-settleme-63 | 102 | Primary Corridor | extended-geograph-45 |
| 103 | Distributed Survey | distributed-primary-42 | integrated-settleme-64 | 103 | Composite Series | integrated-geograph-46 |

**View `v_gaulish_tribe_ancient_inscription`**

```sql
CREATE VIEW v_gaulish_tribe_ancient_inscription AS
SELECT a.gaulish_tribe_id, a.tribe_name, a.primary_occupation, a.settlement_region, b.ancient_inscription_id AS inscription_ancient_inscription_id, b.inscription_i_d AS inscription_inscription_i_d, b.script_type AS inscription_script_type
FROM gaulish_tribes a JOIN ancient_inscriptions b ON a.ancient_inscription_id = b.ancient_inscription_id;
```

| gaulish_tribe_id | tribe_name | primary_occupation | settlement_region | inscription_ancient_inscription_id | inscription_inscription_i_d | inscription_script_type |
|---|---|---|---|---|---|---|
| 100 | Extended Corridor | composite-primary-39 | baseline-settleme-61 | 1 | INS-2612 | regional-script-18 |
| 101 | Pilot Series A | primary-primary-40 | pilot-settleme-62 | 2 | INS-2617 | legacy-script-19 |
| 102 | Baseline Assessment | adaptive-primary-41 | extended-settleme-63 | 3 | INS-2622 | compact-script-20 |
| 103 | Distributed Survey | distributed-primary-42 | integrated-settleme-64 | 4 | INS-2627 | composite-script-21 |

**View `v_settlement_area_gaulish_tribe`**

```sql
CREATE VIEW v_settlement_area_gaulish_tribe AS
SELECT a.settlement_area_id, a.region_name, a.geographic_coordinates, a.historical_period, b.gaulish_tribe_id AS tribe_gaulish_tribe_id, b.tribe_name AS tribe_tribe_name, b.primary_occupation AS tribe_primary_occupation
FROM settlement_areas a JOIN gaulish_tribes b ON a.gaulish_tribe_id = b.gaulish_tribe_id;
```

| settlement_area_id | region_name | geographic_coordinates | historical_period | tribe_gaulish_tribe_id | tribe_tribe_name | tribe_primary_occupation |
|---|---|---|---|---|---|---|
| 100 | Distributed Assessment | baseline-geograph-43 | compact-historic-26 | 100 | Extended Corridor | composite-primary-39 |
| 101 | Adaptive Survey D | pilot-geograph-44 | composite-historic-27 | 101 | Pilot Series A | primary-primary-40 |
| 102 | Primary Corridor | extended-geograph-45 | primary-historic-28 | 102 | Baseline Assessment | adaptive-primary-41 |
| 103 | Composite Series | integrated-geograph-46 | adaptive-historic-29 | 103 | Distributed Survey | distributed-primary-42 |

**View `v_settlement_area_toponym`**

```sql
CREATE VIEW v_settlement_area_toponym AS
SELECT a.settlement_area_id, a.region_name, a.geographic_coordinates, a.historical_period, b.id AS toponym_id, b.place_name AS toponym_place_name, b.etymological_root AS toponym_etymological_root
FROM settlement_areas a JOIN toponyms b ON a.toponym_id = b.id;
```

| settlement_area_id | region_name | geographic_coordinates | historical_period | toponym_id | toponym_place_name | toponym_etymological_root |
|---|---|---|---|---|---|---|
| 100 | Distributed Assessment | baseline-geograph-43 | compact-historic-26 | 1 | Distributed Cluster | distributed-etymolog-96 |
| 101 | Adaptive Survey D | pilot-geograph-44 | composite-historic-27 | 2 | Adaptive Review D | baseline-etymolog-97 |
| 102 | Primary Corridor | extended-geograph-45 | primary-historic-28 | 3 | Primary Initiative | pilot-etymolog-98 |
| 103 | Composite Series | integrated-geograph-46 | adaptive-historic-29 | 4 | Composite Model | extended-etymolog-99 |

**View `v_toponym_settlement_area`**

```sql
CREATE VIEW v_toponym_settlement_area AS
SELECT a.id, a.place_name, a.etymological_root, a.linguistic_family, b.settlement_area_id AS area_settlement_area_id, b.region_name AS area_region_name, b.geographic_coordinates AS area_geographic_coordinates
FROM toponyms a JOIN settlement_areas b ON a.settlement_area_id = b.settlement_area_id;
```

| id | place_name | etymological_root | linguistic_family | area_settlement_area_id | area_region_name | area_geographic_coordinates |
|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | distributed-etymolog-96 | pilot-linguist-92 | 100 | Distributed Assessment | baseline-geograph-43 |
| 2 | Adaptive Review D | baseline-etymolog-97 | extended-linguist-93 | 101 | Adaptive Survey D | pilot-geograph-44 |
| 3 | Primary Initiative | pilot-etymolog-98 | integrated-linguist-94 | 102 | Primary Corridor | extended-geograph-45 |
| 4 | Composite Model | extended-etymolog-99 | seasonal-linguist-95 | 103 | Composite Series | integrated-geograph-46 |

**View `v_toponym_linguistic_root`**

```sql
CREATE VIEW v_toponym_linguistic_root AS
SELECT a.id, a.place_name, a.etymological_root, a.linguistic_family, b.id AS root_id, b.root_word AS root_root_word, b.meaning AS root_meaning
FROM toponyms a JOIN linguistic_roots b ON a.linguistic_root_id = b.id;
```

| id | place_name | etymological_root | linguistic_family | root_id | root_root_word | root_meaning |
|---|---|---|---|---|---|---|
| 1 | Distributed Cluster | distributed-etymolog-96 | pilot-linguist-92 | 100 | legacy-root-85 | regional-meaning-78 |
| 2 | Adaptive Review D | baseline-etymolog-97 | extended-linguist-93 | 101 | compact-root-86 | legacy-meaning-79 |
| 3 | Primary Initiative | pilot-etymolog-98 | integrated-linguist-94 | 102 | composite-root-87 | compact-meaning-80 |
| 4 | Composite Model | extended-etymolog-99 | seasonal-linguist-95 | 103 | primary-root-88 | composite-meaning-81 |

**View `v_ancient_inscription_settlement_area`**

```sql
CREATE VIEW v_ancient_inscription_settlement_area AS
SELECT a.ancient_inscription_id, a.inscription_i_d, a.script_type, a.discovery_location, b.settlement_area_id AS area_settlement_area_id, b.region_name AS area_region_name, b.geographic_coordinates AS area_geographic_coordinates
FROM ancient_inscriptions a JOIN settlement_areas b ON a.settlement_area_id = b.settlement_area_id;
```

| ancient_inscription_id | inscription_i_d | script_type | discovery_location | area_settlement_area_id | area_region_name | area_geographic_coordinates |
|---|---|---|---|---|---|---|
| 1 | INS-2612 | regional-script-18 | baseline-discover-43 | 100 | Distributed Assessment | baseline-geograph-43 |
| 2 | INS-2617 | legacy-script-19 | pilot-discover-44 | 101 | Adaptive Survey D | pilot-geograph-44 |
| 3 | INS-2622 | compact-script-20 | extended-discover-45 | 102 | Primary Corridor | extended-geograph-45 |
| 4 | INS-2627 | composite-script-21 | integrated-discover-46 | 103 | Composite Series | integrated-geograph-46 |

**View `v_ancient_inscription_gaulish_tribe`**

```sql
CREATE VIEW v_ancient_inscription_gaulish_tribe AS
SELECT a.ancient_inscription_id, a.inscription_i_d, a.script_type, a.discovery_location, b.gaulish_tribe_id AS tribe_gaulish_tribe_id, b.tribe_name AS tribe_tribe_name, b.primary_occupation AS tribe_primary_occupation
FROM ancient_inscriptions a JOIN gaulish_tribes b ON a.gaulish_tribe_id = b.gaulish_tribe_id;
```

| ancient_inscription_id | inscription_i_d | script_type | discovery_location | tribe_gaulish_tribe_id | tribe_tribe_name | tribe_primary_occupation |
|---|---|---|---|---|---|---|
| 1 | INS-2612 | regional-script-18 | baseline-discover-43 | 100 | Extended Corridor | composite-primary-39 |
| 2 | INS-2617 | legacy-script-19 | pilot-discover-44 | 101 | Pilot Series A | primary-primary-40 |
| 3 | INS-2622 | compact-script-20 | extended-discover-45 | 102 | Baseline Assessment | adaptive-primary-41 |
| 4 | INS-2627 | composite-script-21 | integrated-discover-46 | 103 | Distributed Survey | distributed-primary-42 |

**View `v_ancient_inscription_writing_system`**

```sql
CREATE VIEW v_ancient_inscription_writing_system AS
SELECT a.ancient_inscription_id, a.inscription_i_d, a.script_type, a.discovery_location, b.id AS system_id, b.system_name AS system_system_name, b.origin_region AS system_origin_region
FROM ancient_inscriptions a JOIN writing_systems b ON a.writing_system_id = b.id;
```

| ancient_inscription_id | inscription_i_d | script_type | discovery_location | system_id | system_system_name | system_origin_region |
|---|---|---|---|---|---|---|
| 1 | INS-2612 | regional-script-18 | baseline-discover-43 | 1 | Legacy Programme D | baseline-origin-61 |
| 2 | INS-2617 | legacy-script-19 | pilot-discover-44 | 2 | Regional Standard | pilot-origin-62 |
| 3 | INS-2622 | compact-script-20 | extended-discover-45 | 3 | Seasonal Framework | extended-origin-63 |
| 4 | INS-2627 | composite-script-21 | integrated-discover-46 | 4 | Integrated Protocol A | integrated-origin-64 |

**View `v_writing_system_gaulish_tribe`**

```sql
CREATE VIEW v_writing_system_gaulish_tribe AS
SELECT a.id, a.system_name, a.origin_region, a.usage_period, b.gaulish_tribe_id AS tribe_gaulish_tribe_id, b.tribe_name AS tribe_tribe_name, b.primary_occupation AS tribe_primary_occupation
FROM writing_systems a JOIN gaulish_tribes b ON a.gaulish_tribe_id = b.gaulish_tribe_id;
```

| id | system_name | origin_region | usage_period | tribe_gaulish_tribe_id | tribe_tribe_name | tribe_primary_occupation |
|---|---|---|---|---|---|---|
| 1 | Legacy Programme D | baseline-origin-61 | seasonal-usage-53 | 100 | Extended Corridor | composite-primary-39 |
| 2 | Regional Standard | pilot-origin-62 | regional-usage-54 | 101 | Pilot Series A | primary-primary-40 |
| 3 | Seasonal Framework | extended-origin-63 | legacy-usage-55 | 102 | Baseline Assessment | adaptive-primary-41 |
| 4 | Integrated Protocol A | integrated-origin-64 | compact-usage-56 | 103 | Distributed Survey | distributed-primary-42 |

**View `v_writing_system_ancient_inscription`**

```sql
CREATE VIEW v_writing_system_ancient_inscription AS
SELECT a.id, a.system_name, a.origin_region, a.usage_period, b.ancient_inscription_id AS inscription_ancient_inscription_id, b.inscription_i_d AS inscription_inscription_i_d, b.script_type AS inscription_script_type
FROM writing_systems a JOIN ancient_inscriptions b ON a.ancient_inscription_id = b.ancient_inscription_id;
```

| id | system_name | origin_region | usage_period | inscription_ancient_inscription_id | inscription_inscription_i_d | inscription_script_type |
|---|---|---|---|---|---|---|
| 1 | Legacy Programme D | baseline-origin-61 | seasonal-usage-53 | 1 | INS-2612 | regional-script-18 |
| 2 | Regional Standard | pilot-origin-62 | regional-usage-54 | 2 | INS-2617 | legacy-script-19 |
| 3 | Seasonal Framework | extended-origin-63 | legacy-usage-55 | 3 | INS-2622 | compact-script-20 |
| 4 | Integrated Protocol A | integrated-origin-64 | compact-usage-56 | 4 | INS-2627 | composite-script-21 |

**View `v_linguistic_root_toponym`**

```sql
CREATE VIEW v_linguistic_root_toponym AS
SELECT a.id, a.root_word, a.meaning, a.source_language, b.id AS toponym_id, b.place_name AS toponym_place_name, b.etymological_root AS toponym_etymological_root
FROM linguistic_roots a JOIN toponyms b ON a.toponym_id = b.id;
```

| id | root_word | meaning | source_language | toponym_id | toponym_place_name | toponym_etymological_root |
|---|---|---|---|---|---|---|
| 100 | legacy-root-85 | regional-meaning-78 | regional-source-84 | 1 | Distributed Cluster | distributed-etymolog-96 |
| 101 | compact-root-86 | legacy-meaning-79 | legacy-source-85 | 2 | Adaptive Review D | baseline-etymolog-97 |
| 102 | composite-root-87 | compact-meaning-80 | compact-source-86 | 3 | Primary Initiative | pilot-etymolog-98 |
| 103 | primary-root-88 | composite-meaning-81 | composite-source-87 | 4 | Composite Model | extended-etymolog-99 |

**View `v_linguistic_root_gaulish_tribe`**

```sql
CREATE VIEW v_linguistic_root_gaulish_tribe AS
SELECT a.id, a.root_word, a.meaning, a.source_language, b.gaulish_tribe_id AS tribe_gaulish_tribe_id, b.tribe_name AS tribe_tribe_name, b.primary_occupation AS tribe_primary_occupation
FROM linguistic_roots a JOIN gaulish_tribes b ON a.gaulish_tribe_id = b.gaulish_tribe_id;
```

| id | root_word | meaning | source_language | tribe_gaulish_tribe_id | tribe_tribe_name | tribe_primary_occupation |
|---|---|---|---|---|---|---|
| 100 | legacy-root-85 | regional-meaning-78 | regional-source-84 | 100 | Extended Corridor | composite-primary-39 |
| 101 | compact-root-86 | legacy-meaning-79 | legacy-source-85 | 101 | Pilot Series A | primary-primary-40 |
| 102 | composite-root-87 | compact-meaning-80 | compact-source-86 | 102 | Baseline Assessment | adaptive-primary-41 |
| 103 | primary-root-88 | composite-meaning-81 | composite-source-87 | 103 | Distributed Survey | distributed-primary-42 |
