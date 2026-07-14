## The Professional Graphics Accelerator Ecosystem

Modern workstation graphics systems are defined by the interplay of silicon, software, and physical infrastructure. A graphics accelerator does not operate in isolation; it requires compatible application programming interfaces, physical display connectors, signal adapters, a supporting enclosure, and device drivers. The records in this reference capture the full lifecycle of a professional GPU from its silicon specifications through its software bindings and physical integration into a workstation chassis. Each component is catalogued with precise identifiers, and the relationships between them form a coherent map of what hardware can run which software, through which connectors, inside which enclosures.

**Table `graphics_accelerators`**

| id | manufacturer_part_number | ean_number | gpu_architecture | memory_capacity_bytes | memory_interface_width | memory_bandwidth_gbps | max_power_consumption_watts | form_factor | thermal_solution | workstation_enclosure_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | American Express Co | EAN-2138 | extended-gpu-75 | 31 | 36 | 21.70 | 26 | distributed-form-42 | adaptive-thermal-89 | 100 |
| 2 | Firestone Tire & Rubber | EAN-2143 | integrated-gpu-76 | 42 | 41 | 25.40 | 34 | baseline-form-43 | distributed-thermal-90 | 101 |
| 3 | LDAP First Name Field | EAN-2148 | seasonal-gpu-77 | 53 | 46 | 29.10 | 42 | pilot-form-44 | baseline-thermal-91 | 102 |
| 4 | Blink Charging Co. | EAN-2153 | regional-gpu-78 | 64 | 51 | 32.80 | 50 | extended-form-45 | pilot-thermal-92 | 103 |

The graphics accelerators table records the core hardware specifications for each accelerator unit. Every row represents a distinct GPU product, identified by a manufacturer part number and an EAN barcode. The silicon is described by its GPU architecture identifier, while memory subsystems are quantified by capacity in bytes, interface width, and bandwidth in gigabytes per second. Power envelopes are captured as maximum consumption in watts, and physical integration is described through form factor and thermal solution identifiers. For example, the accelerator with part number "American Express Co" (EAN-2138) uses the extended-gpu-75 architecture, carries 31 bytes of memory on a 36-bit interface with 21.70 Gbps bandwidth, draws up to 26 watts, and ships in distributed-form-42 with adaptive-thermal-89 cooling. The four accelerators in this dataset span a clear performance gradient: memory capacity increases from 31 to 64 bytes, bandwidth from 21.70 to 32.80 Gbps, and power from 26 to 50 watts, while each unit is assigned to a distinct workstation enclosure (IDs 100 through 103).

**Table `graphics_apis`**

| graphics_api_id | api_name | specification_version | conformance_status | standard_body |
|---|---|---|---|---|
| 1 | Baseline Model D | compact-specific-56 | Conformant | composite-standard-57 |
| 2 | Distributed Cluster | composite-specific-57 | Pending | primary-standard-58 |
| 3 | Adaptive Review | primary-specific-58 | Non-Conformant | adaptive-standard-59 |
| 4 | Primary Initiative A | adaptive-specific-59 | Conformant | distributed-standard-60 |

Graphics application programming interfaces define the software contracts through which applications render visual content. The graphics_apis table catalogs these interfaces with their specification versions, conformance status, and the standard body that governs them. Each API is identified by a unique graphics_api_id and an api_name. The conformance_status field indicates whether the implementation has achieved Conformant, Pending, or Non-Conformant status against the specification. For instance, "Baseline Model D" (graphics_api_id 1) holds a Conformant status under the composite-standard-57 body, while "Adaptive Review" (graphics_api_id 3) is marked Non-Conformant under adaptive-standard-59. The specification versions follow a naming convention that encodes their maturity level—compact-specific, composite-specific, primary-specific, and adaptive-specific—suggesting a progression from early-stage to production-ready interfaces.

**Table `compute_apis`**

| id | api_name | specification_version | programming_language_support | feature_set |
|---|---|---|---|---|
| 1 | Baseline Model D | compact-specific-56 | extended-programm-15 | distributed-feature-42 |
| 2 | Distributed Cluster | composite-specific-57 | integrated-programm-16 | baseline-feature-43 |
| 3 | Adaptive Review | primary-specific-58 | seasonal-programm-17 | pilot-feature-44 |
| 4 | Primary Initiative A | adaptive-specific-59 | regional-programm-18 | extended-feature-45 |

