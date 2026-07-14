## The Architecture of Financial Sanctions Compliance

Financial institutions operate within a dense regulatory ecosystem where the identification, screening, and reporting of sanctioned entities forms a continuous operational imperative. Every transaction, every onboarding decision, and every periodic review depends on the accuracy of the screening infrastructure deployed across the organization. The data captured in compliance systems reflects not merely administrative records but the living architecture of risk management — the tools selected, the lists monitored, the agencies consulted, the teams engaged, and the training that keeps personnel current. Understanding how these elements interlock is essential for any practitioner responsible for the integrity of sanctions screening operations.

**Table `financial_institutions`**

| id | institution_id | legal_name | jurisdiction | market_value_rank | established_year | is_cross_border | regulatory_status | sanctions_screening_tool_id | financial_institution_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 9424913 | Adaptive Model | regional-jurisdic-30 | 16 | 10 | true | compliant | 100 | 1000 |
| 1001 | 8189481 | Primary Cluster | legacy-jurisdic-31 | 19 | 16 | false | non-compliant | 101 | 1001 |
| 1002 | 1437604 | Composite Review D | compact-jurisdic-32 | 22 | 22 | true | under-review | 102 | 1002 |
| 1003 | 884346 | Compact Initiative | composite-jurisdic-33 | 25 | 28 | false | compliant | 103 | 1003 |

Financial institutions serve as the central actors in this ecosystem. Each institution carries a distinct legal identity — Adaptive Model, Primary Cluster, Composite Review D, Compact Initiative — and operates within a defined jurisdiction that shapes its regulatory obligations. The jurisdictional labels, ranging from regional-jurisdic-30 to composite-jurisdic-33, indicate the geographic and regulatory scope within which each institution functions. Market value rank provides a relative positioning metric, with values spanning from 10 to 28 across the sample, reflecting the institutional scale that typically correlates with screening complexity. The established_year field, with values from 10 to 28, suggests a mix of legacy and newer entities, each bringing different historical exposure to sanctions risk.

The is_cross_border flag distinguishes institutions that operate across jurisdictional boundaries, a characteristic that inherently increases the breadth of applicable sanctions regimes. Adaptive Model and Composite Review D both carry this flag as true, indicating they must contend with multiple overlapping regulatory frameworks. Regulatory status — compliant, non-compliant, or under-review — captures the current standing of each institution relative to its obligations. Primary Cluster stands as the sole non-compliant entity in the sample, while Composite Review D occupies an intermediate under-review position, suggesting active remediation or pending assessment.

**Table `sanctions_screening_tools`**

| sanctions_screening_tool_id | tool_id | provider | deployment_model | implementation_months | cost_percentage | last_updated | list_coverage | is_auto_updating | financial_institution_id | consultancy_team_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | comi | legacy-provider-37 | web-based | 15.20 | 0.11 | 2023-06-17T17:27:00 | compact-list-92 | false | 1000 | 1000 |
| 101 | 195360 | compact-provider-38 | on-premise | 18.40 | 16.54 | 2024-11-01T00:44:00 | composite-list-93 | true | 1001 | 1001 |
| 102 | 3355763 | composite-provider-39 | hybrid | 21.60 | 25.47 | 2025-04-12T07:01:00 | primary-list-94 | false | 1002 | 1002 |
| 103 | 8387539 | primary-provider-40 | web-based | 24.80 | 33.06 | 2022-09-23T14:18:00 | adaptive-list-95 | true | 1003 | 1003 |

The sanctions screening tool represents the technological backbone of compliance operations. Each tool is identified by a unique provider — legacy-provider-37 through primary-provider-40 — and deployed through one of three models: web-based, on-premise, or hybrid. The deployment model choice carries significant operational implications. Web-based tools like the one used by Adaptive Model offer rapid deployment and centralized updates, while on-premise solutions such as that deployed for Primary Cluster provide data residency control at the cost of update latency. Hybrid models, as seen with Composite Review D, attempt to balance both concerns.

Implementation duration, measured in months, ranges from 15.20 for the legacy-provider-37 deployment to 24.80 for primary-provider-40, reflecting the complexity of integrating screening infrastructure into existing transaction processing pipelines. The cost_percentage field, spanning from 0.11 to 33.06, captures the ongoing financial commitment required to maintain screening capabilities. Notably, the institution with the highest cost percentage (Compact Initiative at 33.06) also operates the longest implementation timeline, suggesting a correlation between investment depth and operational maturity.

