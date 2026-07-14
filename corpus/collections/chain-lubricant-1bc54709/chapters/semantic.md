The chain drive domain captures the engineering relationships between lubricants, mechanical drives, sprockets, and chains — the components that transmit power in industrial machinery. A single drive system, such as the distributed-drive-96 identified by drive `505996`, is characterized by its type, whether it serves a critical operation, and the date it was installed. Each drive is paired with a specific lubricant, an operating condition that defines its thermal and load envelope, and a set of sprockets and chains that form the physical power-transmission path. The relational schema models these entities as normalized tables linked by foreign keys, with junction tables resolving many-to-many associations between drives and sprockets, and between chains and sprockets. Views then reassemble the normalized facts into domain-meaningful projections.

## Entity Types and Their Attributes

The schema centers on six base tables, each representing a distinct entity type in the chain drive domain. The `chain_lubricants` table stores the chemical and physical properties of lubricants used in drive systems.

**Table `chain_lubricants`**

| lubricant_id | chemical_family | base_name | viscosity_grade | is_tacky | is_soluble_moly | is_e_p | is_aerosol | operating_condition_id | manufacturer_id |
|---|---|---|---|---|---|---|---|---|---|
| 8928502 | legacy-chemical-97 | Pilot Survey | primary-viscosit-82 | true | false | true | true | 100 | 1 |
| 5f940350-8fcd-11eb-924d-9cd76263cbd0 | compact-chemical-98 | Baseline Corridor | adaptive-viscosit-83 | false | true | false | false | 101 | 2 |
| c8a7d91b-e587-45b4-bae6-0c0a51b6241b | composite-chemical-99 | Distributed Series A | distributed-viscosit-84 | true | false | true | true | 102 | 3 |
| 1437589 | primary-chemical-100 | Adaptive Assessment | baseline-viscosit-85 | false | true | false | false | 103 | 4 |

Each lubricant is identified by a `lubricant_id` — for example, `8928502` for the lubricant in the `legacy-chemical-97` family named "Pilot Survey" — and carries a suite of boolean flags (`is_tacky`, `is_soluble_moly`, `is_e_p`, `is_aerosol`) that describe its formulation characteristics. The `viscosity_grade` column, holding values such as `primary-viscosit-82` or `adaptive-viscosit-83`, classifies the lubricant's flow behavior. Two foreign keys anchor each lubricant to its operating context and manufacturer: `operating_condition_id` references `operating_conditions`, and `manufacturer_id` references `manufacturers`.

The `operating_conditions` table defines the environmental envelope in which a drive operates.

**Table `operating_conditions`**

| operating_condition_id | condition_id | temperature_min | temperature_max | load_level | is_wet | is_exposed_to_foreign_materials | lubricant_id | drive_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | 36.900001525878906 | 0.34 | Medium | false | false | 8928502 | 505996 | 2025-01-01 00:14:00 |
| 101 | 9568469 | 3.62 | 0.83 | High | true | true | 5f940350-8fcd-11eb-924d-9cd76263cbd0 | 9424933 | 2025-02-06 03:14:00 |
| 102 | 4716413 | 0.43012016 | 1.603487606015595 | Medium | false | false | c8a7d91b-e587-45b4-bae6-0c0a51b6241b | 6926357 | 2025-03-11 06:14:00 |
| 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 0.075 | 0.38254625 | High | true | true | 1437589 | ChIJkXWylYht5kcRUCfYt4dK_wU | 2025-04-16 09:14:00 |

Each row is keyed by `operating_condition_id` (e.g., `100`, `101`, `102`, `103`) and carries a UUID `condition_id` such as `a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3`. The temperature range is bounded by `temperature_min` and `temperature_max` — row `100` spans from `36.90` down to `0.34`, while row `101` spans from `3.62` to `0.83`. The `load_level` column takes categorical values like `Medium` or `High`, and the boolean flags `is_wet` and `is_exposed_to_foreign_materials` indicate environmental severity. Foreign keys `lubricant_id` and `drive_id` link back to the `chain_lubricants` and `chain_drives` tables respectively, creating a bidirectional bridge between lubricant selection and drive configuration.

