## Ontology-Grounded Relational Modelling of Crown Dependencies and Overseas Territories

The domain under examination concerns the constitutional and administrative architecture linking Crown Dependencies and Overseas Territories to their sponsoring government departments, the human rights instruments that govern them, and the development fundings that sustain their economies. This is a domain of jurisdictional relationships: each territory or dependency is a distinct entity with its own identifier, population, economic status, and historical provenance, yet each is also bound to a government department, a human rights instrument, and (in the case of overseas territories) a development funding stream. The relational schema captures these bindings through a set of five base tables and ten derived views, where the base tables store atomic facts and the views materialize the join paths that reconstruct domain-level narratives. The following sections walk through the materialisation of this ontology from entity types to columns, foreign keys, and join-based views.

### Base Tables: Entity Types and Their Attributes

The schema's foundation consists of five base tables, each representing a distinct entity type in the domain ontology. These tables store the atomic facts; their columns are the attributes, and their foreign keys encode the cardinality-bounded relationships between entity types.

**Table `crown_dependencies`**

| id | identifier | name | location | population | economic_status | historical_link | government_department_id | human_rights_instrument_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | extended-location-99 | 42 | self-sufficient | crown | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 49 | dependent | colonial | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | IDE-2096 | Baseline Model | seasonal-location-101 | 56 | self-sufficient | crown | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | IDE-2101 | Distributed Cluster | regional-location-102 | 63 | dependent | colonial | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `crown_dependencies` table models each Crown Dependency as a row. Its primary key is `id`, an integer surrogate, while `identifier` (e.g., `IDE-2086`) serves as the stable business key. The `name` column carries a descriptive label such as *Extended Review* or *Pilot Initiative A*, and `location` stores a categorical location code like `extended-location-99` or `regional-location-102`. The `population` column holds integer counts (42 through 63 in the sample), `economic_status` is a categorical attribute with values `self-sufficient` or `dependent`, and `historical_link` distinguishes between `crown` and `colonial` provenance. Two foreign keys anchor this entity to the wider ontology: `government_department_id` references `government_departments.government_department_id`, and `human_rights_instrument_id` references `human_rights_instruments.human_rights_instrument_id`. The temporal columns `created_at` and `updated_at` record the lifecycle of each row. For instance, row 1 (identifier `IDE-2086`, name *Extended Review*) is a `self-sufficient` dependency with a `crown` historical link, governed by department 1 and subject to human rights instrument 1.

**Table `overseas_territories`**

| id | identifier | name | location | population | economic_status | historical_link | non_self_governing | government_department_id | human_rights_instrument_id | development_funding_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | extended-location-99 | 42 | self-sufficient | crown | false | 1 | 1 | 1000 |
| 2 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 49 | dependent | colonial | true | 2 | 2 | 1001 |
| 3 | IDE-2096 | Baseline Model | seasonal-location-101 | 56 | self-sufficient | crown | false | 3 | 3 | 1002 |
| 4 | IDE-2101 | Distributed Cluster | regional-location-102 | 63 | dependent | colonial | true | 4 | 4 | 1003 |

The `overseas_territories` table mirrors the structure of `crown_dependencies` with one critical addition: the `non_self_governing` boolean column, which flags territories that lack self-governance. In the sample data, rows 2 and 4 carry the value `true`, while rows 1 and 3 carry `false`. The same foreign key pattern applies: `government_department_id` and `human_rights_instrument_id` reference their respective base tables, and an additional foreign key, `development_funding_id`, links each overseas territory to a row in `development_fundings`. Row 2 (identifier `IDE-2091`, name *Pilot Initiative A*) is a `dependent` territory with `non_self_governing = true`, governed by department 2, subject to instrument 2, and funded by development funding 1001.

**Table `government_departments`**

| government_department_id | identifier | name | responsibility_area | crown_dependency_id | overseas_territory_id |
|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | crown_dependencies | 1 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | overseas_territories | 2 | 2 |
| 3 | IDE-2096 | Baseline Model | defence | 3 | 3 |
| 4 | IDE-2101 | Distributed Cluster | development | 4 | 4 |

The `government_departments` table is the central hub of the schema. Its primary key is `government_department_id`, and its attributes include `identifier`, `name`, and `responsibility_area`, which categorises the department's jurisdiction as `crown_dependencies`, `overseas_territories`, `defence`, or `development`. The columns `crown_dependency_id` and `overseas_territory_id` are the inverse-side foreign keys: they point back to the territory tables, establishing the one-to-many relationship from department to territory. Row 1 (identifier `IDE-2086`, name *Extended Review*) has responsibility area `crown_dependencies` and links to crown dependency 1 and overseas territory 1. Row 4 (identifier `IDE-2101`, name *Distributed Cluster*) covers `development` and links to crown dependency 4 and overseas territory 4.

