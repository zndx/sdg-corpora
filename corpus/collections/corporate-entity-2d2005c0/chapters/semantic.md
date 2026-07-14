The domain under examination is a corporate advisory ecosystem in which legal entities—corporations, holding companies, or other registered organizations—are surrounded by a constellation of human and institutional advisors. Each corporate entity carries a legal name, a ticker symbol, a market listing, a headquarters country, and a market segment. Around each entity orbit four distinct advisory roles: a corporate executive who holds a formal position within the organization, a consultant who provides service engagements, a financial advisor whose firm delivers investment-related counsel, and a communications advisor whose firm manages public relations. The relational schema captures this structure through five base tables and nine materialized views that reassemble the normalized facts into domain-meaningful joins. The following chapter explains the ontology, the schema, and the view-level reconstructions that answer the principal questions an analyst would ask about this space.

## Base Tables and the Ontology of Roles

The foundational table is `corporate_entities`, which anchors the entire model. Each row represents a distinct legal organization. The primary key is `id`, a surrogate integer. The column `legal_name` carries the registered name of the entity—for example, `Adaptive Model`, `Primary Cluster`, `Composite Review D`, and `Compact Initiative`. The column `ticker_symbol` holds a market identifier such as `composite-ticker-63` or `primary-ticker-64`. The column `market_listing` records the exchange or listing venue (e.g., `compact-market-14`), while `headquarters_country` stores the jurisdiction of the entity's principal office (e.g., `regional-headquar-42`). The column `market_segment` classifies the entity's trading tier, with values like `primary-market-10` and `adaptive-market-11`.

**Table `corporate_entities`**

| id | legal_name | ticker_symbol | market_listing | headquarters_country | market_segment | corporate_executive_id | consultant_id | financial_advisor_id | communications_advisor_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Adaptive Model | composite-ticker-63 | compact-market-14 | regional-headquar-42 | primary-market-10 | 1 | 1 | 1000 | 100 |
| 2 | Primary Cluster | primary-ticker-64 | composite-market-15 | legacy-headquar-43 | adaptive-market-11 | 2 | 2 | 1001 | 101 |
| 3 | Composite Review D | adaptive-ticker-65 | primary-market-16 | compact-headquar-44 | distributed-market-12 | 3 | 3 | 1002 | 102 |
| 4 | Compact Initiative | distributed-ticker-66 | adaptive-market-17 | composite-headquar-45 | baseline-market-13 | 4 | 4 | 1003 | 103 |

The remaining four base tables model the advisory roles. Each role table has its own surrogate primary key and a foreign key back to `corporate_entities` that binds the advisor to the entity it serves. The `corporate_executives` table uses `corporate_executive_id` as its primary key. Its columns include `full_name` (e.g., `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher`), `job_title` (e.g., `Primary Initiative A`, `Composite Model`), `reporting_line` (e.g., `pilot-reportin-32`), `appointment_status` (e.g., `legacy-appointm-73`), and `primary_domain` (e.g., `compact-primary-92`). The table also carries `reports_to_corporate_executive_id`, a self-referencing foreign key that encodes the executive's reporting hierarchy, and `corporate_entity_id`, which points to the entity the executive belongs to.

**Table `corporate_executives`**

| corporate_executive_id | full_name | job_title | reporting_line | appointment_status | primary_domain | reports_to_corporate_executive_id | corporate_entity_id | holds_role_at_corporate_entity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | pilot-reportin-32 | legacy-appointm-73 | compact-primary-92 | 1 | 1 | 1 |
| 2 | Account Name | Composite Model | extended-reportin-33 | compact-appointm-74 | composite-primary-93 | 2 | 2 | 2 |
| 3 | Saipan International Airport | Compact Cluster | integrated-reportin-34 | composite-appointm-75 | primary-primary-94 | 3 | 3 | 3 |
| 4 | Norma Fisher | Legacy Review D | seasonal-reportin-35 | primary-appointm-76 | adaptive-primary-95 | 4 | 4 | 4 |

