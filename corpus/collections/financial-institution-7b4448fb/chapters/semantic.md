The financial compliance ecosystem is a tightly coupled network of institutions, screening tools, regulatory bodies, and advisory services. At its core, the domain revolves around four principal entity types: financial institutions that must screen transactions against sanctions lists, sanctions screening tools that perform the actual matching, regulatory agencies that issue and maintain those lists, and consultancy teams that provide implementation and training support. The relational schema captures this ecosystem through six base tables, three junction tables that resolve many-to-many relationships, and sixteen materialized views that reconstruct domain facts from the normalized structure.

## The Base Tables

The foundation of the schema is the `financial_institutions` table, which stores the primary organizational entities. Each row represents a distinct institution identified by a surrogate `id` (e.g., `1000`), a business-facing `institution_id` (e.g., `9424913`), and a `legal_name` such as "Adaptive Model" or "Primary Cluster". The `jurisdiction` column encodes the regulatory territory — values like `regional-jurisdic-30` and `legacy-jurisdic-31` — while `market_value_rank` provides a numeric ordering (16, 19, 22, 25). The `established_year` column stores an integer (10, 16, 22, 28) that, in this dataset, functions as a relative age indicator rather than a calendar year. Boolean flags `is_cross_border` and `regulatory_status` (with values `compliant`, `non-compliant`, and `under-review`) capture operational and compliance posture. Two foreign keys anchor the institution to its screening tool and to itself: `sanctions_screening_tool_id` (e.g., `100`) and `financial_institution_id` (e.g., `1000`).

**Table `financial_institutions`**

| id | institution_id | legal_name | jurisdiction | market_value_rank | established_year | is_cross_border | regulatory_status | sanctions_screening_tool_id | financial_institution_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9424913 | Adaptive Model | regional-jurisdic-30 | 16 | 10 | true | compliant | 100 | 1000 |
| 1001 | 8189481 | Primary Cluster | legacy-jurisdic-31 | 19 | 16 | false | non-compliant | 101 | 1001 |
| 1002 | 1437604 | Composite Review D | compact-jurisdic-32 | 22 | 22 | true | under-review | 102 | 1002 |
| 1003 | 884346 | Compact Initiative | composite-jurisdic-33 | 25 | 28 | false | compliant | 103 | 1003 |

The `sanctions_screening_tools` table describes the software systems used to match transactions against sanctions lists. Each tool is identified by `sanctions_screening_tool_id` (e.g., `100`, `101`, `102`, `103`) and a `tool_id` such as `comi` or `195360`. The `provider` column names the vendor — `legacy-provider-37`, `compact-provider-38`, `composite-provider-39`, `primary-provider-40` — while `deployment_model` takes values `web-based`, `on-premise`, or `hybrid`. Implementation effort is captured in `implementation_months` (15.20, 18.40, 21.60, 24.80) and cost as `cost_percentage` (0.11, 16.54, 25.47, 33.06). The `last_updated` timestamp (e.g., `2023-06-17T17:27:00`) and `list_coverage` (e.g., `compact-list-92`, `composite-list-93`) describe the tool's currency and scope. A boolean `is_auto_updating` indicates whether the tool refreshes its lists automatically. Foreign keys `financial_institution_id` and `consultancy_team_id` link the tool to its operator and its implementation partner.

**Table `sanctions_screening_tools`**

| sanctions_screening_tool_id | tool_id | provider | deployment_model | implementation_months | cost_percentage | last_updated | list_coverage | is_auto_updating | financial_institution_id | consultancy_team_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | comi | legacy-provider-37 | web-based | 15.20 | 0.11 | 2023-06-17T17:27:00 | compact-list-92 | false | 1000 | 1000 |
| 101 | 195360 | compact-provider-38 | on-premise | 18.40 | 16.54 | 2024-11-01T00:44:00 | composite-list-93 | true | 1001 | 1001 |
| 102 | 3355763 | composite-provider-39 | hybrid | 21.60 | 25.47 | 2025-04-12T07:01:00 | primary-list-94 | false | 1002 | 1002 |
| 103 | 8387539 | primary-provider-40 | web-based | 24.80 | 33.06 | 2022-09-23T14:18:00 | adaptive-list-95 | true | 1003 | 1003 |

