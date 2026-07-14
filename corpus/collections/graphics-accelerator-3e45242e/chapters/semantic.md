## Domain Modelling: Graphics Accelerator Ecosystem

The graphics accelerator domain captures the physical, logical, and software dimensions of modern GPU-equipped workstations. At its core lies the `graphics_accelerators` table, which records discrete accelerator units alongside their hardware specifications—memory capacity, interface width, bandwidth, power envelope, form factor, and thermal solution. Each accelerator is anchored to a `workstation_enclosure` via a foreign key, establishing the physical housing relationship. Beyond the hardware itself, the domain models the software interfaces (graphics APIs and compute APIs), the physical connectivity layer (display connectors and adapters), and the driver software that binds accelerators to operating systems. The relational schema normalises these concerns into seven base tables and six junction tables, with twelve materialised views reconstructing the domain facts through controlled joins.

**Table `graphics_accelerators`**

| id | manufacturer_part_number | ean_number | gpu_architecture | memory_capacity_bytes | memory_interface_width | memory_bandwidth_gbps | max_power_consumption_watts | form_factor | thermal_solution | workstation_enclosure_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | American Express Co | EAN-2138 | extended-gpu-75 | 31 | 36 | 21.70 | 26 | distributed-form-42 | adaptive-thermal-89 | 100 |
| 2 | Firestone Tire & Rubber | EAN-2143 | integrated-gpu-76 | 42 | 41 | 25.40 | 34 | baseline-form-43 | distributed-thermal-90 | 101 |
| 3 | LDAP First Name Field | EAN-2148 | seasonal-gpu-77 | 53 | 46 | 29.10 | 42 | pilot-form-44 | baseline-thermal-91 | 102 |
| 4 | Blink Charging Co. | EAN-2153 | regional-gpu-78 | 64 | 51 | 32.80 | 50 | extended-form-45 | pilot-thermal-92 | 103 |

The `graphics_accelerators` table is the central entity. Its primary key `id` is a surrogate integer, while `manufacturer_part_number` and `ean_number` serve as business identifiers. The column `gpu_architecture` encodes the GPU design variant—values such as `extended-gpu-75`, `integrated-gpu-76`, `seasonal-gpu-77`, and `regional-gpu-78` appear across the four sample rows. Memory characteristics are captured in `memory_capacity_bytes` (values 31 through 64 in the sample), `memory_interface_width` (36–51), and `memory_bandwidth_gbps` (21.70–32.80). Power is expressed in `max_power_consumption_watts` (26–50 W). The `form_factor` column stores values like `distributed-form-42` and `baseline-form-43`, while `thermal_solution` holds values such as `adaptive-thermal-89` and `distributed-thermal-90`. The foreign key `workstation_enclosure_id` links each accelerator to its housing enclosure, a relationship that the `enclosures_accelerators` junction table also materialises in a many-to-many form.

**Table `graphics_apis`**

| graphics_api_id | api_name | specification_version | conformance_status | standard_body |
|---|---|---|---|---|
| 1 | Baseline Model D | compact-specific-56 | Conformant | composite-standard-57 |
| 2 | Distributed Cluster | composite-specific-57 | Pending | primary-standard-58 |
| 3 | Adaptive Review | primary-specific-58 | Non-Conformant | adaptive-standard-59 |
| 4 | Primary Initiative A | adaptive-specific-59 | Conformant | distributed-standard-60 |

Graphics APIs are catalogued in `graphics_apis`, whose primary key is `graphics_api_id`. The `api_name` column carries descriptive labels—`Baseline Model D`, `Distributed Cluster`, `Adaptive Review`, and `Primary Initiative A`—while `specification_version` stores version strings such as `compact-specific-56` and `composite-specific-57`. The `conformance_status` column distinguishes `Conformant`, `Pending`, and `Non-Conformant` implementations, and `standard_body` records the governing standards organisation (e.g., `composite-standard-57`, `primary-standard-58`). This table is not directly linked to `graphics_accelerators` by a foreign key; instead, the relationship is mediated through the junction tables `accelerators_apis` and `apis_accelerators`, which together support a many-to-many association between accelerators and graphics APIs.

**Table `compute_apis`**

| id | api_name | specification_version | programming_language_support | feature_set |
|---|---|---|---|---|
| 1 | Baseline Model D | compact-specific-56 | extended-programm-15 | distributed-feature-42 |
| 2 | Distributed Cluster | composite-specific-57 | integrated-programm-16 | baseline-feature-43 |
| 3 | Adaptive Review | primary-specific-58 | seasonal-programm-17 | pilot-feature-44 |
| 4 | Primary Initiative A | adaptive-specific-59 | regional-programm-18 | extended-feature-45 |