**Table `human_rights_instruments`**

| human_rights_instrument_id | identifier | name | type | status | crown_dependency_id | overseas_territory_id |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | treaty | ratified | 1 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | charter | pending | 2 | 2 |
| 3 | IDE-2096 | Baseline Model | act | rejected | 3 | 3 |
| 4 | IDE-2101 | Distributed Cluster | treaty | ratified | 4 | 4 |

The `human_rights_instruments` table models legal instruments that apply to territories. Its primary key is `human_rights_instrument_id`, and its attributes include `identifier`, `name`, `type` (with values `treaty`, `charter`, or `act`), and `status` (with values `ratified`, `pending`, or `rejected`). The columns `crown_dependency_id` and `overseas_territory_id` again serve as inverse-side foreign keys, pointing back to the territory tables. Row 1 (identifier `IDE-2086`, name *Extended Review*) is a `treaty` with `ratified` status, applying to crown dependency 1 and overseas territory 1. Row 3 (identifier `IDE-2096`, name *Baseline Model*) is an `act` with `rejected` status, applying to crown dependency 3 and overseas territory 3.

**Table `development_fundings`**

| development_funding_id | identifier | amount | currency | start_date | end_date | purpose | overseas_territory_id |
|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | 13.49 | seasonal-currency-71 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | oda | 1 |
| 1001 | IDE-2091 | 25.47 | regional-currency-72 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | infrastructure | 2 |
| 1002 | IDE-2096 | 19.72 | legacy-currency-73 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | social | 3 |
| 1003 | IDE-2101 | 12.74 | compact-currency-74 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | oda | 4 |

The `development_fundings` table captures financial support streams for overseas territories. Its primary key is `development_funding_id`, and its attributes include `identifier`, `amount` (a decimal, e.g., `13.49` or `25.47`), `currency` (e.g., `seasonal-currency-71`), `start_date` and `end_date` (ISO 8601 timestamps), and `purpose` (with values `oda`, `infrastructure`, or `social`). The foreign key `overseas_territory_id` links each funding row to the territory it supports. Row 1000 (identifier `IDE-2086`, amount `13.49`, purpose `oda`) supports overseas territory 1. Row 1001 (identifier `IDE-2091`, amount `25.47`, purpose `infrastructure`) supports overseas territory 2.

### Foreign Key Topology and Cardinality

The foreign key topology of this schema forms a star-like structure centred on `government_departments`. Each Crown Dependency and each Overseas Territory holds a forward foreign key to `government_departments` (via `government_department_id`) and a forward foreign key to `human_rights_instruments` (via `human_rights_instrument_id`). Conversely, `government_departments` and `human_rights_instruments` each hold inverse foreign keys (`crown_dependency_id` and `overseas_territory_id`) that point back to the territory tables. This bidirectional foreign key pattern is a deliberate normalisation choice: it allows queries to traverse the relationship in either direction without requiring a separate junction table. The `development_fundings` table follows a simpler pattern, with a single forward foreign key `overseas_territory_id` pointing to `overseas_territories`.

The cardinality implied by these keys is one-to-many in both directions. A single government department can be associated with multiple crown dependencies and multiple overseas territories (as evidenced by the fact that department 1 links to both crown dependency 1 and overseas territory 1). Similarly, a single human rights instrument can apply to multiple territories. The `development_funding_id` relationship is one-to-one in the sample data (each overseas territory has exactly one funding row), though the schema does not enforce uniqueness at the database level.

### Views: Materialising Domain Facts Through Joins

The ten views in the schema are derived relations that reconstruct domain-level facts by joining the base tables. Each view answers a specific question about the relationships between entity types. The following sections interpret each view's join logic and its output.

**View `v_crown_dependency_government_department`**

```sql
CREATE VIEW v_crown_dependency_government_department AS
SELECT a.id, a.identifier, a.name, a.location, b.government_department_id AS department_government_department_id, b.identifier AS department_identifier, b.name AS department_name
FROM crown_dependencies a JOIN government_departments b ON a.government_department_id = b.government_department_id;
```

| id | identifier | name | location | department_government_department_id | department_identifier | department_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | extended-location-99 | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | seasonal-location-101 | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | regional-location-102 | 4 | IDE-2101 | Distributed Cluster |

