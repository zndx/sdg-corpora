Heat recovery in industrial pulp and paper operations represents a critical intersection of thermodynamics, process engineering, and energy economics. Pulp mills generate substantial waste heat through exhaust streams, steam turbines, and process water circuits. Capturing this thermal energy and redirecting it to useful sinks—whether air preheating, water heating, or steam generation—reduces fuel consumption and operational costs. The records maintained across these systems document every installed unit, its operating parameters, and the complex web of connections between heat sources and heat sinks within each facility.

## Heat Recovery Systems

The backbone of thermal energy capture in a pulp mill is the heat recovery system itself. Each unit is catalogued with a unique identifier, a model designation, and a design capacity measured in megawatts thermal. The commissioning date marks when the system entered service, while the delivery mode describes how it was deployed—whether as a turn-key installation, a phased rollout, or a modular assembly. The operational status tracks whether the system is planned, installed, commissioned, or fully operational.

**Table `heat_recovery_systems`**

| id | system_identifier | system_model | design_capacity | commissioning_date | delivery_mode | status | pulp_mill_id | exhaust_stream_id |
|---|---|---|---|---|---|---|---|---|
| 1 | SYS-2050 | composite-system-93 | 12.45 | 2025-12-03T11:57:00 | turn-key | planned | 100 | 100 |
| 2 | SYS-2051 | primary-system-94 | 14.90 | 2022-05-14T18:14:00 | phased | installed | 101 | 101 |
| 3 | SYS-2052 | adaptive-system-95 | 17.35 | 2023-10-25T01:31:00 | modular | commissioned | 102 | 102 |
| 4 | SYS-2053 | distributed-system-96 | 19.80 | 2024-03-09T08:48:00 | turn-key | operational | 103 | 103 |

The four systems in the registry span a design capacity range from 12.45 MW to 19.80 MW. System SYS-2050, a composite-system-93 model, was commissioned in December 2025 under a turn-key delivery arrangement and remains in a planned state. By contrast, SYS-2053—a distributed-system-96 with the highest design capacity at 19.80 MW—achieved operational status in March 2024, also delivered as a turn-key project. The phased delivery of SYS-2051 and the modular approach for SYS-2052 illustrate the range of deployment strategies available to mill operators.

## Pulp Mill Infrastructure

Each heat recovery system operates within the context of a specific pulp mill. The pulp mill records capture the facility identifier, geographic location, country, and operational status alongside the primary product category the mill produces. The mill also tracks which heat recovery system and steam turbine are assigned to it, establishing the primary energy chain.

**Table `pulp_mills`**

| id | mill_identifier | location | country | operational_status | primary_product | heat_recovery_system_id | steam_turbine_id |
|---|---|---|---|---|---|---|---|
| 100 | MIL-2782 | extended-location-99 | compact-country-26 | active | compact-primary-20 | 1 | 1000 |
| 101 | MIL-2784 | integrated-location-100 | composite-country-27 | idle | composite-primary-21 | 2 | 1001 |
| 102 | MIL-2786 | seasonal-location-101 | primary-country-28 | decommissioned | primary-primary-22 | 3 | 1002 |
| 103 | MIL-2788 | regional-location-102 | adaptive-country-29 | active | adaptive-primary-23 | 4 | 1003 |

Four mills appear in the registry, identified as MIL-2782 through MIL-2788. Their operational statuses vary: MIL-2782 and MIL-2788 are active, MIL-2784 is idle, and MIL-2786 has been decommissioned. The primary products range from compact-primary-20 to adaptive-primary-23, reflecting the diversity of output across facilities. Each mill is linked to exactly one heat recovery system and one steam turbine, forming the core energy infrastructure of the operation.

## Exhaust Streams

Waste heat originates from specific source processes within the mill. The exhaust stream records document the thermal characteristics of these streams: temperature, humidity level, flow rate, and fouling potential. The fouling potential—classified as low, medium, or high—indicates the likelihood of particulate or chemical deposits accumulating on heat exchange surfaces, which directly affects maintenance intervals and heat transfer efficiency.

**Table `exhaust_streams`**

| id | stream_identifier | source_process | temperature | humidity_level | flow_rate | fouling_potential | heat_recovery_system_id | pulp_mill_id |
|---|---|---|---|---|---|---|---|---|
| 100 | STR-2595 | seasonal-source-77 | 1.33 | primary-humidity-46 | 11.45 | low | 1 | 100 |
| 101 | STR-2599 | regional-source-78 | 1.1714807757148185 | adaptive-humidity-47 | 15.90 | medium | 2 | 101 |
| 102 | STR-2603 | legacy-source-79 | 0.51 | distributed-humidity-48 | 20.35 | high | 3 | 102 |
| 103 | STR-2607 | compact-source-80 | 0.85 | baseline-humidity-49 | 24.80 | low | 4 | 103 |