Sanctions lists themselves are stored in `sanctions_lists`, where each row represents a distinct regulatory list. The surrogate `sanctions_list_id` (e.g., `1`, `2`, `3`, `4`) pairs with a business `list_id` such as `3001009030140` or the UUID `eb56fb15-2499-4b47-b59d-8319ca5ad273`. The `issuing_authority` (e.g., `extended-issuing-33`, `integrated-issuing-34`) names the body that published the list. Date columns `effective_date` and `expiration_date` define the list's validity window — note that in this dataset some expiration dates precede effective dates (e.g., `2024-07-25` to `2022-01-02`), which may indicate data quality issues or a specific modeling convention. The `record_count` (50, 17, 19, 17) and `list_type` (values `individual`, `entity`, `vessel`, `aircraft`) describe the list's content. The `sanctions_screening_tool_id` foreign key (e.g., `100`, `101`, `102`, `103`) ties the list to the tool that consumes it, while `agency_id` (e.g., `U.S. Steel`, `Nikola Corporation`, `Oberthur Technologies`, `General Telephone & Electronics`) references the issuing regulatory agency. A `created_at` timestamp (e.g., `2025-01-01 00:14:00`) records list creation.

**Table `sanctions_lists`**

| sanctions_list_id | list_id | issuing_authority | effective_date | expiration_date | record_count | list_type | sanctions_screening_tool_id | agency_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3001009030140 | extended-issuing-33 | 2023-02-14 | 2025-08-18 | 50 | individual | 100 | U.S. Steel | 2025-01-01 00:14:00 |
| 2 | 338543 | integrated-issuing-34 | 2024-07-25 | 2022-01-02 | 17 | entity | 101 | Nikola Corporation | 2025-02-06 03:14:00 |
| 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | seasonal-issuing-35 | 2025-12-09 | 2023-06-13 | 19 | vessel | 102 | Oberthur Technologies | 2025-03-11 06:14:00 |
| 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | regional-issuing-36 | 2022-05-20 | 2024-11-24 | 17 | aircraft | 103 | General Telephone & Electronics | 2025-04-16 09:14:00 |

The `regulatory_agencies` table stores the issuing bodies. The `agency_id` column serves as both the primary key and the foreign key referenced by `sanctions_lists`; values include `U.S. Steel`, `Nikola Corporation`, `Oberthur Technologies`, and `General Telephone & Electronics`. The `agency_name` column provides a human-readable name (e.g., "FSG Social Impact Advisors", "Whirlpool Corporation"). The `jurisdiction` column (e.g., `regional-jurisdic-30`) mirrors the institution jurisdiction format, while `is_international` (boolean) and `founded_year` (27, 31, 35, 39) describe scope and age. The `enforcement_level` takes values `national`, `regional`, or `global`. A `financial_institution_id` foreign key (e.g., `1000`, `1001`, `1002`, `1003`) links each agency to the institution it oversees.

**Table `regulatory_agencies`**

| agency_id | agency_name | jurisdiction | is_international | founded_year | enforcement_level | financial_institution_id |
|---|---|---|---|---|---|---|
| U.S. Steel | FSG Social Impact Advisors | regional-jurisdic-30 | false | 27 | national | 1000 |
| Nikola Corporation | Whirlpool Corporation | legacy-jurisdic-31 | true | 31 | regional | 1001 |
| Oberthur Technologies | Education Writers Association | compact-jurisdic-32 | false | 35 | global | 1002 |
| General Telephone & Electronics | Switch Card Services Ltd. | composite-jurisdic-33 | true | 39 | national | 1003 |

Compliance training events are recorded in `compliance_trainings`. Each row has a surrogate `id` (e.g., `100`, `101`, `102`, `103`) and a `training_id` such as `1205-0002-M` or `c746bff2-8fcc-11eb-924d-9cd76263cbd0`. The `start_date` and `end_date` columns define the training period (e.g., `2022-09-05T20:24:00` to `2022-09-01T08:00:00`). The `location` column (e.g., `extended-location-99`, `integrated-location-100`) and `attendee_count` (6, 23, 0, 32) describe logistics. The `is_completed` boolean and `follow_up_frequency` (values `weekly`, `monthly`, `none`) capture completion status and ongoing requirements. Three foreign keys — `financial_institution_id`, `consultancy_team_id`, and `sanctions_screening_tool_id` — tie each training to the institution, the consulting vendor, and the tool being trained on.

**Table `compliance_trainings`**

