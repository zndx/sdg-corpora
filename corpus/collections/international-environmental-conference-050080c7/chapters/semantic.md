International environmental governance unfolds through a layered architecture of conferences, declarations, institutions, and agreements — each layer refining the commitments of the one above it into actionable policy instruments and financial mechanisms. The relational model captures this hierarchy as a set of normalized tables linked by foreign keys, with materialized views reconstructing the domain facts that analysts and policymakers need to query. At the top of the hierarchy sit the conferences themselves: discrete, time-bound gatherings that produce declarations and action plans, host institutions, and seed multilateral agreements. Below them, declarations crystallize principles, action plans enumerate recommendations, institutions provide ongoing governance, and agreements translate principles into binding commitments. At the base, policy instruments and financial assistances operationalize those commitments within individual states.

**Table `international_environmental_conferences`**

| id | conference_id | start_date | end_date | host_city | host_country | declaration_title | action_plan_title | total_recommendations | has_n_g_o_forum | environmental_declaration_id | action_plan_id | international_environmental_institution_id | international_environmental_conference_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | seasonal-host-83 | composite-host-21 | Composite Review | Regional Cluster | 8 | true | 1000 | 1 | 1 | 1000 |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | regional-host-84 | primary-host-22 | Compact Initiative A | Seasonal Review D | 43 | false | 1001 | 2 | 2 | 1001 |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | legacy-host-85 | adaptive-host-23 | Legacy Model | Integrated Initiative | 1 | true | 1002 | 3 | 3 | 1002 |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | compact-host-86 | distributed-host-24 | Regional Cluster | Extended Model | 55 | false | 1003 | 4 | 4 | 1003 |

The `international_environmental_conferences` table is the central anchor of the model. Each row represents a single conference, identified by a surrogate primary key `id` (values such as `1000`, `1001`, `1002`, `1003`) and a business-level `conference_id` (for example, `10966213` or the UUID `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`). Temporal scope is captured by `start_date` and `end_date` — note that in the sample data the start date can fall after the end date (e.g., `2022-09-05T20:24:00` versus `2022-09-01T08:00:00` for conference `1000`), a data-quality artifact of the synthetic generation process. The geographic context is stored in `host_city` and `host_country`, with values like `seasonal-host-83` and `composite-host-21`. The table also carries denormalized copies of the declaration and action plan titles (`declaration_title`, `action_plan_title`) alongside a `total_recommendations` count and a boolean `has_n_g_o_forum` flag. Crucially, three foreign-key columns — `environmental_declaration_id`, `action_plan_id`, and `international_environmental_institution_id` — each point to exactly one row in their respective child tables, enforcing a one-to-one or one-to-many relationship from the conference outward. A fourth foreign key, `international_environmental_conference_id`, creates a self-referencing link that supports hierarchical conference relationships.

**Table `environmental_declarations`**

| id | declaration_id | title | adoption_date | total_principles | issuing_conference | international_environmental_conference_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | 10966231 | Compact Initiative | 2025-08-12T07:09:00 | 9 | composite-issuing-45 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 1996917 | Legacy Model | 2022-01-23T14:26:00 | 1 | primary-issuing-46 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 557 | Regional Cluster A | 2023-06-07T21:43:00 | 8 | adaptive-issuing-47 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | default_chart_a_tax_code_26 | Seasonal Review | 2024-11-18T04:00:00 | 4 | distributed-issuing-48 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `environmental_declarations` table stores the formal policy statements issued at each conference. Its primary key `id` aligns with the conference's `environmental_declaration_id` foreign key (e.g., declaration `1000` is linked to conference `1000`). The business identifier `declaration_id` (values such as `10966231` or the synthetic string `default_chart_a_tax_code_26`) provides a stable reference across systems. The `title` column carries human-readable names like "Compact Initiative" or "Seasonal Review", while `adoption_date` records when the declaration was formally adopted. The `total_principles` integer (ranging from `1` to `9` in the sample) quantifies the declaration's scope. The foreign key `international_environmental_conference_id` points back to the originating conference, establishing the parent-child relationship. Audit timestamps `created_at` and `updated_at` track modifications. The cardinality here is one-to-many: a single conference can produce multiple declarations, but each declaration traces to exactly one conference.

**Table `action_plans`**

| id | plan_id | title | total_recommendations | adoption_date | international_environmental_conference_id |
|---|---|---|---|---|---|
| 1 | 505977 | Compact Initiative | 8 | 2025-08-12T07:09:00 | 1000 |
| 2 | 727038 | Legacy Model | 43 | 2022-01-23T14:26:00 | 1001 |
| 3 | 937726 | Regional Cluster A | 1 | 2023-06-07T21:43:00 | 1002 |
| 4 | 1290 | Seasonal Review | 55 | 2024-11-18T04:00:00 | 1003 |

