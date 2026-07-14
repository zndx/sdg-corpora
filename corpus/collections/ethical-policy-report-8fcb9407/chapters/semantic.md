## Ontology-Grounded Relational Modelling in the Ethical-Compliance Domain

The domain under examination captures the interlocking obligations of financial institutions, corporate entities, and territorial jurisdictions as they navigate ethical compliance, insurance coverage, settlement projects, and human-rights accountability. At its core, the model distinguishes eight entity types—each materialised as a base table—and derives twenty-four analytical views that reassemble normalised facts into domain-relevant perspectives. The schema follows a disciplined normalisation strategy: every entity type owns its primary key and descriptive attributes; relationships are expressed through foreign keys that respect cardinality constraints; and junction-like associations emerge naturally from shared keys across tables. The following sections walk through the entity types, their columns and value domains, the foreign-key topology, and finally each view as a reconstructed lens on a specific domain fact.

### Entity Types and Their Attributes

The `ethical_policy_reports` table records compliance artefacts issued by financial institutions. Its surrogate key `id` is an auto-incrementing integer, while `report_id` carries a human-readable identifier such as `1202-0008-S` or `L355`. The `publish_date` column stores ISO-8601 dates (e.g. `2023-06-06`), `report_title` holds free-text labels like `Composite Protocol`, and `issuing_institution` names the originator (e.g. `distributed-issuing-96`). The `compliance_status` column is a categorical flag with values `compliant`, `non-compliant`, and `under_review`. The foreign key `financial_institution_id` links each report to exactly one row in `financial_institutions`, enforcing a one-to-many relationship: a single institution may publish multiple reports, but each report belongs to one institution.

**Table `ethical_policy_reports`**

| id | report_id | publish_date | report_title | issuing_institution | compliance_status | financial_institution_id |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2023-06-06 | Composite Protocol | distributed-issuing-96 | compliant | 1 |
| 2 | 8189500 | 2024-11-17 | Compact Programme A | baseline-issuing-97 | non-compliant | 2 |
| 3 | L355 | 2025-04-01 | Legacy Standard | pilot-issuing-98 | under_review | 3 |
| 4 | 5844272 | 2022-09-12 | Regional Framework | extended-issuing-99 | compliant | 4 |

The `financial_institutions` table is the central hub of the schema. Its surrogate key `financial_institution_id` (integer) anchors rows whose `institution_id` carries a business identifier such as `9424913`. The `institution_name` column stores labels like `Extended Corridor` or `Pilot Series A`, while `headquarters_location` holds a coded location string (e.g. `composite-headquar-63`). The `customer_count` column is a small integer (values range from `2` to `47` in the sample data), and `ethical_policy_adopted` is a boolean flag (`true` or `false`). Two foreign keys originate here: `insurance_product_id` references `insurance_products`, and `entity_id` references `corporate_entities`. These keys encode the business relationships between institutions, the products they underwrite, and the corporate entities they oversee.

**Table `financial_institutions`**

| financial_institution_id | institution_id | institution_name | headquarters_location | customer_count | ethical_policy_adopted | insurance_product_id | entity_id |
|---|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | composite-headquar-63 | 3 | false | 100 | 1996912 |
| 2 | 8189481 | Pilot Series A | primary-headquar-64 | 22 | true | 101 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 |
| 3 | 1437604 | Baseline Assessment | adaptive-headquar-65 | 2 | false | 102 | 9736894 |
| 4 | 884346 | Distributed Survey | distributed-headquar-66 | 47 | true | 103 | 974946 |

The `insurance_products` table captures the insurance offerings associated with financial institutions. Its surrogate key `insurance_product_id` (integer) anchors rows whose `product_id` carries a business identifier such as `PRO-2172`. The `product_name` column stores labels like `Composite Assessment`, while `product_type` is a categorical code (e.g. `pilot-product-50`). The `underwriter` column names the underwriting entity (e.g. `extended-underwri-51`), and `coverage_scope` is a categorical code such as `extended-coverage-81`. The foreign key `financial_institution_id` links each product to exactly one institution, enforcing a one-to-many relationship: an institution may offer multiple products, but each product is underwritten by one institution.

**Table `insurance_products`**