The `compute_apis` table mirrors the structure of `graphics_apis` but focuses on compute-oriented interfaces. Its primary key is `id`, and the columns `api_name`, `specification_version`, `programming_language_support`, and `feature_set` describe the API's identity, version, supported language (values like `extended-programm-15` and `integrated-programm-16`), and feature profile (e.g., `distributed-feature-42`, `baseline-feature-43`). Like the graphics APIs table, `compute_apis` connects to `graphics_accelerators` through the `accelerators_apis` junction table, enabling any accelerator to support multiple compute APIs and vice versa.

**Table `display_connectors`**

| display_connector_id | connector_type | specification_version | max_resolution_x | max_resolution_y | refresh_rate_hz | color_depth_bits | supports_audio | supports_hdcp | graphics_accelerator_id | adapter_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | compact-connecto-92 | compact-specific-56 | 33 | 18 | 25 | 22 | true | false | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | composite-connecto-93 | composite-specific-57 | 37 | 25 | 34 | 29 | false | true | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | primary-connecto-94 | primary-specific-58 | 41 | 32 | 43 | 36 | true | false | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | adaptive-connecto-95 | adaptive-specific-59 | 45 | 39 | 52 | 43 | false | true | 4 | 103 | 2025-04-16 09:14:00 |

Display connectivity is modelled in `display_connectors`, which records the physical port specifications for each accelerator. The primary key is `display_connector_id`. The `connector_type` column stores values such as `compact-connecto-92` and `composite-connecto-93`. The `specification_version` column holds version strings like `compact-specific-56` and `adaptive-specific-59`. Resolution capabilities are captured in `max_resolution_x` and `max_resolution_y` (ranging from 33–45 and 18–39 respectively in the sample), along with `refresh_rate_hz` (25–52 Hz) and `color_depth_bits` (22–43 bits). Boolean flags `supports_audio` and `supports_hdcp` indicate feature availability. The table carries two foreign keys: `graphics_accelerator_id` links the connector to its host accelerator, and `adapter_id` links it to the adapter that provides the port. The `created_at` timestamp records when the connector specification was entered.

**Table `adapters`**

| adapter_id | manufacturer_part_number | source_connector_type | target_connector_type | quantity_included | graphics_accelerator_id |
|---|---|---|---|---|---|
| 100 | American Express Co | integrated-source-28 | compact-target-68 | 9 | 1 |
| 101 | Firestone Tire & Rubber | seasonal-source-29 | composite-target-69 | 14 | 2 |
| 102 | LDAP First Name Field | regional-source-30 | primary-target-70 | 15 | 3 |
| 103 | Blink Charging Co. | legacy-source-31 | adaptive-target-71 | 10 | 4 |

Physical adapters are recorded in `adapters`, keyed by `adapter_id`. The `manufacturer_part_number` column stores identifiers such as `American Express Co` and `Firestone Tire & Rubber`. The `source_connector_type` and `target_connector_type` columns describe the conversion performed by the adapter (e.g., `integrated-source-28` to `compact-target-68`). The `quantity_included` column records how many units are supplied (values 9–15 in the sample), and the foreign key `graphics_accelerator_id` associates the adapter with a specific accelerator.

**Table `workstation_enclosures`**

| id | enclosure_type | available_expansion_slots | power_supply_watts | supported_form_factors |
|---|---|---|---|---|
| 100 | composite-enclosur-81 | 10 | 12 | seasonal-supporte-29 |
| 101 | primary-enclosur-82 | 15 | 17 | regional-supporte-30 |
| 102 | adaptive-enclosur-83 | 20 | 22 | legacy-supporte-31 |
| 103 | distributed-enclosur-84 | 25 | 27 | compact-supporte-32 |

The `workstation_enclosures` table defines the chassis or housing that contains each accelerator. Its primary key is `id`, which is referenced by `graphics_accelerators.workstation_enclosure_id`. The `enclosure_type` column stores values like `composite-enclosur-81` and `primary-enclosur-82`. `available_expansion_slots` (10–25) and `power_supply_watts` (12–27) describe the enclosure's capacity, while `supported_form_factors` lists compatible accelerator form factors (e.g., `seasonal-supporte-29`, `regional-supporte-30`).

**Table `software_drivers`**

| software_driver_id | driver_name | version | supported_operating_system | bit_architecture | installation_guide_url |
|---|---|---|---|---|---|
| 1 | Composite Series | seasonal-version-71 | primary-supporte-28 | composite-bit-51 | https://ecocyc.org/gene?orgid=ECOLI&id=EG10351 |
| 2 | Compact Assessment A | regional-version-72 | adaptive-supporte-29 | primary-bit-52 | https://bugs.launchpad.net/barbican/+bug/1338725 |
| 3 | Legacy Survey | legacy-version-73 | distributed-supporte-30 | adaptive-bit-53 | https://bugs.launchpad.net/swift/+bug/1254405 |
| 4 | Regional Corridor | compact-version-74 | baseline-supporte-31 | distributed-bit-54 | https://bugs.launchpad.net/cinder/+bug/1683431 |

