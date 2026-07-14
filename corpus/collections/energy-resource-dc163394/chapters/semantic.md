## Ontology-Grounded Relational Modelling of the Geothermal Energy Domain

The geothermal energy domain under study captures the lifecycle of energy resources as they are extracted from geological formations, transported via physical mechanisms, and converted into usable outputs. The domain model is grounded in an ontology that distinguishes five principal entity types: `energy_resources`, `energy_extractions`, `heat_transport_mechanisms`, `geological_formations`, and `energy_outputs`. Each entity type materialises as a relational table whose columns correspond to the ontology's attributes, while the foreign-key columns encode the cardinality-bounded relationships between entities. The resulting schema is normalised to third normal form, and a suite of eleven views reconstructs domain facts by joining the normalised tables along these foreign keys. This chapter walks through the entity types, their attributes, the relationship topology, and the view-level reconstructions that answer concrete analytical questions.

**Table `energy_resources`**

| id | resource_identifier | resource_name | renewability_status | exploitation_rate | expected_reserves_years | share_in_energy_mix | classification_standard | energy_extraction_id | formation_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | RES-2673 | Adaptive Corridor | renewable | 8.70 | 16 | 3.20 | integrated-classifi-88 | 1 | 4985147 |
| 2 | RES-2676 | Primary Series | depleting | 12.40 | 20 | 5.40 | seasonal-classifi-89 | 2 | 168542 |
| 3 | RES-2679 | Composite Assessment D | finite | 16.10 | 24 | 7.60 | regional-classifi-90 | 3 | 727068 |
| 4 | RES-2682 | Compact Survey | unlimited | 19.80 | 28 | 9.80 | legacy-classifi-91 | 4 | 13483868 |