The view `v_crown_dependency_government_department` joins `crown_dependencies` to `government_departments` on the equality `crown_dependencies.government_department_id = government_departments.government_department_id`. It projects the crown dependency's `id`, `identifier`, `name`, and `location`, together with the department's `government_department_id` (aliased as `department_government_department_id`), `identifier`, and `name`. This view answers the question: *Which government department governs each Crown Dependency?* Row 1 shows that crown dependency `IDE-2086` (*Extended Review*) is governed by department `IDE-2086` (*Extended Review*). Row 4 shows that crown dependency `IDE-2101` (*Distributed Cluster*) is governed by department `IDE-2101` (*Distributed Cluster*).

**View `v_crown_dependency_human_rights_instrument`**

```sql
CREATE VIEW v_crown_dependency_human_rights_instrument AS
SELECT a.id, a.identifier, a.name, a.location, b.human_rights_instrument_id AS instrument_human_rights_instrument_id, b.identifier AS instrument_identifier, b.name AS instrument_name
FROM crown_dependencies a JOIN human_rights_instruments b ON a.human_rights_instrument_id = b.human_rights_instrument_id;
```

| id | identifier | name | location | instrument_human_rights_instrument_id | instrument_identifier | instrument_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | extended-location-99 | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | seasonal-location-101 | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | regional-location-102 | 4 | IDE-2101 | Distributed Cluster |

The view `v_crown_dependency_human_rights_instrument` joins `crown_dependencies` to `human_rights_instruments` on `crown_dependencies.human_rights_instrument_id = human_rights_instruments.human_rights_instrument_id`. It projects the crown dependency's identifying columns alongside the instrument's `human_rights_instrument_id`, `identifier`, and `name`. This view answers: *Which human rights instrument applies to each Crown Dependency?* Row 1 reveals that crown dependency `IDE-2086` is subject to instrument `IDE-2086` (*Extended Review*). Row 3 reveals that crown dependency `IDE-2096` (*Baseline Model*) is subject to instrument `IDE-2096` (*Baseline Model*).

**View `v_overseas_territory_government_department`**

```sql
CREATE VIEW v_overseas_territory_government_department AS
SELECT a.id, a.identifier, a.name, a.location, b.government_department_id AS department_government_department_id, b.identifier AS department_identifier, b.name AS department_name
FROM overseas_territories a JOIN government_departments b ON a.government_department_id = b.government_department_id;
```

| id | identifier | name | location | department_government_department_id | department_identifier | department_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | extended-location-99 | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | seasonal-location-101 | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | regional-location-102 | 4 | IDE-2101 | Distributed Cluster |

The view `v_overseas_territory_government_department` joins `overseas_territories` to `government_departments` on `overseas_territories.government_department_id = government_departments.government_department_id`. It projects the overseas territory's `id`, `identifier`, `name`, and `location`, together with the department's `government_department_id` (aliased as `department_government_department_id`), `identifier`, and `name`. This view answers: *Which government department governs each Overseas Territory?* Row 1 shows that overseas territory `IDE-2086` (*Extended Review*) is governed by department `IDE-2086` (*Extended Review*). Row 2 shows that overseas territory `IDE-2091` (*Pilot Initiative A*) is governed by department `IDE-2091` (*Pilot Initiative A*).

**View `v_overseas_territory_human_rights_instrument`**

```sql
CREATE VIEW v_overseas_territory_human_rights_instrument AS
SELECT a.id, a.identifier, a.name, a.location, b.human_rights_instrument_id AS instrument_human_rights_instrument_id, b.identifier AS instrument_identifier, b.name AS instrument_name
FROM overseas_territories a JOIN human_rights_instruments b ON a.human_rights_instrument_id = b.human_rights_instrument_id;
```

| id | identifier | name | location | instrument_human_rights_instrument_id | instrument_identifier | instrument_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | extended-location-99 | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | seasonal-location-101 | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | regional-location-102 | 4 | IDE-2101 | Distributed Cluster |

The view `v_overseas_territory_human_rights_instrument` joins `overseas_territories` to `human_rights_instruments` on `overseas_territories.human_rights_instrument_id = human_rights_instruments.human_rights_instrument_id`. It projects the overseas territory's identifying columns alongside the instrument's `human_rights_instrument_id`, `identifier`, and `name`. This view answers: *Which human rights instrument applies to each Overseas Territory?* Row 1 shows that overseas territory `IDE-2086` is subject to instrument `IDE-2086` (*Extended Review*). Row 4 shows that overseas territory `IDE-2101` (*Distributed Cluster*) is subject to instrument `IDE-2101` (*Distributed Cluster*).

**View `v_overseas_territory_development_funding`**