The `consultants` table uses `id` as its primary key. Its columns are `consultant_name` (e.g., `Legacy Protocol D`, `Regional Programme`), `service_type` (e.g., `composite-service-81`), `contact_phone` (e.g., `Joe Tsai`, `Stephanie Collins`), `advisor_role` (e.g., `integrated-advisor-16`), `corporate_entity_id`, and `represents_corporate_entity_id`. The last two columns both reference `corporate_entities.id`, creating a dual-link pattern: `corporate_entity_id` identifies the row's own organizational context, while `represents_corporate_entity_id` explicitly states which entity the consultant advises.

**Table `consultants`**

| id | consultant_name | service_type | contact_phone | advisor_role | corporate_entity_id | represents_corporate_entity_id |
|---|---|---|---|---|---|---|
| 1 | Legacy Protocol D | composite-service-81 | Joe Tsai | integrated-advisor-16 | 1 | 1 |
| 2 | Regional Programme | primary-service-82 | Stephanie Collins | seasonal-advisor-17 | 2 | 2 |
| 3 | Seasonal Standard | adaptive-service-83 | Tasha Rodriguez | regional-advisor-18 | 3 | 3 |
| 4 | Integrated Framework A | distributed-service-84 | Walter Pratt | legacy-advisor-19 | 4 | 4 |

The `financial_advisors` table uses `financial_advisor_id` as its primary key. Its columns include `advisor_firm_name` (e.g., `Seasonal Corridor`, `Integrated Series`), `service_category` (e.g., `seasonal-service-41`), `contact_phone` (e.g., `Joe Tsai`), `advisor_representative` (e.g., `integrated-advisor-88`), `corporate_entity_id`, and `represents_corporate_entity_id`. The structure mirrors that of `consultants`, with the firm-level naming and the dual foreign-key pattern.

**Table `financial_advisors`**

| financial_advisor_id | advisor_firm_name | service_category | contact_phone | advisor_representative | corporate_entity_id | represents_corporate_entity_id |
|---|---|---|---|---|---|---|
| 1000 | Seasonal Corridor | seasonal-service-41 | Joe Tsai | integrated-advisor-88 | 1 | 1 |
| 1001 | Integrated Series | regional-service-42 | Stephanie Collins | seasonal-advisor-89 | 2 | 2 |
| 1002 | Extended Assessment D | legacy-service-43 | Tasha Rodriguez | regional-advisor-90 | 3 | 3 |
| 1003 | Pilot Survey | compact-service-44 | Walter Pratt | legacy-advisor-91 | 4 | 4 |

The `communications_advisors` table uses `communications_advisor_id` as its primary key. Its columns are `pr_firm_name` (e.g., `Distributed Standard`, `Adaptive Framework D`), `service_category` (e.g., `seasonal-service-41`), `contact_phone` (e.g., `Joe Tsai`), `pr_representative` (e.g., `regional-pr-60`), `corporate_entity_id`, and `represents_corporate_entity_id`. Again, the dual foreign-key pattern binds the PR firm to the entity it represents.

**Table `communications_advisors`**

| communications_advisor_id | pr_firm_name | service_category | contact_phone | pr_representative | corporate_entity_id | represents_corporate_entity_id |
|---|---|---|---|---|---|---|
| 100 | Distributed Standard | seasonal-service-41 | Joe Tsai | regional-pr-60 | 1 | 1 |
| 101 | Adaptive Framework D | regional-service-42 | Stephanie Collins | legacy-pr-61 | 2 | 2 |
| 102 | Primary Protocol | legacy-service-43 | Tasha Rodriguez | compact-pr-62 | 3 | 3 |
| 103 | Composite Programme | compact-service-44 | Walter Pratt | composite-pr-63 | 4 | 4 |

## Cardinality, Foreign Keys, and the One-to-One Advisory Binding