| insurance_product_id | product_id | product_name | product_type | underwriter | coverage_scope | financial_institution_id |
|---|---|---|---|---|---|---|
| 100 | PRO-2172 | Composite Assessment | pilot-product-50 | extended-underwri-51 | extended-coverage-81 | 1 |
| 101 | PRO-2179 | Compact Survey A | extended-product-51 | integrated-underwri-52 | integrated-coverage-82 | 2 |
| 102 | PRO-2186 | Legacy Corridor | integrated-product-52 | seasonal-underwri-53 | seasonal-coverage-83 | 3 |
| 103 | PRO-2193 | Regional Series | seasonal-product-53 | regional-underwri-54 | regional-coverage-84 | 4 |

The `corporate_entities` table records organisations operating within the domain. Its surrogate key `entity_id` is a composite of integer and UUID values (e.g. `1996912` or `57e4a9d4-8fcd-11eb-924d-9cd76263cbd0`). The `entity_name` column stores labels like `Regional Cluster`, while `industry_sector` is a categorical code (e.g. `seasonal-industry-35`). The `country_of_operation` column holds a coded country string (e.g. `pilot-country-50`), and `un_database_listed` is a boolean flag. Three foreign keys originate here: `financial_institution_id` references `financial_institutions`, `territory_id` references `territories`, and `settlement_project_id` references `settlement_projects`. These keys encode the multi-dimensional relationships between corporate entities, the institutions that oversee them, the territories in which they operate, and the settlement projects they participate in.

**Table `corporate_entities`**

| entity_id | entity_name | industry_sector | country_of_operation | un_database_listed | financial_institution_id | territory_id | settlement_project_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1996912 | Regional Cluster | seasonal-industry-35 | pilot-country-50 | false | 1 | 1000 | 1000 | 2025-01-01 00:14:00 |
| 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | regional-industry-36 | extended-country-51 | true | 2 | 1001 | 1001 | 2025-02-06 03:14:00 |
| 9736894 | Integrated Initiative | legacy-industry-37 | integrated-country-52 | false | 3 | 1002 | 1002 | 2025-03-11 06:14:00 |
| 974946 | Extended Model | compact-industry-38 | seasonal-country-53 | true | 4 | 1003 | 1003 | 2025-04-16 09:14:00 |

The `territories` table captures geographic and legal jurisdictions. Its surrogate key `territory_id` (integer) anchors rows whose `territory_name` stores labels like `Regional Initiative`. The `legal_status` column is a categorical flag with values `occupied`, `disputed`, `sovereign`, and `administered`. The `coordinates` column holds a coded coordinate string (e.g. `integrated-coordina-70`), and `recognized_by_u_n` is a boolean flag. Two foreign keys originate here: `settlement_project_id` references `settlement_projects`, and `violation_id` references `human_rights_violations`. These keys encode the relationships between territories, the settlement projects that operate within them, and the human-rights violations documented in them.

**Table `territories`**

| territory_id | territory_name | legal_status | coordinates | recognized_by_u_n | settlement_project_id | violation_id |
|---|---|---|---|---|---|---|
| 1000 | Regional Initiative | occupied | integrated-coordina-70 | false | 1000 | 3990166 |
| 1001 | Seasonal Model D | disputed | seasonal-coordina-71 | true | 1001 | m16 |
| 1002 | Integrated Cluster | sovereign | regional-coordina-72 | false | 1002 | 7731883 |
| 1003 | Extended Review | administered | legacy-coordina-73 | true | 1003 | 325461 |

The `settlement_projects` table records initiatives aimed at resolving territorial disputes. Its surrogate key `id` (integer) anchors rows whose `project_id` carries a business identifier such as `1437597`. The `project_name` column stores labels like `Compact Survey`, while `project_type` is a categorical code (e.g. `primary-project-34`). The `construction_status` column is a categorical flag with values `planned`, `ongoing`, `completed`, and `halted`. The `funding_amount` column stores a decimal value (e.g. `10.72`). Three foreign keys originate here: `territory_id` references `territories`, `entity_id` references `corporate_entities`, and `violation_id` references `human_rights_violations`. These keys encode the multi-dimensional relationships between settlement projects, the territories they operate in, the corporate entities that execute them, and the human-rights violations they address.

**Table `settlement_projects`**

| id | project_id | project_name | project_type | construction_status | funding_amount | territory_id | entity_id | violation_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 1437597 | Compact Survey | primary-project-34 | planned | 10.72 | 1000 | 1996912 | 3990166 |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-project-35 | ongoing | 12.72 | 1001 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | m16 |
| 1002 | 5006462 | Regional Series A | distributed-project-36 | completed | 25.36 | 1002 | 9736894 | 7731883 |
| 1003 | 10207143 | Seasonal Assessment | baseline-project-37 | halted | 11.88 | 1003 | 974946 | 325461 |