Software drivers are catalogued in `software_drivers`, which records the driver software associated with each accelerator. The relationship between drivers and accelerators is mediated through the `drivers_accelerators` junction table, supporting a many-to-many association.

The junction tables materialise the many-to-many relationships that the base tables cannot express through simple foreign keys. The `accelerators_apis` table links `graphics_accelerators` to both `graphics_apis` and `compute_apis`, allowing a single accelerator to support multiple graphics and compute APIs. The `accelerators_connectors` table links accelerators to display connectors, while `apis_accelerators` provides an alternative or complementary association between APIs and accelerators. The `adapters_connectors` table connects adapters to display connectors, `enclosures_accelerators` links enclosures to accelerators in a many-to-many form, and `drivers_accelerators` associates software drivers with accelerators.

**Table `accelerators_apis`**

| graphics_accelerator_id | graphics_api_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `accelerators_connectors`**

| graphics_accelerator_id | display_connector_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `apis_accelerators`**

| graphics_api_id | graphics_accelerator_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `adapters_connectors`**

| adapter_id | display_connector_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `enclosures_accelerators`**

| workstation_enclosure_id | graphics_accelerator_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `drivers_accelerators`**

| software_driver_id | graphics_accelerator_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The twelve views materialise the domain facts by joining the normalised tables back into denormalised result sets that answer specific analytical questions. Each view is named according to the pattern `v_<source_entity>_<target_entity>_detail`, indicating the perspective from which the join is constructed.

**View `v_graphics_accelerator_graphics_api_detail`**

```sql
CREATE VIEW v_graphics_accelerator_graphics_api_detail AS
SELECT a.id, a.manufacturer_part_number, a.ean_number, b.graphics_api_id AS api_graphics_api_id, b.api_name AS api_api_name, b.specification_version AS api_specification_version
FROM graphics_accelerators a
  JOIN accelerators_apis j ON j.graphics_accelerator_id = a.id
  JOIN graphics_apis b ON b.graphics_api_id = j.graphics_api_id;
```

| id | manufacturer_part_number | ean_number | api_graphics_api_id | api_api_name | api_specification_version |
|---|---|---|---|---|---|
| 1 | American Express Co | EAN-2138 | 1 | Baseline Model D | compact-specific-56 |
| 1 | American Express Co | EAN-2138 | 2 | Distributed Cluster | composite-specific-57 |
| 2 | Firestone Tire & Rubber | EAN-2143 | 2 | Distributed Cluster | composite-specific-57 |
| 2 | Firestone Tire & Rubber | EAN-2143 | 3 | Adaptive Review | primary-specific-58 |
| 3 | LDAP First Name Field | EAN-2148 | 3 | Adaptive Review | primary-specific-58 |
| 3 | LDAP First Name Field | EAN-2148 | 4 | Primary Initiative A | adaptive-specific-59 |
| 4 | Blink Charging Co. | EAN-2153 | 4 | Primary Initiative A | adaptive-specific-59 |
| 4 | Blink Charging Co. | EAN-2153 | 1 | Baseline Model D | compact-specific-56 |

This view answers the question: "Which graphics APIs are supported by each graphics accelerator?" It joins `graphics_accelerators` to `graphics_apis` through the `accelerators_apis` junction table. Reading a concrete row, an accelerator with `manufacturer_part_number` = `American Express Co` and `gpu_architecture` = `extended-gpu-75` is associated with a graphics API named `Baseline Model D` at specification version `compact-specific-56` with `Conformant` status. A second row shows the `Firestone Tire & Rubber` accelerator (architecture `integrated-gpu-76`) linked to `Distributed Cluster` at version `composite-specific-57` with `Pending` conformance. The view reconstructs the full picture of an accelerator's graphics API support in a single result set.

**View `v_graphics_accelerator_compute_api_detail`**

```sql
CREATE VIEW v_graphics_accelerator_compute_api_detail AS
SELECT a.id, a.manufacturer_part_number, a.ean_number, b.id AS api_id, b.api_name AS api_api_name, b.specification_version AS api_specification_version
FROM graphics_accelerators a
  JOIN accelerators_apis j ON j.graphics_accelerator_id = a.id
  JOIN compute_apis b ON b.id = j.compute_api_id;
```

