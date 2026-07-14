## The Ecology of Parasitic Weeds in Agricultural Systems

Parasitic weeds represent one of the most persistent threats to global food security, capable of siphoning water, nutrients, and carbohydrates directly from host crops through specialized haustorial connections. Managing these organisms demands an integrated understanding of their biology, their host preferences, the environmental conditions that trigger germination, and the geographic contexts in which they thrive. The records maintained across agricultural monitoring systems capture this complexity through a structured set of observations linking individual weed species to the crops they parasitize, the fields where infestations occur, and the regional conditions that shape their life cycles. This chapter documents the entities and relationships that form the backbone of parasitic weed surveillance, drawing on concrete field records to illustrate how practitioners track and interpret these biological interactions.

**Table `parasitic_weed_specieses`**

| id | species_code | common_name | parasitic_type | chlorophyll_presence | seed_production_rate | seed_longevity_years | seed_size_micrograms | germination_cue_required | field_id | germination_requirement_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Striga asiatica | Seasonal Review | obligate | true | 21.70 | 6.70 | 1.00331 | true | 9085253 | 1 |
| 101 | Striga hermonthica | Integrated Initiative | facultative | false | 24.40 | 11.40 | 0.74 | false | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | 2 |
| 102 | Rhamphicarpa fistulosa | Extended Model D | obligate | true | 27.10 | 16.10 | 0.74 | true | 1996924 | 3 |
| 103 | Striga asiatica | Pilot Cluster | facultative | false | 29.80 | 20.80 | 0.6000001 | false | 2298 | 4 |

The core entity in any parasitic weed monitoring system is the weed species itself, recorded with a standardized species code, a common name used in field reports, and a suite of biological attributes that determine its threat profile. The parasitic type distinguishes obligate parasites, which cannot complete their life cycle without a host, from facultative parasites that can survive independently but gain an advantage from parasitism. For instance, the record for *Striga asiatica* (species code `Striga asiatica`, common name "Seasonal Review") is classified as obligate and retains chlorophyll, enabling limited photosynthesis alongside its parasitic lifestyle. Its seed production rate of 21.70 seeds per plant and a seed longevity of 6.70 years in the soil seedbank establish a moderate threat window. By contrast, *Striga hermonthica* (common name "Integrated Initiative") is facultative and lacks chlorophyll, producing 24.40 seeds per plant with seeds persisting for 11.40 years—nearly double the persistence of *S. asiatica*. The species *Rhamphicarpa fistulosa* (common name "Extended Model D") reaches an even more extreme longevity of 16.10 years with a seed production rate of 27.10, while a second record attributed to *Striga asiatica* under the common name "Pilot Cluster" shows a seed longevity of 20.80 years and a seed size of 0.60 micrograms, notably smaller than the 1.00 micrograms recorded for the Seasonal Review entry. These variations in seed size, longevity, and production rate directly influence the difficulty of eradication and the length of time fields remain at risk after an infestation is managed.

**Table `crop_specieses`**

| id | scientific_name | crop_type | growth_region | is_host_for_striga | is_host_for_rhamphicarpa | parasitic_weed_species_id | field_id |
|---|---|---|---|---|---|---|---|
| 1 | Integrated Protocol A | cereal | baseline-growth-91 | false | true | 100 | 9085253 |
| 2 | Extended Programme | legume | pilot-growth-92 | true | false | 101 | 1c87986a-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | Pilot Standard | rice | extended-growth-93 | false | true | 102 | 1996924 |
| 4 | Baseline Framework D | cereal | integrated-growth-94 | true | false | 103 | 2298 |

Host crops are documented alongside their parasitic weed associations, with fields tracking which crop is grown and which parasitic weed species is present. The crop species table records the scientific name, crop type (cereal, legume, or rice), and binary indicators specifying whether the crop serves as a host for *Striga* or *Rhamphicarpa*. The cereal known as "Integrated Protocol A" is not a host for *Striga* but is a confirmed host for *Rhamphicarpa*, and it is grown in field `9085253` alongside parasitic weed species `100`. The legume "Extended Programme" (crop id `2`) is a *Striga* host but not a *Rhamphicarpa* host, cultivated in field `1c87986a-8fcd-11eb-924d-9cd76263cbd0` with parasitic weed species `101`. Rice variety "Pilot Standard" (crop id `3`) hosts *Rhamphicarpa* and is grown in field `1996924` alongside species `102`. The cereal "Baseline Framework D" (crop id `4`) hosts *Striga* and is cultivated in field `2298` with species `103`. The presence of both `is_host_for_striga` and `is_host_for_rhamphicarpa` flags allows practitioners to quickly identify which crop varieties are vulnerable to which parasite genera, informing rotation planning and resistant variety selection.

