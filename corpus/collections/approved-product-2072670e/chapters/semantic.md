## Ontology-Grounded Relational Modelling of Product Approval and Surveillance

The domain under examination concerns the lifecycle of industrial products as they move through a regulated approval ecosystem. A product is manufactured by an entity, evaluated against a technical standard, and certified by a regulatory authority. Post-approval, the product enters a surveillance regime in which periodic audits verify continued compliance. The ontology behind this domain distinguishes four core entity types—`approved_products`, `approval_standards`, `approving_authorities`, and `manufacturers`—and a fifth, event-type entity, `surveillance_audits`, that records discrete compliance checks. Three many-to-many relationships bind these entities: a product may be approved by multiple authorities, a standard may be referenced by multiple authorities, and a manufacturer may produce multiple products. The relational schema materialises these concepts through five base tables holding entity attributes, three junction tables encoding the many-to-many links, and a suite of denormalised views that reconstruct domain facts for reporting.

**Table `approved_products`**

| id | product_identifier | product_name | nominal_size_range | service_condition | material_type | approval_status | approval_standard_id | approving_authority_id | manufacturer_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2322 | Composite Assessment | distributed-nominal-30 | seasonal-service-59 | adaptive-material-71 | Approved | 1 | 1 | 1 |
| 2 | PRO-2324 | Compact Survey A | baseline-nominal-31 | regional-service-60 | distributed-material-72 | Pending | 2 | 2 | 2 |
| 3 | PRO-2326 | Legacy Corridor | pilot-nominal-32 | legacy-service-61 | baseline-material-73 | Suspended | 3 | 3 | 3 |
| 4 | PRO-2328 | Regional Series | extended-nominal-33 | compact-service-62 | pilot-material-74 | Revoked | 4 | 4 | 4 |

The `approved_products` table is the central entity. Each row represents a single product that has undergone the approval process. The surrogate key `id` (values 1 through 4) is opaque; the business key `product_identifier` carries human-readable codes such as `PRO-2322` and `PRO-2324`. The `product_name` column stores descriptive labels like `Composite Assessment` and `Compact Survey A`. Three categorical attributes—`nominal_size_range`, `service_condition`, and `material_type`—encode product specifications using controlled vocabulary values such as `distributed-nominal-30`, `seasonal-service-59`, and `adaptive-material-71`. The `approval_status` column is a state machine with values `Approved`, `Pending`, `Suspended`, and `Revoked`; row 1 is `Approved` while row 3 is `Suspended`. Three foreign keys anchor the product to its regulatory context: `approval_standard_id` points to `approval_standards`, `approving_authority_id` points to `approving_authorities`, and `manufacturer_id` points to `manufacturers`. In the sample data each product references a single row in each of those tables (e.g., row 1 references standard 1, authority 1, and manufacturer 1), but the existence of the junction table `authorities_products` indicates that the intended cardinality is many-to-many: a product can be approved by multiple authorities and a standard can be cited by multiple products.

**Table `approval_standards`**

| approval_standard_id | standard_code | standard_title | publication_date | issuing_organization | version_number | supersedes_approval_standard_id | is_superseded_by_approval_standard_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | L459 | Primary Standard A | 2025-12-01 | Alphabet Inc Class A | VER-2245 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | account_pymes_596 | Composite Framework | 2022-05-12 | ITT Industries | VER-2249 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | 9125613 | Compact Protocol | 2023-10-23 | Switch Card Services Ltd. | VER-2253 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | 8189504 | Legacy Programme D | 2024-03-07 | Buypass AS | VER-2257 | 4 | 4 | 2025-04-16 09:14:00 |

The `approval_standards` table stores the technical specifications against which products are evaluated. Its surrogate key `approval_standard_id` (1–4) is referenced by `approved_products.approval_standard_id` and by `surveillance_audits.approval_standard_id`. The business key `standard_code` carries codes such as `L459` and `account_pymes_596`. The `standard_title` column holds human-readable names like `Primary Standard A` and `Composite Framework`. The `publication_date` column (e.g., `2025-12-01`) and `issuing_organization` column (e.g., `Alphabet Inc Class A`, `ITT Industries`) provide provenance. The `version_number` column (e.g., `VER-2245`) tracks revisions. Two self-referencing foreign keys—`supersedes_approval_standard_id` and `is_superseded_by_approval_standard_id`—model the standard-versioning relationship: a standard may supersede a predecessor and may itself be superseded by a successor. In the sample data each standard references itself in both columns (e.g., standard 1 has `supersedes_approval_standard_id = 1`), which in a production system would point to distinct rows to form a chain of supersession. The `created_at` timestamp (e.g., `2025-01-01 00:14:00`) records when the standard record was inserted.

