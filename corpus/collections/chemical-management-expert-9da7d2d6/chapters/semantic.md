The chemical management domain is governed by a network of regulatory authorities, expert practitioners, international coordination bodies, and the facilities they oversee. At its core, the ontology distinguishes six entity types—chemical management experts, environmental authorities, international networks, environmental regulations, chemical activities, and facilities—linked through a set of cardinality-bounded relationships that capture who regulates whom, which regulations govern which activities, and where those activities take place. The relational schema materializes this ontology by distributing entity attributes across seven base tables, introducing foreign keys to encode one-to-one and many-to-one associations, and using a junction table to resolve a many-to-many link between authorities and experts. Twelve materialized views then reassemble the normalized facts into domain-level narratives, each answering a specific regulatory question by joining the appropriate tables.

## Base Tables and Entity Modelling

The foundation of the schema is the `chemical_management_experts` table, which stores individual practitioners who advise on chemical safety and compliance. Each row carries a surrogate `id` (e.g. `100`), a human-readable `expert_identifier` such as `EXP-2308`, and a `full_name` like `Theodore Mcgrath`. The `degree` and `specialization` columns hold categorical labels—`legacy-degree-61` and `legacy-speciali-13` in the first row—while `start_date` records the practitioner's appointment timestamp (`2022-09-05T20:24:00`). The `current_status` column constrains the expert to one of three lifecycle states: `active`, `inactive`, or `pending`. Two foreign keys, `environmental_authority_id` and `international_network_id`, bind each expert to exactly one authority and one network respectively, enforcing a many-to-one cardinality from experts to both organizational entities.

**Table `chemical_management_experts`**

| id | expert_identifier | full_name | degree | specialization | start_date | current_status | environmental_authority_id | international_network_id |
|---|---|---|---|---|---|---|---|---|
| 100 | EXP-2308 | Theodore Mcgrath | legacy-degree-61 | legacy-speciali-13 | 2022-09-05T20:24:00 | active | 100 | 100 |
| 101 | EXP-2314 | Account Name | compact-degree-62 | compact-speciali-14 | 2023-02-16T03:41:00 | inactive | 101 | 101 |
| 102 | EXP-2320 | Saipan International Airport | composite-degree-63 | composite-speciali-15 | 2024-07-27T10:58:00 | pending | 102 | 102 |
| 103 | EXP-2326 | Norma Fisher | primary-degree-64 | primary-speciali-16 | 2025-12-11T17:15:00 | active | 103 | 103 |

Environmental authorities are modelled in the `environmental_authorities` table, which represents the regulatory bodies that issue and enforce chemical management rules. The primary key `environmental_authority_id` (e.g. `100`) is paired with an `authority_code` that may be numeric (`6926376`) or UUID-like (`5fc685e2-8fcc-11eb-924d-9cd76263cbd0`). The `authority_name` column stores the human-readable name (`Sean Green`), while `country_code` carries a jurisdictional identifier. The `established_date` (`2024-03-27`) and `competence_level` (`national`, `regional`, or `local`) describe the authority's scope, and the boolean `is_competent_authority` signals whether the body holds formal regulatory power. A foreign key `regulation_id` links each authority to a specific environmental regulation, forming a one-to-one association in the current data.

**Table `environmental_authorities`**

| environmental_authority_id | authority_code | authority_name | country_code | established_date | competence_level | is_competent_authority | regulation_id |
|---|---|---|---|---|---|---|---|
| 100 | 6926376 | Sean Green | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 2024-03-27 | national | false | 2087741 |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | lu_tax_code_template_m_I_2 | 2025-08-11 | regional | true | 4057 |
| 102 | 9246326 | Kimberly Smith | default_chart_a_account_57 | 2022-01-22 | local | false | 5917301 |
| 103 | 9085244 | Kimberly Smith | 727045 | 2023-06-06 | national | true | 10445633 |