The schema encodes a one-to-one advisory binding between each corporate entity and each of its four advisors. In `corporate_entities`, the columns `corporate_executive_id`, `consultant_id`, `financial_advisor_id`, and `communications_advisor_id` serve as foreign keys pointing into the respective role tables. This design means that every corporate entity row carries exactly one reference to each advisor type, and every advisor row carries exactly one reference back to its entity. The dual-link pattern in the advisor tables—where both `corporate_entity_id` and `represents_corporate_entity_id` reference `corporate_entities.id`—reinforces this binding and provides redundancy for referential integrity checks.

The `corporate_executives` table adds a self-referencing column, `reports_to_corporate_executive_id`, which points to another row in the same table. In the current data, this column holds the same value as `corporate_executive_id` for every row (e.g., row 1 reports to row 1), indicating a flat hierarchy where each executive reports to themselves. This is a cardinality-bounded relationship: each executive has at most one direct supervisor, and each supervisor may have zero or more direct reports.

The foreign keys collectively form a star topology centered on `corporate_entities`. The entity table is the hub; the four role tables are the spokes. This normalization eliminates redundancy: the legal name, ticker, and market attributes live in one place, while the advisory details live in their own tables. The views below reassemble these pieces.

## Views: Reconstructing Domain Facts from Normalized Tables

The nine views each answer a specific analytical question by joining the normalized tables. They fall into two families: entity-to-role views and role-to-entity views.

### Entity-to-Role Views

The view `vw_corporate_entity_corporate_executive` answers the question: "Which executive is associated with each corporate entity, and what is their title?" It joins `corporate_entities` to `corporate_executives` on `corporate_entities.corporate_executive_id = corporate_executives.corporate_executive_id`. The result columns include the entity's `id`, `legal_name`, `ticker_symbol`, and `market_listing`, followed by the executive's `corporate_executive_id` (aliased as `executive_corporate_executive_id`), `full_name` (aliased as `executive_full_name`), and `job_title` (aliased as `executive_job_title`). Reading the first row: the entity `Adaptive Model` (ticker `composite-ticker-63`, listing `compact-market-14`) is associated with executive `Theodore Mcgrath`, whose title is `Primary Initiative A`. The second row pairs `Primary Cluster` with `Account Name` (title `Composite Model`).

**View `vw_corporate_entity_corporate_executive`**

```sql
CREATE VIEW vw_corporate_entity_corporate_executive AS
SELECT a.id, a.legal_name, a.ticker_symbol, a.market_listing, b.corporate_executive_id AS executive_corporate_executive_id, b.full_name AS executive_full_name, b.job_title AS executive_job_title
FROM corporate_entities a JOIN corporate_executives b ON a.corporate_executive_id = b.corporate_executive_id;
```

| id | legal_name | ticker_symbol | market_listing | executive_corporate_executive_id | executive_full_name | executive_job_title |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | composite-ticker-63 | compact-market-14 | 1 | Theodore Mcgrath | Primary Initiative A |
| 2 | Primary Cluster | primary-ticker-64 | composite-market-15 | 2 | Account Name | Composite Model |
| 3 | Composite Review D | adaptive-ticker-65 | primary-market-16 | 3 | Saipan International Airport | Compact Cluster |
| 4 | Compact Initiative | distributed-ticker-66 | adaptive-market-17 | 4 | Norma Fisher | Legacy Review D |

The view `vw_corporate_entity_consultant` joins `corporate_entities` to `consultants` on the entity's `consultant_id` matching the consultant's `id`. It reconstructs the fact of which consultant serves which entity, surfacing the entity's identifying attributes alongside the consultant's name, service type, and contact information.

**View `vw_corporate_entity_consultant`**

```sql
CREATE VIEW vw_corporate_entity_consultant AS
SELECT a.id, a.legal_name, a.ticker_symbol, a.market_listing, b.id AS consultant_id, b.consultant_name AS consultant_consultant_name, b.service_type AS consultant_service_type
FROM corporate_entities a JOIN consultants b ON a.consultant_id = b.id;
```