Action plans operationalize declarations into concrete recommendations. The table's primary key `id` (values `1` through `4`) is distinct from the business-level `plan_id` (e.g., `505977`, `727038`). The `title` column mirrors declaration titles ("Compact Initiative", "Legacy Model"), and `total_recommendations` quantifies the plan's ambition — the sample shows a wide range from `1` to `55`. The `adoption_date` records when the plan was approved, and the foreign key `international_environmental_conference_id` links the plan to its parent conference. Unlike declarations, action plans do not carry their own audit timestamps in this schema; the temporal provenance is captured solely through `adoption_date`. The cardinality relationship mirrors declarations: one conference produces many action plans, each plan belongs to exactly one conference.

**Table `international_environmental_institutions`**

| id | institution_id | name | headquarters_city | headquarters_country | establishment_date | status | international_environmental_conference_id | multilateral_environmental_agreement_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-headquar-83 | regional-headquar-42 | 2024-07-11T06:18:00 | active | 1000 | 1000 |
| 2 | 8189481 | Pilot Initiative A | regional-headquar-84 | legacy-headquar-43 | 2025-12-22T13:35:00 | defunct | 1001 | 1001 |
| 3 | 1437604 | Baseline Model | legacy-headquar-85 | compact-headquar-44 | 2022-05-06T20:52:00 | merged | 1002 | 1002 |
| 4 | 884346 | Distributed Cluster | compact-headquar-86 | composite-headquar-45 | 2023-10-17T03:09:00 | active | 1003 | 1003 |

International environmental institutions provide the ongoing organizational infrastructure that outlives individual conferences. The primary key `id` (values `1` through `4`) is distinct from the business-level `institution_id` (e.g., `9424913`, `8189481`). The `name` column carries institutional names such as "Extended Review" or "Pilot Initiative A". Geographic anchoring is provided by `headquarters_city` and `headquarters_country` (e.g., `seasonal-headquar-83`, `regional-headquar-42`). The `establishment_date` records when the institution was founded, and `status` captures its current organizational state with values like `active`, `defunct`, or `merged`. Two foreign keys define the institution's contextual relationships: `international_environmental_conference_id` links the institution to the conference that spawned it, while `multilateral_environmental_agreement_id` links it to the agreement it administers. This dual foreign-key structure means each institution sits at the intersection of a conference and an agreement, forming a natural junction between the governance and legal layers of the model.

**Table `multilateral_environmental_agreements`**

| multilateral_environmental_agreement_id | agreement_id | title | entry_into_force_date | status | scope | environmental_declaration_id | international_environmental_institution_id |
|---|---|---|---|---|---|---|---|
| 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative | 2022-05-16T04:00:00 | ratified | transboundary | 1000 | 1 |
| 1001 | 4716391 | Legacy Model | 2023-10-27T11:17:00 | pending | global | 1001 | 2 |
| 1002 | 3001009030180 | Regional Cluster A | 2024-03-11T18:34:00 | withdrawn | regional | 1002 | 3 |
| 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review | 2025-08-22T01:51:00 | ratified | transboundary | 1003 | 4 |

Multilateral environmental agreements represent the binding legal commitments that emerge from declarations and are administered by institutions. The primary key `multilateral_environmental_agreement_id` (values `1000` through `1003`) doubles as the foreign key referenced by institutions and policy instruments. The business-level `agreement_id` carries UUIDs or numeric identifiers (e.g., `348c2b52-8fcc-11eb-924d-9cd76263cbd0`). The `title` column (e.g., "Compact Initiative", "Seasonal Review") names the agreement, while `entry_into_force_date` records when it became legally operative. The `status` column captures the ratification state with values `ratified`, `pending`, or `withdrawn`, and `scope` classifies the agreement's geographic reach as `transboundary`, `global`, or `regional`. Two foreign keys anchor the agreement: `environmental_declaration_id` links it to the declaration that seeded it, and `international_environmental_institution_id` links it to the institution that administers it. This creates a triangular relationship — declaration → agreement → institution — where each agreement is simultaneously a child of a declaration and a parent of an institution.

**Table `environmental_policy_instruments`**

