## Ontology-Grounded Relational Modelling in Parasitic Weed Ecology

The domain under examination concerns the ecological and agricultural relationships between parasitic weed species, their host crops, the fields in which they co-occur, and the environmental conditions that govern their germination. At the conceptual level, five principal entity types are modelled: parasitic weed species, crop species, agricultural fields, germination requirements, and geographic regions. Two additional association tables capture many-to-many relationships—species-to-species interactions and region-to-field assignments. The resulting schema is a fully normalised relational model in which every foreign key corresponds to an explicit ontology relationship, and every view materialises a domain fact by joining the appropriate normalised tables. The data itself is entirely synthetic; all organisation, person, and product names are fictional.

**Table `parasitic_weed_specieses`**

| id | species_code | common_name | parasitic_type | chlorophyll_presence | seed_production_rate | seed_longevity_years | seed_size_micrograms | germination_cue_required | field_id | germination_requirement_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Striga asiatica | Seasonal Review | obligate | true | 21.70 | 6.70 | 1.00331 | true | 9085253 | 1 |
| 101 | Striga hermonthica | Integrated Initiative | facultative | false | 24.40 | 11.40 | 0.74 | false | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | 2 |
| 102 | Rhamphicarpa fistulosa | Extended Model D | obligate | true | 27.10 | 16.10 | 0.74 | true | 1996924 | 3 |
| 103 | Striga asiatica | Pilot Cluster | facultative | false | 29.80 | 20.80 | 0.6000001 | false | 2298 | 4 |

The `parasitic_weed_specieses` table is the central entity of the model. Each row represents a distinct parasitic weed species and carries a surrogate primary key `id` alongside a human-readable `species_code`. The column `common_name` stores a project or initiative label rather than a botanical vernacular—values such as *Seasonal Review*, *Integrated Initiative*, *Extended Model D*, and *Pilot Cluster D* appear in the data. The attribute `parasitic_type` is a categorical flag distinguishing obligate parasites (which cannot complete their life cycle without a host) from facultative ones; the first row, `Striga asiatica`, is recorded as `obligate`, while `Striga hermonthica` is `facultative`. The boolean `chlorophyll_presence` indicates whether the species retains photosynthetic capability—`true` for `Striga asiatica` and `Rhamphicarpa fistulosa`, `false` for the other two entries. Quantitative morphological and life-history traits are captured in `seed_production_rate` (ranging from 21.70 to 29.80), `seed_longevity_years` (6.70 to 20.80), and `seed_size_micrograms` (0.60 to 1.00331). The boolean `germination_cue_required` signals whether the species depends on an external trigger to break seed dormancy. Two foreign keys anchor this entity to the rest of the schema: `field_id` references `agricultural_fields.field_id`, and `germination_requirement_id` references `germination_requirements.germination_requirement_id`. The first row links to field `9085253` and germination requirement `1`; the second row's `field_id` is a UUID (`1c87986a-8fcd-11eb-924d-9cd76263cbd0`), illustrating that the schema tolerates heterogeneous identifier formats.

**Table `crop_specieses`**

| id | scientific_name | crop_type | growth_region | is_host_for_striga | is_host_for_rhamphicarpa | parasitic_weed_species_id | field_id |
|---|---|---|---|---|---|---|---|
| 1 | Integrated Protocol A | cereal | baseline-growth-91 | false | true | 100 | 9085253 |
| 2 | Extended Programme | legume | pilot-growth-92 | true | false | 101 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | Pilot Standard | rice | extended-growth-93 | false | true | 102 | 1996924 |
| 4 | Baseline Framework D | cereal | integrated-growth-94 | true | false | 103 | 2298 |

The `crop_specieses` table models host crops. Its surrogate key `id` is an integer, and `scientific_name` stores a formal designation such as *Integrated Protocol A* or *Baseline Framework D*. The `crop_type` column classifies crops into broad categories—`cereal`, `legume`, and `rice` appear in the sample data. `growth_region` encodes a growth-zone label (e.g., `baseline-growth-91`, `pilot-growth-92`). Two boolean columns, `is_host_for_striga` and `is_host_for_rhamphicarpa`, record host susceptibility to two major parasitic genera; for instance, crop `1` (*Integrated Protocol A*) is `is_host_for_striga = false` but `is_host_for_rhamphicarpa = true`, whereas crop `2` (*Extended Programme*) is the inverse. Foreign keys `parasitic_weed_species_id` and `field_id` link each crop to a specific parasitic weed species and an agricultural field, respectively. Crop `1` is associated with parasitic weed species `100` and field `9085253`.

