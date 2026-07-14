## Domain Modelling and Relational Materialization

The spill incident management domain captures the lifecycle of marine environmental events from initial occurrence through response and resolution. At its core, the model tracks discrete spill incidents, each anchored to a geographic location, involving one or more vessels carrying hazardous materials, affecting ecological resources, and engaging response agencies. The relational schema normalizes this domain into seven base tables and a family of twenty-two materialized views, each view reconstructing a specific domain fact by joining the appropriate normalized tables. The design follows a star-like pattern where `spill_incidents` serves as the central fact table, with foreign keys radiating outward to dimension tables for locations, vessels, materials, ecological resources, and response agencies.

**Table `spill_incidents`**

| id | incident_id | incident_name | spill_number | incident_date_time | incident_status | vessel_name | vessel_type | vessel_length | geographic_location_id | vessel_id | ecological_resource_id | response_agency_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1336174 | Regional Corridor | SPI-2398 | 2022-01-08T00:48:00 | pending | Extended Model | adaptive-vessel-29 | 0.48 | 1 | 1 | 1 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | state_uk_4 | Seasonal Series D | SPI-2405 | 2023-06-19T07:05:00 | active | Pilot Cluster A | distributed-vessel-30 | 0.85 | 2 | 2 | 2 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 2933483 | Integrated Assessment | SPI-2412 | 2024-11-03T14:22:00 | contained | Baseline Review | baseline-vessel-31 | 1.42 | 3 | 3 | 3 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 2986243 | Extended Survey | SPI-2419 | 2025-04-14T21:39:00 | closed | Distributed Initiative | pilot-vessel-32 | 0.585 | 4 | 4 | 4 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `spill_incidents` table is the primary fact table, recording each incident with a surrogate `id` (e.g., `100`, `101`, `102`, `103`) and a business `incident_id` such as `1336174` or `state_uk_4`. The `incident_name` column carries human-readable labels like "Regional Corridor" and "Seasonal Series D", while `spill_number` provides a standardized identifier such as `SPI-2398` and `SPI-2405`. The `incident_date_time` column timestamps events in ISO 8601 format — `2022-01-08T00:48:00` for the first record, `2025-04-14T21:39:00` for the last. The `incident_status` column tracks the lifecycle state with values `pending`, `active`, `contained`, and `closed`. The table embeds direct foreign keys to the four dimension tables: `geographic_location_id` (values `1` through `4`), `vessel_id` (values `1` through `4`), `ecological_resource_id` (values `1` through `4`), and `response_agency_id` (values `100` through `103`). Audit columns `created_at` and `updated_at` record the temporal provenance of each row.

**Table `geographic_locations`**

| id | location_id | latitude | longitude | location_name | water_depth | distance_from_shore | location_type | spill_incident_id | ecological_resource_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 778556 | 13.95 | 21.20 | Legacy Review D | 249.62567 | 5.12 | incident_site | 100 | 1 |
| 2 | 1250220 | 17.90 | 25.40 | Regional Initiative | 1.42 | 0.07499999 | salvage_site | 101 | 2 |
| 3 | 14511 | 21.85 | 29.60 | Seasonal Model | 191.0 | 5.0 | scuttle_site | 102 | 3 |
| 4 | 611510 | 25.80 | 33.80 | Integrated Cluster A | 38.53310265213535 | 0.01999998 | refuge_boundary | 103 | 4 |

The `geographic_locations` table stores spatial and contextual metadata for each incident site. Each row carries a surrogate `id`, a business `location_id` (e.g., `778556`, `1250220`, `14511`, `611510`), and a `location_name` such as "Legacy Review D" and "Regional Initiative". The `latitude` and `longitude` columns provide precise coordinates — `13.95` and `21.20` for the first location, `25.80` and `33.80` for the fourth. The `water_depth` column records depth in meters (ranging from `1.42` to `249.62567`), while `distance_from_shore` captures proximity to land in nautical units (from `0.01999998` to `5.12`). The `location_type` column classifies the site as `incident_site`, `salvage_site`, `scuttle_site`, or `refuge_boundary`. Foreign keys `spill_incident_id` and `ecological_resource_id` create bidirectional links back to the fact table and the ecological resources dimension.

**Table `hazardous_materials`**

| id | material_id | material_type | estimated_quantity | unit_of_measure | onboard_quantity | spilled_quantity | removed_quantity | vessel_id | spill_incident_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 2839521 | diesel | 15.95 | gallons | 2.45 | 7.70 | 10.45 | 1 | 100 |
| 1001 | 937739 | hydraulic_oil | 19.90 | barrels | 4.90 | 10.40 | 13.90 | 2 | 101 |
| 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | engine_lube_oil | 23.85 | gallons | 7.35 | 13.10 | 17.35 | 3 | 102 |
| 1003 | 7021001070070 | gasoline | 27.80 | barrels | 9.80 | 15.80 | 20.80 | 4 | 103 |