| id | manufacturer_part_number | ean_number | api_id | api_api_name | api_specification_version |
|---|---|---|---|---|---|
| 1 | American Express Co | EAN-2138 | 1 | Baseline Model D | compact-specific-56 |
| 1 | American Express Co | EAN-2138 | 2 | Distributed Cluster | composite-specific-57 |
| 2 | Firestone Tire & Rubber | EAN-2143 | 2 | Distributed Cluster | composite-specific-57 |
| 2 | Firestone Tire & Rubber | EAN-2143 | 3 | Adaptive Review | primary-specific-58 |
| 3 | LDAP First Name Field | EAN-2148 | 3 | Adaptive Review | primary-specific-58 |
| 3 | LDAP First Name Field | EAN-2148 | 4 | Primary Initiative A | adaptive-specific-59 |
| 4 | Blink Charging Co. | EAN-2153 | 4 | Primary Initiative A | adaptive-specific-59 |
| 4 | Blink Charging Co. | EAN-2153 | 1 | Baseline Model D | compact-specific-56 |

This view answers: "Which compute APIs are available on each graphics accelerator?" It joins `graphics_accelerators` to `compute_apis` through `accelerators_apis`. A sample row pairs the `LDAP First Name Field` accelerator (architecture `seasonal-gpu-77`, memory capacity 53 bytes, bandwidth 29.10 Gbps) with the compute API `Adaptive Review` at version `primary-specific-58`, supporting `seasonal-programm-17` and offering the `pilot-feature-44` feature set. Another row associates the `Blink Charging Co.` accelerator (architecture `regional-gpu-78`, memory capacity 64 bytes, bandwidth 32.80 Gbps) with `Primary Initiative A` at version `adaptive-specific-59`, supporting `regional-programm-18` and the `extended-feature-45` feature set. The view enables direct comparison of compute capabilities across accelerators.

**View `v_graphics_accelerator_display_connector_detail`**

```sql
CREATE VIEW v_graphics_accelerator_display_connector_detail AS
SELECT a.id, a.manufacturer_part_number, a.ean_number, b.display_connector_id AS connector_display_connector_id, b.connector_type AS connector_connector_type, b.specification_version AS connector_specification_version
FROM graphics_accelerators a
  JOIN accelerators_connectors j ON j.graphics_accelerator_id = a.id
  JOIN display_connectors b ON b.display_connector_id = j.display_connector_id;
```

| id | manufacturer_part_number | ean_number | connector_display_connector_id | connector_connector_type | connector_specification_version |
|---|---|---|---|---|---|
| 1 | American Express Co | EAN-2138 | 1 | compact-connecto-92 | compact-specific-56 |
| 1 | American Express Co | EAN-2138 | 2 | composite-connecto-93 | composite-specific-57 |
| 2 | Firestone Tire & Rubber | EAN-2143 | 2 | composite-connecto-93 | composite-specific-57 |
| 2 | Firestone Tire & Rubber | EAN-2143 | 3 | primary-connecto-94 | primary-specific-58 |
| 3 | LDAP First Name Field | EAN-2148 | 3 | primary-connecto-94 | primary-specific-58 |
| 3 | LDAP First Name Field | EAN-2148 | 4 | adaptive-connecto-95 | adaptive-specific-59 |
| 4 | Blink Charging Co. | EAN-2153 | 4 | adaptive-connecto-95 | adaptive-specific-59 |
| 4 | Blink Charging Co. | EAN-2153 | 1 | compact-connecto-92 | compact-specific-56 |

This view answers: "What display connectors are attached to each graphics accelerator?" It joins `graphics_accelerators` to `display_connectors` via the `accelerators_connectors` junction table. A representative row shows the `American Express Co` accelerator (thermal solution `adaptive-thermal-89`, power 26 W) connected to a `compact-connecto-92` display connector at version `compact-specific-56`, capable of 33×18 resolution at 25 Hz with 22-bit color depth, supporting audio but not HDCP. A second row pairs the `Firestone Tire & Rubber` accelerator (thermal solution `distributed-thermal-90`, power 34 W) with a `composite-connecto-93` connector at version `composite-specific-57`, supporting 37×25 resolution at 34 Hz with 29-bit color depth, supporting HDCP but not audio. The view reconstructs the complete display connectivity profile for each accelerator.

**View `v_graphics_accelerator_workstation_enclosure`**

```sql
CREATE VIEW v_graphics_accelerator_workstation_enclosure AS
SELECT a.id, a.manufacturer_part_number, a.ean_number, a.gpu_architecture, b.id AS enclosure_id, b.enclosure_type AS enclosure_enclosure_type, b.available_expansion_slots AS enclosure_available_expansion_slots
FROM graphics_accelerators a JOIN workstation_enclosures b ON a.workstation_enclosure_id = b.id;
```