**Table `agricultural_fields`**

| field_id | landscape_position | soil_drainage | soil_moisture_level | primary_crop | affected_households | crop_species_id | parasitic_weed_species_id | geographic_region_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 9085253 | upland | free-draining | extended-soil-45 | extended-primary-87 | 6 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | lowland | waterlogged | integrated-soil-46 | integrated-primary-88 | 11 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 1996924 | upland | free-draining | seasonal-soil-47 | seasonal-primary-89 | 16 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 2298 | lowland | waterlogged | regional-soil-48 | regional-primary-90 | 21 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

`agricultural_fields` is the spatial anchor of the model. The primary key `field_id` is a composite of integer and UUID values across rows—`9085253`, `1c87986a-8fcd-11eb-924d-9cd76263cbd0`, `1996924`, and `2298`. The column `landscape_position` distinguishes `upland` from `lowland` sites. `soil_drainage` is categorical (`free-draining` or `waterlogged`), and `soil_moisture_level` stores a zone label such as `extended-soil-45` or `integrated-soil-46`. `primary_crop` records the dominant crop variety (e.g., `extended-primary-87`). `affected_households` is an integer count—values range from 6 to 21. Three foreign keys connect this table to the rest of the schema: `crop_species_id` references `crop_specieses.id`, `parasitic_weed_species_id` references `parasitic_weed_specieses.id`, and `geographic_region_id` references `geographic_regions.id`. The first field (`9085253`) links to crop species `1`, parasitic weed species `100`, and geographic region `1`. The `created_at` timestamp records when the field record was entered.

**Table `germination_requirements`**

| germination_requirement_id | requirement_type | cue_substance | moisture_threshold | host_root_proximity_required | parasitic_weed_species_id | created_at |
|---|---|---|---|---|---|---|
| 1 | biochemical_cue | seasonal-cue-17 | 22.45 | true | 100 | 2025-01-01 00:14:00 |
| 2 | soil_moisture | regional-cue-18 | 26.90 | false | 101 | 2025-02-06 03:14:00 |
| 3 | temperature | legacy-cue-19 | 31.35 | true | 102 | 2025-03-11 06:14:00 |
| 4 | biochemical_cue | compact-cue-20 | 35.80 | false | 103 | 2025-04-16 09:14:00 |

The `germination_requirements` table captures the environmental triggers that break seed dormancy in parasitic weeds. Its surrogate key is `germination_requirement_id`. The `requirement_type` column classifies the cue as `biochemical_cue`, `soil_moisture`, or `temperature`. The `cue_substance` column stores a specific trigger label (e.g., `seasonal-cue-17`, `regional-cue-18`). `moisture_threshold` is a numeric value (22.45 to 35.80) representing the moisture level at which germination is triggered. The boolean `host_root_proximity_required` indicates whether the weed needs to detect host roots to germinate. The foreign key `parasitic_weed_species_id` links each requirement to exactly one parasitic weed species. Germination requirement `1` (type `biochemical_cue`, cue `seasonal-cue-17`, threshold 22.45) is associated with parasitic weed species `100`. The `created_at` timestamp is present.

**Table `geographic_regions`**

| id | region_code | region_name | climate_zone | dominant_soil_type |
|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | distributed-climate-84 | pilot-dominant-50 |
| 2 | 6564391 | Adaptive Survey D | baseline-climate-85 | extended-dominant-51 |
| 3 | 778560 | Primary Corridor | pilot-climate-86 | integrated-dominant-52 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | extended-climate-87 | seasonal-dominant-53 |

`geographic_regions` provides the macro-scale spatial context. Its surrogate key `id` is an integer, and `region_code` is a numeric identifier (e.g., `1562837`, `6564391`). `region_name` stores a descriptive label such as *Distributed Assessment* or *Adaptive Survey D*. `climate_zone` encodes a climate classification (e.g., `distributed-climate-84`, `baseline-climate-85`), and `dominant_soil_type` records the predominant soil category (e.g., `pilot-dominant-50`).

**Table `specieses_specieses`**

