## The Architecture of Territorial Governance

The administration of Crown Dependencies and Overseas Territories represents a layered system of jurisdictional oversight, financial support, and legal compliance. Each territory operates under the authority of a government department, adheres to specific human rights instruments, and may receive development funding. The records in this domain capture the full chain of accountability: from the territorial entity itself, through the department responsible for its governance, to the legal instruments and financial commitments that shape its development. Understanding these relationships requires examining both the individual records and the joined views that reveal how territories, departments, instruments, and fundings interlock.

**Table `crown_dependencies`**

| id | identifier | name | location | population | economic_status | historical_link | government_department_id | human_rights_instrument_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | extended-location-99 | 42 | self-sufficient | crown | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 49 | dependent | colonial | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | IDE-2096 | Baseline Model | seasonal-location-101 | 56 | self-sufficient | crown | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | IDE-2101 | Distributed Cluster | regional-location-102 | 63 | dependent | colonial | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Crown Dependencies are self-governing possessions of the Crown, distinguished by their historical link type and economic status. The table records four entities, each identified by a unique code such as IDE-2086 for Extended Review or IDE-2091 for Pilot Initiative A. Locations range from extended-location-99 to regional-location-102, and populations are modest, spanning from 42 to 63 residents. The economic_status column classifies each dependency as either self-sufficient or dependent, while the historical_link column traces its lineage to either crown or colonial origins. Each record carries a government_department_id and a human_rights_instrument_id, establishing the two primary foreign-key relationships that anchor the Crown Dependencies to their oversight structures. Timestamps in created_at and updated_at track when each record was first entered and last modified.

**Table `overseas_territories`**

| id | identifier | name | location | population | economic_status | historical_link | non_self_governing | government_department_id | human_rights_instrument_id | development_funding_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | extended-location-99 | 42 | self-sufficient | crown | false | 1 | 1 | 1000 |
| 2 | IDE-2091 | Pilot Initiative A | integrated-location-100 | 49 | dependent | colonial | true | 2 | 2 | 1001 |
| 3 | IDE-2096 | Baseline Model | seasonal-location-101 | 56 | self-sufficient | crown | false | 3 | 3 | 1002 |
| 4 | IDE-2101 | Distributed Cluster | regional-location-102 | 63 | dependent | colonial | true | 4 | 4 | 1003 |

Overseas Territories share a similar structural profile but include two additional columns that distinguish them from Crown Dependencies. The non_self_governing flag marks whether a territory holds that classification, with values of true for Pilot Initiative A and Distributed Cluster, and false for Extended Review and Baseline Model. The development_funding_id column links each territory to a specific funding record, creating a financial relationship absent from the Crown Dependencies table. Otherwise, the columns mirror those of the crown_dependencies table: identifier, name, location, population, economic_status, historical_link, and the same government_department_id and human_rights_instrument_id foreign keys.

**Table `government_departments`**

| government_department_id | identifier | name | responsibility_area | crown_dependency_id | overseas_territory_id |
|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | crown_dependencies | 1 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | overseas_territories | 2 | 2 |
| 3 | IDE-2096 | Baseline Model | defence | 3 | 3 |
| 4 | IDE-2101 | Distributed Cluster | development | 4 | 4 |

Government Departments serve as the administrative backbone of the system. Each department is identified by a government_department_id and carries an identifier, name, and responsibility_area. The responsibility_area values—crown_dependencies, overseas_territories, defence, and development—indicate the functional domain each department oversees. The table also includes crown_dependency_id and overseas_territory_id columns, which create bidirectional relationships back to the territorial entities. Department IDE-2086, named Extended Review, holds responsibility for crown_dependencies and links to both Crown Dependency 1 and Overseas Territory 1. Department IDE-2101, named Distributed Cluster, focuses on development and connects to Crown Dependency 4 and Overseas Territory 4.

**Table `human_rights_instruments`**

| human_rights_instrument_id | identifier | name | type | status | crown_dependency_id | overseas_territory_id |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | treaty | ratified | 1 | 1 |
| 2 | IDE-2091 | Pilot Initiative A | charter | pending | 2 | 2 |
| 3 | IDE-2096 | Baseline Model | act | rejected | 3 | 3 |
| 4 | IDE-2101 | Distributed Cluster | treaty | ratified | 4 | 4 |

Human Rights Instruments define the legal frameworks that territories must navigate. Each instrument carries a type—treaty, charter, or act—and a status—ratified, pending, or rejected. The record IDE-2086 (Extended Review) is a ratified treaty, while IDE-2091 (Pilot Initiative A) is a charter with pending status. IDE-2096 (Baseline Model) is an act that has been rejected, and IDE-2101 (Distributed Cluster) is a ratified treaty. The table includes crown_dependency_id and overseas_territory_id columns, enabling each instrument to be associated with one or both types of territory.