The is_auto_updating flag distinguishes tools that receive automated list updates from those requiring manual intervention. Primary Cluster and Compact Initiative employ auto-updating tools, while Adaptive Model and Composite Review D rely on manual update processes — a distinction that directly impacts the timeliness of sanctions coverage. The list_coverage field indicates which sanctions list each tool is configured to monitor, with values like compact-list-92 and adaptive-list-95 pointing to the specific regulatory datasets under surveillance.

**Table `sanctions_lists`**

| sanctions_list_id | list_id | issuing_authority | effective_date | expiration_date | record_count | list_type | sanctions_screening_tool_id | agency_id | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3001009030140 | extended-issuing-33 | 2023-02-14 | 2025-08-18 | 50 | individual | 100 | U.S. Steel | 2025-01-01 00:14:00 |
| 2 | 338543 | integrated-issuing-34 | 2024-07-25 | 2022-01-02 | 17 | entity | 101 | Nikola Corporation | 2025-02-06 03:14:00 |
| 3 | eb56fb15-2499-4b47-b59d-8319ca5ad273 | seasonal-issuing-35 | 2025-12-09 | 2023-06-13 | 19 | vessel | 102 | Oberthur Technologies | 2025-03-11 06:14:00 |
| 4 | ChIJEcyftPtt5kcRrhHB9SZ21dE | regional-issuing-36 | 2022-05-20 | 2024-11-24 | 17 | aircraft | 103 | General Telephone & Electronics | 2025-04-16 09:14:00 |

Sanctions lists constitute the authoritative registries against which screening tools evaluate transactions and counterparties. Each list carries a unique identifier, an issuing authority that may reference a governmental or corporate entity, and a defined validity period through effective_date and expiration_date fields. The record_count indicates the number of sanctioned entities contained within each list, with values ranging from 17 to 50 in the sample data.

The list_type field categorizes the nature of sanctioned entities — individual, entity, vessel, or aircraft — reflecting the diverse forms that sanctioned parties may take. An individual list targets specific persons, while entity, vessel, and aircraft lists address organizational and asset-based sanctions regimes. The issuing_authority values, such as extended-issuing-33 and integrated-issuing-34, identify the source of each list, and the created_at timestamp records when the list was first registered in the system.

**Table `regulatory_agencies`**

| agency_id | agency_name | jurisdiction | is_international | founded_year | enforcement_level | financial_institution_id |
|---|---|---|---|---|---|---|
| U.S. Steel | FSG Social Impact Advisors | regional-jurisdic-30 | false | 27 | national | 1000 |
| Nikola Corporation | Whirlpool Corporation | legacy-jurisdic-31 | true | 31 | regional | 1001 |
| Oberthur Technologies | Education Writers Association | compact-jurisdic-32 | false | 35 | global | 1002 |
| General Telephone & Electronics | Switch Card Services Ltd. | composite-jurisdic-33 | true | 39 | national | 1003 |

Regulatory agencies provide the oversight framework within which financial institutions must operate. Each agency is identified by an agency_id that may reference a corporate or institutional name — FSG Social Impact Advisors, Whirlpool Corporation, Education Writers Association, Switch Card Services Ltd. — and operates within a defined jurisdiction. The is_international flag distinguishes agencies with cross-border authority from those confined to domestic oversight, with Whirlpool Corporation and Switch Card Services Ltd. carrying international mandates.

Founded_year values ranging from 27 to 39 indicate the institutional age of these agencies, while enforcement_level — national, regional, or global — captures the scope of their regulatory reach. Education Writers Association stands as the sole global-enforcement agency in the sample, suggesting a particularly broad supervisory mandate. Each agency is linked to a financial institution through the financial_institution_id field, establishing the supervisory relationship that defines the compliance landscape.

**Table `compliance_trainings`**

| id | training_id | start_date | end_date | location | attendee_count | is_completed | follow_up_frequency | financial_institution_id | consultancy_team_id | sanctions_screening_tool_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1205-0002-M | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | extended-location-99 | 6 | false | weekly | 1000 | 1000 | 100 |
| 101 | c746bff2-8fcc-11eb-924d-9cd76263cbd0 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | integrated-location-100 | 23 | true | monthly | 1001 | 1001 | 101 |
| 102 | 34036cc6-9bad-11eb-a8a2-19ed5c03f8d3 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | seasonal-location-101 | 0 | false | none | 1002 | 1002 | 102 |
| 103 | 10207144 | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | regional-location-102 | 32 | true | weekly | 1003 | 1003 | 103 |

Compliance training programs ensure that personnel maintain the knowledge required to operate screening systems effectively. Each training record captures a start_date and end_date that define the program window, a location identifier, and an attendee_count that reflects the scale of participation. The is_completed flag indicates whether the training was successfully concluded, with Primary Cluster and Compact Initiative showing completed status while Adaptive Model and Composite Review D remain incomplete.

