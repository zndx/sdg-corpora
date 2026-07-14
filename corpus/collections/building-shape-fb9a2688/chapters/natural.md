## Building Energy Analysis and Optimization

The assessment of building energy performance requires a coordinated chain of measurements: geometric characterization of the structure, thermal simulation under defined environmental conditions, specification of envelope properties including glazing and material composition, and finally the tracking of optimization interventions that aim to reduce consumption while improving efficiency. This chapter documents the full analytical pipeline, from the initial shape description through simulation results to the optimization processes that act on those results. Each stage produces records that reference the preceding stage, forming a traceable chain from geometry to outcome.

**Table `building_shapes`**

| building_shape_id | shape_id | ground_plan_type | vertical_division_type | volume | surface_area | shape_factor | aerodynamic_coefficient | energy_simulation_id | glazing_ratio_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 69444 | Simple | Simple | 9.45 | 15.95 | 5.95 | 6.20 | 1 | 1 |
| 2 | 5006445 | Complex | Complex | 11.90 | 19.90 | 7.90 | 9.40 | 2 | 2 |
| 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple | Simple | 14.35 | 23.85 | 9.85 | 12.60 | 3 | 3 |
| 4 | 778574 | Complex | Complex | 16.80 | 27.80 | 11.80 | 15.80 | 4 | 4 |

Building shapes form the foundational layer of the analysis pipeline. Every shape record carries a unique identifier, a ground plan type, and a vertical division type, both of which are classified as either Simple or Complex. The geometric properties—volume, surface area, shape factor, and aerodynamic coefficient—quantify the physical form. Shape factor, defined as the ratio of surface area to volume, serves as a primary indicator of thermal exposure: higher values correspond to greater envelope area per unit of interior volume and therefore greater potential for heat loss or gain. Aerodynamic coefficient captures the influence of external airflow on convective heat transfer.

Consider the first shape record, identified by `69444`, which is classified as Simple on both the ground plan and vertical division axes. Its volume measures 9.45 cubic units with a surface area of 15.95, yielding a shape factor of 5.95 and an aerodynamic coefficient of 6.20. The fourth record, `778574`, presents a Complex configuration with a volume of 16.80, a surface area of 27.80, a shape factor of 11.80, and an aerodynamic coefficient of 15.80. The progression from Simple to Complex configurations is accompanied by systematic increases across all geometric metrics, reflecting the greater envelope complexity and exposure inherent in irregular forms. Each shape record also carries references to an energy simulation and a glazing ratio, anchoring the geometry to downstream analyses.

**Table `energy_simulations`**

| id | simulation_id | simulation_date | energy_consumption | heating_load | cooling_load | ventilation_rate | indoor_temperature | outdoor_temperature | building_shape_id | building_material_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 212 | 2025-12-23T11:21:00 | 4.45 | 6.95 | 14.45 | 10.45 | 0.74 | 1.52 | 1 | 1000 |
| 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 | 7.90 | 9.90 | 17.90 | 13.90 | 1.09 | 0.6 | 2 | 1001 |
| 3 | 974945 | 2023-10-18T01:55:00 | 11.35 | 12.85 | 21.35 | 17.35 | 0.77 | 0.6000001 | 3 | 1002 |
| 4 | 7119790 | 2024-03-02T08:12:00 | 14.80 | 15.80 | 24.80 | 20.80 | 0.6 | 1.00331 | 4 | 1003 |

Energy simulations translate the geometric description into thermal performance predictions. Each simulation record includes a date stamp, energy consumption, heating load, cooling load, ventilation rate, and both indoor and outdoor temperature readings. The simulation identifiers range from short numeric codes such as `212` to UUIDs like `047555c4-9bac-11eb-a8a2-19ed5c03f8d3`, reflecting the variety of simulation tools and versions in use.

