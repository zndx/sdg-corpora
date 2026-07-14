The governance of legislative instruments within a multi-jurisdictional framework requires a data model that captures not only the static properties of acts and bodies but also the dynamic relationships between them—amendments, certifications, and the temporal sequencing of enactment. The domain centres on four principal entity types: legislative acts, legislative bodies, statutory amendments, and government officials. Each entity is normalised into its own base table, with foreign keys encoding the cardinality-bounded relationships that bind them together. The resulting schema supports a family of derived views that reconstruct domain facts by joining these tables, allowing analysts to query the legislative lifecycle from multiple perspectives without denormalising the source data.

## The Legislative Act Entity

At the core of the model lies the `legislative_acts` table, which records each legislative instrument as a row with a unique act number, a short title, and two temporal anchors: the enactment date and the assent date. The jurisdiction column classifies the act under a named jurisdictional regime, while the status column tracks its current lifecycle state—proposed, enacted, amended, or repealed. A self-referential column, `amends_act_number`, encodes the fact that an act may amend another act, creating a recursive relationship within the same table.

**Table `legislative_acts`**

| act_number | short_title | enactment_date | assent_date | jurisdiction | status | amends_act_number | legislative_body_id |
|---|---|---|---|---|---|---|---|
| ACT-2168 | Regional Initiative | 2022-01-04T12:24:00 | 2023-10-22 | regional-jurisdic-30 | proposed | ACT-2168 | 1000 |
| ACT-2172 | Seasonal Model D | 2023-06-15T19:41:00 | 2024-03-06 | legacy-jurisdic-31 | enacted | ACT-2172 | 1001 |
| ACT-2176 | Integrated Cluster | 2024-11-26T02:58:00 | 2025-08-17 | compact-jurisdic-32 | amended | ACT-2176 | 1002 |
| ACT-2180 | Extended Review | 2025-04-10T09:15:00 | 2022-01-01 | composite-jurisdic-33 | repealed | ACT-2180 | 1003 |

Consider the row for `ACT-2168`, titled "Regional Initiative". It was enacted on 2022-01-04 and received assent on 2023-10-22, falling under the jurisdiction `regional-jurisdic-30` with a status of `proposed`. Its `amends_act_number` points to itself (`ACT-2168`), indicating a self-amending or self-referential act. Similarly, `ACT-2172` ("Seasonal Model D") was enacted on 2023-06-15, assented on 2024-03-06, and carries the status `enacted` under `legacy-jurisdic-31`. The `amends_act_number` column is the foreign key that enables the self-join view `v_legislative_act_legislative_act`, which we examine later. The `legislative_body_id` column (values 1000 through 1003) is the primary foreign key linking acts to the legislative bodies that produced them.

## The Legislative Body Entity

The `legislative_bodies` table captures the organisational entities responsible for producing legislative acts. Each row carries a surrogate identifier (`id`), a human-readable `body_name`, the `jurisdiction_name` under which the body operates, a `session_year` indicating the legislative session, and a `status` that can be `active`, `dissolved`, or `reconstituted`. The `act_number` column stores the act associated with the body, providing a denormalised cross-reference that is redundant with the foreign key in `legislative_acts` but useful for direct lookup.

**Table `legislative_bodies`**

| id | body_name | jurisdiction_name | session_year | status | act_number |
|---|---|---|---|---|---|
| 1000 | Regional Corridor | Pilot Cluster | 6 | active | ACT-2168 |
| 1001 | Seasonal Series D | Baseline Review | 9 | dissolved | ACT-2172 |
| 1002 | Integrated Assessment | Distributed Initiative A | 12 | reconstituted | ACT-2176 |
| 1003 | Extended Survey | Adaptive Model | 15 | active | ACT-2180 |

The body with `id` 1000 is named "Regional Corridor" and operates under the jurisdiction "Pilot Cluster" during session year 6 with status `active`. It is associated with act `ACT-2168`. Body 1001, "Seasonal Series D", belongs to "Baseline Review" (session year 9, status `dissolved`) and is linked to `ACT-2172`. Body 1002, "Integrated Assessment", sits within "Distributed Initiative A" (session year 12, status `reconstituted`) and corresponds to `ACT-2176`. Body 1003, "Extended Survey", operates under "Adaptive Model" (session year 15, status `active`) and is tied to `ACT-2180`. The `id` column serves as the primary key referenced by `legislative_acts.legislative_body_id`, `statutory_amendments.legislative_body_id`, and `government_officials.legislative_body_id`, making it the central hub of the relational schema.

