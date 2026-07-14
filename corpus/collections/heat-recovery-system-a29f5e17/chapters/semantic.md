## Ontology-Grounded Schema Design for Heat Recovery in Pulp Manufacturing

The pulp and paper industry consumes vast quantities of thermal energy, and heat recovery represents a critical lever for reducing both operating cost and carbon intensity. In this domain, the data model captures the lifecycle of heat recovery systems deployed across pulp mills, tracing energy from its origin in exhaust streams through recovery hardware to its final disposition in heat sinks, while also accounting for the steam turbines that augment thermal efficiency and the process waters that benefit from preheating. The ontology distinguishes six core entity types—heat recovery systems, pulp mills, exhaust streams, heat sinks, steam turbines, and process waters—linked by foreign keys that enforce a single-parent cardinality on most relationships and a many-to-one composition on the junction between systems and sinks. The materialized schema normalizes these entities into seven base tables and derives twenty denormalized views that answer the operational questions mill engineers actually ask: which system serves which mill, what exhaust stream feeds a given recovery unit, and how much thermal capacity each heat sink can absorb.

**Table `heat_recovery_systems`**

| id | system_identifier | system_model | design_capacity | commissioning_date | delivery_mode | status | pulp_mill_id | exhaust_stream_id |
|---|---|---|---|---|---|---|---|---|
| 1 | SYS-2050 | composite-system-93 | 12.45 | 2025-12-03T11:57:00 | turn-key | planned | 100 | 100 |
| 2 | SYS-2051 | primary-system-94 | 14.90 | 2022-05-14T18:14:00 | phased | installed | 101 | 101 |
| 3 | SYS-2052 | adaptive-system-95 | 17.35 | 2023-10-25T01:31:00 | modular | commissioned | 102 | 102 |
| 4 | SYS-2053 | distributed-system-96 | 19.80 | 2024-03-09T08:48:00 | turn-key | operational | 103 | 103 |

The `heat_recovery_systems` table anchors the entire model. Each row represents a discrete thermal recovery installation identified by a human-readable `system_identifier` such as `SYS-2050` or `SYS-2053`, and classified by `system_model` into architectural families like `composite-system-93`, `primary-system-94`, `adaptive-system-95`, and `distributed-system-96`. The `design_capacity` column stores a floating-point rating in megawatts (values range from 12.45 to 19.80 across the sample), while `commissioning_date` records the go-live timestamp. The `delivery_mode` enum distinguishes `turn-key`, `phased`, and `modular` procurement strategies, and `status` tracks the operational phase from `planned` through `installed` and `commissioned` to `operational`. Two foreign keys, `pulp_mill_id` and `exhaust_stream_id`, bind each system to exactly one mill and one exhaust stream, establishing a one-to-one composition at the source side. Row 1 (`SYS-2050`) is a planned composite system with a 12.45 MW capacity linked to mill 100 and exhaust stream 100; row 4 (`SYS-2053`) is an operational distributed system rated at 19.80 MW.

**Table `pulp_mills`**

| id | mill_identifier | location | country | operational_status | primary_product | heat_recovery_system_id | steam_turbine_id |
|---|---|---|---|---|---|---|---|
| 100 | MIL-2782 | extended-location-99 | compact-country-26 | active | compact-primary-20 | 1 | 1000 |
| 101 | MIL-2784 | integrated-location-100 | composite-country-27 | idle | composite-primary-21 | 2 | 1001 |
| 102 | MIL-2786 | seasonal-location-101 | primary-country-28 | decommissioned | primary-primary-22 | 3 | 1002 |
| 103 | MIL-2788 | regional-location-102 | adaptive-country-29 | active | adaptive-primary-23 | 4 | 1003 |

