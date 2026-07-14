## Demographic and Civic Infrastructure

The administrative architecture of a modern settlement system rests on the interlocking records of people, places, and the regulatory instruments that bind them. At its core, the domain captures the lifecycle of a population: where individuals are born, where they reside, how they are enumerated by census authorities, and which governmental decrees govern their registration. Each entity type carries its own set of attributes, and the relationships between them form a coherent picture of civic administration. The records are organized into seven base tables and twenty derived views that join these tables to answer specific operational questions.

**Table `human_persons`**

| id | has_given_name | has_family_name | has_occupation_role | has_residence_location | has_ancestral_origin_location | human_person_id | has_spouse_human_person_id | settlement_id | census_registration_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | Kona International Airport | Cheryl Bradley | extended-occupati-81 | distributed-residenc-90 | integrated-ancestra-46 | 1000 | 1000 | 1 | 1 |
| 1001 | Collin Lopez | Mary Alvarez | integrated-occupati-82 | baseline-residenc-91 | seasonal-ancestra-47 | 1001 | 1001 | 2 | 2 |
| 1002 | Susan Wagner | Stefanie Lara | seasonal-occupati-83 | pilot-residenc-92 | regional-ancestra-48 | 1002 | 1002 | 3 | 3 |
| 1003 | Sean Green | Desiree Cain | regional-occupati-84 | extended-residenc-93 | legacy-ancestra-49 | 1003 | 1003 | 4 | 4 |

The human_persons table is the central ledger of individuals within the system. Each row records a person's given name, family name, occupation role, residence classification, and ancestral origin. The occupation and residence fields use coded descriptors such as `extended-occupati-81` or `distributed-residenc-90`, which categorize the person's economic and residential status. The table also captures marital relationships through the spouse reference column, allowing a person to be linked to their partner. In the sample data, Kona International Airport (record 1000) holds an extended occupation role and a distributed residence, while Collin Lopez (record 1001) carries an integrated occupation and a baseline residence. Each person is also associated with a settlement and a census registration, anchoring them to a geographic and administrative context.

**Table `settlements`**

| settlement_id | has_settlement_name | has_geographic_region | has_population_density | building_id | census_registration_id |
|---|---|---|---|---|---|
| 1 | Integrated Model A | distributed-geograph-24 | 13 | 1 | 1 |
| 2 | Extended Cluster | baseline-geograph-25 | 16 | 2 | 2 |
| 3 | Pilot Review | pilot-geograph-26 | 19 | 3 | 3 |
| 4 | Baseline Initiative D | extended-geograph-27 | 22 | 4 | 4 |

Settlements represent the geographic and administrative units where populations are concentrated. Each settlement carries a descriptive name—Integrated Model A, Extended Cluster, Pilot Review, Baseline Initiative D—along with a geographic region classification and a population density figure. The density values in the sample range from 13 to 22, indicating varying levels of concentration across the four settlements. Settlements serve as the geographic anchor for both buildings and census registrations, creating a spatial framework within which the rest of the domain operates.

**Table `buildings`**

| id | has_building_type | has_material_composition | has_occupancy_status | has_animal_occupants | settlement_id | birth_event_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | composite-building-87 | distributed-material-66 | distributed-occupanc-18 | true | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | primary-building-88 | baseline-material-67 | baseline-occupanc-19 | false | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | adaptive-building-89 | pilot-material-68 | pilot-occupanc-20 | true | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | distributed-building-90 | extended-material-69 | extended-occupanc-21 | false | 4 | 4 | 2025-04-16 09:14:00 |

Buildings are the physical structures within settlements, each characterized by a type, material composition, occupancy status, and a flag indicating whether animals occupy the premises. The building types—composite, primary, adaptive, distributed—correspond to material compositions such as `distributed-material-66` and `baseline-material-67`. Occupancy status follows a similar coding scheme, with values like `distributed-occupanc-18` and `pilot-occupanc-20`. The animal occupants column is a boolean indicator; buildings 1 and 3 report true, while buildings 2 and 4 report false. Each building is linked to a settlement and, in some cases, to a birth event, tying the physical infrastructure to human activity.

**Table `birth_events`**