International networks capture cross-border coordination mechanisms. The `international_networks` table uses a surrogate `id` (`100`) alongside a `network_code` (e.g. `68f46afd953b4de8824b596a1bff565c`) and a `network_name` such as `Seasonal Programme`. The `founding_date` (`2023-06-24`), `member_count` (`4`), and `scope` (`regional`, `global`, or `sectoral`) characterize the network's reach, while `is_active` is a boolean flag. Two foreign keys—`chemical_management_expert_id` and `environmental_authority_id`—tie each network to a single expert and a single authority, mirroring the expert-side relationships and creating a triangular linkage among experts, authorities, and networks.

**Table `international_networks`**

| id | network_code | network_name | founding_date | member_count | scope | is_active | chemical_management_expert_id | environmental_authority_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Seasonal Programme | 2023-06-24 | 4 | regional | true | 100 | 100 |
| 101 | 8387528 | Integrated Standard | 2024-11-08 | 17 | global | false | 101 | 101 |
| 102 | 5082978 | Extended Framework D | 2025-04-19 | 9 | sectoral | true | 102 | 102 |
| 103 | 726053 | Pilot Protocol | 2022-09-03 | 0 | regional | false | 103 | 103 |

Environmental regulations are catalogued in the `environmental_regulations` table, where each row represents a distinct rule or directive. The `regulation_id` (e.g. `2087741`) is the primary key, and `regulation_title` provides a human-readable label (`Compact Initiative`). The `issuing_body` column holds a categorical identifier (`baseline-issuing-13`), while `effective_date` (`2023-02-14`) and `jurisdiction` (`EU`, `national`, or `regional`) define the rule's temporal and geographic scope. The `status` column constrains the regulation to `active`, `repealed`, or `draft`. Two foreign keys—`environmental_authority_id` and `chemical_activity_id`—link each regulation to the authority that issued it and the chemical activity it governs, respectively.

**Table `environmental_regulations`**

| regulation_id | regulation_title | issuing_body | effective_date | jurisdiction | status | environmental_authority_id | chemical_activity_id |
|---|---|---|---|---|---|---|---|
| 2087741 | Compact Initiative | baseline-issuing-13 | 2023-02-14 | EU | active | 100 | 100 |
| 4057 | Legacy Model | pilot-issuing-14 | 2024-07-25 | national | repealed | 101 | 101 |
| 5917301 | Regional Cluster A | extended-issuing-15 | 2025-12-09 | regional | draft | 102 | 102 |
| 10445633 | Seasonal Review | integrated-issuing-16 | 2022-05-20 | EU | active | 103 | 103 |

Chemical activities represent discrete operational events such as permitting, inspections, waste shipments, or safety training. The `chemical_activities` table stores each activity with a surrogate `id` (`100`), an `activity_id` (e.g. `8843761`), and an `activity_type` drawn from the set `permitting`, `inspection`, `waste_shipment`, and `safety_training`. Temporal bounds are captured by `start_date` (`2022-09-05T20:24:00`) and `end_date` (`2022-09-01T08:00:00`), while `status` (`pending`, `running`, `complete`, `failed`) and `risk_level` (`low`, `medium`, `high`) describe the activity's lifecycle and hazard profile. Three foreign keys—`chemical_management_expert_id`, `regulation_id`, and `facility_id`—bind each activity to its overseeing expert, the governing regulation, and the facility where it occurs.

**Table `chemical_activities`**

| id | activity_id | activity_type | start_date | end_date | status | risk_level | chemical_management_expert_id | regulation_id | facility_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 8843761 | permitting | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | pending | low | 100 | 2087741 | 1 |
| 101 | 4180957 | inspection | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | running | medium | 101 | 4057 | 2 |
| 102 | 168545 | waste_shipment | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | complete | high | 102 | 5917301 | 3 |
| 103 | default_chart_a_account_53 | safety_training | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | failed | low | 103 | 10445633 | 4 |

Facilities are the physical sites where chemical activities take place. The `facilities` table uses a surrogate `id` (`1` through `4`) as its primary key, alongside a `facility_id` (e.g. `69447`) and a `facility_name` such as `Integrated Protocol A`. The `address` column holds a categorical address label (`distributed-address-72`), and `permit_number` (e.g. `PER-2638`) records the operating permit. The `operational_status` column constrains the facility to `active`, `suspended`, or `closed`, while `last_inspection_date` (`2025-04-12`) captures the most recent audit. Two foreign keys—`chemical_activity_id` and `environmental_authority_id`—link each facility to the activity it hosts and the authority that oversees it. Timestamps `created_at` and `updated_at` provide an audit trail.