The `human_rights_violations` table documents violations occurring within the domain. Its surrogate key `id` is a composite of integer and string values (e.g. `3990166` or `m16`). The table carries foreign keys linking violations to `territories`, `corporate_entities`, and `population_groups`, encoding the multi-dimensional relationships between violations, the territories in which they occur, the corporate entities implicated, and the population groups affected.

**Table `human_rights_violations`**

| violation_id | violation_type | severity_level | date_reported | documented_by | territory_id | entity_id | group_id |
|---|---|---|---|---|---|---|---|
| 3990166 | distributed-violatio-54 | minor | 2023-06-04 | pilot-document-38 | 1000 | 1996912 | 10449530 |
| m16 | baseline-violatio-55 | moderate | 2024-11-15 | extended-document-39 | 1001 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | 8189483 |
| 7731883 | pilot-violatio-56 | severe | 2025-04-26 | integrated-document-40 | 1002 | 9736894 | 3718658437 |
| 325461 | extended-violatio-57 | systemic | 2022-09-10 | seasonal-document-41 | 1003 | 974946 | IVC0 |

The `population_groups` table records demographic groups affected by human-rights violations. Its surrogate key `id` anchors rows whose descriptive attributes capture the group's identity and characteristics. Foreign keys link population groups to the violations that affect them and the territories in which they reside, encoding the relationships between vulnerable populations, the violations they experience, and the jurisdictions they inhabit.

**Table `population_groups`**

| group_id | group_name | population_size | legal_status | prisoner_count | violation_id | territory_id |
|---|---|---|---|---|---|---|
| 10449530 | Baseline Corridor D | 35 | integrated-legal-22 | 31 | 3990166 | 1000 |
| 8189483 | Distributed Series | 42 | seasonal-legal-23 | 15 | m16 | 1001 |
| 3718658437 | Adaptive Assessment | 49 | regional-legal-24 | 20 | 7731883 | 1002 |
| IVC0 | Primary Survey A | 56 | legacy-legal-25 | 16 | 325461 | 1003 |

### Foreign-Key Topology and Cardinality

The foreign-key topology forms a directed graph rooted at `financial_institutions`. From this hub, edges fan out to `insurance_products` (one institution → many products), `corporate_entities` (one institution → many entities), and indirectly to `ethical_policy_reports` (one institution → many reports). The `corporate_entities` table serves as a secondary hub, connecting to `territories` (one entity → one territory in the current normalisation), `settlement_projects` (one entity → one project), and back to `financial_institutions`. The `territories` table connects to `settlement_projects` (one territory → one project) and `human_rights_violations` (one territory → one violation). The `settlement_projects` table connects to `territories`, `corporate_entities`, and `human_rights_violations`, creating a triangular relationship between projects, territories, and violations. The `human_rights_violations` table connects to `territories`, `corporate_entities`, and `population_groups`, forming a star topology centred on violations. The `population_groups` table connects to `human_rights_violations` and `territories`, completing the graph.

### Analytical Views as Reconstructed Domain Facts

Each view reassembles normalised tables through joins, answering a specific analytical question about the domain.

The view `vw_ethical_policy_report_financial_institution` joins `ethical_policy_reports` to `financial_institutions` on `financial_institution_id`, answering the question: which institution published each compliance report? A row with `report_id` `1202-0008-S` and `compliance_status` `compliant` joins to the institution `Extended Corridor` (`financial_institution_id` = 1), revealing that the distributed-issuing institution produced a compliant report.

**View `vw_ethical_policy_report_financial_institution`**