| birth_event_id | has_event_date | has_birth_location | building_id | human_person_id | has_father_human_person_id | has_child_human_person_id |
|---|---|---|---|---|---|---|
| 1 | 2025-12-24 | pilot-birth-68 | 1 | 1000 | 1000 | 1000 |
| 2 | 2022-05-08 | extended-birth-69 | 2 | 1001 | 1001 | 1001 |
| 3 | 2023-10-19 | integrated-birth-70 | 3 | 1002 | 1002 | 1002 |
| 4 | 2024-03-03 | seasonal-birth-71 | 4 | 1003 | 1003 | 1003 |

Birth events record the occurrence of a birth, including the date, location, and the individuals involved. The location field uses coded descriptors such as `pilot-birth-68` and `extended-birth-69`. Each event references a building where the birth took place, a person associated with the event, a father, and a child. In the sample data, the birth event dated 2025-12-24 (record 1) occurred at location `pilot-birth-68` in building 1, involving person 1000 as father and child. The temporal spread of the births—from 2022 through 2025—illustrates how the system tracks demographic events across multiple years.

**Table `census_registrations`**

| id | has_registration_date | has_registration_location | has_mandating_authority | has_purpose | government_decree_id | human_person_id | settlement_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 2023-10-25 | seasonal-registra-53 | legacy-mandatin-85 | compact-purpose-98 | 100 | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 2024-03-09 | regional-registra-54 | compact-mandatin-86 | composite-purpose-99 | 101 | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2025-08-20 | legacy-registra-55 | composite-mandatin-87 | primary-purpose-100 | 102 | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 2022-01-04 | compact-registra-56 | primary-mandatin-88 | adaptive-purpose-101 | 103 | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Census registrations document the formal enumeration of individuals by census authorities. Each registration includes a date, a location code, a mandating authority, a purpose classification, and references to the government decree that authorized it, the person being registered, and the settlement in which they reside. The mandating authority uses codes such as `legacy-mandatin-85` and `compact-mandatin-86`, while purposes include `compact-purpose-98` and `composite-purpose-99`. The sample registrations span from 2022 to 2025, with each registration tied to a specific government decree (IDs 100 through 103) and a distinct person and settlement.

**Table `government_decrees`**

| id | has_decree_title | has_issuing_emperor | has_enforcement_date | has_legal_requirement | human_person_id | census_registration_id |
|---|---|---|---|---|---|---|
| 100 | Primary Survey A | composite-issuing-81 | 2024-03-07 | integrated-legal-52 | 1000 | 1 |
| 101 | Composite Corridor | primary-issuing-82 | 2025-08-18 | seasonal-legal-53 | 1001 | 2 |
| 102 | Compact Series | adaptive-issuing-83 | 2022-01-02 | regional-legal-54 | 1002 | 3 |
| 103 | Legacy Assessment D | distributed-issuing-84 | 2023-06-13 | legacy-legal-55 | 1003 | 4 |

Government decrees are the regulatory instruments that authorize and govern census activities. Each decree carries a title—Primary Survey A, Composite Corridor, Compact Series, Legacy Assessment D—along with an issuing authority, an enforcement date, and a legal requirement classification. The issuing authorities use codes like `composite-issuing-81` and `primary-issuing-82`, while legal requirements include `integrated-legal-52` and `seasonal-legal-53`. Decrees are linked to both a person and a census registration, establishing the chain of authority from the issuing body through the authorized individual to the resulting registration.

**Table `infant_care_items`**

| infant_care_item_id | has_item_name | has_material_type | has_physical_condition | birth_event_id | building_id | created_at |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-material-53 | extended-physical-75 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | Distributed Model | regional-material-54 | integrated-physical-76 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | Adaptive Cluster | legacy-material-55 | seasonal-physical-77 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | Primary Review A | compact-material-56 | regional-physical-78 | 4 | 4 | 2025-04-16 09:14:00 |

Infant care items represent the material provisions associated with newborns and their care. While the base table captures individual items, the domain's views connect these items to birth events and buildings, enabling administrators to track which facilities and which births are associated with specific care provisions. This linkage supports resource allocation and accountability in infant welfare programs.

### Marital and Relational Networks

The human_person_human_person_view reveals the self-referential structure of the person table, where each individual is linked to their spouse. In the sample data, every person is their own spouse reference, indicating that the marital linkage column is populated with the person's own identifier. This pattern suggests that the system supports both self-referential records and paired relationships, with the view making the marital topology explicit. Administrators can query this view to identify individuals who have a distinct spouse record versus those whose spouse field points to themselves, enabling demographic analysis of household composition.

### Settlement and Person Alignment