**Table `facilities`**

| id | facility_id | facility_name | address | permit_number | operational_status | last_inspection_date | chemical_activity_id | environmental_authority_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | distributed-address-72 | PER-2638 | active | 2025-04-12 | 100 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 1040 | Extended Programme | baseline-address-73 | PER-2640 | suspended | 2022-09-23 | 101 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 2986228 | Pilot Standard | pilot-address-74 | PER-2642 | closed | 2023-02-07 | 102 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | extended-address-75 | PER-2644 | active | 2024-07-18 | 103 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `authorities_experts` table serves as a junction table that resolves a many-to-many relationship between environmental authorities and chemical management experts. In the current data, each authority is linked to exactly one expert, but the schema design permits multiple experts per authority and vice versa. This table ensures that the expert-to-authority association in `chemical_management_experts` is not the sole carrier of the relationship, providing an independent audit trail for organizational assignments.

**Table `authorities_experts`**

| environmental_authority_id | chemical_management_expert_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

## Views and Domain-Level Fact Reconstruction

Materialized views reassemble the normalized base tables into domain-level facts that answer specific regulatory questions. Each view is a named join that projects the relevant columns from two or more tables, allowing downstream consumers to read a complete fact without writing join logic.

The view `v_chemical_management_expert_environmental_authority` joins `chemical_management_experts` to `environmental_authorities` on the expert's `environmental_authority_id`, producing a flat row that pairs each expert with their overseeing authority. Reading the first row, one sees expert `EXP-2308` (Theodore Mcgrath) associated with authority `6926376` (Sean Green), a `national`-level body that is not currently marked as competent. This view answers the question: "Which authority is responsible for which expert?"

**View `v_chemical_management_expert_environmental_authority`**

```sql
CREATE VIEW v_chemical_management_expert_environmental_authority AS
SELECT a.id, a.expert_identifier, a.full_name, a.degree, b.environmental_authority_id AS authority_environmental_authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM chemical_management_experts a JOIN environmental_authorities b ON a.environmental_authority_id = b.environmental_authority_id;
```

| id | expert_identifier | full_name | degree | authority_environmental_authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 100 | EXP-2308 | Theodore Mcgrath | legacy-degree-61 | 100 | 6926376 | Sean Green |
| 101 | EXP-2314 | Account Name | compact-degree-62 | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 102 | EXP-2320 | Saipan International Airport | composite-degree-63 | 102 | 9246326 | Kimberly Smith |
| 103 | EXP-2326 | Norma Fisher | primary-degree-64 | 103 | 9085244 | Kimberly Smith |

The view `v_chemical_management_expert_international_network` joins `chemical_management_experts` to `international_networks` on the expert's `international_network_id`. The first row pairs expert `EXP-2308` with the network `Seasonal Programme` (`68f46afd953b4de8824b596a1bff565c`), a `regional`-scope network with four members that is currently active. This view answers: "Which international network does each expert belong to?"

**View `v_chemical_management_expert_international_network`**

```sql
CREATE VIEW v_chemical_management_expert_international_network AS
SELECT a.id, a.expert_identifier, a.full_name, a.degree, b.id AS network_id, b.network_code AS network_network_code, b.network_name AS network_network_name
FROM chemical_management_experts a JOIN international_networks b ON a.international_network_id = b.id;
```

| id | expert_identifier | full_name | degree | network_id | network_network_code | network_network_name |
|---|---|---|---|---|---|---|
| 100 | EXP-2308 | Theodore Mcgrath | legacy-degree-61 | 100 | 68f46afd953b4de8824b596a1bff565c | Seasonal Programme |
| 101 | EXP-2314 | Account Name | compact-degree-62 | 101 | 8387528 | Integrated Standard |
| 102 | EXP-2320 | Saipan International Airport | composite-degree-63 | 102 | 5082978 | Extended Framework D |
| 103 | EXP-2326 | Norma Fisher | primary-degree-64 | 103 | 726053 | Pilot Protocol |