The `energy_resources` table is the primary catalogue of energy resource entities. Its surrogate primary key `id` is an auto-incrementing integer, while the business identifier `resource_identifier` carries human-readable codes such as `RES-2673` and `RES-2676`. The `resource_name` column stores descriptive labels like "Adaptive Corridor" and "Primary Series", and `renewability_status` classifies each resource along a four-valued enum: `renewable`, `depleting`, `finite`, and `unlimited`. Quantitative attributes include `exploitation_rate` (a floating-point extraction intensity, e.g. `8.70`), `expected_reserves_years` (projected reserve longevity, e.g. `16`), and `share_in_energy_mix` (the resource's proportional contribution, e.g. `3.20`). The `classification_standard` column holds classification taxonomy codes such as `integrated-classifi-88`. Crucially, two foreign-key columns anchor this table to the rest of the schema: `energy_extraction_id` references `energy_extractions.id`, and `formation_id` references `geological_formations.formation_id`. These two FKs encode the ontology relationships "resource is extracted by" and "resource resides in formation" respectively, each bounded to a single target row per resource.

**Table `energy_extractions`**

| id | extraction_id | extraction_date | extraction_method | extraction_rate | sustainability_status | capacity_installed | capacity_limited | energy_resource_id | heat_transport_mechanism_id | energy_output_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | L478 | 2023-10-22T09:27:00 | regional-extracti-84 | 22.70 | sustainable | 21.45 | 23.45 | 1 | 1 | 1 |
| 2 | achat | 2024-03-06T16:44:00 | legacy-extracti-85 | 27.40 | overexploited | 23.90 | 27.90 | 2 | 2 | 2 |
| 3 | 392482 | 2025-08-17T23:01:00 | compact-extracti-86 | 32.10 | depleted | 26.35 | 32.35 | 3 | 3 | 3 |
| 4 | 505981 | 2022-01-01T06:18:00 | composite-extracti-87 | 36.80 | equilibrium | 28.80 | 36.80 | 4 | 4 | 4 |

The `energy_extractions` table records the operational act of extracting energy from a resource. Its surrogate key is `id`, while the business identifier `extraction_id` carries codes such as `L478`, `achat`, `392482`, and `505981`. The `extraction_date` column stores ISO-8601 timestamps (e.g. `2023-10-22T09:27:00`), and `extraction_method` holds method taxonomy codes like `regional-extracti-84`. Operational rates are captured in `extraction_rate` (e.g. `22.70`), while `sustainability_status` classifies the extraction's environmental impact as `sustainable`, `overexploited`, `depleted`, or `equilibrium`. Capacity metrics appear in `capacity_installed` and `capacity_limited`, both floating-point values (e.g. `21.45` and `23.45`). Three foreign-key columns link extractions to their parent entities: `energy_resource_id` references `energy_resources.id`, `heat_transport_mechanism_id` references `heat_transport_mechanisms.heat_transport_mechanism_id`, and `energy_output_id` references `energy_outputs.energy_output_id`. Together these FKs express the ontology relationships "extraction draws from resource", "extraction uses transport mechanism", and "extraction produces output".

**Table `heat_transport_mechanisms`**

| heat_transport_mechanism_id | mechanism_id | mechanism_type | transport_speed | recharge_rate | time_scale | energy_resource_id | energy_extraction_id |
|---|---|---|---|---|---|---|---|
| 1 | 2106718 | advection | fast | 9.70 | human time scale | 1 | 1 |
| 2 | 9085252 | thermal conduction | slow | 14.40 | geological time scale | 2 | 2 |
| 3 | 2935 | convection | instantaneous | 19.10 | centuries | 3 | 3 |
| 4 | TERIMA | advection | fast | 23.80 | human time scale | 4 | 4 |

The `heat_transport_mechanisms` table models the physical mechanisms by which thermal energy moves through the subsurface. Its surrogate primary key is `heat_transport_mechanism_id`, while the business identifier `mechanism_id` carries values such as `2106718`, `9085252`, `2935`, and `TERIMA`. The `mechanism_type` column enumerates physical transport modes: `advection`, `thermal conduction`, and `convection`. The `transport_speed` column classifies speed as `fast`, `slow`, or `instantaneous`, and `recharge_rate` stores a floating-point recharge intensity (e.g. `9.70`). The `time_scale` column describes the temporal horizon of the mechanism, with values like `human time scale`, `geological time scale`, and `centuries`. Two foreign-key columns anchor this table: `energy_resource_id` references `energy_resources.id`, and `energy_extraction_id` references `energy_extractions.id`, encoding the relationships "mechanism serves resource" and "mechanism is used in extraction".

**Table `geological_formations`**

| formation_id | formation_name | formation_type | depth | temperature | location_region | energy_resource_id | heat_transport_mechanism_id |
|---|---|---|---|---|---|---|---|
| 4985147 | Seasonal Initiative | natural geothermal system | 0.15 | 1.33 | extended-location-93 | 1 | 1 |
| 168542 | Integrated Model | hot dry rock | 0.07500005 | 1.1714807757148185 | integrated-location-94 | 2 | 2 |
| 727068 | Extended Cluster D | sedimentary basin | 2.5 | 0.51 | seasonal-location-95 | 3 | 3 |
| 13483868 | Pilot Review | aquifer | 0.44305528 | 0.85 | regional-location-96 | 4 | 4 |

The `geological_formations` table captures the subsurface structures that host geothermal resources. Its surrogate primary key is `formation_id`, while `formation_name` stores descriptive labels such as "Seasonal Initiative", "Integrated Model", "Extended Cluster D", and "Pilot Review". The `formation_type` column classifies the geological structure as `natural geothermal system`, `hot dry rock`, `sedimentary basin`, or `aquifer`. Quantitative attributes include `depth` (a floating-point depth in kilometres, e.g. `0.15` and `2.5`) and `temperature` (a floating-point temperature metric, e.g. `1.33` and `0.51`). The `location_region` column stores location taxonomy codes like `extended-location-93`. Two foreign-key columns link formations to their parent entities: `energy_resource_id` references `energy_resources.id`, and `heat_transport_mechanism_id` references `heat_transport_mechanisms.heat_transport_mechanism_id`, expressing "formation hosts resource" and "formation employs transport mechanism".

**Table `energy_outputs`**

| energy_output_id | output_id | output_date | energy_quantity | unit | conversion_type | sustainability_limit | energy_extraction_id | energy_resource_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3717613 | 2023-02-02T01:15:00 | 8.20 | MW | electricity | 11.45 | 1 | 1 |
| 2 | 937738 | 2024-07-13T08:32:00 | 10.40 | GWh | thermal | 15.90 | 2 | 2 |
| 3 | 974934 | 2025-12-24T15:49:00 | 12.60 | Joules | direct use | 20.35 | 3 | 3 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-08T22:06:00 | 14.80 | MW | electricity | 24.80 | 4 | 4 |

The `energy_outputs` table records the final energy products generated by extractions. Its surrogate primary key is `energy_output_id`, while the business identifier `output_id` carries values ranging from numeric codes like `3717613` and `937738` to UUIDs such as `5f8f9bda-8fcd-11eb-924d-9cd76263cbd0`. The `output_date` column stores ISO-8601 timestamps (e.g. `2023-02-02T01:15:00`). The `energy_quantity` column holds the produced energy amount as a floating-point value (e.g. `8.20`), and the `unit` column specifies the energy unit: `MW`, `GWh`, or `Joules`. The `conversion_type` column classifies the conversion pathway as `electricity`, `thermal`, or `direct use`. The `sustainability_limit` column stores a floating-point sustainability threshold (e.g. `11.45`). Two foreign-key columns link outputs to their parent entities: `energy_extraction_id` references `energy_extractions.id`, and `energy_resource_id` references `energy_resources.id`, encoding "output derives from extraction" and "output originates from resource".

The five base tables form a tightly coupled network of foreign-key relationships. The `energy_extractions` table sits at the centre of the topology, with three outbound FKs pointing to `energy_resources`, `heat_transport_mechanisms`, and `energy_outputs`. The `energy_resources` table has two inbound FKs from `energy_extractions` (via `energy_extraction_id`) and `geological_formations` (via `formation_id`). The `heat_transport_mechanisms` table is referenced by both `energy_extractions` and `geological_formations`. The `energy_outputs` table is referenced by `energy_extractions`. This topology means that any domain fact involving two or more entity types can be reconstructed by joining the relevant tables along their shared foreign keys. The eleven views in the schema provide pre-joined projections that answer specific analytical questions without requiring the analyst to write join logic.

**View `v_energy_resource_energy_extraction`**

```sql
CREATE VIEW v_energy_resource_energy_extraction AS
SELECT a.id, a.resource_identifier, a.resource_name, a.renewability_status, b.id AS extraction_id, b.extraction_id AS extraction_extraction_id, b.extraction_date AS extraction_extraction_date
FROM energy_resources a JOIN energy_extractions b ON a.energy_extraction_id = b.id;
```

| id | resource_identifier | resource_name | renewability_status | extraction_id | extraction_extraction_id | extraction_extraction_date |
|---|---|---|---|---|---|---|
| 1 | RES-2673 | Adaptive Corridor | renewable | 1 | L478 | 2023-10-22T09:27:00 |
| 2 | RES-2676 | Primary Series | depleting | 2 | achat | 2024-03-06T16:44:00 |
| 3 | RES-2679 | Composite Assessment D | finite | 3 | 392482 | 2025-08-17T23:01:00 |
| 4 | RES-2682 | Compact Survey | unlimited | 4 | 505981 | 2022-01-01T06:18:00 |

The view `v_energy_resource_energy_extraction` answers the question "which extraction is associated with each energy resource?" It joins `energy_resources` to `energy_extractions` on `energy_resources.energy_extraction_id = energy_extractions.id`. The result projects the resource's surrogate key, business identifier, name, and renewability status alongside the extraction's surrogate key, business identifier, and date. Reading the first row, the resource `RES-2673` ("Adaptive Corridor", `renewable`) is linked to extraction `L478` dated `2023-10-22T09:27:00`. The second row shows `RES-2676` ("Primary Series", `depleting`) paired with extraction `achat` dated `2024-03-06T16:44:00`. This view is useful for auditing which extraction operations are tied to which resource entries.

**View `v_energy_resource_geological_formation`**

```sql
CREATE VIEW v_energy_resource_geological_formation AS
SELECT a.id, a.resource_identifier, a.resource_name, a.renewability_status, b.formation_id AS formation_formation_id, b.formation_name AS formation_formation_name, b.formation_type AS formation_formation_type
FROM energy_resources a JOIN geological_formations b ON a.formation_id = b.formation_id;
```

| id | resource_identifier | resource_name | renewability_status | formation_formation_id | formation_formation_name | formation_formation_type |
|---|---|---|---|---|---|---|
| 1 | RES-2673 | Adaptive Corridor | renewable | 4985147 | Seasonal Initiative | natural geothermal system |
| 2 | RES-2676 | Primary Series | depleting | 168542 | Integrated Model | hot dry rock |
| 3 | RES-2679 | Composite Assessment D | finite | 727068 | Extended Cluster D | sedimentary basin |
| 4 | RES-2682 | Compact Survey | unlimited | 13483868 | Pilot Review | aquifer |

The view `v_energy_resource_geological_formation` answers "which geological formation hosts each energy resource?" It joins `energy_resources` to `geological_formations` on `energy_resources.formation_id = geological_formations.formation_id`. The result projects the resource's surrogate key, business identifier, name, and renewability status alongside the formation's surrogate key, business identifier, name, type, depth, temperature, and location region. The first row shows resource `RES-2673` ("Adaptive Corridor", `renewable`) hosted in formation `4985147` ("Seasonal Initiative", `natural geothermal system`, depth `0.15`, temperature `1.33`, region `extended-location-93`). The third row shows resource `RES-2679` ("Composite Assessment D", `finite`) in formation `727068` ("Extended Cluster D", `sedimentary basin`, depth `2.5`, temperature `0.51`, region `seasonal-location-95`). This view is essential for geological siting analysis.

**View `v_energy_extraction_energy_resource`**

```sql
CREATE VIEW v_energy_extraction_energy_resource AS
SELECT a.id, a.extraction_id, a.extraction_date, a.extraction_method, b.id AS resource_id, b.resource_identifier AS resource_resource_identifier, b.resource_name AS resource_resource_name
FROM energy_extractions a JOIN energy_resources b ON a.energy_resource_id = b.id;
```

| id | extraction_id | extraction_date | extraction_method | resource_id | resource_resource_identifier | resource_resource_name |
|---|---|---|---|---|---|---|
| 1 | L478 | 2023-10-22T09:27:00 | regional-extracti-84 | 1 | RES-2673 | Adaptive Corridor |
| 2 | achat | 2024-03-06T16:44:00 | legacy-extracti-85 | 2 | RES-2676 | Primary Series |
| 3 | 392482 | 2025-08-17T23:01:00 | compact-extracti-86 | 3 | RES-2679 | Composite Assessment D |
| 4 | 505981 | 2022-01-01T06:18:00 | composite-extracti-87 | 4 | RES-2682 | Compact Survey |

The view `v_energy_extraction_energy_resource` answers "which energy resource is drawn from by each extraction?" It joins `energy_extractions` to `energy_resources` on `energy_extractions.energy_resource_id = energy_resources.id`. The result projects the extraction's surrogate key, business identifier, date, method, rate, and sustainability status alongside the resource's surrogate key, business identifier, name, and renewability status. The first row shows extraction `L478` (method `regional-extracti-84`, rate `22.70`, status `sustainable`) drawing from resource `RES-2673` ("Adaptive Corridor", `renewable`). The second row shows extraction `achat` (method `legacy-extracti-85`, rate `27.40`, status `overexploited`) drawing from resource `RES-2676` ("Primary Series", `depleting`). This view supports extraction-level resource attribution.

**View `v_energy_extraction_heat_transport_mechanism`**

```sql
CREATE VIEW v_energy_extraction_heat_transport_mechanism AS
SELECT a.id, a.extraction_id, a.extraction_date, a.extraction_method, b.heat_transport_mechanism_id AS mechanism_heat_transport_mechanism_id, b.mechanism_id AS mechanism_mechanism_id, b.mechanism_type AS mechanism_mechanism_type
FROM energy_extractions a JOIN heat_transport_mechanisms b ON a.heat_transport_mechanism_id = b.heat_transport_mechanism_id;
```

| id | extraction_id | extraction_date | extraction_method | mechanism_heat_transport_mechanism_id | mechanism_mechanism_id | mechanism_mechanism_type |
|---|---|---|---|---|---|---|
| 1 | L478 | 2023-10-22T09:27:00 | regional-extracti-84 | 1 | 2106718 | advection |
| 2 | achat | 2024-03-06T16:44:00 | legacy-extracti-85 | 2 | 9085252 | thermal conduction |
| 3 | 392482 | 2025-08-17T23:01:00 | compact-extracti-86 | 3 | 2935 | convection |
| 4 | 505981 | 2022-01-01T06:18:00 | composite-extracti-87 | 4 | TERIMA | advection |

The view `v_energy_extraction_heat_transport_mechanism` answers "which heat transport mechanism is used by each extraction?" It joins `energy_extractions` to `heat_transport_mechanisms` on `energy_extractions.heat_transport_mechanism_id = heat_transport_mechanisms.heat_transport_mechanism_id`. The result projects the extraction's surrogate key, business identifier, date, method, rate, and sustainability status alongside the mechanism's surrogate key, business identifier, type, transport speed, recharge rate, and time scale. The first row shows extraction `L478` using mechanism `2106718` (type `advection`, speed `fast`, recharge `9.70`, scale `human time scale`). The third row shows extraction `392482` using mechanism `2935` (type `convection`, speed `instantaneous`, recharge `19.10`, scale `centuries`). This view is critical for understanding the physical transport dynamics of each extraction operation.

**View `v_energy_extraction_energy_output`**

```sql
CREATE VIEW v_energy_extraction_energy_output AS
SELECT a.id, a.extraction_id, a.extraction_date, a.extraction_method, b.energy_output_id AS output_energy_output_id, b.output_id AS output_output_id, b.output_date AS output_output_date
FROM energy_extractions a JOIN energy_outputs b ON a.energy_output_id = b.energy_output_id;
```

| id | extraction_id | extraction_date | extraction_method | output_energy_output_id | output_output_id | output_output_date |
|---|---|---|---|---|---|---|
| 1 | L478 | 2023-10-22T09:27:00 | regional-extracti-84 | 1 | 3717613 | 2023-02-02T01:15:00 |
| 2 | achat | 2024-03-06T16:44:00 | legacy-extracti-85 | 2 | 937738 | 2024-07-13T08:32:00 |
| 3 | 392482 | 2025-08-17T23:01:00 | compact-extracti-86 | 3 | 974934 | 2025-12-24T15:49:00 |
| 4 | 505981 | 2022-01-01T06:18:00 | composite-extracti-87 | 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-08T22:06:00 |

The view `v_energy_extraction_energy_output` answers "which energy output is produced by each extraction?" It joins `energy_extractions` to `energy_outputs` on `energy_extractions.energy_output_id = energy_outputs.energy_output_id`. The result projects the extraction's surrogate key, business identifier, date, method, rate, and sustainability status alongside the output's surrogate key, business identifier, date, energy quantity, unit, conversion type, and sustainability limit. The first row shows extraction `L478` producing output `3717613` (quantity `8.20`, unit `MW`, conversion `electricity`, limit `11.45`). The fourth row shows extraction `505981` producing output `5f8f9bda-8fcd-11eb-924d-9cd76263cbd0` (quantity `14.80`, unit `MW`, conversion `electricity`, limit `24.80`). This view enables extraction-to-output traceability for production reporting.

**View `v_heat_transport_mechanism_energy_resource`**

```sql
CREATE VIEW v_heat_transport_mechanism_energy_resource AS
SELECT a.heat_transport_mechanism_id, a.mechanism_id, a.mechanism_type, a.transport_speed, b.id AS resource_id, b.resource_identifier AS resource_resource_identifier, b.resource_name AS resource_resource_name
FROM heat_transport_mechanisms a JOIN energy_resources b ON a.energy_resource_id = b.id;
```

| heat_transport_mechanism_id | mechanism_id | mechanism_type | transport_speed | resource_id | resource_resource_identifier | resource_resource_name |
|---|---|---|---|---|---|---|
| 1 | 2106718 | advection | fast | 1 | RES-2673 | Adaptive Corridor |
| 2 | 9085252 | thermal conduction | slow | 2 | RES-2676 | Primary Series |
| 3 | 2935 | convection | instantaneous | 3 | RES-2679 | Composite Assessment D |
| 4 | TERIMA | advection | fast | 4 | RES-2682 | Compact Survey |

The view `v_heat_transport_mechanism_energy_resource` answers "which energy resource is served by each heat transport mechanism?" It joins `heat_transport_mechanisms` to `energy_resources` on `heat_transport_mechanisms.energy_resource_id = energy_resources.id`. The result projects the mechanism's surrogate key, business identifier, type, transport speed, recharge rate, and time scale alongside the resource's surrogate key, business identifier, name, and renewability status. The first row shows mechanism `2106718` (type `advection`, speed `fast`, recharge `9.70`, scale `human time scale`) serving resource `RES-2673` ("Adaptive Corridor", `renewable`). The fourth row shows mechanism `TERIMA` (type `advection`, speed `fast`, recharge `23.80`, scale `human time scale`) serving resource `RES-2682` ("Compact Survey", `unlimited`). This view supports mechanism-to-resource mapping for infrastructure planning.

**View `v_heat_transport_mechanism_energy_extraction`**

```sql
CREATE VIEW v_heat_transport_mechanism_energy_extraction AS
SELECT a.heat_transport_mechanism_id, a.mechanism_id, a.mechanism_type, a.transport_speed, b.id AS extraction_id, b.extraction_id AS extraction_extraction_id, b.extraction_date AS extraction_extraction_date
FROM heat_transport_mechanisms a JOIN energy_extractions b ON a.energy_extraction_id = b.id;
```

| heat_transport_mechanism_id | mechanism_id | mechanism_type | transport_speed | extraction_id | extraction_extraction_id | extraction_extraction_date |
|---|---|---|---|---|---|---|
| 1 | 2106718 | advection | fast | 1 | L478 | 2023-10-22T09:27:00 |
| 2 | 9085252 | thermal conduction | slow | 2 | achat | 2024-03-06T16:44:00 |
| 3 | 2935 | convection | instantaneous | 3 | 392482 | 2025-08-17T23:01:00 |
| 4 | TERIMA | advection | fast | 4 | 505981 | 2022-01-01T06:18:00 |

The view `v_heat_transport_mechanism_energy_extraction` answers "which extraction uses each heat transport mechanism?" It joins `heat_transport_mechanisms` to `energy_extractions` on `heat_transport_mechanisms.energy_extraction_id = energy_extractions.id`. The result projects the mechanism's surrogate key, business identifier, type, transport speed, recharge rate, and time scale alongside the extraction's surrogate key, business identifier, date, method, rate, and sustainability status. The first row shows mechanism `2106718` (type `advection`, speed `fast`) used by extraction `L478` (method `regional-extracti-84`, rate `22.70`, status `sustainable`). The second row shows mechanism `9085252` (type `thermal conduction`, speed `slow`) used by extraction `achat` (method `legacy-extracti-85`, rate `27.40`, status `overexploited`). This view is useful for assessing the physical transport characteristics of each extraction operation.

**View `v_geological_formation_energy_resource`**

```sql
CREATE VIEW v_geological_formation_energy_resource AS
SELECT a.formation_id, a.formation_name, a.formation_type, a.depth, b.id AS resource_id, b.resource_identifier AS resource_resource_identifier, b.resource_name AS resource_resource_name
FROM geological_formations a JOIN energy_resources b ON a.energy_resource_id = b.id;
```

| formation_id | formation_name | formation_type | depth | resource_id | resource_resource_identifier | resource_resource_name |
|---|---|---|---|---|---|---|
| 4985147 | Seasonal Initiative | natural geothermal system | 0.15 | 1 | RES-2673 | Adaptive Corridor |
| 168542 | Integrated Model | hot dry rock | 0.07500005 | 2 | RES-2676 | Primary Series |
| 727068 | Extended Cluster D | sedimentary basin | 2.5 | 3 | RES-2679 | Composite Assessment D |
| 13483868 | Pilot Review | aquifer | 0.44305528 | 4 | RES-2682 | Compact Survey |

The view `v_geological_formation_energy_resource` answers "which energy resource is hosted in each geological formation?" It joins `geological_formations` to `energy_resources` on `geological_formations.energy_resource_id = energy_resources.id`. The result projects the formation's surrogate key, business identifier, name, type, depth, temperature, and location region alongside the resource's surrogate key, business identifier, name, and renewability status. The first row shows formation `4985147` ("Seasonal Initiative", `natural geothermal system`, depth `0.15`, temperature `1.33`, region `extended-location-93`) hosting resource `RES-2673` ("Adaptive Corridor", `renewable`). The third row shows formation `727068` ("Extended Cluster D", `sedimentary basin`, depth `2.5`, temperature `0.51", region `seasonal-location-95`) hosting resource `RES-2679` ("Composite Assessment D", `finite"). This view supports geological siting and resource allocation analysis.

**View `v_geological_formation_heat_transport_mechanism`**

```sql
CREATE VIEW v_geological_formation_heat_transport_mechanism AS
SELECT a.formation_id, a.formation_name, a.formation_type, a.depth, b.heat_transport_mechanism_id AS mechanism_heat_transport_mechanism_id, b.mechanism_id AS mechanism_mechanism_id, b.mechanism_type AS mechanism_mechanism_type
FROM geological_formations a JOIN heat_transport_mechanisms b ON a.heat_transport_mechanism_id = b.heat_transport_mechanism_id;
```

| formation_id | formation_name | formation_type | depth | mechanism_heat_transport_mechanism_id | mechanism_mechanism_id | mechanism_mechanism_type |
|---|---|---|---|---|---|---|
| 4985147 | Seasonal Initiative | natural geothermal system | 0.15 | 1 | 2106718 | advection |
| 168542 | Integrated Model | hot dry rock | 0.07500005 | 2 | 9085252 | thermal conduction |
| 727068 | Extended Cluster D | sedimentary basin | 2.5 | 3 | 2935 | convection |
| 13483868 | Pilot Review | aquifer | 0.44305528 | 4 | TERIMA | advection |

The view `v_geological_formation_heat_transport_mechanism` answers "which heat transport mechanism is employed in each geological formation?" It joins `geological_formations` to `heat_transport_mechanisms` on `geological_formations.heat_transport_mechanism_id = heat_transport_mechanisms.heat_transport_mechanism_id`. The result projects the formation's surrogate key, business identifier, name, type, depth, temperature, and location region alongside the mechanism's surrogate key, business identifier, type, transport speed, recharge rate, and time scale. The first row shows formation `4985147` ("Seasonal Initiative", depth `0.15`, temperature `1.33`) employing mechanism `2106718` (type `advection`, speed `fast`, recharge `9.70`, scale `human time scale`). The second row shows formation `168542` ("Integrated Model", depth `0.075`, temperature `1.17`) employing mechanism `9085252` (type `thermal conduction`, speed `slow`, recharge `14.40`, scale `geological time scale`). This view is essential for understanding the subsurface transport physics of each formation.

**View `v_energy_output_energy_extraction`**

```sql
CREATE VIEW v_energy_output_energy_extraction AS
SELECT a.energy_output_id, a.output_id, a.output_date, a.energy_quantity, b.id AS extraction_id, b.extraction_id AS extraction_extraction_id, b.extraction_date AS extraction_extraction_date
FROM energy_outputs a JOIN energy_extractions b ON a.energy_extraction_id = b.id;
```

| energy_output_id | output_id | output_date | energy_quantity | extraction_id | extraction_extraction_id | extraction_extraction_date |
|---|---|---|---|---|---|---|
| 1 | 3717613 | 2023-02-02T01:15:00 | 8.20 | 1 | L478 | 2023-10-22T09:27:00 |
| 2 | 937738 | 2024-07-13T08:32:00 | 10.40 | 2 | achat | 2024-03-06T16:44:00 |
| 3 | 974934 | 2025-12-24T15:49:00 | 12.60 | 3 | 392482 | 2025-08-17T23:01:00 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-08T22:06:00 | 14.80 | 4 | 505981 | 2022-01-01T06:18:00 |

The view `v_energy_output_energy_extraction` answers "which extraction produces each energy output?" It joins `energy_outputs` to `energy_extractions` on `energy_outputs.energy_extraction_id = energy_extractions.id`. The result projects the output's surrogate key, business identifier, date, energy quantity, unit, conversion type, and sustainability limit alongside the extraction's surrogate key, business identifier, date, method, rate, and sustainability status. The first row shows output `3717613` (quantity `8.20`, unit `MW`, conversion `electricity`, limit `11.45`) produced by extraction `L478` (method `regional-extracti-84`, rate `22.70`, status `sustainable`). The third row shows output `974934` (quantity `12.60`, unit `Joules`, conversion `direct use`, limit `20.35`) produced by extraction `392482` (method `compact-extracti-86`, rate `32.10`, status `depleted`). This view enables production-level traceability from output back to the extraction operation.

**View `v_energy_output_energy_resource`**

```sql
CREATE VIEW v_energy_output_energy_resource AS
SELECT a.energy_output_id, a.output_id, a.output_date, a.energy_quantity, b.id AS resource_id, b.resource_identifier AS resource_resource_identifier, b.resource_name AS resource_resource_name
FROM energy_outputs a JOIN energy_resources b ON a.energy_resource_id = b.id;
```

| energy_output_id | output_id | output_date | energy_quantity | resource_id | resource_resource_identifier | resource_resource_name |
|---|---|---|---|---|---|---|
| 1 | 3717613 | 2023-02-02T01:15:00 | 8.20 | 1 | RES-2673 | Adaptive Corridor |
| 2 | 937738 | 2024-07-13T08:32:00 | 10.40 | 2 | RES-2676 | Primary Series |
| 3 | 974934 | 2025-12-24T15:49:00 | 12.60 | 3 | RES-2679 | Composite Assessment D |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-08T22:06:00 | 14.80 | 4 | RES-2682 | Compact Survey |

The view `v_energy_output_energy_resource` answers "which energy resource is the origin of each energy output?" It joins `energy_outputs` to `energy_resources` on `energy_outputs.energy_resource_id = energy_resources.id`. The result projects the output's surrogate key, business identifier, date, energy quantity, unit, conversion type, and sustainability limit alongside the resource's surrogate key, business identifier, name, and renewability status. The first row shows output `3717613` (quantity `8.20`, unit `MW`, conversion `electricity`) originating from resource `RES-2673` ("Adaptive Corridor", `renewable`). The fourth row shows output `5f8f9bda-8fcd-11eb-924d-9cd76263cbd0` (quantity `14.80`, unit `MW`, conversion `electricity`) originating from resource `RES-2682` ("Compact Survey", `unlimited`). This view supports resource-level production attribution and sustainability auditing.

The relational schema presented here demonstrates how an ontology-grounded domain model materialises as a normalised set of tables and a suite of analytical views. The five base tables encode the core entity types and their attributes as columns, while the foreign-key columns encode the cardinality-bounded relationships between entities. The eleven views reconstruct domain facts by joining the normalised tables along these foreign keys, each view answering a specific analytical question about the relationships between entity types. The schema design ensures that any domain fact involving two or more entity types can be reconstructed through a single join operation, and the views provide pre-joined projections that eliminate the need for analysts to write join logic. This approach balances normalisation (reducing redundancy and update anomalies) with query convenience (providing ready-made analytical projections), which is a common pattern in ontology-grounded relational modelling.