The human_person_settlement_view joins individuals to their assigned settlements, answering the question of which population segments belong to which geographic units. In the sample data, person 1000 (Kona International Airport) is aligned with settlement 1 (Integrated Model A), while person 1003 (Sean Green) is aligned with settlement 4 (Baseline Initiative D). The view preserves the person's name, occupation, and residence classification alongside the settlement's name, geographic region, and population density. This alignment is critical for resource planning, as it allows administrators to correlate individual characteristics with the density and regional attributes of their assigned settlements.

### Census and Person Linkage

The human_person_census_registration_view connects individuals to their census records, providing a complete picture of each person's administrative status. Person 1000 appears with census registration 1, dated 2023-10-25, under the mandating authority `legacy-mandatin-85` and purpose `compact-purpose-98`. Person 1003 appears with registration 4, dated 2022-01-04, under `primary-mandatin-88` and `adaptive-purpose-101`. The view enables administrators to verify that every person has a corresponding registration, to audit the purposes for which registrations were made, and to trace the temporal sequence of census activities across the population.

### Settlement and Building Inventory

The settlement_building_view maps each settlement to its constituent buildings, answering the question of which physical structures belong to which administrative unit. Settlement 1 (Integrated Model A) contains building 1, a composite building with distributed material and true animal occupancy. Settlement 3 (Pilot Review) contains building 3, an adaptive building with pilot material and true animal occupancy. The view preserves the building's type, material, occupancy status, and animal occupancy flag alongside the settlement's name and population density. This mapping is essential for infrastructure management, as it allows administrators to assess the building stock of each settlement and identify patterns such as which settlements have animal-occupied structures.

### Settlement and Census Coverage

The settlement_census_registration_view links settlements to their census registrations, revealing the administrative coverage of each geographic unit. Settlement 1 is associated with registration 1 (dated 2023-10-25), while settlement 4 is associated with registration 4 (dated 2022-01-04). The view combines the settlement's name, geographic region, and population density with the registration's date, location, mandating authority, and purpose. This linkage enables administrators to verify that each settlement has been enumerated, to compare the timing of census activities across settlements, and to identify any gaps in coverage.

### Building and Settlement Context

The building_settlement_view provides the reverse mapping from buildings to their parent settlements, answering the question of which settlement a given building belongs to. Building 1 (composite-building-87) belongs to settlement 1 (Integrated Model A), and building 4 (distributed-building-90) belongs to settlement 4 (Baseline Initiative D). The view preserves the building's type, material composition, occupancy status, and animal occupancy flag alongside the settlement's name and population density. This perspective is useful for facility managers who need to understand the broader administrative context of each building.

### Building and Birth Event Association

The building_birth_event_view connects buildings to the birth events that occurred within them, answering the question of which facilities have served as birth locations. Building 1 is associated with birth event 1 (dated 2025-12-24 at location `pilot-birth-68`), and building 3 is associated with birth event 3 (dated 2023-10-19 at location `integrated-birth-70`). The view preserves the building's type, material, occupancy status, and animal occupancy flag alongside the birth event's date, location, and the persons involved. This linkage supports healthcare planning by identifying which buildings have hosted births and correlating those events with the building's characteristics.

### Birth Event and Building Context

The birth_event_building_view provides the reverse mapping from birth events to their host buildings, answering the question of which building hosted a given birth. Birth event 1 occurred in building 1, a composite building with distributed material and true animal occupancy. Birth event 4 occurred in building 4, a distributed building with extended material and false animal occupancy. The view preserves the birth event's date, location, and person references alongside the building's type, material, occupancy status, and animal occupancy flag. This perspective is useful for auditing birth locations and assessing whether the characteristics of the hosting building correlate with specific outcomes.

### Birth Event and Person Relationships

The birth_event_human_person_view links birth events to the individuals involved, answering the question of which persons are associated with a given birth. Birth event 1 involves person 1000 as both father and child, while birth event 2 involves person 1001. The view preserves the birth event's date, location, and building reference alongside the person's name, occupation, and residence classification. This linkage is critical for demographic analysis, as it enables administrators to trace family relationships, track birth rates by occupation or residence type, and identify patterns in the demographic composition of the population.

### Census and Government Authority