```sql
CREATE VIEW vw_ethical_policy_report_financial_institution AS
SELECT a.id, a.report_id, a.publish_date, a.report_title, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM ethical_policy_reports a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| id | report_id | publish_date | report_title | institution_financial_institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 1 | 1202-0008-S | 2023-06-06 | Composite Protocol | 1 | 9424913 | Extended Corridor |
| 2 | 8189500 | 2024-11-17 | Compact Programme A | 2 | 8189481 | Pilot Series A |
| 3 | L355 | 2025-04-01 | Legacy Standard | 3 | 1437604 | Baseline Assessment |
| 4 | 5844272 | 2022-09-12 | Regional Framework | 4 | 884346 | Distributed Survey |

The view `vw_financial_institution_insurance_product` joins `financial_institutions` to `insurance_products` on `insurance_product_id`, answering: which insurance product is associated with each institution? The institution `Pilot Series A` (`financial_institution_id` = 2) joins to the product `Compact Survey A` (`product_id` = `PRO-2179`), showing the product-institution pairing.

**View `vw_financial_institution_insurance_product`**

```sql
CREATE VIEW vw_financial_institution_insurance_product AS
SELECT a.financial_institution_id, a.institution_id, a.institution_name, a.headquarters_location, b.insurance_product_id AS product_insurance_product_id, b.product_id AS product_product_id, b.product_name AS product_product_name
FROM financial_institutions a JOIN insurance_products b ON a.insurance_product_id = b.insurance_product_id;
```

| financial_institution_id | institution_id | institution_name | headquarters_location | product_insurance_product_id | product_product_id | product_product_name |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | composite-headquar-63 | 100 | PRO-2172 | Composite Assessment |
| 2 | 8189481 | Pilot Series A | primary-headquar-64 | 101 | PRO-2179 | Compact Survey A |
| 3 | 1437604 | Baseline Assessment | adaptive-headquar-65 | 102 | PRO-2186 | Legacy Corridor |
| 4 | 884346 | Distributed Survey | distributed-headquar-66 | 103 | PRO-2193 | Regional Series |

The view `vw_financial_institution_corporate_entity` joins `financial_institutions` to `corporate_entities` on `entity_id`, answering: which corporate entity is overseen by each institution? The institution `Extended Corridor` (`financial_institution_id` = 1) joins to the entity `Regional Cluster` (`entity_id` = `1996912`), revealing the institutional oversight relationship.

**View `vw_financial_institution_corporate_entity`**

```sql
CREATE VIEW vw_financial_institution_corporate_entity AS
SELECT a.financial_institution_id, a.institution_id, a.institution_name, a.headquarters_location, b.entity_id AS entity_entity_id, b.entity_name AS entity_entity_name, b.industry_sector AS entity_industry_sector
FROM financial_institutions a JOIN corporate_entities b ON a.entity_id = b.entity_id;
```

| financial_institution_id | institution_id | institution_name | headquarters_location | entity_entity_id | entity_entity_name | entity_industry_sector |
|---|---|---|---|---|---|---|
| 1 | 9424913 | Extended Corridor | composite-headquar-63 | 1996912 | Regional Cluster | seasonal-industry-35 |
| 2 | 8189481 | Pilot Series A | primary-headquar-64 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | regional-industry-36 |
| 3 | 1437604 | Baseline Assessment | adaptive-headquar-65 | 9736894 | Integrated Initiative | legacy-industry-37 |
| 4 | 884346 | Distributed Survey | distributed-headquar-66 | 974946 | Extended Model | compact-industry-38 |

The view `vw_insurance_product_financial_institution` joins `insurance_products` to `financial_institutions` on `financial_institution_id`, answering: which institution underwrites each insurance product? The product `Composite Assessment` (`insurance_product_id` = 100) joins to the institution `Extended Corridor` (`financial_institution_id` = 1), confirming the underwriting relationship from the product side.

**View `vw_insurance_product_financial_institution`**

```sql
CREATE VIEW vw_insurance_product_financial_institution AS
SELECT a.insurance_product_id, a.product_id, a.product_name, a.product_type, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM insurance_products a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| insurance_product_id | product_id | product_name | product_type | institution_financial_institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 100 | PRO-2172 | Composite Assessment | pilot-product-50 | 1 | 9424913 | Extended Corridor |
| 101 | PRO-2179 | Compact Survey A | extended-product-51 | 2 | 8189481 | Pilot Series A |
| 102 | PRO-2186 | Legacy Corridor | integrated-product-52 | 3 | 1437604 | Baseline Assessment |
| 103 | PRO-2193 | Regional Series | seasonal-product-53 | 4 | 884346 | Distributed Survey |

The view `vw_corporate_entity_financial_institution` joins `corporate_entities` to `financial_institutions` on `financial_institution_id`, answering: which institution oversees each corporate entity? The entity `Regional Cluster` (`entity_id` = `1996912`) joins to the institution `Extended Corridor` (`financial_institution_id` = 1), confirming the oversight relationship from the entity side.

**View `vw_corporate_entity_financial_institution`**