| id | manufacturer_part_number | ean_number | gpu_architecture | enclosure_id | enclosure_enclosure_type | enclosure_available_expansion_slots |
|---|---|---|---|---|---|---|
| 1 | American Express Co | EAN-2138 | extended-gpu-75 | 100 | composite-enclosur-81 | 10 |
| 2 | Firestone Tire & Rubber | EAN-2143 | integrated-gpu-76 | 101 | primary-enclosur-82 | 15 |
| 3 | LDAP First Name Field | EAN-2148 | seasonal-gpu-77 | 102 | adaptive-enclosur-83 | 20 |
| 4 | Blink Charging Co. | EAN-2153 | regional-gpu-78 | 103 | distributed-enclosur-84 | 25 |

This view answers: "Which workstation enclosure houses each graphics accelerator?" It joins `graphics_accelerators` to `workstation_enclosures` through the `enclosures_accelerators` junction table. A sample row shows the `American Express Co` accelerator (form factor `distributed-form-42`, memory interface width 36) housed in a `composite-enclosur-81` enclosure with 10 expansion slots, 12 W power supply, and `seasonal-supporte-29` form factor support. Another row pairs the `Blink Charging Co.` accelerator (form factor `extended-form-45`, memory interface width 51) with a `distributed-enclosur-84` enclosure offering 25 expansion slots, 27 W power supply, and `compact-supporte-32` form factor support. The view enables capacity planning by revealing the physical housing constraints for each accelerator.

**View `v_graphics_api_graphics_accelerator_detail`**

```sql
CREATE VIEW v_graphics_api_graphics_accelerator_detail AS
SELECT a.graphics_api_id, a.api_name, a.specification_version, b.id AS accelerator_id, b.manufacturer_part_number AS accelerator_manufacturer_part_number, b.ean_number AS accelerator_ean_number
FROM graphics_apis a
  JOIN apis_accelerators j ON j.graphics_api_id = a.graphics_api_id
  JOIN graphics_accelerators b ON b.id = j.graphics_accelerator_id;
```

| graphics_api_id | api_name | specification_version | accelerator_id | accelerator_manufacturer_part_number | accelerator_ean_number |
|---|---|---|---|---|---|
| 1 | Baseline Model D | compact-specific-56 | 1 | American Express Co | EAN-2138 |
| 1 | Baseline Model D | compact-specific-56 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 2 | Distributed Cluster | composite-specific-57 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 2 | Distributed Cluster | composite-specific-57 | 3 | LDAP First Name Field | EAN-2148 |
| 3 | Adaptive Review | primary-specific-58 | 3 | LDAP First Name Field | EAN-2148 |
| 3 | Adaptive Review | primary-specific-58 | 4 | Blink Charging Co. | EAN-2153 |
| 4 | Primary Initiative A | adaptive-specific-59 | 4 | Blink Charging Co. | EAN-2153 |
| 4 | Primary Initiative A | adaptive-specific-59 | 1 | American Express Co | EAN-2138 |

This view inverts the perspective: "Which graphics accelerators support each graphics API?" It joins `graphics_apis` to `graphics_accelerators` through `accelerators_apis`. A representative row shows the `Baseline Model D` graphics API (version `compact-specific-56`, `Conformant`, standard body `composite-standard-57`) supported by the `American Express Co` accelerator with `extended-gpu-75` architecture and 31 bytes of memory. A second row shows `Distributed Cluster` (version `composite-specific-57`, `Pending`, standard body `primary-standard-58`) supported by the `Firestone Tire & Rubber` accelerator with `integrated-gpu-76` architecture and 42 bytes of memory. This view is useful for API-centric analysis, such as determining which accelerators meet a given API's requirements.

**View `v_compute_api_graphics_accelerator_detail`**

```sql
CREATE VIEW v_compute_api_graphics_accelerator_detail AS
SELECT a.id, a.api_name, a.specification_version, b.id AS accelerator_id, b.manufacturer_part_number AS accelerator_manufacturer_part_number, b.ean_number AS accelerator_ean_number
FROM compute_apis a
  JOIN apis_accelerators j ON j.compute_api_id = a.id
  JOIN graphics_accelerators b ON b.id = j.graphics_accelerator_id;
```

| id | api_name | specification_version | accelerator_id | accelerator_manufacturer_part_number | accelerator_ean_number |
|---|---|---|---|---|---|
| 1 | Baseline Model D | compact-specific-56 | 1 | American Express Co | EAN-2138 |
| 1 | Baseline Model D | compact-specific-56 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 2 | Distributed Cluster | composite-specific-57 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 2 | Distributed Cluster | composite-specific-57 | 3 | LDAP First Name Field | EAN-2148 |
| 3 | Adaptive Review | primary-specific-58 | 3 | LDAP First Name Field | EAN-2148 |
| 3 | Adaptive Review | primary-specific-58 | 4 | Blink Charging Co. | EAN-2153 |
| 4 | Primary Initiative A | adaptive-specific-59 | 4 | Blink Charging Co. | EAN-2153 |
| 4 | Primary Initiative A | adaptive-specific-59 | 1 | American Express Co | EAN-2138 |