The `pulp_mills` table describes the manufacturing sites where recovery systems are deployed. Each mill carries a `mill_identifier` (e.g., `MIL-2782`, `MIL-2788`), a `location` string, a `country` descriptor, and an `operational_status` that can be `active`, `idle`, or `decommissioned`. The `primary_product` column names the mill's main output, such as `compact-primary-20` or `adaptive-primary-23`. Two foreign keys appear here: `heat_recovery_system_id` points back to the system table, and `steam_turbine_id` points to the `steam_turbines` table. This bidirectional linkage means a mill both hosts a recovery system and is served by a steam turbine. Mill 100 (`MIL-2782`) is active and produces `compact-primary-20`; mill 102 (`MIL-2786`) is decommissioned and produces `primary-primary-22`.

**Table `exhaust_streams`**

| id | stream_identifier | source_process | temperature | humidity_level | flow_rate | fouling_potential | heat_recovery_system_id | pulp_mill_id |
|---|---|---|---|---|---|---|---|---|
| 100 | STR-2595 | seasonal-source-77 | 1.33 | primary-humidity-46 | 11.45 | low | 1 | 100 |
| 101 | STR-2599 | regional-source-78 | 1.1714807757148185 | adaptive-humidity-47 | 15.90 | medium | 2 | 101 |
| 102 | STR-2603 | legacy-source-79 | 0.51 | distributed-humidity-48 | 20.35 | high | 3 | 102 |
| 103 | STR-2607 | compact-source-80 | 0.85 | baseline-humidity-49 | 24.80 | low | 4 | 103 |

Exhaust streams represent the hot waste-gas sources that feed heat recovery systems. The `exhaust_streams` table stores a `stream_identifier` (e.g., `STR-2595`, `STR-2607`), the `source_process` that generates the exhaust (such as `seasonal-source-77` or `compact-source-80`), and physical properties: `temperature` (a normalized float between 0.51 and 1.33), `humidity_level` (categorical values like `primary-humidity-46` or `baseline-humidity-49`), `flow_rate` (ranging from 11.45 to 24.80), and `fouling_potential` (`low`, `medium`, or `high`). The foreign key `heat_recovery_system_id` creates a one-to-one link to the recovery system, while `pulp_mill_id` redundantly anchors the stream to its host mill for query convenience. Stream 100 (`STR-2595`) originates from `seasonal-source-77` at a temperature of 1.33 with low fouling potential; stream 102 (`STR-2603`) comes from `legacy-source-79` at 0.51 with high fouling potential.

**Table `heat_sinks`**

| heat_sink_id | sink_identifier | sink_type | target_temperature | flow_volume | unit_count | heat_recovery_system_id | pulp_mill_id |
|---|---|---|---|---|---|---|---|
| 100 | SIN-2066 | air | 1.63 | 4.20 | 0 | 1 | 100 |
| 101 | SIN-2071 | water | 0.50102748 | 7.40 | 2 | 2 | 101 |
| 102 | SIN-2076 | steam | 0.286487255225401 | 10.60 | 7 | 3 | 102 |
| 103 | SIN-2081 | air | 0.02000001 | 13.80 | 5 | 4 | 103 |

Heat sinks are the thermal destinations where recovered heat is ultimately dissipated or reused. The `heat_sinks` table uses a composite primary key column named `heat_sink_id` alongside a human-readable `sink_identifier` (e.g., `SIN-2066`, `SIN-2081`). The `sink_type` enum distinguishes `air`, `water`, and `steam` sinks. The `target_temperature` column stores a normalized float, `flow_volume` records the thermal throughput, and `unit_count` indicates the number of physical units (values range from 0 to 7). Foreign keys `heat_recovery_system_id` and `pulp_mill_id` tie each sink to its parent system and mill. Sink 100 (`SIN-2066`) is an air sink with zero units; sink 102 (`SIN-2076`) is a steam sink with seven units.

**Table `steam_turbines`**

| id | turbine_identifier | power_output | steam_input_rate | operational_season | heat_sink_id | pulp_mill_id |
|---|---|---|---|---|---|---|
| 1000 | TUR-2119 | 14.95 | 13.20 | winter | 100 | 100 |
| 1001 | TUR-2122 | 18.90 | 16.40 | summer | 101 | 101 |
| 1002 | TUR-2125 | 22.85 | 19.60 | year-round | 102 | 102 |
| 1003 | TUR-2128 | 26.80 | 22.80 | winter | 103 | 103 |