The `chain_drives` table is the central hub of the schema.

**Table `chain_drives`**

| drive_id | drive_type | is_critical_operation | installation_date | lubricant_id | operating_condition_id | created_at |
|---|---|---|---|---|---|---|
| 505996 | distributed-drive-96 | true | 2022-01-10T00:12:00 | 8928502 | 100 | 2025-01-01 00:14:00 |
| 9424933 | baseline-drive-97 | false | 2023-06-21T07:29:00 | 5f940350-8fcd-11eb-924d-9cd76263cbd0 | 101 | 2025-02-06 03:14:00 |
| 6926357 | pilot-drive-98 | true | 2024-11-05T14:46:00 | c8a7d91b-e587-45b4-bae6-0c0a51b6241b | 102 | 2025-03-11 06:14:00 |
| ChIJkXWylYht5kcRUCfYt4dK_wU | extended-drive-99 | false | 2025-04-16T21:03:00 | 1437589 | 103 | 2025-04-16 09:14:00 |

Each drive is identified by `drive_id` — the integer `505996` for distributed-drive-96, the UUID `ChIJkXWylYht5kcRUCfYt4dK_wU` for extended-drive-99 — and classified by `drive_type`. The `is_critical_operation` flag distinguishes safety-critical drives (true for `505996` and `6926357`) from non-critical ones. The `installation_date` records when the drive was commissioned, and the `created_at` timestamp tracks schema-level audit information. Two foreign keys, `lubricant_id` and `operating_condition_id`, tie each drive to its lubricant and operating envelope, ensuring that every drive row carries the full chemical and environmental context needed for maintenance planning.

The `sprockets` table describes the toothed wheels that mesh with chains.

**Table `sprockets`**

| sprocket_id | tooth_count | pitch_diameter | material | drive_id | chain_id |
|---|---|---|---|---|---|
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 22 | 8.20 | primary-material-94 | 505996 | 1 |
| 10966241 | 6 | 12.40 | adaptive-material-95 | 9424933 | 2 |
| 99835 | 13 | 16.60 | distributed-material-96 | 6926357 | 3 |
| ChIJIaW7vcht5kcRsZwPgTo7fco | 1 | 20.80 | baseline-material-97 | ChIJkXWylYht5kcRUCfYt4dK_wU | 4 |

Each sprocket has a `sprocket_id` (e.g., `46d50e78-8fcc-11eb-924d-9cd76263cbd0`), a `tooth_count` ranging from `1` to `22`, a `pitch_diameter` from `8.20` to `20.80`, and a `material` designation such as `primary-material-94`. The foreign keys `drive_id` and `chain_id` associate each sprocket with a specific drive and chain, forming the mechanical linkage.

The `chains` table stores the link assemblies.

**Table `chains`**

| chain_id | link_type | pitch | material | drive_id |
|---|---|---|---|---|
| 1 | https://www.globaltimes.cn/page/202103/1219909.shtml | 5.20 | primary-material-94 | 505996 |
| 2 | https://www.nature.com/articles/nphoton.2016.26 | 9.40 | adaptive-material-95 | 9424933 |
| 3 | https://api.github.com/repos/Jumpscale/ays_jumpscale8 | 13.60 | distributed-material-96 | 6926357 |
| 4 | http://transcripts.cnn.com/TRANSCRIPTS/1702/09/nday.05.html | 17.80 | baseline-material-97 | ChIJkXWylYht5kcRUCfYt4dK_wU |

Each chain is identified by `chain_id` (integers `1` through `4` in the sample data), with `link_type` holding descriptive identifiers, `pitch` measuring the link spacing (from `5.20` to `17.80`), `material` specifying construction, and `drive_id` linking the chain to its host drive.

The `manufacturers` table catalogs the organizations that produce lubricants.

**Table `manufacturers`**