The census_registration_government_decree_view connects census registrations to the government decrees that authorized them, answering the question of which decree governs a given registration. Registration 1 is authorized by decree 100 (Primary Survey A, issued by `composite-issuing-81`, enforced 2024-03-07, with legal requirement `integrated-legal-52`). Registration 4 is authorized by decree 103 (Legacy Assessment D, issued by `distributed-issuing-84`, enforced 2023-06-13, with legal requirement `legacy-legal-55`). The view preserves the registration's date, location, mandating authority, and purpose alongside the decree's title, issuing authority, enforcement date, and legal requirement. This linkage is essential for regulatory compliance, as it allows administrators to verify that each registration has a valid authorizing decree and to audit the legal framework governing census activities.

### Census and Person Registration

The census_registration_human_person_view links census registrations to the individuals they enumerate, answering the question of which person is covered by a given registration. Registration 1 covers person 1000 (Kona International Airport), while registration 4 covers person 1003 (Sean Green). The view preserves the registration's date, location, mandating authority, and purpose alongside the person's name, occupation, and residence classification. This linkage enables administrators to verify that each person has a corresponding registration, to audit the purposes for which registrations were made, and to trace the temporal sequence of census activities across the population.

### Census and Settlement Coverage

The census_registration_settlement_view connects census registrations to their associated settlements, answering the question of which settlement a given registration pertains to. Registration 1 pertains to settlement 1 (Integrated Model A), and registration 4 pertains to settlement 4 (Baseline Initiative D). The view preserves the registration's date, location, mandating authority, and purpose alongside the settlement's name, geographic region, and population density. This linkage is critical for geographic planning, as it allows administrators to assess census coverage across settlements and to correlate registration activity with settlement characteristics such as population density.

### Government Decree and Person Authorization

The government_decree_human_person_view links government decrees to the persons they authorize, answering the question of which individual is associated with a given decree. Decree 100 (Primary Survey A) is associated with person 1000, while decree 103 (Legacy Assessment D) is associated with person 1003. The view preserves the decree's title, issuing authority, enforcement date, and legal requirement alongside the person's name, occupation, and residence classification. This linkage supports accountability by establishing which persons are responsible for or affected by each decree.

### Government Decree and Census Registration

The government_decree_census_registration_view connects government decrees to the census registrations they authorize, answering the question of which registration is governed by a given decree. Decree 100 governs registration 1, and decree 103 governs registration 4. The view preserves the decree's title, issuing authority, enforcement date, and legal requirement alongside the registration's date, location, mandating authority, and purpose. This linkage is essential for regulatory compliance, as it allows administrators to trace the chain of authority from decree to registration and to verify that each registration has a valid legal basis.

### Infant Care and Birth Events

The infant_care_item_birth_event_view links infant care items to the birth events they support, answering the question of which births are associated with specific care provisions. While the sample data for infant care items is not enumerated in the base table, the view structure enables administrators to track which birth events have received care item allocations and to correlate those allocations with the characteristics of the birth event, including its date, location, and the persons involved. This linkage supports resource allocation and accountability in infant welfare programs.

### Infant Care and Building Proximity

The infant_care_item_building_view connects infant care items to the buildings in which the associated births occurred, answering the question of which facilities have received care item provisions. The view preserves the care item's attributes alongside the building's type, material composition, occupancy status, and animal occupancy flag. This linkage enables administrators to assess whether certain building types or material compositions are associated with higher or lower care item allocations, supporting evidence-based resource distribution decisions.

### Synthesis

The domain's seven base tables and twenty derived views form a comprehensive framework for tracking the demographic and civic infrastructure of a settlement system. People are linked to settlements, census registrations, and birth events; settlements contain buildings and host census registrations; buildings serve as birth locations and receive care provisions; birth events connect individuals to physical structures; census registrations are authorized by government decrees; and decrees are tied to both persons and registrations. Each view answers a specific operational question, from marital network analysis to regulatory compliance auditing. The coded descriptors for occupations, residences, materials, and legal requirements provide a standardized vocabulary that enables consistent reporting across the system. Together, these records and their relationships form the backbone of a population administration system that supports planning, accountability, and resource allocation across a distributed settlement network.

## Data appendix

**View `human_person_human_person_view`**

```sql
CREATE VIEW human_person_human_person_view AS
SELECT a.id, a.has_given_name, a.has_family_name, a.has_occupation_role, b.id AS person_id, b.has_given_name AS person_has_given_name, b.has_family_name AS person_has_family_name
FROM human_persons a JOIN human_persons b ON a.human_person_id = b.id;
```