| parasitic_weed_species_id | crop_species_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `specieses_specieses` table is a junction table that resolves a many-to-many relationship between parasitic weed species and crop species. It contains two columns, `parasitic_weed_species_id` and `crop_species_id`, each serving as a foreign key referencing the respective entity table. The eight rows encode all pairwise host–parasite associations in the dataset: parasitic weed species `100` is linked to crop species `1` and `2`; species `101` to crops `2` and `3`; species `102` to crops `3` and `4`; and species `103` to crops `4` and `1`. This table is the normalised form of what would otherwise be redundant boolean columns in either the crop or weed entity.

**Table `regions_fields`**

| geographic_region_id | field_id |
|---|---|
| 1 | 9085253 |
| 1 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 |
| 2 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 |
| 2 | 1996924 |
| 3 | 1996924 |
| 3 | 2298 |
| 4 | 2298 |
| 4 | 9085253 |

The `regions_fields` table is a second junction table, resolving the many-to-many relationship between geographic regions and agricultural fields. Although the `agricultural_fields` table already carries a `geographic_region_id` foreign key, this junction table provides an explicit association layer that supports fields assigned to multiple regions or regions containing many fields without duplicating field records. The table's structure mirrors `specieses_specieses`: two columns, each a foreign key, with rows representing individual region–field assignments.

The materialised views reconstruct domain facts by joining these normalised tables. Each view answers a specific analytical question by denormalising a subset of the schema.

**View `vw_parasitic_weed_species_crop_species_detail`**

```sql
CREATE VIEW vw_parasitic_weed_species_crop_species_detail AS
SELECT a.id, a.species_code, a.common_name, b.id AS species_id, b.scientific_name AS species_scientific_name, b.crop_type AS species_crop_type
FROM parasitic_weed_specieses a
  JOIN specieses_specieses j ON j.parasitic_weed_species_id = a.id
  JOIN crop_specieses b ON b.id = j.crop_species_id;
```

| id | species_code | common_name | species_id | species_scientific_name | species_crop_type |
|---|---|---|---|---|---|
| 100 | Striga asiatica | Seasonal Review | 1 | Integrated Protocol A | cereal |
| 100 | Striga asiatica | Seasonal Review | 2 | Extended Programme | legume |
| 101 | Striga hermonthica | Integrated Initiative | 2 | Extended Programme | legume |
| 101 | Striga hermonthica | Integrated Initiative | 3 | Pilot Standard | rice |
| 102 | Rhamphicarpa fistulosa | Extended Model D | 3 | Pilot Standard | rice |
| 102 | Rhamphicarpa fistulosa | Extended Model D | 4 | Baseline Framework D | cereal |
| 103 | Striga asiatica | Pilot Cluster | 4 | Baseline Framework D | cereal |
| 103 | Striga asiatica | Pilot Cluster | 1 | Integrated Protocol A | cereal |

This view joins `parasitic_weed_specieses` with `crop_specieses` through the `specieses_specieses` junction table, producing a detailed matrix of which parasitic weeds affect which crops. It answers the question: *For each parasitic weed species, which crop species are susceptible hosts?* Reading the first row, parasitic weed species `100` (*Striga asiatica*, common name *Seasonal Review*, obligate parasite) is linked to crop species `1` (*Integrated Protocol A*, cereal type). The second row shows the same parasitic weed species `100` associated with crop species `2` (*Extended Programme*, legume type), confirming that one parasite can affect multiple crop types.

**View `vw_parasitic_weed_species_agricultural_field`**

```sql
CREATE VIEW vw_parasitic_weed_species_agricultural_field AS
SELECT a.id, a.species_code, a.common_name, a.parasitic_type, b.field_id AS field_field_id, b.landscape_position AS field_landscape_position, b.soil_drainage AS field_soil_drainage
FROM parasitic_weed_specieses a JOIN agricultural_fields b ON a.field_id = b.field_id;
```

| id | species_code | common_name | parasitic_type | field_field_id | field_landscape_position | field_soil_drainage |
|---|---|---|---|---|---|---|
| 100 | Striga asiatica | Seasonal Review | obligate | 9085253 | upland | free-draining |
| 101 | Striga hermonthica | Integrated Initiative | facultative | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | lowland | waterlogged |
| 102 | Rhamphicarpa fistulosa | Extended Model D | obligate | 1996924 | upland | free-draining |
| 103 | Striga asiatica | Pilot Cluster | facultative | 2298 | lowland | waterlogged |