| instrument_id | name | type | implementation_date | target_sector | multilateral_environmental_agreement_id | state_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 6926365 | Extended Review | regulation | 2024-11-14T10:06:00 | industrial | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| account_pymes_691 | Pilot Initiative A | market_incentive | 2025-04-25T17:23:00 | agricultural | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 726063 | Baseline Model | institutional_pressure | 2022-09-09T00:40:00 | energy | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 23256422 | Distributed Cluster | financial_assistance | 2023-02-20T07:57:00 | waste | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Environmental policy instruments are the operational mechanisms through which states implement multilateral agreements. The primary key `instrument_id` carries business identifiers such as `6926365` or `account_pymes_691`. The `name` column mirrors the agreement name ("Extended Review", "Distributed Cluster"), while `type` classifies the instrument's mechanism with values including `regulation`, `market_incentive`, `institutional_pressure`, and `financial_assistance`. The `implementation_date` records when the instrument took effect, and `target_sector` identifies the economic sector it targets — `industrial`, `agricultural`, `energy`, or `waste` in the sample data. Two foreign keys define the instrument's provenance: `multilateral_environmental_agreement_id` links it to the agreement it implements, and `state_id` links it to the state that adopts it. Audit columns `created_at` and `updated_at` track modifications. The cardinality here is many-to-many in the domain sense — a single agreement can spawn many instruments across many states, and a single state can adopt instruments from many agreements — but the relational model resolves this through the `environmental_policy_instruments` table itself, which serves as both a fact table and a junction table.

**Table `states`**

| id | state_code | name | development_status | primary_environmental_concern | instrument_id | multilateral_environmental_agreement_id | financial_assistance_id |
|---|---|---|---|---|---|---|---|
| 1 | 17788643 | Extended Review | industrialized | industrial_pollution | 6926365 | 1000 | 100 |
| 2 | 8350031 | Pilot Initiative A | developing | natural_resource_usage | account_pymes_691 | 1001 | 101 |
| 3 | 790483 | Baseline Model | industrialized | economic_development | 726063 | 1002 | 102 |
| 4 | 8387549 | Distributed Cluster | developing | industrial_pollution | 23256422 | 1003 | 103 |

The `states` table provides the sovereign entity dimension of the model. While the full column set is not enumerated in the sample data, the table is referenced as a foreign key target by both `environmental_policy_instruments` (via `state_id`) and `financial_assistances`. States represent the jurisdictions within which policy instruments are implemented and financial assistance is disbursed. In the sample data, state identifiers align with instrument foreign keys (`1` through `4`), suggesting a one-to-one mapping between states and instruments in this synthetic dataset. The states table serves as the leaf node of the hierarchy — the entity that ultimately bears the cost and receives the benefits of all upstream commitments.

**Table `financial_assistances`**

| financial_assistance_id | assistance_id | amount | currency | disbursement_date | purpose | state_id | received_by_state_id | instrument_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 763e85ae-9bac-11eb-a8a2-19ed5c03f8d3 | 13.49 | seasonal-currency-71 | 2024-03-25T14:30:00 | pollution_control | 1 | 1 | 6926365 |
| 101 | Deskripsi | 25.47 | regional-currency-72 | 2025-08-09T21:47:00 | sustainable_development | 2 | 2 | account_pymes_691 |
| 102 | 332 | 19.72 | legacy-currency-73 | 2022-01-20T04:04:00 | capacity_building | 3 | 3 | 726063 |
| 103 | 325447 | 12.74 | compact-currency-74 | 2023-06-04T11:21:00 | pollution_control | 4 | 4 | 23256422 |

Financial assistances capture the monetary flows that enable policy implementation. The table's primary key `id` is distinct from the business-level `financial_assistance_id`. The `amount` column quantifies the assistance, while `currency` specifies the monetary unit. The `disbursement_date` records when funds were transferred, and `purpose` describes the intended use. The foreign key `state_id` links each assistance to the recipient state, making states the ultimate beneficiaries of the financial chain. This table sits at the base of the hierarchy, connected to states but not directly to any conference, declaration, or agreement — its relationship to the upper layers is transitive, flowing through the policy instruments that define the assistance's purpose.

The materialized views reconstruct domain facts by joining these normalized tables. Each view answers a specific analytical question by pulling together attributes from multiple entity types.

**View `international_environmental_conference_environmental_declaration_view`**

```sql
CREATE VIEW international_environmental_conference_environmental_declaration_view AS
SELECT a.id, a.conference_id, a.start_date, a.end_date, b.id AS declaration_id, b.declaration_id AS declaration_declaration_id, b.title AS declaration_title
FROM international_environmental_conferences a JOIN environmental_declarations b ON a.environmental_declaration_id = b.id;
```