The `hazardous_materials` table quantifies the substances involved in each spill. Each row is identified by a surrogate `id` (e.g., `1000`, `1001`, `1002`, `1003`) and a business `material_id` such as `2839521` or the UUID-like `27cf9038-9bad-11eb-a8a2-19ed5c03f8d3`. The `material_type` column names the substance: `diesel`, `hydraulic_oil`, `engine_lube_oil`, and `gasoline`. Quantity tracking is multi-dimensional: `estimated_quantity` records the total amount (e.g., `15.95`, `19.90`, `23.85`, `27.80`), `unit_of_measure` specifies the unit (`gallons` or `barrels`), `onboard_quantity` captures what was on the vessel at the time, `spilled_quantity` records the actual release, and `removed_quantity` tracks cleanup progress. The material rows are linked to their source vessel via `vessel_id` and to the incident via `spill_incident_id`.

**Table `vessels`**

| id | vessel_id | vessel_name | vessel_type | vessel_length | vessel_status | owner_name | owner_location | total_constructive_loss | spill_incident_id | geographic_location_id | moved_to_geographic_location_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 16620628 | Extended Model | adaptive-vessel-29 | 0.48 | sunk | Craig Childs | Bobby Flores | false | 100 | 1 | 1 |
| 2 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | distributed-vessel-30 | 0.85 | salvaged | Kimberly Smith | Johnny Morris | true | 101 | 2 | 2 |
| 3 | 12570447 | Baseline Review | baseline-vessel-31 | 1.42 | scuttled | Michelle Kelley | Mercy Mission | false | 102 | 3 | 3 |
| 4 | 168538 | Distributed Initiative | pilot-vessel-32 | 0.585 | dismantled | Jorge Sullivan | Jorge Sullivan | true | 103 | 4 | 4 |

The `vessels` table profiles the ships involved in each incident. The surrogate `id` (values `1` through `4`) maps to business `vessel_id` values such as `16620628` and the UUID `c9e1850d388444ca97c062544b127908`. The `vessel_name` column carries names like "Extended Model" and "Pilot Cluster A", while `vessel_type` classifies them as `adaptive-vessel-29`, `distributed-vessel-30`, `baseline-vessel-31`, and `pilot-vessel-32`. The `vessel_length` column stores a numeric measure (e.g., `0.48`, `0.85`, `1.42`, `0.585`). The `vessel_status` column records the post-incident disposition: `sunk`, `salvaged`, `scuttled`, and `dismantled`. Owner information is captured in `owner_name` (e.g., "Craig Childs", "Kimberly Smith") and `owner_location` (e.g., "Bobby Flores", "Johnny Morris"). A boolean `total_constructive_loss` flag indicates whether the vessel was a total loss (`false` for the first and third, `true` for the second and fourth). Foreign keys `spill_incident_id` and `geographic_location_id` anchor the vessel to its incident and location, while `moved_to_geographic_location_id` tracks relocation.

**Table `response_agencies`**

| response_agency_id | agency_id | agency_name | agency_type | contact_person | contact_phone | contact_email | notification_method | spill_incident_id | notified_of_spill_incident_id | vessel_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | state | Alyssa Chung | Joe Tsai | Christopher Wilson | email | 100 | 100 | 1 |
| 101 | Nikola Corporation | Whirlpool Corporation | federal | Brianna Mejia | Stephanie Collins | Charles Larsen | fax | 101 | 101 | 2 |
| 102 | Oberthur Technologies | Education Writers Association | local | Eric Schultz | Tasha Rodriguez | Mary Alvarez | phone | 102 | 102 | 3 |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | non_profit | Peter Montgomery | Walter Pratt | April Snyder | email | 103 | 103 | 4 |

The `response_agencies` table documents the organizations mobilized for each incident. The `response_agency_id` (values `100` through `103`) serves as the surrogate key, while `agency_id` carries business identifiers such as "U.S. Steel" and "Nikola Corporation". The `agency_name` column provides the full organizational name (e.g., "FSG Social Impact Advisors", "Whirlpool Corporation"), and `agency_type` classifies the entity as `state`, `federal`, `local`, or `non_profit`. Contact information is stored across three columns: `contact_person` (e.g., "Alyssa Chung", "Brianna Mejia"), `contact_phone` (e.g., "Joe Tsai", "Stephanie Collins"), and `contact_email` (e.g., "Christopher Wilson", "Charles Larsen"). The `notification_method` column records how the agency was alerted (`email`, `fax`, `phone`). Foreign keys `spill_incident_id` and `vessel_id` link the agency to the incident and the vessel it responded to, while `notified_of_spill_incident_id` provides an additional reference to the incident notification.

**Table `ecological_resources`**

