The laser diode module domain captures the engineering and commercial attributes of optoelectronic components used in medical, sensing, and industrial applications. At its core, the model revolves around `laser_diode_modules` — discrete semiconductor devices characterized by optical output, electrical thresholds, and physical packaging. Each module is not an isolated part; it is assembled with a `fiber_assembly`, terminated with a `fiber_connector`, housed in a `package_style`, qualified against an `environmental_specification`, and assigned to one or more `application_domains`. The relational schema normalizes these concerns into six base tables linked by foreign keys, and materializes six denormalized views that reconstruct domain facts for reporting and analysis.

## Base tables and entity types

The central entity is `laser_diode_modules`. Its columns encode the electrical and optical performance envelope of each device. The `part_number` column (e.g. `PAR-2291`, `PAR-2297`, `PAR-2303`, `PAR-2309`) serves as the primary key and the universal identifier across all tables. Optical performance is captured by `center_wavelength` (ranging from 23.70 to 37.80), `output_power` (20.70 to 34.80), and `threshold_current` (9.45 to 22.80). Electrical operating parameters include `operating_current` (9.70 to 14.80), `operating_voltage` (21.95 to 33.80), `monitor_current` (5.95 to 17.80), and `pd_reverse_voltage` (16.70 to 24.80). Three of these columns — `fiber_assembly_id`, `package_style_id`, and `fiber_connector_id` — are foreign keys that bind the module to its mechanical and optical sub-components.

**Table `laser_diode_modules`**

| part_number | center_wavelength | output_power | threshold_current | operating_current | operating_voltage | monitor_current | pd_reverse_voltage | fiber_assembly_id | package_style_id | fiber_connector_id |
|---|---|---|---|---|---|---|---|---|---|---|
| PAR-2291 | 23.70 | 20.70 | 9.45 | 9.70 | 21.95 | 5.95 | 16.70 | 1 | 1 | 1 |
| PAR-2297 | 28.40 | 25.40 | 13.90 | 11.40 | 25.90 | 9.90 | 19.40 | 2 | 2 | 2 |
| PAR-2303 | 33.10 | 30.10 | 18.35 | 13.10 | 29.85 | 13.85 | 22.10 | 3 | 3 | 3 |
| PAR-2309 | 37.80 | 34.80 | 22.80 | 14.80 | 33.80 | 17.80 | 24.80 | 4 | 4 | 4 |

The `fiber_assemblies` table describes the optical fiber sub-assembly mated to each module. Its primary key is `fiber_assembly_id`, and it stores `fiber_type` (such as `pilot-fiber-80` or `extended-fiber-81`), `fiber_core` (e.g. `pilot-fiber-68`), and `fiber_length` (measured in meters, with values like 0.6000001 and 0.42195992). The column `laser_diode_module_part_number` is a foreign key referencing `laser_diode_modules.part_number`, establishing a one-to-one mating between module and fiber. Timestamps `created_at` and `updated_at` record the lifecycle of each assembly record.

**Table `fiber_assemblies`**

| fiber_assembly_id | fiber_type | fiber_core | fiber_length | laser_diode_module_part_number | created_at | updated_at |
|---|---|---|---|---|---|---|
| 1 | pilot-fiber-80 | pilot-fiber-68 | 0.6000001 | PAR-2291 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | extended-fiber-81 | extended-fiber-69 | 0.6 | PAR-2297 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | integrated-fiber-82 | integrated-fiber-70 | 0.42195992 | PAR-2303 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | seasonal-fiber-83 | seasonal-fiber-71 | 0.42195992 | PAR-2309 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Packaging is abstracted into the `package_styles` lookup table. Its primary key `id` maps to `laser_diode_modules.package_style_id`. The `style_name` column carries human-readable identifiers such as `Integrated Model A`, `Extended Cluster`, `Pilot Review`, and `Baseline Initiative D`. The `pin_configuration` column (e.g. `extended-pin-21`, `integrated-pin-22`) encodes the electrical pinout layout.

**Table `package_styles`**

| id | style_name | pin_configuration |
|---|---|---|
| 1 | Integrated Model A | extended-pin-21 |
| 2 | Extended Cluster | integrated-pin-22 |
| 3 | Pilot Review | seasonal-pin-23 |
| 4 | Baseline Initiative D | regional-pin-24 |

Fiber termination hardware is captured in `fiber_connectors`. Its primary key `id` is referenced by `laser_diode_modules.fiber_connector_id`. The single attribute column `connector_type` holds values like `compact-connecto-92`, `composite-connecto-93`, `primary-connecto-94`, and `adaptive-connecto-95`. This is a flat lookup table — one row per connector type, no additional attributes.

**Table `fiber_connectors`**

