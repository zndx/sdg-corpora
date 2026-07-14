## Energy Resource Systems: Extraction, Transport, and Output

Energy resource management operates at the intersection of geology, thermodynamics, and operational logistics. Practitioners track how energy is identified, extracted from subsurface formations, transported through physical mechanisms, and ultimately converted into usable outputs. The domain revolves around five core record types: energy resources, extraction events, heat transport mechanisms, geological formations, and energy outputs. Each record carries identifiers, timestamps, rates, and sustainability indicators that together form a complete picture of an energy system's lifecycle. Understanding how these records relate to one another is essential for capacity planning, environmental compliance, and resource allocation.

**Table `energy_resources`**

| id | resource_identifier | resource_name | renewability_status | exploitation_rate | expected_reserves_years | share_in_energy_mix | classification_standard | energy_extraction_id | formation_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | RES-2673 | Adaptive Corridor | renewable | 8.70 | 16 | 3.20 | integrated-classifi-88 | 1 | 4985147 |
| 2 | RES-2676 | Primary Series | depleting | 12.40 | 20 | 5.40 | seasonal-classifi-89 | 2 | 168542 |
| 3 | RES-2679 | Composite Assessment D | finite | 16.10 | 24 | 7.60 | regional-classifi-90 | 3 | 727068 |
| 4 | RES-2682 | Compact Survey | unlimited | 19.80 | 28 | 9.80 | legacy-classifi-91 | 4 | 13483868 |

Energy resources constitute the foundational layer of the domain. Each resource is assigned a unique identifier such as `RES-2673` or `RES-2682`, alongside a descriptive name like "Adaptive Corridor" or "Compact Survey." The renewability status categorizes a resource as renewable, depleting, finite, or unlimited — a classification that directly informs long-term planning. The exploitation rate, measured as a numeric value, indicates how aggressively a resource is being drawn down; for instance, the "Adaptive Corridor" resource carries an exploitation rate of 8.70, while "Compact Survey" registers at 19.80. Expected reserves in years provide a forward-looking metric, ranging from 16 years for the "Adaptive Corridor" to 28 years for the "Compact Survey." The share in energy mix quantifies each resource's contribution to the broader portfolio, with values spanning from 3.20 to 9.80. Classification standards such as `integrated-classifi-88` or `seasonal-classifi-89` apply domain-specific taxonomies to each resource. Every resource record also references an associated extraction event and a geological formation, anchoring the resource to its operational and subsurface context.

**Table `energy_extractions`**

| id | extraction_id | extraction_date | extraction_method | extraction_rate | sustainability_status | capacity_installed | capacity_limited | energy_resource_id | heat_transport_mechanism_id | energy_output_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | L478 | 2023-10-22T09:27:00 | regional-extracti-84 | 22.70 | sustainable | 21.45 | 23.45 | 1 | 1 | 1 |
| 2 | achat | 2024-03-06T16:44:00 | legacy-extracti-85 | 27.40 | overexploited | 23.90 | 27.90 | 2 | 2 | 2 |
| 3 | 392482 | 2025-08-17T23:01:00 | compact-extracti-86 | 32.10 | depleted | 26.35 | 32.35 | 3 | 3 | 3 |
| 4 | 505981 | 2022-01-01T06:18:00 | composite-extracti-87 | 36.80 | equilibrium | 28.80 | 36.80 | 4 | 4 | 4 |

Extraction events capture the operational act of drawing energy from the ground. Each extraction is identified by a unique code — `L478`, `achat`, `392482`, or `505981` — and timestamped with an extraction date ranging from January 2022 to August 2025. The extraction method, such as `regional-extracti-84` or `compact-extracti-86`, describes the technique deployed. Extraction rates vary considerably, from 22.70 for the earliest recorded event to 36.80 for the most recent, reflecting differences in scale and technique. Sustainability status provides a critical operational signal: extractions are classified as sustainable, overexploited, depleted, or in equilibrium. The "Adaptive Corridor" extraction (`L478`) is marked sustainable, while the "Primary Series" extraction (`achat`) carries an overexploited status. Capacity metrics — both installed and limited — frame the physical constraints of each operation. Installed capacity ranges from 21.45 to 28.80, while limited capacity mirrors or exceeds these values, indicating headroom or constraint boundaries. Each extraction links to its parent energy resource, an associated heat transport mechanism, and a resulting energy output, forming the central hub of the domain's relational structure.

**Table `heat_transport_mechanisms`**

| heat_transport_mechanism_id | mechanism_id | mechanism_type | transport_speed | recharge_rate | time_scale | energy_resource_id | energy_extraction_id |
|---|---|---|---|---|---|---|---|
| 1 | 2106718 | advection | fast | 9.70 | human time scale | 1 | 1 |
| 2 | 9085252 | thermal conduction | slow | 14.40 | geological time scale | 2 | 2 |
| 3 | 2935 | convection | instantaneous | 19.10 | centuries | 3 | 3 |
| 4 | TERIMA | advection | fast | 23.80 | human time scale | 4 | 4 |