| id | resource_id | resource_name | resource_type | affected_status | species_list | commercial_use | geographic_location_id | spill_incident_id | hazardous_material_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1167 | Adaptive Corridor | wildlife_refuge | unaffected | baseline-species-25 | true | 1 | 100 | 1000 |
| 2 | 2106708 | Primary Series | fishery | potentially_affected | pilot-species-26 | false | 2 | 101 | 1001 |
| 3 | 4180945 | Composite Assessment D | habitat | oiled | extended-species-27 | true | 3 | 102 | 1002 |
| 4 | 10238270 | Compact Survey | species | monitored | integrated-species-28 | false | 4 | 103 | 1003 |

The `ecological_resources` table tracks environmental assets affected by each spill. Each row has a surrogate `id` (values `1` through `4`) and a business `resource_id` (e.g., `1167`, `2106708`, `4180945`, `10238270`). The `resource_name` column names the resource: "Adaptive Corridor", "Primary Series", "Composite Assessment D", and "Compact Survey". The `resource_type` column classifies the asset as `wildlife_refuge`, `fishery`, `habitat`, or `species`. The `affected_status` column records the impact level: `unaffected`, `potentially_affected`, `oiled`, and `monitored`. The `species_list` column identifies affected species (e.g., "baseline-species-25", "pilot-species-26", "extended-species-27", "integrated-species-28"), and `commercial_use` is a boolean indicating whether the resource supports commercial activity. Foreign keys `geographic_location_id`, `spill_incident_id`, and `hazardous_material_id` create a triangular linkage connecting the resource to its location, the incident, and the material causing the impact.

**Table `incidents_materials`**

| spill_incident_id | hazardous_material_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The `incidents_materials` junction table resolves the many-to-many relationship between spill incidents and hazardous materials. While the `spill_incidents` table embeds a direct `spill_incident_id` foreign key into `hazardous_materials`, the `incidents_materials` table provides an explicit association layer that can carry additional relationship attributes beyond simple linkage. This pattern supports scenarios where a single incident involves multiple materials or where material-incident associations require their own metadata.

**Table `vessels_materials`**

| vessel_id | hazardous_material_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

Similarly, the `vessels_materials` junction table mediates the many-to-many relationship between vessels and hazardous materials. The `hazardous_materials` table carries a direct `vessel_id` foreign key, but the junction table provides an explicit association layer that can store relationship-specific attributes such as cargo manifest details, loading dates, or regulatory compliance flags.

The base tables establish a normalized schema where each entity type occupies its own table, and relationships are expressed through foreign keys. The `spill_incidents` table acts as the central hub, with direct foreign keys to `geographic_locations`, `vessels`, `ecological_resources`, and `response_agencies`. The `hazardous_materials` table links to both `vessels` and `spill_incidents`, creating a bridge between the vessel and incident dimensions. The `ecological_resources` table forms a triangle with `geographic_locations`, `spill_incidents`, and `hazardous_materials`, capturing the environmental impact nexus. Junction tables `incidents_materials` and `vessels_materials` provide explicit association layers for many-to-many relationships.

The materialized views reconstruct domain facts by joining these normalized tables. Each view answers a specific analytical question by denormalizing the relevant entities into a single flat result set.

**View `v_spill_incident_geographic_location`**

```sql
CREATE VIEW v_spill_incident_geographic_location AS
SELECT a.id, a.incident_id, a.incident_name, a.spill_number, b.id AS location_id, b.location_id AS location_location_id, b.latitude AS location_latitude
FROM spill_incidents a JOIN geographic_locations b ON a.geographic_location_id = b.id;
```

| id | incident_id | incident_name | spill_number | location_id | location_location_id | location_latitude |
|---|---|---|---|---|---|---|
| 100 | 1336174 | Regional Corridor | SPI-2398 | 1 | 778556 | 13.95 |
| 101 | state_uk_4 | Seasonal Series D | SPI-2405 | 2 | 1250220 | 17.90 |
| 102 | 2933483 | Integrated Assessment | SPI-2412 | 3 | 14511 | 21.85 |
| 103 | 2986243 | Extended Survey | SPI-2419 | 4 | 611510 | 25.80 |

This view joins `spill_incidents` with `geographic_locations` to answer: "Where did each spill occur, and what are the site conditions?" Reading the first row, the incident "Regional Corridor" (`SPI-2398`) occurred at "Legacy Review D" with coordinates `13.95` latitude and `21.20` longitude, at a water depth of `249.62567` meters and `5.12` units from shore. The second row shows "Seasonal Series D" (`SPI-2405`) at "Regional Initiative" with coordinates `17.90` and `25.40`, at a shallow depth of `1.42` meters and only `0.07499999` units from shore.

**View `v_spill_incident_vessel`**

```sql
CREATE VIEW v_spill_incident_vessel AS
SELECT a.id, a.incident_id, a.incident_name, a.spill_number, b.id AS vessel_id, b.vessel_id AS vessel_vessel_id, b.vessel_name AS vessel_vessel_name
FROM spill_incidents a JOIN vessels b ON a.vessel_id = b.id;
```