| id | manufacturer_id | name | support_phone | lubricant_id |
|---|---|---|---|---|
| 1 | Esperion Therapeutics Inc. | Extended Review | composite-support-69 | 8928502 |
| 2 | Microsoft Corporation | Pilot Initiative A | primary-support-70 | 5f940350-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | Northrop Grumman | Baseline Model | adaptive-support-71 | c8a7d91b-e587-45b4-bae6-0c0a51b6241b |
| 4 | Switch Card Services Ltd. | Distributed Cluster | distributed-support-72 | 1437589 |

Each manufacturer row has a surrogate `id` (`1` through `4`), a `manufacturer_id` holding the organization name (e.g., `Esperion Therapeutics Inc.`, `Microsoft Corporation`), a `name` for the product line or program (e.g., `Extended Review`, `Pilot Initiative A`), a `support_phone` code, and a `lubricant_id` foreign key that ties the manufacturer to the specific lubricant they produce.

## Junction Tables and Many-to-Many Relationships

Two junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `drives_sprockets` table links drives to sprockets, allowing a single drive to be associated with multiple sprockets and a single sprocket to serve multiple drives.

**Table `drives_sprockets`**

| drive_id | sprocket_id |
|---|---|
| 505996 | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 |
| 505996 | 10966241 |
| 9424933 | 10966241 |
| 9424933 | 99835 |
| 6926357 | 99835 |
| 6926357 | ChIJIaW7vcht5kcRsZwPgTo7fco |
| ChIJkXWylYht5kcRUCfYt4dK_wU | ChIJIaW7vcht5kcRsZwPgTo7fco |
| ChIJkXWylYht5kcRUCfYt4dK_wU | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 |

Similarly, the `chains_sprockets` table links chains to sprockets, enabling a sprocket to mesh with multiple chains and a chain to engage multiple sprockets.

**Table `chains_sprockets`**

| chain_id | sprocket_id |
|---|---|
| 1 | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 |
| 1 | 10966241 |
| 2 | 10966241 |
| 2 | 99835 |
| 3 | 99835 |
| 3 | ChIJIaW7vcht5kcRsZwPgTo7fco |
| 4 | ChIJIaW7vcht5kcRsZwPgTo7fco |
| 4 | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 |

These junction tables are the structural mechanism by which the normalized schema captures the combinatorial complexity of real drive systems, where a single drive assembly may incorporate several sprockets and chains in various configurations.

## View Projections

The twelve views materialize the normalized schema into domain-meaningful projections, each answering a specific analytical question by joining the appropriate tables.

### `v_chain_lubricant_operating_condition`

This view joins `chain_lubricants` to `operating_conditions` on `lubricant_id`, producing a row that pairs each lubricant with its operating envelope. For the lubricant `8928502` (Pilot Survey), the view reveals that it operates under condition `100` with a temperature range of `36.90` to `0.34`, a `Medium` load level, and neither wet nor foreign-material exposure. This projection answers the question: "What environmental conditions does each lubricant serve?"

### `v_chain_lubricant_manufacturer`

By joining `chain_lubricants` to `manufacturers` on `lubricant_id`, this view maps each lubricant to its producing organization. The lubricant `8928502` is attributed to `Esperion Therapeutics Inc.` (manufacturer_id `1`), with the product line named `Extended Review`. This answers: "Which manufacturer produces each lubricant?"

### `v_operating_condition_chain_lubricant`

This is the inverse of `v_chain_lubricant_operating_condition`: it starts from `operating_conditions` and joins to `chain_lubricants`. For operating condition `100`, the view shows that lubricant `8928502` (Pilot Survey, `legacy-chemical-97`) is the designated fluid. This answers: "Which lubricant is specified for each operating condition?"

### `v_operating_condition_chain_drive`

Joining `operating_conditions` to `chain_drives` on `operating_condition_id`, this view reveals which drives operate under each environmental envelope. Operating condition `100` is served by drive `505996` (distributed-drive-96, critical operation, installed `2022-01-10`). This answers: "Which drives are configured for each operating condition?"

### `v_chain_drive_chain_lubricant`