Heat transport mechanisms describe how thermal energy moves from the extraction point toward conversion or distribution infrastructure. Each mechanism is assigned a numeric or alphanumeric identifier — `2106718`, `9085252`, `2935`, or `TERIMA` — and classified by type: advection, thermal conduction, or convection. Transport speed ranges from slow, as seen with the thermal conduction mechanism `9085252`, to instantaneous for the convection mechanism `2935`. Recharge rates, measured numerically, span from 9.70 to 23.80, indicating how quickly the transport medium replenishes its thermal capacity. Time scale categorizes the operational horizon of each mechanism: human time scale, geological time scale, or centuries. The advection mechanism `2106718` operates on a human time scale with a recharge rate of 9.70, while the convection mechanism `2935` operates over centuries with a recharge rate of 19.10. Each mechanism is tied to a specific energy resource and extraction event, ensuring that transport logistics are traceable to their source operations.

**Table `geological_formations`**

| formation_id | formation_name | formation_type | depth | temperature | location_region | energy_resource_id | heat_transport_mechanism_id |
|---|---|---|---|---|---|---|---|
| 4985147 | Seasonal Initiative | natural geothermal system | 0.15 | 1.33 | extended-location-93 | 1 | 1 |
| 168542 | Integrated Model | hot dry rock | 0.07500005 | 1.1714807757148185 | integrated-location-94 | 2 | 2 |
| 727068 | Extended Cluster D | sedimentary basin | 2.5 | 0.51 | seasonal-location-95 | 3 | 3 |
| 13483868 | Pilot Review | aquifer | 0.44305528 | 0.85 | regional-location-96 | 4 | 4 |

Geological formations provide the subsurface context in which energy resources reside. Formation identifiers such as `4985147` and `13483868` anchor each record to a physical location. Formation names like "Seasonal Initiative" and "Pilot Review" describe the geological character. Formation types include natural geothermal system, hot dry rock, sedimentary basin, and aquifer — each implying different extraction strategies and thermal properties. Depth measurements range from 0.075 for the "Integrated Model" hot dry rock formation to 2.5 for the "Extended Cluster D" sedimentary basin, reflecting the vertical dimension of resource access. Temperature values, recorded as decimals, vary from 0.51 in the sedimentary basin to 1.33 in the natural geothermal system. Location regions such as `extended-location-93` and `regional-location-96` provide geographic or administrative context. Every formation links to its energy resource and heat transport mechanism, completing the subsurface-to-surface chain of energy flow.

**Table `energy_outputs`**

| energy_output_id | output_id | output_date | energy_quantity | unit | conversion_type | sustainability_limit | energy_extraction_id | energy_resource_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 3717613 | 2023-02-02T01:15:00 | 8.20 | MW | electricity | 11.45 | 1 | 1 |
| 2 | 937738 | 2024-07-13T08:32:00 | 10.40 | GWh | thermal | 15.90 | 2 | 2 |
| 3 | 974934 | 2025-12-24T15:49:00 | 12.60 | Joules | direct use | 20.35 | 3 | 3 |
| 4 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | 2022-05-08T22:06:00 | 14.80 | MW | electricity | 24.80 | 4 | 4 |

Energy outputs represent the final conversion of extracted energy into usable forms. Each output carries a unique identifier — `3717613`, `937738`, `974934`, or the UUID `5f8f9bda-8fcd-11eb-924d-9cd76263cbd0` — and is timestamped with an output date. Energy quantities range from 8.20 to 14.80, measured in units such as megawatts (MW), gigawatt-hours (GWh), or Joules. Conversion types include electricity, thermal, and direct use, indicating the form in which energy is delivered. Sustainability limits, ranging from 11.45 to 24.80, define the maximum sustainable output level for each conversion pathway. Each output traces back to its source extraction event and energy resource, closing the loop from subsurface resource to end-use energy.

The relationships between these record types become most visible through joined views, which answer specific operational questions by combining data across tables.

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

The view `v_energy_resource_energy_extraction` joins energy resources with their corresponding extraction events, answering the question: which extraction operations are associated with which energy resources? The result pairs each resource identifier with its extraction code and timestamp. For example, the "Adaptive Corridor" resource (`RES-2673`) is linked to extraction `L478`, recorded on 2023-10-22. Similarly, the "Primary Series" resource (`RES-2676`) connects to extraction `achat` on 2024-03-06. This view enables practitioners to trace resource-level planning back to specific operational events, supporting audit trails and performance reviews.

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