**Table `approving_authorities`**

| approving_authority_id | authority_name | authority_type | jurisdiction | contact_address | authorization_level |
|---|---|---|---|---|---|
| 1 | Sean Green | CertificationBody | regional-jurisdic-30 | Kimberly Maynard | National |
| 2 | Elizabeth Woods | RegulatoryAgency | legacy-jurisdic-31 | Theodore Mcgrath | International |
| 3 | Kimberly Smith | StandardsOrganization | compact-jurisdic-32 | Susan Levy | Regional |
| 4 | Kimberly Smith | CertificationBody | composite-jurisdic-33 | Haruki Murakami | National |

The `approving_authorities` table models the regulatory bodies that grant product approvals. Its surrogate key `approving_authority_id` (1–4) is referenced by `approved_products.approving_authority_id`, by `manufacturers.approving_authority_id`, and by `surveillance_audits.approving_authority_id`. The `authority_name` column stores names such as `Sean Green` and `Elizabeth Woods`. The `authority_type` column is categorical with values `CertificationBody`, `RegulatoryAgency`, and `StandardsOrganization`. The `jurisdiction` column (e.g., `regional-jurisdic-30`, `legacy-jurisdic-31`) and `contact_address` column (e.g., `Kimberly Maynard`, `Theodore Mcgrath`) provide geographic and contact context. The `authorization_level` column carries values `National`, `International`, and `Regional`, indicating the scope of the authority's certification power.

**Table `manufacturers`**

| id | manufacturer_name | legal_form | registered_address | country_of_origin | registration_number | approving_authority_id |
|---|---|---|---|---|---|---|
| 1 | National Institute of Standards and Technology | Corporation | regional-register-36 | compact-country-80 | REG-2136 | 1 |
| 2 | Interac Association | Partnership | legacy-register-37 | composite-country-81 | REG-2142 | 2 |
| 3 | Dow Chemical | SoleProprietorship | compact-register-38 | primary-country-82 | REG-2148 | 3 |
| 4 | McDonnell Douglas | Corporation | composite-register-39 | adaptive-country-83 | REG-2154 | 4 |

The `manufacturers` table holds the entities that produce the approved products. Its surrogate key `id` (1–4) is referenced by `approved_products.manufacturer_id`. The `manufacturer_name` column stores names such as `National Institute of Standards and Technology` and `Interac Association`. The `legal_form` column is categorical with values `Corporation`, `Partnership`, and `SoleProprietorship`. The `registered_address` column (e.g., `regional-register-36`) and `country_of_origin` column (e.g., `compact-country-80`) provide location data. The `registration_number` column (e.g., `REG-2136`) is a business key. The foreign key `approving_authority_id` links each manufacturer to the regulatory authority that oversees it; for example, manufacturer 1 references authority 1, and manufacturer 4 references authority 4.

**Table `surveillance_audits`**

| id | audit_identifier | audit_date | audit_outcome | auditor_name | findings_count | next_audit_due | approved_product_id | approving_authority_id | approval_standard_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | AUD-2349 | 2025-12-04T23:33:00 | Pass | Compact Initiative | 2 | 2025-04-05 | 1 | 1 | 1 |
| 101 | AUD-2353 | 2022-05-15T06:50:00 | Fail | Legacy Model | 33 | 2022-09-16 | 2 | 2 | 2 |
| 102 | AUD-2357 | 2023-10-26T13:07:00 | ConditionalPass | Regional Cluster A | 23 | 2023-02-27 | 3 | 3 | 3 |
| 103 | AUD-2361 | 2024-03-10T20:24:00 | Pending | Seasonal Review | 0 | 2024-07-11 | 4 | 4 | 4 |