This view joins `chain_drives` to `chain_lubricants` on `lubricant_id`, producing a direct mapping from drives to their lubricants. Drive `505996` (distributed-drive-96) uses lubricant `8928502` (Pilot Survey, `legacy-chemical-97`, tacky, EP, aerosol). This answers: "What lubricant is specified for each drive?"

### `v_chain_drive_operating_condition`

By joining `chain_drives` to `operating_conditions` on `operating_condition_id`, this view pairs each drive with its environmental envelope. Drive `505996` operates under condition `100` (temperature `36.90`–`0.34`, `Medium` load, dry, no foreign materials). This answers: "What are the operating conditions for each drive?"

### `v_chain_drive_sprocket_detail`

This view joins `chain_drives` to `sprockets` through the `drives_sprockets` junction table, producing a detailed sprocket inventory for each drive. Drive `505996` is associated with sprocket `46d50e78-8fcc-11eb-924d-9cd76263cbd0`, which has `22` teeth, a pitch diameter of `8.20`, and is made of `primary-material-94`. This answers: "Which sprockets are installed on each drive?"

### `v_sprocket_chain_drive`

The inverse of `v_chain_drive_sprocket_detail`, this view starts from `sprockets` and joins to `chain_drives`. Sprocket `46d50e78-8fcc-11eb-924d-9cd76263cbd0` (22 teeth, `8.20` pitch diameter) is installed on drive `505996` (distributed-drive-96). This answers: "Which drives use each sprocket?"

### `v_sprocket_chain`

Joining `sprockets` to `chains` through the `chains_sprockets` junction table, this view reveals which chains mesh with each sprocket. Sprocket `46d50e78-8fcc-11eb-924d-9cd76263cbd0` is paired with chain `1` (pitch `5.20`, `primary-material-94`). This answers: "Which chains engage each sprocket?"

### `v_chain_chain_drive`

This view joins `chains` to `chain_drives` on `drive_id`, producing a direct mapping from chains to their host drives. Chain `1` (pitch `5.20`) is installed on drive `505996` (distributed-drive-96). This answers: "Which drive hosts each chain?"

### `v_chain_sprocket_detail`

The inverse of `v_sprocket_chain`, this view starts from `chains` and joins to `sprockets` through `chains_sprockets`. Chain `1` (pitch `5.20`, `primary-material-94`) meshes with sprocket `46d50e78-8fcc-11eb-924d-9cd76263cbd0` (22 teeth, `8.20` pitch diameter). This answers: "Which sprockets engage each chain?"

### `v_manufacturer_chain_lubricant`

Joining `manufacturers` to `chain_lubricants` on `lubricant_id`, this view maps each manufacturer to the lubricants they produce. Manufacturer `1` (`Esperion Therapeutics Inc.`, product line `Extended Review`) produces lubricant `8928502` (Pilot Survey, `legacy-chemical-97`). This answers: "Which lubricants are produced by each manufacturer?"

## Synthesis

The schema models the chain drive domain as a network of six entity tables connected by foreign keys and two junction tables. The `chain_drives` table serves as the central hub, with every drive row carrying a `lubricant_id` and an `operating_condition_id` that anchor it to its chemical and environmental context. The `sprockets` and `chains` tables describe the mechanical components, linked to drives through foreign keys and to each other through the `drives_sprockets` and `chains_sprockets` junction tables. The twelve views reassemble these normalized facts into projections that answer specific domain questions — from "which lubricant serves which drive" to "which sprockets mesh with which chains" — each join reconstructing a domain fact from the underlying normalized tables. The result is a schema that is both structurally rigorous and analytically expressive, capturing the full complexity of industrial chain drive systems in a form that supports both transactional integrity and analytical querying.

## Data appendix

**View `v_chain_lubricant_operating_condition`**

```sql
CREATE VIEW v_chain_lubricant_operating_condition AS
SELECT a.lubricant_id, a.chemical_family, a.base_name, a.viscosity_grade, b.operating_condition_id AS condition_operating_condition_id, b.condition_id AS condition_condition_id, b.temperature_min AS condition_temperature_min
FROM chain_lubricants a JOIN operating_conditions b ON a.operating_condition_id = b.operating_condition_id;
```