Compute APIs extend the graphics accelerator's utility beyond rendering into general-purpose parallel computation. The compute_apis table mirrors the structure of the graphics APIs table but adds two columns specific to compute workloads: programming_language_support and feature_set. Each compute API is identified by an integer id and carries an api_name that may correspond to a graphics API by name. "Baseline Model D" (id 1) supports extended-programm-15 and offers distributed-feature-42, while "Primary Initiative A" (id 4) supports regional-programm-18 and provides extended-feature-45. The programming language support identifiers suggest a mapping between language ecosystems and API maturity, and the feature sets describe the computational capabilities available to developers.

**Table `display_connectors`**

| display_connector_id | connector_type | specification_version | max_resolution_x | max_resolution_y | refresh_rate_hz | color_depth_bits | supports_audio | supports_hdcp | graphics_accelerator_id | adapter_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | compact-connecto-92 | compact-specific-56 | 33 | 18 | 25 | 22 | true | false | 1 | 100 | 2025-01-01 00:14:00 |
| 2 | composite-connecto-93 | composite-specific-57 | 37 | 25 | 34 | 29 | false | true | 2 | 101 | 2025-02-06 03:14:00 |
| 3 | primary-connecto-94 | primary-specific-58 | 41 | 32 | 43 | 36 | true | false | 3 | 102 | 2025-03-11 06:14:00 |
| 4 | adaptive-connecto-95 | adaptive-specific-59 | 45 | 39 | 52 | 43 | false | true | 4 | 103 | 2025-04-16 09:14:00 |

Physical display connectivity is captured in the display_connectors table, which records the electrical and signal characteristics of each connector type. Every row identifies a connector by its display_connector_id, connector_type, and specification_version. The video capabilities are quantified by maximum resolution (X and Y dimensions), refresh rate in hertz, and color depth in bits. Two boolean flags indicate whether the connector supports audio passthrough and High-bandwidth Digital Content Protection (HDCP). The table also records the graphics_accelerator_id and adapter_id to which the connector is attached, along with a created_at timestamp. Connector 1, for example, uses compact-connecto-92 at version compact-specific-56, supports a maximum resolution of 33×18 at 25 Hz with 22-bit color, carries audio but not HDCP, and is attached to accelerator 1 via adapter 100. The four connectors form a clear progression: resolution increases from 33×18 to 45×39, refresh rate from 25 to 52 Hz, and color depth from 22 to 43 bits.

**Table `adapters`**

| adapter_id | manufacturer_part_number | source_connector_type | target_connector_type | quantity_included | graphics_accelerator_id |
|---|---|---|---|---|---|
| 100 | American Express Co | integrated-source-28 | compact-target-68 | 9 | 1 |
| 101 | Firestone Tire & Rubber | seasonal-source-29 | composite-target-69 | 14 | 2 |
| 102 | LDAP First Name Field | regional-source-30 | primary-target-70 | 15 | 3 |
| 103 | Blink Charging Co. | legacy-source-31 | adaptive-target-71 | 10 | 4 |

Adapters serve as signal converters between different connector standards. The adapters table records each adapter by its adapter_id, manufacturer part number, source and target connector types, the quantity included in the product package, and the graphics_accelerator_id it is associated with. Adapter 100, manufactured by "American Express Co," converts from integrated-source-28 to compact-target-68 and ships in quantities of 9 with accelerator 1. Adapter 103 from "Blink Charging Co." bridges legacy-source-31 to adaptive-target-71 in quantities of 10 with accelerator 4. The source and target connector types define the signal translation path, and the quantity_included field indicates how many physical adapters are bundled with each accelerator unit.

**Table `workstation_enclosures`**

| id | enclosure_type | available_expansion_slots | power_supply_watts | supported_form_factors |
|---|---|---|---|---|
| 100 | composite-enclosur-81 | 10 | 12 | seasonal-supporte-29 |
| 101 | primary-enclosur-82 | 15 | 17 | regional-supporte-30 |
| 102 | adaptive-enclosur-83 | 20 | 22 | legacy-supporte-31 |
| 103 | distributed-enclosur-84 | 25 | 27 | compact-supporte-32 |

