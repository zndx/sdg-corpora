## Domain Modelling and Relational Materialisation

The financial compliance domain captures the lifecycle of regulatory scrutiny as it flows through institutional hierarchies, divisional boundaries, and client relationships. At its core, the model tracks how a financial institution becomes the subject of a compliance investigation, how that investigation surfaces specific deficiencies, how those deficiencies are assigned to banking divisions and high-risk clients, and how suspicious activity reports are filed in response. The six base tables — `financial_institutions`, `compliance_investigations`, `compliance_deficiencies`, `banking_divisions`, `high_risk_clients`, and `suspicious_activity_reports` — form a directed acyclic graph of foreign-key relationships that normalises this narrative into atomic facts. The twenty views then materialise every pairwise join, allowing analysts to reconstruct any two-table domain fact without writing ad-hoc SQL.

**Table `financial_institutions`**

| financial_institution_id | institution_id | legal_name | headquarters_city | headquarters_country | charter_type | fed_member_status | regulatory_status | has_subsidiary_financial_institution_id | compliance_investigation_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Adaptive Model | seasonal-headquar-83 | regional-headquar-42 | state-chartered | false | active | 1 | 100 |
| 2 | 8189481 | Primary Cluster | regional-headquar-84 | legacy-headquar-43 | federal | true | sanctioned | 2 | 101 |
| 3 | 1437604 | Composite Review D | legacy-headquar-85 | compact-headquar-44 | foreign | false | under_investigation | 3 | 102 |
| 4 | 884346 | Compact Initiative | compact-headquar-86 | composite-headquar-45 | state-chartered | true | active | 4 | 103 |

The `financial_institutions` table anchors the entire model. Each row represents a distinct legal entity, identified by a surrogate `financial_institution_id` (an integer primary key) and a human-readable `institution_id` (e.g., `9424913`). The `legal_name` column carries descriptive identifiers such as `Adaptive Model` and `Primary Cluster`, while `headquarters_city` and `headquarters_country` store location codes like `seasonal-headquar-83` and `regional-headquar-42`. The `charter_type` column distinguishes between `state-chartered`, `federal`, and `foreign` charters, and `fed_member_status` is a boolean flag. The `regulatory_status` column enumerates the current standing of the institution: `active`, `sanctioned`, or `under_investigation`. Two foreign keys sit on this table: `has_subsidiary_financial_institution_id` points to another row within `financial_institutions` to model parent-subsidiary relationships, and `compliance_investigation_id` links the institution to its most recent investigation in the `compliance_investigations` table. In the sample data, institution `1` (Adaptive Model) is linked to investigation `100`, institution `2` (Primary Cluster) to investigation `101`, and so on through institution `4` (Compact Initiative) linked to investigation `103`.

**Table `compliance_investigations`**

| id | investigation_id | initiation_date | status | issuing_authority | finding_severity | penalty_amount | financial_institution_id | compliance_investigation_id | deficiency_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 | pending | extended-issuing-33 | minor | 2,604 | 1 | 100 | 13910633 |
| 101 | 8843769 | 2022-05-20T18:14:00 | active | integrated-issuing-34 | moderate | 442.51 | 2 | 101 | 8387527 |
| 102 | 974942 | 2023-10-04T01:31:00 | completed | seasonal-issuing-35 | severe | 1,997 | 3 | 102 | 9474 |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 | sanctioned | regional-issuing-36 | systemic | 3,813 | 4 | 103 | client-focus |

The `compliance_investigations` table records each formal regulatory inquiry. Its primary key `id` is an integer (e.g., `100`, `101`, `102`, `103`), while `investigation_id` carries a secondary identifier that can be a UUID-like string such as `ChIJCbVGx_tt5kcRJYrXOupoDgA` or a shorter code like `8843769`. The `initiation_date` column stores ISO-8601 timestamps (e.g., `2025-12-09T11:57:00`), and `status` enumerates the lifecycle stage: `pending`, `active`, `completed`, or `sanctioned`. The `issuing_authority` column names the regulatory body (e.g., `extended-issuing-33`), while `finding_severity` classifies the gravity of the findings as `minor`, `moderate`, `severe`, or `systemic`. The `penalty_amount` column holds decimal values ranging from `442.51` to `3,813`. Two foreign keys anchor this table: `financial_institution_id` references the `financial_institutions` table, and `compliance_investigation_id` is a self-referential pointer that models investigation-to-investigation relationships (such as follow-up probes). The `deficiency_id` column links the investigation to a specific `compliance_deficiency` record. In the data, investigation `100` is tied to financial institution `1`, has severity `minor`, a penalty of `2,604`, and deficiency `13910633`.

**Table `compliance_deficiencies`**