## Statutory Amendments

Statutory amendments record the granular modifications applied to legislative acts. The `statutory_amendments` table is the most structurally rich of the four base tables, with columns for a surrogate `statutory_amendment_id`, an `amendment_id`, the `target_section` and `target_clause` being modified, the `original_value` and `substituted_value` of the change, an `amendment_type` (substitution, insertion, deletion, or repeal), and the foreign keys `act_number` and `legislative_body_id` that anchor the amendment to its parent act and the body responsible. Timestamps `created_at` and `updated_at` provide an audit trail.

**Table `statutory_amendments`**

| statutory_amendment_id | amendment_id | target_section | target_clause | original_value | substituted_value | amendment_type | act_number | legislative_body_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 605961 | regional-target-36 | compact-target-44 | compact-original-14 | distributed-substitu-48 | substitution | ACT-2168 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 338542 | legacy-target-37 | composite-target-45 | composite-original-15 | baseline-substitu-49 | insertion | ACT-2172 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 9246331 | compact-target-38 | primary-target-46 | primary-original-16 | pilot-substitu-50 | deletion | ACT-2176 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 4447007 | composite-target-39 | adaptive-target-47 | adaptive-original-17 | extended-substitu-51 | repeal | ACT-2180 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The first amendment, with `statutory_amendment_id` 1 and `amendment_id` 605961, targets section `regional-target-36` and clause `compact-target-44` of act `ACT-2168`. It performs a `substitution`, replacing `compact-original-14` with `distributed-substitu-48`. It was created on 2025-01-01 and updated on 2025-01-02, under legislative body 1000. The second amendment (`statutory_amendment_id` 2, `amendment_id` 338542) targets `legacy-target-37` and `composite-target-45` of `ACT-2172`, performing an `insertion` that replaces `composite-original-15` with `baseline-substitu-49`. The third (`statutory_amendment_id` 3, `amendment_id` 9246331) targets `compact-target-38` and `primary-target-46` of `ACT-2176`, executing a `deletion` that replaces `primary-original-16` with `pilot-substitu-50`. The fourth (`statutory_amendment_id` 4, `amendment_id` 4447007) targets `composite-target-39` and `adaptive-target-47` of `ACT-2180`, performing a `repeal` that replaces `adaptive-original-17` with `extended-substitu-51`. Each amendment row is linked to its act via `act_number` and to its body via `legislative_body_id`, enabling the two amendment-related views.

## Government Officials

The `government_officials` table records the individuals (or roles) certified in connection with legislative acts. Each row carries a surrogate `id`, an `official_name`, a `designation`, a `department`, a `certification_date`, a `status` (active, retired, or suspended), and the foreign keys `act_number` and `legislative_body_id` that tie the official to a specific act and body.

**Table `government_officials`**

| id | official_name | designation | department | certification_date | status | act_number | legislative_body_id |
|---|---|---|---|---|---|---|---|
| 1000 | Extended Review | pilot-designat-92 | adaptive-departme-89 | 2025-08-01 | active | ACT-2168 | 1000 |
| 1001 | Pilot Initiative A | extended-designat-93 | distributed-departme-90 | 2022-01-12 | retired | ACT-2172 | 1001 |
| 1002 | Baseline Model | integrated-designat-94 | baseline-departme-91 | 2023-06-23 | suspended | ACT-2176 | 1002 |
| 1003 | Distributed Cluster | seasonal-designat-95 | pilot-departme-92 | 2024-11-07 | active | ACT-2180 | 1003 |

Official 1000, named "Extended Review", holds the designation `pilot-designat-92` within department `adaptive-departme-89`, was certified on 2025-08-01, and has status `active`. This official is associated with act `ACT-2168` and body 1000. Official 1001, "Pilot Initiative A", carries designation `extended-designat-93` in department `distributed-departme-90`, was certified on 2022-01-12, and has status `retired`; linked to `ACT-2172` and body 1001. Official 1002, "Baseline Model", has designation `integrated-designat-94`, department `baseline-departme-91`, certification date 2023-06-23, status `suspended`, and is tied to `ACT-2176` and body 1002. Official 1003, "Distributed Cluster", holds designation `seasonal-designat-95`, department `pilot-departme-92`, certification date 2024-11-07, status `active`, and is linked to `ACT-2180` and body 1003. The `act_number` and `legislative_body_id` columns are the foreign keys that enable the two government-official-related views.