Steam turbines augment the thermal cycle by converting waste steam into mechanical or electrical energy. The `steam_turbines` table stores a `turbine_identifier` (e.g., `TUR-2119`, `TUR-2128`), `power_output` (14.95 to 26.80), `steam_input_rate` (13.20 to 22.80), and `operational_season` (`winter`, `summer`, or `year-round`). The foreign key `heat_sink_id` links each turbine to a heat sink, and `pulp_mill_id` anchors it to the host mill. Turbine 1000 (`TUR-2119`) delivers 14.95 units of power output in winter; turbine 1003 (`TUR-2128`) delivers 26.80 units, also in winter.

**Table `process_waters`**

| id | water_identifier | usage_type | flow_rate | temperature | preheated_by | heat_recovery_system_id | pulp_mill_id |
|---|---|---|---|---|---|---|---|
| 1 | WAT-2792 | boiler_makeup | 11.45 | 1.33 | true | 1 | 100 |
| 2 | WAT-2794 | bleach_plant_makeup | 15.90 | 1.1714807757148185 | false | 2 | 101 |
| 3 | WAT-2796 | cooling | 20.35 | 0.51 | true | 3 | 102 |
| 4 | WAT-2798 | boiler_makeup | 24.80 | 0.85 | false | 4 | 103 |

Process waters capture the water streams within a pulp mill that benefit from preheating via heat recovery. The `process_waters` table stores a `water_identifier` (e.g., `WAT-2792`, `WAT-2798`), a `usage_type` enum (`boiler_makeup`, `bleach_plant_makeup`, `cooling`), `flow_rate`, `temperature`, a boolean `preheated_by` flag, and foreign keys `heat_recovery_system_id` and `pulp_mill_id`. Water 1 (`WAT-2792`) is boiler makeup water at flow rate 11.45, preheated by system 1; water 2 (`WAT-2794`) is bleach plant makeup at 15.90 flow rate, not preheated.

**Table `systems_sinks`**

| heat_recovery_system_id | heat_sink_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `systems_sinks` table is a junction table that materializes the many-to-many relationship between heat recovery systems and heat sinks. While the `heat_sinks` table already carries a `heat_recovery_system_id` foreign key suggesting a direct one-to-many composition, the presence of this explicit junction table indicates that the ontology allows a single system to be associated with multiple sinks through an intermediate relationship entity, or that the junction table captures additional relationship attributes not visible in the base column list. This design choice preserves referential flexibility while enabling efficient join-based queries that enumerate all sinks attached to a given system.

The denormalized views reconstruct domain facts by joining the normalized base tables. Each view answers a specific operational question by projecting the relevant columns from two or more tables into a single flat result set.

**View `vw_heat_recovery_system_pulp_mill`**

```sql
CREATE VIEW vw_heat_recovery_system_pulp_mill AS
SELECT a.id, a.system_identifier, a.system_model, a.design_capacity, b.id AS mill_id, b.mill_identifier AS mill_mill_identifier, b.location AS mill_location
FROM heat_recovery_systems a JOIN pulp_mills b ON a.pulp_mill_id = b.id;
```

| id | system_identifier | system_model | design_capacity | mill_id | mill_mill_identifier | mill_location |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | composite-system-93 | 12.45 | 100 | MIL-2782 | extended-location-99 |
| 2 | SYS-2051 | primary-system-94 | 14.90 | 101 | MIL-2784 | integrated-location-100 |
| 3 | SYS-2052 | adaptive-system-95 | 17.35 | 102 | MIL-2786 | seasonal-location-101 |
| 4 | SYS-2053 | distributed-system-96 | 19.80 | 103 | MIL-2788 | regional-location-102 |

This view joins `heat_recovery_systems` to `pulp_mills` on the shared `pulp_mill_id` key, answering the question "which pulp mill hosts which heat recovery system?" The result surface includes the system's `system_identifier`, `system_model`, `design_capacity`, `delivery_mode`, and `status` alongside the mill's `mill_identifier`, `location`, `country`, `operational_status`, and `primary_product`. A row for `SYS-2050` paired with `MIL-2782` tells an engineer that a planned composite system with 12.45 MW capacity is deployed at an active mill producing `compact-primary-20` in `compact-country-26`.

