## Corporate Advisory Ecosystems

Organizations operating across distributed market segments require structured advisory relationships to navigate regulatory, financial, and communications complexities. The records maintained in this system capture the full spectrum of those relationships: the corporate entities themselves, the executives who lead them, and the external advisors—consultants, financial specialists, and communications professionals—who provide specialized services. Each organization maintains a primary executive, a designated consultant, a financial advisory firm, and a communications advisory firm, creating a four-pillar support structure. The data tracks not only who serves whom, but also the internal reporting hierarchies among executives and the cross-references that link every party to the organizations they represent.

**Table `corporate_entities`**

| id | legal_name | ticker_symbol | market_listing | headquarters_country | market_segment | corporate_executive_id | consultant_id | financial_advisor_id | communications_advisor_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Adaptive Model | composite-ticker-63 | compact-market-14 | regional-headquar-42 | primary-market-10 | 1 | 1 | 1000 | 100 |
| 2 | Primary Cluster | primary-ticker-64 | composite-market-15 | legacy-headquar-43 | adaptive-market-11 | 2 | 2 | 1001 | 101 |
| 3 | Composite Review D | adaptive-ticker-65 | primary-market-16 | compact-headquar-44 | distributed-market-12 | 3 | 3 | 1002 | 102 |
| 4 | Compact Initiative | distributed-ticker-66 | adaptive-market-17 | composite-headquar-45 | baseline-market-13 | 4 | 4 | 1003 | 103 |

The corporate_entities table forms the backbone of the registry. Each row identifies a distinct organization by its legal name and ticker symbol, situating it within a specific market listing, geographic headquarters, and market segment. Adaptive Model (ticker composite-ticker-63) operates on compact-market-14 with regional headquarters and a primary-market-10 classification. Primary Cluster (primary-ticker-64) sits on composite-market-15 under legacy-headquar-43 with an adaptive-market-11 segment. Composite Review D (adaptive-ticker-65) is headquartered at compact-headquar-44 on primary-market-16 within the distributed-market-12 segment. Compact Initiative (distributed-ticker-66) occupies composite-headquar-45 on adaptive-market-17 in the baseline-market-13 segment. The table also carries foreign-key columns—corporate_executive_id, consultant_id, financial_advisor_id, and communications_advisor_id—that point to the specific individuals and firms assigned to each organization.

**Table `corporate_executives`**

| corporate_executive_id | full_name | job_title | reporting_line | appointment_status | primary_domain | reports_to_corporate_executive_id | corporate_entity_id | holds_role_at_corporate_entity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | Primary Initiative A | pilot-reportin-32 | legacy-appointm-73 | compact-primary-92 | 1 | 1 | 1 |
| 2 | Account Name | Composite Model | extended-reportin-33 | compact-appointm-74 | composite-primary-93 | 2 | 2 | 2 |
| 3 | Saipan International Airport | Compact Cluster | integrated-reportin-34 | composite-appointm-75 | primary-primary-94 | 3 | 3 | 3 |
| 4 | Norma Fisher | Legacy Review D | seasonal-reportin-35 | primary-appointm-76 | adaptive-primary-95 | 4 | 4 | 4 |

Corporate executives are recorded in a separate table that captures their full names, job titles, reporting lines, appointment status, and primary domain of expertise. Theodore Mcgrath holds the title Primary Initiative A under pilot-reportin-32 with legacy-appointm-73 status in the compact-primary-92 domain. Account Name serves as Composite Model under extended-reportin-33 with compact-appointm-74 status in composite-primary-93. Saipan International Airport occupies Compact Cluster under integrated-reportin-34 with composite-appointm-75 status in primary-primary-94. Norma Fisher holds Legacy Review D under seasonal-reportin-35 with primary-appointm-76 status in adaptive-primary-95. The table includes a self-referential column, reports_to_corporate_executive_id, which establishes internal reporting hierarchies among executives, and two additional columns—corporate_entity_id and holds_role_at_corporate_entity_id—that link each executive back to the organizations they lead.

**Table `consultants`**

| id | consultant_name | service_type | contact_phone | advisor_role | corporate_entity_id | represents_corporate_entity_id |
|---|---|---|---|---|---|---|
| 1 | Legacy Protocol D | composite-service-81 | Joe Tsai | integrated-advisor-16 | 1 | 1 |
| 2 | Regional Programme | primary-service-82 | Stephanie Collins | seasonal-advisor-17 | 2 | 2 |
| 3 | Seasonal Standard | adaptive-service-83 | Tasha Rodriguez | regional-advisor-18 | 3 | 3 |
| 4 | Integrated Framework A | distributed-service-84 | Walter Pratt | legacy-advisor-19 | 4 | 4 |