| lubricant_id | chemical_family | base_name | viscosity_grade | condition_operating_condition_id | condition_condition_id | condition_temperature_min |
|---|---|---|---|---|---|---|
| 8928502 | legacy-chemical-97 | Pilot Survey | primary-viscosit-82 | 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | 36.900001525878906 |
| 5f940350-8fcd-11eb-924d-9cd76263cbd0 | compact-chemical-98 | Baseline Corridor | adaptive-viscosit-83 | 101 | 9568469 | 3.62 |
| c8a7d91b-e587-45b4-bae6-0c0a51b6241b | composite-chemical-99 | Distributed Series A | distributed-viscosit-84 | 102 | 4716413 | 0.43012016 |
| 1437589 | primary-chemical-100 | Adaptive Assessment | baseline-viscosit-85 | 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 0.075 |

**View `v_chain_lubricant_manufacturer`**

```sql
CREATE VIEW v_chain_lubricant_manufacturer AS
SELECT a.lubricant_id, a.chemical_family, a.base_name, a.viscosity_grade, b.id AS manufacturer_id, b.manufacturer_id AS manufacturer_manufacturer_id, b.name AS manufacturer_name
FROM chain_lubricants a JOIN manufacturers b ON a.manufacturer_id = b.id;
```

| lubricant_id | chemical_family | base_name | viscosity_grade | manufacturer_id | manufacturer_manufacturer_id | manufacturer_name |
|---|---|---|---|---|---|---|
| 8928502 | legacy-chemical-97 | Pilot Survey | primary-viscosit-82 | 1 | Esperion Therapeutics Inc. | Extended Review |
| 5f940350-8fcd-11eb-924d-9cd76263cbd0 | compact-chemical-98 | Baseline Corridor | adaptive-viscosit-83 | 2 | Microsoft Corporation | Pilot Initiative A |
| c8a7d91b-e587-45b4-bae6-0c0a51b6241b | composite-chemical-99 | Distributed Series A | distributed-viscosit-84 | 3 | Northrop Grumman | Baseline Model |
| 1437589 | primary-chemical-100 | Adaptive Assessment | baseline-viscosit-85 | 4 | Switch Card Services Ltd. | Distributed Cluster |

**View `v_operating_condition_chain_lubricant`**

```sql
CREATE VIEW v_operating_condition_chain_lubricant AS
SELECT a.operating_condition_id, a.condition_id, a.temperature_min, a.temperature_max, b.lubricant_id AS lubricant_lubricant_id, b.chemical_family AS lubricant_chemical_family, b.base_name AS lubricant_base_name
FROM operating_conditions a JOIN chain_lubricants b ON a.lubricant_id = b.lubricant_id;
```

| operating_condition_id | condition_id | temperature_min | temperature_max | lubricant_lubricant_id | lubricant_chemical_family | lubricant_base_name |
|---|---|---|---|---|---|---|
| 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | 36.900001525878906 | 0.34 | 8928502 | legacy-chemical-97 | Pilot Survey |
| 101 | 9568469 | 3.62 | 0.83 | 5f940350-8fcd-11eb-924d-9cd76263cbd0 | compact-chemical-98 | Baseline Corridor |
| 102 | 4716413 | 0.43012016 | 1.603487606015595 | c8a7d91b-e587-45b4-bae6-0c0a51b6241b | composite-chemical-99 | Distributed Series A |
| 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 0.075 | 0.38254625 | 1437589 | primary-chemical-100 | Adaptive Assessment |

**View `v_operating_condition_chain_drive`**

```sql
CREATE VIEW v_operating_condition_chain_drive AS
SELECT a.operating_condition_id, a.condition_id, a.temperature_min, a.temperature_max, b.drive_id AS drive_drive_id, b.drive_type AS drive_drive_type, b.is_critical_operation AS drive_is_critical_operation
FROM operating_conditions a JOIN chain_drives b ON a.drive_id = b.drive_id;
```