This view answers: "Which graphics accelerators support each compute API?" It joins `compute_apis` to `graphics_accelerators` through `accelerators_apis`. A sample row shows the `Adaptive Review` compute API (version `primary-specific-58`, `seasonal-programm-17` language support, `pilot-feature-44` feature set) supported by the `LDAP First Name Field` accelerator with `seasonal-gpu-77` architecture, 53 bytes memory, and 29.10 Gbps bandwidth. Another row shows `Primary Initiative A` (version `adaptive-specific-59`, `regional-programm-18` support, `extended-feature-45` features) supported by the `Blink Charging Co.` accelerator with `regional-gpu-78` architecture, 64 bytes memory, and 32.80 Gbps bandwidth. The view enables compute API coverage analysis across the accelerator fleet.

**View `v_display_connector_graphics_accelerator`**

```sql
CREATE VIEW v_display_connector_graphics_accelerator AS
SELECT a.display_connector_id, a.connector_type, a.specification_version, a.max_resolution_x, b.id AS accelerator_id, b.manufacturer_part_number AS accelerator_manufacturer_part_number, b.ean_number AS accelerator_ean_number
FROM display_connectors a JOIN graphics_accelerators b ON a.graphics_accelerator_id = b.id;
```

| display_connector_id | connector_type | specification_version | max_resolution_x | accelerator_id | accelerator_manufacturer_part_number | accelerator_ean_number |
|---|---|---|---|---|---|---|
| 1 | compact-connecto-92 | compact-specific-56 | 33 | 1 | American Express Co | EAN-2138 |
| 2 | composite-connecto-93 | composite-specific-57 | 37 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 3 | primary-connecto-94 | primary-specific-58 | 41 | 3 | LDAP First Name Field | EAN-2148 |
| 4 | adaptive-connecto-95 | adaptive-specific-59 | 45 | 4 | Blink Charging Co. | EAN-2153 |

This view answers: "Which graphics accelerator is each display connector attached to?" It joins `display_connectors` to `graphics_accelerators` through `accelerators_connectors`. A representative row shows the `compact-connecto-92` connector (version `compact-specific-56`, 33×18 resolution, 25 Hz, 22-bit color, audio supported, HDCP not supported) attached to the `American Express Co` accelerator with `extended-gpu-75` architecture and `adaptive-thermal-89` thermal solution. A second row shows the `primary-connecto-94` connector (version `primary-specific-58`, 41×32 resolution, 43 Hz, 36-bit color, audio supported, HDCP not supported) attached to the `LDAP First Name Field` accelerator with `seasonal-gpu-77` architecture and `baseline-thermal-91` thermal solution. This view supports connector-centric inventory and compatibility queries.

**View `v_display_connector_adapter`**

```sql
CREATE VIEW v_display_connector_adapter AS
SELECT a.display_connector_id, a.connector_type, a.specification_version, a.max_resolution_x, b.adapter_id AS adapter_adapter_id, b.manufacturer_part_number AS adapter_manufacturer_part_number, b.source_connector_type AS adapter_source_connector_type
FROM display_connectors a JOIN adapters b ON a.adapter_id = b.adapter_id;
```

| display_connector_id | connector_type | specification_version | max_resolution_x | adapter_adapter_id | adapter_manufacturer_part_number | adapter_source_connector_type |
|---|---|---|---|---|---|---|
| 1 | compact-connecto-92 | compact-specific-56 | 33 | 100 | American Express Co | integrated-source-28 |
| 2 | composite-connecto-93 | composite-specific-57 | 37 | 101 | Firestone Tire & Rubber | seasonal-source-29 |
| 3 | primary-connecto-94 | primary-specific-58 | 41 | 102 | LDAP First Name Field | regional-source-30 |
| 4 | adaptive-connecto-95 | adaptive-specific-59 | 45 | 103 | Blink Charging Co. | legacy-source-31 |

This view answers: "Which adapter provides each display connector?" It joins `display_connectors` to `adapters` through `adapters_connectors`. A sample row shows the `compact-connecto-92` connector provided by adapter `100` (manufacturer `American Express Co`, converting `integrated-source-28` to `compact-target-68`, quantity 9). Another row shows the `composite-connecto-93` connector provided by adapter `101` (manufacturer `Firestone Tire & Rubber`, converting `seasonal-source-29` to `composite-target-69`, quantity 14). The view reconstructs the adapter-to-connector supply chain for each physical port.

**View `v_adapter_graphics_accelerator`**