The first simulation, dated 2025-12-23, reports an energy consumption of 4.45 units, a heating load of 6.95, and a cooling load of 14.45. The indoor temperature is recorded at 0.74 with an outdoor temperature of 1.52, suggesting a mild differential. By contrast, the fourth simulation, dated 2024-03-02, shows energy consumption of 14.80, heating load of 15.80, and cooling load of 24.80, with an indoor temperature of 0.6 and an outdoor temperature of approximately 1.00. The escalation in consumption and loads across the four simulation records correlates with the increasing geometric complexity of the associated building shapes, demonstrating how envelope characteristics directly influence thermal demand. Each simulation is linked to a building shape and a building material, ensuring that the thermal predictions are grounded in both geometry and construction specification.

**Table `glazing_ratios`**

| id | glazing_ratio_id | wall_area | glazing_area | ratio_percentage | orientation | building_shape_id |
|---|---|---|---|---|---|---|
| 1 | 10445629 | 4.20 | 7.95 | 15.70 | North | 1 |
| 2 | 6926365 | 6.40 | 10.90 | 20.40 | South | 2 |
| 3 | 129 | 8.60 | 13.85 | 25.10 | East | 3 |
| 4 | 4060659 | 10.80 | 16.80 | 29.80 | West | 4 |

Glazing ratios quantify the proportion of transparent envelope area relative to total wall area, a critical determinant of solar heat gain and daylight availability. Each record specifies the wall area, the glazing area, the resulting ratio as a percentage, and the orientation of the glazed surface. The four records cover the cardinal directions: North, South, East, and West.

The first record, associated with the Simple shape `69444`, describes a North-facing glazing configuration with a wall area of 4.20 and a glazing area of 7.95, yielding a ratio of 15.70 percent. The second record, linked to the Complex shape `5006445`, addresses a South-facing orientation with a wall area of 6.40, a glazing area of 10.90, and a ratio of 20.40 percent. The third and fourth records cover East and West orientations respectively, with ratios of 25.10 and 29.80 percent. The increasing glazing ratios from North to West reflect the greater solar exposure on those facades and the corresponding design response of adjusting transparent area. Each glazing ratio record references its parent building shape, ensuring that the envelope specification remains tied to the geometric model.

**Table `building_materials`**

| id | material_id | material_name | thermal_conductivity | density | thickness | installation_date | energy_simulation_id |
|---|---|---|---|---|---|---|---|
| 1000 | 2839521 | Compact Framework | 11.70 | 3.45 | 15.70 | 2022-01-10 | 1 |
| 1001 | 937739 | Legacy Protocol | 16.40 | 5.90 | 18.40 | 2023-06-21 | 2 |
| 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Programme A | 21.10 | 8.35 | 21.10 | 2024-11-05 | 3 |
| 1003 | 7021001070070 | Seasonal Standard | 25.80 | 10.80 | 23.80 | 2025-04-16 | 4 |

Building materials define the thermal properties of the construction envelope. Each material record includes a name, thermal conductivity, density, thickness, and an installation date. The material identifiers follow a mixed convention: numeric codes such as `2839521`, textual identifiers like `937739`, and UUIDs such as `27cf9038-9bad-11eb-a8a2-19ed5c03f8d3`.

The first material, Compact Framework, exhibits a thermal conductivity of 11.70, a density of 3.45, and a thickness of 15.70, installed on 2022-01-10. The fourth material, Seasonal Standard, shows a thermal conductivity of 25.80, a density of 10.80, and a thickness of 23.80, installed on 2025-04-16. The progression in thermal conductivity across the four materials—from 11.70 to 25.80—indicates a shift toward materials with higher heat transfer characteristics, which would directly influence the heating and cooling loads reported in the associated energy simulations. Each material record is linked to an energy simulation, closing the loop between construction specification and thermal prediction.

**Table `optimization_processes`**