The view `v_environmental_authority_chemical_management_expert_detail` performs the inverse join, starting from `environmental_authorities` and reaching `chemical_management_experts` through the authority's `environmental_authority_id` column. The first row shows authority `6926376` (Sean Green) linked to expert `EXP-2308` (Theodore Mcgrath), whose degree is `legacy-degree-61` and specialization is `legacy-speciali-13`. This view answers: "Which expert is assigned to each authority?"

**View `v_environmental_authority_chemical_management_expert_detail`**

```sql
CREATE VIEW v_environmental_authority_chemical_management_expert_detail AS
SELECT a.environmental_authority_id, a.authority_code, a.authority_name, b.id AS expert_id, b.expert_identifier AS expert_expert_identifier, b.full_name AS expert_full_name
FROM environmental_authorities a
  JOIN authorities_experts j ON j.environmental_authority_id = a.environmental_authority_id
  JOIN chemical_management_experts b ON b.id = j.chemical_management_expert_id;
```

| environmental_authority_id | authority_code | authority_name | expert_id | expert_expert_identifier | expert_full_name |
|---|---|---|---|---|---|
| 100 | 6926376 | Sean Green | 100 | EXP-2308 | Theodore Mcgrath |
| 100 | 6926376 | Sean Green | 101 | EXP-2314 | Account Name |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | 101 | EXP-2314 | Account Name |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | 102 | EXP-2320 | Saipan International Airport |
| 102 | 9246326 | Kimberly Smith | 102 | EXP-2320 | Saipan International Airport |
| 102 | 9246326 | Kimberly Smith | 103 | EXP-2326 | Norma Fisher |
| 103 | 9085244 | Kimberly Smith | 103 | EXP-2326 | Norma Fisher |
| 103 | 9085244 | Kimberly Smith | 100 | EXP-2308 | Theodore Mcgrath |

The view `v_environmental_authority_environmental_regulation` joins `environmental_authorities` to `environmental_regulations` on the authority's `regulation_id`. The first row pairs authority `6926376` (Sean Green) with regulation `Compact Initiative` (`2087741`), an `active` EU-level rule issued by `baseline-issuing-13`. This view answers: "Which regulation does each authority oversee?"

**View `v_environmental_authority_environmental_regulation`**

```sql
CREATE VIEW v_environmental_authority_environmental_regulation AS
SELECT a.environmental_authority_id, a.authority_code, a.authority_name, a.country_code, b.regulation_id AS regulation_regulation_id, b.regulation_title AS regulation_regulation_title, b.issuing_body AS regulation_issuing_body
FROM environmental_authorities a JOIN environmental_regulations b ON a.regulation_id = b.regulation_id;
```

| environmental_authority_id | authority_code | authority_name | country_code | regulation_regulation_id | regulation_regulation_title | regulation_issuing_body |
|---|---|---|---|---|---|---|
| 100 | 6926376 | Sean Green | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 2087741 | Compact Initiative | baseline-issuing-13 |
| 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods | lu_tax_code_template_m_I_2 | 4057 | Legacy Model | pilot-issuing-14 |
| 102 | 9246326 | Kimberly Smith | default_chart_a_account_57 | 5917301 | Regional Cluster A | extended-issuing-15 |
| 103 | 9085244 | Kimberly Smith | 727045 | 10445633 | Seasonal Review | integrated-issuing-16 |

The view `v_international_network_chemical_management_expert` joins `international_networks` to `chemical_management_experts` on the network's `chemical_management_expert_id`. The first row shows network `Seasonal Programme` linked to expert `EXP-2308` (Theodore Mcgrath), who is `active` and was appointed on `2022-09-05T20:24:00`. This view answers: "Which expert is associated with each international network?"

**View `v_international_network_chemical_management_expert`**