| id | incident_id | incident_name | spill_number | vessel_id | vessel_vessel_id | vessel_vessel_name |
|---|---|---|---|---|---|---|
| 100 | 1336174 | Regional Corridor | SPI-2398 | 1 | 16620628 | Extended Model |
| 101 | state_uk_4 | Seasonal Series D | SPI-2405 | 2 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A |
| 102 | 2933483 | Integrated Assessment | SPI-2412 | 3 | 12570447 | Baseline Review |
| 103 | 2986243 | Extended Survey | SPI-2419 | 4 | 168538 | Distributed Initiative |

This view joins `spill_incidents` with `vessels` to answer: "Which vessel was involved in each incident, and what was its status?" The first row pairs "Regional Corridor" with vessel "Extended Model" (`adaptive-vessel-29`), length `0.48`, status `sunk`, owned by "Craig Childs" at "Bobby Flores", with `total_constructive_loss` set to `false`. The second row pairs "Seasonal Series D" with "Pilot Cluster A" (`distributed-vessel-30`), length `0.85`, status `salvaged`, owned by "Kimberly Smith" at "Johnny Morris", with `total_constructive_loss` set to `true`.

**View `v_spill_incident_hazardous_material_detail`**

```sql
CREATE VIEW v_spill_incident_hazardous_material_detail AS
SELECT a.id, a.incident_id, a.incident_name, b.id AS material_id, b.material_id AS material_material_id, b.material_type AS material_material_type
FROM spill_incidents a
  JOIN incidents_materials j ON j.spill_incident_id = a.id
  JOIN hazardous_materials b ON b.id = j.hazardous_material_id;
```

| id | incident_id | incident_name | material_id | material_material_id | material_material_type |
|---|---|---|---|---|---|
| 100 | 1336174 | Regional Corridor | 1000 | 2839521 | diesel |
| 100 | 1336174 | Regional Corridor | 1001 | 937739 | hydraulic_oil |
| 101 | state_uk_4 | Seasonal Series D | 1001 | 937739 | hydraulic_oil |
| 101 | state_uk_4 | Seasonal Series D | 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | engine_lube_oil |
| 102 | 2933483 | Integrated Assessment | 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | engine_lube_oil |
| 102 | 2933483 | Integrated Assessment | 1003 | 7021001070070 | gasoline |
| 103 | 2986243 | Extended Survey | 1003 | 7021001070070 | gasoline |
| 103 | 2986243 | Extended Survey | 1000 | 2839521 | diesel |

This view joins `spill_incidents` with `hazardous_materials` to answer: "What hazardous materials were released in each incident, and in what quantities?" The first row shows "Regional Corridor" involved `diesel` (material `2839521`), with an estimated quantity of `15.95` gallons, `2.45` gallons onboard, `7.70` gallons spilled, and `10.45` gallons removed. The fourth row shows "Extended Survey" involved `gasoline` (material `7021001070070`), with `27.80` barrels estimated, `9.80` barrels onboard, `15.80` barrels spilled, and `20.80` barrels removed.

**View `v_spill_incident_ecological_resource`**

```sql
CREATE VIEW v_spill_incident_ecological_resource AS
SELECT a.id, a.incident_id, a.incident_name, a.spill_number, b.id AS resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM spill_incidents a JOIN ecological_resources b ON a.ecological_resource_id = b.id;
```

| id | incident_id | incident_name | spill_number | resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|---|
| 100 | 1336174 | Regional Corridor | SPI-2398 | 1 | 1167 | Adaptive Corridor |
| 101 | state_uk_4 | Seasonal Series D | SPI-2405 | 2 | 2106708 | Primary Series |
| 102 | 2933483 | Integrated Assessment | SPI-2412 | 3 | 4180945 | Composite Assessment D |
| 103 | 2986243 | Extended Survey | SPI-2419 | 4 | 10238270 | Compact Survey |

This view joins `spill_incidents` with `ecological_resources` to answer: "Which ecological resources were affected by each spill, and what was their status?" The first row shows "Regional Corridor" affected "Adaptive Corridor" (resource `1167`), a `wildlife_refuge` that was `unaffected`, with `commercial_use` enabled and species "baseline-species-25". The third row shows "Integrated Assessment" affected "Composite Assessment D" (resource `4180945`), a `habitat` that was `oiled`, with `commercial_use` enabled and species "extended-species-27".

**View `v_spill_incident_response_agency`**

```sql
CREATE VIEW v_spill_incident_response_agency AS
SELECT a.id, a.incident_id, a.incident_name, a.spill_number, b.response_agency_id AS agency_response_agency_id, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name
FROM spill_incidents a JOIN response_agencies b ON a.response_agency_id = b.response_agency_id;
```