| id | training_id | start_date | end_date | location | attendee_count | is_completed | follow_up_frequency | financial_institution_id | consultancy_team_id | sanctions_screening_tool_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1205-0002-M | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | extended-location-99 | 6 | false | weekly | 1000 | 1000 | 100 |
| 101 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | integrated-location-100 | 23 | true | monthly | 1001 | 1001 | 101 |
| 102 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | seasonal-location-101 | 0 | false | none | 1002 | 1002 | 102 |
| 103 | 10207144 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | regional-location-102 | 32 | true | weekly | 1003 | 1003 | 103 |

Consultancy teams are stored in `consultancy_teams`. The surrogate `id` (e.g., `1000`, `1001`, `1002`, `1003`) pairs with a `team_id` such as `1450649` or `id_14`. The `vendor_name` column names the consulting organization (e.g., "Microsoft Corporation", "PureCycle Technologies.", "American International Group", "American Airlines Group"). The `primary_region` (e.g., `extended-primary-75`) and `specialization` (e.g., `legacy-speciali-13`) describe the team's operational scope. The `is_active` boolean indicates current engagement status. Foreign keys `financial_institution_id`, `compliance_training_id`, and `sanctions_screening_tool_id` link the team to its client institution, its associated training, and the tool it supports.

**Table `consultancy_teams`**

| id | team_id | vendor_name | primary_region | specialization | is_active | financial_institution_id | compliance_training_id | sanctions_screening_tool_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1450649 | Microsoft Corporation | extended-primary-75 | legacy-speciali-13 | true | 1000 | 100 | 100 |
| 1001 | 1437598 | PureCycle Technologies. | integrated-primary-76 | compact-speciali-14 | false | 1001 | 101 | 101 |
| 1002 | id_14 | American International Group | seasonal-primary-77 | composite-speciali-15 | true | 1002 | 102 | 102 |
| 1003 | 99701 | American Airlines Group | regional-primary-78 | primary-speciali-16 | false | 1003 | 103 | 103 |

## Junction Tables and Many-to-Many Relationships

Three junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `institutions_agencies` table links financial institutions to regulatory agencies, enabling a single institution to be overseen by multiple agencies and vice versa. The `tools_lists` table connects sanctions screening tools to sanctions lists, allowing a tool to cover multiple lists and a list to be consumed by multiple tools. The `agencies_lists` table links regulatory agencies to the sanctions lists they issue, supporting the scenario where an agency publishes multiple lists and a list may be co-issued by multiple agencies. These junction tables are the structural manifestation of the ontology's role relationships — they materialize the n-ary associations that the OWL model expresses as object properties with domain and range restrictions.

**Table `institutions_agencies`**

| financial_institution_id | agency_id |
|---|---|
| 1000 | U.S. Steel |
| 1000 | Nikola Corporation |
| 1001 | Nikola Corporation |
| 1001 | Oberthur Technologies |
| 1002 | Oberthur Technologies |
| 1002 | General Telephone & Electronics |
| 1003 | General Telephone & Electronics |
| 1003 | U.S. Steel |
**Table `tools_lists`**

| sanctions_screening_tool_id | sanctions_list_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |
**Table `agencies_lists`**

| agency_id | sanctions_list_id |
|---|---|
| U.S. Steel | 1 |
| U.S. Steel | 2 |
| Nikola Corporation | 2 |
| Nikola Corporation | 3 |
| Oberthur Technologies | 3 |
| Oberthur Technologies | 4 |
| General Telephone & Electronics | 4 |
| General Telephone & Electronics | 1 |

## Materialized Views

The sixteen views reconstruct domain facts by joining the normalized tables. Each view answers a specific analytical question by denormalizing the schema along a particular axis.

The `financial_institution_sanctions_screening_tool_view` joins `financial_institutions` with `sanctions_screening_tools` to answer: "Which screening tool does each institution use, and what are the tool's characteristics?" A row for institution `1000` (Adaptive Model) reveals tool `100` (provider `legacy-provider-37`, web-based deployment, 15.20 months implementation, 0.11% cost).

**View `financial_institution_sanctions_screening_tool_view`**

```sql
CREATE VIEW financial_institution_sanctions_screening_tool_view AS
SELECT a.id, a.institution_id, a.legal_name, a.jurisdiction, b.sanctions_screening_tool_id AS tool_sanctions_screening_tool_id, b.tool_id AS tool_tool_id, b.provider AS tool_provider
FROM financial_institutions a JOIN sanctions_screening_tools b ON a.sanctions_screening_tool_id = b.sanctions_screening_tool_id;
```