## Self-Referential Act Relationships

The view `v_legislative_act_legislative_act` answers the question: which act amends which other act? It performs a self-join on `legislative_acts`, matching `a.amends_act_number` to `b.act_number`, and projects the source act's number, title, enactment date, and assent date alongside the target act's number, title, and enactment date.

**View `v_legislative_act_legislative_act`**

```sql
CREATE VIEW v_legislative_act_legislative_act AS
SELECT a.act_number, a.short_title, a.enactment_date, a.assent_date, b.act_number AS act_act_number, b.short_title AS act_short_title, b.enactment_date AS act_enactment_date
FROM legislative_acts a JOIN legislative_acts b ON a.amends_act_number = b.act_number;
```

| act_number | short_title | enactment_date | assent_date | act_act_number | act_short_title | act_enactment_date |
|---|---|---|---|---|---|---|
| ACT-2168 | Regional Initiative | 2022-01-04T12:24:00 | 2023-10-22 | ACT-2168 | Regional Initiative | 2022-01-04T12:24:00 |
| ACT-2172 | Seasonal Model D | 2023-06-15T19:41:00 | 2024-03-06 | ACT-2172 | Seasonal Model D | 2023-06-15T19:41:00 |
| ACT-2176 | Integrated Cluster | 2024-11-26T02:58:00 | 2025-08-17 | ACT-2176 | Integrated Cluster | 2024-11-26T02:58:00 |
| ACT-2180 | Extended Review | 2025-04-10T09:15:00 | 2022-01-01 | ACT-2180 | Extended Review | 2025-04-10T09:15:00 |

Every row in this view shows a one-to-one self-reference: `ACT-2168` amends `ACT-2168`, `ACT-2172` amends `ACT-2172`, and so on. This reflects the data model's design where each act's `amends_act_number` column points to its own `act_number`, producing a reflexive relationship. In a production system, this column would typically point to a different act, creating a directed acyclic graph of amendment dependencies. The view's columns—`act_number`, `short_title`, `enactment_date`, `assent_date`, `act_act_number`, `act_short_title`, `act_enactment_date`—allow a query to trace the lineage of any act back to its predecessor.

## Act-to-Body Association

The view `v_legislative_act_legislative_body` answers the question: which legislative body produced which act, and under what jurisdiction? It joins `legislative_acts` to `legislative_bodies` on `a.legislative_body_id = b.id`, projecting the act's identifying and temporal columns alongside the body's surrogate key, name, and jurisdiction.

**View `v_legislative_act_legislative_body`**

```sql
CREATE VIEW v_legislative_act_legislative_body AS
SELECT a.act_number, a.short_title, a.enactment_date, a.assent_date, b.id AS body_id, b.body_name AS body_body_name, b.jurisdiction_name AS body_jurisdiction_name
FROM legislative_acts a JOIN legislative_bodies b ON a.legislative_body_id = b.id;
```

| act_number | short_title | enactment_date | assent_date | body_id | body_body_name | body_jurisdiction_name |
|---|---|---|---|---|---|---|
| ACT-2168 | Regional Initiative | 2022-01-04T12:24:00 | 2023-10-22 | 1000 | Regional Corridor | Pilot Cluster |
| ACT-2172 | Seasonal Model D | 2023-06-15T19:41:00 | 2024-03-06 | 1001 | Seasonal Series D | Baseline Review |
| ACT-2176 | Integrated Cluster | 2024-11-26T02:58:00 | 2025-08-17 | 1002 | Integrated Assessment | Distributed Initiative A |
| ACT-2180 | Extended Review | 2025-04-10T09:15:00 | 2022-01-01 | 1003 | Extended Survey | Adaptive Model |

The first row shows that act `ACT-2168` ("Regional Initiative"), enacted on 2022-01-04 and assented on 2023-10-22, was produced by body 1000 ("Regional Corridor") under the jurisdiction "Pilot Cluster". The second row links `ACT-2172` ("Seasonal Model D") to body 1001 ("Seasonal Series D") in "Baseline Review". The third row associates `ACT-2176` ("Integrated Cluster") with body 1002 ("Integrated Assessment") in "Distributed Initiative A". The fourth row ties `ACT-2180` ("Extended Review") to body 1003 ("Extended Survey") in "Adaptive Model". This view is the primary interface for answering jurisdictional and organisational queries about the legislative corpus.