| id | incident_id | incident_name | spill_number | agency_response_agency_id | agency_agency_id | agency_agency_name |
|---|---|---|---|---|---|---|
| 100 | 1336174 | Regional Corridor | SPI-2398 | 100 | U.S. Steel | FSG Social Impact Advisors |
| 101 | state_uk_4 | Seasonal Series D | SPI-2405 | 101 | Nikola Corporation | Whirlpool Corporation |
| 102 | 2933483 | Integrated Assessment | SPI-2412 | 102 | Oberthur Technologies | Education Writers Association |
| 103 | 2986243 | Extended Survey | SPI-2419 | 103 | General Telephone & Electronics | Switch Card Services Ltd. |

This view joins `spill_incidents` with `response_agencies` to answer: "Which agencies responded to each incident, and how were they contacted?" The first row shows "Regional Corridor" was handled by "FSG Social Impact Advisors" (agency `U.S. Steel`), an `state`-level agency, with contact person "Alyssa Chung", phone "Joe Tsai", email "Christopher Wilson", notified via `email`. The third row shows "Integrated Assessment" was handled by "Education Writers Association" (agency `Oberthur Technologies`), a `local`-level agency, with contact person "Eric Schultz", phone "Tasha Rodriguez", email "Mary Alvarez", notified via `phone`.

**View `v_geographic_location_spill_incident`**

```sql
CREATE VIEW v_geographic_location_spill_incident AS
SELECT a.id, a.location_id, a.latitude, a.longitude, b.id AS incident_id, b.incident_id AS incident_incident_id, b.incident_name AS incident_incident_name
FROM geographic_locations a JOIN spill_incidents b ON a.spill_incident_id = b.id;
```

| id | location_id | latitude | longitude | incident_id | incident_incident_id | incident_incident_name |
|---|---|---|---|---|---|---|
| 1 | 778556 | 13.95 | 21.20 | 100 | 1336174 | Regional Corridor |
| 2 | 1250220 | 17.90 | 25.40 | 101 | state_uk_4 | Seasonal Series D |
| 3 | 14511 | 21.85 | 29.60 | 102 | 2933483 | Integrated Assessment |
| 4 | 611510 | 25.80 | 33.80 | 103 | 2986243 | Extended Survey |

This view reverses the perspective, joining `geographic_locations` with `spill_incidents` to answer: "What incidents occurred at each geographic location?" The first row shows location "Legacy Review D" (coordinates `13.95`, `21.20`) was the site of incident "Regional Corridor" (`SPI-2398`), which was in `pending` status. The second row shows "Regional Initiative" (coordinates `17.90`, `25.40`) hosted "Seasonal Series D" (`SPI-2405`), which was `active`.

**View `v_geographic_location_ecological_resource`**

```sql
CREATE VIEW v_geographic_location_ecological_resource AS
SELECT a.id, a.location_id, a.latitude, a.longitude, b.id AS resource_id, b.resource_id AS resource_resource_id, b.resource_name AS resource_resource_name
FROM geographic_locations a JOIN ecological_resources b ON a.ecological_resource_id = b.id;
```

| id | location_id | latitude | longitude | resource_id | resource_resource_id | resource_resource_name |
|---|---|---|---|---|---|---|
| 1 | 778556 | 13.95 | 21.20 | 1 | 1167 | Adaptive Corridor |
| 2 | 1250220 | 17.90 | 25.40 | 2 | 2106708 | Primary Series |
| 3 | 14511 | 21.85 | 29.60 | 3 | 4180945 | Composite Assessment D |
| 4 | 611510 | 25.80 | 33.80 | 4 | 10238270 | Compact Survey |

This view joins `geographic_locations` with `ecological_resources` to answer: "Which ecological resources are associated with each geographic location?" The first row links "Legacy Review D" to "Adaptive Corridor" (resource `1167`), a `wildlife_refuge` that was `unaffected`. The fourth row links "Integrated Cluster A" to "Compact Survey" (resource `10238270`), a `species` that was `monitored`.

**View `v_hazardous_material_vessel`**

```sql
CREATE VIEW v_hazardous_material_vessel AS
SELECT a.id, a.material_id, a.material_type, a.estimated_quantity, b.id AS vessel_id, b.vessel_id AS vessel_vessel_id, b.vessel_name AS vessel_vessel_name
FROM hazardous_materials a JOIN vessels b ON a.vessel_id = b.id;
```

| id | material_id | material_type | estimated_quantity | vessel_id | vessel_vessel_id | vessel_vessel_name |
|---|---|---|---|---|---|---|
| 1000 | 2839521 | diesel | 15.95 | 1 | 16620628 | Extended Model |
| 1001 | 937739 | hydraulic_oil | 19.90 | 2 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A |
| 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | engine_lube_oil | 23.85 | 3 | 12570447 | Baseline Review |
| 1003 | 7021001070070 | gasoline | 27.80 | 4 | 168538 | Distributed Initiative |