**View `vw_heat_recovery_system_exhaust_stream`**

```sql
CREATE VIEW vw_heat_recovery_system_exhaust_stream AS
SELECT a.id, a.system_identifier, a.system_model, a.design_capacity, b.id AS stream_id, b.stream_identifier AS stream_stream_identifier, b.source_process AS stream_source_process
FROM heat_recovery_systems a JOIN exhaust_streams b ON a.exhaust_stream_id = b.id;
```

| id | system_identifier | system_model | design_capacity | stream_id | stream_stream_identifier | stream_source_process |
|---|---|---|---|---|---|---|
| 1 | SYS-2050 | composite-system-93 | 12.45 | 100 | STR-2595 | seasonal-source-77 |
| 2 | SYS-2051 | primary-system-94 | 14.90 | 101 | STR-2599 | regional-source-78 |
| 3 | SYS-2052 | adaptive-system-95 | 17.35 | 102 | STR-2603 | legacy-source-79 |
| 4 | SYS-2053 | distributed-system-96 | 19.80 | 103 | STR-2607 | compact-source-80 |

By joining `heat_recovery_systems` to `exhaust_streams` on `heat_recovery_system_id`, this view answers "what exhaust stream feeds a given heat recovery system?" The projected columns include the system's identifiers and capacity alongside the stream's `source_process`, `temperature`, `humidity_level`, `flow_rate`, and `fouling_potential`. The row for `SYS-2050` and `STR-2595` reveals a system fed by `seasonal-source-77` at temperature 1.33 with low fouling potential and a flow rate of 11.45.

**View `vw_heat_recovery_system_heat_sink_detail`**

```sql
CREATE VIEW vw_heat_recovery_system_heat_sink_detail AS
SELECT a.id, a.system_identifier, a.system_model, b.heat_sink_id AS sink_heat_sink_id, b.sink_identifier AS sink_sink_identifier, b.sink_type AS sink_sink_type
FROM heat_recovery_systems a
  JOIN systems_sinks j ON j.heat_recovery_system_id = a.id
  JOIN heat_sinks b ON b.heat_sink_id = j.heat_sink_id;
```

| id | system_identifier | system_model | sink_heat_sink_id | sink_sink_identifier | sink_sink_type |
|---|---|---|---|---|---|
| 1 | SYS-2050 | composite-system-93 | 100 | SIN-2066 | air |
| 1 | SYS-2050 | composite-system-93 | 101 | SIN-2071 | water |
| 2 | SYS-2051 | primary-system-94 | 101 | SIN-2071 | water |
| 2 | SYS-2051 | primary-system-94 | 102 | SIN-2076 | steam |
| 3 | SYS-2052 | adaptive-system-95 | 102 | SIN-2076 | steam |
| 3 | SYS-2052 | adaptive-system-95 | 103 | SIN-2081 | air |
| 4 | SYS-2053 | distributed-system-96 | 103 | SIN-2081 | air |
| 4 | SYS-2053 | distributed-system-96 | 100 | SIN-2066 | air |

This view joins `heat_recovery_systems` to `heat_sinks` on `heat_recovery_system_id`, answering "what heat sinks are attached to a given recovery system?" The result includes the system's `system_identifier` and `design_capacity` alongside the sink's `sink_identifier`, `sink_type`, `target_temperature`, `flow_volume`, and `unit_count`. The row for `SYS-2050` and `SIN-2066` shows a system whose heat is dissipated through an air sink with zero physical units and a flow volume of 4.20.

**View `vw_pulp_mill_heat_recovery_system`**

```sql
CREATE VIEW vw_pulp_mill_heat_recovery_system AS
SELECT a.id, a.mill_identifier, a.location, a.country, b.id AS system_id, b.system_identifier AS system_system_identifier, b.system_model AS system_system_model
FROM pulp_mills a JOIN heat_recovery_systems b ON a.heat_recovery_system_id = b.id;
```