**Table `agricultural_fields`**

| field_id | landscape_position | soil_drainage | soil_moisture_level | primary_crop | affected_households | crop_species_id | parasitic_weed_species_id | geographic_region_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 9085253 | upland | free-draining | extended-soil-45 | extended-primary-87 | 6 | 1 | 100 | 1 | 2025-01-01 00:14:00 |
| 1c87986a-8fcd-11eb-924d-9cd76263cbd0 | lowland | waterlogged | integrated-soil-46 | integrated-primary-88 | 11 | 2 | 101 | 2 | 2025-02-06 03:14:00 |
| 1996924 | upland | free-draining | seasonal-soil-47 | seasonal-primary-89 | 16 | 3 | 102 | 3 | 2025-03-11 06:14:00 |
| 2298 | lowland | waterlogged | regional-soil-48 | regional-primary-90 | 21 | 4 | 103 | 4 | 2025-04-16 09:14:00 |

Agricultural fields serve as the spatial anchor for all observations, linking the biological entities to specific plots of land. Each field record captures the landscape position (upland or lowland), soil drainage characteristics (free-draining or waterlogged), soil moisture level, the primary crop grown, the number of households affected, and the specific crop and parasitic weed species present. Field `9085253` sits in an upland position with free-draining soil and extended soil moisture conditions, supporting primary crop `extended-primary-87` across six affected households. Field `1c87986a-8fcd-11eb-924d-9cd76263cbd0` occupies a lowland position with waterlogged soil and integrated soil moisture, affecting eleven households. Field `1996924` is upland with free-draining soil under seasonal moisture conditions, impacting sixteen households. Field `2298` is lowland with waterlogged soil and regional moisture conditions, affecting twenty-one households. The progression of affected households from six to twenty-one across these four fields illustrates how infestation severity can vary dramatically even within a monitored network, with lowland waterlogged conditions correlating with higher household impact counts.

**Table `germination_requirements`**

| germination_requirement_id | requirement_type | cue_substance | moisture_threshold | host_root_proximity_required | parasitic_weed_species_id | created_at |
|---|---|---|---|---|---|---|
| 1 | biochemical_cue | seasonal-cue-17 | 22.45 | true | 100 | 2025-01-01 00:14:00 |
| 2 | soil_moisture | regional-cue-18 | 26.90 | false | 101 | 2025-02-06 03:14:00 |
| 3 | temperature | legacy-cue-19 | 31.35 | true | 102 | 2025-03-11 06:14:00 |
| 4 | biochemical_cue | compact-cue-20 | 35.80 | false | 103 | 2025-04-16 09:14:00 |

The germination of parasitic weed seeds is rarely spontaneous; it typically requires specific environmental or biochemical cues that signal the presence of a suitable host nearby. The germination requirements table documents these triggers for each parasitic weed species. Species `100` (*Striga asiatica*, "Seasonal Review") requires a biochemical cue—specifically `seasonal-cue-17`—at a moisture threshold of 22.45, and host root proximity is required for germination. Species `101` (*Striga hermonthica*, "Integrated Initiative") relies on soil moisture alone at a threshold of 26.90, with no host root proximity requirement. Species `102` (*Rhamphicarpa fistulosa*, "Extended Model D") requires a temperature cue (`legacy-cue-19`) at a threshold of 31.35, with host root proximity mandatory. Species `103` (the "Pilot Cluster" record of *Striga asiatica*) uses a biochemical cue (`compact-cue-20`) at a threshold of 35.80 without requiring host root proximity. The diversity of cue types—biochemical, soil moisture, and temperature—reflects the evolutionary adaptation of different parasitic weeds to distinct ecological niches, and the moisture thresholds provide quantitative targets for irrigation management strategies aimed at suppressing germination.

**Table `geographic_regions`**

| id | region_code | region_name | climate_zone | dominant_soil_type |
|---|---|---|---|---|
| 1 | 1562837 | Distributed Assessment | distributed-climate-84 | pilot-dominant-50 |
| 2 | 6564391 | Adaptive Survey D | baseline-climate-85 | extended-dominant-51 |
| 3 | 778560 | Primary Corridor | pilot-climate-86 | integrated-dominant-52 |
| 4 | 8667ec1da10c4a0293d91388b49bc77c | Composite Series | extended-climate-87 | seasonal-dominant-53 |