The `surveillance_audits` table records discrete compliance audit events. Its surrogate key `id` (100–103) is opaque; the business key `audit_identifier` carries codes such as `AUD-2349` and `AUD-2353`. The `audit_date` column stores ISO timestamps like `2025-12-04T23:33:00`. The `audit_outcome` column is a state machine with values `Pass`, `Fail`, `ConditionalPass`, and `Pending`; audit 100 is `Pass` while audit 101 is `Fail`. The `auditor_name` column (e.g., `Compact Initiative`, `Legacy Model`) names the auditing entity. The `findings_count` column (e.g., `2`, `33`, `0`) quantifies non-conformities discovered. The `next_audit_due` column (e.g., `2025-04-05`) schedules the follow-up. Three foreign keys tie the audit to its subject: `approved_product_id` references `approved_products`, `approving_authority_id` references `approving_authorities`, and `approval_standard_id` references `approval_standards`. In the sample data each audit references a single row in each table (e.g., audit 100 references product 1, authority 1, and standard 1).

**Table `authorities_products`**

| approving_authority_id | approved_product_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The junction table `authorities_products` resolves the many-to-many relationship between `approving_authorities` and `approved_products`. Its composite primary key consists of `approving_authority_id` and `approved_product_id`. The eight rows in the sample data show that authority 1 approves products 1 and 2, authority 2 approves products 2 and 3, authority 3 approves products 3 and 4, and authority 4 approves products 4 and 1. This cross-linking confirms that the single `approving_authority_id` column in `approved_products` is a denormalised convenience column; the authoritative relationship is stored in the junction table.

**Table `authorities_standards`**

| approving_authority_id | approval_standard_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The junction table `authorities_standards` resolves the many-to-many relationship between `approving_authorities` and `approval_standards`. Its composite primary key consists of `approving_authority_id` and `approval_standard_id`. Each row asserts that a given authority references a given standard in its regulatory framework.

**Table `manufacturers_products`**

| manufacturer_id | approved_product_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The junction table `manufacturers_products` resolves the many-to-many relationship between `manufacturers` and `approved_products`. Its composite primary key consists of `manufacturer_id` and `approved_product_id`. Each row asserts that a given manufacturer produces a given product.

The base tables above constitute the normalised core of the schema. The views materialise denormalised joins that answer specific domain questions by reconstructing facts from the normalised tables.

**View `v_approved_product_approval_standard`**

```sql
CREATE VIEW v_approved_product_approval_standard AS
SELECT a.id, a.product_identifier, a.product_name, a.nominal_size_range, b.approval_standard_id AS standard_approval_standard_id, b.standard_code AS standard_standard_code, b.standard_title AS standard_standard_title
FROM approved_products a JOIN approval_standards b ON a.approval_standard_id = b.approval_standard_id;
```

| id | product_identifier | product_name | nominal_size_range | standard_approval_standard_id | standard_standard_code | standard_standard_title |
|---|---|---|---|---|---|---|
| 1 | PRO-2322 | Composite Assessment | distributed-nominal-30 | 1 | L459 | Primary Standard A |
| 2 | PRO-2324 | Compact Survey A | baseline-nominal-31 | 2 | account_pymes_596 | Composite Framework |
| 3 | PRO-2326 | Legacy Corridor | pilot-nominal-32 | 3 | 9125613 | Compact Protocol |
| 4 | PRO-2328 | Regional Series | extended-nominal-33 | 4 | 8189504 | Legacy Programme D |

The view `v_approved_product_approval_standard` joins `approved_products` to `approval_standards` on `approved_products.approval_standard_id = approval_standards.approval_standard_id`. It answers the question: "For each approved product, what is the applicable standard and its metadata?" Reading row 1 of the view, product `PRO-2322` (`Composite Assessment`) is evaluated against standard `L459` (`Primary Standard A`), published on `2025-12-01` by `Alphabet Inc Class A`. Row 2 shows product `PRO-2324` (`Compact Survey A`) against standard `account_pymes_596` (`Composite Framework`), published on `2022-05-12` by `ITT Industries`.

**View `v_approved_product_approving_authority`**

```sql
CREATE VIEW v_approved_product_approving_authority AS
SELECT a.id, a.product_identifier, a.product_name, a.nominal_size_range, b.approving_authority_id AS authority_approving_authority_id, b.authority_name AS authority_authority_name, b.authority_type AS authority_authority_type
FROM approved_products a JOIN approving_authorities b ON a.approving_authority_id = b.approving_authority_id;
```