```sql
CREATE VIEW v_overseas_territory_development_funding AS
SELECT a.id, a.identifier, a.name, a.location, b.development_funding_id AS funding_development_funding_id, b.identifier AS funding_identifier, b.amount AS funding_amount
FROM overseas_territories a JOIN development_fundings b ON a.development_funding_id = b.development_funding_id;
```

| id | identifier | name | location | funding_development_funding_id | funding_identifier | funding_amount |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | extended-location-99 | 1000 | IDE-2086 | 13.49 |
| 2 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 1001 | IDE-2091 | 25.47 |
| 3 | IDE-2096 | Baseline Model | seasonal-location-101 | 1002 | IDE-2096 | 19.72 |
| 4 | IDE-2101 | Distributed Cluster | regional-location-102 | 1003 | IDE-2101 | 12.74 |

The view `v_overseas_territory_development_funding` joins `overseas_territories` to `development_fundings` on `overseas_territories.development_funding_id = development_fundings.development_funding_id`. It projects the overseas territory's `id`, `identifier`, `name`, and `location`, together with the funding's `development_funding_id` (aliased as `funding_development_funding_id`), `identifier`, and `amount`. This view answers: *Which development funding supports each Overseas Territory, and at what amount?* Row 1 shows that overseas territory `IDE-2086` receives funding `IDE-2086` with an amount of `13.49`. Row 2 shows that overseas territory `IDE-2091` receives funding `IDE-2091` with an amount of `25.47`.

**View `v_government_department_crown_dependency`**

```sql
CREATE VIEW v_government_department_crown_dependency AS
SELECT a.government_department_id, a.identifier, a.name, a.responsibility_area, b.id AS dependency_id, b.identifier AS dependency_identifier, b.name AS dependency_name
FROM government_departments a JOIN crown_dependencies b ON a.crown_dependency_id = b.id;
```

| government_department_id | identifier | name | responsibility_area | dependency_id | dependency_identifier | dependency_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | crown_dependencies | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | overseas_territories | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | defence | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | development | 4 | IDE-2101 | Distributed Cluster |

The view `v_government_department_crown_dependency` joins `government_departments` to `crown_dependencies` on `government_departments.government_department_id = crown_dependencies.government_department_id`. It projects the department's `government_department_id`, `identifier`, and `name`, together with the crown dependency's `id`, `identifier`, and `name`. This view answers the inverse question of `v_crown_dependency_government_department`: *Which Crown Dependencies are governed by each government department?* Row 1 shows that department `IDE-2086` (*Extended Review*) governs crown dependency `IDE-2086` (*Extended Review*). Row 3 shows that department `IDE-2096` (*Baseline Model*) governs crown dependency `IDE-2096` (*Baseline Model*).

**View `v_government_department_overseas_territory`**

```sql
CREATE VIEW v_government_department_overseas_territory AS
SELECT a.government_department_id, a.identifier, a.name, a.responsibility_area, b.id AS territory_id, b.identifier AS territory_identifier, b.name AS territory_name
FROM government_departments a JOIN overseas_territories b ON a.overseas_territory_id = b.id;
```

| government_department_id | identifier | name | responsibility_area | territory_id | territory_identifier | territory_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | crown_dependencies | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | overseas_territories | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | defence | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | development | 4 | IDE-2101 | Distributed Cluster |

The view `v_government_department_overseas_territory` joins `government_departments` to `overseas_territories` on `government_departments.government_department_id = overseas_territories.government_department_id`. It projects the department's `government_department_id`, `identifier`, and `name`, together with the overseas territory's `id`, `identifier`, and `name`. This view answers: *Which Overseas Territories are governed by each government department?* Row 1 shows that department `IDE-2086` (*Extended Review*) governs overseas territory `IDE-2086` (*Extended Review*). Row 4 shows that department `IDE-2101` (*Distributed Cluster*) governs overseas territory `IDE-2101` (*Distributed Cluster*).

**View `v_human_rights_instrument_crown_dependency`**

```sql
CREATE VIEW v_human_rights_instrument_crown_dependency AS
SELECT a.human_rights_instrument_id, a.identifier, a.name, a.type, b.id AS dependency_id, b.identifier AS dependency_identifier, b.name AS dependency_name
FROM human_rights_instruments a JOIN crown_dependencies b ON a.crown_dependency_id = b.id;
```

| human_rights_instrument_id | identifier | name | type | dependency_id | dependency_identifier | dependency_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | treaty | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | charter | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | act | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | treaty | 4 | IDE-2101 | Distributed Cluster |