**Table `development_fundings`**

| development_funding_id | identifier | amount | currency | start_date | end_date | purpose | overseas_territory_id |
|---|---|---|---|---|---|---|---|
| 1000 | IDE-2086 | 13.49 | seasonal-currency-71 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | oda | 1 |
| 1001 | IDE-2091 | 25.47 | regional-currency-72 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | infrastructure | 2 |
| 1002 | IDE-2096 | 19.72 | legacy-currency-73 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | social | 3 |
| 1003 | IDE-2101 | 12.74 | compact-currency-74 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | oda | 4 |

Development Fundings capture the financial commitments made to Overseas Territories. Each funding record carries an amount, a currency, a start_date, an end_date, and a purpose. The purposes include oda, infrastructure, and social. Amounts range from 12.74 to 25.47, expressed in currencies such as seasonal-currency-71 and regional-currency-72. The overseas_territory_id column links each funding to its recipient territory. Notably, the end_date precedes the start_date in every record, suggesting a data convention where the end_date represents a target or deadline rather than a completed date.

## Cross-Reference Views

The domain's relational structure becomes most visible through its views. Each view joins two or more base tables to answer a specific operational question. The following sections interpret the results of each view, using concrete rows as evidence.

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

This view joins Crown Dependencies to their responsible Government Departments, answering the question: which department governs each Crown Dependency? The join condition matches crown_dependencies.government_department_id to government_departments.government_department_id. The result includes the territory's identifier, name, and location alongside the department's identifier and name. Row 1 shows that Crown Dependency IDE-2086 (Extended Review, located at extended-location-99) is governed by Department IDE-2086 (Extended Review). Row 4 shows that Crown Dependency IDE-2101 (Distributed Cluster, located at regional-location-102) is governed by Department IDE-2101 (Distributed Cluster). The one-to-one alignment of identifiers across both tables in this view reflects a direct mapping where each Crown Dependency has exactly one assigned department.

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

This view links Crown Dependencies to the Human Rights Instruments that apply to them, answering: which legal framework governs each Crown Dependency? The join matches crown_dependencies.human_rights_instrument_id to human_rights_instruments.human_rights_instrument_id. The result surfaces the territory's details alongside the instrument's identifier and name. Row 1 reveals that Crown Dependency IDE-2086 is subject to Instrument IDE-2086 (Extended Review). Row 3 shows that Crown Dependency IDE-2096 (Baseline Model) is subject to Instrument IDE-2096 (Baseline Model). This view does not include the instrument's type or status columns, focusing instead on the identity-level linkage between territory and instrument.

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

This view joins Overseas Territories to their responsible Government Departments, answering: which department oversees each Overseas Territory? The join condition matches overseas_territories.government_department_id to government_departments.government_department_id. The result includes the territory's identifier, name, and location alongside the department's identifier and name. Row 1 shows that Overseas Territory IDE-2086 (Extended Review, at extended-location-99) is governed by Department IDE-2086 (Extended Review). Row 2 shows that Overseas Territory IDE-2091 (Pilot Initiative A, at integrated-location-100) is governed by Department IDE-2091 (Pilot Initiative A). As with the Crown Dependencies view, the identifiers align directly, confirming a one-to-one department-to-territory assignment.

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

This view links Overseas Territories to their applicable Human Rights Instruments, answering: which legal framework applies to each Overseas Territory? The join matches overseas_territories.human_rights_instrument_id to human_rights_instruments.human_rights_instrument_id. Row 1 shows that Overseas Territory IDE-2086 is subject to Instrument IDE-2086 (Extended Review). Row 4 shows that Overseas Territory IDE-2101 (Distributed Cluster) is subject to Instrument IDE-2101 (Distributed Cluster). The view surfaces the territory's core attributes alongside the instrument's identifier and name, providing a clear mapping between territorial jurisdiction and legal obligation.

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

This view joins Overseas Territories to their Development Fundings, answering: which funding supports each Overseas Territory? The join matches overseas_territories.development_funding_id to development_fundings.development_funding_id. Row 1 shows that Overseas Territory IDE-2086 receives Funding IDE-2086 with an amount of 13.49 in seasonal-currency-71, designated for oda purposes. Row 2 shows that Overseas Territory IDE-2091 receives Funding IDE-2091 with an amount of 25.47 in regional-currency-72, designated for infrastructure. Row 3 shows that Overseas Territory IDE-2096 receives Funding IDE-2096 with an amount of 19.72 in legacy-currency-73, designated for social purposes. Row 4 shows that Overseas Territory IDE-2101 receives Funding IDE-2101 with an amount of 12.74 in compact-currency-74, designated for oda. This view is the only one that surfaces financial data, making it essential for budgetary analysis and resource allocation reviews.

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