```sql
CREATE VIEW v_adapter_graphics_accelerator AS
SELECT a.adapter_id, a.manufacturer_part_number, a.source_connector_type, a.target_connector_type, b.id AS accelerator_id, b.manufacturer_part_number AS accelerator_manufacturer_part_number, b.ean_number AS accelerator_ean_number
FROM adapters a JOIN graphics_accelerators b ON a.graphics_accelerator_id = b.id;
```

| adapter_id | manufacturer_part_number | source_connector_type | target_connector_type | accelerator_id | accelerator_manufacturer_part_number | accelerator_ean_number |
|---|---|---|---|---|---|---|
| 100 | American Express Co | integrated-source-28 | compact-target-68 | 1 | American Express Co | EAN-2138 |
| 101 | Firestone Tire & Rubber | seasonal-source-29 | composite-target-69 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 102 | LDAP First Name Field | regional-source-30 | primary-target-70 | 3 | LDAP First Name Field | EAN-2148 |
| 103 | Blink Charging Co. | legacy-source-31 | adaptive-target-71 | 4 | Blink Charging Co. | EAN-2153 |

This view answers: "Which graphics accelerator is each adapter associated with?" It joins `adapters` to `graphics_accelerators` through the `adapters_connectors` junction table. A representative row shows adapter `100` (manufacturer `American Express Co`, source `integrated-source-28`, target `compact-target-68`, quantity 9) associated with the `American Express Co` accelerator (architecture `extended-gpu-75`, memory capacity 31 bytes, bandwidth 21.70 Gbps). Another row shows adapter `102` (manufacturer `LDAP First Name Field`, source `regional-source-30`, target `primary-target-70`, quantity 15) associated with the `LDAP First Name Field` accelerator (architecture `seasonal-gpu-77`, memory capacity 53 bytes, bandwidth 29.10 Gbps). The view enables adapter-to-accelerator traceability.

**View `v_adapter_display_connector_detail`**

```sql
CREATE VIEW v_adapter_display_connector_detail AS
SELECT a.adapter_id, a.manufacturer_part_number, a.source_connector_type, b.display_connector_id AS connector_display_connector_id, b.connector_type AS connector_connector_type, b.specification_version AS connector_specification_version
FROM adapters a
  JOIN adapters_connectors j ON j.adapter_id = a.adapter_id
  JOIN display_connectors b ON b.display_connector_id = j.display_connector_id;
```

| adapter_id | manufacturer_part_number | source_connector_type | connector_display_connector_id | connector_connector_type | connector_specification_version |
|---|---|---|---|---|---|
| 100 | American Express Co | integrated-source-28 | 1 | compact-connecto-92 | compact-specific-56 |
| 100 | American Express Co | integrated-source-28 | 2 | composite-connecto-93 | composite-specific-57 |
| 101 | Firestone Tire & Rubber | seasonal-source-29 | 2 | composite-connecto-93 | composite-specific-57 |
| 101 | Firestone Tire & Rubber | seasonal-source-29 | 3 | primary-connecto-94 | primary-specific-58 |
| 102 | LDAP First Name Field | regional-source-30 | 3 | primary-connecto-94 | primary-specific-58 |
| 102 | LDAP First Name Field | regional-source-30 | 4 | adaptive-connecto-95 | adaptive-specific-59 |
| 103 | Blink Charging Co. | legacy-source-31 | 4 | adaptive-connecto-95 | adaptive-specific-59 |
| 103 | Blink Charging Co. | legacy-source-31 | 1 | compact-connecto-92 | compact-specific-56 |

This view answers: "What display connectors are provided by each adapter?" It joins `adapters` to `display_connectors` through `adapters_connectors`. A sample row shows adapter `100` (manufacturer `American Express Co`, converting `integrated-source-28` to `compact-target-68`, quantity 9) providing the `compact-connecto-92` connector at version `compact-specific-56` with 33×18 resolution, 25 Hz refresh, and 22-bit color depth. Another row shows adapter `103` (manufacturer `Blink Charging Co.`, converting `legacy-source-31` to `adaptive-target-71`, quantity 10) providing the `adaptive-connecto-95` connector at version `adaptive-specific-59` with 45×39 resolution, 52 Hz refresh, and 43-bit color depth. The view reconstructs the connector inventory supplied by each adapter.

**View `v_workstation_enclosure_graphics_accelerator_detail`**

```sql
CREATE VIEW v_workstation_enclosure_graphics_accelerator_detail AS
SELECT a.id, a.enclosure_type, a.available_expansion_slots, b.id AS accelerator_id, b.manufacturer_part_number AS accelerator_manufacturer_part_number, b.ean_number AS accelerator_ean_number
FROM workstation_enclosures a
  JOIN enclosures_accelerators j ON j.workstation_enclosure_id = a.id
  JOIN graphics_accelerators b ON b.id = j.graphics_accelerator_id;
```