| deficiency_id | category | description | discovery_date | remediation_status | compliance_investigation_id | banking_division_id | client_id |
|---|---|---|---|---|---|---|---|
| 13910633 | risk_management | Extended Survey | 2024-03-23 | open | 100 | 1 | Erin Olson |
| 8387527 | monitoring | Pilot Corridor A | 2025-08-07 | in_progress | 101 | 2 | Jorge Sullivan |
| 9474 | reporting | Baseline Series | 2022-01-18 | closed | 102 | 3 | Kimberly Maynard |
| client-focus | resource_allocation | Distributed Assessment | 2023-06-02 | open | 103 | 4 | Michelle Kelley |

The `compliance_deficiencies` table captures the concrete regulatory failures uncovered during investigations. Its primary key `deficiency_id` is a string (e.g., `13910633`, `8387527`, `9474`, `client-focus`), and the `category` column classifies the deficiency type: `risk_management`, `monitoring`, `reporting`, or `resource_allocation`. The `description` column provides a human-readable label such as `Extended Survey` or `Pilot Corridor A`. The `discovery_date` records when the deficiency was identified, and `remediation_status` tracks progress through `open`, `in_progress`, or `closed`. Three foreign keys connect this table to the rest of the model: `compliance_investigation_id` points back to `compliance_investigations`, `banking_division_id` links the deficiency to a specific `banking_divisions` row, and `client_id` references the `high_risk_clients` table. Deficiency `13910633` (category `risk_management`, status `open`) is associated with investigation `100`, banking division `1`, and client `Erin Olson`.

**Table `banking_divisions`**

| id | division_code | division_name | oversight_level | compliance_officer_id | financial_institution_id | client_id | deficiency_id |
|---|---|---|---|---|---|---|---|
| 1 | 103191 | Composite Protocol | standard | c8a7d91b-e587-45b4-bae6-0c0a51b6241b | 1 | Erin Olson | 13910633 |
| 2 | 113 | Compact Programme A | enhanced | 9246325 | 2 | Jorge Sullivan | 8387527 |
| 3 | 1250220 | Legacy Standard | lax | 195343 | 3 | Kimberly Maynard | 9474 |
| 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | standard | 7441148 | 4 | Michelle Kelley | client-focus |

The `banking_divisions` table models the organisational units within financial institutions that are subject to oversight. Its primary key `id` is an integer (e.g., `1`, `2`, `3`, `4`), and `division_code` stores a numeric or UUID-style code such as `103191` or `5f923cfa-8fcd-11eb-924d-9cd76263cbd0`. The `division_name` column carries labels like `Composite Protocol` and `Compact Programme A`. The `oversight_level` column classifies the intensity of regulatory scrutiny as `standard`, `enhanced`, or `lax`. The `compliance_officer_id` column stores an identifier for the responsible officer (e.g., `c8a7d91b-e587-45b4-bae6-0c0a51b6241b`). Three foreign keys sit on this table: `financial_institution_id` links the division to its parent `financial_institutions` row, `client_id` references a `high_risk_clients` record, and `deficiency_id` points to a `compliance_deficiencies` entry. Division `1` (Composite Protocol, oversight `standard`) belongs to financial institution `1`, is associated with client `Erin Olson`, and maps to deficiency `13910633`.

**Table `high_risk_clients`**

| client_id | client_type | risk_rating | jurisdiction | relationship_status | financial_institution_id | banking_division_id | suspicious_activity_report_sar_id |
|---|---|---|---|---|---|---|---|
| Erin Olson | politically_exposed_person | 15 | regional-jurisdic-30 | active | 1 | 1 | 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 |
| Jorge Sullivan | business_entity | 22 | legacy-jurisdic-31 | closed | 2 | 2 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 |
| Kimberly Maynard | foreign_government | 29 | compact-jurisdic-32 | flagged | 3 | 3 | 7441159 |
| Michelle Kelley | politically_exposed_person | 36 | composite-jurisdic-33 | active | 4 | 4 | 2106716 |

The `high_risk_clients` table stores the individuals and entities that trigger heightened regulatory attention. Its primary key `client_id` is a string name (e.g., `Erin Olson`, `Jorge Sullivan`, `Kimberly Maynard`, `Michelle Kelley`). The `client_type` column classifies the entity as `politically_exposed_person`, `business_entity`, or `foreign_government`. The `risk_rating` column holds an integer score (e.g., `15`, `22`, `29`, `36`), and `jurisdiction` stores a location code such as `regional-jurisdic-30`. The `relationship_status` column indicates the current engagement state: `active`, `closed`, or `flagged`. Three foreign keys connect this table outward: `financial_institution_id` references the `financial_institutions` table, `banking_division_id` links to `banking_divisions`, and `suspicious_activity_report_sar_id` points to a `suspicious_activity_reports` record. Client `Erin Olson` is a `politically_exposed_person` with risk rating `15`, jurisdiction `regional-jurisdic-30`, status `active`, linked to financial institution `1`, banking division `1`, and SAR `5fd7eb48-8fcc-11eb-924d-9cd76263cbd0`.

