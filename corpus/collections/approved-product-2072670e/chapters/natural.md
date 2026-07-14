# Product Certification and Compliance Management

Modern industrial ecosystems depend on rigorous certification frameworks to ensure that manufactured goods meet established safety, performance, and quality benchmarks before reaching the field. This chapter documents the operational architecture of a product certification management system, where manufacturers submit products for evaluation against published standards, independent authorities grant or withhold approval, and ongoing surveillance audits verify continued compliance. The system tracks every stage of this lifecycle—from initial submission through active approval, conditional status, or revocation—while maintaining an auditable chain of responsibility linking each product to its governing standard, its certifying authority, and its producing manufacturer.

At the core of this architecture lies a set of base records that capture the static attributes of the certification domain. These records form the foundation upon which all operational queries and compliance reports are built.

**Table `approved_products`**

| id | product_identifier | product_name | nominal_size_range | service_condition | material_type | approval_status | approval_standard_id | approving_authority_id | manufacturer_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | PRO-2322 | Composite Assessment | distributed-nominal-30 | seasonal-service-59 | adaptive-material-71 | Approved | 1 | 1 | 1 |
| 2 | PRO-2324 | Compact Survey A | baseline-nominal-31 | regional-service-60 | distributed-material-72 | Pending | 2 | 2 | 2 |
| 3 | PRO-2326 | Legacy Corridor | pilot-nominal-32 | legacy-service-61 | baseline-material-73 | Suspended | 3 | 3 | 3 |
| 4 | PRO-2328 | Regional Series | extended-nominal-33 | compact-service-62 | pilot-material-74 | Revoked | 4 | 4 | 4 |

The approved_products table serves as the central registry of all products that have entered the certification pipeline. Each row represents a distinct product submission, identified by a unique product_identifier such as PRO-2322 or PRO-2328. The product_name field provides a human-readable label—for instance, "Composite Assessment" or "Regional Series"—while the nominal_size_range and service_condition columns encode the operational envelope within which the product is designed to function. The material_type attribute captures the composition class, ranging from adaptive-material-71 to pilot-material-74. Most critically, the approval_status column records the current standing of the product within the certification lifecycle: Approved, Pending, Suspended, or Revoked. In the current dataset, product PRO-2322 (Composite Assessment) holds Approved status, whereas PRO-2326 (Legacy Corridor) has been Suspended and PRO-2328 (Regional Series) has had its approval Revoked. Each product row also carries foreign-key references to the governing approval_standard, the approving_authority that granted its certification, and the manufacturer that produced it, thereby anchoring every product within the broader certification ecosystem.

**Table `approval_standards`**

| approval_standard_id | standard_code | standard_title | publication_date | issuing_organization | version_number | supersedes_approval_standard_id | is_superseded_by_approval_standard_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | L459 | Primary Standard A | 2025-12-01 | Alphabet Inc Class A | VER-2245 | 1 | 1 | 2025-01-01 00:14:00 |
| 2 | account_pymes_596 | Composite Framework | 2022-05-12 | ITT Industries | VER-2249 | 2 | 2 | 2025-02-06 03:14:00 |
| 3 | 9125613 | Compact Protocol | 2023-10-23 | Switch Card Services Ltd. | VER-2253 | 3 | 3 | 2025-03-11 06:14:00 |
| 4 | 8189504 | Legacy Programme D | 2024-03-07 | Buypass AS | VER-2257 | 4 | 4 | 2025-04-16 09:14:00 |

Approval standards define the technical and procedural requirements that products must satisfy to earn certification. The approval_standards table catalogs each standard with a unique identifier, a machine-readable standard_code (such as L459 or 8189504), and a descriptive standard_title like "Primary Standard A" or "Legacy Programme D." The publication_date records when the standard was issued, while the issuing_organization field names the body responsible for its development—Alphabet Inc Class A, ITT Industries, Switch Card Services Ltd., or Buypass AS in the current records. The version_number column (VER-2245 through VER-2257) enables precise tracking of revisions, and the supersedes_approval_standard_id and is_superseded_by_approval_standard_id columns establish a directed graph of standard evolution. In the present data, each standard references itself in both fields, indicating that the current snapshot captures standards in a state where no supersession has yet been recorded. This self-referential structure nonetheless supports the full chain of supersession when standards are updated, ensuring that auditors can always determine which version of a standard was in effect at any given time.