Consultants provide specialized advisory services to corporate entities. The consultants table records each consultant's name, the type of service they deliver, a contact phone number, their designated advisor role, and the organizations they serve. Legacy Protocol D delivers composite-service-81, can be reached at Joe Tsai, and holds the integrated-advisor-16 role while serving corporate_entity_id 1 and representing corporate_entity_id 1. Regional Programme provides primary-service-82 through contact Stephanie Collins under the seasonal-advisor-17 designation for entity 2. Seasonal Standard offers adaptive-service-83 via Tasha Rodriguez as regional-advisor-18 for entity 3. Integrated Framework A supplies distributed-service-84 through Walter Pratt in the legacy-advisor-19 capacity for entity 4.

**Table `financial_advisors`**

| financial_advisor_id | advisor_firm_name | service_category | contact_phone | advisor_representative | corporate_entity_id | represents_corporate_entity_id |
|---|---|---|---|---|---|---|
| 1000 | Seasonal Corridor | seasonal-service-41 | Joe Tsai | integrated-advisor-88 | 1 | 1 |
| 1001 | Integrated Series | regional-service-42 | Stephanie Collins | seasonal-advisor-89 | 2 | 2 |
| 1002 | Extended Assessment D | legacy-service-43 | Tasha Rodriguez | regional-advisor-90 | 3 | 3 |
| 1003 | Pilot Survey | compact-service-44 | Walter Pratt | legacy-advisor-91 | 4 | 4 |

Financial advisory services are tracked through the financial_advisors table, which records the advisory firm name, service category, contact phone, the advisor representative, and the corporate entities served. Seasonal Corridor (financial_advisor_id 1000) provides seasonal-service-41, reachable at Joe Tsai, with integrated-advisor-88 representation for entity 1. Integrated Series (1001) delivers regional-service-42 through Stephanie Collins as seasonal-advisor-89 for entity 2. Extended Assessment D (1002) offers legacy-service-43 via Tasha Rodriguez under regional-advisor-90 for entity 3. Pilot Survey (1003) supplies compact-service-44 through Walter Pratt as legacy-advisor-91 for entity 4.

**Table `communications_advisors`**

| communications_advisor_id | pr_firm_name | service_category | contact_phone | pr_representative | corporate_entity_id | represents_corporate_entity_id |
|---|---|---|---|---|---|---|
| 100 | Distributed Standard | seasonal-service-41 | Joe Tsai | regional-pr-60 | 1 | 1 |
| 101 | Adaptive Framework D | regional-service-42 | Stephanie Collins | legacy-pr-61 | 2 | 2 |
| 102 | Primary Protocol | legacy-service-43 | Tasha Rodriguez | compact-pr-62 | 3 | 3 |
| 103 | Composite Programme | compact-service-44 | Walter Pratt | composite-pr-63 | 4 | 4 |

Communications advisory relationships are maintained in the communications_advisors table. Distributed Standard (communications_advisor_id 100) provides seasonal-service-41, contactable at Joe Tsai, with regional-pr-60 representation for entity 1. Adaptive Framework D (101) delivers regional-service-42 through Stephanie Collins as legacy-pr-61 for entity 2. Primary Protocol (102) offers legacy-service-43 via Tasha Rodriguez under compact-pr-62 for entity 3. Composite Programme (103) supplies compact-service-44 through Walter Pratt as composite-pr-63 for entity 4.

The base tables establish individual records, but the true operational picture emerges when these records are joined. The following views synthesize the relationships between corporate entities and their advisory partners, answering specific operational questions about who serves which organization and how those assignments are structured.

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

This view joins corporate_entities with corporate_executives on the corporate_executive_id field, producing a consolidated record that pairs each organization with its assigned executive. The join answers the question: which executive is formally assigned to which corporate entity? Row 1 shows that Adaptive Model (id 1, ticker composite-ticker-63) is served by executive Theodore Mcgrath (executive_corporate_executive_id 1) whose job title is Primary Initiative A. Row 2 links Primary Cluster (primary-ticker-64) to Account Name (executive_corporate_executive_id 2) with the title Composite Model. Row 3 associates Composite Review D (adaptive-ticker-65) with Saipan International Airport (executive_corporate_executive_id 3) titled Compact Cluster. Row 4 connects Compact Initiative (distributed-ticker-66) to Norma Fisher (executive_corporate_executive_id 4) holding Legacy Review D.

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

This view joins corporate_entities with consultants, matching each organization to its designated consultant. The resulting rows answer: which consultant is assigned to which corporate entity? Row 1 pairs Adaptive Model (id 1) with Legacy Protocol D, a provider of composite-service-81. Row 2 links Primary Cluster (id 2) to Regional Programme, which delivers primary-service-82. Row 3 associates Composite Review D (id 3) with Seasonal Standard, offering adaptive-service-83. Row 4 connects Compact Initiative (id 4) to Integrated Framework A, a distributed-service-84 provider.

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