**Table `suspicious_activity_reports`**

| sar_id | filing_date | status | triggering_transaction_id | flagging_specialist_id | client_id | banking_division_id | deficiency_id |
|---|---|---|---|---|---|---|---|
| 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed | gd_acc_260002 | state_uk_25 | Erin Olson | 1 | 13910633 |
| b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected | ain | 3355771 | Jorge Sullivan | 2 | 8387527 |
| 7441159 | 2025-12-04T03:49:00 | suppressed | 194ce604-8fba-11eb-924d-9cd76263cbd0 | gd_acc_760000 | Kimberly Maynard | 3 | 9474 |
| 2106716 | 2022-05-15T10:06:00 | pending_review | 505996 | 3158158 | Michelle Kelley | 4 | client-focus |

The `suspicious_activity_reports` table records the formal filings that document suspicious behaviour. Its primary key `sar_id` is a string (e.g., `5fd7eb48-8fcc-11eb-924d-9cd76263cbd0`, `b75be5bc-8fcd-11eb-924d-9cd76263cbd0`). The `filing_date` column stores an ISO-8601 timestamp (e.g., `2023-02-09T13:15:00`), and `status` enumerates the filing state: `filed`, `rejected`, `suppressed`, or `pending_review`. The `triggering_transaction_id` column identifies the transaction that prompted the report (e.g., `gd_acc_260002`), and `flagging_specialist_id` names the analyst (e.g., `state_uk_25`). Three foreign keys anchor this table: `client_id` references `high_risk_clients`, `banking_division_id` links to `banking_divisions`, and `deficiency_id` points to `compliance_deficiencies`. SAR `5fd7eb48-8fcc-11eb-924d-9cd76263cbd0` was filed on `2023-02-09T13:15:00` with status `filed`, triggered by transaction `gd_acc_260002`, flagged by specialist `state_uk_25`, and is associated with client `Erin Olson`, banking division `1`, and deficiency `13910633`.

### Foreign-Key Topology

The foreign-key graph forms a clear hierarchy. The `financial_institutions` table sits at the root, with `compliance_investigations` as its direct child via `compliance_investigations.financial_institution_id`. From `compliance_investigations`, the graph branches to `compliance_deficiencies` via `compliance_investigations.deficiency_id`. The `compliance_deficiencies` table then fans out to `banking_divisions` (via `compliance_deficiencies.banking_division_id`) and `high_risk_clients` (via `compliance_deficiencies.client_id`). The `banking_divisions` table also references `financial_institutions` directly, creating a cross-link that allows division-level queries to resolve the parent institution without traversing through deficiencies. The `high_risk_clients` table references both `financial_institutions` and `banking_divisions`, and the `suspicious_activity_reports` table references `high_risk_clients`, `banking_divisions`, and `compliance_deficiencies`, forming the outermost ring of the graph. This topology ensures that any domain fact — for example, "which banking division is responsible for the deficiency uncovered in the investigation of financial institution 1?" — can be reconstructed by following a single path of foreign keys.

### View-Based Reconciliation

The twenty views materialise every pairwise join between the six base tables, allowing analysts to answer domain questions by selecting from a view rather than writing JOIN clauses. Each view is named `vw_<table_a>_<table_b>`, indicating that it joins table A to table B.

**View `vw_financial_institution_financial_institution`**

```sql
CREATE VIEW vw_financial_institution_financial_institution AS
SELECT a.financial_institution_id, a.institution_id, a.legal_name, a.headquarters_city, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM financial_institutions a JOIN financial_institutions b ON a.has_subsidiary_financial_institution_id = b.financial_institution_id;
```

| financial_institution_id | institution_id | legal_name | headquarters_city | institution_financial_institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Adaptive Model | seasonal-headquar-83 | 1 | 9424913 | Adaptive Model |
| 2 | 8189481 | Primary Cluster | regional-headquar-84 | 2 | 8189481 | Primary Cluster |
| 3 | 1437604 | Composite Review D | legacy-headquar-85 | 3 | 1437604 | Composite Review D |
| 4 | 884346 | Compact Initiative | compact-headquar-86 | 4 | 884346 | Compact Initiative |

The view `vw_financial_institution_financial_institution` performs a self-join on `financial_institutions`, typically to resolve the parent-subsidiary relationship encoded in `has_subsidiary_financial_institution_id`. A row from this view would pair institution `1` (Adaptive Model) with its subsidiary (if any), or with itself when no subsidiary exists. This view answers the question: "which financial institution is the parent of which other financial institution?"