**Table `approving_authorities`**

| approving_authority_id | authority_name | authority_type | jurisdiction | contact_address | authorization_level |
|---|---|---|---|---|---|
| 1 | Sean Green | CertificationBody | regional-jurisdic-30 | Kimberly Maynard | National |
| 2 | Elizabeth Woods | RegulatoryAgency | legacy-jurisdic-31 | Theodore Mcgrath | International |
| 3 | Kimberly Smith | StandardsOrganization | compact-jurisdic-32 | Susan Levy | Regional |
| 4 | Kimberly Smith | CertificationBody | composite-jurisdic-33 | Haruki Murakami | National |

The approving_authorities table enumerates the organizations empowered to evaluate and certify products. Each authority is identified by an approving_authority_id and named in the authority_name field—Sean Green, Elizabeth Woods, and Kimberly Smith appear in the current records. The authority_type column classifies each body as a CertificationBody, RegulatoryAgency, or StandardsOrganization, reflecting its institutional role within the certification ecosystem. The jurisdiction field (regional-jurisdic-30, legacy-jurisdic-31, compact-jurisdic-32, composite-jurisdic-33) defines the geographic or functional scope of the authority's mandate, while the contact_address column provides a point of contact for compliance inquiries. The authorization_level—National, International, or Regional—indicates the breadth of the authority's certification power. These attributes collectively determine which products an authority is qualified to approve and under what regulatory framework.

**Table `manufacturers`**

| id | manufacturer_name | legal_form | registered_address | country_of_origin | registration_number | approving_authority_id |
|---|---|---|---|---|---|---|
| 1 | National Institute of Standards and Technology | Corporation | regional-register-36 | compact-country-80 | REG-2136 | 1 |
| 2 | Interac Association | Partnership | legacy-register-37 | composite-country-81 | REG-2142 | 2 |
| 3 | Dow Chemical | SoleProprietorship | compact-register-38 | primary-country-82 | REG-2148 | 3 |
| 4 | McDonnell Douglas | Corporation | composite-register-39 | adaptive-country-83 | REG-2154 | 4 |

Manufacturers represent the producing entities whose products enter the certification pipeline. The manufacturers table records each entity's legal identity through the manufacturer_name field (National Institute of Standards and Technology, Interac Association, Dow Chemical, McDonnell Douglas), its legal_form (Corporation, Partnership, SoleProprietorship), and its registered_address and country_of_origin. The registration_number (REG-2136 through REG-2154) provides a unique legal identifier for each entity. Crucially, each manufacturer row includes an approving_authority_id, establishing a primary regulatory relationship that designates which authority oversees the manufacturer's compliance obligations. This relationship does not preclude a manufacturer from having products approved by multiple authorities; rather, it establishes the default regulatory anchor for the entity.

## Surveillance and Audit Operations

Certification is not a one-time event but an ongoing process of verification. The surveillance_audits table captures the periodic inspections that confirm continued compliance with approved standards.

**Table `surveillance_audits`**

| id | audit_identifier | audit_date | audit_outcome | auditor_name | findings_count | next_audit_due | approved_product_id | approving_authority_id | approval_standard_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | AUD-2349 | 2025-12-04T23:33:00 | Pass | Compact Initiative | 2 | 2025-04-05 | 1 | 1 | 1 |
| 101 | AUD-2353 | 2022-05-15T06:50:00 | Fail | Legacy Model | 33 | 2022-09-16 | 2 | 2 | 2 |
| 102 | AUD-2357 | 2023-10-26T13:07:00 | ConditionalPass | Regional Cluster A | 23 | 2023-02-27 | 3 | 3 | 3 |
| 103 | AUD-2361 | 2024-03-10T20:24:00 | Pending | Seasonal Review | 0 | 2024-07-11 | 4 | 4 | 4 |