Stream STR-2595, originating from a seasonal-source-77 process, operates at a temperature of 1.33 with a flow rate of 11.45 and carries a low fouling potential. Stream STR-2603, drawn from a legacy-source-79 process, presents the highest fouling risk at high potential, with a temperature of 0.51 and the largest flow rate of 20.35. The humidity levels—ranging from baseline-humidity-49 to primary-humidity-46—add another dimension to the thermal profile that recovery system designers must account for.

## Heat Sinks

Once heat is extracted from exhaust streams, it must be delivered to a destination. Heat sinks represent these destinations, and each is characterized by its type—air, water, or steam—along with a target temperature, flow volume, and the number of units deployed. The sink type determines the heat transfer medium and the engineering approach required for integration.

**Table `heat_sinks`**

| heat_sink_id | sink_identifier | sink_type | target_temperature | flow_volume | unit_count | heat_recovery_system_id | pulp_mill_id |
|---|---|---|---|---|---|---|---|
| 100 | SIN-2066 | air | 1.63 | 4.20 | 0 | 1 | 100 |
| 101 | SIN-2071 | water | 0.50102748 | 7.40 | 2 | 2 | 101 |
| 102 | SIN-2076 | steam | 0.286487255225401 | 10.60 | 7 | 3 | 102 |
| 103 | SIN-2081 | air | 0.02000001 | 13.80 | 5 | 4 | 103 |

The sink inventory includes both air-based and water-based sinks, as well as a steam sink. SIN-2066 is an air sink with a target temperature of 1.63 and a flow volume of 4.20, operating with zero units in its count. SIN-2076, a steam sink, carries the lowest target temperature at 0.286 and the highest unit count at seven, with a flow volume of 10.60. SIN-2081, another air sink, operates at a target temperature of just 0.02 with five units and a flow volume of 13.80.

## Steam Turbines

Steam turbines convert thermal energy into mechanical power, and their performance is captured through power output, steam input rate, and the operational season during which they are active. Each turbine is associated with a specific heat sink and pulp mill, completing the energy conversion chain from waste heat to usable power.

**Table `steam_turbines`**

| id | turbine_identifier | power_output | steam_input_rate | operational_season | heat_sink_id | pulp_mill_id |
|---|---|---|---|---|---|---|
| 1000 | TUR-2119 | 14.95 | 13.20 | winter | 100 | 100 |
| 1001 | TUR-2122 | 18.90 | 16.40 | summer | 101 | 101 |
| 1002 | TUR-2125 | 22.85 | 19.60 | year-round | 102 | 102 |
| 1003 | TUR-2128 | 26.80 | 22.80 | winter | 103 | 103 |

The four turbines—TUR-2119 through TUR-2128—show a clear progression in both power output and steam input. TUR-2119 delivers 14.95 units of power from a steam input of 13.20 during winter operations. TUR-2128, the most powerful at 26.80 output and 22.80 input, also operates in winter. TUR-2125 stands out as the only year-round turbine, producing 22.85 units of power from 19.60 units of steam input.

## Process Waters

Process water circuits within pulp mills often serve as both heat consumers and heat sources. The process waters table records the usage type—such as boiler makeup, bleach plant makeup, or cooling—along with flow rate, temperature, and whether the water is preheated by the heat recovery system. This preheating status is a key indicator of thermal integration depth.

**Table `process_waters`**

| id | water_identifier | usage_type | flow_rate | temperature | preheated_by | heat_recovery_system_id | pulp_mill_id |
|---|---|---|---|---|---|---|---|
| 1 | WAT-2792 | boiler_makeup | 11.45 | 1.33 | true | 1 | 100 |
| 2 | WAT-2794 | bleach_plant_makeup | 15.90 | 1.1714807757148185 | false | 2 | 101 |
| 3 | WAT-2796 | cooling | 20.35 | 0.51 | true | 3 | 102 |
| 4 | WAT-2798 | boiler_makeup | 24.80 | 0.85 | false | 4 | 103 |

Water WAT-2792, used for boiler makeup, flows at 11.45 with a temperature of 1.33 and is preheated by the recovery system. WAT-2794, designated for bleach plant makeup, flows at 15.90 and is not preheated. WAT-2796, used in cooling applications, flows at 20.35 and is preheated, while WAT-2798, another boiler makeup stream, flows at 24.80 and is not preheated. The preheating decisions directly affect the thermal load on the recovery system and the overall energy balance of the mill.