This view joins `hazardous_materials` with `vessels` to answer: "Which vessels carried which hazardous materials?" The first row shows vessel "Extended Model" (`adaptive-vessel-29`) carried `diesel` (material `2839521`), with `15.95` gallons estimated and `7.70` gallons spilled. The third row shows vessel "Baseline Review" (`baseline-vessel-31`) carried `engine_lube_oil` (material `27cf9038-9bad-11eb-a8a2-19ed5c03f8d3`), with `23.85` gallons estimated and `13.10` gallons spilled.

**View `v_hazardous_material_spill_incident`**

```sql
CREATE VIEW v_hazardous_material_spill_incident AS
SELECT a.id, a.material_id, a.material_type, a.estimated_quantity, b.id AS incident_id, b.incident_id AS incident_incident_id, b.incident_name AS incident_incident_name
FROM hazardous_materials a JOIN spill_incidents b ON a.spill_incident_id = b.id;
```

| id | material_id | material_type | estimated_quantity | incident_id | incident_incident_id | incident_incident_name |
|---|---|---|---|---|---|---|
| 1000 | 2839521 | diesel | 15.95 | 100 | 1336174 | Regional Corridor |
| 1001 | 937739 | hydraulic_oil | 19.90 | 101 | state_uk_4 | Seasonal Series D |
| 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | engine_lube_oil | 23.85 | 102 | 2933483 | Integrated Assessment |
| 1003 | 7021001070070 | gasoline | 27.80 | 103 | 2986243 | Extended Survey |

This view joins `hazardous_materials` with `spill_incidents` to answer: "Which hazardous materials were involved in each spill incident?" The second row shows incident "Seasonal Series D" (`SPI-2405`) involved `hydraulic_oil` (material `937739`), with `19.90` barrels estimated, `4.90` barrels onboard, `10.40` barrels spilled, and `13.90` barrels removed.

**View `v_vessel_spill_incident`**

```sql
CREATE VIEW v_vessel_spill_incident AS
SELECT a.id, a.vessel_id, a.vessel_name, a.vessel_type, b.id AS incident_id, b.incident_id AS incident_incident_id, b.incident_name AS incident_incident_name
FROM vessels a JOIN spill_incidents b ON a.spill_incident_id = b.id;
```

| id | vessel_id | vessel_name | vessel_type | incident_id | incident_incident_id | incident_incident_name |
|---|---|---|---|---|---|---|
| 1 | 16620628 | Extended Model | adaptive-vessel-29 | 100 | 1336174 | Regional Corridor |
| 2 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | distributed-vessel-30 | 101 | state_uk_4 | Seasonal Series D |
| 3 | 12570447 | Baseline Review | baseline-vessel-31 | 102 | 2933483 | Integrated Assessment |
| 4 | 168538 | Distributed Initiative | pilot-vessel-32 | 103 | 2986243 | Extended Survey |

This view joins `vessels` with `spill_incidents` to answer: "Which vessels were involved in each spill incident?" The first row shows vessel "Extended Model" (`adaptive-vessel-29`), status `sunk`, length `0.48`, was involved in incident "Regional Corridor" (`SPI-2398`), which was in `pending` status. The fourth row shows vessel "Distributed Initiative" (`pilot-vessel-32`), status `dismantled`, length `0.585`, was involved in incident "Extended Survey" (`SPI-2419`), which was `closed`.

**View `v_vessel_hazardous_material_detail`**

```sql
CREATE VIEW v_vessel_hazardous_material_detail AS
SELECT a.id, a.vessel_id, a.vessel_name, b.id AS material_id, b.material_id AS material_material_id, b.material_type AS material_material_type
FROM vessels a
  JOIN vessels_materials j ON j.vessel_id = a.id
  JOIN hazardous_materials b ON b.id = j.hazardous_material_id;
```

| id | vessel_id | vessel_name | material_id | material_material_id | material_material_type |
|---|---|---|---|---|---|
| 1 | 16620628 | Extended Model | 1000 | 2839521 | diesel |
| 1 | 16620628 | Extended Model | 1001 | 937739 | hydraulic_oil |
| 2 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | 1001 | 937739 | hydraulic_oil |
| 2 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | engine_lube_oil |
| 3 | 12570447 | Baseline Review | 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | engine_lube_oil |
| 3 | 12570447 | Baseline Review | 1003 | 7021001070070 | gasoline |
| 4 | 168538 | Distributed Initiative | 1003 | 7021001070070 | gasoline |
| 4 | 168538 | Distributed Initiative | 1000 | 2839521 | diesel |

This view joins `vessels` with `hazardous_materials` to answer: "What hazardous materials were aboard each vessel at the time of the incident?" The second row shows vessel "Pilot Cluster A" (`distributed-vessel-30`), status `salvaged`, carried `hydraulic_oil` (material `937739`), with `19.90` barrels estimated and `10.40` barrels spilled.

**View `v_vessel_geographic_location`**

