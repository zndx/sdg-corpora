```bash
write_file(
    path="/tmp/harness_semantic_b0_ncuyh/chapter_ontology_schema.md",
    content="## Ontology-Grounded Relational Modelling: From Domain Concepts to Normalised Tables and Materialised Views\n\nThe domain under examination spans four interlocking concern spaces — legislative governance, vehicular operations, consumer product lifecycles, and public-health monitoring — each anchored to a territorial jurisdiction. At the ontology level, the domain is decomposed into eight entity types, each carrying a distinct set of attributes and participating in a network of cardinality-bounded relationships. The relational schema materialises these concepts through a set of base tables whose primary keys serve as record identifiers, whose non-key columns encode attribute values, and whose foreign keys encode the relationships between entity types. Views then reconstruct domain facts by joining these normalised tables, answering analytical questions that span multiple entity types. This chapter walks through the modelling decisions, the resulting schema, and the semantics of each materialised view.\n\n### Base Tables and Entity Types\n\nThe ontology defines eight entity types, each mapped to a single base table. The first of these, `legislative_acts`, captures the lifecycle of regulatory instruments. Its primary key `legislative_act_id` is an integer surrogate, while the business identifier `act_identifier` carries human-readable codes such as `ACT-2177`, `ACT-2182`, `ACT-2187`, and `ACT-2192`. The table also stores `jurisdiction` (a coded reference to a territorial scope, e.g. `regional-jurisdic-30`), `enactment_date` as an ISO-8601 timestamp, `status` (one of `proposed`, `enacted`, `vetoed`, or `repealed`), `target_chemical_class` (e.g. `regional-target-36`), and `legal_effect` (e.g. `extended-legal-81`). The status column encodes a state machine over the act's lifecycle, while the target and effect columns capture the substantive scope of the legislation.\n\n\n\nThe `states` table anchors the territorial dimension of the domain. Each row represents a jurisdiction with a numeric `state_code` (e.g. `17788643`, `8350031`, `790483`, `8387549`) serving as the primary key. This code is referenced by multiple other tables, making `states` a central lookup entity in the schema. The table also carries a `state_name` column that holds human-readable identifiers such as `distributed-state-84`, `baseline-state-85`, `pilot-state-86`, and `extended-state-87`, alongside a `region` column for broader geographic classification.\n\n\n\nThe `governors` table models the political-administrative entity type. Its primary key is the UUID-valued `id` column (e.g. `6aa09e22-8fb2-11eb-924d-9cd76263cbd0`), while `governor_id` provides an additional business identifier. The `full_name` column holds values such as `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, and `Norma Fisher`. The `state` column references the territorial jurisdiction (coded as `distributed-state-84`, `baseline-state-86`, etc.), and `state_code` is a foreign key pointing to `states.state_code`. Term boundaries are captured by `term_start_date` and `term_end_date` as timestamps. The `prior_profession` column (e.g. `composite-prior-81`, `primary-prior-82`) and `commute_mode` column (values `walk`, `drive`, `state_trooper_escort`) encode personal attributes. Notably, `governors` carries a `vehicle_id` column that is a foreign key into `vehicles.id`, establishing a direct relationship between a governor and a vehicle.\n\n\n\nThe `vehicles` table models the vehicular entity type. Its primary key is `id` (integer), while `vehicle_id` is a business identifier with values such as `5917273`, `ptchol`, `m09`, and `3158135`. The `make` and `model` columns carry coded values like `extended-make-81` and `composite-model-81`. The `year` column stores integer values (12, 21, 30, 39), `fuel_type` encodes the energy source (e.g. `primary-fuel-34`, `adaptive-fuel-35`), and `emission_level` stores a numeric measurement (11.70 through 16.80). The table carries two foreign keys: `driver_id` references `drivers.id`, and `governor_id` references `governors.id`. This dual foreign-key structure means each vehicle is associated with exactly one driver and one governor, encoding a many-to-one relationship from both sides.\n\n\n\nThe `drivers` table models the human operator entity. Its primary key is `id` (integer), with `driver_id` as a UUID business identifier (e.g. `e878ea4c-8fd1-11eb-924d-9cd76263cbd0`). The `full_name` column mirrors the names found in `governors` (`Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher`), `employer` stores organisational affiliations (e.g. `National University of Singapore`, `Occidental Petroleum`, `ChargePoint Holdings.`, `Ninja Van`), and `license_number` carries codes like `LIC-2589` through `LIC-2610`. The `shift_status` column is an enumerated attribute with values `on_duty` and `off_duty`. The `vehicle_id` column is a foreign key into `vehicles.id`, establishing that each driver operates exactly one vehicle.\n\n\n\nThe `disposable_products` table models consumer goods at the point of manufacture. Its primary key is `id` (integer), with `product_code` as a business identifier (e.g. `PRO-2675`, `PRO-2681`, `PRO-2687`, `PRO-2693`). The `product_name` column holds values such as `Composite Assessment`, `Compact Survey A`, `Legacy Corridor`, and `Regional Series`. The `material_composition` column encodes the substance type (e.g. `distributed-material-18`), `shelf_life` stores an integer duration (28, 34, 40, 46), `disposal_method` is an enumerated attribute (`landfill`, `incineration`, `recycling`), and `planned_obsolescence` is a boolean flag. The `consumer_id` column is a foreign key into `consumers.id`, linking each product to its purchaser.\n\n\n\nThe `consumers` table models the end-user entity. Its primary key is `id` (integer), with `consumer_id` as a UUID business identifier (e.g. `8350008`, `7119766`). The `full_name` column again mirrors the names found across other tables. The `residence_state` column encodes a territorial reference (e.g. `integrated-residenc-94`, `seasonal-residenc-95`), `lifestyle_type` is an enumerated attribute (`sustainable`, `conventional`, `high_consumption`), and `disposable_product_id` is a foreign key into `disposable_products.id`. The `state_code` column is a foreign key into `states.state_code`, linking the consumer to their jurisdiction.\n\n\n\nThe `health_indexes` table captures public-health monitoring data. Its primary key is `id` (integer), with `health_index_id` as a business identifier. The `index_value` column stores a numeric measurement, `measurement_date` is a timestamp, `pollutant_type` encodes the monitored substance, and `state_code` is a foreign key into `states.state_code`. This table is the sole health-related entity in the schema, and its relationship to `states` enables territorial aggregation of health metrics.\n\n\n\n### Foreign-Key Relationships and Cardinality\n\nThe schema's foreign-key topology encodes the domain's cardinality constraints. The `governors.vehicle_id` column references `vehicles.id`, and `vehicles.governor_id` references `governors.id` — a bidirectional foreign-key pair that enforces a one-to-one relationship between governors and vehicles. Similarly, `vehicles.driver_id` references `drivers.id` and `drivers.vehicle_id` references `vehicles.id`, forming a one-to-one relationship between drivers and vehicles. Together, these constraints mean each vehicle row is simultaneously linked to exactly one governor and exactly one driver, and each governor and each driver is linked to exactly one vehicle.\n\nThe `consumers.state_code` column references `states.state_code`, and `consumers.disposable_product_id` references `disposable_products.id`, establishing that each consumer resides in one state and purchases one product. The `disposable_products.consumer_id` column creates the reverse reference, completing the consumer-product association. The `health_indexes.state_code` column references `states.state_code`, linking health measurements to jurisdictions. Finally, `governors.state_code` references `states.state_code`, anchoring each governor to their territorial jurisdiction.\n\nThe `states` table serves as a central lookup entity, referenced by `governors`, `consumers`, and `health_indexes`. The `legislative_acts` table stands somewhat apart in the foreign-key graph — it carries no explicit foreign key to `states` in the base schema, but the `state_legislative_act_view` materialises the relationship through a join that infers jurisdictional linkage.\n\n### Materialised Views and Domain Facts\n\nThe schema includes twelve materialised views, each encoding a specific analytical question by joining two or more base tables. These views reconstruct domain facts from the normalised tables, presenting joined results that answer questions spanning multiple entity types.\n\nThe `governor_state_view` answers the question: \"Which governor is associated with which state?\" It joins `governors` to `states` on `governors.state_code = states.state_code`. A representative row shows `Theodore Mcgrath` associated with `distributed-state-84` (state code `17788643`), while `Norma Fisher` is linked to `extended-state-87` (state code `8387549`). This view materialises the territorial assignment of governors.\n\n\n\nThe `governor_vehicle_view` answers: \"Which governor operates which vehicle?\" It joins `governors` to `vehicles` on `governors.id = vehicles.governor_id`. A row shows the governor with ID `6aa09e22-8fb2-11eb-924d-9cd76263cbd0` (Theodore Mcgrath) operating vehicle `5917273` (make `extended-make-81`, model `composite-model-81`, emission level `11.70`). The view confirms the one-to-one governor-vehicle relationship.\n\n\n\nThe `vehicle_driver_view` answers: \"Which driver operates which vehicle?\" It joins `vehicles` to `drivers` on `vehicles.driver_id = drivers.id`. A row shows vehicle `5917273` operated by driver `e878ea4c-8fd1-11eb-924d-9cd76263cbd0` (Theodore Mcgrath, employer `National University of Singapore`, license `LIC-2589`, status `on_duty`). This view materialises the driver-vehicle assignment.\n\n\n\nThe `vehicle_governor_view` is the symmetric counterpart to `governor_vehicle_view`, joining `vehicles` to `governors` on `vehicles.governor_id = governors.id`. It presents the same relationship from the vehicle's perspective. A row shows vehicle `ptchol` (make `integrated-make-82`, model `primary-model-82`, year `21`, emission level `13.40`) operated by the governor with ID `1996917` (full name `Account Name`). The view confirms that each vehicle row carries exactly one governor reference.\n\n\n\nThe `driver_vehicle_view` is the symmetric counterpart to `vehicle_driver_view`, joining `drivers` to `vehicles` on `drivers.vehicle_id = vehicles.id`. It presents the driver-vehicle relationship from the driver's perspective. A row shows driver `6969422` (Account Name, employer `Occidental Petroleum`, license `LIC-2596`, status `off_duty`) operating vehicle `ptchol` (make `integrated-make-82`, model `primary-model-82`, emission level `13.40`).\n\n\n\nThe `disposable_product_consumer_view` answers: \"Which consumer purchased which product?\" It joins `disposable_products` to `consumers` on `disposable_products.consumer_id = consumers.id`. A row shows product `PRO-2675` (`Composite Assessment`, material `distributed-material-18`, shelf life `28`, disposal `landfill`, obsolescence `false`) purchased by consumer `8350008` (Theodore Mcgrath, residence `integrated-residenc-94`, lifestyle `sustainable`). This view materialises the consumer-product purchase relationship.\n\n\n\nThe `consumer_disposable_product_view` is the symmetric counterpart, joining `consumers` to `disposable_products` on `consumers.disposable_product_id = disposable_products.id`. It presents the relationship from the consumer's perspective. A row shows consumer `7119766` (Account Name, residence `seasonal-residenc-95`, lifestyle `conventional`) who purchased product `PRO-2681` (`Compact Survey A`, material `baseline-material-19`, shelf life `34`, disposal `incineration`, obsolescence `true`).\n\n\n\nThe `consumer_state_view` answers: \"Which consumer resides in which state?\" It joins `consumers` to `states` on `consumers.state_code = states.state_code`. A row shows consumer `1450664` (Saipan International Airport, residence `regional-residenc-96`, lifestyle `high_consumption`) residing in the state with code `790483`. This view materialises the territorial assignment of consumers.\n\n\n\nThe `health_index_state_view` answers: \"Which health measurement belongs to which state?\" It joins `health_indexes` to `states` on `health_indexes.state_code = states.state_code`. This view materialises the territorial assignment of health monitoring data, enabling queries about health metrics by jurisdiction.\n\n\n\nThe `state_governor_view` answers: \"Which governor is assigned to which state?\" It joins `states` to `governors` on `states.state_code = governors.state_code`. A row shows state code `17788643` associated with governor `6aa09e22-8fb2-11eb-924d-9cd76263cbd0` (Theodore Mcgrath, term `2022-05-26` to `2025-08-24`, prior profession `composite-prior-81`, commute `walk`). This view presents the governor-state relationship from the state's perspective.\n\n\n\nThe `state_legislative_act_view` answers: \"Which legislative act is associated with which state?\" It joins `states` to `legislative_acts` to reconstruct the jurisdictional linkage. A row shows state code `17788643` associated with legislative act `ACT-2177` (status `proposed`, target `regional-target-36`, legal effect `extended-legal-81`). This view materialises the territorial scope of legislation.\n\n\n\nThe `state_health_index_view` answers: \"Which health index belongs to which state?\" It joins `states` to `health_indexes` on `states.state_code = health_indexes.state_code`. This view presents health monitoring data alongside territorial identifiers, enabling jurisdiction-level health analysis.\n\n\n\n### Synthesis\n\nThe schema models a domain where political governance, vehicular operations, consumer behaviour, and public health are all anchored to territorial jurisdictions. The eight base tables encode eight entity types with their attributes as columns, surrogate and business identifiers as primary keys, and foreign keys as the relationships between entity types. The cardinality constraints — one-to-one between governors and vehicles, one-to-one between drivers and vehicles, one-to-many between states and governors/consumers/health indexes — are enforced by the foreign-key topology. The twelve materialised views reconstruct domain facts by joining these normalised tables, each view answering a specific analytical question: which governor operates which vehicle, which consumer purchased which product, which health measurement belongs to which state. The views present the same relationships from different perspectives (governor-to-vehicle versus vehicle-to-governor, driver-to-vehicle versus vehicle-to-driver), providing symmetric access patterns for different query workloads. The schema thus achieves a balance between normalisation (minimising redundancy through separate entity tables) and query convenience (materialising common joins as views), reflecting a design that is both ontology-grounded and analytically practical."
)
```

## Data appendix

**Table `legislative_acts`**

| legislative_act_id | act_identifier | jurisdiction | enactment_date | status | target_chemical_class | legal_effect |
|---|---|---|---|---|---|---|
| 1 | ACT-2177 | regional-jurisdic-30 | 2022-01-04T12:24:00 | proposed | regional-target-36 | extended-legal-81 |
| 2 | ACT-2182 | legacy-jurisdic-31 | 2023-06-15T19:41:00 | enacted | legacy-target-37 | integrated-legal-82 |
| 3 | ACT-2187 | compact-jurisdic-32 | 2024-11-26T02:58:00 | vetoed | compact-target-38 | seasonal-legal-83 |
| 4 | ACT-2192 | composite-jurisdic-33 | 2025-04-10T09:15:00 | repealed | composite-target-39 | regional-legal-84 |

**Table `governors`**

| id | governor_id | full_name | state | term_start_date | term_end_date | prior_profession | commute_mode | state_code | vehicle_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 6aa09e22-8fb2-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | distributed-state-84 | 2022-05-26T16:36:00 | 2025-08-24T07:45:00 | composite-prior-81 | walk | 17788643 | 1 |
| 2 | 1996917 | Account Name | baseline-state-85 | 2023-10-10T23:53:00 | 2022-01-08T14:02:00 | primary-prior-82 | drive | 8350031 | 2 |
| 3 | 2087742 | Saipan International Airport | pilot-state-86 | 2024-03-21T06:10:00 | 2023-06-19T21:19:00 | adaptive-prior-83 | state_trooper_escort | 790483 | 3 |
| 4 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Norma Fisher | extended-state-87 | 2025-08-05T13:27:00 | 2024-11-03T04:36:00 | distributed-prior-84 | walk | 8387549 | 4 |

**Table `vehicles`**

| id | vehicle_id | make | model | year | fuel_type | emission_level | driver_id | governor_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 5917273 | extended-make-81 | composite-model-81 | 12 | primary-fuel-34 | 11.70 | 1 | 1 |
| 2 | ptchol | integrated-make-82 | primary-model-82 | 21 | adaptive-fuel-35 | 13.40 | 2 | 2 |
| 3 | m09 | seasonal-make-83 | adaptive-model-83 | 30 | distributed-fuel-36 | 15.10 | 3 | 3 |
| 4 | 3158135 | regional-make-84 | distributed-model-84 | 39 | baseline-fuel-37 | 16.80 | 4 | 4 |

**Table `drivers`**

| id | driver_id | full_name | employer | license_number | shift_status | vehicle_id |
|---|---|---|---|---|---|---|
| 1 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | National University of Singapore | LIC-2589 | on_duty | 1 |
| 2 | 6969422 | Account Name | Occidental Petroleum | LIC-2596 | off_duty | 2 |
| 3 | 26730215 | Saipan International Airport | ChargePoint Holdings. | LIC-2603 | on_duty | 3 |
| 4 | 726033 | Norma Fisher | Ninja Van | LIC-2610 | off_duty | 4 |

**Table `disposable_products`**

| id | product_code | product_name | material_composition | shelf_life | disposal_method | planned_obsolescence | consumer_id |
|---|---|---|---|---|---|---|---|
| 100 | PRO-2675 | Composite Assessment | distributed-material-18 | 28 | landfill | false | 1 |
| 101 | PRO-2681 | Compact Survey A | baseline-material-19 | 34 | incineration | true | 2 |
| 102 | PRO-2687 | Legacy Corridor | pilot-material-20 | 40 | recycling | false | 3 |
| 103 | PRO-2693 | Regional Series | extended-material-21 | 46 | landfill | true | 4 |

**Table `consumers`**

| id | consumer_id | full_name | residence_state | lifestyle_type | disposable_product_id | state_code |
|---|---|---|---|---|---|---|
| 1 | 8350008 | Theodore Mcgrath | integrated-residenc-94 | sustainable | 100 | 17788643 |
| 2 | 7119766 | Account Name | seasonal-residenc-95 | conventional | 101 | 8350031 |
| 3 | 1450664 | Saipan International Airport | regional-residenc-96 | high_consumption | 102 | 790483 |
| 4 | 1437598 | Norma Fisher | legacy-residenc-97 | sustainable | 103 | 8387549 |

**Table `health_indexes`**

| index_id | index_name | calculation_date | life_expectancy_score | happiness_score | ecological_footprint | global_rank | state_code |
|---|---|---|---|---|---|---|---|
| 4277025 | Primary Initiative A | 2025-04-11T15:45:00 | 4.20 | 20.70 | 16.70 | 37 | 17788643 |
| 3990161 | Composite Model | 2022-09-22T22:02:00 | 8.40 | 24.40 | 19.40 | 43 | 8350031 |
| 2106696 | Compact Cluster | 2023-02-06T05:19:00 | 12.60 | 28.10 | 22.10 | 49 | 790483 |
| 1450653 | Legacy Review D | 2024-07-17T12:36:00 | 16.80 | 31.80 | 24.80 | 55 | 8387549 |

**Table `states`**

| state_code | state_name | population | gdp | pesticide_ban_status | happy_planet_rank | governor_id | legislative_act_id | index_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 17788643 | Composite Protocol | 42 | 23.20 | false | 40 | 1 | 1 | 4277025 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 8350031 | Compact Programme A | 49 | 27.40 | true | 43 | 2 | 2 | 3990161 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 790483 | Legacy Standard | 56 | 31.60 | false | 46 | 3 | 3 | 2106696 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 8387549 | Regional Framework | 63 | 35.80 | true | 49 | 4 | 4 | 1450653 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

**View `governor_state_view`**

```sql
CREATE VIEW governor_state_view AS
SELECT a.id, a.governor_id, a.full_name, a.state, b.state_code AS state_state_code, b.state_name AS state_state_name, b.population AS state_population
FROM governors a JOIN states b ON a.state_code = b.state_code;
```

| id | governor_id | full_name | state | state_state_code | state_state_name | state_population |
|---|---|---|---|---|---|---|
| 1 | 6aa09e22-8fb2-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | distributed-state-84 | 17788643 | Composite Protocol | 42 |
| 2 | 1996917 | Account Name | baseline-state-85 | 8350031 | Compact Programme A | 49 |
| 3 | 2087742 | Saipan International Airport | pilot-state-86 | 790483 | Legacy Standard | 56 |
| 4 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Norma Fisher | extended-state-87 | 8387549 | Regional Framework | 63 |

**View `governor_vehicle_view`**

```sql
CREATE VIEW governor_vehicle_view AS
SELECT a.id, a.governor_id, a.full_name, a.state, b.id AS vehicle_id, b.vehicle_id AS vehicle_vehicle_id, b.make AS vehicle_make
FROM governors a JOIN vehicles b ON a.vehicle_id = b.id;
```

| id | governor_id | full_name | state | vehicle_id | vehicle_vehicle_id | vehicle_make |
|---|---|---|---|---|---|---|
| 1 | 6aa09e22-8fb2-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | distributed-state-84 | 1 | 5917273 | extended-make-81 |
| 2 | 1996917 | Account Name | baseline-state-85 | 2 | ptchol | integrated-make-82 |
| 3 | 2087742 | Saipan International Airport | pilot-state-86 | 3 | m09 | seasonal-make-83 |
| 4 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Norma Fisher | extended-state-87 | 4 | 3158135 | regional-make-84 |

**View `vehicle_driver_view`**

```sql
CREATE VIEW vehicle_driver_view AS
SELECT a.id, a.vehicle_id, a.make, a.model, b.id AS driver_id, b.driver_id AS driver_driver_id, b.full_name AS driver_full_name
FROM vehicles a JOIN drivers b ON a.driver_id = b.id;
```

| id | vehicle_id | make | model | driver_id | driver_driver_id | driver_full_name |
|---|---|---|---|---|---|---|
| 1 | 5917273 | extended-make-81 | composite-model-81 | 1 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 2 | ptchol | integrated-make-82 | primary-model-82 | 2 | 6969422 | Account Name |
| 3 | m09 | seasonal-make-83 | adaptive-model-83 | 3 | 26730215 | Saipan International Airport |
| 4 | 3158135 | regional-make-84 | distributed-model-84 | 4 | 726033 | Norma Fisher |

**View `vehicle_governor_view`**

```sql
CREATE VIEW vehicle_governor_view AS
SELECT a.id, a.vehicle_id, a.make, a.model, b.id AS governor_id, b.governor_id AS governor_governor_id, b.full_name AS governor_full_name
FROM vehicles a JOIN governors b ON a.governor_id = b.id;
```

| id | vehicle_id | make | model | governor_id | governor_governor_id | governor_full_name |
|---|---|---|---|---|---|---|
| 1 | 5917273 | extended-make-81 | composite-model-81 | 1 | 6aa09e22-8fb2-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 2 | ptchol | integrated-make-82 | primary-model-82 | 2 | 1996917 | Account Name |
| 3 | m09 | seasonal-make-83 | adaptive-model-83 | 3 | 2087742 | Saipan International Airport |
| 4 | 3158135 | regional-make-84 | distributed-model-84 | 4 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Norma Fisher |

**View `driver_vehicle_view`**

```sql
CREATE VIEW driver_vehicle_view AS
SELECT a.id, a.driver_id, a.full_name, a.employer, b.id AS vehicle_id, b.vehicle_id AS vehicle_vehicle_id, b.make AS vehicle_make
FROM drivers a JOIN vehicles b ON a.vehicle_id = b.id;
```

| id | driver_id | full_name | employer | vehicle_id | vehicle_vehicle_id | vehicle_make |
|---|---|---|---|---|---|---|
| 1 | e878ea4c-8fd1-11eb-924d-9cd76263cbd0 | Theodore Mcgrath | National University of Singapore | 1 | 5917273 | extended-make-81 |
| 2 | 6969422 | Account Name | Occidental Petroleum | 2 | ptchol | integrated-make-82 |
| 3 | 26730215 | Saipan International Airport | ChargePoint Holdings. | 3 | m09 | seasonal-make-83 |
| 4 | 726033 | Norma Fisher | Ninja Van | 4 | 3158135 | regional-make-84 |

**View `disposable_product_consumer_view`**

```sql
CREATE VIEW disposable_product_consumer_view AS
SELECT a.id, a.product_code, a.product_name, a.material_composition, b.id AS consumer_id, b.consumer_id AS consumer_consumer_id, b.full_name AS consumer_full_name
FROM disposable_products a JOIN consumers b ON a.consumer_id = b.id;
```

| id | product_code | product_name | material_composition | consumer_id | consumer_consumer_id | consumer_full_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2675 | Composite Assessment | distributed-material-18 | 1 | 8350008 | Theodore Mcgrath |
| 101 | PRO-2681 | Compact Survey A | baseline-material-19 | 2 | 7119766 | Account Name |
| 102 | PRO-2687 | Legacy Corridor | pilot-material-20 | 3 | 1450664 | Saipan International Airport |
| 103 | PRO-2693 | Regional Series | extended-material-21 | 4 | 1437598 | Norma Fisher |

**View `consumer_disposable_product_view`**

```sql
CREATE VIEW consumer_disposable_product_view AS
SELECT a.id, a.consumer_id, a.full_name, a.residence_state, b.id AS product_id, b.product_code AS product_product_code, b.product_name AS product_product_name
FROM consumers a JOIN disposable_products b ON a.disposable_product_id = b.id;
```

| id | consumer_id | full_name | residence_state | product_id | product_product_code | product_product_name |
|---|---|---|---|---|---|---|
| 1 | 8350008 | Theodore Mcgrath | integrated-residenc-94 | 100 | PRO-2675 | Composite Assessment |
| 2 | 7119766 | Account Name | seasonal-residenc-95 | 101 | PRO-2681 | Compact Survey A |
| 3 | 1450664 | Saipan International Airport | regional-residenc-96 | 102 | PRO-2687 | Legacy Corridor |
| 4 | 1437598 | Norma Fisher | legacy-residenc-97 | 103 | PRO-2693 | Regional Series |

**View `consumer_state_view`**

```sql
CREATE VIEW consumer_state_view AS
SELECT a.id, a.consumer_id, a.full_name, a.residence_state, b.state_code AS state_state_code, b.state_name AS state_state_name, b.population AS state_population
FROM consumers a JOIN states b ON a.state_code = b.state_code;
```

| id | consumer_id | full_name | residence_state | state_state_code | state_state_name | state_population |
|---|---|---|---|---|---|---|
| 1 | 8350008 | Theodore Mcgrath | integrated-residenc-94 | 17788643 | Composite Protocol | 42 |
| 2 | 7119766 | Account Name | seasonal-residenc-95 | 8350031 | Compact Programme A | 49 |
| 3 | 1450664 | Saipan International Airport | regional-residenc-96 | 790483 | Legacy Standard | 56 |
| 4 | 1437598 | Norma Fisher | legacy-residenc-97 | 8387549 | Regional Framework | 63 |

**View `health_index_state_view`**

```sql
CREATE VIEW health_index_state_view AS
SELECT a.index_id, a.index_name, a.calculation_date, a.life_expectancy_score, b.state_code AS state_state_code, b.state_name AS state_state_name, b.population AS state_population
FROM health_indexes a JOIN states b ON a.state_code = b.state_code;
```

| index_id | index_name | calculation_date | life_expectancy_score | state_state_code | state_state_name | state_population |
|---|---|---|---|---|---|---|
| 4277025 | Primary Initiative A | 2025-04-11T15:45:00 | 4.20 | 17788643 | Composite Protocol | 42 |
| 3990161 | Composite Model | 2022-09-22T22:02:00 | 8.40 | 8350031 | Compact Programme A | 49 |
| 2106696 | Compact Cluster | 2023-02-06T05:19:00 | 12.60 | 790483 | Legacy Standard | 56 |
| 1450653 | Legacy Review D | 2024-07-17T12:36:00 | 16.80 | 8387549 | Regional Framework | 63 |

**View `state_governor_view`**

```sql
CREATE VIEW state_governor_view AS
SELECT a.state_code, a.state_name, a.population, a.gdp, b.id AS governor_id, b.governor_id AS governor_governor_id, b.full_name AS governor_full_name
FROM states a JOIN governors b ON a.governor_id = b.id;
```

| state_code | state_name | population | gdp | governor_id | governor_governor_id | governor_full_name |
|---|---|---|---|---|---|---|
| 17788643 | Composite Protocol | 42 | 23.20 | 1 | 6aa09e22-8fb2-11eb-924d-9cd76263cbd0 | Theodore Mcgrath |
| 8350031 | Compact Programme A | 49 | 27.40 | 2 | 1996917 | Account Name |
| 790483 | Legacy Standard | 56 | 31.60 | 3 | 2087742 | Saipan International Airport |
| 8387549 | Regional Framework | 63 | 35.80 | 4 | 340312da-9bad-11eb-a8a2-19ed5c03f8d3 | Norma Fisher |

**View `state_legislative_act_view`**

```sql
CREATE VIEW state_legislative_act_view AS
SELECT a.state_code, a.state_name, a.population, a.gdp, b.legislative_act_id AS act_legislative_act_id, b.act_identifier AS act_act_identifier, b.jurisdiction AS act_jurisdiction
FROM states a JOIN legislative_acts b ON a.legislative_act_id = b.legislative_act_id;
```

| state_code | state_name | population | gdp | act_legislative_act_id | act_act_identifier | act_jurisdiction |
|---|---|---|---|---|---|---|
| 17788643 | Composite Protocol | 42 | 23.20 | 1 | ACT-2177 | regional-jurisdic-30 |
| 8350031 | Compact Programme A | 49 | 27.40 | 2 | ACT-2182 | legacy-jurisdic-31 |
| 790483 | Legacy Standard | 56 | 31.60 | 3 | ACT-2187 | compact-jurisdic-32 |
| 8387549 | Regional Framework | 63 | 35.80 | 4 | ACT-2192 | composite-jurisdic-33 |

**View `state_health_index_view`**

```sql
CREATE VIEW state_health_index_view AS
SELECT a.state_code, a.state_name, a.population, a.gdp, b.index_id AS index_index_id, b.index_name AS index_index_name, b.calculation_date AS index_calculation_date
FROM states a JOIN health_indexes b ON a.index_id = b.index_id;
```

| state_code | state_name | population | gdp | index_index_id | index_index_name | index_calculation_date |
|---|---|---|---|---|---|---|
| 17788643 | Composite Protocol | 42 | 23.20 | 4277025 | Primary Initiative A | 2025-04-11T15:45:00 |
| 8350031 | Compact Programme A | 49 | 27.40 | 3990161 | Composite Model | 2022-09-22T22:02:00 |
| 790483 | Legacy Standard | 56 | 31.60 | 2106696 | Compact Cluster | 2023-02-06T05:19:00 |
| 8387549 | Regional Framework | 63 | 35.80 | 1450653 | Legacy Review D | 2024-07-17T12:36:00 |