The follow_up_frequency field — weekly, monthly, none — captures the ongoing reinforcement schedule designed to maintain knowledge retention. Weekly follow-ups, as employed by Adaptive Model and Compact Initiative, suggest a more intensive training regimen compared to the monthly cadence used by Primary Cluster. The absence of follow-up for Composite Review D may indicate either a self-sustaining training model or a gap in the reinforcement process.

**Table `consultancy_teams`**

| id | team_id | vendor_name | primary_region | specialization | is_active | financial_institution_id | compliance_training_id | sanctions_screening_tool_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1450649 | Microsoft Corporation | extended-primary-75 | legacy-speciali-13 | true | 1000 | 100 | 100 |
| 1001 | 1437598 | PureCycle Technologies. | integrated-primary-76 | compact-speciali-14 | false | 1001 | 101 | 101 |
| 1002 | id_14 | American International Group | seasonal-primary-77 | composite-speciali-15 | true | 1002 | 102 | 102 |
| 1003 | 99701 | American Airlines Group | regional-primary-78 | primary-speciali-16 | false | 1003 | 103 | 103 |

Consultancy teams provide specialized expertise that supplements internal compliance capabilities. Each team is identified by a vendor_name — Microsoft Corporation, PureCycle Technologies., American International Group, American Airlines Group — and operates within a primary_region that defines its service geography. The specialization field, with values like legacy-speciali-13 and compact-speciali-14, indicates the domain expertise each vendor brings to the engagement.

The is_active flag distinguishes currently engaged vendors from those whose contracts have lapsed. Microsoft Corporation and American International Group remain active, while PureCycle Technologies. and American Airlines Group have concluded their engagements. This active/inactive distinction is critical for understanding which external resources are currently available to support screening operations.

The cross-referencing tables establish the relational structure that connects institutions to their regulatory environment.

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

The institutions_agencies table formalizes the supervisory relationships between financial institutions and regulatory agencies, creating a many-to-many mapping that reflects the complex reality of multi-jurisdictional oversight.

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

The tools_lists table links screening tools to the sanctions lists they monitor, ensuring that each tool's coverage is explicitly documented and traceable to its authoritative source.

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

The agencies_lists table connects regulatory agencies to the sanctions lists they issue or enforce, completing the chain from regulatory authority through list publication to operational screening.

The views derived from these base tables provide the analytical lenses through which practitioners examine the compliance ecosystem. Each view answers a specific operational question by joining related records into a unified perspective.

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

This view answers the question of which screening tool each financial institution employs and how that tool is configured. Reading the row for Adaptive Model reveals a web-based tool from legacy-provider-37 with a cost percentage of 0.11 and a compact-list-92 coverage, deployed over 15.20 months. The corresponding row for Compact Initiative shows a web-based tool from primary-provider-40 with a substantially higher cost percentage of 33.06 and adaptive-list-95 coverage, requiring 24.80 months for implementation. The contrast between these two institutions illustrates how tool selection varies dramatically based on jurisdictional requirements and risk appetite.

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

This self-referential view enables comparative analysis across institutions, allowing practitioners to evaluate compliance posture, tool deployment, and regulatory status side by side. The row for Primary Cluster reveals its non-compliant status alongside an on-premise deployment model and a cost percentage of 16.54, while Composite Review D's under-review status pairs with a hybrid model and the highest cost percentage in the sample at 25.47.

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

This view connects each financial institution to its overseeing regulatory agency, providing the supervisory context for compliance obligations. Adaptive Model is supervised by FSG Social Impact Advisors within regional-jurisdic-30, while Primary Cluster falls under Whirlpool Corporation, an international agency operating within legacy-jurisdic-31. The international designation for Whirlpool Corporation signals that Primary Cluster must satisfy regulatory requirements beyond its domestic jurisdiction.

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

Reversing the perspective, this view starts from the screening tool and identifies the institution that operates it. The tool from legacy-provider-37 serves Adaptive Model, while the compact-provider-38 tool supports Primary Cluster. This tool-centric view is particularly useful for vendors and auditors who need to understand the deployment footprint of a specific screening solution across multiple institutions.

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

This view links each screening tool to the sanctions list it monitors, providing direct traceability from operational tool to authoritative data source. The legacy-provider-37 tool monitors compact-list-92, while the composite-provider-39 tool covers primary-list-94. The list_coverage field in this view confirms that each tool is configured to screen against a specific regulatory dataset, and the is_auto_updating flag indicates whether that dataset is refreshed automatically.

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