```sql
CREATE VIEW v_international_network_chemical_management_expert AS
SELECT a.id, a.network_code, a.network_name, a.founding_date, b.id AS expert_id, b.expert_identifier AS expert_expert_identifier, b.full_name AS expert_full_name
FROM international_networks a JOIN chemical_management_experts b ON a.chemical_management_expert_id = b.id;
```

| id | network_code | network_name | founding_date | expert_id | expert_expert_identifier | expert_full_name |
|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Seasonal Programme | 2023-06-24 | 100 | EXP-2308 | Theodore Mcgrath |
| 101 | 8387528 | Integrated Standard | 2024-11-08 | 101 | EXP-2314 | Account Name |
| 102 | 5082978 | Extended Framework D | 2025-04-19 | 102 | EXP-2320 | Saipan International Airport |
| 103 | 726053 | Pilot Protocol | 2022-09-03 | 103 | EXP-2326 | Norma Fisher |

The view `v_international_network_environmental_authority` joins `international_networks` to `environmental_authorities` on the network's `environmental_authority_id`. The first row pairs network `Seasonal Programme` with authority `6926376` (Sean Green), a `national`-level body established on `2024-03-27`. This view answers: "Which authority is linked to each international network?"

**View `v_international_network_environmental_authority`**

```sql
CREATE VIEW v_international_network_environmental_authority AS
SELECT a.id, a.network_code, a.network_name, a.founding_date, b.environmental_authority_id AS authority_environmental_authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM international_networks a JOIN environmental_authorities b ON a.environmental_authority_id = b.environmental_authority_id;
```

| id | network_code | network_name | founding_date | authority_environmental_authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 100 | 68f46afd953b4de8824b596a1bff565c | Seasonal Programme | 2023-06-24 | 100 | 6926376 | Sean Green |
| 101 | 8387528 | Integrated Standard | 2024-11-08 | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 102 | 5082978 | Extended Framework D | 2025-04-19 | 102 | 9246326 | Kimberly Smith |
| 103 | 726053 | Pilot Protocol | 2022-09-03 | 103 | 9085244 | Kimberly Smith |

The view `v_environmental_regulation_environmental_authority` joins `environmental_regulations` to `environmental_authorities` on the regulation's `environmental_authority_id`. The first row shows regulation `Compact Initiative` (`2087741`) issued by authority `6926376` (Sean Green), with an effective date of `2023-02-14` and `EU` jurisdiction. This view answers: "Which authority issued each regulation?"

**View `v_environmental_regulation_environmental_authority`**

```sql
CREATE VIEW v_environmental_regulation_environmental_authority AS
SELECT a.regulation_id, a.regulation_title, a.issuing_body, a.effective_date, b.environmental_authority_id AS authority_environmental_authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM environmental_regulations a JOIN environmental_authorities b ON a.environmental_authority_id = b.environmental_authority_id;
```

| regulation_id | regulation_title | issuing_body | effective_date | authority_environmental_authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 2087741 | Compact Initiative | baseline-issuing-13 | 2023-02-14 | 100 | 6926376 | Sean Green |
| 4057 | Legacy Model | pilot-issuing-14 | 2024-07-25 | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 5917301 | Regional Cluster A | extended-issuing-15 | 2025-12-09 | 102 | 9246326 | Kimberly Smith |
| 10445633 | Seasonal Review | integrated-issuing-16 | 2022-05-20 | 103 | 9085244 | Kimberly Smith |

The view `v_environmental_regulation_chemical_activity` joins `environmental_regulations` to `chemical_activities` on the regulation's `regulation_id`. The first row pairs regulation `Compact Initiative` (`2087741`) with activity `8843761` (type `permitting`, status `pending`, risk level `low`). This view answers: "Which chemical activity does each regulation govern?"

**View `v_environmental_regulation_chemical_activity`**

```sql
CREATE VIEW v_environmental_regulation_chemical_activity AS
SELECT a.regulation_id, a.regulation_title, a.issuing_body, a.effective_date, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type
FROM environmental_regulations a JOIN chemical_activities b ON a.chemical_activity_id = b.id;
```