| id | product_identifier | product_name | nominal_size_range | authority_approving_authority_id | authority_authority_name | authority_authority_type |
|---|---|---|---|---|---|---|
| 1 | PRO-2322 | Composite Assessment | distributed-nominal-30 | 1 | Sean Green | CertificationBody |
| 2 | PRO-2324 | Compact Survey A | baseline-nominal-31 | 2 | Elizabeth Woods | RegulatoryAgency |
| 3 | PRO-2326 | Legacy Corridor | pilot-nominal-32 | 3 | Kimberly Smith | StandardsOrganization |
| 4 | PRO-2328 | Regional Series | extended-nominal-33 | 4 | Kimberly Smith | CertificationBody |

The view `v_approved_product_approving_authority` joins `approved_products` to `approving_authorities` on `approved_products.approving_authority_id = approving_authorities.approving_authority_id`. It answers: "Which authority approved each product, and what is that authority's scope?" Row 1 shows product `PRO-2322` approved by authority `Sean Green` (`CertificationBody`) operating at `National` level within `regional-jurisdic-30`. Row 3 shows product `PRO-2326` (`Legacy Corridor`) approved by authority `Kimberly Smith` (`StandardsOrganization`) at `Regional` level within `compact-jurisdic-32`.

**View `v_approved_product_manufacturer`**

```sql
CREATE VIEW v_approved_product_manufacturer AS
SELECT a.id, a.product_identifier, a.product_name, a.nominal_size_range, b.id AS manufacturer_id, b.manufacturer_name AS manufacturer_manufacturer_name, b.legal_form AS manufacturer_legal_form
FROM approved_products a JOIN manufacturers b ON a.manufacturer_id = b.id;
```

| id | product_identifier | product_name | nominal_size_range | manufacturer_id | manufacturer_manufacturer_name | manufacturer_legal_form |
|---|---|---|---|---|---|---|
| 1 | PRO-2322 | Composite Assessment | distributed-nominal-30 | 1 | National Institute of Standards and Technology | Corporation |
| 2 | PRO-2324 | Compact Survey A | baseline-nominal-31 | 2 | Interac Association | Partnership |
| 3 | PRO-2326 | Legacy Corridor | pilot-nominal-32 | 3 | Dow Chemical | SoleProprietorship |
| 4 | PRO-2328 | Regional Series | extended-nominal-33 | 4 | McDonnell Douglas | Corporation |

The view `v_approved_product_manufacturer` joins `approved_products` to `manufacturers` on `approved_products.manufacturer_id = manufacturers.id`. It answers: "Which manufacturer produced each approved product, and where is it registered?" Row 1 shows product `PRO-2322` manufactured by `National Institute of Standards and Technology` (a `Corporation` in `compact-country-80`). Row 4 shows product `PRO-2328` (`Regional Series`) manufactured by `McDonnell Douglas` (a `Corporation` in `adaptive-country-83`).

**View `v_approval_standard_approval_standard`**

```sql
CREATE VIEW v_approval_standard_approval_standard AS
SELECT a.approval_standard_id, a.standard_code, a.standard_title, a.publication_date, b.approval_standard_id AS standard_approval_standard_id, b.standard_code AS standard_standard_code, b.standard_title AS standard_standard_title
FROM approval_standards a JOIN approval_standards b ON a.supersedes_approval_standard_id = b.approval_standard_id;
```

| approval_standard_id | standard_code | standard_title | publication_date | standard_approval_standard_id | standard_standard_code | standard_standard_title |
|---|---|---|---|---|---|---|
| 1 | L459 | Primary Standard A | 2025-12-01 | 1 | L459 | Primary Standard A |
| 2 | account_pymes_596 | Composite Framework | 2022-05-12 | 2 | account_pymes_596 | Composite Framework |
| 3 | 9125613 | Compact Protocol | 2023-10-23 | 3 | 9125613 | Compact Protocol |
| 4 | 8189504 | Legacy Programme D | 2024-03-07 | 4 | 8189504 | Legacy Programme D |

The view `v_approval_standard_approval_standard` performs a self-join on `approval_standards`, linking `approval_standards.supersedes_approval_standard_id` to `approval_standards.approval_standard_id` and `approval_standards.is_superseded_by_approval_standard_id` to the same table. It answers: "How do standards supersede one another?" In the sample data each standard references itself, so the view would show standard `L459` (`Primary Standard A`) as both superseding and being superseded by itself; in production, this view would reveal chains such as standard 2 superseding standard 1 and being superseded by standard 3.

**View `v_approving_authority_approved_product_detail`**