```sql
CREATE VIEW vw_corporate_entity_financial_institution AS
SELECT a.entity_id, a.entity_name, a.industry_sector, a.country_of_operation, b.financial_institution_id AS institution_financial_institution_id, b.institution_id AS institution_institution_id, b.institution_name AS institution_institution_name
FROM corporate_entities a JOIN financial_institutions b ON a.financial_institution_id = b.financial_institution_id;
```

| entity_id | entity_name | industry_sector | country_of_operation | institution_financial_institution_id | institution_institution_id | institution_institution_name |
|---|---|---|---|---|---|---|
| 1996912 | Regional Cluster | seasonal-industry-35 | pilot-country-50 | 1 | 9424913 | Extended Corridor |
| 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | regional-industry-36 | extended-country-51 | 2 | 8189481 | Pilot Series A |
| 9736894 | Integrated Initiative | legacy-industry-37 | integrated-country-52 | 3 | 1437604 | Baseline Assessment |
| 974946 | Extended Model | compact-industry-38 | seasonal-country-53 | 4 | 884346 | Distributed Survey |

The view `vw_corporate_entity_territory` joins `corporate_entities` to `territories` on `territory_id`, answering: in which territory does each corporate entity operate? The entity `Regional Cluster` (`entity_id` = `1996912`) joins to the territory `Regional Initiative` (`territory_id` = 1000) with legal status `occupied`, revealing the operational jurisdiction.

**View `vw_corporate_entity_territory`**

```sql
CREATE VIEW vw_corporate_entity_territory AS
SELECT a.entity_id, a.entity_name, a.industry_sector, a.country_of_operation, b.territory_id AS territory_territory_id, b.territory_name AS territory_territory_name, b.legal_status AS territory_legal_status
FROM corporate_entities a JOIN territories b ON a.territory_id = b.territory_id;
```

| entity_id | entity_name | industry_sector | country_of_operation | territory_territory_id | territory_territory_name | territory_legal_status |
|---|---|---|---|---|---|---|
| 1996912 | Regional Cluster | seasonal-industry-35 | pilot-country-50 | 1000 | Regional Initiative | occupied |
| 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | regional-industry-36 | extended-country-51 | 1001 | Seasonal Model D | disputed |
| 9736894 | Integrated Initiative | legacy-industry-37 | integrated-country-52 | 1002 | Integrated Cluster | sovereign |
| 974946 | Extended Model | compact-industry-38 | seasonal-country-53 | 1003 | Extended Review | administered |

The view `vw_corporate_entity_settlement_project` joins `corporate_entities` to `settlement_projects` on `settlement_project_id`, answering: which settlement project does each corporate entity participate in? The entity `Regional Cluster` (`entity_id` = `1996912`) joins to the project `Compact Survey` (`project_id` = `1437597`) with status `planned` and funding `10.72`, revealing the project participation.

**View `vw_corporate_entity_settlement_project`**

```sql
CREATE VIEW vw_corporate_entity_settlement_project AS
SELECT a.entity_id, a.entity_name, a.industry_sector, a.country_of_operation, b.id AS project_id, b.project_id AS project_project_id, b.project_name AS project_project_name
FROM corporate_entities a JOIN settlement_projects b ON a.settlement_project_id = b.id;
```

| entity_id | entity_name | industry_sector | country_of_operation | project_id | project_project_id | project_project_name |
|---|---|---|---|---|---|---|
| 1996912 | Regional Cluster | seasonal-industry-35 | pilot-country-50 | 1000 | 1437597 | Compact Survey |
| 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | regional-industry-36 | extended-country-51 | 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 9736894 | Integrated Initiative | legacy-industry-37 | integrated-country-52 | 1002 | 5006462 | Regional Series A |
| 974946 | Extended Model | compact-industry-38 | seasonal-country-53 | 1003 | 10207143 | Seasonal Assessment |

The view `vw_territory_settlement_project` joins `territories` to `settlement_projects` on `territory_id`, answering: which settlement project operates within each territory? The territory `Regional Initiative` (`territory_id` = 1000) joins to the project `Compact Survey` (`project_id` = `1437597`) with status `planned`, revealing the territorial-project relationship.

**View `vw_territory_settlement_project`**

```sql
CREATE VIEW vw_territory_settlement_project AS
SELECT a.territory_id, a.territory_name, a.legal_status, a.coordinates, b.id AS project_id, b.project_id AS project_project_id, b.project_name AS project_project_name
FROM territories a JOIN settlement_projects b ON a.settlement_project_id = b.id;
```