| id | conference_id | start_date | end_date | declaration_id | declaration_declaration_id | declaration_title |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 10966231 | Compact Initiative |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 1996917 | Legacy Model |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | 557 | Regional Cluster A |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | default_chart_a_tax_code_26 | Seasonal Review |

This view joins `international_environmental_conferences` with `environmental_declarations` on the conference-to-declaration foreign key. It answers the question: "What declarations were issued at each conference, and what are their properties?" A sample row would show conference `1000` (hosted in `seasonal-host-83`) alongside declaration `1000` ("Compact Initiative", adopted `2025-08-12T07:09:00`, containing `9` principles). The join is straightforward — a left outer join from conferences to declarations ensures that conferences without declarations still appear in the result.

**View `international_environmental_conference_action_plan_view`**

```sql
CREATE VIEW international_environmental_conference_action_plan_view AS
SELECT a.id, a.conference_id, a.start_date, a.end_date, b.id AS plan_id, b.plan_id AS plan_plan_id, b.title AS plan_title
FROM international_environmental_conferences a JOIN action_plans b ON a.action_plan_id = b.id;
```

| id | conference_id | start_date | end_date | plan_id | plan_plan_id | plan_title |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 505977 | Compact Initiative |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 727038 | Legacy Model |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 937726 | Regional Cluster A |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 1290 | Seasonal Review |

This view joins `international_environmental_conferences` with `action_plans` on the conference-to-plan foreign key. It answers: "What action plans were produced at each conference, and how many recommendations do they contain?" A representative row links conference `1001` (hosted in `regional-host-84`) to action plan `2` ("Legacy Model", `43` recommendations, adopted `2022-01-23T14:26:00`). The view enables analysts to compare the ambition of action plans across conferences by examining the `total_recommendations` column.

**View `international_environmental_conference_international_environmental_institution_view`**

```sql
CREATE VIEW international_environmental_conference_international_environmental_institution_view AS
SELECT a.id, a.conference_id, a.start_date, a.end_date, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM international_environmental_conferences a JOIN international_environmental_institutions b ON a.international_environmental_institution_id = b.id;
```

| id | conference_id | start_date | end_date | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1 | 9424913 | Extended Review |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 2 | 8189481 | Pilot Initiative A |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 3 | 1437604 | Baseline Model |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 4 | 884346 | Distributed Cluster |

This view joins `international_environmental_conferences` with `international_environmental_institutions` on the conference-to-institution foreign key. It answers: "Which institutions were established at or are associated with each conference?" A sample row connects conference `1000` to institution `1` ("Extended Review", headquartered in `seasonal-headquar-83`, status `active`). The view supports institutional governance analysis by showing the institutional footprint of each conference.

**View `international_environmental_conference_international_environmental_conference_view`**

```sql
CREATE VIEW international_environmental_conference_international_environmental_conference_view AS
SELECT a.id, a.conference_id, a.start_date, a.end_date, b.id AS conference_id, b.conference_id AS conference_conference_id, b.start_date AS conference_start_date
FROM international_environmental_conferences a JOIN international_environmental_conferences b ON a.international_environmental_conference_id = b.id;
```

| id | conference_id | start_date | end_date | conference_id | conference_conference_id | conference_start_date |
|---|---|---|---|---|---|---|
| 1000 | 10966213 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 10966213 | 2022-09-05T20:24:00 |
| 1001 | 505978 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 505978 | 2023-02-16T03:41:00 |
| 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 |
| 1003 | 4793480 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | 4793480 | 2025-12-11T17:15:00 |

This self-referencing view joins `international_environmental_conferences` with itself via the `international_environmental_conference_id` foreign key. It answers: "Which conferences are hierarchically related to other conferences?" A row might show conference `1000` linked to itself (self-reference) or to a parent conference in a series. This view supports the analysis of conference lineages and recurring gatherings.

**View `environmental_declaration_international_environmental_conference_view`**

```sql
CREATE VIEW environmental_declaration_international_environmental_conference_view AS
SELECT a.id, a.declaration_id, a.title, a.adoption_date, b.id AS conference_id, b.conference_id AS conference_conference_id, b.start_date AS conference_start_date
FROM environmental_declarations a JOIN international_environmental_conferences b ON a.international_environmental_conference_id = b.id;
```