This view identifies which consultancy team supports each screening tool deployment. Microsoft Corporation provides consultancy support for the legacy-provider-37 tool used by Adaptive Model, while PureCycle Technologies. supported the compact-provider-38 tool for Primary Cluster — though that engagement is now inactive. The specialization of each team, from legacy-speciali-13 to primary-speciali-16, indicates the domain expertise applied to the screening implementation.

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

This view presents the sanctions list from the list's perspective, identifying which screening tool monitors it. The list issued by extended-issuing-33 is monitored by the legacy-provider-37 tool, while the list from integrated-issuing-34 is covered by the compact-provider-38 tool. This perspective is valuable for list issuers who need to verify that their sanctions data is being actively screened.

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

This view connects each sanctions list to the regulatory agency that issues or enforces it. The list with record count 50 is associated with U.S. Steel, while the list with record count 17 is linked to Nikola Corporation. The issuing_authority field provides the authoritative source, and the list_type indicates whether the sanctioned entities are individuals, organizations, vessels, or aircraft.

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

This view presents the regulatory agency's perspective on the sanctions lists it oversees. FSG Social Impact Advisors oversees the list issued by extended-issuing-33, while Whirlpool Corporation supervises the list from integrated-issuing-34. The enforcement_level of each agency — national, regional, or global — determines the scope of its supervisory authority over the listed sanctions.

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

This view maps regulatory agencies to the financial institutions they supervise, providing a clear picture of the oversight landscape. FSG Social Impact Advisors supervises Adaptive Model within regional-jurisdic-30, while Education Writers Association oversees Composite Review D within compact-jurisdic-32. The is_international flag on Whirlpool Corporation and Switch Card Services Ltd. indicates that Primary Cluster and Compact Initiative face international regulatory scrutiny in addition to domestic requirements.

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

This view links compliance training programs to the institutions that participate in them. Adaptive Model participates in training program 1205-0002-M with 6 attendees at extended-location-99, while Primary Cluster's training c746bff2-8fcc-11eb-924d-9cd76263cbd0 enrolled 23 participants at integrated-location-100. The is_completed flag shows that Primary Cluster has finished its training while Adaptive Model has not, a distinction that may correlate with the non-compliant status of Primary Cluster and warrants further investigation.

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

This view connects training programs to the consultancy teams that deliver them. Microsoft Corporation delivers training to Adaptive Model, while PureCycle Technologies. provided training to Primary Cluster. The follow_up_frequency field — weekly for Microsoft Corporation's training and monthly for PureCycle Technologies.'s — indicates the reinforcement cadence built into each program.

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

This view ties training programs to the screening tools they cover, ensuring that personnel training aligns with the specific technology in use. The training delivered by Microsoft Corporation covers the legacy-provider-37 tool, while the training from PureCycle Technologies. addresses the compact-provider-38 tool. This alignment is critical for ensuring that training content matches the operational interface that staff must navigate.

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

This view presents the consultancy team's perspective on the institutions it serves. Microsoft Corporation serves Adaptive Model in extended-primary-75, while American International Group serves Composite Review D in seasonal-primary-77. The is_active flag distinguishes currently engaged teams from those whose contracts have concluded, and the specialization field indicates the domain expertise applied to each engagement.

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

This view links consultancy teams to the training programs they deliver, providing a complete picture of the external expertise deployed within the compliance infrastructure. Microsoft Corporation delivers training to Adaptive Model with weekly follow-ups, while PureCycle Technologies. provided training to Primary Cluster with monthly follow-ups. The attendee_count and is_completed fields capture the participation and completion status of each program.

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

This final view connects consultancy teams to the screening tools they support, completing the operational picture. Microsoft Corporation supports the legacy-provider-37 tool for Adaptive Model, while American International Group supports the composite-provider-39 tool for Composite Review D. The specialization of each team — from legacy-speciali-13 to primary-speciali-16 — indicates the domain expertise applied to the tool's configuration, maintenance, and optimization.

The sanctions compliance ecosystem is a tightly interwoven network of institutions, tools, lists, agencies, teams, and training programs. Each element serves a distinct function, yet the integrity of the entire system depends on the accuracy and completeness of the relationships between them. A screening tool without a current sanctions list is ineffective; a training program without alignment to the deployed tool fails to prepare personnel; a consultancy team without active status cannot provide support. The data captured in these records provides the evidence trail that auditors, regulators, and compliance officers rely upon to verify that the screening infrastructure operates as intended. Understanding the structure and content of these records is not merely an exercise in data literacy — it is a prerequisite for ensuring that financial institutions can meet their obligations to detect and report sanctioned activity with the precision that the regulatory framework demands.