| id | mill_identifier | location | country | system_id | system_system_identifier | system_system_model |
|---|---|---|---|---|---|---|
| 100 | MIL-2782 | extended-location-99 | compact-country-26 | 1 | SYS-2050 | composite-system-93 |
| 101 | MIL-2784 | integrated-location-100 | composite-country-27 | 2 | SYS-2051 | primary-system-94 |
| 102 | MIL-2786 | seasonal-location-101 | primary-country-28 | 3 | SYS-2052 | adaptive-system-95 |
| 103 | MIL-2788 | regional-location-102 | adaptive-country-29 | 4 | SYS-2053 | distributed-system-96 |

This view performs the inverse join of `vw_heat_recovery_system_pulp_mill`, joining `pulp_mills` to `heat_recovery_systems` on `pulp_mill_id` to answer "which heat recovery systems are deployed at a given pulp mill?" The result surface mirrors the columns of the forward view but is ordered from the mill's perspective. Mill `MIL-2788` (active, producing `adaptive-primary-23`) is paired with system `SYS-2053`, an operational distributed system rated at 19.80 MW.

**View `vw_pulp_mill_steam_turbine`**

```sql
CREATE VIEW vw_pulp_mill_steam_turbine AS
SELECT a.id, a.mill_identifier, a.location, a.country, b.id AS turbine_id, b.turbine_identifier AS turbine_turbine_identifier, b.power_output AS turbine_power_output
FROM pulp_mills a JOIN steam_turbines b ON a.steam_turbine_id = b.id;
```

| id | mill_identifier | location | country | turbine_id | turbine_turbine_identifier | turbine_power_output |
|---|---|---|---|---|---|---|
| 100 | MIL-2782 | extended-location-99 | compact-country-26 | 1000 | TUR-2119 | 14.95 |
| 101 | MIL-2784 | integrated-location-100 | composite-country-27 | 1001 | TUR-2122 | 18.90 |
| 102 | MIL-2786 | seasonal-location-101 | primary-country-28 | 1002 | TUR-2125 | 22.85 |
| 103 | MIL-2788 | regional-location-102 | adaptive-country-29 | 1003 | TUR-2128 | 26.80 |

Joining `pulp_mills` to `steam_turbines` on `pulp_mill_id`, this view answers "which steam turbine serves a given pulp mill?" The result includes the mill's `mill_identifier`, `location`, `operational_status`, and `primary_product` alongside the turbine's `turbine_identifier`, `power_output`, `steam_input_rate`, and `operational_season`. Mill `MIL-2784` (idle, producing `composite-primary-21`) is served by turbine `TUR-2122`, which delivers 18.90 units of power output during summer.

**View `vw_exhaust_stream_heat_recovery_system`**

```sql
CREATE VIEW vw_exhaust_stream_heat_recovery_system AS
SELECT a.id, a.stream_identifier, a.source_process, a.temperature, b.id AS system_id, b.system_identifier AS system_system_identifier, b.system_model AS system_system_model
FROM exhaust_streams a JOIN heat_recovery_systems b ON a.heat_recovery_system_id = b.id;
```

| id | stream_identifier | source_process | temperature | system_id | system_system_identifier | system_system_model |
|---|---|---|---|---|---|---|
| 100 | STR-2595 | seasonal-source-77 | 1.33 | 1 | SYS-2050 | composite-system-93 |
| 101 | STR-2599 | regional-source-78 | 1.1714807757148185 | 2 | SYS-2051 | primary-system-94 |
| 102 | STR-2603 | legacy-source-79 | 0.51 | 3 | SYS-2052 | adaptive-system-95 |
| 103 | STR-2607 | compact-source-80 | 0.85 | 4 | SYS-2053 | distributed-system-96 |