**View `vw_financial_institution_compliance_investigation`**

```sql
CREATE VIEW vw_financial_institution_compliance_investigation AS
SELECT a.financial_institution_id, a.institution_id, a.legal_name, a.headquarters_city, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.initiation_date AS investigation_initiation_date
FROM financial_institutions a JOIN compliance_investigations b ON a.compliance_investigation_id = b.id;
```

| financial_institution_id | institution_id | legal_name | headquarters_city | investigation_id | investigation_investigation_id | investigation_initiation_date |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Adaptive Model | seasonal-headquar-83 | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 |
| 2 | 8189481 | Primary Cluster | regional-headquar-84 | 101 | 8843769 | 2022-05-20T18:14:00 |
| 3 | 1437604 | Composite Review D | legacy-headquar-85 | 102 | 974942 | 2023-10-04T01:31:00 |
| 4 | 884346 | Compact Initiative | compact-headquar-86 | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 |

The view `vw_financial_institution_compliance_investigation` joins `financial_institutions` to `compliance_investigations` on `financial_institutions.compliance_investigation_id = compliance_investigations.id`. A row from this view pairs institution `1` (Adaptive Model, headquartered in `seasonal-headquar-83`, charter `state-chartered`) with investigation `100` (status `pending`, severity `minor`, penalty `2,604`, issued by `extended-issuing-33`). This view answers: "what investigation is associated with each financial institution?"

**View `vw_compliance_investigation_financial_institution`**