| operating_condition_id | condition_id | temperature_min | temperature_max | drive_drive_id | drive_drive_type | drive_is_critical_operation |
|---|---|---|---|---|---|---|
| 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | 36.900001525878906 | 0.34 | 505996 | distributed-drive-96 | true |
| 101 | 9568469 | 3.62 | 0.83 | 9424933 | baseline-drive-97 | false |
| 102 | 4716413 | 0.43012016 | 1.603487606015595 | 6926357 | pilot-drive-98 | true |
| 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 0.075 | 0.38254625 | ChIJkXWylYht5kcRUCfYt4dK_wU | extended-drive-99 | false |

**View `v_chain_drive_chain_lubricant`**

```sql
CREATE VIEW v_chain_drive_chain_lubricant AS
SELECT a.drive_id, a.drive_type, a.is_critical_operation, a.installation_date, b.lubricant_id AS lubricant_lubricant_id, b.chemical_family AS lubricant_chemical_family, b.base_name AS lubricant_base_name
FROM chain_drives a JOIN chain_lubricants b ON a.lubricant_id = b.lubricant_id;
```

| drive_id | drive_type | is_critical_operation | installation_date | lubricant_lubricant_id | lubricant_chemical_family | lubricant_base_name |
|---|---|---|---|---|---|---|
| 505996 | distributed-drive-96 | true | 2022-01-10T00:12:00 | 8928502 | legacy-chemical-97 | Pilot Survey |
| 9424933 | baseline-drive-97 | false | 2023-06-21T07:29:00 | 5f940350-8fcd-11eb-924d-9cd76263cbd0 | compact-chemical-98 | Baseline Corridor |
| 6926357 | pilot-drive-98 | true | 2024-11-05T14:46:00 | c8a7d91b-e587-45b4-bae6-0c0a51b6241b | composite-chemical-99 | Distributed Series A |
| ChIJkXWylYht5kcRUCfYt4dK_wU | extended-drive-99 | false | 2025-04-16T21:03:00 | 1437589 | primary-chemical-100 | Adaptive Assessment |

**View `v_chain_drive_operating_condition`**

```sql
CREATE VIEW v_chain_drive_operating_condition AS
SELECT a.drive_id, a.drive_type, a.is_critical_operation, a.installation_date, b.operating_condition_id AS condition_operating_condition_id, b.condition_id AS condition_condition_id, b.temperature_min AS condition_temperature_min
FROM chain_drives a JOIN operating_conditions b ON a.operating_condition_id = b.operating_condition_id;
```

| drive_id | drive_type | is_critical_operation | installation_date | condition_operating_condition_id | condition_condition_id | condition_temperature_min |
|---|---|---|---|---|---|---|
| 505996 | distributed-drive-96 | true | 2022-01-10T00:12:00 | 100 | a9624ee2-9bad-11eb-a8a2-19ed5c03f8d3 | 36.900001525878906 |
| 9424933 | baseline-drive-97 | false | 2023-06-21T07:29:00 | 101 | 9568469 | 3.62 |
| 6926357 | pilot-drive-98 | true | 2024-11-05T14:46:00 | 102 | 4716413 | 0.43012016 |
| ChIJkXWylYht5kcRUCfYt4dK_wU | extended-drive-99 | false | 2025-04-16T21:03:00 | 103 | dce72594-8fcd-11eb-924d-9cd76263cbd0 | 0.075 |

**View `v_chain_drive_sprocket_detail`**

```sql
CREATE VIEW v_chain_drive_sprocket_detail AS
SELECT a.drive_id, a.drive_type, a.is_critical_operation, b.sprocket_id AS sprocket_sprocket_id, b.tooth_count AS sprocket_tooth_count, b.pitch_diameter AS sprocket_pitch_diameter
FROM chain_drives a
  JOIN drives_sprockets j ON j.drive_id = a.drive_id
  JOIN sprockets b ON b.sprocket_id = j.sprocket_id;
```