This view joins `exhaust_streams` to `heat_recovery_systems` on `heat_recovery_system_id`, answering "which heat recovery system processes a given exhaust stream?" The result surface includes the stream's `stream_identifier`, `source_process`, `temperature`, `humidity_level`, `flow_rate`, and `fouling_potential` alongside the system's `system_identifier`, `system_model`, `design_capacity`, `delivery_mode`, and `status`. Stream `STR-2603` from `legacy-source-79` at temperature 0.51 with high fouling potential is processed by system `SYS-2052`, an adaptive system rated at 17.35 MW in the commissioned phase.

**View `vw_exhaust_stream_pulp_mill`**

```sql
CREATE VIEW vw_exhaust_stream_pulp_mill AS
SELECT a.id, a.stream_identifier, a.source_process, a.temperature, b.id AS mill_id, b.mill_identifier AS mill_mill_identifier, b.location AS mill_location
FROM exhaust_streams a JOIN pulp_mills b ON a.pulp_mill_id = b.id;
```

| id | stream_identifier | source_process | temperature | mill_id | mill_mill_identifier | mill_location |
|---|---|---|---|---|---|---|
| 100 | STR-2595 | seasonal-source-77 | 1.33 | 100 | MIL-2782 | extended-location-99 |
| 101 | STR-2599 | regional-source-78 | 1.1714807757148185 | 101 | MIL-2784 | integrated-location-100 |
| 102 | STR-2603 | legacy-source-79 | 0.51 | 102 | MIL-2786 | seasonal-location-101 |
| 103 | STR-2607 | compact-source-80 | 0.85 | 103 | MIL-2788 | regional-location-102 |

By joining `exhaust_streams` to `pulp_mills` on `pulp_mill_id`, this view answers "which pulp mill generates a given exhaust stream?" The result includes the stream's `stream_identifier`, `source_process`, `temperature`, `humidity_level`, `flow_rate`, and `fouling_potential` alongside the mill's `mill_identifier`, `location`, `country`, `operational_status`, and `primary_product`. Stream `STR-2607` from `compact-source-80` at temperature 0.85 with low fouling potential originates at mill `MIL-2788`, an active mill producing `adaptive-primary-23` in `adaptive-country-29`.

**View `vw_heat_sink_heat_recovery_system`**

```sql
CREATE VIEW vw_heat_sink_heat_recovery_system AS
SELECT a.heat_sink_id, a.sink_identifier, a.sink_type, a.target_temperature, b.id AS system_id, b.system_identifier AS system_system_identifier, b.system_model AS system_system_model
FROM heat_sinks a JOIN heat_recovery_systems b ON a.heat_recovery_system_id = b.id;
```

| heat_sink_id | sink_identifier | sink_type | target_temperature | system_id | system_system_identifier | system_system_model |
|---|---|---|---|---|---|---|
| 100 | SIN-2066 | air | 1.63 | 1 | SYS-2050 | composite-system-93 |
| 101 | SIN-2071 | water | 0.50102748 | 2 | SYS-2051 | primary-system-94 |
| 102 | SIN-2076 | steam | 0.286487255225401 | 3 | SYS-2052 | adaptive-system-95 |
| 103 | SIN-2081 | air | 0.02000001 | 4 | SYS-2053 | distributed-system-96 |

This view joins `heat_sinks` to `heat_recovery_systems` on `heat_recovery_system_id`, answering "which heat recovery system is associated with a given heat sink?" The result includes the sink's `sink_identifier`, `sink_type`, `target_temperature`, `flow_volume`, and `unit_count` alongside the system's `system_identifier`, `system_model`, `design_capacity`, `delivery_mode`, and `status`. Sink `SIN-2076`, a steam sink with seven units and flow volume 10.60, is associated with system `SYS-2052`, an adaptive system rated at 17.35 MW.

**View `vw_heat_sink_pulp_mill`**

```sql
CREATE VIEW vw_heat_sink_pulp_mill AS
SELECT a.heat_sink_id, a.sink_identifier, a.sink_type, a.target_temperature, b.id AS mill_id, b.mill_identifier AS mill_mill_identifier, b.location AS mill_location
FROM heat_sinks a JOIN pulp_mills b ON a.pulp_mill_id = b.id;
```