| id | process_id | start_date | end_date | cost_reduction | efficiency_gain | status | building_shape_id | energy_simulation_id |
|---|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 3,674 | 21.45 | pending | 1 | 1 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 4,634 | 25.90 | running | 2 | 2 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 43.25 | 30.35 | complete | 3 | 3 |
| 4 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1,633 | 34.80 | failed | 4 | 4 |

Optimization processes capture the interventions applied to building systems with the goal of reducing energy consumption and improving operational efficiency. Each process record includes a start date, an end date, a cost reduction figure, an efficiency gain percentage, and a status indicating whether the process is pending, running, complete, or failed. The process identifiers range from descriptive strings such as `template_ivacode_pagata_art15` to UUIDs and alphanumeric codes like `1205-0002-XL`.

The first optimization process, initiated on 2022-09-05 and targeting shape `69444` with simulation `212`, reports a cost reduction of 3,674 and an efficiency gain of 21.45 percent, with a status of pending. The second process, running against shape `5006445` and simulation `047555c4-9bac-11eb-a8a2-19ed5c03f8d3`, achieves an efficiency gain of 25.90 percent with a cost reduction of 4,634. The third process, marked complete, targets shape `b10c1484-8fcd-11eb-924d-9cd76263cbd0` and simulation `974945`, delivering an efficiency gain of 30.35 percent and a cost reduction of 43.25. The fourth process, associated with shape `778574` and simulation `7119790`, has a status of failed, despite targeting a cost reduction of 1,633 and an efficiency gain of 34.80 percent. The variation in outcomes underscores the importance of tracking both the intended and actual results of optimization interventions. Each process references both a building shape and an energy simulation, ensuring that optimization efforts are grounded in the specific geometric and thermal context of the target building.

## Cross-Domain Energy Relationships

The relationship between building geometry and energy simulation results is captured through a joined view that pairs each shape record with its corresponding simulation. This view answers the question of how a specific geometric configuration maps to its predicted thermal performance. The first row shows shape `69444` with a Simple ground plan and Simple vertical division linked to simulation `212`, dated 2025-12-23. The second row connects shape `5006445` (Complex/Complex) to simulation `047555c4-9bac-11eb-a8a2-19ed5c03f8d3`, dated 2022-05-07. The join confirms that every shape has exactly one associated simulation, and the chronological spread of simulation dates—from 2022 through 2025—indicates that the analysis pipeline has been applied iteratively across multiple assessment cycles.

## Glazing-to-Shape Relationships

A second joined view connects building shapes to their glazing ratio specifications, answering the question of which envelope glazing configuration applies to each geometric form. The first row pairs shape `69444` with its North-facing glazing ratio of 15.70 percent. The second row links shape `5006445` to a South-facing ratio of 20.40 percent. The third and fourth rows extend this mapping to the East and West orientations for shapes `b10c1484-8fcd-11eb-924d-9cd76263cbd0` and `778574` respectively, with ratios of 25.10 and 29.80 percent. This view makes it possible to trace how glazing design varies systematically with building configuration and orientation.

## Energy Simulation to Shape Mapping

The inverse perspective—starting from the simulation and tracing back to the building shape—provides a complementary lens on the same relationship. This view answers the question of which geometric configuration underlies each simulation result. The first row shows simulation `212` (energy consumption 4.45, heating load 6.95, cooling load 14.45) originating from shape `69444` with a shape factor of 5.95. The fourth row links simulation `7119790` (energy consumption 14.80, heating load 15.80, cooling load 24.80) to shape `778574` with a shape factor of 11.80. The direct correspondence between increasing shape factors and increasing energy loads is evident, reinforcing the role of geometric complexity as a primary driver of thermal demand.

## Material-to-Simulation Linkage