```sql
CREATE VIEW vw_compliance_investigation_financial_institution AS
SELECT a.id, a.investigation_id, a.initiation_date, a.status, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM compliance_investigations a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| id | investigation_id | initiation_date | status | institution_financial_institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 | pending | 1 | 9424913 | Adaptive Model |
| 101 | 8843769 | 2022-05-20T18:14:00 | active | 2 | 8189481 | Primary Cluster |
| 102 | 974942 | 2023-10-04T01:31:00 | completed | 3 | 1437604 | Composite Review D |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 | sanctioned | 4 | 884346 | Compact Initiative |

The view `vw_compliance_investigation_financial_institution` is the reverse join: `compliance_investigations` to `financial_institutions`. A row pairs investigation `101` (status `active`, severity `moderate`, penalty `442.51`) with financial institution `2` (Primary Cluster, charter `federal`, regulatory status `sanctioned`). This view answers: "which financial institution is the subject of each compliance investigation?"

**View `vw_compliance_investigation_compliance_investigation`**

```sql
CREATE VIEW vw_compliance_investigation_compliance_investigation AS
SELECT a.id, a.investigation_id, a.initiation_date, a.status, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.initiation_date AS investigation_initiation_date
FROM compliance_investigations a JOIN compliance_investigations b ON a.compliance_investigation_id = b.id;
```

| id | investigation_id | initiation_date | status | investigation_id | investigation_investigation_id | investigation_initiation_date |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 | pending | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 |
| 101 | 8843769 | 2022-05-20T18:14:00 | active | 101 | 8843769 | 2022-05-20T18:14:00 |
| 102 | 974942 | 2023-10-04T01:31:00 | completed | 102 | 974942 | 2023-10-04T01:31:00 |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 | sanctioned | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 |

The view `vw_compliance_investigation_compliance_investigation` performs a self-join on `compliance_investigations`, resolving the `compliance_investigation_id` self-reference. A row might pair investigation `100` with a follow-up investigation (if one exists), or with itself when no follow-up is recorded. This view answers: "which investigation is a follow-up to which other investigation?"

**View `vw_compliance_investigation_compliance_deficiency`**

```sql
CREATE VIEW vw_compliance_investigation_compliance_deficiency AS
SELECT a.id, a.investigation_id, a.initiation_date, a.status, b.deficiency_id AS deficiency_deficiency_id, b.category AS deficiency_category, b.description AS deficiency_description
FROM compliance_investigations a JOIN compliance_deficiencies b ON a.deficiency_id = b.deficiency_id;
```

| id | investigation_id | initiation_date | status | deficiency_deficiency_id | deficiency_category | deficiency_description |
|---|---|---|---|---|---|---|
| 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 | pending | 13910633 | risk_management | Extended Survey |
| 101 | 8843769 | 2022-05-20T18:14:00 | active | 8387527 | monitoring | Pilot Corridor A |
| 102 | 974942 | 2023-10-04T01:31:00 | completed | 9474 | reporting | Baseline Series |
| 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 | sanctioned | client-focus | resource_allocation | Distributed Assessment |

The view `vw_compliance_investigation_compliance_deficiency` joins `compliance_investigations` to `compliance_deficiencies` on `compliance_investigations.deficiency_id = compliance_deficiencies.deficiency_id`. A row pairs investigation `102` (status `completed`, severity `severe`, penalty `1,997`) with deficiency `9474` (category `reporting`, description `Baseline Series`, discovery `2022-01-18`, remediation `closed`). This view answers: "what deficiency was uncovered in each compliance investigation?"

**View `vw_compliance_deficiency_compliance_investigation`**

```sql
CREATE VIEW vw_compliance_deficiency_compliance_investigation AS
SELECT a.deficiency_id, a.category, a.description, a.discovery_date, b.id AS investigation_id, b.investigation_id AS investigation_investigation_id, b.initiation_date AS investigation_initiation_date
FROM compliance_deficiencies a JOIN compliance_investigations b ON a.compliance_investigation_id = b.id;
```

| deficiency_id | category | description | discovery_date | investigation_id | investigation_investigation_id | investigation_initiation_date |
|---|---|---|---|---|---|---|
| 13910633 | risk_management | Extended Survey | 2024-03-23 | 100 | ChIJCbVGx_tt5kcRJYrXOupoDgA | 2025-12-09T11:57:00 |
| 8387527 | monitoring | Pilot Corridor A | 2025-08-07 | 101 | 8843769 | 2022-05-20T18:14:00 |
| 9474 | reporting | Baseline Series | 2022-01-18 | 102 | 974942 | 2023-10-04T01:31:00 |
| client-focus | resource_allocation | Distributed Assessment | 2023-06-02 | 103 | 8599e66e-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-03-15T08:48:00 |

The view `vw_compliance_deficiency_compliance_investigation` is the reverse join: `compliance_deficiencies` to `compliance_investigations`. A row pairs deficiency `8387527` (category `monitoring`, description `Pilot Corridor A`, status `in_progress`) with investigation `101` (status `active`, severity `moderate`). This view answers: "which investigation uncovered each compliance deficiency?"

**View `vw_compliance_deficiency_banking_division`**

```sql
CREATE VIEW vw_compliance_deficiency_banking_division AS
SELECT a.deficiency_id, a.category, a.description, a.discovery_date, b.id AS division_id, b.division_code AS division_division_code, b.division_name AS division_division_name
FROM compliance_deficiencies a JOIN banking_divisions b ON a.banking_division_id = b.id;
```

| deficiency_id | category | description | discovery_date | division_id | division_division_code | division_division_name |
|---|---|---|---|---|---|---|
| 13910633 | risk_management | Extended Survey | 2024-03-23 | 1 | 103191 | Composite Protocol |
| 8387527 | monitoring | Pilot Corridor A | 2025-08-07 | 2 | 113 | Compact Programme A |
| 9474 | reporting | Baseline Series | 2022-01-18 | 3 | 1250220 | Legacy Standard |
| client-focus | resource_allocation | Distributed Assessment | 2023-06-02 | 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework |

The view `vw_compliance_deficiency_banking_division` joins `compliance_deficiencies` to `banking_divisions` on `compliance_deficiencies.banking_division_id = banking_divisions.id`. A row pairs deficiency `13910633` (category `risk_management`, description `Extended Survey`, remediation `open`) with banking division `1` (code `103191`, name `Composite Protocol`, oversight `standard`). This view answers: "which banking division is responsible for each compliance deficiency?"

**View `vw_compliance_deficiency_high_risk_client`**

```sql
CREATE VIEW vw_compliance_deficiency_high_risk_client AS
SELECT a.deficiency_id, a.category, a.description, a.discovery_date, b.client_id AS client_client_id, b.client_type AS client_client_type, b.risk_rating AS client_risk_rating
FROM compliance_deficiencies a JOIN high_risk_clients b ON a.client_id = b.client_id;
```

| deficiency_id | category | description | discovery_date | client_client_id | client_client_type | client_risk_rating |
|---|---|---|---|---|---|---|
| 13910633 | risk_management | Extended Survey | 2024-03-23 | Erin Olson | politically_exposed_person | 15 |
| 8387527 | monitoring | Pilot Corridor A | 2025-08-07 | Jorge Sullivan | business_entity | 22 |
| 9474 | reporting | Baseline Series | 2022-01-18 | Kimberly Maynard | foreign_government | 29 |
| client-focus | resource_allocation | Distributed Assessment | 2023-06-02 | Michelle Kelley | politically_exposed_person | 36 |

The view `vw_compliance_deficiency_high_risk_client` joins `compliance_deficiencies` to `high_risk_clients` on `compliance_deficiencies.client_id = high_risk_clients.client_id`. A row pairs deficiency `9474` (category `reporting`, description `Baseline Series`) with client `Kimberly Maynard` (type `foreign_government`, risk rating `29`, jurisdiction `compact-jurisdic-32`, status `flagged`). This view answers: "which high-risk client is associated with each compliance deficiency?"

**View `vw_banking_division_financial_institution`**

```sql
CREATE VIEW vw_banking_division_financial_institution AS
SELECT a.id, a.division_code, a.division_name, a.oversight_level, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM banking_divisions a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| id | division_code | division_name | oversight_level | institution_financial_institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 1 | 103191 | Composite Protocol | standard | 1 | 9424913 | Adaptive Model |
| 2 | 113 | Compact Programme A | enhanced | 2 | 8189481 | Primary Cluster |
| 3 | 1250220 | Legacy Standard | lax | 3 | 1437604 | Composite Review D |
| 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | standard | 4 | 884346 | Compact Initiative |