| heat_sink_id | sink_identifier | sink_type | target_temperature | mill_id | mill_mill_identifier | mill_location |
|---|---|---|---|---|---|---|
| 100 | SIN-2066 | air | 1.63 | 100 | MIL-2782 | extended-location-99 |
| 101 | SIN-2071 | water | 0.50102748 | 101 | MIL-2784 | integrated-location-100 |
| 102 | SIN-2076 | steam | 0.286487255225401 | 102 | MIL-2786 | seasonal-location-101 |
| 103 | SIN-2081 | air | 0.02000001 | 103 | MIL-2788 | regional-location-102 |

Joining `heat_sinks` to `pulp_mills` on `pulp_mill_id`, this view answers "which pulp mill hosts a given heat sink?" The result includes the sink's `sink_identifier`, `sink_type`, `target_temperature`, `flow_volume`, and `unit_count` alongside the mill's `mill_identifier`, `location`, `country`, `operational_status`, and `primary_product`. Sink `SIN-2081`, an air sink with five units and flow volume 13.80, is hosted by mill `MIL-2788`, an active mill producing `adaptive-primary-23`.

**View `vw_steam_turbine_heat_sink`**

```sql
CREATE VIEW vw_steam_turbine_heat_sink AS
SELECT a.id, a.turbine_identifier, a.power_output, a.steam_input_rate, b.heat_sink_id AS sink_heat_sink_id, b.sink_identifier AS sink_sink_identifier, b.sink_type AS sink_sink_type
FROM steam_turbines a JOIN heat_sinks b ON a.heat_sink_id = b.heat_sink_id;
```

| id | turbine_identifier | power_output | steam_input_rate | sink_heat_sink_id | sink_sink_identifier | sink_sink_type |
|---|---|---|---|---|---|---|
| 1000 | TUR-2119 | 14.95 | 13.20 | 100 | SIN-2066 | air |
| 1001 | TUR-2122 | 18.90 | 16.40 | 101 | SIN-2071 | water |
| 1002 | TUR-2125 | 22.85 | 19.60 | 102 | SIN-2076 | steam |
| 1003 | TUR-2128 | 26.80 | 22.80 | 103 | SIN-2081 | air |

This view joins `steam_turbines` to `heat_sinks` on `heat_sink_id`, answering "which heat sink is coupled to a given steam turbine?" The result includes the turbine's `turbine_identifier`, `power_output`, `steam_input_rate`, and `operational_season` alongside the sink's `sink_identifier`, `sink_type`, `target_temperature`, `flow_volume`, and `unit_count`. Turbine `TUR-2125` delivers 22.85 units of power output year-round and is coupled to sink `SIN-2076`, a steam sink with seven units.

**View `vw_steam_turbine_pulp_mill`**

```sql
CREATE VIEW vw_steam_turbine_pulp_mill AS
SELECT a.id, a.turbine_identifier, a.power_output, a.steam_input_rate, b.id AS mill_id, b.mill_identifier AS mill_mill_identifier, b.location AS mill_location
FROM steam_turbines a JOIN pulp_mills b ON a.pulp_mill_id = b.id;
```

| id | turbine_identifier | power_output | steam_input_rate | mill_id | mill_mill_identifier | mill_location |
|---|---|---|---|---|---|---|
| 1000 | TUR-2119 | 14.95 | 13.20 | 100 | MIL-2782 | extended-location-99 |
| 1001 | TUR-2122 | 18.90 | 16.40 | 101 | MIL-2784 | integrated-location-100 |
| 1002 | TUR-2125 | 22.85 | 19.60 | 102 | MIL-2786 | seasonal-location-101 |
| 1003 | TUR-2128 | 26.80 | 22.80 | 103 | MIL-2788 | regional-location-102 |

By joining `steam_turbines` to `pulp_mills` on `pulp_mill_id`, this view answers "which pulp mill is served by a given steam turbine?" The result includes the turbine's `turbine_identifier`, `power_output`, `steam_input_rate`, and `operational_season` alongside the mill's `mill_identifier`, `location`, `country`, `operational_status`, and `primary_product`. Turbine `TUR-2128` delivers 26.80 units of power output in winter and serves mill `MIL-2788`, an active mill producing `adaptive-primary-23`.