| id | institution_id | legal_name | jurisdiction | tool_sanctions_screening_tool_id | tool_tool_id | tool_provider |
|---|---|---|---|---|---|---|
| 1000 | 9424913 | Adaptive Model | regional-jurisdic-30 | 100 | comi | legacy-provider-37 |
| 1001 | 8189481 | Primary Cluster | legacy-jurisdic-31 | 101 | 195360 | compact-provider-38 |
| 1002 | 1437604 | Composite Review D | compact-jurisdic-32 | 102 | 3355763 | composite-provider-39 |
| 1003 | 884346 | Compact Initiative | composite-jurisdic-33 | 103 | 8387539 | primary-provider-40 |

The `financial_institution_financial_institution_view` performs a self-join on `financial_institutions`, likely to compare institutions against each other or to capture hierarchical relationships. It would surface rows where institution `1000` (Adaptive Model, rank 16, compliant) can be directly compared with institution `1001` (Primary Cluster, rank 19, non-compliant).

**View `financial_institution_financial_institution_view`**

```sql
CREATE VIEW financial_institution_financial_institution_view AS
SELECT a.id, a.institution_id, a.legal_name, a.jurisdiction, b.id AS institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM financial_institutions a JOIN financial_institutions b ON a.financial_institution_id = b.id;
```

| id | institution_id | legal_name | jurisdiction | institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 1000 | 9424913 | Adaptive Model | regional-jurisdic-30 | 1000 | 9424913 | Adaptive Model |
| 1001 | 8189481 | Primary Cluster | legacy-jurisdic-31 | 1001 | 8189481 | Primary Cluster |
| 1002 | 1437604 | Composite Review D | compact-jurisdic-32 | 1002 | 1437604 | Composite Review D |
| 1003 | 884346 | Compact Initiative | composite-jurisdic-33 | 1003 | 884346 | Compact Initiative |

The `financial_institution_regulatory_agency_detail_view` joins `financial_institutions` with `regulatory_agencies` to reveal which agency oversees each institution. For institution `1000` (Adaptive Model), the view would show agency `U.S. Steel` (FSG Social Impact Advisors, national enforcement level, founded year 27).

**View `financial_institution_regulatory_agency_detail_view`**

```sql
CREATE VIEW financial_institution_regulatory_agency_detail_view AS
SELECT a.id, a.institution_id, a.legal_name, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name, b.jurisdiction AS agency_jurisdiction
FROM financial_institutions a
  JOIN institutions_agencies j ON j.financial_institution_id = a.id
  JOIN regulatory_agencies b ON b.agency_id = j.agency_id;
```

| id | institution_id | legal_name | agency_agency_id | agency_agency_name | agency_jurisdiction |
|---|---|---|---|---|---|
| 1000 | 9424913 | Adaptive Model | U.S. Steel | FSG Social Impact Advisors | regional-jurisdic-30 |
| 1000 | 9424913 | Adaptive Model | Nikola Corporation | Whirlpool Corporation | legacy-jurisdic-31 |
| 1001 | 8189481 | Primary Cluster | Nikola Corporation | Whirlpool Corporation | legacy-jurisdic-31 |
| 1001 | 8189481 | Primary Cluster | Oberthur Technologies | Education Writers Association | compact-jurisdic-32 |
| 1002 | 1437604 | Composite Review D | Oberthur Technologies | Education Writers Association | compact-jurisdic-32 |
| 1002 | 1437604 | Composite Review D | General Telephone & Electronics | Switch Card Services Ltd. | composite-jurisdic-33 |
| 1003 | 884346 | Compact Initiative | General Telephone & Electronics | Switch Card Services Ltd. | composite-jurisdic-33 |
| 1003 | 884346 | Compact Initiative | U.S. Steel | FSG Social Impact Advisors | regional-jurisdic-30 |

The `sanctions_screening_tool_financial_institution_view` inverts the perspective: it starts from the tool and shows which institution uses it. Tool `100` (legacy-provider-37, web-based, compact-list-92 coverage) is used by institution `1000` (Adaptive Model, compliant).

**View `sanctions_screening_tool_financial_institution_view`**

```sql
CREATE VIEW sanctions_screening_tool_financial_institution_view AS
SELECT a.sanctions_screening_tool_id, a.tool_id, a.provider, a.deployment_model, b.id AS institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM sanctions_screening_tools a JOIN financial_institutions b ON a.financial_institution_id = b.id;
```