| drive_id | drive_type | is_critical_operation | sprocket_sprocket_id | sprocket_tooth_count | sprocket_pitch_diameter |
|---|---|---|---|---|---|
| 505996 | distributed-drive-96 | true | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 22 | 8.20 |
| 505996 | distributed-drive-96 | true | 10966241 | 6 | 12.40 |
| 9424933 | baseline-drive-97 | false | 10966241 | 6 | 12.40 |
| 9424933 | baseline-drive-97 | false | 99835 | 13 | 16.60 |
| 6926357 | pilot-drive-98 | true | 99835 | 13 | 16.60 |
| 6926357 | pilot-drive-98 | true | ChIJIaW7vcht5kcRsZwPgTo7fco | 1 | 20.80 |
| ChIJkXWylYht5kcRUCfYt4dK_wU | extended-drive-99 | false | ChIJIaW7vcht5kcRsZwPgTo7fco | 1 | 20.80 |
| ChIJkXWylYht5kcRUCfYt4dK_wU | extended-drive-99 | false | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 22 | 8.20 |

**View `v_sprocket_chain_drive`**

```sql
CREATE VIEW v_sprocket_chain_drive AS
SELECT a.sprocket_id, a.tooth_count, a.pitch_diameter, a.material, b.drive_id AS drive_drive_id, b.drive_type AS drive_drive_type, b.is_critical_operation AS drive_is_critical_operation
FROM sprockets a JOIN chain_drives b ON a.drive_id = b.drive_id;
```

| sprocket_id | tooth_count | pitch_diameter | material | drive_drive_id | drive_drive_type | drive_is_critical_operation |
|---|---|---|---|---|---|---|
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 22 | 8.20 | primary-material-94 | 505996 | distributed-drive-96 | true |
| 10966241 | 6 | 12.40 | adaptive-material-95 | 9424933 | baseline-drive-97 | false |
| 99835 | 13 | 16.60 | distributed-material-96 | 6926357 | pilot-drive-98 | true |
| ChIJIaW7vcht5kcRsZwPgTo7fco | 1 | 20.80 | baseline-material-97 | ChIJkXWylYht5kcRUCfYt4dK_wU | extended-drive-99 | false |

**View `v_sprocket_chain`**

```sql
CREATE VIEW v_sprocket_chain AS
SELECT a.sprocket_id, a.tooth_count, a.pitch_diameter, a.material, b.chain_id AS chain_chain_id, b.link_type AS chain_link_type, b.pitch AS chain_pitch
FROM sprockets a JOIN chains b ON a.chain_id = b.chain_id;
```

| sprocket_id | tooth_count | pitch_diameter | material | chain_chain_id | chain_link_type | chain_pitch |
|---|---|---|---|---|---|---|
| 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 22 | 8.20 | primary-material-94 | 1 | https://www.globaltimes.cn/page/202103/1219909.shtml | 5.20 |
| 10966241 | 6 | 12.40 | adaptive-material-95 | 2 | https://www.nature.com/articles/nphoton.2016.26 | 9.40 |
| 99835 | 13 | 16.60 | distributed-material-96 | 3 | https://api.github.com/repos/Jumpscale/ays_jumpscale8 | 13.60 |
| ChIJIaW7vcht5kcRsZwPgTo7fco | 1 | 20.80 | baseline-material-97 | 4 | http://transcripts.cnn.com/TRANSCRIPTS/1702/09/nday.05.html | 17.80 |

**View `v_chain_chain_drive`**

```sql
CREATE VIEW v_chain_chain_drive AS
SELECT a.chain_id, a.link_type, a.pitch, a.material, b.drive_id AS drive_drive_id, b.drive_type AS drive_drive_type, b.is_critical_operation AS drive_is_critical_operation
FROM chains a JOIN chain_drives b ON a.drive_id = b.drive_id;
```