Building materials are linked to energy simulations through a view that pairs each material record with its corresponding simulation. This view answers the question of which construction specification was assumed in each thermal prediction. The first row connects material Compact Framework (thermal conductivity 11.70, thickness 15.70) to simulation `212` with energy consumption of 4.45. The fourth row links material Seasonal Standard (thermal conductivity 25.80, thickness 23.80) to simulation `7119790` with energy consumption of 14.80. The progression in thermal conductivity from 11.70 to 25.80 across the four rows parallels the escalation in energy consumption from 4.45 to 14.80, demonstrating how material selection directly influences predicted energy performance.

## Glazing Ratio to Shape Correlation

A view oriented from the glazing ratio side back to the building shape provides a reverse lookup that confirms the envelope specification for each geometric form. The first row shows glazing ratio `10445629` (North-facing, 15.70 percent) applied to shape `69444`. The second row links glazing ratio `6926365` (South-facing, 20.40 percent) to shape `5006445`. The third and fourth rows extend this to glazing ratios `129` (East, 25.10 percent) and `4060659` (West, 29.80 percent) for shapes `b10c1484-8fcd-11eb-924d-9cd76263cbd0` and `778574`. This view is particularly useful for envelope audits, where one starts with a glazing specification and needs to identify the building configuration it was designed for.

## Material-to-Energy Simulation Integration

Another material-to-simulation view, structured from the material perspective, confirms the linkage between construction specification and thermal prediction. The first row shows material `2839521` (Compact Framework) associated with simulation `212`. The second row links material `937739` (Legacy Protocol) to simulation `047555c4-9bac-11eb-a8a2-19ed5c03f8d3`. The third and fourth rows connect materials `27cf9038-9bad-11eb-a8a2-19ed5c03f8d3` (Regional Programme A) and `7021001070070` (Seasonal Standard) to simulations `974945` and `7119790` respectively. This view supports traceability from material procurement through to the simulation results that informed the selection.

## Optimization-to-Shape Integration

The optimization-to-shape view answers the question of which building geometry is the target of each optimization intervention. The first row shows optimization process `template_ivacode_pagata_art15` targeting shape `69444` with a pending status and an efficiency gain of 21.45 percent. The second row links process `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` to shape `5006445`, currently running with an efficiency gain of 25.90 percent. The third row connects process `57e52fbc-8fcd-11eb-924d-9cd76263cbd0` to shape `b10c1484-8fcd-11eb-924d-9cd76263cbd0`, marked complete with an efficiency gain of 30.35 percent. The fourth row associates process `1205-0002-XL` with shape `778574`, which has a failed status despite a projected efficiency gain of 34.80 percent. This view enables portfolio-level tracking of which building configurations are being optimized and at what stage.

## Optimization-to-Energy Simulation Integration

The final joined view connects optimization processes to their underlying energy simulations, answering the question of which thermal prediction serves as the baseline for each optimization effort. The first row shows process `template_ivacode_pagata_art15` linked to simulation `212` (energy consumption 4.45). The second row connects process `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3` to simulation `047555c4-9bac-11eb-a8a2-19ed5c03f8d3` (energy consumption 7.90). The third row links process `57e52fbc-8fcd-11eb-924d-9cd76263cbd0` to simulation `974945` (energy consumption 11.35), and the fourth row associates process `1205-0002-XL` with simulation `7119790` (energy consumption 14.80). The increasing energy consumption values across the four rows correspond to the increasing efficiency gains reported by the optimization processes, reflecting the greater potential for improvement in higher-consumption configurations.

## Synthesis

The analytical pipeline described here forms a coherent chain from geometry through simulation to optimization. Building shapes provide the geometric foundation, with shape factor and aerodynamic coefficient serving as primary indicators of thermal exposure. Energy simulations translate those geometric properties into predicted consumption, heating and cooling loads, and ventilation requirements. Glazing ratios specify the transparent envelope characteristics for each orientation, while building materials define the thermal properties of the construction. Optimization processes then act on this integrated model, targeting specific shapes and simulations with the goal of reducing cost and improving efficiency. The joined views make it possible to navigate this chain in either direction, supporting both forward prediction and backward traceability. The data demonstrates a clear progression: as building complexity increases, so do energy loads, glazing ratios, and the potential gains from optimization—though the actual outcomes depend on the success of the interventions applied.