| regulation_id | regulation_title | issuing_body | effective_date | activity_id | activity_activity_id | activity_activity_type |
|---|---|---|---|---|---|---|
| 2087741 | Compact Initiative | baseline-issuing-13 | 2023-02-14 | 100 | 8843761 | permitting |
| 4057 | Legacy Model | pilot-issuing-14 | 2024-07-25 | 101 | 4180957 | inspection |
| 5917301 | Regional Cluster A | extended-issuing-15 | 2025-12-09 | 102 | 168545 | waste_shipment |
| 10445633 | Seasonal Review | integrated-issuing-16 | 2022-05-20 | 103 | default_chart_a_account_53 | safety_training |

The view `v_chemical_activity_chemical_management_expert` joins `chemical_activities` to `chemical_management_experts` on the activity's `chemical_management_expert_id`. The first row shows activity `8843761` (permitting, `pending`) overseen by expert `EXP-2308` (Theodore Mcgrath), who holds degree `legacy-degree-61`. This view answers: "Which expert oversees each chemical activity?"

**View `v_chemical_activity_chemical_management_expert`**

```sql
CREATE VIEW v_chemical_activity_chemical_management_expert AS
SELECT a.id, a.activity_id, a.activity_type, a.start_date, b.id AS expert_id, b.expert_identifier AS expert_expert_identifier, b.full_name AS expert_full_name
FROM chemical_activities a JOIN chemical_management_experts b ON a.chemical_management_expert_id = b.id;
```

| id | activity_id | activity_type | start_date | expert_id | expert_expert_identifier | expert_full_name |
|---|---|---|---|---|---|---|
| 100 | 8843761 | permitting | 2022-09-05T20:24:00 | 100 | EXP-2308 | Theodore Mcgrath |
| 101 | 4180957 | inspection | 2023-02-16T03:41:00 | 101 | EXP-2314 | Account Name |
| 102 | 168545 | waste_shipment | 2024-07-27T10:58:00 | 102 | EXP-2320 | Saipan International Airport |
| 103 | default_chart_a_account_53 | safety_training | 2025-12-11T17:15:00 | 103 | EXP-2326 | Norma Fisher |

The view `v_chemical_activity_environmental_regulation` joins `chemical_activities` to `environmental_regulations` on the activity's `regulation_id`. The first row pairs activity `8843761` (permitting) with regulation `Compact Initiative` (`2087741`), an `active` EU-level rule. This view answers: "Which regulation governs each chemical activity?"

**View `v_chemical_activity_environmental_regulation`**

```sql
CREATE VIEW v_chemical_activity_environmental_regulation AS
SELECT a.id, a.activity_id, a.activity_type, a.start_date, b.regulation_id AS regulation_regulation_id, b.regulation_title AS regulation_regulation_title, b.issuing_body AS regulation_issuing_body
FROM chemical_activities a JOIN environmental_regulations b ON a.regulation_id = b.regulation_id;
```

| id | activity_id | activity_type | start_date | regulation_regulation_id | regulation_regulation_title | regulation_issuing_body |
|---|---|---|---|---|---|---|
| 100 | 8843761 | permitting | 2022-09-05T20:24:00 | 2087741 | Compact Initiative | baseline-issuing-13 |
| 101 | 4180957 | inspection | 2023-02-16T03:41:00 | 4057 | Legacy Model | pilot-issuing-14 |
| 102 | 168545 | waste_shipment | 2024-07-27T10:58:00 | 5917301 | Regional Cluster A | extended-issuing-15 |
| 103 | default_chart_a_account_53 | safety_training | 2025-12-11T17:15:00 | 10445633 | Seasonal Review | integrated-issuing-16 |

The view `v_chemical_activity_facility` joins `chemical_activities` to `facilities` on the activity's `facility_id`. The first row shows activity `8843761` (permitting, `pending`, `low` risk) occurring at facility `69447` (`Integrated Protocol A`), which has operational status `active` and permit `PER-2638`. This view answers: "At which facility does each chemical activity take place?"

**View `v_chemical_activity_facility`**

```sql
CREATE VIEW v_chemical_activity_facility AS
SELECT a.id, a.activity_id, a.activity_type, a.start_date, b.id AS facility_id, b.facility_id AS facility_facility_id, b.facility_name AS facility_facility_name
FROM chemical_activities a JOIN facilities b ON a.facility_id = b.id;
```