| id | declaration_id | title | adoption_date | conference_id | conference_conference_id | conference_start_date |
|---|---|---|---|---|---|---|
| 1000 | 10966231 | Compact Initiative | 2025-08-12T07:09:00 | 1000 | 10966213 | 2022-09-05T20:24:00 |
| 1001 | 1996917 | Legacy Model | 2022-01-23T14:26:00 | 1001 | 505978 | 2023-02-16T03:41:00 |
| 1002 | 557 | Regional Cluster A | 2023-06-07T21:43:00 | 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 |
| 1003 | default_chart_a_tax_code_26 | Seasonal Review | 2024-11-18T04:00:00 | 1003 | 4793480 | 2025-12-11T17:15:00 |

This view reverses the perspective of the first view, joining `environmental_declarations` with `international_environmental_conferences`. It answers: "At which conference was each declaration issued, and what were the conference's characteristics?" A sample row shows declaration `1000` ("Compact Initiative", `9` principles) issued at conference `1000` (hosted in `seasonal-host-83`, with `8` total recommendations). This perspective is useful when starting from a declaration and tracing back to its conference context.

**View `action_plan_international_environmental_conference_view`**

```sql
CREATE VIEW action_plan_international_environmental_conference_view AS
SELECT a.id, a.plan_id, a.title, a.total_recommendations, b.id AS conference_id, b.conference_id AS conference_conference_id, b.start_date AS conference_start_date
FROM action_plans a JOIN international_environmental_conferences b ON a.international_environmental_conference_id = b.id;
```

| id | plan_id | title | total_recommendations | conference_id | conference_conference_id | conference_start_date |
|---|---|---|---|---|---|---|
| 1 | 505977 | Compact Initiative | 8 | 1000 | 10966213 | 2022-09-05T20:24:00 |
| 2 | 727038 | Legacy Model | 43 | 1001 | 505978 | 2023-02-16T03:41:00 |
| 3 | 937726 | Regional Cluster A | 1 | 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 |
| 4 | 1290 | Seasonal Review | 55 | 1003 | 4793480 | 2025-12-11T17:15:00 |

This view reverses the action plan perspective, joining `action_plans` with `international_environmental_conferences`. It answers: "Which conference produced each action plan, and what were the conference's details?" A representative row links action plan `1` ("Compact Initiative", `8` recommendations) to conference `1000` (hosted in `seasonal-host-83`). This view supports retrospective analysis of conference productivity.

**View `international_environmental_institution_international_environmental_conference_view`**

```sql
CREATE VIEW international_environmental_institution_international_environmental_conference_view AS
SELECT a.id, a.institution_id, a.name, a.headquarters_city, b.id AS conference_id, b.conference_id AS conference_conference_id, b.start_date AS conference_start_date
FROM international_environmental_institutions a JOIN international_environmental_conferences b ON a.international_environmental_conference_id = b.id;
```

| id | institution_id | name | headquarters_city | conference_id | conference_conference_id | conference_start_date |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-headquar-83 | 1000 | 10966213 | 2022-09-05T20:24:00 |
| 2 | 8189481 | Pilot Initiative A | regional-headquar-84 | 1001 | 505978 | 2023-02-16T03:41:00 |
| 3 | 1437604 | Baseline Model | legacy-headquar-85 | 1002 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 |
| 4 | 884346 | Distributed Cluster | compact-headquar-86 | 1003 | 4793480 | 2025-12-11T17:15:00 |

This view joins `international_environmental_institutions` with `international_environmental_conferences`, reversing the institutional perspective. It answers: "Which conference is associated with each institution?" A sample row shows institution `1` ("Extended Review", status `active`) linked to conference `1000` (hosted in `seasonal-host-83`). This view supports institutional provenance tracking.

**View `international_environmental_institution_multilateral_environmental_agreement_view`**

```sql
CREATE VIEW international_environmental_institution_multilateral_environmental_agreement_view AS
SELECT a.id, a.institution_id, a.name, a.headquarters_city, b.multilateral_environmental_agreement_id AS agreement_multilateral_environmental_agreement_id, b.agreement_id AS agreement_agreement_id, b.title AS agreement_title
FROM international_environmental_institutions a JOIN multilateral_environmental_agreements b ON a.multilateral_environmental_agreement_id = b.multilateral_environmental_agreement_id;
```

| id | institution_id | name | headquarters_city | agreement_multilateral_environmental_agreement_id | agreement_agreement_id | agreement_title |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Review | seasonal-headquar-83 | 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative |
| 2 | 8189481 | Pilot Initiative A | regional-headquar-84 | 1001 | 4716391 | Legacy Model |
| 3 | 1437604 | Baseline Model | legacy-headquar-85 | 1002 | 3001009030180 | Regional Cluster A |
| 4 | 884346 | Distributed Cluster | compact-headquar-86 | 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review |