| sanctions_screening_tool_id | tool_id | provider | deployment_model | institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 100 | comi | legacy-provider-37 | web-based | 1000 | 9424913 | Adaptive Model |
| 101 | 195360 | compact-provider-38 | on-premise | 1001 | 8189481 | Primary Cluster |
| 102 | 3355763 | composite-provider-39 | hybrid | 1002 | 1437604 | Composite Review D |
| 103 | 8387539 | primary-provider-40 | web-based | 1003 | 884346 | Compact Initiative |

The `sanctions_screening_tool_sanctions_list_detail_view` joins `sanctions_screening_tools` with `sanctions_lists` to answer: "Which sanctions lists does each tool cover?" Tool `100` covers list `1` (issuing authority `extended-issuing-33`, 50 records, individual type, effective 2023-02-14 through 2025-08-18).

**View `sanctions_screening_tool_sanctions_list_detail_view`**

```sql
CREATE VIEW sanctions_screening_tool_sanctions_list_detail_view AS
SELECT a.sanctions_screening_tool_id, a.tool_id, a.provider, b.sanctions_list_id AS list_sanctions_list_id, b.list_id AS list_list_id, b.issuing_authority AS list_issuing_authority
FROM sanctions_screening_tools a
  JOIN tools_lists j ON j.sanctions_screening_tool_id = a.sanctions_screening_tool_id
  JOIN sanctions_lists b ON b.sanctions_list_id = j.sanctions_list_id;
```

| sanctions_screening_tool_id | tool_id | provider | list_sanctions_list_id | list_list_id | list_issuing_authority |
|---|---|---|---|---|---|
| 100 | comi | legacy-provider-37 | 1 | 3001009030140 | extended-issuing-33 |
| 100 | comi | legacy-provider-37 | 2 | 338543 | integrated-issuing-34 |
| 101 | 195360 | compact-provider-38 | 2 | 338543 | integrated-issuing-34 |
| 101 | 195360 | compact-provider-38 | 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | seasonal-issuing-35 |
| 102 | 3355763 | composite-provider-39 | 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | seasonal-issuing-35 |
| 102 | 3355763 | composite-provider-39 | 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | regional-issuing-36 |
| 103 | 8387539 | primary-provider-40 | 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | regional-issuing-36 |
| 103 | 8387539 | primary-provider-40 | 1 | 3001009030140 | extended-issuing-33 |

The `sanctions_screening_tool_consultancy_team_view` links tools to the consultancy teams that implement them. Tool `100` is supported by consultancy team `1000` (Microsoft Corporation, extended-primary-75 region, legacy-speciali-13 specialization, active).

**View `sanctions_screening_tool_consultancy_team_view`**

```sql
CREATE VIEW sanctions_screening_tool_consultancy_team_view AS
SELECT a.sanctions_screening_tool_id, a.tool_id, a.provider, a.deployment_model, b.id AS team_id, b.team_id AS team_team_id, b.vendor_name AS team_vendor_name
FROM sanctions_screening_tools a JOIN consultancy_teams b ON a.consultancy_team_id = b.id;
```

| sanctions_screening_tool_id | tool_id | provider | deployment_model | team_id | team_team_id | team_vendor_name |
|---|---|---|---|---|---|---|
| 100 | comi | legacy-provider-37 | web-based | 1000 | 1450649 | Microsoft Corporation |
| 101 | 195360 | compact-provider-38 | on-premise | 1001 | 1437598 | PureCycle Technologies. |
| 102 | 3355763 | composite-provider-39 | hybrid | 1002 | id_14 | American International Group |
| 103 | 8387539 | primary-provider-40 | web-based | 1003 | 99701 | American Airlines Group |

The `sanctions_list_sanctions_screening_tool_view` joins `sanctions_lists` with `sanctions_screening_tools` from the list's perspective: "Which tool consumes this list?" List `1` (3001009030140, individual type, 50 records) is consumed by tool `100` (legacy-provider-37, web-based).

**View `sanctions_list_sanctions_screening_tool_view`**

```sql
CREATE VIEW sanctions_list_sanctions_screening_tool_view AS
SELECT a.sanctions_list_id, a.list_id, a.issuing_authority, a.effective_date, b.sanctions_screening_tool_id AS tool_sanctions_screening_tool_id, b.tool_id AS tool_tool_id, b.provider AS tool_provider
FROM sanctions_lists a JOIN sanctions_screening_tools b ON a.sanctions_screening_tool_id = b.sanctions_screening_tool_id;
```