## Body-to-Act Association

The view `v_legislative_body_legislative_act` is the inverse of the previous view: it answers the question, which acts were produced by a given legislative body? It joins `legislative_bodies` to `legislative_acts` on `b.id = a.legislative_body_id`, projecting the body's key and name alongside the act's identifying and temporal columns.

**View `v_legislative_body_legislative_act`**

```sql
CREATE VIEW v_legislative_body_legislative_act AS
SELECT a.id, a.body_name, a.jurisdiction_name, a.session_year, b.act_number AS act_act_number, b.short_title AS act_short_title, b.enactment_date AS act_enactment_date
FROM legislative_bodies a JOIN legislative_acts b ON a.act_number = b.act_number;
```

| id | body_name | jurisdiction_name | session_year | act_act_number | act_short_title | act_enactment_date |
|---|---|---|---|---|---|---|
| 1000 | Regional Corridor | Pilot Cluster | 6 | ACT-2168 | Regional Initiative | 2022-01-04T12:24:00 |
| 1001 | Seasonal Series D | Baseline Review | 9 | ACT-2172 | Seasonal Model D | 2023-06-15T19:41:00 |
| 1002 | Integrated Assessment | Distributed Initiative A | 12 | ACT-2176 | Integrated Cluster | 2024-11-26T02:58:00 |
| 1003 | Extended Survey | Adaptive Model | 15 | ACT-2180 | Extended Review | 2025-04-10T09:15:00 |

The first row shows body 1000 ("Regional Corridor") produced act `ACT-2168` ("Regional Initiative"), enacted on 2022-01-04 and assented on 2023-10-22. The second row shows body 1001 ("Seasonal Series D") produced `ACT-2172` ("Seasonal Model D"), enacted on 2023-06-15 and assented on 2024-03-06. The third row links body 1002 ("Integrated Assessment") to `ACT-2176` ("Integrated Cluster"), enacted on 2024-11-26 and assented on 2025-08-17. The fourth row connects body 1003 ("Extended Survey") to `ACT-2180` ("Extended Review"), enacted on 2025-04-10 and assented on 2022-01-01. This view is useful for organisational reporting, where the unit of analysis is the legislative body rather than the act.

## Amendment-to-Act Association

The view `v_statutory_amendment_legislative_act` answers the question: which statutory amendments were applied to which act? It joins `statutory_amendments` to `legislative_acts` on `a.act_number = b.act_number`, projecting the amendment's identifying columns, target details, values, and type alongside the act's number, title, enactment date, and assent date.

**View `v_statutory_amendment_legislative_act`**

```sql
CREATE VIEW v_statutory_amendment_legislative_act AS
SELECT a.statutory_amendment_id, a.amendment_id, a.target_section, a.target_clause, b.act_number AS act_act_number, b.short_title AS act_short_title, b.enactment_date AS act_enactment_date
FROM statutory_amendments a JOIN legislative_acts b ON a.act_number = b.act_number;
```

| statutory_amendment_id | amendment_id | target_section | target_clause | act_act_number | act_short_title | act_enactment_date |
|---|---|---|---|---|---|---|
| 1 | 605961 | regional-target-36 | compact-target-44 | ACT-2168 | Regional Initiative | 2022-01-04T12:24:00 |
| 2 | 338542 | legacy-target-37 | composite-target-45 | ACT-2172 | Seasonal Model D | 2023-06-15T19:41:00 |
| 3 | 9246331 | compact-target-38 | primary-target-46 | ACT-2176 | Integrated Cluster | 2024-11-26T02:58:00 |
| 4 | 4447007 | composite-target-39 | adaptive-target-47 | ACT-2180 | Extended Review | 2025-04-10T09:15:00 |