| id | legal_name | ticker_symbol | market_listing | consultant_id | consultant_consultant_name | consultant_service_type |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | composite-ticker-63 | compact-market-14 | 1 | Legacy Protocol D | composite-service-81 |
| 2 | Primary Cluster | primary-ticker-64 | composite-market-15 | 2 | Regional Programme | primary-service-82 |
| 3 | Composite Review D | adaptive-ticker-65 | primary-market-16 | 3 | Seasonal Standard | adaptive-service-83 |
| 4 | Compact Initiative | distributed-ticker-66 | adaptive-market-17 | 4 | Integrated Framework A | distributed-service-84 |

The view `vw_corporate_entity_financial_advisor` joins `corporate_entities` to `financial_advisors` on `corporate_entities.financial_advisor_id = financial_advisors.financial_advisor_id`. It answers: "Which financial advisory firm serves each entity?" The first row shows that `Adaptive Model` is served by the firm `Seasonal Corridor` (category `seasonal-service-41`, representative `integrated-advisor-88`). The second row shows `Primary Cluster` served by `Integrated Series`.

**View `vw_corporate_entity_financial_advisor`**

```sql
CREATE VIEW vw_corporate_entity_financial_advisor AS
SELECT a.id, a.legal_name, a.ticker_symbol, a.market_listing, b.financial_advisor_id AS advisor_financial_advisor_id, b.advisor_firm_name AS advisor_advisor_firm_name, b.service_category AS advisor_service_category
FROM corporate_entities a JOIN financial_advisors b ON a.financial_advisor_id = b.financial_advisor_id;
```

| id | legal_name | ticker_symbol | market_listing | advisor_financial_advisor_id | advisor_advisor_firm_name | advisor_service_category |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | composite-ticker-63 | compact-market-14 | 1000 | Seasonal Corridor | seasonal-service-41 |
| 2 | Primary Cluster | primary-ticker-64 | composite-market-15 | 1001 | Integrated Series | regional-service-42 |
| 3 | Composite Review D | adaptive-ticker-65 | primary-market-16 | 1002 | Extended Assessment D | legacy-service-43 |
| 4 | Compact Initiative | distributed-ticker-66 | adaptive-market-17 | 1003 | Pilot Survey | compact-service-44 |

The view `vw_corporate_entity_communications_advisor` joins `corporate_entities` to `communications_advisors` on `corporate_entities.communications_advisor_id = communications_advisors.communications_advisor_id`. It answers: "Which PR firm manages communications for each entity?" The first row reveals that `Adaptive Model` is represented by `Distributed Standard` (category `seasonal-service-41`, representative `regional-pr-60`). The second row shows `Primary Cluster` served by `Adaptive Framework D`.

**View `vw_corporate_entity_communications_advisor`**

```sql
CREATE VIEW vw_corporate_entity_communications_advisor AS
SELECT a.id, a.legal_name, a.ticker_symbol, a.market_listing, b.communications_advisor_id AS advisor_communications_advisor_id, b.pr_firm_name AS advisor_pr_firm_name, b.service_category AS advisor_service_category
FROM corporate_entities a JOIN communications_advisors b ON a.communications_advisor_id = b.communications_advisor_id;
```

| id | legal_name | ticker_symbol | market_listing | advisor_communications_advisor_id | advisor_pr_firm_name | advisor_service_category |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | composite-ticker-63 | compact-market-14 | 100 | Distributed Standard | seasonal-service-41 |
| 2 | Primary Cluster | primary-ticker-64 | composite-market-15 | 101 | Adaptive Framework D | regional-service-42 |
| 3 | Composite Review D | adaptive-ticker-65 | primary-market-16 | 102 | Primary Protocol | legacy-service-43 |
| 4 | Compact Initiative | distributed-ticker-66 | adaptive-market-17 | 103 | Composite Programme | compact-service-44 |

### Role-to-Entity Views

The view `vw_corporate_executive_corporate_executive` joins `corporate_executives` to itself, using the self-referencing `reports_to_corporate_executive_id` column. It answers: "Who reports to whom within the executive hierarchy?" Each row pairs an executive with their supervisor, surfacing both the subordinate's and the supervisor's names and titles. In the current data, since every executive reports to themselves, each row shows the same person on both sides of the join.