| sanctions_list_id | list_id | issuing_authority | effective_date | tool_sanctions_screening_tool_id | tool_tool_id | tool_provider |
|---|---|---|---|---|---|---|
| 1 | 3001009030140 | extended-issuing-33 | 2023-02-14 | 100 | comi | legacy-provider-37 |
| 2 | 338543 | integrated-issuing-34 | 2024-07-25 | 101 | 195360 | compact-provider-38 |
| 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | seasonal-issuing-35 | 2025-12-09 | 102 | 3355763 | composite-provider-39 |
| 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | regional-issuing-36 | 2022-05-20 | 103 | 8387539 | primary-provider-40 |

The `sanctions_list_regulatory_agency_view` joins `sanctions_lists` with `regulatory_agencies` to reveal the issuing authority for each list. List `1` is issued by agency `U.S. Steel` (FSG Social Impact Advisors, national enforcement).

**View `sanctions_list_regulatory_agency_view`**

```sql
CREATE VIEW sanctions_list_regulatory_agency_view AS
SELECT a.sanctions_list_id, a.list_id, a.issuing_authority, a.effective_date, b.agency_id AS agency_agency_id, b.agency_name AS agency_agency_name, b.jurisdiction AS agency_jurisdiction
FROM sanctions_lists a JOIN regulatory_agencies b ON a.agency_id = b.agency_id;
```

| sanctions_list_id | list_id | issuing_authority | effective_date | agency_agency_id | agency_agency_name | agency_jurisdiction |
|---|---|---|---|---|---|---|
| 1 | 3001009030140 | extended-issuing-33 | 2023-02-14 | U.S. Steel | FSG Social Impact Advisors | regional-jurisdic-30 |
| 2 | 338543 | integrated-issuing-34 | 2024-07-25 | Nikola Corporation | Whirlpool Corporation | legacy-jurisdic-31 |
| 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | seasonal-issuing-35 | 2025-12-09 | Oberthur Technologies | Education Writers Association | compact-jurisdic-32 |
| 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | regional-issuing-36 | 2022-05-20 | General Telephone & Electronics | Switch Card Services Ltd. | composite-jurisdic-33 |

The `regulatory_agency_sanctions_list_detail_view` inverts the previous join: starting from the agency, it shows which lists it issues. Agency `U.S. Steel` issues list `1` (3001009030140, individual type, 50 records, effective 2023-02-14).

**View `regulatory_agency_sanctions_list_detail_view`**

```sql
CREATE VIEW regulatory_agency_sanctions_list_detail_view AS
SELECT a.agency_id, a.agency_name, a.jurisdiction, b.sanctions_list_id AS list_sanctions_list_id, b.list_id AS list_list_id, b.issuing_authority AS list_issuing_authority
FROM regulatory_agencies a
  JOIN agencies_lists j ON j.agency_id = a.agency_id
  JOIN sanctions_lists b ON b.sanctions_list_id = j.sanctions_list_id;
```

| agency_id | agency_name | jurisdiction | list_sanctions_list_id | list_list_id | list_issuing_authority |
|---|---|---|---|---|---|
| U.S. Steel | FSG Social Impact Advisors | regional-jurisdic-30 | 1 | 3001009030140 | extended-issuing-33 |
| U.S. Steel | FSG Social Impact Advisors | regional-jurisdic-30 | 2 | 338543 | integrated-issuing-34 |
| Nikola Corporation | Whirlpool Corporation | legacy-jurisdic-31 | 2 | 338543 | integrated-issuing-34 |
| Nikola Corporation | Whirlpool Corporation | legacy-jurisdic-31 | 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | seasonal-issuing-35 |
| Oberthur Technologies | Education Writers Association | compact-jurisdic-32 | 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | seasonal-issuing-35 |
| Oberthur Technologies | Education Writers Association | compact-jurisdic-32 | 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | regional-issuing-36 |
| General Telephone & Electronics | Switch Card Services Ltd. | composite-jurisdic-33 | 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | regional-issuing-36 |
| General Telephone & Electronics | Switch Card Services Ltd. | composite-jurisdic-33 | 1 | 3001009030140 | extended-issuing-33 |

The `regulatory_agency_financial_institution_view` joins `regulatory_agencies` with `financial_institutions` to show which institutions each agency oversees. Agency `U.S. Steel` oversees institution `1000` (Adaptive Model, compliant, cross-border).