The workstation_enclosures table describes the chassis or form factor into which each graphics accelerator is installed. Each enclosure is identified by an integer id and characterized by its enclosure_type, the number of available expansion slots, the power supply capacity in watts, and the supported form factors. Enclosure 100 is a composite-enclosur-81 with 10 expansion slots, a 12-watt power supply, and supports seasonal-supporte-29 form factors. Enclosure 103, a distributed-enclosur-84, offers 25 expansion slots, 27 watts of power, and supports compact-supporte-32. The expansion slot count and power supply capacity scale alongside the accelerator power requirements, ensuring that each GPU has adequate physical and electrical infrastructure.

**Table `software_drivers`**

| software_driver_id | driver_name | version | supported_operating_system | bit_architecture | installation_guide_url |
|---|---|---|---|---|---|
| 1 | Composite Series | seasonal-version-71 | primary-supporte-28 | composite-bit-51 | https://ecocyc.org/gene?orgid=ECOLI&id=EG10351 |
| 2 | Compact Assessment A | regional-version-72 | adaptive-supporte-29 | primary-bit-52 | https://bugs.launchpad.net/barbican/+bug/1338725 |
| 3 | Legacy Survey | legacy-version-73 | distributed-supporte-30 | adaptive-bit-53 | https://bugs.launchpad.net/swift/+bug/1254405 |
| 4 | Regional Corridor | compact-version-74 | baseline-supporte-31 | distributed-bit-54 | https://bugs.launchpad.net/cinder/+bug/1683431 |

Software drivers provide the runtime interface between the operating system and the graphics accelerator hardware. The software_drivers table captures driver metadata including the driver identifier, name, version, operating system compatibility, and the accelerator it targets. Each driver is linked to a specific graphics_accelerator_id, establishing the hardware-software binding that is essential for correct operation. The driver version and operating system fields ensure that system integrators can verify compatibility before deployment.

The relationships between these base entities are captured in a set of junction tables that encode many-to-many associations. The accelerators_apis table links graphics accelerators to the graphics APIs they support, while apis_accelerators provides the inverse mapping. The accelerators_connectors table associates accelerators with their display connectors, and adapters_connectors links adapters to connectors. The enclosures_accelerators table records which workstation enclosures support which accelerators, and drivers_accelerators binds software drivers to their target hardware.

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

The accelerators_apis junction table establishes which graphics accelerators are compatible with which graphics APIs. Each row pairs an accelerator identifier with a graphics API identifier, forming the basis for software compatibility queries. This table enables practitioners to determine, for any given accelerator, which rendering APIs are available, and conversely, for any API, which accelerators can execute it.

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

The accelerators_connectors table records the physical association between graphics accelerators and display connectors. Each row links an accelerator to a connector, documenting the signal output path from silicon to display device. This relationship is critical for system integrators who must verify that the connector types on an accelerator match the display devices in the target environment.

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

The apis_accelerators table provides the inverse of accelerators_apis, mapping from graphics APIs to the accelerators that implement them. This perspective is useful when selecting hardware for a given software stack: given a target API, the table reveals all compatible accelerators.

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

The adapters_connectors table links adapters to the display connectors they convert. Each row records an adapter-to-connector association, enabling practitioners to trace the signal path from accelerator through adapter to display. This relationship is essential for verifying that the complete signal chain is compatible end-to-end.

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

The enclosures_accelerators table records which workstation enclosures support which graphics accelerators. This relationship ensures that physical form factor compatibility is documented: an accelerator can only be installed in an enclosure that explicitly supports its form factor. The table cross-references the enclosure id with the accelerator id, creating a clear installation matrix.

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

The drivers_accelerators table binds software drivers to their target graphics accelerators. Each row establishes that a particular driver version is intended for a specific accelerator, ensuring that the correct software stack is deployed for each hardware unit. This relationship is the final link in the hardware-software integration chain.

The views in this reference synthesize the base tables and junction tables into actionable detail views, each answering a specific integration question.

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

This view answers the question: "Which graphics APIs does each accelerator support, and what are the API specifications?" The join produces rows that combine accelerator hardware identifiers with graphics API metadata. Reading a concrete row, one would see an accelerator such as "American Express Co" paired with its supported API "Baseline Model D" at specification compact-specific-56 with Conformant status. This view enables procurement teams to verify that a selected accelerator supports the APIs required by their rendering applications.

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

This view answers: "Which compute APIs are available for each graphics accelerator, and what programming language and feature support do they provide?" The join combines accelerator records with compute API records, producing rows that show the full compute capability profile of each GPU. A row might pair accelerator "Firestone Tire & Rubber" with compute API "Distributed Cluster" supporting integrated-programm-16 and baseline-feature-43. System architects use this view to match compute workloads to the appropriate accelerator-API combination.

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