This view joins `parasitic_weed_specieses` with `agricultural_fields` to answer: *In which agricultural fields does each parasitic weed species occur?* The first row shows parasitic weed species `100` (*Striga asiatica*) in field `9085253`, which is an upland site with free-draining soil and `extended-soil-45` moisture level, affecting 6 households. The second row places parasitic weed species `101` (*Striga hermonthica*) in field `1c87986a-8fcd-11eb-924d-9cd76263cbd0`, a lowland, waterlogged site affecting 11 households.

**View `vw_parasitic_weed_species_germination_requirement`**

```sql
CREATE VIEW vw_parasitic_weed_species_germination_requirement AS
SELECT a.id, a.species_code, a.common_name, a.parasitic_type, b.germination_requirement_id AS requirement_germination_requirement_id, b.requirement_type AS requirement_requirement_type, b.cue_substance AS requirement_cue_substance
FROM parasitic_weed_specieses a JOIN germination_requirements b ON a.germination_requirement_id = b.germination_requirement_id;
```

| id | species_code | common_name | parasitic_type | requirement_germination_requirement_id | requirement_requirement_type | requirement_cue_substance |
|---|---|---|---|---|---|---|
| 100 | Striga asiatica | Seasonal Review | obligate | 1 | biochemical_cue | seasonal-cue-17 |
| 101 | Striga hermonthica | Integrated Initiative | facultative | 2 | soil_moisture | regional-cue-18 |
| 102 | Rhamphicarpa fistulosa | Extended Model D | obligate | 3 | temperature | legacy-cue-19 |
| 103 | Striga asiatica | Pilot Cluster | facultative | 4 | biochemical_cue | compact-cue-20 |

This view joins `parasitic_weed_specieses` with `germination_requirements` to answer: *What germination cue does each parasitic weed species require?* The first row shows parasitic weed species `100` (*Striga asiatica*) requiring a `biochemical_cue` of type `seasonal-cue-17` with a moisture threshold of 22.45 and host root proximity required. The third row shows parasitic weed species `102` (*Rhamphicarpa fistulosa*) requiring a `temperature` cue (`legacy-cue-19`) with a higher moisture threshold of 31.35 and host root proximity required.

**View `vw_crop_species_parasitic_weed_species`**

```sql
CREATE VIEW vw_crop_species_parasitic_weed_species AS
SELECT a.id, a.scientific_name, a.crop_type, a.growth_region, b.id AS species_id, b.species_code AS species_species_code, b.common_name AS species_common_name
FROM crop_specieses a JOIN parasitic_weed_specieses b ON a.parasitic_weed_species_id = b.id;
```

| id | scientific_name | crop_type | growth_region | species_id | species_species_code | species_common_name |
|---|---|---|---|---|---|---|
| 1 | Integrated Protocol A | cereal | baseline-growth-91 | 100 | Striga asiatica | Seasonal Review |
| 2 | Extended Programme | legume | pilot-growth-92 | 101 | Striga hermonthica | Integrated Initiative |
| 3 | Pilot Standard | rice | extended-growth-93 | 102 | Rhamphicarpa fistulosa | Extended Model D |
| 4 | Baseline Framework D | cereal | integrated-growth-94 | 103 | Striga asiatica | Pilot Cluster |

This view joins `crop_specieses` with `parasitic_weed_specieses` through the junction table, answering the inverse question of the first view: *For each crop species, which parasitic weed species are threats?* The first row shows crop species `1` (*Integrated Protocol A*, cereal) threatened by parasitic weed species `100` (*Striga asiatica*). The fourth row shows crop species `4` (*Baseline Framework D*, cereal) threatened by parasitic weed species `103` (*Striga asiatica*, common name *Pilot Cluster*).

**View `vw_crop_species_agricultural_field`**

```sql
CREATE VIEW vw_crop_species_agricultural_field AS
SELECT a.id, a.scientific_name, a.crop_type, a.growth_region, b.field_id AS field_field_id, b.landscape_position AS field_landscape_position, b.soil_drainage AS field_soil_drainage
FROM crop_specieses a JOIN agricultural_fields b ON a.field_id = b.field_id;
```

| id | scientific_name | crop_type | growth_region | field_field_id | field_landscape_position | field_soil_drainage |
|---|---|---|---|---|---|---|
| 1 | Integrated Protocol A | cereal | baseline-growth-91 | 9085253 | upland | free-draining |
| 2 | Extended Programme | legume | pilot-growth-92 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | lowland | waterlogged |
| 3 | Pilot Standard | rice | extended-growth-93 | 1996924 | upland | free-draining |
| 4 | Baseline Framework D | cereal | integrated-growth-94 | 2298 | lowland | waterlogged |