| id | has_given_name | has_family_name | has_occupation_role | person_id | person_has_given_name | person_has_family_name |
|---|---|---|---|---|---|---|
| 1000 | Kona International Airport | Cheryl Bradley | extended-occupati-81 | 1000 | Kona International Airport | Cheryl Bradley |
| 1001 | Collin Lopez | Mary Alvarez | integrated-occupati-82 | 1001 | Collin Lopez | Mary Alvarez |
| 1002 | Susan Wagner | Stefanie Lara | seasonal-occupati-83 | 1002 | Susan Wagner | Stefanie Lara |
| 1003 | Sean Green | Desiree Cain | regional-occupati-84 | 1003 | Sean Green | Desiree Cain |

**View `human_person_settlement_view`**

```sql
CREATE VIEW human_person_settlement_view AS
SELECT a.id, a.has_given_name, a.has_family_name, a.has_occupation_role, b.settlement_id AS settlement_settlement_id, b.has_settlement_name AS settlement_has_settlement_name, b.has_geographic_region AS settlement_has_geographic_region
FROM human_persons a JOIN settlements b ON a.settlement_id = b.settlement_id;
```

| id | has_given_name | has_family_name | has_occupation_role | settlement_settlement_id | settlement_has_settlement_name | settlement_has_geographic_region |
|---|---|---|---|---|---|---|
| 1000 | Kona International Airport | Cheryl Bradley | extended-occupati-81 | 1 | Integrated Model A | distributed-geograph-24 |
| 1001 | Collin Lopez | Mary Alvarez | integrated-occupati-82 | 2 | Extended Cluster | baseline-geograph-25 |
| 1002 | Susan Wagner | Stefanie Lara | seasonal-occupati-83 | 3 | Pilot Review | pilot-geograph-26 |
| 1003 | Sean Green | Desiree Cain | regional-occupati-84 | 4 | Baseline Initiative D | extended-geograph-27 |

**View `human_person_census_registration_view`**

```sql
CREATE VIEW human_person_census_registration_view AS
SELECT a.id, a.has_given_name, a.has_family_name, a.has_occupation_role, b.id AS registration_id, b.has_registration_date AS registration_has_registration_date, b.has_registration_location AS registration_has_registration_location
FROM human_persons a JOIN census_registrations b ON a.census_registration_id = b.id;
```

| id | has_given_name | has_family_name | has_occupation_role | registration_id | registration_has_registration_date | registration_has_registration_location |
|---|---|---|---|---|---|---|
| 1000 | Kona International Airport | Cheryl Bradley | extended-occupati-81 | 1 | 2023-10-25 | seasonal-registra-53 |
| 1001 | Collin Lopez | Mary Alvarez | integrated-occupati-82 | 2 | 2024-03-09 | regional-registra-54 |
| 1002 | Susan Wagner | Stefanie Lara | seasonal-occupati-83 | 3 | 2025-08-20 | legacy-registra-55 |
| 1003 | Sean Green | Desiree Cain | regional-occupati-84 | 4 | 2022-01-04 | compact-registra-56 |

**View `settlement_building_view`**

```sql
CREATE VIEW settlement_building_view AS
SELECT a.settlement_id, a.has_settlement_name, a.has_geographic_region, a.has_population_density, b.id AS building_id, b.has_building_type AS building_has_building_type, b.has_material_composition AS building_has_material_composition
FROM settlements a JOIN buildings b ON a.building_id = b.id;
```

| settlement_id | has_settlement_name | has_geographic_region | has_population_density | building_id | building_has_building_type | building_has_material_composition |
|---|---|---|---|---|---|---|
| 1 | Integrated Model A | distributed-geograph-24 | 13 | 1 | composite-building-87 | distributed-material-66 |
| 2 | Extended Cluster | baseline-geograph-25 | 16 | 2 | primary-building-88 | baseline-material-67 |
| 3 | Pilot Review | pilot-geograph-26 | 19 | 3 | adaptive-building-89 | pilot-material-68 |
| 4 | Baseline Initiative D | extended-geograph-27 | 22 | 4 | distributed-building-90 | extended-material-69 |

**View `settlement_census_registration_view`**

```sql
CREATE VIEW settlement_census_registration_view AS
SELECT a.settlement_id, a.has_settlement_name, a.has_geographic_region, a.has_population_density, b.id AS registration_id, b.has_registration_date AS registration_has_registration_date, b.has_registration_location AS registration_has_registration_location
FROM settlements a JOIN census_registrations b ON a.census_registration_id = b.id;
```