The view `vw_banking_division_financial_institution` joins `banking_divisions` to `financial_institutions` on `banking_divisions.financial_institution_id = financial_institutions.financial_institution_id`. A row pairs banking division `2` (code `113`, name `Compact Programme A`, oversight `enhanced`) with financial institution `2` (Primary Cluster, charter `federal`, fed member `true`). This view answers: "which financial institution does each banking division belong to?"

**View `vw_banking_division_high_risk_client`**

```sql
CREATE VIEW vw_banking_division_high_risk_client AS
SELECT a.id, a.division_code, a.division_name, a.oversight_level, b.client_id AS client_client_id, b.client_type AS client_client_type, b.risk_rating AS client_risk_rating
FROM banking_divisions a JOIN high_risk_clients b ON a.client_id = b.client_id;
```

| id | division_code | division_name | oversight_level | client_client_id | client_client_type | client_risk_rating |
|---|---|---|---|---|---|---|
| 1 | 103191 | Composite Protocol | standard | Erin Olson | politically_exposed_person | 15 |
| 2 | 113 | Compact Programme A | enhanced | Jorge Sullivan | business_entity | 22 |
| 3 | 1250220 | Legacy Standard | lax | Kimberly Maynard | foreign_government | 29 |
| 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | standard | Michelle Kelley | politically_exposed_person | 36 |

The view `vw_banking_division_high_risk_client` joins `banking_divisions` to `high_risk_clients` on `banking_divisions.client_id = high_risk_clients.client_id`. A row pairs banking division `3` (code `1250220`, name `Legacy Standard`, oversight `lax`) with client `Kimberly Maynard` (type `foreign_government`, risk rating `29`). This view answers: "which high-risk client is assigned to each banking division?"

**View `vw_banking_division_compliance_deficiency`**

```sql
CREATE VIEW vw_banking_division_compliance_deficiency AS
SELECT a.id, a.division_code, a.division_name, a.oversight_level, b.deficiency_id AS deficiency_deficiency_id, b.category AS deficiency_category, b.description AS deficiency_description
FROM banking_divisions a JOIN compliance_deficiencies b ON a.deficiency_id = b.deficiency_id;
```

| id | division_code | division_name | oversight_level | deficiency_deficiency_id | deficiency_category | deficiency_description |
|---|---|---|---|---|---|---|
| 1 | 103191 | Composite Protocol | standard | 13910633 | risk_management | Extended Survey |
| 2 | 113 | Compact Programme A | enhanced | 8387527 | monitoring | Pilot Corridor A |
| 3 | 1250220 | Legacy Standard | lax | 9474 | reporting | Baseline Series |
| 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework | standard | client-focus | resource_allocation | Distributed Assessment |

The view `vw_banking_division_compliance_deficiency` joins `banking_divisions` to `compliance_deficiencies` on `banking_divisions.deficiency_id = compliance_deficiencies.deficiency_id`. A row pairs banking division `4` (code `5f923cfa-8fcd-11eb-924d-9cd76263cbd0`, name `Regional Framework`, oversight `standard`) with deficiency `client-focus` (category `resource_allocation`, description `Distributed Assessment`, remediation `open`). This view answers: "which compliance deficiency is managed by each banking division?"

**View `vw_high_risk_client_financial_institution`**