This view joins `crop_specieses` with `agricultural_fields` to answer: *Which crop species are grown in which agricultural fields?* The first row shows crop species `1` (*Integrated Protocol A*) grown in field `9085253` (upland, free-draining). The second row shows crop species `2` (*Extended Programme*) grown in field `1c87986a-8fcd-11eb-924d-9cd76263cbd0` (lowland, waterlogged).

**View `vw_agricultural_field_crop_species`**

```sql
CREATE VIEW vw_agricultural_field_crop_species AS
SELECT a.field_id, a.landscape_position, a.soil_drainage, a.soil_moisture_level, b.id AS species_id, b.scientific_name AS species_scientific_name, b.crop_type AS species_crop_type
FROM agricultural_fields a JOIN crop_specieses b ON a.crop_species_id = b.id;
```

| field_id | landscape_position | soil_drainage | soil_moisture_level | species_id | species_scientific_name | species_crop_type |
|---|---|---|---|---|---|---|
| 9085253 | upland | free-draining | extended-soil-45 | 1 | Integrated Protocol A | cereal |
| 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | lowland | waterlogged | integrated-soil-46 | 2 | Extended Programme | legume |
| 1996924 | upland | free-draining | seasonal-soil-47 | 3 | Pilot Standard | rice |
| 2298 | lowland | waterlogged | regional-soil-48 | 4 | Baseline Framework D | cereal |

This view joins `agricultural_fields` with `crop_specieses`, answering: *For each agricultural field, what is the primary crop species?* The first row shows field `9085253` (upland, free-draining, 6 affected households) growing crop species `1` (*Integrated Protocol A*, cereal). The fourth row shows field `2298` (lowland, waterlogged, 21 affected households) growing crop species `4` (*Baseline Framework D*, cereal).

**View `vw_agricultural_field_parasitic_weed_species`**

```sql
CREATE VIEW vw_agricultural_field_parasitic_weed_species AS
SELECT a.field_id, a.landscape_position, a.soil_drainage, a.soil_moisture_level, b.id AS species_id, b.species_code AS species_species_code, b.common_name AS species_common_name
FROM agricultural_fields a JOIN parasitic_weed_specieses b ON a.parasitic_weed_species_id = b.id;
```

| field_id | landscape_position | soil_drainage | soil_moisture_level | species_id | species_species_code | species_common_name |
|---|---|---|---|---|---|---|
| 9085253 | upland | free-draining | extended-soil-45 | 100 | Striga asiatica | Seasonal Review |
| 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | lowland | waterlogged | integrated-soil-46 | 101 | Striga hermonthica | Integrated Initiative |
| 1996924 | upland | free-draining | seasonal-soil-47 | 102 | Rhamphicarpa fistulosa | Extended Model D |
| 2298 | lowland | waterlogged | regional-soil-48 | 103 | Striga asiatica | Pilot Cluster |

This view joins `agricultural_fields` with `parasitic_weed_specieses`, answering: *For each agricultural field, which parasitic weed species is present?* The first row shows field `9085253` affected by parasitic weed species `100` (*Striga asiatica*, obligate, chlorophyll present, seed production rate 21.70). The third row shows field `1996924` (upland, free-draining, 16 affected households) affected by parasitic weed species `102` (*Rhamphicarpa fistulosa*, obligate, seed longevity 16.10 years).

**View `vw_agricultural_field_geographic_region`**

```sql
CREATE VIEW vw_agricultural_field_geographic_region AS
SELECT a.field_id, a.landscape_position, a.soil_drainage, a.soil_moisture_level, b.id AS region_id, b.region_code AS region_region_code, b.region_name AS region_region_name
FROM agricultural_fields a JOIN geographic_regions b ON a.geographic_region_id = b.id;
```

| field_id | landscape_position | soil_drainage | soil_moisture_level | region_id | region_region_code | region_region_name |
|---|---|---|---|---|---|---|
| 9085253 | upland | free-draining | extended-soil-45 | 1 | 1562837 | Distributed Assessment |
| 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | lowland | waterlogged | integrated-soil-46 | 2 | 6564391 | Adaptive Survey D |
| 1996924 | upland | free-draining | seasonal-soil-47 | 3 | 778560 | Primary Corridor |
| 2298 | lowland | waterlogged | regional-soil-48 | 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series |