Geographic regions provide the broader environmental context within which agricultural fields exist. Each region is identified by a region code, a region name, a climate zone classification, and a dominant soil type. Region `1` (code `1562837`, name "Distributed Assessment") falls within the distributed-climate-84 zone with pilot-dominant-50 soil. Region `2` (code `6564391`, name "Adaptive Survey D") is classified under baseline-climate-85 with extended-dominant-51 soil. Region `3` (code `778560`, name "Primary Corridor") occupies the pilot-climate-86 zone with integrated-dominant-52 soil. Region `4` (code `8667ec1da10c4a0293d91388b49bc77c`, name "Composite Series") is in the extended-climate-87 zone with seasonal-dominant-53 soil. The naming convention for climate zones and soil types follows a structured taxonomy that enables cross-referencing with regional agricultural extension databases, allowing practitioners to layer parasitic weed data onto existing geographic information systems.

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

The relationship between parasitic weeds and crops is explicitly recorded in the species-to-species association table, which maps every known host-parasite pairing. This table contains eight records linking parasitic weed species to crop species. Parasitic weed species `100` associates with both crop species `1` and `2`, indicating that this parasite can infect both the cereal "Integrated Protocol A" and the legume "Extended Programme." Species `101` associates with crops `2` and `3`, meaning it parasitizes both the legume and the rice variety. Species `102` links to crops `3` and `4`, infecting rice and the cereal "Baseline Framework D." Species `103` associates with crops `4` and `1`, completing a cycle where each parasitic species infects two different crop types. This many-to-many relationship structure is critical for understanding cross-crop transmission risks and for designing crop rotation strategies that break the parasite life cycle by avoiding consecutive planting of susceptible hosts.

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

The association between geographic regions and agricultural fields establishes the spatial hierarchy of the monitoring network. Each field is assigned to a single geographic region, and each region contains one or more monitored fields. This linkage enables aggregation of infestation data at the regional level, supporting the identification of hotspots and the allocation of control resources to the most affected areas. The four fields in the dataset are distributed across the four geographic regions, with each region containing exactly one monitored field in this sample.

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

This view joins parasitic weed species with their associated crop species to produce a comprehensive host-parasite detail record. The resulting rows answer the question: which crops are known hosts for each parasitic weed species, and what are the biological characteristics of both organisms? Reading the first row as evidence, we see parasitic weed species `100` (*Striga asiatica*, "Seasonal Review", obligate, chlorophyll-present, seed production 21.70) associated with crop species `1` ("Integrated Protocol A", cereal, baseline-growth-91, not a *Striga* host but a *Rhamphicarpa* host). This apparent contradiction—where the crop is flagged as not a *Striga* host yet is linked to a *Striga* species in the association table—highlights the importance of consulting both the binary host flags and the explicit species-to-species association records when assessing risk. The second row pairs species `100` with crop `2` ("Extended Programme", legume, pilot-growth-92, a confirmed *Striga* host), which is consistent with the host flag and reinforces the view's utility in surfacing verified host relationships.

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

This view links parasitic weed species to the agricultural fields where they are actively infesting crops. It answers the operational question: in which fields is a given parasitic weed species present, and what are the field conditions? The first row shows species `100` (*Striga asiatica*, "Seasonal Review") in field `9085253`, an upland field with free-draining soil, extended soil moisture, six affected households, and primary crop `extended-primary-87`. The second row places species `101` ("Integrated Initiative") in field `1c87986a-8fcd-11eb-924d-9cd76263cbd0`, a lowland waterlogged field affecting eleven households. The third row shows species `102` ("Extended Model D") in field `1996924`, an upland free-draining field with sixteen affected households. The fourth row places species `103` ("Pilot Cluster") in field `2298`, a lowland waterlogged field with twenty-one affected households. The view enables practitioners to correlate parasitic weed presence with field-level conditions, revealing patterns such as the higher household impact counts in lowland waterlogged fields.

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

This view connects parasitic weed species to their specific germination requirements, answering the biological question: what environmental or biochemical triggers must be met for a given parasitic weed species to germinate? The first row pairs species `100` with germination requirement `1`, revealing that *Striga asiatica* ("Seasonal Review") requires the biochemical cue `seasonal-cue-17` at a moisture threshold of 22.45, with host root proximity mandatory. The second row links species `101` to requirement `2`, showing that "Integrated Initiative" relies on soil moisture at threshold 26.90 without needing host root proximity. The third row connects species `102` to requirement `3`, indicating that "Extended Model D" requires a temperature cue (`legacy-cue-19`) at threshold 31.35 with host root proximity required. The fourth row associates species `103` with requirement `4`, where "Pilot Cluster" uses biochemical cue `compact-cue-20` at threshold 35.80 without host root proximity. This view is essential for developing targeted germination suppression strategies, as it quantifies the exact thresholds and cue types that practitioners can monitor or manipulate through irrigation and planting timing.

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