The view `v_energy_resource_geological_formation` links energy resources to their host geological formations, answering: in what geological context does each resource reside? The "Adaptive Corridor" resource (`RES-2673`) is hosted in the "Seasonal Initiative" formation (`4985147`), a natural geothermal system at a depth of 0.15. The "Compact Survey" resource (`RES-2682`) resides in the "Pilot Review" formation (`13483868`), an aquifer at 0.443 depth. This view supports geological risk assessment and informs extraction method selection based on formation characteristics.

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

The view `v_energy_extraction_energy_resource` reverses the perspective of the resource-extraction join, answering: for each extraction event, which energy resource is being drawn? Extraction `L478` draws from the "Adaptive Corridor" resource (`RES-2673`), while extraction `achat` draws from the "Primary Series" resource (`RES-2676`). This inversion is useful for operational dashboards that start from the extraction event and drill down into resource characteristics, enabling real-time monitoring of draw rates against resource sustainability profiles.

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

The view `v_energy_extraction_heat_transport_mechanism` connects extraction events to their associated heat transport mechanisms, answering: through what transport pathway does energy move after extraction? Extraction `L478` uses the advection mechanism `2106718`, which operates at fast transport speed on a human time scale. Extraction `achat` uses the thermal conduction mechanism `9085252`, operating at slow speed on a geological time scale. This view is critical for thermal logistics planning, as transport speed and time scale directly affect conversion timelines and infrastructure requirements.

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

The view `v_energy_extraction_energy_output` links extraction events to their resulting energy outputs, answering: what energy is produced from each extraction operation? Extraction `L478` yields output `3717613`, producing 8.20 MW of electricity. Extraction `achat` yields output `937738`, producing 10.40 GWh of thermal energy. This view supports production accounting and enables practitioners to compare extraction efficiency across different methods and resources.

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

The view `v_heat_transport_mechanism_energy_resource` joins heat transport mechanisms with their associated energy resources, answering: which energy resources are served by each transport mechanism? The advection mechanism `2106718` serves the "Adaptive Corridor" resource (`RES-2673`), while the thermal conduction mechanism `9085252` serves the "Primary Series" resource (`RES-2676`). This view supports infrastructure investment decisions by revealing which resources depend on specific transport technologies, highlighting potential single points of failure or capacity bottlenecks.

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

The view `v_heat_transport_mechanism_energy_extraction` connects heat transport mechanisms to their corresponding extraction events, answering: which extraction operations rely on each transport mechanism? The advection mechanism `2106718` supports extraction `L478`, and the convection mechanism `2935` supports extraction `392482`. This view is essential for maintenance scheduling and capacity planning, as transport mechanisms have distinct recharge rates and time scales that affect downstream extraction continuity.

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

The view `v_geological_formation_energy_resource` links geological formations to their associated energy resources, answering: which resources are hosted in each formation? The "Seasonal Initiative" formation (`4985147`) hosts the "Adaptive Corridor" resource (`RES-2673`), while the "Pilot Review" formation (`13483868`) hosts the "Compact Survey" resource (`RES-2682`). This view supports geological survey planning and resource valuation, as formation type and depth directly influence extraction costs and recovery rates.

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

The view `v_geological_formation_heat_transport_mechanism` joins geological formations with their heat transport mechanisms, answering: through what transport pathway does each formation deliver energy? The "Seasonal Initiative" formation (`4985147`) uses the advection mechanism `2106718`, while the "Integrated Model" formation (`168542`) uses the thermal conduction mechanism `9085252`. This view integrates subsurface geology with surface logistics, enabling practitioners to model thermal delivery timelines based on formation properties and transport characteristics.

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

The view `v_energy_output_energy_extraction` reverses the extraction-output join, answering: for each energy output, which extraction event produced it? Output `3717613` (8.20 MW of electricity) was produced by extraction `L478`, while output `937738` (10.40 GWh of thermal energy) was produced by extraction `achat`. This inversion supports reverse-traceability for quality assurance, allowing practitioners to identify the extraction conditions that led to specific output levels and sustainability outcomes.

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

The view `v_energy_output_energy_resource` links energy outputs to their source energy resources, answering: which energy resource ultimately produced each output? Output `3717613` traces to the "Adaptive Corridor" resource (`RES-2673`), and output `937738` traces to the "Primary Series" resource (`RES-2676`). This view closes the full lifecycle chain from resource identification through extraction, transport, and conversion, providing a complete audit trail for regulatory reporting and portfolio performance analysis.

The domain's five base tables and twelve joined views form a coherent framework for energy resource management. Resources are identified and classified, extracted through defined methods, transported via physical mechanisms, hosted in geological formations, and converted into measurable outputs. The joined views provide multiple perspectives on these relationships, enabling practitioners to query the system from any entry point — whether starting from a resource, an extraction event, a transport mechanism, a formation, or an output. This multi-angle accessibility ensures that planning, monitoring, and compliance activities can proceed with full contextual awareness of the interconnected processes that define modern energy resource operations.