```sql
CREATE VIEW v_approving_authority_approved_product_detail AS
SELECT a.approving_authority_id, a.authority_name, a.authority_type, b.id AS product_id, b.product_identifier AS product_product_identifier, b.product_name AS product_product_name
FROM approving_authorities a
  JOIN authorities_products j ON j.approving_authority_id = a.approving_authority_id
  JOIN approved_products b ON b.id = j.approved_product_id;
```

| approving_authority_id | authority_name | authority_type | product_id | product_product_identifier | product_product_name |
|---|---|---|---|---|---|
| 1 | Sean Green | CertificationBody | 1 | PRO-2322 | Composite Assessment |
| 1 | Sean Green | CertificationBody | 2 | PRO-2324 | Compact Survey A |
| 2 | Elizabeth Woods | RegulatoryAgency | 2 | PRO-2324 | Compact Survey A |
| 2 | Elizabeth Woods | RegulatoryAgency | 3 | PRO-2326 | Legacy Corridor |
| 3 | Kimberly Smith | StandardsOrganization | 3 | PRO-2326 | Legacy Corridor |
| 3 | Kimberly Smith | StandardsOrganization | 4 | PRO-2328 | Regional Series |
| 4 | Kimberly Smith | CertificationBody | 4 | PRO-2328 | Regional Series |
| 4 | Kimberly Smith | CertificationBody | 1 | PRO-2322 | Composite Assessment |

The view `v_approving_authority_approved_product_detail` joins `approving_authorities` to `approved_products` on `approving_authorities.approving_authority_id = approved_products.approving_authority_id`. It answers: "Which products has each authority approved, and what are their details?" Row 1 shows authority `Sean Green` (`CertificationBody`, `National` level) having approved product `PRO-2322` (`Composite Assessment`, status `Approved`). Row 2 shows authority `Elizabeth Woods` (`RegulatoryAgency`, `International` level) having approved product `PRO-2324` (`Compact Survey A`, status `Pending`).

**View `v_approving_authority_approval_standard_detail`**

```sql
CREATE VIEW v_approving_authority_approval_standard_detail AS
SELECT a.approving_authority_id, a.authority_name, a.authority_type, b.approval_standard_id AS standard_approval_standard_id, b.standard_code AS standard_standard_code, b.standard_title AS standard_standard_title
FROM approving_authorities a
  JOIN authorities_standards j ON j.approving_authority_id = a.approving_authority_id
  JOIN approval_standards b ON b.approval_standard_id = j.approval_standard_id;
```

| approving_authority_id | authority_name | authority_type | standard_approval_standard_id | standard_standard_code | standard_standard_title |
|---|---|---|---|---|---|
| 1 | Sean Green | CertificationBody | 1 | L459 | Primary Standard A |
| 1 | Sean Green | CertificationBody | 2 | account_pymes_596 | Composite Framework |
| 2 | Elizabeth Woods | RegulatoryAgency | 2 | account_pymes_596 | Composite Framework |
| 2 | Elizabeth Woods | RegulatoryAgency | 3 | 9125613 | Compact Protocol |
| 3 | Kimberly Smith | StandardsOrganization | 3 | 9125613 | Compact Protocol |
| 3 | Kimberly Smith | StandardsOrganization | 4 | 8189504 | Legacy Programme D |
| 4 | Kimberly Smith | CertificationBody | 4 | 8189504 | Legacy Programme D |
| 4 | Kimberly Smith | CertificationBody | 1 | L459 | Primary Standard A |

The view `v_approving_authority_approval_standard_detail` joins `approving_authorities` to `approval_standards` on `approving_authorities.approving_authority_id = approval_standards.approval_standard_id`. It answers: "Which standards does each authority reference?" Row 1 shows authority `Sean Green` referencing standard `L459` (`Primary Standard A`). Row 4 shows authority `Kimberly Smith` (`CertificationBody`, `National` level) referencing standard `8189504` (`Legacy Programme D`).

**View `v_manufacturer_approved_product_detail`**

```sql
CREATE VIEW v_manufacturer_approved_product_detail AS
SELECT a.id, a.manufacturer_name, a.legal_form, b.id AS product_id, b.product_identifier AS product_product_identifier, b.product_name AS product_product_name
FROM manufacturers a
  JOIN manufacturers_products j ON j.manufacturer_id = a.id
  JOIN approved_products b ON b.id = j.approved_product_id;
```