| settlement_id | has_settlement_name | has_geographic_region | has_population_density | registration_id | registration_has_registration_date | registration_has_registration_location |
|---|---|---|---|---|---|---|
| 1 | Integrated Model A | distributed-geograph-24 | 13 | 1 | 2023-10-25 | seasonal-registra-53 |
| 2 | Extended Cluster | baseline-geograph-25 | 16 | 2 | 2024-03-09 | regional-registra-54 |
| 3 | Pilot Review | pilot-geograph-26 | 19 | 3 | 2025-08-20 | legacy-registra-55 |
| 4 | Baseline Initiative D | extended-geograph-27 | 22 | 4 | 2022-01-04 | compact-registra-56 |

**View `building_settlement_view`**

```sql
CREATE VIEW building_settlement_view AS
SELECT a.id, a.has_building_type, a.has_material_composition, a.has_occupancy_status, b.settlement_id AS settlement_settlement_id, b.has_settlement_name AS settlement_has_settlement_name, b.has_geographic_region AS settlement_has_geographic_region
FROM buildings a JOIN settlements b ON a.settlement_id = b.settlement_id;
```

| id | has_building_type | has_material_composition | has_occupancy_status | settlement_settlement_id | settlement_has_settlement_name | settlement_has_geographic_region |
|---|---|---|---|---|---|---|
| 1 | composite-building-87 | distributed-material-66 | distributed-occupanc-18 | 1 | Integrated Model A | distributed-geograph-24 |
| 2 | primary-building-88 | baseline-material-67 | baseline-occupanc-19 | 2 | Extended Cluster | baseline-geograph-25 |
| 3 | adaptive-building-89 | pilot-material-68 | pilot-occupanc-20 | 3 | Pilot Review | pilot-geograph-26 |
| 4 | distributed-building-90 | extended-material-69 | extended-occupanc-21 | 4 | Baseline Initiative D | extended-geograph-27 |

**View `building_birth_event_view`**

```sql
CREATE VIEW building_birth_event_view AS
SELECT a.id, a.has_building_type, a.has_material_composition, a.has_occupancy_status, b.birth_event_id AS event_birth_event_id, b.has_event_date AS event_has_event_date, b.has_birth_location AS event_has_birth_location
FROM buildings a JOIN birth_events b ON a.birth_event_id = b.birth_event_id;
```

| id | has_building_type | has_material_composition | has_occupancy_status | event_birth_event_id | event_has_event_date | event_has_birth_location |
|---|---|---|---|---|---|---|
| 1 | composite-building-87 | distributed-material-66 | distributed-occupanc-18 | 1 | 2025-12-24 | pilot-birth-68 |
| 2 | primary-building-88 | baseline-material-67 | baseline-occupanc-19 | 2 | 2022-05-08 | extended-birth-69 |
| 3 | adaptive-building-89 | pilot-material-68 | pilot-occupanc-20 | 3 | 2023-10-19 | integrated-birth-70 |
| 4 | distributed-building-90 | extended-material-69 | extended-occupanc-21 | 4 | 2024-03-03 | seasonal-birth-71 |

**View `birth_event_building_view`**

```sql
CREATE VIEW birth_event_building_view AS
SELECT a.birth_event_id, a.has_event_date, a.has_birth_location, a.human_person_id, b.id AS building_id, b.has_building_type AS building_has_building_type, b.has_material_composition AS building_has_material_composition
FROM birth_events a JOIN buildings b ON a.building_id = b.id;
```

| birth_event_id | has_event_date | has_birth_location | human_person_id | building_id | building_has_building_type | building_has_material_composition |
|---|---|---|---|---|---|---|
| 1 | 2025-12-24 | pilot-birth-68 | 1000 | 1 | composite-building-87 | distributed-material-66 |
| 2 | 2022-05-08 | extended-birth-69 | 1001 | 2 | primary-building-88 | baseline-material-67 |
| 3 | 2023-10-19 | integrated-birth-70 | 1002 | 3 | adaptive-building-89 | pilot-material-68 |
| 4 | 2024-03-03 | seasonal-birth-71 | 1003 | 4 | distributed-building-90 | extended-material-69 |

**View `birth_event_human_person_view`**

```sql
CREATE VIEW birth_event_human_person_view AS
SELECT a.birth_event_id, a.has_event_date, a.has_birth_location, a.building_id, b.id AS person_id, b.has_given_name AS person_has_given_name, b.has_family_name AS person_has_family_name
FROM birth_events a JOIN human_persons b ON a.human_person_id = b.id;
```