## Data appendix

**View `vw_building_shape_energy_simulation`**

```sql
CREATE VIEW vw_building_shape_energy_simulation AS
SELECT a.building_shape_id, a.shape_id, a.ground_plan_type, a.vertical_division_type, b.id AS simulation_id, b.simulation_id AS simulation_simulation_id, b.simulation_date AS simulation_simulation_date
FROM building_shapes a JOIN energy_simulations b ON a.energy_simulation_id = b.id;
```

| building_shape_id | shape_id | ground_plan_type | vertical_division_type | simulation_id | simulation_simulation_id | simulation_simulation_date |
|---|---|---|---|---|---|---|
| 1 | 69444 | Simple | Simple | 1 | 212 | 2025-12-23T11:21:00 |
| 2 | 5006445 | Complex | Complex | 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 |
| 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple | Simple | 3 | 974945 | 2023-10-18T01:55:00 |
| 4 | 778574 | Complex | Complex | 4 | 7119790 | 2024-03-02T08:12:00 |

**View `vw_building_shape_glazing_ratio`**

```sql
CREATE VIEW vw_building_shape_glazing_ratio AS
SELECT a.building_shape_id, a.shape_id, a.ground_plan_type, a.vertical_division_type, b.id AS ratio_id, b.glazing_ratio_id AS ratio_glazing_ratio_id, b.wall_area AS ratio_wall_area
FROM building_shapes a JOIN glazing_ratios b ON a.glazing_ratio_id = b.id;
```

| building_shape_id | shape_id | ground_plan_type | vertical_division_type | ratio_id | ratio_glazing_ratio_id | ratio_wall_area |
|---|---|---|---|---|---|---|
| 1 | 69444 | Simple | Simple | 1 | 10445629 | 4.20 |
| 2 | 5006445 | Complex | Complex | 2 | 6926365 | 6.40 |
| 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple | Simple | 3 | 129 | 8.60 |
| 4 | 778574 | Complex | Complex | 4 | 4060659 | 10.80 |

**View `vw_energy_simulation_building_shape`**

```sql
CREATE VIEW vw_energy_simulation_building_shape AS
SELECT a.id, a.simulation_id, a.simulation_date, a.energy_consumption, b.building_shape_id AS shape_building_shape_id, b.shape_id AS shape_shape_id, b.ground_plan_type AS shape_ground_plan_type
FROM energy_simulations a JOIN building_shapes b ON a.building_shape_id = b.building_shape_id;
```

| id | simulation_id | simulation_date | energy_consumption | shape_building_shape_id | shape_shape_id | shape_ground_plan_type |
|---|---|---|---|---|---|---|
| 1 | 212 | 2025-12-23T11:21:00 | 4.45 | 1 | 69444 | Simple |
| 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 | 7.90 | 2 | 5006445 | Complex |
| 3 | 974945 | 2023-10-18T01:55:00 | 11.35 | 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple |
| 4 | 7119790 | 2024-03-02T08:12:00 | 14.80 | 4 | 778574 | Complex |

**View `vw_energy_simulation_building_material`**

```sql
CREATE VIEW vw_energy_simulation_building_material AS
SELECT a.id, a.simulation_id, a.simulation_date, a.energy_consumption, b.id AS material_id, b.material_id AS material_material_id, b.material_name AS material_material_name
FROM energy_simulations a JOIN building_materials b ON a.building_material_id = b.id;
```