```sql
CREATE VIEW vw_high_risk_client_financial_institution AS
SELECT a.client_id, a.client_type, a.risk_rating, a.jurisdiction, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM high_risk_clients a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| client_id | client_type | risk_rating | jurisdiction | institution_financial_institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| Erin Olson | politically_exposed_person | 15 | regional-jurisdic-30 | 1 | 9424913 | Adaptive Model |
| Jorge Sullivan | business_entity | 22 | legacy-jurisdic-31 | 2 | 8189481 | Primary Cluster |
| Kimberly Maynard | foreign_government | 29 | compact-jurisdic-32 | 3 | 1437604 | Composite Review D |
| Michelle Kelley | politically_exposed_person | 36 | composite-jurisdic-33 | 4 | 884346 | Compact Initiative |

The view `vw_high_risk_client_financial_institution` joins `high_risk_clients` to `financial_institutions` on `high_risk_clients.financial_institution_id = financial_institutions.financial_institution_id`. A row pairs client `Michelle Kelley` (type `politically_exposed_person`, risk rating `36`, jurisdiction `composite-jurisdic-33`, status `active`) with financial institution `4` (Compact Initiative, charter `state-chartered`, regulatory status `active`). This view answers: "which financial institution does each high-risk client belong to?"

**View `vw_high_risk_client_banking_division`**

```sql
CREATE VIEW vw_high_risk_client_banking_division AS
SELECT a.client_id, a.client_type, a.risk_rating, a.jurisdiction, b.id AS division_id, b.division_code AS division_division_code, b.division_name AS division_division_name
FROM high_risk_clients a JOIN banking_divisions b ON a.banking_division_id = b.id;
```

| client_id | client_type | risk_rating | jurisdiction | division_id | division_division_code | division_division_name |
|---|---|---|---|---|---|---|
| Erin Olson | politically_exposed_person | 15 | regional-jurisdic-30 | 1 | 103191 | Composite Protocol |
| Jorge Sullivan | business_entity | 22 | legacy-jurisdic-31 | 2 | 113 | Compact Programme A |
| Kimberly Maynard | foreign_government | 29 | compact-jurisdic-32 | 3 | 1250220 | Legacy Standard |
| Michelle Kelley | politically_exposed_person | 36 | composite-jurisdic-33 | 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework |

The view `vw_high_risk_client_banking_division` joins `high_risk_clients` to `banking_divisions` on `high_risk_clients.banking_division_id = banking_divisions.id`. A row pairs client `Jorge Sullivan` (type `business_entity`, risk rating `22`, jurisdiction `legacy-jurisdic-31`, status `closed`) with banking division `2` (code `113`, name `Compact Programme A`, oversight `enhanced`). This view answers: "which banking division is assigned to each high-risk client?"

**View `vw_high_risk_client_suspicious_activity_report`**

```sql
CREATE VIEW vw_high_risk_client_suspicious_activity_report AS
SELECT a.client_id, a.client_type, a.risk_rating, a.jurisdiction, b.sar_id AS report_sar_id, b.filing_date AS report_filing_date, b.status AS report_status
FROM high_risk_clients a JOIN suspicious_activity_reports b ON a.suspicious_activity_report_sar_id = b.sar_id;
```

| client_id | client_type | risk_rating | jurisdiction | report_sar_id | report_filing_date | report_status |
|---|---|---|---|---|---|---|
| Erin Olson | politically_exposed_person | 15 | regional-jurisdic-30 | 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed |
| Jorge Sullivan | business_entity | 22 | legacy-jurisdic-31 | b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected |
| Kimberly Maynard | foreign_government | 29 | compact-jurisdic-32 | 7441159 | 2025-12-04T03:49:00 | suppressed |
| Michelle Kelley | politically_exposed_person | 36 | composite-jurisdic-33 | 2106716 | 2022-05-15T10:06:00 | pending_review |

The view `vw_high_risk_client_suspicious_activity_report` joins `high_risk_clients` to `suspicious_activity_reports` on `high_risk_clients.suspicious_activity_report_sar_id = suspicious_activity_reports.sar_id`. A row pairs client `Erin Olson` (type `politically_exposed_person`, risk rating `15`) with SAR `5fd7eb48-8fcc-11eb-924d-9cd76263cbd0` (filing date `2023-02-09T13:15:00`, status `filed`, triggered by `gd_acc_260002`). This view answers: "which suspicious activity report is associated with each high-risk client?"

**View `vw_suspicious_activity_report_high_risk_client`**

```sql
CREATE VIEW vw_suspicious_activity_report_high_risk_client AS
SELECT a.sar_id, a.filing_date, a.status, a.triggering_transaction_id, b.client_id AS client_client_id, b.client_type AS client_client_type, b.risk_rating AS client_risk_rating
FROM suspicious_activity_reports a JOIN high_risk_clients b ON a.client_id = b.client_id;
```

| sar_id | filing_date | status | triggering_transaction_id | client_client_id | client_client_type | client_risk_rating |
|---|---|---|---|---|---|---|
| 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed | gd_acc_260002 | Erin Olson | politically_exposed_person | 15 |
| b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected | ain | Jorge Sullivan | business_entity | 22 |
| 7441159 | 2025-12-04T03:49:00 | suppressed | 194ce604-8fba-11eb-924d-9cd76263cbd0 | Kimberly Maynard | foreign_government | 29 |
| 2106716 | 2022-05-15T10:06:00 | pending_review | 505996 | Michelle Kelley | politically_exposed_person | 36 |

The view `vw_suspicious_activity_report_high_risk_client` is the reverse join: `suspicious_activity_reports` to `high_risk_clients`. A row pairs SAR `b75be5bc-8fcd-11eb-924d-9cd76263cbd0` (filing date `2024-07-20T20:32:00`, status `rejected`, triggered by `ain`) with client `Jorge Sullivan` (type `business_entity`, risk rating `22`). This view answers: "which high-risk client triggered each suspicious activity report?"

**View `vw_suspicious_activity_report_banking_division`**

```sql
CREATE VIEW vw_suspicious_activity_report_banking_division AS
SELECT a.sar_id, a.filing_date, a.status, a.triggering_transaction_id, b.id AS division_id, b.division_code AS division_division_code, b.division_name AS division_division_name
FROM suspicious_activity_reports a JOIN banking_divisions b ON a.banking_division_id = b.id;
```

| sar_id | filing_date | status | triggering_transaction_id | division_id | division_division_code | division_division_name |
|---|---|---|---|---|---|---|
| 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed | gd_acc_260002 | 1 | 103191 | Composite Protocol |
| b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected | ain | 2 | 113 | Compact Programme A |
| 7441159 | 2025-12-04T03:49:00 | suppressed | 194ce604-8fba-11eb-924d-9cd76263cbd0 | 3 | 1250220 | Legacy Standard |
| 2106716 | 2022-05-15T10:06:00 | pending_review | 505996 | 4 | 5f923cfa-8fcd-11eb-924d-9cd76263cbd0 | Regional Framework |

The view `vw_suspicious_activity_report_banking_division` joins `suspicious_activity_reports` to `banking_divisions` on `suspicious_activity_reports.banking_division_id = banking_divisions.id`. A row pairs SAR `7441159` (filing date `2025-12-04T03:49:00`, status `suppressed`, triggered by `194ce604-8fba-11eb-924d-9cd76263cbd0`) with banking division `3` (code `1250220`, name `Legacy Standard`, oversight `lax`). This view answers: "which banking division is responsible for each suspicious activity report?"

**View `vw_suspicious_activity_report_compliance_deficiency`**

```sql
CREATE VIEW vw_suspicious_activity_report_compliance_deficiency AS
SELECT a.sar_id, a.filing_date, a.status, a.triggering_transaction_id, b.deficiency_id AS deficiency_deficiency_id, b.category AS deficiency_category, b.description AS deficiency_description
FROM suspicious_activity_reports a JOIN compliance_deficiencies b ON a.deficiency_id = b.deficiency_id;
```

| sar_id | filing_date | status | triggering_transaction_id | deficiency_deficiency_id | deficiency_category | deficiency_description |
|---|---|---|---|---|---|---|
| 5fd7eb48-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-09T13:15:00 | filed | gd_acc_260002 | 13910633 | risk_management | Extended Survey |
| b75be5bc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-20T20:32:00 | rejected | ain | 8387527 | monitoring | Pilot Corridor A |
| 7441159 | 2025-12-04T03:49:00 | suppressed | 194ce604-8fba-11eb-924d-9cd76263cbd0 | 9474 | reporting | Baseline Series |
| 2106716 | 2022-05-15T10:06:00 | pending_review | 505996 | client-focus | resource_allocation | Distributed Assessment |

The view `vw_suspicious_activity_report_compliance_deficiency` joins `suspicious_activity_reports` to `compliance_deficiencies` on `suspicious_activity_reports.deficiency_id = compliance_deficiencies.deficiency_id`. A row pairs SAR `2106716` (filing date `2022-05-15T10:06:00`, status `pending_review`, triggered by `505996`) with deficiency `client-focus` (category `resource_allocation`, description `Distributed Assessment`, remediation `open`). This view answers: "which compliance deficiency is linked to each suspicious activity report?"

### Synthesis

The relational schema for the financial compliance domain achieves a clean separation of concerns: `financial_institutions` captures the legal entities, `compliance_investigations` records the regulatory actions taken against them, `compliance_deficiencies` enumerates the specific failures found, `banking_divisions` models the organisational units responsible for remediation, `high_risk_clients` stores the individuals and entities of heightened concern, and `suspicious_activity_reports` documents the formal filings triggered by suspicious behaviour. The foreign-key graph flows from institutions to investigations to deficiencies to divisions and clients, with cross-links from divisions back to institutions and from suspicious activity reports to all three of their parent tables. The twenty views materialise every pairwise join, ensuring that any two-table domain fact — from "which investigation uncovered which deficiency" to "which banking division manages which high-risk client" — is available as a single queryable object. This design allows analysts to reconstruct the full narrative of regulatory scrutiny by chaining view results, while the normalised base tables prevent update anomalies and enforce referential integrity at the database level.