This view inverts the perspective by starting from the crop species and listing the parasitic weeds that threaten it. It answers the grower-facing question: which parasitic weeds should I be monitoring in my crop? The first row shows crop `1` ("Integrated Protocol A", cereal) associated with parasitic weed species `100` (*Striga asiatica*, "Seasonal Review", obligate, seed production 21.70, seed longevity 6.70 years). The second row links crop `2` ("Extended Programme", legume) to species `101` ("Integrated Initiative", facultative, seed production 24.40, seed longevity 11.40 years). The third row connects crop `3` ("Pilot Standard", rice) to species `102` ("Extended Model D", obligate, seed production 27.10, seed longevity 16.10 years). The fourth row associates crop `4` ("Baseline Framework D", cereal) with species `103` ("Pilot Cluster", facultative, seed production 29.80, seed longevity 20.80 years). The view provides a crop-centric risk assessment, allowing extension officers to advise farmers based on the specific crop they are planting and the parasite species most likely to target it.

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

This view joins crop species with the agricultural fields where they are cultivated, answering the logistical question: where is a given crop grown, and what are the field conditions? The first row shows crop `1` ("Integrated Protocol A", cereal) grown in field `9085253`, an upland free-draining field with extended soil moisture and six affected households. The second row places crop `2` ("Extended Programme", legume) in field `1c87986a-8fcd-11eb-924d-9cd76263cbd0`, a lowland waterlogged field affecting eleven households. The third row links crop `3` ("Pilot Standard", rice) to field `1996924`, an upland free-draining field with sixteen affected households. The fourth row associates crop `4` ("Baseline Framework D", cereal) with field `2298`, a lowland waterlogged field impacting twenty-one households. This view supports field-level planning by combining crop identity with environmental conditions and infestation severity, enabling practitioners to prioritize fields for intervention based on both crop value and parasite pressure.

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

This view presents the agricultural field as the starting point, listing the crop species grown in each field. It answers the field manager's question: what crop is planted in this field, and what are its characteristics? The first row shows field `9085253` (upland, free-draining, extended soil moisture, six affected households) growing crop `1` ("Integrated Protocol A", cereal, baseline-growth-91, not a *Striga* host but a *Rhamphicarpa* host). The second row links field `1c87986a-8fcd-11eb-924d-9cd76263cbd0` (lowland, waterlogged, integrated soil moisture, eleven affected households) to crop `2` ("Extended Programme", legume, pilot-growth-92, a *Striga* host). The third row connects field `1996924` (upland, free-draining, seasonal soil moisture, sixteen affected households) with crop `3` ("Pilot Standard", rice, extended-growth-93, a *Rhamphicarpa* host). The fourth row associates field `2298` (lowland, waterlogged, regional soil moisture, twenty-one affected households) with crop `4` ("Baseline Framework D", cereal, integrated-growth-94, a *Striga* host). This perspective is particularly useful for field-level record keeping and for correlating crop type with the intensity of parasitic weed impact.

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

This view pairs agricultural fields with the parasitic weed species present in each, answering the diagnostic question: which parasitic weed is infesting this field, and what are its biological characteristics? The first row shows field `9085253` (upland, free-draining, six affected households) infested by species `100` (*Striga asiatica*, "Seasonal Review", obligate, chlorophyll-present, seed production 21.70, seed longevity 6.70 years). The second row links field `1c87986a-8fcd-11eb-924d-9cd76263cbd0` (lowland, waterlogged, eleven affected households) to species `101` ("Integrated Initiative", facultative, no chlorophyll, seed production 24.40, seed longevity 11.40 years). The third row connects field `1996924` (upland, free-draining, sixteen affected households) with species `102` ("Extended Model D", obligate, chlorophyll-present, seed production 27.10, seed longevity 16.10 years). The fourth row associates field `2298` (lowland, waterlogged, twenty-one affected households) with species `103` ("Pilot Cluster", facultative, no chlorophyll, seed production 29.80, seed longevity 20.80 years). The view enables practitioners to match field conditions with parasite biology, supporting decisions about which control methods are appropriate for the specific weed species present.

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