| chain_id | link_type | pitch | material | drive_drive_id | drive_drive_type | drive_is_critical_operation |
|---|---|---|---|---|---|---|
| 1 | https://www.globaltimes.cn/page/202103/1219909.shtml | 5.20 | primary-material-94 | 505996 | distributed-drive-96 | true |
| 2 | https://www.nature.com/articles/nphoton.2016.26 | 9.40 | adaptive-material-95 | 9424933 | baseline-drive-97 | false |
| 3 | https://api.github.com/repos/Jumpscale/ays_jumpscale8 | 13.60 | distributed-material-96 | 6926357 | pilot-drive-98 | true |
| 4 | http://transcripts.cnn.com/TRANSCRIPTS/1702/09/nday.05.html | 17.80 | baseline-material-97 | ChIJkXWylYht5kcRUCfYt4dK_wU | extended-drive-99 | false |

**View `v_chain_sprocket_detail`**

```sql
CREATE VIEW v_chain_sprocket_detail AS
SELECT a.chain_id, a.link_type, a.pitch, b.sprocket_id AS sprocket_sprocket_id, b.tooth_count AS sprocket_tooth_count, b.pitch_diameter AS sprocket_pitch_diameter
FROM chains a
  JOIN chains_sprockets j ON j.chain_id = a.chain_id
  JOIN sprockets b ON b.sprocket_id = j.sprocket_id;
```

| chain_id | link_type | pitch | sprocket_sprocket_id | sprocket_tooth_count | sprocket_pitch_diameter |
|---|---|---|---|---|---|
| 1 | https://www.globaltimes.cn/page/202103/1219909.shtml | 5.20 | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 22 | 8.20 |
| 1 | https://www.globaltimes.cn/page/202103/1219909.shtml | 5.20 | 10966241 | 6 | 12.40 |
| 2 | https://www.nature.com/articles/nphoton.2016.26 | 9.40 | 10966241 | 6 | 12.40 |
| 2 | https://www.nature.com/articles/nphoton.2016.26 | 9.40 | 99835 | 13 | 16.60 |
| 3 | https://api.github.com/repos/Jumpscale/ays_jumpscale8 | 13.60 | 99835 | 13 | 16.60 |
| 3 | https://api.github.com/repos/Jumpscale/ays_jumpscale8 | 13.60 | ChIJIaW7vcht5kcRsZwPgTo7fco | 1 | 20.80 |
| 4 | http://transcripts.cnn.com/TRANSCRIPTS/1702/09/nday.05.html | 17.80 | ChIJIaW7vcht5kcRsZwPgTo7fco | 1 | 20.80 |
| 4 | http://transcripts.cnn.com/TRANSCRIPTS/1702/09/nday.05.html | 17.80 | 46d50e78-8fcc-11eb-924d-9cd76263cbd0 | 22 | 8.20 |

**View `v_manufacturer_chain_lubricant`**

```sql
CREATE VIEW v_manufacturer_chain_lubricant AS
SELECT a.id, a.manufacturer_id, a.name, a.support_phone, b.lubricant_id AS lubricant_lubricant_id, b.chemical_family AS lubricant_chemical_family, b.base_name AS lubricant_base_name
FROM manufacturers a JOIN chain_lubricants b ON a.lubricant_id = b.lubricant_id;
```

| id | manufacturer_id | name | support_phone | lubricant_lubricant_id | lubricant_chemical_family | lubricant_base_name |
|---|---|---|---|---|---|---|
| 1 | Esperion Therapeutics Inc. | Extended Review | composite-support-69 | 8928502 | legacy-chemical-97 | Pilot Survey |
| 2 | Microsoft Corporation | Pilot Initiative A | primary-support-70 | 5f940350-8fcd-11eb-924d-9cd76263cbd0 | compact-chemical-98 | Baseline Corridor |
| 3 | Northrop Grumman | Baseline Model | adaptive-support-71 | c8a7d91b-e587-45b4-bae6-0c0a51b6241b | composite-chemical-99 | Distributed Series A |
| 4 | Switch Card Services Ltd. | Distributed Cluster | distributed-support-72 | 1437589 | primary-chemical-100 | Adaptive Assessment |