| id | connector_type |
|---|---|
| 1 | compact-connecto-92 |
| 2 | composite-connecto-93 |
| 3 | primary-connecto-94 |
| 4 | adaptive-connecto-95 |

Environmental qualification is stored in `environmental_specifications`. Its primary key is `environmental_specification_id`, and the foreign key `laser_diode_module_part_number` references `laser_diode_modules.part_number`. Temperature ranges are captured in pairs: `operating_temperature_min` and `operating_temperature_max` (e.g. 0.77 °C to 12.45 °C for the first module), `storage_temperature_min` and `storage_temperature_max` (e.g. 0.351342673308077 °C to 6.45 °C), and soldering parameters `soldering_temperature` (13.45 °C) and `soldering_duration` (3.70 seconds). The narrow temperature bands suggest these modules are qualified for controlled-environment applications rather than outdoor deployment.

**Table `environmental_specifications`**

| environmental_specification_id | operating_temperature_min | operating_temperature_max | storage_temperature_min | storage_temperature_max | soldering_temperature | soldering_duration | laser_diode_module_part_number |
|---|---|---|---|---|---|---|---|
| 1 | 0.77 | 12.45 | 0.351342673308077 | 6.45 | 13.45 | 3.70 | PAR-2291 |
| 2 | 0.74 | 16.90 | 1.24 | 10.90 | 16.90 | 5.40 | PAR-2297 |
| 3 | 0.48 | 21.35 | 0.83 | 15.35 | 20.35 | 7.10 | PAR-2303 |
| 4 | 1.02669 | 25.80 | 0.6000001 | 19.80 | 23.80 | 8.80 | PAR-2309 |

Application domains are recorded in `application_domains`, a many-to-many bridge table. Its primary key is `application_domain_id`, and the foreign key `laser_diode_module_part_number` references `laser_diode_modules.part_number`. The `domain_name` column carries values such as `Medical laser treatment` and `Sensor`. The data shows that `PAR-2291` and `PAR-2303` are both assigned to `Medical laser treatment`, while `PAR-2297` and `PAR-2309` are assigned to `Sensor`, indicating that a single module can serve multiple domains and a single domain can encompass multiple modules.

**Table `application_domains`**

| application_domain_id | domain_name | laser_diode_module_part_number |
|---|---|---|
| 1000 | Medical laser treatment | PAR-2291 |
| 1001 | Sensor | PAR-2297 |
| 1002 | Medical laser treatment | PAR-2303 |
| 1003 | Sensor | PAR-2309 |

## Foreign-key topology and cardinality

The foreign-key graph forms a star centered on `laser_diode_modules`. Three one-to-one relationships radiate outward: each module has exactly one fiber assembly (enforced by the `fiber_assembly_id` FK in `laser_diode_modules` and the reciprocal `laser_diode_module_part_number` FK in `fiber_assemblies`), exactly one package style (via `package_style_id` → `package_styles.id`), and exactly one fiber connector (via `fiber_connector_id` → `fiber_connectors.id`). The cardinality is one-to-one because the data shows a single row per module in each of these tables, and the FK columns in `laser_diode_modules` are single-valued rather than multi-valued.

Two relationships are one-to-many. The `environmental_specifications` table references `laser_diode_modules` through `laser_diode_module_part_number`, and the data shows one specification row per module — suggesting a one-to-one constraint in practice, though the schema permits multiple environmental profiles per module. The `application_domains` table also references `laser_diode_module_part_number`, and its design as a separate table with its own surrogate key (`application_domain_id`) signals a true many-to-many relationship: a module can appear in multiple domain rows, and a domain name can appear across multiple modules.

## Denormalized views

The six views materialize the normalized facts into flat, query-ready structures. Each view answers a specific analytical question by joining the central module table to one or more related tables.

The view `v_laser_diode_module_fiber_assembly` reconstructs the module-to-fiber mating. It joins `laser_diode_modules` to `fiber_assemblies` on the reciprocal FK pair (`laser_diode_modules.fiber_assembly_id` = `fiber_assemblies.fiber_assembly_id` and `fiber_assemblies.laser_diode_module_part_number` = `laser_diode_modules.part_number`). The resulting row for `PAR-2291` tells us that this module, with a center wavelength of 23.70 and output power of 20.70, is mated to a `pilot-fiber-80` assembly with core `pilot-fiber-68` and length 0.6000001 meters, created on 2025-01-01. The view answers the question: "What fiber sub-assembly is paired with each laser diode module, and what are the optical and electrical specs of that pair?"

**View `v_laser_diode_module_fiber_assembly`**

```sql
CREATE VIEW v_laser_diode_module_fiber_assembly AS
SELECT a.part_number, a.center_wavelength, a.output_power, a.threshold_current, b.fiber_assembly_id AS assembly_fiber_assembly_id, b.fiber_type AS assembly_fiber_type, b.fiber_core AS assembly_fiber_core
FROM laser_diode_modules a JOIN fiber_assemblies b ON a.fiber_assembly_id = b.fiber_assembly_id;
```