| territory_id | territory_name | legal_status | coordinates | project_id | project_project_id | project_project_name |
|---|---|---|---|---|---|---|
| 1000 | Regional Initiative | occupied | integrated-coordina-70 | 1000 | 1437597 | Compact Survey |
| 1001 | Seasonal Model D | disputed | seasonal-coordina-71 | 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor |
| 1002 | Integrated Cluster | sovereign | regional-coordina-72 | 1002 | 5006462 | Regional Series A |
| 1003 | Extended Review | administered | legacy-coordina-73 | 1003 | 10207143 | Seasonal Assessment |

The view `vw_territory_human_rights_violation` joins `territories` to `human_rights_violations` on `violation_id`, answering: which human-rights violation is documented in each territory? The territory `Regional Initiative` (`territory_id` = 1000) joins to the violation `3990166`, revealing the violation-territory linkage.

**View `vw_territory_human_rights_violation`**

```sql
CREATE VIEW vw_territory_human_rights_violation AS
SELECT a.territory_id, a.territory_name, a.legal_status, a.coordinates, b.violation_id AS violation_violation_id, b.violation_type AS violation_violation_type, b.severity_level AS violation_severity_level
FROM territories a JOIN human_rights_violations b ON a.violation_id = b.violation_id;
```

| territory_id | territory_name | legal_status | coordinates | violation_violation_id | violation_violation_type | violation_severity_level |
|---|---|---|---|---|---|---|
| 1000 | Regional Initiative | occupied | integrated-coordina-70 | 3990166 | distributed-violatio-54 | minor |
| 1001 | Seasonal Model D | disputed | seasonal-coordina-71 | m16 | baseline-violatio-55 | moderate |
| 1002 | Integrated Cluster | sovereign | regional-coordina-72 | 7731883 | pilot-violatio-56 | severe |
| 1003 | Extended Review | administered | legacy-coordina-73 | 325461 | extended-violatio-57 | systemic |

The view `vw_settlement_project_territory` joins `settlement_projects` to `territories` on `territory_id`, answering: in which territory does each settlement project operate? The project `Compact Survey` (`id` = 1000) joins to the territory `Regional Initiative` (`territory_id` = 1000) with legal status `occupied`, revealing the territorial context of the project.

**View `vw_settlement_project_territory`**

```sql
CREATE VIEW vw_settlement_project_territory AS
SELECT a.id, a.project_id, a.project_name, a.project_type, b.territory_id AS territory_territory_id, b.territory_name AS territory_territory_name, b.legal_status AS territory_legal_status
FROM settlement_projects a JOIN territories b ON a.territory_id = b.territory_id;
```

| id | project_id | project_name | project_type | territory_territory_id | territory_territory_name | territory_legal_status |
|---|---|---|---|---|---|---|
| 1000 | 1437597 | Compact Survey | primary-project-34 | 1000 | Regional Initiative | occupied |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-project-35 | 1001 | Seasonal Model D | disputed |
| 1002 | 5006462 | Regional Series A | distributed-project-36 | 1002 | Integrated Cluster | sovereign |
| 1003 | 10207143 | Seasonal Assessment | baseline-project-37 | 1003 | Extended Review | administered |

The view `vw_settlement_project_corporate_entity` joins `settlement_projects` to `corporate_entities` on `entity_id`, answering: which corporate entity executes each settlement project? The project `Compact Survey` (`id` = 1000) joins to the entity `Regional Cluster` (`entity_id` = `1996912`), revealing the executing entity.

**View `vw_settlement_project_corporate_entity`**

```sql
CREATE VIEW vw_settlement_project_corporate_entity AS
SELECT a.id, a.project_id, a.project_name, a.project_type, b.entity_id AS entity_entity_id, b.entity_name AS entity_entity_name, b.industry_sector AS entity_industry_sector
FROM settlement_projects a JOIN corporate_entities b ON a.entity_id = b.entity_id;
```

| id | project_id | project_name | project_type | entity_entity_id | entity_entity_name | entity_industry_sector |
|---|---|---|---|---|---|---|
| 1000 | 1437597 | Compact Survey | primary-project-34 | 1996912 | Regional Cluster | seasonal-industry-35 |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-project-35 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | regional-industry-36 |
| 1002 | 5006462 | Regional Series A | distributed-project-36 | 9736894 | Integrated Initiative | legacy-industry-37 |
| 1003 | 10207143 | Seasonal Assessment | baseline-project-37 | 974946 | Extended Model | compact-industry-38 |