| id | simulation_id | simulation_date | energy_consumption | material_id | material_material_id | material_material_name |
|---|---|---|---|---|---|---|
| 1 | 212 | 2025-12-23T11:21:00 | 4.45 | 1000 | 2839521 | Compact Framework |
| 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 | 7.90 | 1001 | 937739 | Legacy Protocol |
| 3 | 974945 | 2023-10-18T01:55:00 | 11.35 | 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Programme A |
| 4 | 7119790 | 2024-03-02T08:12:00 | 14.80 | 1003 | 7021001070070 | Seasonal Standard |

**View `vw_glazing_ratio_building_shape`**

```sql
CREATE VIEW vw_glazing_ratio_building_shape AS
SELECT a.id, a.glazing_ratio_id, a.wall_area, a.glazing_area, b.building_shape_id AS shape_building_shape_id, b.shape_id AS shape_shape_id, b.ground_plan_type AS shape_ground_plan_type
FROM glazing_ratios a JOIN building_shapes b ON a.building_shape_id = b.building_shape_id;
```

| id | glazing_ratio_id | wall_area | glazing_area | shape_building_shape_id | shape_shape_id | shape_ground_plan_type |
|---|---|---|---|---|---|---|
| 1 | 10445629 | 4.20 | 7.95 | 1 | 69444 | Simple |
| 2 | 6926365 | 6.40 | 10.90 | 2 | 5006445 | Complex |
| 3 | 129 | 8.60 | 13.85 | 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple |
| 4 | 4060659 | 10.80 | 16.80 | 4 | 778574 | Complex |

**View `vw_building_material_energy_simulation`**

```sql
CREATE VIEW vw_building_material_energy_simulation AS
SELECT a.id, a.material_id, a.material_name, a.thermal_conductivity, b.id AS simulation_id, b.simulation_id AS simulation_simulation_id, b.simulation_date AS simulation_simulation_date
FROM building_materials a JOIN energy_simulations b ON a.energy_simulation_id = b.id;
```

| id | material_id | material_name | thermal_conductivity | simulation_id | simulation_simulation_id | simulation_simulation_date |
|---|---|---|---|---|---|---|
| 1000 | 2839521 | Compact Framework | 11.70 | 1 | 212 | 2025-12-23T11:21:00 |
| 1001 | 937739 | Legacy Protocol | 16.40 | 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 |
| 1002 | 27cf9038-9bad-11eb-a8a2-19ed5c03f8d3 | Regional Programme A | 21.10 | 3 | 974945 | 2023-10-18T01:55:00 |
| 1003 | 7021001070070 | Seasonal Standard | 25.80 | 4 | 7119790 | 2024-03-02T08:12:00 |

**View `vw_optimization_process_building_shape`**

```sql
CREATE VIEW vw_optimization_process_building_shape AS
SELECT a.id, a.process_id, a.start_date, a.end_date, b.building_shape_id AS shape_building_shape_id, b.shape_id AS shape_shape_id, b.ground_plan_type AS shape_ground_plan_type
FROM optimization_processes a JOIN building_shapes b ON a.building_shape_id = b.building_shape_id;
```

| id | process_id | start_date | end_date | shape_building_shape_id | shape_shape_id | shape_ground_plan_type |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 69444 | Simple |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 5006445 | Complex |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | b10c1484-8fcd-11eb-924d-9cd76263cbd0 | Simple |
| 4 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 778574 | Complex |

**View `vw_optimization_process_energy_simulation`**

```sql
CREATE VIEW vw_optimization_process_energy_simulation AS
SELECT a.id, a.process_id, a.start_date, a.end_date, b.id AS simulation_id, b.simulation_id AS simulation_simulation_id, b.simulation_date AS simulation_simulation_date
FROM optimization_processes a JOIN energy_simulations b ON a.energy_simulation_id = b.id;
```

| id | process_id | start_date | end_date | simulation_id | simulation_simulation_id | simulation_simulation_date |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 212 | 2025-12-23T11:21:00 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 047555c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2022-05-07T18:38:00 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 974945 | 2023-10-18T01:55:00 |
| 4 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 7119790 | 2024-03-02T08:12:00 |