| id | activity_id | activity_type | start_date | facility_id | facility_facility_id | facility_facility_name |
|---|---|---|---|---|---|---|
| 100 | 8843761 | permitting | 2022-09-05T20:24:00 | 1 | 69447 | Integrated Protocol A |
| 101 | 4180957 | inspection | 2023-02-16T03:41:00 | 2 | 1040 | Extended Programme |
| 102 | 168545 | waste_shipment | 2024-07-27T10:58:00 | 3 | 2986228 | Pilot Standard |
| 103 | default_chart_a_account_53 | safety_training | 2025-12-11T17:15:00 | 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D |

The view `v_facility_chemical_activity` performs the inverse join, starting from `facilities` and reaching `chemical_activities` through the facility's `chemical_activity_id`. The first row shows facility `69447` (`Integrated Protocol A`) hosting activity `8843761` (permitting, `pending`). This view answers: "Which activity occurs at each facility?"

**View `v_facility_chemical_activity`**

```sql
CREATE VIEW v_facility_chemical_activity AS
SELECT a.id, a.facility_id, a.facility_name, a.address, b.id AS activity_id, b.activity_id AS activity_activity_id, b.activity_type AS activity_activity_type
FROM facilities a JOIN chemical_activities b ON a.chemical_activity_id = b.id;
```

| id | facility_id | facility_name | address | activity_id | activity_activity_id | activity_activity_type |
|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | distributed-address-72 | 100 | 8843761 | permitting |
| 2 | 1040 | Extended Programme | baseline-address-73 | 101 | 4180957 | inspection |
| 3 | 2986228 | Pilot Standard | pilot-address-74 | 102 | 168545 | waste_shipment |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | extended-address-75 | 103 | default_chart_a_account_53 | safety_training |

The view `v_facility_environmental_authority` joins `facilities` to `environmental_authorities` on the facility's `environmental_authority_id`. The first row pairs facility `69447` (`Integrated Protocol A`) with authority `6926376` (Sean Green), a `national`-level body. This view answers: "Which authority oversees each facility?"

**View `v_facility_environmental_authority`**

```sql
CREATE VIEW v_facility_environmental_authority AS
SELECT a.id, a.facility_id, a.facility_name, a.address, b.environmental_authority_id AS authority_environmental_authority_id, b.authority_code AS authority_authority_code, b.authority_name AS authority_authority_name
FROM facilities a JOIN environmental_authorities b ON a.environmental_authority_id = b.environmental_authority_id;
```

| id | facility_id | facility_name | address | authority_environmental_authority_id | authority_authority_code | authority_authority_name |
|---|---|---|---|---|---|---|
| 1 | 69447 | Integrated Protocol A | distributed-address-72 | 100 | 6926376 | Sean Green |
| 2 | 1040 | Extended Programme | baseline-address-73 | 101 | 5fc685e2-8fcc-11eb-924d-9cd76263cbd0 | Elizabeth Woods |
| 3 | 2986228 | Pilot Standard | pilot-address-74 | 102 | 9246326 | Kimberly Smith |
| 4 | ChIJvSxSbfdv5kcRanVzI8RRu20 | Baseline Framework D | extended-address-75 | 103 | 9085244 | Kimberly Smith |

## Synthesis

The schema models the chemical management domain as a directed graph of seven base tables, where foreign keys encode the ontology's cardinality-bounded relationships. Experts belong to authorities and networks; authorities issue regulations and oversee facilities; regulations govern activities; and activities occur at facilities. The junction table `authorities_experts` provides an independent many-to-many channel between authorities and experts, while the twelve views materialize every pairwise association as a flat, query-ready fact. Together, the base tables and views form a complete normalized representation of the domain, where each row in a view corresponds to a single domain-level assertion—such as "expert EXP-2308 Theodore Mcgrath is overseen by authority 6926376 Sean Green, who issued regulation 2087741 Compact Initiative, which governs activity 8843761 at facility 69447 Integrated Protocol A."