```sql
CREATE VIEW v_vessel_geographic_location AS
SELECT a.id, a.vessel_id, a.vessel_name, a.vessel_type, b.id AS location_id, b.location_id AS location_location_id, b.latitude AS location_latitude
FROM vessels a JOIN geographic_locations b ON a.geographic_location_id = b.id;
```

| id | vessel_id | vessel_name | vessel_type | location_id | location_location_id | location_latitude |
|---|---|---|---|---|---|---|
| 1 | 16620628 | Extended Model | adaptive-vessel-29 | 1 | 778556 | 13.95 |
| 2 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A | distributed-vessel-30 | 2 | 1250220 | 17.90 |
| 3 | 12570447 | Baseline Review | baseline-vessel-31 | 3 | 14511 | 21.85 |
| 4 | 168538 | Distributed Initiative | pilot-vessel-32 | 4 | 611510 | 25.80 |

This view joins `vessels` with `geographic_locations` to answer: "At which geographic locations were each vessel involved in incidents?" The first row shows vessel "Extended Model" (`adaptive-vessel-29`) was at location "Legacy Review D" (coordinates `13.95`, `21.20`), a `incident_site` with water depth `249.62567`. The third row shows vessel "Baseline Review" (`baseline-vessel-31`) was at location "Seasonal Model" (coordinates `21.85`, `29.60`), a `scuttle_site` with water depth `191.0`.

**View `v_response_agency_spill_incident`**

```sql
CREATE VIEW v_response_agency_spill_incident AS
SELECT a.response_agency_id, a.agency_id, a.agency_name, a.agency_type, b.id AS incident_id, b.incident_id AS incident_incident_id, b.incident_name AS incident_incident_name
FROM response_agencies a JOIN spill_incidents b ON a.spill_incident_id = b.id;
```

| response_agency_id | agency_id | agency_name | agency_type | incident_id | incident_incident_id | incident_incident_name |
|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | state | 100 | 1336174 | Regional Corridor |
| 101 | Nikola Corporation | Whirlpool Corporation | federal | 101 | state_uk_4 | Seasonal Series D |
| 102 | Oberthur Technologies | Education Writers Association | local | 102 | 2933483 | Integrated Assessment |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | non_profit | 103 | 2986243 | Extended Survey |

This view joins `response_agencies` with `spill_incidents` to answer: "Which response agencies were assigned to each spill incident?" The first row shows agency "FSG Social Impact Advisors" (type `state`) was assigned to incident "Regional Corridor" (`SPI-2398`), notified via `email`. The fourth row shows agency "Switch Card Services Ltd." (type `non_profit`) was assigned to incident "Extended Survey" (`SPI-2419`), notified via `email`.

**View `v_response_agency_vessel`**

```sql
CREATE VIEW v_response_agency_vessel AS
SELECT a.response_agency_id, a.agency_id, a.agency_name, a.agency_type, b.id AS vessel_id, b.vessel_id AS vessel_vessel_id, b.vessel_name AS vessel_vessel_name
FROM response_agencies a JOIN vessels b ON a.vessel_id = b.id;
```

| response_agency_id | agency_id | agency_name | agency_type | vessel_id | vessel_vessel_id | vessel_vessel_name |
|---|---|---|---|---|---|---|
| 100 | U.S. Steel | FSG Social Impact Advisors | state | 1 | 16620628 | Extended Model |
| 101 | Nikola Corporation | Whirlpool Corporation | federal | 2 | c9e1850d388444ca97c062544b127908 | Pilot Cluster A |
| 102 | Oberthur Technologies | Education Writers Association | local | 3 | 12570447 | Baseline Review |
| 103 | General Telephone & Electronics | Switch Card Services Ltd. | non_profit | 4 | 168538 | Distributed Initiative |

This view joins `response_agencies` with `vessels` to answer: "Which response agencies were assigned to which vessels?" The second row shows agency "Whirlpool Corporation" (type `federal`) was assigned to vessel "Pilot Cluster A" (`distributed-vessel-30`), status `salvaged`. The fourth row shows agency "Switch Card Services Ltd." (type `non_profit`) was assigned to vessel "Distributed Initiative" (`pilot-vessel-32`), status `dismantled`.

**View `v_ecological_resource_geographic_location`**

```sql
CREATE VIEW v_ecological_resource_geographic_location AS
SELECT a.id, a.resource_id, a.resource_name, a.resource_type, b.id AS location_id, b.location_id AS location_location_id, b.latitude AS location_latitude
FROM ecological_resources a JOIN geographic_locations b ON a.geographic_location_id = b.id;
```

| id | resource_id | resource_name | resource_type | location_id | location_location_id | location_latitude |
|---|---|---|---|---|---|---|
| 1 | 1167 | Adaptive Corridor | wildlife_refuge | 1 | 778556 | 13.95 |
| 2 | 2106708 | Primary Series | fishery | 2 | 1250220 | 17.90 |
| 3 | 4180945 | Composite Assessment D | habitat | 3 | 14511 | 21.85 |
| 4 | 10238270 | Compact Survey | species | 4 | 611510 | 25.80 |