| part_number | center_wavelength | output_power | threshold_current | assembly_fiber_assembly_id | assembly_fiber_type | assembly_fiber_core |
|---|---|---|---|---|---|---|
| PAR-2291 | 23.70 | 20.70 | 9.45 | 1 | pilot-fiber-80 | pilot-fiber-68 |
| PAR-2297 | 28.40 | 25.40 | 13.90 | 2 | extended-fiber-81 | extended-fiber-69 |
| PAR-2303 | 33.10 | 30.10 | 18.35 | 3 | integrated-fiber-82 | integrated-fiber-70 |
| PAR-2309 | 37.80 | 34.80 | 22.80 | 4 | seasonal-fiber-83 | seasonal-fiber-71 |

The view `v_laser_diode_module_package_style` joins `laser_diode_modules` to `package_styles` on `laser_diode_modules.package_style_id` = `package_styles.id`. For `PAR-2297`, the row reveals that this module (center wavelength 28.40, output power 25.40) is housed in the `Extended Cluster` package with `integrated-pin-22` pin configuration. The view answers: "Which package style and pin layout is used for each module?"

**View `v_laser_diode_module_package_style`**

```sql
CREATE VIEW v_laser_diode_module_package_style AS
SELECT a.part_number, a.center_wavelength, a.output_power, a.threshold_current, b.id AS style_id, b.style_name AS style_style_name, b.pin_configuration AS style_pin_configuration
FROM laser_diode_modules a JOIN package_styles b ON a.package_style_id = b.id;
```

| part_number | center_wavelength | output_power | threshold_current | style_id | style_style_name | style_pin_configuration |
|---|---|---|---|---|---|---|
| PAR-2291 | 23.70 | 20.70 | 9.45 | 1 | Integrated Model A | extended-pin-21 |
| PAR-2297 | 28.40 | 25.40 | 13.90 | 2 | Extended Cluster | integrated-pin-22 |
| PAR-2303 | 33.10 | 30.10 | 18.35 | 3 | Pilot Review | seasonal-pin-23 |
| PAR-2309 | 37.80 | 34.80 | 22.80 | 4 | Baseline Initiative D | regional-pin-24 |

The view `v_laser_diode_module_fiber_connector` joins `laser_diode_modules` to `fiber_connectors` on `laser_diode_modules.fiber_connector_id` = `fiber_connectors.id`. For `PAR-2303`, the row shows this module (center wavelength 33.10, output power 30.10) terminates with a `primary-connecto-94` connector. The view answers: "What fiber connector type is specified for each module?"

**View `v_laser_diode_module_fiber_connector`**

```sql
CREATE VIEW v_laser_diode_module_fiber_connector AS
SELECT a.part_number, a.center_wavelength, a.output_power, a.threshold_current, b.id AS connector_id, b.connector_type AS connector_connector_type
FROM laser_diode_modules a JOIN fiber_connectors b ON a.fiber_connector_id = b.id;
```

| part_number | center_wavelength | output_power | threshold_current | connector_id | connector_connector_type |
|---|---|---|---|---|---|
| PAR-2291 | 23.70 | 20.70 | 9.45 | 1 | compact-connecto-92 |
| PAR-2297 | 28.40 | 25.40 | 13.90 | 2 | composite-connecto-93 |
| PAR-2303 | 33.10 | 30.10 | 18.35 | 3 | primary-connecto-94 |
| PAR-2309 | 37.80 | 34.80 | 22.80 | 4 | adaptive-connecto-95 |

The view `v_fiber_assembly_laser_diode_module` is the inverse perspective of the first view. It joins `fiber_assemblies` to `laser_diode_modules` and presents the fiber assembly as the primary entity, with the module's electrical and optical attributes appended. For the assembly with `fiber_assembly_id` 3 (type `integrated-fiber-82`, core `integrated-fiber-70`, length 0.42195992), the row shows it is mated to module `PAR-2303` with operating voltage 29.85 and monitor current 13.85. This view answers: "From the fiber assembly's perspective, which laser diode module is it connected to, and what are that module's specs?"

**View `v_fiber_assembly_laser_diode_module`**

```sql
CREATE VIEW v_fiber_assembly_laser_diode_module AS
SELECT a.fiber_assembly_id, a.fiber_type, a.fiber_core, a.fiber_length, b.part_number AS module_part_number, b.center_wavelength AS module_center_wavelength, b.output_power AS module_output_power
FROM fiber_assemblies a JOIN laser_diode_modules b ON a.laser_diode_module_part_number = b.part_number;
```