## Systems and Sinks

The systems_sinks table documents the explicit pairing of heat recovery systems with their designated heat sinks. This linkage is essential for understanding which recovery unit supplies thermal energy to which sink, and at which pulp mill the connection operates.

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

Each of the four heat recovery systems is paired with a corresponding heat sink. System 1 connects to sink 100, system 2 to sink 101, system 3 to sink 102, and system 4 to sink 103. These pairings form the direct thermal supply chain that the recovery system design intends to realize.

## Mill-to-System Relationships

The view joining pulp mills with their heat recovery systems answers the fundamental question of which thermal capture infrastructure serves each facility. It consolidates mill identifiers, locations, operational status, and product type alongside the system identifier, model, capacity, and delivery mode.

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

Row data from this view reveals that MIL-2782, an active mill producing compact-primary-20, is served by SYS-2050, a composite-system-93 with a design capacity of 12.45 delivered as turn-key. MIL-2788, also active and producing adaptive-primary-23, relies on SYS-2053, the highest-capacity distributed-system-96 at 19.80. The idle mill MIL-2784 and the decommissioned MIL-2786 remain linked to SYS-2051 and SYS-2052 respectively, preserving the historical infrastructure mapping even as operational status changes.

## Exhaust-to-System Relationships

This view connects exhaust streams to their associated heat recovery systems, revealing which waste heat sources feed which capture units. It brings together stream identifiers, source processes, temperature, humidity, flow rate, and fouling potential alongside the system details.

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

The joined records show that STR-2595, a seasonal-source-77 exhaust at temperature 1.35 with low fouling potential, feeds into SYS-2050. STR-2603, a legacy-source-79 stream with high fouling potential and the highest flow rate of 20.35, is assigned to SYS-2052. The fouling classification directly informs the maintenance strategy for each recovery system—high-fouling streams demand more frequent cleaning and potentially larger heat exchange surfaces.

## Heat Sink-to-System Relationships

This view maps heat sinks to the recovery systems that supply them, providing a clear picture of the thermal delivery network. It combines sink type, target temperature, flow volume, and unit count with the recovery system's capacity and status.

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

SIN-2066, an air sink with target temperature 1.63, receives heat from SYS-2050, which operates at a design capacity of 12.45. SIN-2076, a steam sink with the highest unit count of seven, is supplied by SYS-2052, a commissioned adaptive-system-95. The alignment between sink type and system capacity is a key design consideration—steam sinks require higher temperature lifts than air sinks, and the system design capacity must accommodate this demand.

## Steam Turbine-to-Sink Relationships

This view links steam turbines to their associated heat sinks, showing how recovered thermal energy is converted to mechanical power. It brings together turbine power output, steam input rate, and operational season alongside sink characteristics.

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

TUR-2119, producing 14.95 units of power from 13.20 units of steam input during winter, is paired with SIN-2066, an air sink. TUR-2125, the year-round turbine delivering 22.85 units of power, connects to SIN-2076, a steam sink with seven units. The operational season of the turbine must align with the seasonal availability of the heat source and the demand profile of the sink.

## Process Water-to-System Relationships

This view reveals which process water circuits are served by which heat recovery systems. It combines water usage type, flow rate, temperature, and preheating status with the recovery system's capacity and delivery mode.

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

WAT-2792, a boiler makeup water stream at flow rate 11.45 that is preheated, is served by SYS-2050. WAT-2796, a cooling water stream at 20.35 flow that is also preheated, connects to SYS-2052. The preheated streams represent direct thermal integration, where waste heat displaces the need for primary fuel in water heating. The non-preheated streams—WAT-2794 and WAT-2798—indicate opportunities for future thermal integration upgrades.

## Closing Synthesis

The heat recovery infrastructure of a pulp mill is a tightly coupled network of waste heat sources, capture systems, delivery sinks, and energy conversion equipment. Each record in the registry—from the commissioning date of a recovery system to the fouling potential of an exhaust stream—captures a decision point in the thermal design. The operational statuses, delivery modes, and preheating flags tell the story of an evolving energy strategy, where active mills like MIL-2782 and MIL-2788 leverage their recovery systems to reduce fuel consumption, while idle and decommissioned facilities preserve their infrastructure records for historical analysis and potential reactivation. The views that join these tables provide the operational lens through which engineers assess whether the right heat source feeds the right recovery system, which sink receives the recovered energy, and how process water circuits benefit from thermal integration.

## Data appendix

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