This view joins `ecological_resources` with `geographic_locations` to answer: "Which ecological resources are located at each geographic site?" The first row links resource "Adaptive Corridor" (resource `1167`), a `wildlife_refuge` that was `unaffected`, to location "Legacy Review D" (coordinates `13.95`, `21.20`). The third row links resource "Composite Assessment D" (resource `4180945`), a `habitat` that was `oiled`, to location "Seasonal Model" (coordinates `21.85`, `29.60`).

**View `v_ecological_resource_spill_incident`**

```sql
CREATE VIEW v_ecological_resource_spill_incident AS
SELECT a.id, a.resource_id, a.resource_name, a.resource_type, b.id AS incident_id, b.incident_id AS incident_incident_id, b.incident_name AS incident_incident_name
FROM ecological_resources a JOIN spill_incidents b ON a.spill_incident_id = b.id;
```

| id | resource_id | resource_name | resource_type | incident_id | incident_incident_id | incident_incident_name |
|---|---|---|---|---|---|---|
| 1 | 1167 | Adaptive Corridor | wildlife_refuge | 100 | 1336174 | Regional Corridor |
| 2 | 2106708 | Primary Series | fishery | 101 | state_uk_4 | Seasonal Series D |
| 3 | 4180945 | Composite Assessment D | habitat | 102 | 2933483 | Integrated Assessment |
| 4 | 10238270 | Compact Survey | species | 103 | 2986243 | Extended Survey |

This view joins `ecological_resources` with `spill_incidents` to answer: "Which ecological resources were affected by each spill incident?" The second row shows resource "Primary Series" (resource `2106708`), a `fishery` that was `potentially_affected`, was impacted by incident "Seasonal Series D" (`SPI-2405`). The fourth row shows resource "Compact Survey" (resource `10238270`), a `species` that was `monitored`, was impacted by incident "Extended Survey" (`SPI-2419`).

**View `v_ecological_resource_hazardous_material`**

```sql
CREATE VIEW v_ecological_resource_hazardous_material AS
SELECT a.id, a.resource_id, a.resource_name, a.resource_type, b.id AS material_id, b.material_id AS material_material_id, b.material_type AS material_material_type
FROM ecological_resources a JOIN hazardous_materials b ON a.hazardous_material_id = b.id;
```

| id | resource_id | resource_name | resource_type | material_id | material_material_id | material_material_type |
|---|---|---|---|---|---|---|
| 1 | 1167 | Adaptive Corridor | wildlife_refuge | 1000 | 2839521 | diesel |
| 2 | 2106708 | Primary Series | fishery | 1001 | 937739 | hydraulic_oil |
| 3 | 4180945 | Composite Assessment D | habitat | 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | engine_lube_oil |
| 4 | 10238270 | Compact Survey | species | 1003 | 7021001070070 | gasoline |

This view joins `ecological_resources` with `hazardous_materials` to answer: "Which hazardous materials caused impact to which ecological resources?" The first row shows resource "Adaptive Corridor" (resource `1167`) was impacted by `diesel` (material `2839521`), with `15.95` gallons estimated and `7.70` gallons spilled. The third row shows resource "Composite Assessment D" (resource `4180945`) was impacted by `engine_lube_oil` (material `27cf9038-9bad-11eb-a8a2-19ed5c03f8d3`), with `23.85` gallons estimated and `13.10` gallons spilled.

The schema design achieves a balance between normalization and query convenience. The base tables enforce entity integrity through surrogate primary keys and business identifiers, while foreign keys encode the domain's relationship structure. The `spill_incidents` table serves as the central fact table, with direct foreign keys to the four primary dimension tables, enabling efficient star-join queries. The `hazardous_materials` table bridges vessels and incidents, capturing the material flow from vessel cargo to environmental release. The `ecological_resources` table completes the impact triangle by linking resources to locations, incidents, and materials. Junction tables `incidents_materials` and `vessels_materials` provide explicit association layers for many-to-many relationships, supporting extensibility.

The twenty-two materialized views denormalize the schema along every pair of related entities, answering the most common analytical questions without requiring ad-hoc joins. Each view reconstructs a domain fact — where an incident occurred, which vessel was involved, what materials were released, which resources were affected, and which agencies responded — by joining the relevant normalized tables. The views are organized around four perspectives: the incident-centric views (`v_spill_incident_*`) that start from the fact table and radiate outward; the dimension-centric views (`v_geographic_location_*`, `v_hazardous_material_*`, `v_vessel_*`, `v_response_agency_*`, `v_ecological_resource_*`) that start from a dimension and look back at related incidents; and the cross-dimensional views that connect two dimensions directly. This comprehensive view coverage ensures that every common analytical query can be answered with a single table scan, while the underlying normalized schema maintains data integrity and minimizes redundancy.