**View `regulatory_agency_financial_institution_view`**

```sql
CREATE VIEW regulatory_agency_financial_institution_view AS
SELECT a.agency_id, a.agency_name, a.jurisdiction, a.is_international, b.id AS institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM regulatory_agencies a JOIN financial_institutions b ON a.financial_institution_id = b.id;
```

| agency_id | agency_name | jurisdiction | is_international | institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| U.S. Steel | FSG Social Impact Advisors | regional-jurisdic-30 | false | 1000 | 9424913 | Adaptive Model |
| Nikola Corporation | Whirlpool Corporation | legacy-jurisdic-31 | true | 1001 | 8189481 | Primary Cluster |
| Oberthur Technologies | Education Writers Association | compact-jurisdic-32 | false | 1002 | 1437604 | Composite Review D |
| General Telephone & Electronics | Switch Card Services Ltd. | composite-jurisdic-33 | true | 1003 | 884346 | Compact Initiative |

The `compliance_training_financial_institution_view` joins `compliance_trainings` with `financial_institutions` to answer: "Which institution completed which training?" Training `100` (1205-0002-M, extended-location-99, 6 attendees, not completed, weekly follow-up) was conducted for institution `1000` (Adaptive Model).

**View `compliance_training_financial_institution_view`**

```sql
CREATE VIEW compliance_training_financial_institution_view AS
SELECT a.id, a.training_id, a.start_date, a.end_date, b.id AS institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM compliance_trainings a JOIN financial_institutions b ON a.financial_institution_id = b.id;
```

| id | training_id | start_date | end_date | institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 100 | 1205-0002-M | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 9424913 | Adaptive Model |
| 101 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 8189481 | Primary Cluster |
| 102 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | 1437604 | Composite Review D |
| 103 | 10207144 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | 884346 | Compact Initiative |

The `compliance_training_consultancy_team_view` links training events to the consultancy teams that delivered them. Training `100` was delivered by consultancy team `1000` (Microsoft Corporation, active, legacy-speciali-13 specialization).

**View `compliance_training_consultancy_team_view`**

```sql
CREATE VIEW compliance_training_consultancy_team_view AS
SELECT a.id, a.training_id, a.start_date, a.end_date, b.id AS team_id, b.team_id AS team_team_id, b.vendor_name AS team_vendor_name
FROM compliance_trainings a JOIN consultancy_teams b ON a.consultancy_team_id = b.id;
```

| id | training_id | start_date | end_date | team_id | team_team_id | team_vendor_name |
|---|---|---|---|---|---|---|
| 100 | 1205-0002-M | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 1450649 | Microsoft Corporation |
| 101 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 1437598 | PureCycle Technologies. |
| 102 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | id_14 | American International Group |
| 103 | 10207144 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | 99701 | American Airlines Group |

The `compliance_training_sanctions_screening_tool_view` joins `compliance_trainings` with `sanctions_screening_tools` to reveal which tool each training covers. Training `100` covers tool `100` (legacy-provider-37, web-based, 15.20 months implementation).

**View `compliance_training_sanctions_screening_tool_view`**

```sql
CREATE VIEW compliance_training_sanctions_screening_tool_view AS
SELECT a.id, a.training_id, a.start_date, a.end_date, b.sanctions_screening_tool_id AS tool_sanctions_screening_tool_id, b.tool_id AS tool_tool_id, b.provider AS tool_provider
FROM compliance_trainings a JOIN sanctions_screening_tools b ON a.sanctions_screening_tool_id = b.sanctions_screening_tool_id;
```

| id | training_id | start_date | end_date | tool_sanctions_screening_tool_id | tool_tool_id | tool_provider |
|---|---|---|---|---|---|---|
| 100 | 1205-0002-M | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 100 | comi | legacy-provider-37 |
| 101 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 101 | 195360 | compact-provider-38 |
| 102 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 102 | 3355763 | composite-provider-39 |
| 103 | 10207144 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 103 | 8387539 | primary-provider-40 |

The `consultancy_team_financial_institution_view` joins `consultancy_teams` with `financial_institutions` to show which institutions each consultancy serves. Team `1000` (Microsoft Corporation) serves institution `1000` (Adaptive Model, compliant).

**View `consultancy_team_financial_institution_view`**