Each audit record is identified by an audit_identifier (AUD-2349, AUD-2353, AUD-2357, AUD-2361) and dated by its audit_date, which in the current dataset spans from 2022 through 2025. The audit_outcome column records the result of the inspection: Pass, Fail, ConditionalPass, or Pending. The auditor_name field attributes the inspection to a specific evaluator or team—Compact Initiative, Legacy Model, Regional Cluster A, and Seasonal Review appear in the data. The findings_count quantifies the number of nonconformities or observations documented during the audit, ranging from zero (AUD-2361) to thirty-three (AUD-2353). The next_audit_due column schedules the subsequent inspection, creating a forward-looking compliance calendar. Each audit row references an approved_product_id, an approving_authority_id, and an approval_standard_id, thereby linking the audit to the specific product under review, the authority responsible for oversight, and the standard against which compliance is measured.

## Cross-Reference Matrices

The certification ecosystem involves complex many-to-many relationships that cannot be captured by simple foreign keys alone. Three junction tables model these relationships explicitly.

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

The authorities_products table maps which approving authorities are associated with which approved products. In the current data, authority 1 (Sean Green) is linked to products 1 and 2, authority 2 (Elizabeth Woods) to products 2 and 3, authority 3 (Kimberly Smith) to products 3 and 4, and authority 4 (Kimberly Smith) to products 4 and 1. This matrix reveals that products may be subject to oversight by multiple authorities simultaneously, and that authorities may exercise jurisdiction over products from different manufacturers. The presence of authority 4—also named Kimberly Smith but classified as a CertificationBody with composite-jurisdic-33 jurisdiction—demonstrates that distinct authorities can share a name while operating under different institutional frameworks.

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

The authorities_standards table records which approving authorities are empowered to enforce which approval standards. This relationship determines the scope of an authority's technical competence: a RegulatoryAgency may be authorized to enforce certain standards while a StandardsOrganization enforces a different set. The specific mappings in this table define the authorization matrix that governs which authority can certify a product against which standard.

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

The manufacturers_products table links manufacturers to the products they produce. While a manufacturer row may reference a single primary approving authority, the manufacturers_products junction table captures the full set of products attributable to each manufacturer, enabling a complete accounting of a manufacturer's certification portfolio regardless of which authority granted each individual product's approval.

## View-Based Compliance Analysis

The system provides a suite of analytical views that join base tables and junction records into cohesive, query-ready structures. Each view answers a specific operational question about the certification ecosystem.

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

This view joins approved_products with approval_standards to present each product alongside the full details of the standard against which it was evaluated. Reading row 1 of this view reveals that product PRO-2322 (Composite Assessment) was certified under standard L459 (Primary Standard A), published on 2025-12-01 by Alphabet Inc Class A. Row 4 shows that PRO-2328 (Regional Series) was evaluated against standard 8189504 (Legacy Programme D), issued by Buypass AS. This view enables compliance officers to quickly verify that each product's current approval status is consistent with the requirements of its governing standard.

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

By joining approved_products with approving_authorities, this view presents each product alongside the authority that granted its certification. Row 1 indicates that PRO-2322 was approved by Sean Green (CertificationBody, National authorization level), while row 2 shows that PRO-2324 (Compact Survey A) was approved by Elizabeth Woods (RegulatoryAgency, International authorization level). This view is essential for determining which authority bears responsibility for a given product's ongoing compliance and for routing audit notifications to the correct regulatory body.

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

This view links each approved product to its producing manufacturer, combining product attributes with manufacturer legal details. Row 1 reveals that PRO-2322 was manufactured by the National Institute of Standards and Technology, a Corporation registered in compact-country-80. Row 3 shows that PRO-2326 (Legacy Corridor) was produced by Dow Chemical, a SoleProprietorship from primary-country-82. This view supports supply-chain traceability and enables regulators to identify all products attributable to a specific manufacturer for targeted compliance reviews.

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