| id | manufacturer_name | legal_form | product_id | product_product_identifier | product_product_name |
|---|---|---|---|---|---|
| 1 | National Institute of Standards and Technology | Corporation | 1 | PRO-2322 | Composite Assessment |
| 1 | National Institute of Standards and Technology | Corporation | 2 | PRO-2324 | Compact Survey A |
| 2 | Interac Association | Partnership | 2 | PRO-2324 | Compact Survey A |
| 2 | Interac Association | Partnership | 3 | PRO-2326 | Legacy Corridor |
| 3 | Dow Chemical | SoleProprietorship | 3 | PRO-2326 | Legacy Corridor |
| 3 | Dow Chemical | SoleProprietorship | 4 | PRO-2328 | Regional Series |
| 4 | McDonnell Douglas | Corporation | 4 | PRO-2328 | Regional Series |
| 4 | McDonnell Douglas | Corporation | 1 | PRO-2322 | Composite Assessment |

The view `v_manufacturer_approved_product_detail` joins `manufacturers` to `approved_products` on `manufacturers.id = approved_products.manufacturer_id`. It answers: "Which products has each manufacturer produced, and what is their approval status?" Row 1 shows manufacturer `National Institute of Standards and Technology` having produced product `PRO-2322` (`Composite Assessment`, status `Approved`). Row 3 shows manufacturer `Dow Chemical` (a `SoleProprietorship` in `primary-country-82`) having produced product `PRO-2326` (`Legacy Corridor`, status `Suspended`).

**View `v_manufacturer_approving_authority`**

```sql
CREATE VIEW v_manufacturer_approving_authority AS
SELECT a.id, a.manufacturer_name, a.legal_form, a.registered_address, b.approving_authority_id AS authority_approving_authority_id, b.authority_name AS authority_authority_name, b.authority_type AS authority_authority_type
FROM manufacturers a JOIN approving_authorities b ON a.approving_authority_id = b.approving_authority_id;
```

| id | manufacturer_name | legal_form | registered_address | authority_approving_authority_id | authority_authority_name | authority_authority_type |
|---|---|---|---|---|---|---|
| 1 | National Institute of Standards and Technology | Corporation | regional-register-36 | 1 | Sean Green | CertificationBody |
| 2 | Interac Association | Partnership | legacy-register-37 | 2 | Elizabeth Woods | RegulatoryAgency |
| 3 | Dow Chemical | SoleProprietorship | compact-register-38 | 3 | Kimberly Smith | StandardsOrganization |
| 4 | McDonnell Douglas | Corporation | composite-register-39 | 4 | Kimberly Smith | CertificationBody |

The view `v_manufacturer_approving_authority` joins `manufacturers` to `approving_authorities` on `manufacturers.approving_authority_id = approving_authorities.approving_authority_id`. It answers: "Which authority oversees each manufacturer?" Row 1 shows manufacturer `National Institute of Standards and Technology` overseen by authority `Sean Green` (`CertificationBody`, `National` level). Row 4 shows manufacturer `McDonnell Douglas` overseen by authority `Kimberly Smith` (`CertificationBody`, `National` level).

**View `v_surveillance_audit_approved_product`**

```sql
CREATE VIEW v_surveillance_audit_approved_product AS
SELECT a.id, a.audit_identifier, a.audit_date, a.audit_outcome, b.id AS product_id, b.product_identifier AS product_product_identifier, b.product_name AS product_product_name
FROM surveillance_audits a JOIN approved_products b ON a.approved_product_id = b.id;
```

| id | audit_identifier | audit_date | audit_outcome | product_id | product_product_identifier | product_product_name |
|---|---|---|---|---|---|---|
| 100 | AUD-2349 | 2025-12-04T23:33:00 | Pass | 1 | PRO-2322 | Composite Assessment |
| 101 | AUD-2353 | 2022-05-15T06:50:00 | Fail | 2 | PRO-2324 | Compact Survey A |
| 102 | AUD-2357 | 2023-10-26T13:07:00 | ConditionalPass | 3 | PRO-2326 | Legacy Corridor |
| 103 | AUD-2361 | 2024-03-10T20:24:00 | Pending | 4 | PRO-2328 | Regional Series |

The view `v_surveillance_audit_approved_product` joins `surveillance_audits` to `approved_products` on `surveillance_audits.approved_product_id = approved_products.id`. It answers: "Which product was audited, and what is its current status?" Row 1 shows audit `AUD-2349` (outcome `Pass`, 2 findings) on product `PRO-2322` (`Composite Assessment`, status `Approved`). Row 2 shows audit `AUD-2353` (outcome `Fail`, 33 findings) on product `PRO-2324` (`Compact Survey A`, status `Pending`).