This view answers: "What display connectors are attached to each graphics accelerator, and what are their signal specifications?" The join produces rows combining accelerator hardware with connector capabilities including resolution, refresh rate, color depth, and audio/HDCP support. A row might show accelerator "LDAP First Name Field" paired with connector primary-connecto-94 supporting 41×32 resolution at 43 Hz with 36-bit color and audio passthrough. Display engineers use this view to verify that the accelerator's output capabilities meet the requirements of the target monitors.

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

This view answers: "Which workstation enclosure houses each graphics accelerator, and what are the enclosure's expansion and power characteristics?" The join combines accelerator records with enclosure records, producing rows that show the complete physical integration picture. A row might pair accelerator "Blink Charging Co." with enclosure distributed-enclosur-84, which provides 25 expansion slots and 27 watts of power supply capacity. Facility planners use this view to verify that the workstation infrastructure can accommodate the thermal and power requirements of the installed accelerators.

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

This view answers the inverse question: "Which graphics accelerators support each graphics API?" The join produces rows from the API perspective, listing all accelerators compatible with a given API. A row might show API "Adaptive Review" (Non-Conformant status) supported by accelerator "LDAP First Name Field." Software vendors use this view to determine the hardware footprint of their API implementation.

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

This view answers: "Which graphics accelerators support each compute API?" The join produces rows from the compute API perspective, listing all accelerators that can execute a given compute API. A row might show compute API "Adaptive Review" supporting seasonal-programm-17 and pilot-feature-44, available on accelerator "LDAP First Name Field." Compute workload planners use this view to identify accelerators that support the programming language and feature requirements of their applications.

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

This view answers: "Which graphics accelerator is each display connector attached to?" The join produces rows from the connector perspective, listing the accelerator that drives each connector. A row might show connector compact-connecto-92 attached to accelerator "American Express Co." Display system designers use this view to trace the signal source for each display output.

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

This view answers: "Which adapter is associated with each display connector?" The join produces rows linking connectors to their adapters, showing the signal conversion path. A row might pair connector composite-connecto-93 with adapter 101 from "Firestone Tire & Rubber." Signal chain engineers use this view to verify that the adapter correctly translates between the source and target connector types.

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

This view answers: "Which graphics accelerator is each adapter associated with?" The join produces rows from the adapter perspective, listing the accelerator that ships with each adapter. A row might show adapter 102 from "LDAP First Name Field" associated with accelerator "LDAP First Name Field." Procurement teams use this view to verify that the correct adapters are included with each accelerator purchase.

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

This view answers: "What are the source and target connector types for each adapter, and which accelerator is it associated with?" The join produces rows combining adapter metadata with connector specifications. A row might show adapter 103 converting from legacy-source-31 to adaptive-target-71, associated with accelerator "Blink Charging Co." Signal conversion specialists use this view to verify that the adapter provides the correct translation between connector standards.

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

This view answers: "Which graphics accelerators are installed in each workstation enclosure, and what are the enclosure specifications?" The join produces rows from the enclosure perspective, listing all accelerators installed in a given chassis along with the enclosure's expansion slot count and power supply capacity. A row might show enclosure distributed-enclosur-84 with 25 slots and 27 watts powering accelerator "Blink Charging Co." Facility engineers use this view to audit the complete hardware inventory within each workstation.

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

This view answers: "Which software driver is installed for each graphics accelerator, and what are the driver version and operating system compatibility details?" The join produces rows combining accelerator hardware with driver metadata. A row might pair accelerator "American Express Co" with its specific driver version and OS compatibility information. System administrators use this view to verify that the correct driver stack is deployed across all accelerator hardware in the fleet.

The professional graphics accelerator ecosystem is a tightly coupled system where hardware specifications, software interfaces, physical connectivity, and enclosure infrastructure must all align for correct operation. The records in this reference capture every layer of that alignment: from the silicon-level GPU architecture and memory bandwidth through the API conformance landscape, the display signal chain, the adapter signal conversion, the workstation enclosure integration, and the software driver bindings. The junction tables and detail views together provide a complete integration matrix, enabling practitioners to answer any compatibility question—what software runs on what hardware, through what connectors, inside what enclosure, with what driver. This comprehensive mapping is the foundation for procurement, system integration, and operational maintenance of professional graphics workstations.