This self-join view on approval_standards surfaces the supersession relationships between standards. Each row presents a standard alongside the standard it supersedes and the standard that supersedes it. In the current dataset, each standard references itself in both the supersedes and is_superseded_by fields, indicating that no supersession events have been recorded. When supersession does occur, this view becomes the primary mechanism for determining which standard version is currently in force and which versions have been retired.

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

This view aggregates all products associated with each approving authority, providing a comprehensive inventory of an authority's certification portfolio. An authority row in this view lists every product it has approved, along with the product's current status, its manufacturer, and the governing standard. This view is particularly useful for authority-level reporting, where regulators need to assess the total number of products under their oversight and identify any products with Suspended or Revoked status that may require follow-up action.

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

This view maps each approving authority to the standards it is authorized to enforce, combining authority attributes with standard metadata. Row 1 shows that authority 1 (Sean Green) is authorized to enforce standard L459 (Primary Standard A). This view clarifies the technical scope of each authority's mandate and is essential for validating that a product was certified by an authority competent to enforce its governing standard.

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

This view presents each manufacturer alongside all products it has produced that have entered the certification pipeline. Row 1 lists the National Institute of Standards and Technology with its associated product PRO-2322 (Composite Assessment), which holds Approved status. Row 4 shows McDonnell Douglas with product PRO-2328 (Regional Series), which has been Revoked. This view supports manufacturer-level compliance dashboards, enabling regulators to monitor the full product portfolio of each entity and identify manufacturers with multiple products in non-Approved status.

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

This view links manufacturers to their primary approving authority, combining manufacturer legal details with authority classification information. Row 1 shows that the National Institute of Standards and Technology is primarily overseen by authority 1 (Sean Green, CertificationBody, National level), while row 2 indicates that Interac Association falls under authority 2 (Elizabeth Woods, RegulatoryAgency, International level). This view establishes the default regulatory relationship for each manufacturer and is used to route routine compliance communications and audit scheduling.

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

This view joins surveillance_audits with approved_products to present each audit alongside the full details of the product under inspection. Row 1 shows that audit AUD-2349, conducted on 2025-12-04 by Compact Initiative, resulted in a Pass outcome for product PRO-2322 (Composite Assessment), with 2 findings documented and the next audit scheduled for 2025-04-05. Row 2 reveals that audit AUD-2353, conducted on 2022-05-15 by Legacy Model, resulted in a Fail outcome for product PRO-2324, with 33 findings recorded. This view is the primary instrument for tracking product-level audit history and identifying products that require immediate remedial action.

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

This view links each surveillance audit to the approving authority responsible for the product under audit. Row 1 shows that audit AUD-2349 on product PRO-2322 falls under the oversight of authority 1 (Sean Green). Row 3 indicates that audit AUD-2357 on product PRO-2326 is overseen by authority 3 (Kimberly Smith, StandardsOrganization). This view enables authorities to generate audit schedules and track the compliance status of all products within their jurisdiction.

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

This view associates each surveillance audit with the approval standard against which the audited product is evaluated. Row 1 shows that audit AUD-2349 on product PRO-2322 was conducted against standard L459 (Primary Standard A). Row 4 indicates that audit AUD-2361 on product PRO-2328 was evaluated against standard 8189504 (Legacy Programme D). This view ensures that auditors reference the correct version of the governing standard during inspections and provides an audit trail linking each finding to the specific standard requirement it addresses.

## Synthesis

The product certification management system described in this chapter operates as an integrated network of standards, authorities, manufacturers, and products, bound together by approval relationships and sustained through ongoing surveillance audits. The base tables capture the static attributes of each entity, while the junction tables model the complex many-to-many relationships that arise when authorities exercise jurisdiction over multiple products, manufacturers produce products subject to multiple standards, and standards evolve through supersession. The analytical views synthesize these records into actionable compliance dashboards, enabling regulators to trace any product back to its governing standard, its certifying authority, and its manufacturer, while also tracing any authority forward to the full portfolio of products and standards under its oversight. This architecture ensures that every certification decision is auditable, every surveillance finding is attributable, and every product's compliance status can be verified against the specific standard and authority that govern it.