This view links agricultural fields to their containing geographic regions, answering the spatial planning question: which region does this field belong to, and what are the regional environmental characteristics? The first row places field `9085253` (upland, free-draining, six affected households) in region `1` ("Distributed Assessment", distributed-climate-84, pilot-dominant-50 soil). The second row associates field `1c87986a-8fcd-11eb-924d-9cd76263cbd0` (lowland, waterlogged, eleven affected households) with region `2` ("Adaptive Survey D", baseline-climate-85, extended-dominant-51 soil). The third row connects field `1996924` (upland, free-draining, sixteen affected households) to region `3` ("Primary Corridor", pilot-climate-86, integrated-dominant-52 soil). The fourth row links field `2298` (lowland, waterlogged, twenty-one affected households) with region `4` ("Composite Series", extended-climate-87, seasonal-dominant-53 soil). This view supports regional-level analysis, allowing practitioners to compare infestation patterns across different climate zones and soil types, and to tailor control strategies to regional conditions.

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

This view presents the germination requirement as the starting point, listing the parasitic weed species that each requirement governs. It answers the research question: which parasitic weed species depends on this specific germination trigger? The first row shows requirement `1` (biochemical cue, `seasonal-cue-17`, moisture threshold 22.45, host root proximity required) governing parasitic weed species `100` (*Striga asiatica*, "Seasonal Review", obligate, chlorophyll-present, seed production 21.70, seed longevity 6.70 years). The second row links requirement `2` (soil moisture, `regional-cue-18`, moisture threshold 26.90, no host root proximity) to species `101` ("Integrated Initiative", facultative, no chlorophyll, seed production 24.40, seed longevity 11.40 years). The third row connects requirement `3` (temperature, `legacy-cue-19`, moisture threshold 31.35, host root proximity required) with species `102` ("Extended Model D", obligate, chlorophyll-present, seed production 27.10, seed longevity 16.10 years). The fourth row associates requirement `4` (biochemical cue, `compact-cue-20`, moisture threshold 35.80, no host root proximity) with species `103` ("Pilot Cluster", facultative, no chlorophyll, seed production 29.80, seed longevity 20.80 years). This view is valuable for germination ecology studies and for designing cue-based detection or suppression systems that target specific parasite species.

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

This view expands the geographic region perspective by including detailed field-level information within each region. It answers the management question: what fields exist in this region, and what are their specific conditions and infestation profiles? The first row shows region `1` ("Distributed Assessment", distributed-climate-84, pilot-dominant-50 soil) containing field `9085253` (upland, free-draining, extended soil moisture, six affected households, primary crop `extended-primary-87`, crop `1`, parasitic weed `100`). The second row links region `2` ("Adaptive Survey D", baseline-climate-85, extended-dominant-51 soil) to field `1c87986a-8fcd-11eb-924d-9cd76263cbd0` (lowland, waterlogged, integrated soil moisture, eleven affected households, primary crop `integrated-primary-88`, crop `2`, parasitic weed `101`). The third row connects region `3` ("Primary Corridor", pilot-climate-86, integrated-dominant-52 soil) with field `1996924` (upland, free-draining, seasonal soil moisture, sixteen affected households, primary crop `seasonal-primary-89`, crop `3`, parasitic weed `102`). The fourth row associates region `4` ("Composite Series", extended-climate-87, seasonal-dominant-53 soil) with field `2298` (lowland, waterlogged, regional soil moisture, twenty-one affected households, primary crop `regional-primary-90`, crop `4`, parasitic weed `103`). This comprehensive view enables regional-level decision-making by consolidating climate, soil, field, crop, and parasite data into a single record per field, supporting resource allocation and regional control strategy development.

## Synthesis

The records documented in this chapter form an interconnected system for tracking parasitic weed infestations across agricultural landscapes. Each parasitic weed species carries a distinct biological profile—defined by its parasitic type, seed production rate, seed longevity, and germination requirements—that determines its threat level and the strategies needed to manage it. These species interact with specific crop varieties, and the many-to-many host-parasite relationships captured in the species association table reveal the complexity of cross-crop transmission. Agricultural fields serve as the observational anchor, linking biological entities to spatial locations with documented soil and moisture conditions. Geographic regions provide the broader environmental context, enabling aggregation and comparison across climate zones and soil types. Together, these entities and their relationships create a comprehensive framework for parasitic weed surveillance, allowing practitioners to move from individual field observations to regional-level insights and from biological characterization to actionable management strategies.