This view reverses the perspective of v_crown_dependency_government_department, joining Government Departments to the Crown Dependencies they oversee. It answers: which Crown Dependencies fall under each department's purview? The join matches government_departments.crown_dependency_id to crown_dependencies.id. Row 1 shows that Department IDE-2086 (Extended Review, responsible for crown_dependencies) oversees Crown Dependency IDE-2086 (Extended Review, located at extended-location-99, population 42, self-sufficient). Row 4 shows that Department IDE-2101 (Distributed Cluster, responsible for development) oversees Crown Dependency IDE-2101 (Distributed Cluster, located at regional-location-102, population 63, dependent). This bidirectional view is useful for department-level reporting, where the starting point is the department rather than the territory.

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

This view reverses the perspective of v_overseas_territory_government_department, joining Government Departments to the Overseas Territories they oversee. It answers: which Overseas Territories fall under each department's purview? The join matches government_departments.overseas_territory_id to overseas_territories.id. Row 1 shows that Department IDE-2086 (Extended Review, responsible for crown_dependencies) oversees Overseas Territory IDE-2086 (Extended Review, at extended-location-99, population 42, self-sufficient, non_self_governing is false). Row 2 shows that Department IDE-2091 (Pilot Initiative A, responsible for overseas_territories) oversees Overseas Territory IDE-2091 (Pilot Initiative A, at integrated-location-100, population 49, dependent, non_self_governing is true). This view is particularly valuable for identifying which territories carry the non_self_governing designation and which departments manage them.

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

This view reverses the perspective of v_crown_dependency_human_rights_instrument, joining Human Rights Instruments to the Crown Dependencies they govern. It answers: which Crown Dependencies are subject to each instrument? The join matches human_rights_instruments.crown_dependency_id to crown_dependencies.id. Row 1 shows that Instrument IDE-2086 (Extended Review, type treaty, status ratified) applies to Crown Dependency IDE-2086 (Extended Review, at extended-location-99, population 42). Row 3 shows that Instrument IDE-2096 (Baseline Model, type act, status rejected) applies to Crown Dependency IDE-2096 (Baseline Model, at seasonal-location-101, population 56). This view is essential for compliance audits, as it surfaces the instrument's type and status alongside the territory it affects.

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

This view reverses the perspective of v_overseas_territory_human_rights_instrument, joining Human Rights Instruments to the Overseas Territories they govern. It answers: which Overseas Territories are subject to each instrument? The join matches human_rights_instruments.overseas_territory_id to overseas_territories.id. Row 1 shows that Instrument IDE-2086 (Extended Review, type treaty, status ratified) applies to Overseas Territory IDE-2086 (Extended Review, at extended-location-99, population 42, non_self_governing is false). Row 4 shows that Instrument IDE-2101 (Distributed Cluster, type treaty, status ratified) applies to Overseas Territory IDE-2101 (Distributed Cluster, at regional-location-102, population 63, non_self_governing is true). This view enables legal teams to assess ratification coverage across territories and identify any gaps in instrument application.

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

This view reverses the perspective of v_overseas_territory_development_funding, joining Development Fundings to the Overseas Territories they support. It answers: which Overseas Territory receives each funding allocation? The join matches development_fundings.overseas_territory_id to overseas_territories.id. Row 1 shows that Funding IDE-2086 (amount 13.49, currency seasonal-currency-71, purpose oda, start_date 2022-09-05, end_date 2022-09-01) supports Overseas Territory IDE-2086 (Extended Review, at extended-location-99, population 42, self-sufficient). Row 2 shows that Funding IDE-2091 (amount 25.47, currency regional-currency-72, purpose infrastructure, start_date 2023-02-16, end_date 2023-02-12) supports Overseas Territory IDE-2091 (Pilot Initiative A, at integrated-location-100, population 49, dependent, non_self_governing is true). This bidirectional view is critical for financial reconciliation, allowing auditors to trace each funding allocation to its recipient territory and verify that the purpose aligns with the territory's needs.

## Synthesis

The domain's five base tables and ten views form a coherent system for tracking territorial governance. Crown Dependencies and Overseas Territories share a common structure but diverge in two key respects: the non_self_governing flag and the development_funding_id column, which appear only in the Overseas Territories table. Government Departments provide the administrative layer, linking to both territory types through multiple foreign keys. Human Rights Instruments define the legal frameworks, and Development Fundings capture the financial commitments. The ten views offer bidirectional perspectives on these relationships, enabling analysts to start from any entity—territory, department, instrument, or funding—and navigate to all connected records. The consistent use of identifier codes such as IDE-2086 and IDE-2091 across tables ensures that joins produce predictable, traceable results. Together, the tables and views provide a complete operational picture of how territories are governed, regulated, and funded.