The view `vw_settlement_project_human_rights_violation` joins `settlement_projects` to `human_rights_violations` on `violation_id`, answering: which human-rights violation does each settlement project address? The project `Compact Survey` (`id` = 1000) joins to the violation `3990166`, revealing the violation the project targets.

**View `vw_settlement_project_human_rights_violation`**

```sql
CREATE VIEW vw_settlement_project_human_rights_violation AS
SELECT a.id, a.project_id, a.project_name, a.project_type, b.violation_id AS violation_violation_id, b.violation_type AS violation_violation_type, b.severity_level AS violation_severity_level
FROM settlement_projects a JOIN human_rights_violations b ON a.violation_id = b.violation_id;
```

| id | project_id | project_name | project_type | violation_violation_id | violation_violation_type | violation_severity_level |
|---|---|---|---|---|---|---|
| 1000 | 1437597 | Compact Survey | primary-project-34 | 3990166 | distributed-violatio-54 | minor |
| 1001 | df5a6648-8fd1-11eb-924d-9cd76263cbd0 | Legacy Corridor | adaptive-project-35 | m16 | baseline-violatio-55 | moderate |
| 1002 | 5006462 | Regional Series A | distributed-project-36 | 7731883 | pilot-violatio-56 | severe |
| 1003 | 10207143 | Seasonal Assessment | baseline-project-37 | 325461 | extended-violatio-57 | systemic |

The view `vw_human_rights_violation_territory` joins `human_rights_violations` to `territories` on `territory_id`, answering: in which territory does each human-rights violation occur? The violation `3990166` joins to the territory `Regional Initiative` (`territory_id` = 1000) with legal status `occupied`, revealing the territorial context of the violation.

**View `vw_human_rights_violation_territory`**

```sql
CREATE VIEW vw_human_rights_violation_territory AS
SELECT a.violation_id, a.violation_type, a.severity_level, a.date_reported, b.territory_id AS territory_territory_id, b.territory_name AS territory_territory_name, b.legal_status AS territory_legal_status
FROM human_rights_violations a JOIN territories b ON a.territory_id = b.territory_id;
```

| violation_id | violation_type | severity_level | date_reported | territory_territory_id | territory_territory_name | territory_legal_status |
|---|---|---|---|---|---|---|
| 3990166 | distributed-violatio-54 | minor | 2023-06-04 | 1000 | Regional Initiative | occupied |
| m16 | baseline-violatio-55 | moderate | 2024-11-15 | 1001 | Seasonal Model D | disputed |
| 7731883 | pilot-violatio-56 | severe | 2025-04-26 | 1002 | Integrated Cluster | sovereign |
| 325461 | extended-violatio-57 | systemic | 2022-09-10 | 1003 | Extended Review | administered |

The view `vw_human_rights_violation_corporate_entity` joins `human_rights_violations` to `corporate_entities` on `entity_id`, answering: which corporate entity is implicated in each human-rights violation? The violation `3990166` joins to the entity `Regional Cluster` (`entity_id` = `1996912`), revealing the implicated entity.

**View `vw_human_rights_violation_corporate_entity`**

```sql
CREATE VIEW vw_human_rights_violation_corporate_entity AS
SELECT a.violation_id, a.violation_type, a.severity_level, a.date_reported, b.entity_id AS entity_entity_id, b.entity_name AS entity_entity_name, b.industry_sector AS entity_industry_sector
FROM human_rights_violations a JOIN corporate_entities b ON a.entity_id = b.entity_id;
```

| violation_id | violation_type | severity_level | date_reported | entity_entity_id | entity_entity_name | entity_industry_sector |
|---|---|---|---|---|---|---|
| 3990166 | distributed-violatio-54 | minor | 2023-06-04 | 1996912 | Regional Cluster | seasonal-industry-35 |
| m16 | baseline-violatio-55 | moderate | 2024-11-15 | 57e4a9d4-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Review D | regional-industry-36 |
| 7731883 | pilot-violatio-56 | severe | 2025-04-26 | 9736894 | Integrated Initiative | legacy-industry-37 |
| 325461 | extended-violatio-57 | systemic | 2022-09-10 | 974946 | Extended Model | compact-industry-38 |