This view joins corporate_entities with financial_advisors, producing rows that answer which financial advisory firm serves which organization. Row 1 shows Adaptive Model (id 1) is served by Seasonal Corridor (financial_advisor_id 1000), a seasonal-service-41 provider. Row 2 links Primary Cluster (id 2) to Integrated Series (1001), delivering regional-service-42. Row 3 associates Composite Review D (id 3) with Extended Assessment D (1002), a legacy-service-43 provider. Row 4 connects Compact Initiative (id 4) to Pilot Survey (1003), which supplies compact-service-44.

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

This view joins corporate_entities with communications_advisors, answering which communications advisory firm is assigned to each organization. Row 1 shows Adaptive Model (id 1) is served by Distributed Standard (communications_advisor_id 100), a seasonal-service-41 provider. Row 2 links Primary Cluster (id 2) to Adaptive Framework D (101), delivering regional-service-42. Row 3 associates Composite Review D (id 3) with Primary Protocol (102), a legacy-service-43 provider. Row 4 connects Compact Initiative (id 4) to Composite Programme (103), which supplies compact-service-44.

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

This view joins corporate_executives with themselves on the reports_to_corporate_executive_id column, revealing the internal reporting hierarchy among executives. Each row shows an executive alongside the executive they report to. Row 1 indicates that Theodore Mcgrath (corporate_executive_id 1) reports to corporate_executive_id 1, suggesting a self-referential or top-level reporting structure. Row 2 shows Account Name (corporate_executive_id 2) reports to corporate_executive_id 2, also self-referential. Row 3 places Saipan International Airport (corporate_executive_id 3) as reporting to corporate_executive_id 3. Row 4 has Norma Fisher (corporate_executive_id 4) reporting to corporate_executive_id 4. The data suggests each executive currently occupies a self-contained reporting node, though the structure supports deeper hierarchical chains.

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

This view joins corporate_executives with corporate_entities, answering which corporate entity each executive is formally associated with. Row 1 shows Theodore Mcgrath (corporate_executive_id 1) is linked to corporate_entity_id 1, which is Adaptive Model. Row 2 links Account Name (corporate_executive_id 2) to corporate_entity_id 2, Primary Cluster. Row 3 associates Saipan International Airport (corporate_executive_id 3) with corporate_entity_id 3, Composite Review D. Row 4 connects Norma Fisher (corporate_executive_id 4) to corporate_entity_id 4, Compact Initiative. The alignment confirms a one-to-one mapping between executives and the entities they lead.

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

This view joins consultants with corporate_entities, answering which corporate entity each consultant serves. Row 1 shows Legacy Protocol D (id 1) serves corporate_entity_id 1, Adaptive Model. Row 2 links Regional Programme (id 2) to corporate_entity_id 2, Primary Cluster. Row 3 associates Seasonal Standard (id 3) with corporate_entity_id 3, Composite Review D. Row 4 connects Integrated Framework A (id 4) to corporate_entity_id 4, Compact Initiative. The data confirms each consultant is assigned to a single corporate entity.

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

This view joins financial_advisors with corporate_entities, answering which corporate entity each financial advisory firm serves. Row 1 shows Seasonal Corridor (financial_advisor_id 1000) serves corporate_entity_id 1, Adaptive Model. Row 2 links Integrated Series (1001) to corporate_entity_id 2, Primary Cluster. Row 3 associates Extended Assessment D (1002) with corporate_entity_id 3, Composite Review D. Row 4 connects Pilot Survey (1003) to corporate_entity_id 4, Compact Initiative. Each financial advisory firm maintains a single-entity assignment.

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

This view joins communications_advisors with corporate_entities, answering which corporate entity each communications advisory firm serves. Row 1 shows Distributed Standard (communications_advisor_id 100) serves corporate_entity_id 1, Adaptive Model. Row 2 links Adaptive Framework D (101) to corporate_entity_id 2, Primary Cluster. Row 3 associates Primary Protocol (102) with corporate_entity_id 3, Composite Review D. Row 4 connects Composite Programme (103) to corporate_entity_id 4, Compact Initiative. Each communications advisory firm is assigned to exactly one corporate entity.

The advisory ecosystem captured in these records presents a tightly coupled structure: each corporate entity has one executive, one consultant, one financial advisory firm, and one communications advisory firm, all aligned in a single-entity-per-advisor pattern. The executive reporting structure, while currently self-referential in the available data, is designed to support deeper hierarchical chains. The views provide operational clarity by collapsing the relationships into readable pairings, enabling practitioners to answer questions about assignment coverage, service type distribution, and organizational alignment at a glance. The system's design ensures that any corporate entity can be traced through its full advisory chain—from executive leadership through consultant, financial, and communications support—within a single query path.