| birth_event_id | has_event_date | has_birth_location | building_id | person_id | person_has_given_name | person_has_family_name |
|---|---|---|---|---|---|---|
| 1 | 2025-12-24 | pilot-birth-68 | 1 | 1000 | Kona International Airport | Cheryl Bradley |
| 2 | 2022-05-08 | extended-birth-69 | 2 | 1001 | Collin Lopez | Mary Alvarez |
| 3 | 2023-10-19 | integrated-birth-70 | 3 | 1002 | Susan Wagner | Stefanie Lara |
| 4 | 2024-03-03 | seasonal-birth-71 | 4 | 1003 | Sean Green | Desiree Cain |

**View `census_registration_government_decree_view`**

```sql
CREATE VIEW census_registration_government_decree_view AS
SELECT a.id, a.has_registration_date, a.has_registration_location, a.has_mandating_authority, b.id AS decree_id, b.has_decree_title AS decree_has_decree_title, b.has_issuing_emperor AS decree_has_issuing_emperor
FROM census_registrations a JOIN government_decrees b ON a.government_decree_id = b.id;
```

| id | has_registration_date | has_registration_location | has_mandating_authority | decree_id | decree_has_decree_title | decree_has_issuing_emperor |
|---|---|---|---|---|---|---|
| 1 | 2023-10-25 | seasonal-registra-53 | legacy-mandatin-85 | 100 | Primary Survey A | composite-issuing-81 |
| 2 | 2024-03-09 | regional-registra-54 | compact-mandatin-86 | 101 | Composite Corridor | primary-issuing-82 |
| 3 | 2025-08-20 | legacy-registra-55 | composite-mandatin-87 | 102 | Compact Series | adaptive-issuing-83 |
| 4 | 2022-01-04 | compact-registra-56 | primary-mandatin-88 | 103 | Legacy Assessment D | distributed-issuing-84 |

**View `census_registration_human_person_view`**

```sql
CREATE VIEW census_registration_human_person_view AS
SELECT a.id, a.has_registration_date, a.has_registration_location, a.has_mandating_authority, b.id AS person_id, b.has_given_name AS person_has_given_name, b.has_family_name AS person_has_family_name
FROM census_registrations a JOIN human_persons b ON a.human_person_id = b.id;
```

| id | has_registration_date | has_registration_location | has_mandating_authority | person_id | person_has_given_name | person_has_family_name |
|---|---|---|---|---|---|---|
| 1 | 2023-10-25 | seasonal-registra-53 | legacy-mandatin-85 | 1000 | Kona International Airport | Cheryl Bradley |
| 2 | 2024-03-09 | regional-registra-54 | compact-mandatin-86 | 1001 | Collin Lopez | Mary Alvarez |
| 3 | 2025-08-20 | legacy-registra-55 | composite-mandatin-87 | 1002 | Susan Wagner | Stefanie Lara |
| 4 | 2022-01-04 | compact-registra-56 | primary-mandatin-88 | 1003 | Sean Green | Desiree Cain |

**View `census_registration_settlement_view`**

```sql
CREATE VIEW census_registration_settlement_view AS
SELECT a.id, a.has_registration_date, a.has_registration_location, a.has_mandating_authority, b.settlement_id AS settlement_settlement_id, b.has_settlement_name AS settlement_has_settlement_name, b.has_geographic_region AS settlement_has_geographic_region
FROM census_registrations a JOIN settlements b ON a.settlement_id = b.settlement_id;
```

| id | has_registration_date | has_registration_location | has_mandating_authority | settlement_settlement_id | settlement_has_settlement_name | settlement_has_geographic_region |
|---|---|---|---|---|---|---|
| 1 | 2023-10-25 | seasonal-registra-53 | legacy-mandatin-85 | 1 | Integrated Model A | distributed-geograph-24 |
| 2 | 2024-03-09 | regional-registra-54 | compact-mandatin-86 | 2 | Extended Cluster | baseline-geograph-25 |
| 3 | 2025-08-20 | legacy-registra-55 | composite-mandatin-87 | 3 | Pilot Review | pilot-geograph-26 |
| 4 | 2022-01-04 | compact-registra-56 | primary-mandatin-88 | 4 | Baseline Initiative D | extended-geograph-27 |

**View `government_decree_human_person_view`**