The first row shows that amendment `statutory_amendment_id` 1 (amendment `605961`) was applied to act `ACT-2168` ("Regional Initiative"), enacted on 2022-01-04 and assented on 2023-10-22. It targeted section `regional-target-36` and clause `compact-target-44`, performing a `substitution` of `compact-original-14` with `distributed-substitu-48`. The second row links amendment 2 (amendment `338542`) to `ACT-2172` ("Seasonal Model D"), enacted on 2023-06-15 and assented on 2024-03-06, performing an `insertion` in section `legacy-target-37` and clause `composite-target-45`. The third row connects amendment 3 (amendment `9246331`) to `ACT-2176` ("Integrated Cluster"), enacted on 2024-11-26 and assented on 2025-08-17, executing a `deletion` in section `compact-target-38` and clause `primary-target-46`. The fourth row ties amendment 4 (amendment `4447007`) to `ACT-2180` ("Extended Review"), enacted on 2025-04-10 and assented on 2022-01-01, performing a `repeal` in section `composite-target-39` and clause `adaptive-target-47`. This view is the primary interface for auditing the modification history of any act.

## Amendment-to-Body Association

The view `v_statutory_amendment_legislative_body` answers the question: which legislative body was responsible for which statutory amendments? It joins `statutory_amendments` to `legislative_bodies` on `a.legislative_body_id = b.id`, projecting the amendment's identifying and target columns alongside the body's key, name, and jurisdiction.

**View `v_statutory_amendment_legislative_body`**

```sql
CREATE VIEW v_statutory_amendment_legislative_body AS
SELECT a.statutory_amendment_id, a.amendment_id, a.target_section, a.target_clause, b.id AS body_id, b.body_name AS body_body_name, b.jurisdiction_name AS body_jurisdiction_name
FROM statutory_amendments a JOIN legislative_bodies b ON a.legislative_body_id = b.id;
```

| statutory_amendment_id | amendment_id | target_section | target_clause | body_id | body_body_name | body_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1 | 605961 | regional-target-36 | compact-target-44 | 1000 | Regional Corridor | Pilot Cluster |
| 2 | 338542 | legacy-target-37 | composite-target-45 | 1001 | Seasonal Series D | Baseline Review |
| 3 | 9246331 | compact-target-38 | primary-target-46 | 1002 | Integrated Assessment | Distributed Initiative A |
| 4 | 4447007 | composite-target-39 | adaptive-target-47 | 1003 | Extended Survey | Adaptive Model |

The first row shows that amendment 1 (amendment `605961`) was produced by body 1000 ("Regional Corridor") under jurisdiction "Pilot Cluster". It targeted section `regional-target-36` and clause `compact-target-44`, performing a `substitution`. The second row links amendment 2 (amendment `338542`) to body 1001 ("Seasonal Series D") in "Baseline Review", performing an `insertion` in section `legacy-target-37` and clause `composite-target-45`. The third row connects amendment 3 (amendment `9246331`) to body 1002 ("Integrated Assessment") in "Distributed Initiative A", executing a `deletion` in section `compact-target-38` and clause `primary-target-46`. The fourth row ties amendment 4 (amendment `4447007`) to body 1003 ("Extended Survey") in "Adaptive Model", performing a `repeal` in section `composite-target-39` and clause `adaptive-target-47`. This view supports accountability reporting, where the unit of analysis is the legislative body's amendment output.

## Official-to-Act Association

The view `v_government_official_legislative_act` answers the question: which government officials were certified in connection with which legislative acts? It joins `government_officials` to `legislative_acts` on `a.act_number = b.act_number`, projecting the official's identifying and certification columns alongside the act's number, title, enactment date, and assent date.

**View `v_government_official_legislative_act`**

```sql
CREATE VIEW v_government_official_legislative_act AS
SELECT a.id, a.official_name, a.designation, a.department, b.act_number AS act_act_number, b.short_title AS act_short_title, b.enactment_date AS act_enactment_date
FROM government_officials a JOIN legislative_acts b ON a.act_number = b.act_number;
```

| id | official_name | designation | department | act_act_number | act_short_title | act_enactment_date |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | pilot-designat-92 | adaptive-departme-89 | ACT-2168 | Regional Initiative | 2022-01-04T12:24:00 |
| 1001 | Pilot Initiative A | extended-designat-93 | distributed-departme-90 | ACT-2172 | Seasonal Model D | 2023-06-15T19:41:00 |
| 1002 | Baseline Model | integrated-designat-94 | baseline-departme-91 | ACT-2176 | Integrated Cluster | 2024-11-26T02:58:00 |
| 1003 | Distributed Cluster | seasonal-designat-95 | pilot-departme-92 | ACT-2180 | Extended Review | 2025-04-10T09:15:00 |