**View `v_surveillance_audit_approving_authority`**

```sql
CREATE VIEW v_surveillance_audit_approving_authority AS
SELECT a.id, a.audit_identifier, a.audit_date, a.audit_outcome, b.approving_authority_id AS authority_approving_authority_id, b.authority_name AS authority_authority_name, b.authority_type AS authority_authority_type
FROM surveillance_audits a JOIN approving_authorities b ON a.approving_authority_id = b.approving_authority_id;
```

| id | audit_identifier | audit_date | audit_outcome | authority_approving_authority_id | authority_authority_name | authority_authority_type |
|---|---|---|---|---|---|---|
| 100 | AUD-2349 | 2025-12-04T23:33:00 | Pass | 1 | Sean Green | CertificationBody |
| 101 | AUD-2353 | 2022-05-15T06:50:00 | Fail | 2 | Elizabeth Woods | RegulatoryAgency |
| 102 | AUD-2357 | 2023-10-26T13:07:00 | ConditionalPass | 3 | Kimberly Smith | StandardsOrganization |
| 103 | AUD-2361 | 2024-03-10T20:24:00 | Pending | 4 | Kimberly Smith | CertificationBody |

The view `v_surveillance_audit_approving_authority` joins `surveillance_audits` to `approving_authorities` on `surveillance_audits.approving_authority_id = approving_authorities.approving_authority_id`. It answers: "Which authority conducted each audit?" Row 1 shows audit `AUD-2349` conducted by authority `Sean Green` (`CertificationBody`, `National` level). Row 3 shows audit `AUD-2357` (outcome `ConditionalPass`, 23 findings) conducted by authority `Kimberly Smith` (`StandardsOrganization`, `Regional` level).

**View `v_surveillance_audit_approval_standard`**

```sql
CREATE VIEW v_surveillance_audit_approval_standard AS
SELECT a.id, a.audit_identifier, a.audit_date, a.audit_outcome, b.approval_standard_id AS standard_approval_standard_id, b.standard_code AS standard_standard_code, b.standard_title AS standard_standard_title
FROM surveillance_audits a JOIN approval_standards b ON a.approval_standard_id = b.approval_standard_id;
```

| id | audit_identifier | audit_date | audit_outcome | standard_approval_standard_id | standard_standard_code | standard_standard_title |
|---|---|---|---|---|---|---|
| 100 | AUD-2349 | 2025-12-04T23:33:00 | Pass | 1 | L459 | Primary Standard A |
| 101 | AUD-2353 | 2022-05-15T06:50:00 | Fail | 2 | account_pymes_596 | Composite Framework |
| 102 | AUD-2357 | 2023-10-26T13:07:00 | ConditionalPass | 3 | 9125613 | Compact Protocol |
| 103 | AUD-2361 | 2024-03-10T20:24:00 | Pending | 4 | 8189504 | Legacy Programme D |

The view `v_surveillance_audit_approval_standard` joins `surveillance_audits` to `approval_standards` on `surveillance_audits.approval_standard_id = approval_standards.approval_standard_id`. It answers: "Which standard was the basis for each audit?" Row 1 shows audit `AUD-2349` (outcome `Pass`) based on standard `L459` (`Primary Standard A`). Row 4 shows audit `AUD-2361` (outcome `Pending`, 0 findings) based on standard `8189504` (`Legacy Programme D`).

The schema above demonstrates a clean separation between entity storage and relationship encoding. The five base tables hold the core entities and their attributes; the three junction tables encode the many-to-many relationships that the single foreign keys in `approved_products` and `manufacturers` hint at but do not fully capture. The views materialise denormalised projections that answer specific operational questions—product-standard pairing, product-authority pairing, manufacturer-product pairing, standard supersession chains, authority-product detail, authority-standard detail, manufacturer-product detail, manufacturer-authority oversight, and the three audit-product, audit-authority, and audit-standard perspectives. Each view reconstructs a domain fact by joining the normalised tables on their foreign keys, trading storage redundancy for query simplicity. The result is a schema that faithfully mirrors the ontology: four entity types, one event type, three many-to-many relationships, and a set of denormalised views that serve as the application's read model.