```sql
CREATE VIEW government_decree_human_person_view AS
SELECT a.id, a.has_decree_title, a.has_issuing_emperor, a.has_enforcement_date, b.id AS person_id, b.has_given_name AS person_has_given_name, b.has_family_name AS person_has_family_name
FROM government_decrees a JOIN human_persons b ON a.human_person_id = b.id;
```

| id | has_decree_title | has_issuing_emperor | has_enforcement_date | person_id | person_has_given_name | person_has_family_name |
|---|---|---|---|---|---|---|
| 100 | Primary Survey A | composite-issuing-81 | 2024-03-07 | 1000 | Kona International Airport | Cheryl Bradley |
| 101 | Composite Corridor | primary-issuing-82 | 2025-08-18 | 1001 | Collin Lopez | Mary Alvarez |
| 102 | Compact Series | adaptive-issuing-83 | 2022-01-02 | 1002 | Susan Wagner | Stefanie Lara |
| 103 | Legacy Assessment D | distributed-issuing-84 | 2023-06-13 | 1003 | Sean Green | Desiree Cain |

**View `government_decree_census_registration_view`**

```sql
CREATE VIEW government_decree_census_registration_view AS
SELECT a.id, a.has_decree_title, a.has_issuing_emperor, a.has_enforcement_date, b.id AS registration_id, b.has_registration_date AS registration_has_registration_date, b.has_registration_location AS registration_has_registration_location
FROM government_decrees a JOIN census_registrations b ON a.census_registration_id = b.id;
```

| id | has_decree_title | has_issuing_emperor | has_enforcement_date | registration_id | registration_has_registration_date | registration_has_registration_location |
|---|---|---|---|---|---|---|
| 100 | Primary Survey A | composite-issuing-81 | 2024-03-07 | 1 | 2023-10-25 | seasonal-registra-53 |
| 101 | Composite Corridor | primary-issuing-82 | 2025-08-18 | 2 | 2024-03-09 | regional-registra-54 |
| 102 | Compact Series | adaptive-issuing-83 | 2022-01-02 | 3 | 2025-08-20 | legacy-registra-55 |
| 103 | Legacy Assessment D | distributed-issuing-84 | 2023-06-13 | 4 | 2022-01-04 | compact-registra-56 |

**View `infant_care_item_birth_event_view`**

```sql
CREATE VIEW infant_care_item_birth_event_view AS
SELECT a.infant_care_item_id, a.has_item_name, a.has_material_type, a.has_physical_condition, b.birth_event_id AS event_birth_event_id, b.has_event_date AS event_has_event_date, b.has_birth_location AS event_has_birth_location
FROM infant_care_items a JOIN birth_events b ON a.birth_event_id = b.birth_event_id;
```

| infant_care_item_id | has_item_name | has_material_type | has_physical_condition | event_birth_event_id | event_has_event_date | event_has_birth_location |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-material-53 | extended-physical-75 | 1 | 2025-12-24 | pilot-birth-68 |
| 2 | Distributed Model | regional-material-54 | integrated-physical-76 | 2 | 2022-05-08 | extended-birth-69 |
| 3 | Adaptive Cluster | legacy-material-55 | seasonal-physical-77 | 3 | 2023-10-19 | integrated-birth-70 |
| 4 | Primary Review A | compact-material-56 | regional-physical-78 | 4 | 2024-03-03 | seasonal-birth-71 |

**View `infant_care_item_building_view`**

```sql
CREATE VIEW infant_care_item_building_view AS
SELECT a.infant_care_item_id, a.has_item_name, a.has_material_type, a.has_physical_condition, b.id AS building_id, b.has_building_type AS building_has_building_type, b.has_material_composition AS building_has_material_composition
FROM infant_care_items a JOIN buildings b ON a.building_id = b.id;
```

| infant_care_item_id | has_item_name | has_material_type | has_physical_condition | building_id | building_has_building_type | building_has_material_composition |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | seasonal-material-53 | extended-physical-75 | 1 | composite-building-87 | distributed-material-66 |
| 2 | Distributed Model | regional-material-54 | integrated-physical-76 | 2 | primary-building-88 | baseline-material-67 |
| 3 | Adaptive Cluster | legacy-material-55 | seasonal-physical-77 | 3 | adaptive-building-89 | pilot-material-68 |
| 4 | Primary Review A | compact-material-56 | regional-physical-78 | 4 | distributed-building-90 | extended-material-69 |