This view joins `international_environmental_institutions` with `multilateral_environmental_agreements` on the institution-to-agreement foreign key. It answers: "Which agreement does each institution administer?" A representative row links institution `1` ("Extended Review") to agreement `1000` ("Compact Initiative", scope `transboundary`, status `ratified`). This view is critical for understanding the governance-administration relationship between institutions and agreements.

**View `multilateral_environmental_agreement_environmental_declaration_view`**

```sql
CREATE VIEW multilateral_environmental_agreement_environmental_declaration_view AS
SELECT a.multilateral_environmental_agreement_id, a.agreement_id, a.title, a.entry_into_force_date, b.id AS declaration_id, b.declaration_id AS declaration_declaration_id, b.title AS declaration_title
FROM multilateral_environmental_agreements a JOIN environmental_declarations b ON a.environmental_declaration_id = b.id;
```

| multilateral_environmental_agreement_id | agreement_id | title | entry_into_force_date | declaration_id | declaration_declaration_id | declaration_title |
|---|---|---|---|---|---|---|
| 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative | 2022-05-16T04:00:00 | 1000 | 10966231 | Compact Initiative |
| 1001 | 4716391 | Legacy Model | 2023-10-27T11:17:00 | 1001 | 1996917 | Legacy Model |
| 1002 | 3001009030180 | Regional Cluster A | 2024-03-11T18:34:00 | 1002 | 557 | Regional Cluster A |
| 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review | 2025-08-22T01:51:00 | 1003 | default_chart_a_tax_code_26 | Seasonal Review |

This view joins `multilateral_environmental_agreements` with `environmental_declarations` on the agreement-to-declaration foreign key. It answers: "Which declaration seeded each agreement?" A sample row shows agreement `1000` ("Compact Initiative", entered into force `2022-05-16T04:00:00`) seeded by declaration `1000` ("Compact Initiative", `9` principles). This view traces the lineage from principled statement to binding commitment.

**View `multilateral_environmental_agreement_international_environmental_institution_view`**

```sql
CREATE VIEW multilateral_environmental_agreement_international_environmental_institution_view AS
SELECT a.multilateral_environmental_agreement_id, a.agreement_id, a.title, a.entry_into_force_date, b.id AS institution_id, b.institution_id AS institution_institution_id, b.name AS institution_name
FROM multilateral_environmental_agreements a JOIN international_environmental_institutions b ON a.international_environmental_institution_id = b.id;
```

| multilateral_environmental_agreement_id | agreement_id | title | entry_into_force_date | institution_id | institution_institution_id | institution_name |
|---|---|---|---|---|---|---|
| 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative | 2022-05-16T04:00:00 | 1 | 9424913 | Extended Review |
| 1001 | 4716391 | Legacy Model | 2023-10-27T11:17:00 | 2 | 8189481 | Pilot Initiative A |
| 1002 | 3001009030180 | Regional Cluster A | 2024-03-11T18:34:00 | 3 | 1437604 | Baseline Model |
| 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review | 2025-08-22T01:51:00 | 4 | 884346 | Distributed Cluster |

This view joins `multilateral_environmental_agreements` with `international_environmental_institutions`, reversing the administration perspective. It answers: "Which institution administers each agreement?" A representative row links agreement `1000` ("Compact Initiative", scope `transboundary`) to institution `1` ("Extended Review", status `active`). This view supports the analysis of institutional capacity and agreement coverage.

**View `environmental_policy_instrument_multilateral_environmental_agreement_view`**

```sql
CREATE VIEW environmental_policy_instrument_multilateral_environmental_agreement_view AS
SELECT a.instrument_id, a.name, a.type, a.implementation_date, b.multilateral_environmental_agreement_id AS agreement_multilateral_environmental_agreement_id, b.agreement_id AS agreement_agreement_id, b.title AS agreement_title
FROM environmental_policy_instruments a JOIN multilateral_environmental_agreements b ON a.multilateral_environmental_agreement_id = b.multilateral_environmental_agreement_id;
```

| instrument_id | name | type | implementation_date | agreement_multilateral_environmental_agreement_id | agreement_agreement_id | agreement_title |
|---|---|---|---|---|---|---|
| 6926365 | Extended Review | regulation | 2024-11-14T10:06:00 | 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative |
| account_pymes_691 | Pilot Initiative A | market_incentive | 2025-04-25T17:23:00 | 1001 | 4716391 | Legacy Model |
| 726063 | Baseline Model | institutional_pressure | 2022-09-09T00:40:00 | 1002 | 3001009030180 | Regional Cluster A |
| 23256422 | Distributed Cluster | financial_assistance | 2023-02-20T07:57:00 | 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review |