**View `vw_corporate_executive_corporate_executive`**

```sql
CREATE VIEW vw_corporate_executive_corporate_executive AS
SELECT a.corporate_executive_id, a.full_name, a.job_title, a.reporting_line, b.corporate_executive_id AS executive_corporate_executive_id, b.full_name AS executive_full_name, b.job_title AS executive_job_title
FROM corporate_executives a JOIN corporate_executives b ON a.reports_to_corporate_executive_id = b.corporate_executive_id;
```

| corporate_executive_id | full_name | job_title | reporting_line | executive_corporate_executive_id | executive_full_name | executive_job_title |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | pilot-reportin-32 | 1 | Theodore Mcgrath | Primary Initiative A |
| 2 | Account Name | Composite Model | extended-reportin-33 | 2 | Account Name | Composite Model |
| 3 | Saipan International Airport | Compact Cluster | integrated-reportin-34 | 3 | Saipan International Airport | Compact Cluster |
| 4 | Norma Fisher | Legacy Review D | seasonal-reportin-35 | 4 | Norma Fisher | Legacy Review D |

The view `vw_corporate_executive_corporate_entity` joins `corporate_executives` to `corporate_entities` on `corporate_executives.corporate_entity_id = corporate_entities.id`. It answers: "Which corporate entity does each executive belong to?" The first row shows that `Theodore Mcgrath` belongs to the entity `Adaptive Model` (ticker `composite-ticker-63`). The second row shows `Account Name` belongs to `Primary Cluster`.

**View `vw_corporate_executive_corporate_entity`**

```sql
CREATE VIEW vw_corporate_executive_corporate_entity AS
SELECT a.corporate_executive_id, a.full_name, a.job_title, a.reporting_line, b.id AS entity_id, b.legal_name AS entity_legal_name, b.ticker_symbol AS entity_ticker_symbol
FROM corporate_executives a JOIN corporate_entities b ON a.corporate_entity_id = b.id;
```

| corporate_executive_id | full_name | job_title | reporting_line | entity_id | entity_legal_name | entity_ticker_symbol |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | pilot-reportin-32 | 1 | Adaptive Model | composite-ticker-63 |
| 2 | Account Name | Composite Model | extended-reportin-33 | 2 | Primary Cluster | primary-ticker-64 |
| 3 | Saipan International Airport | Compact Cluster | integrated-reportin-34 | 3 | Composite Review D | adaptive-ticker-65 |
| 4 | Norma Fisher | Legacy Review D | seasonal-reportin-35 | 4 | Compact Initiative | distributed-ticker-66 |

The view `vw_consultant_corporate_entity` joins `consultants` to `corporate_entities` on `consultants.corporate_entity_id = corporate_entities.id`. It answers: "Which corporate entity does each consultant's engagement context belong to?" The first row shows that the consultant `Legacy Protocol D` (service type `composite-service-81`) operates in the context of entity `Adaptive Model`.

**View `vw_consultant_corporate_entity`**

```sql
CREATE VIEW vw_consultant_corporate_entity AS
SELECT a.id, a.consultant_name, a.service_type, a.contact_phone, b.id AS entity_id, b.legal_name AS entity_legal_name, b.ticker_symbol AS entity_ticker_symbol
FROM consultants a JOIN corporate_entities b ON a.corporate_entity_id = b.id;
```

| id | consultant_name | service_type | contact_phone | entity_id | entity_legal_name | entity_ticker_symbol |
|---|---|---|---|---|---|---|
| 1 | Legacy Protocol D | composite-service-81 | Joe Tsai | 1 | Adaptive Model | composite-ticker-63 |
| 2 | Regional Programme | primary-service-82 | Stephanie Collins | 2 | Primary Cluster | primary-ticker-64 |
| 3 | Seasonal Standard | adaptive-service-83 | Tasha Rodriguez | 3 | Composite Review D | adaptive-ticker-65 |
| 4 | Integrated Framework A | distributed-service-84 | Walter Pratt | 4 | Compact Initiative | distributed-ticker-66 |