| fiber_assembly_id | fiber_type | fiber_core | fiber_length | module_part_number | module_center_wavelength | module_output_power |
|---|---|---|---|---|---|---|
| 1 | pilot-fiber-80 | pilot-fiber-68 | 0.6000001 | PAR-2291 | 23.70 | 20.70 |
| 2 | extended-fiber-81 | extended-fiber-69 | 0.6 | PAR-2297 | 28.40 | 25.40 |
| 3 | integrated-fiber-82 | integrated-fiber-70 | 0.42195992 | PAR-2303 | 33.10 | 30.10 |
| 4 | seasonal-fiber-83 | seasonal-fiber-71 | 0.42195992 | PAR-2309 | 37.80 | 34.80 |

The view `v_environmental_specification_laser_diode_module` joins `environmental_specifications` to `laser_diode_modules` on `environmental_specifications.laser_diode_module_part_number` = `laser_diode_modules.part_number`. For `PAR-2309`, the row reveals that this module (center wavelength 37.80, output power 34.80) is qualified for an operating temperature range of 1.02669 °C to 25.80 °C, a storage range of 0.6000001 °C to 19.80 °C, and a soldering profile of 23.80 °C for 8.80 seconds. The view answers: "What are the environmental and thermal qualification limits for each module?"

**View `v_environmental_specification_laser_diode_module`**

```sql
CREATE VIEW v_environmental_specification_laser_diode_module AS
SELECT a.environmental_specification_id, a.operating_temperature_min, a.operating_temperature_max, a.storage_temperature_min, b.part_number AS module_part_number, b.center_wavelength AS module_center_wavelength, b.output_power AS module_output_power
FROM environmental_specifications a JOIN laser_diode_modules b ON a.laser_diode_module_part_number = b.part_number;
```

| environmental_specification_id | operating_temperature_min | operating_temperature_max | storage_temperature_min | module_part_number | module_center_wavelength | module_output_power |
|---|---|---|---|---|---|---|
| 1 | 0.77 | 12.45 | 0.351342673308077 | PAR-2291 | 23.70 | 20.70 |
| 2 | 0.74 | 16.90 | 1.24 | PAR-2297 | 28.40 | 25.40 |
| 3 | 0.48 | 21.35 | 0.83 | PAR-2303 | 33.10 | 30.10 |
| 4 | 1.02669 | 25.80 | 0.6000001 | PAR-2309 | 37.80 | 34.80 |

The view `v_application_domain_laser_diode_module` joins `application_domains` to `laser_diode_modules` on `application_domains.laser_diode_module_part_number` = `laser_diode_modules.part_number`. For `PAR-2291`, the row shows this module (center wavelength 23.70, output power 20.70) is designated for `Medical laser treatment`. For `PAR-2297`, the same module is designated for `Sensor`. Because `application_domains` is a many-to-many bridge, a single module can appear in multiple rows of this view — one per domain assignment. The view answers: "Which application domains is each laser diode module assigned to?"

**View `v_application_domain_laser_diode_module`**

```sql
CREATE VIEW v_application_domain_laser_diode_module AS
SELECT a.application_domain_id, a.domain_name, b.part_number AS module_part_number, b.center_wavelength AS module_center_wavelength, b.output_power AS module_output_power
FROM application_domains a JOIN laser_diode_modules b ON a.laser_diode_module_part_number = b.part_number;
```

| application_domain_id | domain_name | module_part_number | module_center_wavelength | module_output_power |
|---|---|---|---|---|
| 1000 | Medical laser treatment | PAR-2291 | 23.70 | 20.70 |
| 1001 | Sensor | PAR-2297 | 28.40 | 25.40 |
| 1002 | Medical laser treatment | PAR-2303 | 33.10 | 30.10 |
| 1003 | Sensor | PAR-2309 | 37.80 | 34.80 |

## Synthesis

The schema models the laser diode module domain as a central entity (`laser_diode_modules`) surrounded by six related tables that capture mechanical, optical, thermal, and commercial concerns in normalized form. Foreign keys enforce referential integrity: three one-to-one relationships (fiber assembly, package style, fiber connector) are represented by single-valued FK columns in the module table, while two one-to-many relationships (environmental specifications, application domains) use reciprocal FK columns in the related tables. The six views materialize these joins into flat structures suitable for reporting — each view answers a distinct domain question by denormalizing a specific slice of the star graph. The record identifiers (`PAR-2291` through `PAR-2309`) and their associated attribute values (wavelengths from 23.70 to 37.80, power from 20.70 to 34.80, temperature ranges from sub-zero to 25.80 °C) ground the model in concrete engineering data, while the domain names (`Medical laser treatment`, `Sensor`) and connector types (`compact-connecto-92` through `adaptive-connecto-95`) reflect the commercial and mechanical diversity of the product line.