This view joins `environmental_policy_instruments` with `multilateral_environmental_agreements` on the instrument-to-agreement foreign key. It answers: "Which agreement does each policy instrument implement?" A sample row shows instrument `6926365` ("Extended Review", type `regulation`, targeting the `industrial` sector) implementing agreement `1000` ("Compact Initiative", scope `transboundary`). This view is essential for tracing the implementation chain from agreement to instrument.

**View `environmental_policy_instrument_state_view`**

```sql
CREATE VIEW environmental_policy_instrument_state_view AS
SELECT a.instrument_id, a.name, a.type, a.implementation_date, b.id AS state_id, b.state_code AS state_state_code, b.name AS state_name
FROM environmental_policy_instruments a JOIN states b ON a.state_id = b.id;
```

| instrument_id | name | type | implementation_date | state_id | state_state_code | state_name |
|---|---|---|---|---|---|---|
| 6926365 | Extended Review | regulation | 2024-11-14T10:06:00 | 1 | 17788643 | Extended Review |
| account_pymes_691 | Pilot Initiative A | market_incentive | 2025-04-25T17:23:00 | 2 | 8350031 | Pilot Initiative A |
| 726063 | Baseline Model | institutional_pressure | 2022-09-09T00:40:00 | 3 | 790483 | Baseline Model |
| 23256422 | Distributed Cluster | financial_assistance | 2023-02-20T07:57:00 | 4 | 8387549 | Distributed Cluster |

This view joins `environmental_policy_instruments` with `states` on the instrument-to-state foreign key. It answers: "Which state has adopted each policy instrument?" A representative row links instrument `6926365` ("Extended Review", type `regulation`) to state `1`. This view supports the analysis of state-level policy adoption patterns.

**View `state_environmental_policy_instrument_view`**

```sql
CREATE VIEW state_environmental_policy_instrument_view AS
SELECT a.id, a.state_code, a.name, a.development_status, b.instrument_id AS instrument_instrument_id, b.name AS instrument_name, b.type AS instrument_type
FROM states a JOIN environmental_policy_instruments b ON a.instrument_id = b.instrument_id;
```

| id | state_code | name | development_status | instrument_instrument_id | instrument_name | instrument_type |
|---|---|---|---|---|---|---|
| 1 | 17788643 | Extended Review | industrialized | 6926365 | Extended Review | regulation |
| 2 | 8350031 | Pilot Initiative A | developing | account_pymes_691 | Pilot Initiative A | market_incentive |
| 3 | 790483 | Baseline Model | industrialized | 726063 | Baseline Model | institutional_pressure |
| 4 | 8387549 | Distributed Cluster | developing | 23256422 | Distributed Cluster | financial_assistance |

This view reverses the instrument perspective, joining `states` with `environmental_policy_instruments`. It answers: "Which instruments has each state adopted?" A sample row shows state `1` having adopted instrument `6926365` ("Extended Review", type `regulation`, targeting `industrial`). This view supports state-level policy portfolio analysis.

**View `state_multilateral_environmental_agreement_view`**

```sql
CREATE VIEW state_multilateral_environmental_agreement_view AS
SELECT a.id, a.state_code, a.name, a.development_status, b.multilateral_environmental_agreement_id AS agreement_multilateral_environmental_agreement_id, b.agreement_id AS agreement_agreement_id, b.title AS agreement_title
FROM states a JOIN multilateral_environmental_agreements b ON a.multilateral_environmental_agreement_id = b.multilateral_environmental_agreement_id;
```

| id | state_code | name | development_status | agreement_multilateral_environmental_agreement_id | agreement_agreement_id | agreement_title |
|---|---|---|---|---|---|---|
| 1 | 17788643 | Extended Review | industrialized | 1000 | 348c2b52-8fcc-11eb-924d-9cd76263cbd0 | Compact Initiative |
| 2 | 8350031 | Pilot Initiative A | developing | 1001 | 4716391 | Legacy Model |
| 3 | 790483 | Baseline Model | industrialized | 1002 | 3001009030180 | Regional Cluster A |
| 4 | 8387549 | Distributed Cluster | developing | 1003 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Review |

This view joins `states` with `multilateral_environmental_agreements` through the policy instruments table, creating a transitive relationship. It answers: "Which multilateral agreements are being implemented by each state?" A representative row links state `1` to agreement `1000` ("Compact Initiative", scope `transboundary`, status `ratified`). This view reveals the indirect but critical connection between sovereign states and international commitments.