The view `vw_financial_advisor_corporate_entity` joins `financial_advisors` to `corporate_entities` on `financial_advisors.corporate_entity_id = corporate_entities.id`. It answers: "Which corporate entity is the operational context for each financial advisory firm?" The first row shows that the firm `Seasonal Corridor` operates in the context of entity `Adaptive Model`.

**View `vw_financial_advisor_corporate_entity`**

```sql
CREATE VIEW vw_financial_advisor_corporate_entity AS
SELECT a.financial_advisor_id, a.advisor_firm_name, a.service_category, a.contact_phone, b.id AS entity_id, b.legal_name AS entity_legal_name, b.ticker_symbol AS entity_ticker_symbol
FROM financial_advisors a JOIN corporate_entities b ON a.corporate_entity_id = b.id;
```

| financial_advisor_id | advisor_firm_name | service_category | contact_phone | entity_id | entity_legal_name | entity_ticker_symbol |
|---|---|---|---|---|---|---|
| 1000 | Seasonal Corridor | seasonal-service-41 | Joe Tsai | 1 | Adaptive Model | composite-ticker-63 |
| 1001 | Integrated Series | regional-service-42 | Stephanie Collins | 2 | Primary Cluster | primary-ticker-64 |
| 1002 | Extended Assessment D | legacy-service-43 | Tasha Rodriguez | 3 | Composite Review D | adaptive-ticker-65 |
| 1003 | Pilot Survey | compact-service-44 | Walter Pratt | 4 | Compact Initiative | distributed-ticker-66 |

The view `vw_communications_advisor_corporate_entity` joins `communications_advisors` to `corporate_entities` on `communications_advisors.corporate_entity_id = corporate_entities.id`. It answers: "Which corporate entity is the operational context for each PR firm?" The first row shows that the firm `Distributed Standard` operates in the context of entity `Adaptive Model`.

**View `vw_communications_advisor_corporate_entity`**

```sql
CREATE VIEW vw_communications_advisor_corporate_entity AS
SELECT a.communications_advisor_id, a.pr_firm_name, a.service_category, a.contact_phone, b.id AS entity_id, b.legal_name AS entity_legal_name, b.ticker_symbol AS entity_ticker_symbol
FROM communications_advisors a JOIN corporate_entities b ON a.corporate_entity_id = b.id;
```

| communications_advisor_id | pr_firm_name | service_category | contact_phone | entity_id | entity_legal_name | entity_ticker_symbol |
|---|---|---|---|---|---|---|
| 100 | Distributed Standard | seasonal-service-41 | Joe Tsai | 1 | Adaptive Model | composite-ticker-63 |
| 101 | Adaptive Framework D | regional-service-42 | Stephanie Collins | 2 | Primary Cluster | primary-ticker-64 |
| 102 | Primary Protocol | legacy-service-43 | Tasha Rodriguez | 3 | Composite Review D | adaptive-ticker-65 |
| 103 | Composite Programme | compact-service-44 | Walter Pratt | 4 | Compact Initiative | distributed-ticker-66 |

## Synthesis

The schema models a corporate advisory ecosystem as a star of five base tables: one hub (`corporate_entities`) and four spokes (`corporate_executives`, `consultants`, `financial_advisors`, `communications_advisors`). The hub carries the entity's legal identity and market attributes; the spokes carry role-specific details—names, titles, service categories, contact information. Foreign keys in both directions enforce a one-to-one binding between each entity and each of its four advisors. The `corporate_executives` table additionally encodes a self-referencing reporting hierarchy.

The nine views reassemble these normalized pieces into domain-meaningful joins. The entity-to-role views answer questions like "Which executive, consultant, financial advisor, or communications advisor serves each entity?" The role-to-entity views answer the inverse: "Which entity does each executive, consultant, financial advisor, or communications advisor belong to?" Together, the base tables and views provide a complete, queryable representation of the advisory relationships that define this domain.