The first row shows that official 1000 ("Extended Review"), with designation `pilot-designat-92` in department `adaptive-departme-89`, was certified on 2025-08-01 with status `active` in connection with act `ACT-2168` ("Regional Initiative"), enacted on 2022-01-04 and assented on 2023-10-22. The second row links official 1001 ("Pilot Initiative A"), designation `extended-designat-93`, department `distributed-departme-90`, certified 2022-01-12, status `retired`, to `ACT-2172` ("Seasonal Model D"), enacted on 2023-06-15 and assented on 2024-03-06. The third row connects official 1002 ("Baseline Model"), designation `integrated-designat-94`, department `baseline-departme-91`, certified 2023-06-23, status `suspended`, to `ACT-2176` ("Integrated Cluster"), enacted on 2024-11-26 and assented on 2025-08-17. The fourth row ties official 1003 ("Distributed Cluster"), designation `seasonal-designat-95`, department `pilot-departme-92`, certified 2024-11-07, status `active`, to `ACT-2180` ("Extended Review"), enacted on 2025-04-10 and assented on 2022-01-01. This view is the primary interface for compliance and certification audits.

## Official-to-Body Association

The view `v_government_official_legislative_body` answers the question: which government officials were certified in connection with which legislative bodies? It joins `government_officials` to `legislative_bodies` on `a.legislative_body_id = b.id`, projecting the official's identifying and certification columns alongside the body's key, name, and jurisdiction.

**View `v_government_official_legislative_body`**

```sql
CREATE VIEW v_government_official_legislative_body AS
SELECT a.id, a.official_name, a.designation, a.department, b.id AS body_id, b.body_name AS body_body_name, b.jurisdiction_name AS body_jurisdiction_name
FROM government_officials a JOIN legislative_bodies b ON a.legislative_body_id = b.id;
```

| id | official_name | designation | department | body_id | body_body_name | body_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1000 | Extended Review | pilot-designat-92 | adaptive-departme-89 | 1000 | Regional Corridor | Pilot Cluster |
| 1001 | Pilot Initiative A | extended-designat-93 | distributed-departme-90 | 1001 | Seasonal Series D | Baseline Review |
| 1002 | Baseline Model | integrated-designat-94 | baseline-departme-91 | 1002 | Integrated Assessment | Distributed Initiative A |
| 1003 | Distributed Cluster | seasonal-designat-95 | pilot-departme-92 | 1003 | Extended Survey | Adaptive Model |

The first row shows that official 1000 ("Extended Review"), designation `pilot-designat-92`, department `adaptive-departme-89`, certified 2025-08-01, status `active`, was certified in connection with body 1000 ("Regional Corridor") under jurisdiction "Pilot Cluster". The second row links official 1001 ("Pilot Initiative A"), designation `extended-designat-93`, department `distributed-departme-90`, certified 2022-01-12, status `retired`, to body 1001 ("Seasonal Series D") in "Baseline Review". The third row connects official 1002 ("Baseline Model"), designation `integrated-designat-94`, department `baseline-departme-91`, certified 2023-06-23, status `suspended`, to body 1002 ("Integrated Assessment") in "Distributed Initiative A". The fourth row ties official 1003 ("Distributed Cluster"), designation `seasonal-designat-95`, department `pilot-departme-92`, certified 2024-11-07, status `active`, to body 1003 ("Extended Survey") in "Adaptive Model". This view supports organisational accountability reporting, where the unit of analysis is the legislative body's certified personnel.

## Synthesis

The schema models a governance domain in which legislative acts are the central entities, each produced by a legislative body, subject to statutory amendments, and certified by government officials. The four base tables—`legislative_acts`, `legislative_bodies`, `statutory_amendments`, and `government_officials`—are normalised to eliminate redundancy, with foreign keys (`legislative_body_id`, `act_number`) encoding the relationships. The seven views reconstruct domain facts by joining these tables: self-joins for act lineage, binary joins for act-body associations, and binary joins for amendment and official associations. Each view answers a distinct analytical question—act lineage, body accountability, amendment history, or certification compliance—while the underlying normalised schema ensures data integrity and update consistency. The model demonstrates how a small set of entity types, when connected through well-defined foreign keys and projected through purpose-built views, can support a rich and flexible analytical layer over a complex governance domain.