The view `v_human_rights_instrument_crown_dependency` joins `human_rights_instruments` to `crown_dependencies` on `human_rights_instruments.human_rights_instrument_id = crown_dependencies.human_rights_instrument_id`. It projects the instrument's `human_rights_instrument_id`, `identifier`, and `name`, together with the crown dependency's `id`, `identifier`, and `name`. This view answers the inverse question of `v_crown_dependency_human_rights_instrument`: *Which Crown Dependencies are subject to each human rights instrument?* Row 1 shows that instrument `IDE-2086` (*Extended Review*) applies to crown dependency `IDE-2086` (*Extended Review*). Row 3 shows that instrument `IDE-2096` (*Baseline Model*) applies to crown dependency `IDE-2096` (*Baseline Model*).

**View `v_human_rights_instrument_overseas_territory`**

```sql
CREATE VIEW v_human_rights_instrument_overseas_territory AS
SELECT a.human_rights_instrument_id, a.identifier, a.name, a.type, b.id AS territory_id, b.identifier AS territory_identifier, b.name AS territory_name
FROM human_rights_instruments a JOIN overseas_territories b ON a.overseas_territory_id = b.id;
```

| human_rights_instrument_id | identifier | name | type | territory_id | territory_identifier | territory_name |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | treaty | 1 | IDE-2086 | Extended Review |
| 2 | IDE-2091 | Pilot Initiative A | charter | 2 | IDE-2091 | Pilot Initiative A |
| 3 | IDE-2096 | Baseline Model | act | 3 | IDE-2096 | Baseline Model |
| 4 | IDE-2101 | Distributed Cluster | treaty | 4 | IDE-2101 | Distributed Cluster |

The view `v_human_rights_instrument_overseas_territory` joins `human_rights_instruments` to `overseas_territories` on `human_rights_instruments.human_rights_instrument_id = overseas_territories.human_rights_instrument_id`. It projects the instrument's `human_rights_instrument_id`, `identifier`, and `name`, together with the overseas territory's `id`, `identifier`, and `name`. This view answers: *Which Overseas Territories are subject to each human rights instrument?* Row 1 shows that instrument `IDE-2086` (*Extended Review*) applies to overseas territory `IDE-2086` (*Extended Review*). Row 4 shows that instrument `IDE-2101` (*Distributed Cluster*) applies to overseas territory `IDE-2101` (*Distributed Cluster*).

**View `v_development_funding_overseas_territory`**

```sql
CREATE VIEW v_development_funding_overseas_territory AS
SELECT a.development_funding_id, a.identifier, a.amount, a.currency, b.id AS territory_id, b.identifier AS territory_identifier, b.name AS territory_name
FROM development_fundings a JOIN overseas_territories b ON a.overseas_territory_id = b.id;
```

| development_funding_id | identifier | amount | currency | territory_id | territory_identifier | territory_name |
|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | 13.49 | seasonal-currency-71 | 1 | IDE-2086 | Extended Review |
| 1001 | IDE-2091 | 25.47 | regional-currency-72 | 2 | IDE-2091 | Pilot Initiative A |
| 1002 | IDE-2096 | 19.72 | legacy-currency-73 | 3 | IDE-2096 | Baseline Model |
| 1003 | IDE-2101 | 12.74 | compact-currency-74 | 4 | IDE-2101 | Distributed Cluster |

The view `v_development_funding_overseas_territory` joins `development_fundings` to `overseas_territories` on `development_fundings.development_funding_id = overseas_territories.development_funding_id`. It projects the funding's `development_funding_id`, `identifier`, and `amount`, together with the overseas territory's `id`, `identifier`, and `name`. This view answers the inverse question of `v_overseas_territory_development_funding`: *Which Overseas Territories receive each development funding?* Row 1 shows that funding `IDE-2086` (amount `13.49`) supports overseas territory `IDE-2086` (*Extended Review*). Row 3 shows that funding `IDE-2096` (amount `19.72`) supports overseas territory `IDE-2096` (*Baseline Model*).

### Synthesis

The schema models the Crown Dependencies and Overseas Territories domain as a set of five normalised base tables connected by foreign keys that encode one-to-many relationships in both directions. The `government_departments` table serves as the central hub, with `crown_dependencies` and `overseas_territories` each holding a forward foreign key to it and a forward foreign key to `human_rights_instruments`. The `development_fundings` table attaches exclusively to `overseas_territories`. The ten views materialise every pairwise join between these entity types, projecting the identifying columns of both sides so that each row in a view represents a single domain fact: a dependency governed by a department, a territory subject to an instrument, or a funding stream supporting a territory. The record identifiers (e.g., `IDE-2086`, `IDE-2101`) and attribute values (e.g., `self-sufficient`, `ratified`, `oda`) provide the concrete grounding that ties the abstract schema to the lived reality of the domain.