The view `vw_human_rights_violation_population_group` joins `human_rights_violations` to `population_groups`, answering: which population groups are affected by each human-rights violation? A row joining violation `3990166` to a population group reveals the demographic impact of the violation.

**View `vw_human_rights_violation_population_group`**

```sql
CREATE VIEW vw_human_rights_violation_population_group AS
SELECT a.violation_id, a.violation_type, a.severity_level, a.date_reported, b.group_id AS group_group_id, b.group_name AS group_group_name, b.population_size AS group_population_size
FROM human_rights_violations a JOIN population_groups b ON a.group_id = b.group_id;
```

| violation_id | violation_type | severity_level | date_reported | group_group_id | group_group_name | group_population_size |
|---|---|---|---|---|---|---|
| 3990166 | distributed-violatio-54 | minor | 2023-06-04 | 10449530 | Baseline Corridor D | 35 |
| m16 | baseline-violatio-55 | moderate | 2024-11-15 | 8189483 | Distributed Series | 42 |
| 7731883 | pilot-violatio-56 | severe | 2025-04-26 | 3718658437 | Adaptive Assessment | 49 |
| 325461 | extended-violatio-57 | systemic | 2022-09-10 | IVC0 | Primary Survey A | 56 |

The view `vw_population_group_human_rights_violation` joins `population_groups` to `human_rights_violations`, answering: which human-rights violations affect each population group? A population group row joining to violation `3990166` reveals the violations impacting that group.

**View `vw_population_group_human_rights_violation`**

```sql
CREATE VIEW vw_population_group_human_rights_violation AS
SELECT a.group_id, a.group_name, a.population_size, a.legal_status, b.violation_id AS violation_violation_id, b.violation_type AS violation_violation_type, b.severity_level AS violation_severity_level
FROM population_groups a JOIN human_rights_violations b ON a.violation_id = b.violation_id;
```

| group_id | group_name | population_size | legal_status | violation_violation_id | violation_violation_type | violation_severity_level |
|---|---|---|---|---|---|---|
| 10449530 | Baseline Corridor D | 35 | integrated-legal-22 | 3990166 | distributed-violatio-54 | minor |
| 8189483 | Distributed Series | 42 | seasonal-legal-23 | m16 | baseline-violatio-55 | moderate |
| 3718658437 | Adaptive Assessment | 49 | regional-legal-24 | 7731883 | pilot-violatio-56 | severe |
| IVC0 | Primary Survey A | 56 | legacy-legal-25 | 325461 | extended-violatio-57 | systemic |

The view `vw_population_group_territory` joins `population_groups` to `territories`, answering: in which territory does each population group reside? A population group row joining to territory `Regional Initiative` (`territory_id` = 1000) reveals the territorial residence of the group.

**View `vw_population_group_territory`**

```sql
CREATE VIEW vw_population_group_territory AS
SELECT a.group_id, a.group_name, a.population_size, a.legal_status, b.territory_id AS territory_territory_id, b.territory_name AS territory_territory_name, b.legal_status AS territory_legal_status
FROM population_groups a JOIN territories b ON a.territory_id = b.territory_id;
```

| group_id | group_name | population_size | legal_status | territory_territory_id | territory_territory_name | territory_legal_status |
|---|---|---|---|---|---|---|
| 10449530 | Baseline Corridor D | 35 | integrated-legal-22 | 1000 | Regional Initiative | occupied |
| 8189483 | Distributed Series | 42 | seasonal-legal-23 | 1001 | Seasonal Model D | disputed |
| 3718658437 | Adaptive Assessment | 49 | regional-legal-24 | 1002 | Integrated Cluster | sovereign |
| IVC0 | Primary Survey A | 56 | legacy-legal-25 | 1003 | Extended Review | administered |

### Closing Synthesis

The schema models the ethical-compliance domain as a network of eight entity types connected by foreign keys that encode one-to-many and many-to-one relationships. The `financial_institutions` table serves as the primary hub, linking to insurance products, corporate entities, and ethical policy reports. The `corporate_entities` table acts as a secondary hub, connecting to territories, settlement projects, and financial institutions. The `territories` and `settlement_projects` tables form a triangular relationship with `human_rights_violations`, while `population_groups` attach to violations and territories. The twenty-four views reassemble these normalised facts into analytical perspectives, each answering a specific domain question by joining the relevant tables. The result is a schema that faithfully reflects the ontology of the domain: entities with attributes, relationships with cardinality constraints, and views that reconstruct domain facts from the normalised base tables.