**View `vw_process_water_heat_recovery_system`**

```sql
CREATE VIEW vw_process_water_heat_recovery_system AS
SELECT a.id, a.water_identifier, a.usage_type, a.flow_rate, b.id AS system_id, b.system_identifier AS system_system_identifier, b.system_model AS system_system_model
FROM process_waters a JOIN heat_recovery_systems b ON a.heat_recovery_system_id = b.id;
```

| id | water_identifier | usage_type | flow_rate | system_id | system_system_identifier | system_system_model |
|---|---|---|---|---|---|---|
| 1 | WAT-2792 | boiler_makeup | 11.45 | 1 | SYS-2050 | composite-system-93 |
| 2 | WAT-2794 | bleach_plant_makeup | 15.90 | 2 | SYS-2051 | primary-system-94 |
| 3 | WAT-2796 | cooling | 20.35 | 3 | SYS-2052 | adaptive-system-95 |
| 4 | WAT-2798 | boiler_makeup | 24.80 | 4 | SYS-2053 | distributed-system-96 |

This view joins `process_waters` to `heat_recovery_systems` on `heat_recovery_system_id`, answering "which heat recovery system preheats a given process water stream?" The result includes the water's `water_identifier`, `usage_type`, `flow_rate`, `temperature`, and `preheated_by` flag alongside the system's `system_identifier`, `system_model`, `design_capacity`, `delivery_mode`, and `status`. Water `WAT-2792`, boiler makeup at flow rate 11.45, is preheated by system `SYS-2050`, a planned composite system rated at 12.45 MW.

**View `vw_process_water_pulp_mill`**

```sql
CREATE VIEW vw_process_water_pulp_mill AS
SELECT a.id, a.water_identifier, a.usage_type, a.flow_rate, b.id AS mill_id, b.mill_identifier AS mill_mill_identifier, b.location AS mill_location
FROM process_waters a JOIN pulp_mills b ON a.pulp_mill_id = b.id;
```

| id | water_identifier | usage_type | flow_rate | mill_id | mill_mill_identifier | mill_location |
|---|---|---|---|---|---|---|
| 1 | WAT-2792 | boiler_makeup | 11.45 | 100 | MIL-2782 | extended-location-99 |
| 2 | WAT-2794 | bleach_plant_makeup | 15.90 | 101 | MIL-2784 | integrated-location-100 |
| 3 | WAT-2796 | cooling | 20.35 | 102 | MIL-2786 | seasonal-location-101 |
| 4 | WAT-2798 | boiler_makeup | 24.80 | 103 | MIL-2788 | regional-location-102 |

Joining `process_waters` to `pulp_mills` on `pulp_mill_id`, this view answers "which pulp mill uses a given process water stream?" The result includes the water's `water_identifier`, `usage_type`, `flow_rate`, `temperature`, and `preheated_by` flag alongside the mill's `mill_identifier`, `location`, `country`, `operational_status`, and `primary_product`. Water `WAT-2796`, cooling water at flow rate 20.35, is used at mill `MIL-2786`, a decommissioned mill producing `primary-primary-22`.

The schema design for heat recovery in pulp manufacturing demonstrates how an ontology with six entity types and multiple binary relationships materializes into a clean, normalized relational structure. The seven base tables enforce referential integrity through foreign keys that bind heat recovery systems to their source mills and exhaust streams, link heat sinks to their parent systems, and associate steam turbines with both sinks and mills. The twenty denormalized views serve as the query surface, each reconstructing a specific domain fact by joining two base tables on their shared key. This separation of concerns—normalized storage for correctness, denormalized views for usability—ensures that mill engineers can answer operational questions about system-mill pairings, exhaust stream characteristics, heat sink capacities, and process water preheating without writing complex joins themselves. The model faithfully represents the domain's cardinality constraints: each system has exactly one source mill and one exhaust stream, each mill hosts one system and one turbine, and each sink is attached to one system, while junction tables like `systems_sinks` preserve the flexibility for future many-to-many expansions.