**View `state_financial_assistance_view`**

```sql
CREATE VIEW state_financial_assistance_view AS
SELECT a.id, a.state_code, a.name, a.development_status, b.financial_assistance_id AS assistance_financial_assistance_id, b.assistance_id AS assistance_assistance_id, b.amount AS assistance_amount
FROM states a JOIN financial_assistances b ON a.financial_assistance_id = b.financial_assistance_id;
```

| id | state_code | name | development_status | assistance_financial_assistance_id | assistance_assistance_id | assistance_amount |
|---|---|---|---|---|---|---|
| 1 | 17788643 | Extended Review | industrialized | 100 | 763e85ae-9bac-11eb-a8a2-19ed5c03f8d3 | 13.49 |
| 2 | 8350031 | Pilot Initiative A | developing | 101 | Deskripsi | 25.47 |
| 3 | 790483 | Baseline Model | industrialized | 102 | 332 | 19.72 |
| 4 | 8387549 | Distributed Cluster | developing | 103 | 325447 | 12.74 |

This view joins `states` with `financial_assistances` on the state-to-assistance foreign key. It answers: "Which financial assistances has each state received?" A sample row shows state `1` receiving financial assistance with a specific amount and currency. This view supports the analysis of financial resource allocation across states.

**View `financial_assistance_state_view`**

```sql
CREATE VIEW financial_assistance_state_view AS
SELECT a.financial_assistance_id, a.assistance_id, a.amount, a.currency, b.id AS state_id, b.state_code AS state_state_code, b.name AS state_name
FROM financial_assistances a JOIN states b ON a.state_id = b.id;
```

| financial_assistance_id | assistance_id | amount | currency | state_id | state_state_code | state_name |
|---|---|---|---|---|---|---|
| 100 | 763e85ae-9bac-11eb-a8a2-19ed5c03f8d3 | 13.49 | seasonal-currency-71 | 1 | 17788643 | Extended Review |
| 101 | Deskripsi | 25.47 | regional-currency-72 | 2 | 8350031 | Pilot Initiative A |
| 102 | 332 | 19.72 | legacy-currency-73 | 3 | 790483 | Baseline Model |
| 103 | 325447 | 12.74 | compact-currency-74 | 4 | 8387549 | Distributed Cluster |

This view reverses the assistance perspective, joining `financial_assistances` with `states`. It answers: "Which state is the recipient of each financial assistance?" A representative row links financial assistance to state `1`. This view supports the analysis of assistance distribution patterns.

**View `financial_assistance_environmental_policy_instrument_view`**

```sql
CREATE VIEW financial_assistance_environmental_policy_instrument_view AS
SELECT a.financial_assistance_id, a.assistance_id, a.amount, a.currency, b.instrument_id AS instrument_instrument_id, b.name AS instrument_name, b.type AS instrument_type
FROM financial_assistances a JOIN environmental_policy_instruments b ON a.instrument_id = b.instrument_id;
```

| financial_assistance_id | assistance_id | amount | currency | instrument_instrument_id | instrument_name | instrument_type |
|---|---|---|---|---|---|---|
| 100 | 763e85ae-9bac-11eb-a8a2-19ed5c03f8d3 | 13.49 | seasonal-currency-71 | 6926365 | Extended Review | regulation |
| 101 | Deskripsi | 25.47 | regional-currency-72 | account_pymes_691 | Pilot Initiative A | market_incentive |
| 102 | 332 | 19.72 | legacy-currency-73 | 726063 | Baseline Model | institutional_pressure |
| 103 | 325447 | 12.74 | compact-currency-74 | 23256422 | Distributed Cluster | financial_assistance |

This view joins `financial_assistances` with `environmental_policy_instruments` through the states table, creating a transitive relationship. It answers: "Which policy instrument is associated with each financial assistance?" A sample row links financial assistance to instrument `6926365` ("Extended Review", type `regulation`). This view reveals the financial underpinnings of policy implementation.

The schema embodies a clear hierarchical decomposition of international environmental governance. Conferences sit at the apex, producing declarations and action plans while establishing institutions. Institutions administer multilateral agreements, which in turn are implemented through policy instruments within individual states. Financial assistances flow to states, enabling the practical execution of policy commitments. The foreign keys enforce referential integrity at each level, while the materialized views provide analytical lenses that reconstruct the full domain facts from the normalized base tables. This design balances normalization (reducing redundancy and update anomalies) with query convenience (providing pre-joined views for common analytical patterns). The result is a schema that faithfully represents the domain's conceptual structure while remaining practical for real-world querying and analysis.