| id | enclosure_type | available_expansion_slots | accelerator_id | accelerator_manufacturer_part_number | accelerator_ean_number |
|---|---|---|---|---|---|
| 100 | composite-enclosur-81 | 10 | 1 | American Express Co | EAN-2138 |
| 100 | composite-enclosur-81 | 10 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 101 | primary-enclosur-82 | 15 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 101 | primary-enclosur-82 | 15 | 3 | LDAP First Name Field | EAN-2148 |
| 102 | adaptive-enclosur-83 | 20 | 3 | LDAP First Name Field | EAN-2148 |
| 102 | adaptive-enclosur-83 | 20 | 4 | Blink Charging Co. | EAN-2153 |
| 103 | distributed-enclosur-84 | 25 | 4 | Blink Charging Co. | EAN-2153 |
| 103 | distributed-enclosur-84 | 25 | 1 | American Express Co | EAN-2138 |

This view answers: "Which graphics accelerators are housed in each workstation enclosure?" It joins `workstation_enclosures` to `graphics_accelerators` through `enclosures_accelerators`. A representative row shows the `composite-enclosur-81` enclosure (10 expansion slots, 12 W power supply, `seasonal-supporte-29` form factor support) housing the `American Express Co` accelerator with `extended-gpu-75` architecture, 31 bytes memory, 36-bit interface width, and 21.70 Gbps bandwidth. Another row shows the `adaptive-enclosur-83` enclosure (20 expansion slots, 22 W power supply, `legacy-supporte-31` form factor support) housing the `LDAP First Name Field` accelerator with `seasonal-gpu-77` architecture, 53 bytes memory, 46-bit interface width, and 29.10 Gbps bandwidth. The view supports enclosure capacity and compatibility analysis.

**View `v_software_driver_graphics_accelerator_detail`**

```sql
CREATE VIEW v_software_driver_graphics_accelerator_detail AS
SELECT a.software_driver_id, a.driver_name, a.version, b.id AS accelerator_id, b.manufacturer_part_number AS accelerator_manufacturer_part_number, b.ean_number AS accelerator_ean_number
FROM software_drivers a
  JOIN drivers_accelerators j ON j.software_driver_id = a.software_driver_id
  JOIN graphics_accelerators b ON b.id = j.graphics_accelerator_id;
```

| software_driver_id | driver_name | version | accelerator_id | accelerator_manufacturer_part_number | accelerator_ean_number |
|---|---|---|---|---|---|
| 1 | Composite Series | seasonal-version-71 | 1 | American Express Co | EAN-2138 |
| 1 | Composite Series | seasonal-version-71 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 2 | Compact Assessment A | regional-version-72 | 2 | Firestone Tire & Rubber | EAN-2143 |
| 2 | Compact Assessment A | regional-version-72 | 3 | LDAP First Name Field | EAN-2148 |
| 3 | Legacy Survey | legacy-version-73 | 3 | LDAP First Name Field | EAN-2148 |
| 3 | Legacy Survey | legacy-version-73 | 4 | Blink Charging Co. | EAN-2153 |
| 4 | Regional Corridor | compact-version-74 | 4 | Blink Charging Co. | EAN-2153 |
| 4 | Regional Corridor | compact-version-74 | 1 | American Express Co | EAN-2138 |

This view answers: "Which software driver is associated with each graphics accelerator?" It joins `software_drivers` to `graphics_accelerators` through the `drivers_accelerators` junction table. The view reconstructs the driver-to-accelerator mapping, enabling driver inventory queries and compatibility verification. Each row in the result set pairs a driver record with the full specification of the accelerator it supports, including the accelerator's manufacturer part number, GPU architecture, memory characteristics, and thermal solution. This view is essential for driver deployment planning and version compatibility auditing.

The schema design follows a clear normalisation strategy: base tables capture atomic entity attributes, junction tables resolve many-to-many relationships, and views materialise the domain facts as denormalised result sets. The foreign keys `graphics_accelerators.workstation_enclosure_id`, `display_connectors.graphics_accelerator_id`, `display_connectors.adapter_id`, and `adapters.graphics_accelerator_id` establish the primary structural links, while the six junction tables (`accelerators_apis`, `accelerators_connectors`, `apis_accelerators`, `adapters_connectors`, `enclosures_accelerators`, `drivers_accelerators`) handle the remaining many-to-many associations. The twelve views provide read-optimised perspectives on the data from every entity's point of view, each answering a specific analytical question by joining the normalised tables back together. This architecture ensures data integrity through foreign key constraints while providing flexible query surfaces through the view layer.