This view joins `agricultural_fields` with `geographic_regions`, answering: *For each agricultural field, which geographic region does it belong to?* The first row shows field `9085253` in geographic region `1` (region code `1562837`, name *Distributed Assessment*, climate zone `distributed-climate-84`, dominant soil `pilot-dominant-50`). The fourth row shows field `2298` in geographic region `4` (region code `8667ec1da10c4a0293d91388b49bc77c`, name *Composite Series*, climate zone `extended-climate-87`).

**View `vw_germination_requirement_parasitic_weed_species`**

```sql
CREATE VIEW vw_germination_requirement_parasitic_weed_species AS
SELECT a.germination_requirement_id, a.requirement_type, a.cue_substance, a.moisture_threshold, b.id AS species_id, b.species_code AS species_species_code, b.common_name AS species_common_name
FROM germination_requirements a JOIN parasitic_weed_specieses b ON a.parasitic_weed_species_id = b.id;
```

| germination_requirement_id | requirement_type | cue_substance | moisture_threshold | species_id | species_species_code | species_common_name |
|---|---|---|---|---|---|---|
| 1 | biochemical_cue | seasonal-cue-17 | 22.45 | 100 | Striga asiatica | Seasonal Review |
| 2 | soil_moisture | regional-cue-18 | 26.90 | 101 | Striga hermonthica | Integrated Initiative |
| 3 | temperature | legacy-cue-19 | 31.35 | 102 | Rhamphicarpa fistulosa | Extended Model D |
| 4 | biochemical_cue | compact-cue-20 | 35.80 | 103 | Striga asiatica | Pilot Cluster |

This view joins `germination_requirements` with `parasitic_weed_specieses`, answering: *For each germination requirement, which parasitic weed species does it govern?* The first row shows germination requirement `1` (type `biochemical_cue`, cue `seasonal-cue-17`, threshold 22.45) governing parasitic weed species `100` (*Striga asiatica*). The third row shows germination requirement `3` (type `temperature`, cue `legacy-cue-19`, threshold 31.35) governing parasitic weed species `102` (*Rhamphicarpa fistulosa*).

**View `vw_geographic_region_agricultural_field_detail`**

```sql
CREATE VIEW vw_geographic_region_agricultural_field_detail AS
SELECT a.id, a.region_code, a.region_name, b.field_id AS field_field_id, b.landscape_position AS field_landscape_position, b.soil_drainage AS field_soil_drainage
FROM geographic_regions a
  JOIN regions_fields j ON j.geographic_region_id = a.id
  JOIN agricultural_fields b ON b.field_id = j.field_id;
```

| id | region_code | region_name | field_field_id | field_landscape_position | field_soil_drainage |
|---|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | 9085253 | upland | free-draining |
| 1 | 1562837 | Distributed Assessment | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | lowland | waterlogged |
| 2 | 6564391 | Adaptive Survey D | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | lowland | waterlogged |
| 2 | 6564391 | Adaptive Survey D | 1996924 | upland | free-draining |
| 3 | 778560 | Primary Corridor | 1996924 | upland | free-draining |
| 3 | 778560 | Primary Corridor | 2298 | lowland | waterlogged |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | 2298 | lowland | waterlogged |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | 9085253 | upland | free-draining |

This view joins `geographic_regions` with `agricultural_fields`, answering: *For each geographic region, which agricultural fields are located within it, and what are their characteristics?* The first row shows geographic region `1` (*Distributed Assessment*, `distributed-climate-84`) containing field `9085253` (upland, free-draining, `extended-soil-45`, 6 affected households). The second row shows geographic region `2` (*Adaptive Survey D*, `baseline-climate-85`) containing field `1c87986a-8fcd-11eb-924d-9cd76263cbd0` (lowland, waterlogged, `integrated-soil-46`, 11 affected households).

The schema as a whole demonstrates a clean separation between entity data and relationship data. Each base table stores attributes of a single concept, and every foreign key is a direct projection of an ontology relationship. The junction tables `specieses_specieses` and `regions_fields` eliminate transitive dependencies that would otherwise require redundant boolean flags or multi-valued columns. The views then denormalise these relationships along specific axes—crop–weed, field–weed, field–region, and so on—each producing a flat result set that directly answers a domain question. The concrete values in the data, from the seed size of `1.00331` micrograms for `Striga asiatica` to the `waterlogged` soil condition of field `1c87986a-8fcd-11eb-924d-9cd76263cbd0`, are not incidental; they are the observable manifestations of the ontology's attribute slots, materialised as columns in a relational engine.