```sql
CREATE VIEW consultancy_team_financial_institution_view AS
SELECT a.id, a.team_id, a.vendor_name, a.primary_region, b.id AS institution_id, b.institution_id AS institution_institution_id, b.legal_name AS institution_legal_name
FROM consultancy_teams a JOIN financial_institutions b ON a.financial_institution_id = b.id;
```

| id | team_id | vendor_name | primary_region | institution_id | institution_institution_id | institution_legal_name |
|---|---|---|---|---|---|---|
| 1000 | 1450649 | Microsoft Corporation | extended-primary-75 | 1000 | 9424913 | Adaptive Model |
| 1001 | 1437598 | PureCycle Technologies. | integrated-primary-76 | 1001 | 8189481 | Primary Cluster |
| 1002 | id_14 | American International Group | seasonal-primary-77 | 1002 | 1437604 | Composite Review D |
| 1003 | 99701 | American Airlines Group | regional-primary-78 | 1003 | 884346 | Compact Initiative |

The `consultancy_team_compliance_training_view` links consultancy teams to the training events they conducted. Team `1000` (Microsoft Corporation, active) conducted training `100` (1205-0002-M, 6 attendees, not completed).

**View `consultancy_team_compliance_training_view`**

```sql
CREATE VIEW consultancy_team_compliance_training_view AS
SELECT a.id, a.team_id, a.vendor_name, a.primary_region, b.id AS training_id, b.training_id AS training_training_id, b.start_date AS training_start_date
FROM consultancy_teams a JOIN compliance_trainings b ON a.compliance_training_id = b.id;
```

| id | team_id | vendor_name | primary_region | training_id | training_training_id | training_start_date |
|---|---|---|---|---|---|---|
| 1000 | 1450649 | Microsoft Corporation | extended-primary-75 | 100 | 1205-0002-M | 2022-09-05T20:24:00 |
| 1001 | 1437598 | PureCycle Technologies. | integrated-primary-76 | 101 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 |
| 1002 | id_14 | American International Group | seasonal-primary-77 | 102 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 |
| 1003 | 99701 | American Airlines Group | regional-primary-78 | 103 | 10207144 | 2025-12-11T17:15:00 |

The `consultancy_team_sanctions_screening_tool_view` joins `consultancy_teams` with `sanctions_screening_tools` to reveal which tools each team supports. Team `1000` (Microsoft Corporation, extended-primary-75) supports tool `100` (legacy-provider-37, web-based, compact-list-92 coverage, auto-updating disabled).

**View `consultancy_team_sanctions_screening_tool_view`**

```sql
CREATE VIEW consultancy_team_sanctions_screening_tool_view AS
SELECT a.id, a.team_id, a.vendor_name, a.primary_region, b.sanctions_screening_tool_id AS tool_sanctions_screening_tool_id, b.tool_id AS tool_tool_id, b.provider AS tool_provider
FROM consultancy_teams a JOIN sanctions_screening_tools b ON a.sanctions_screening_tool_id = b.sanctions_screening_tool_id;
```

| id | team_id | vendor_name | primary_region | tool_sanctions_screening_tool_id | tool_tool_id | tool_provider |
|---|---|---|---|---|---|---|
| 1000 | 1450649 | Microsoft Corporation | extended-primary-75 | 100 | comi | legacy-provider-37 |
| 1001 | 1437598 | PureCycle Technologies. | integrated-primary-76 | 101 | 195360 | compact-provider-38 |
| 1002 | id_14 | American International Group | seasonal-primary-77 | 102 | 3355763 | composite-provider-39 |
| 1003 | 99701 | American Airlines Group | regional-primary-78 | 103 | 8387539 | primary-provider-40 |

## Synthesis

The schema models the financial compliance domain as a star-like topology centered on `financial_institutions`, with `sanctions_screening_tools`, `regulatory_agencies`, and `consultancy_teams` radiating outward as supporting entities. The `sanctions_lists` table sits at the intersection of tools and agencies, capturing the regulatory content that tools consume and agencies issue. The three junction tables (`institutions_agencies`, `tools_lists`, `agencies_lists`) provide the flexibility for n-ary associations that the base foreign keys cannot express. The sixteen views materialize the most common analytical queries — tool-to-institution mappings, list-to-tool coverage, agency-to-institution oversight, and training-to-team delivery — as denormalized result sets that can be queried directly without explicit joins. Together, the base tables, junction tables, and views form a complete relational representation of the ontology, preserving the cardinality constraints and role relationships defined in the domain model while enabling efficient read access patterns for compliance reporting and regulatory audit.