## Ontology-Grounded Relational Modelling of Certification Lifecycle Data

The certification management domain captures the lifecycle of organizational certifications: which bodies are certified, against which standards, within what scopes, and through what approval events. The ontology distinguishes five core entity types—certified organizations, certification records, management standards, certification scopes, and approval events—alongside three generic junction entities that materialize many-to-many associations between the core types. The relational schema normalizes these entities into nine base tables and exposes them through nine analytical views that reconstruct domain facts from the normalized grain.

**Table `certified_organizations`**

| id | legal_name | registered_address | certification_body | certification_body_region | certification_body_representative | certification_body_title |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | regional-register-36 | integrated-certific-58 | primary-certific-16 | adaptive-certific-53 | Seasonal Review |
| 2 | Primary Cluster | legacy-register-37 | seasonal-certific-59 | adaptive-certific-17 | distributed-certific-54 | Integrated Initiative |
| 3 | Composite Review D | compact-register-38 | regional-certific-60 | distributed-certific-18 | baseline-certific-55 | Extended Model D |
| 4 | Compact Initiative | composite-register-39 | legacy-certific-61 | baseline-certific-19 | pilot-certific-56 | Pilot Cluster |

The `certified_organizations` table anchors the organizational dimension. Each row represents a legal entity that holds or has held a certification, identified by a surrogate integer `id`. The `legal_name` column carries human-readable identifiers such as "Adaptive Model" and "Primary Cluster", while `registered_address` stores location metadata encoded as domain tokens like "regional-register-36". The certification body dimension is decomposed into three columns: `certification_body` names the accrediting authority (e.g., "integrated-certific-58"), `certification_body_region` constrains its geographic or functional jurisdiction (e.g., "primary-certific-16"), and `certification_body_representative` identifies the individual contact (e.g., "adaptive-certific-53"). The `certification_body_title` column captures the representative's role, with values such as "Seasonal Review" and "Integrated Initiative". This table is the left side of the many-to-many relationship with `certification_records`, mediated by the junction table `organizations_records`.

**Table `management_standards`**

| id | standard_identifier | standard_title | version_number | issuing_body | publication_year |
|---|---|---|---|---|---|
| 100 | STA-2646 | Primary Standard A | VER-2245 | baseline-issuing-13 | 25 |
| 101 | STA-2649 | Composite Framework | VER-2249 | pilot-issuing-14 | 33 |
| 102 | STA-2652 | Compact Protocol | VER-2253 | extended-issuing-15 | 41 |
| 103 | STA-2655 | Legacy Programme D | VER-2257 | integrated-issuing-16 | 49 |

The `management_standards` table defines the normative reference framework against which certifications are assessed. Its surrogate key `id` uses values in the 100–103 range, and the `standard_identifier` column carries human-readable codes like "STA-2646". The `standard_title` column provides descriptive names—"Primary Standard A", "Composite Framework", "Compact Protocol", "Legacy Programme D"—while `version_number` encodes the standard revision (e.g., "VER-2245"). The `issuing_body` column names the standards organization (e.g., "baseline-issuing-13"), and `publication_year` stores the year as a small integer (25, 33, 41, 49). This table participates in two relationships: a one-to-many with `certification_records` (each standard can underlie multiple certification records) and a one-to-many with `approval_events` (each standard can be the subject of multiple approval events).

**Table `certification_scopes`**

| certification_scope_id | scope_description | activity_type | product_category | certification_record_id |
|---|---|---|---|---|
| 1 | Integrated Model A | manufacture | composite-product-87 | 1 |
| 2 | Extended Cluster | service | primary-product-88 | 2 |
| 3 | Pilot Review | design | adaptive-product-89 | 3 |
| 4 | Baseline Initiative D | assembly | distributed-product-90 | 4 |

The `certification_scopes` table captures the operational boundaries of each certification. Its surrogate key `certification_scope_id` aligns with the `id` values 1–4, and the `scope_description` column carries descriptive labels such as "Integrated Model A" and "Extended Cluster". The `activity_type` column classifies the certified activity as "manufacture", "service", "design", or "assembly", while `product_category` stores a domain token (e.g., "composite-product-87"). The `certification_record_id` column is a foreign key referencing `certification_records.id`, establishing a one-to-many relationship: each certification record can have one or more scopes, but each scope belongs to exactly one record. This design allows a single certificate to cover multiple operational domains.

**Table `certification_records`**

| id | certificate_identity_number | current_issue_date | expiry_date | status | certified_organization_id | management_standard_id | certification_scope_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1 | CER-2539 | 2023-10-24T21:51:00 | 2023-10-24T21:15:00 | active | 1 | 100 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | CER-2544 | 2024-03-08T04:08:00 | 2024-03-08T04:32:00 | expired | 2 | 101 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | CER-2549 | 2025-08-19T11:25:00 | 2025-08-19T11:49:00 | suspended | 3 | 102 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | CER-2554 | 2022-01-03T18:42:00 | 2022-01-03T18:06:00 | revoked | 4 | 103 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `certification_records` table is the central fact table of the schema. Each row represents a discrete certification instance, identified by surrogate `id` (1–4) and by the business key `certificate_identity_number` (e.g., "CER-2539"). Temporal attributes include `current_issue_date` and `expiry_date`, which in the sample data exhibit a notable pattern: the expiry timestamp precedes the issue timestamp within each row (e.g., "2023-10-24T21:51:00" issued against "2023-10-24T21:15:00" expiry), suggesting a domain convention where the expiry marks the end of a validity window that has already elapsed. The `status` column carries a four-valued enum—"active", "expired", "suspended", "revoked"—and the audit columns `created_at` and `updated_at` record the lifecycle timestamps. Three foreign keys anchor this table to its dimensions: `certified_organization_id` references `certified_organizations.id`, `management_standard_id` references `management_standards.id`, and `certification_scope_id` references `certification_scopes.certification_scope_id`. The many-to-many relationship between organizations and certification records is resolved through the `organizations_records` junction table, which allows a single organization to hold multiple certification records and a single record to be associated with multiple organizations.

**Table `approval_events`**

| approval_event_id | approval_date | approval_number | approval_type | management_standard_id |
|---|---|---|---|---|
| 1 | 2023-10-10T21:27:00 | APP-2621 | initial | 100 |
| 2 | 2024-03-21T04:44:00 | APP-2628 | surveillance | 101 |
| 3 | 2025-08-05T11:01:00 | APP-2635 | recertification | 102 |
| 4 | 2022-01-16T18:18:00 | APP-2642 | initial | 103 |

The `approval_events` table records discrete governance actions taken in the certification lifecycle. Its surrogate key `approval_event_id` uses values 1–4, and the `approval_date` column stores the event timestamp (e.g., "2023-10-10T21:27:00"). The `approval_number` column carries business identifiers like "APP-2621", while `approval_type` classifies the event as "initial", "surveillance", or "recertification". The `management_standard_id` column is a foreign key to `management_standards.id`, linking each approval to the standard it pertains to. This table participates in the many-to-many relationship with `certification_records` through the `records_events` junction table, and in the many-to-many relationship with `standards_records` through the `events_records` junction table.

**Table `organizations_records`**

| certified_organization_id | certification_record_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `organizations_records` table is a pure junction table that resolves the many-to-many relationship between `certified_organizations` and `certification_records`. Each row pairs a `certified_organization_id` with a `certification_record_id`, forming a composite key. The sample data shows a cyclic association pattern: organization 1 appears with records 1 and 4, organization 2 with records 2 and 3, organization 3 with records 3 and 4, and organization 4 with records 4 and 1. This structure supports scenarios where a certification record spans multiple legal entities or where an organization holds multiple distinct certifications.

**Table `records_events`**

| certification_record_id | approval_event_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `records_events` table is a generic junction table that links `certification_records` to `approval_events`. Its two columns—`certification_record_id` and `approval_event_id`—form a composite key that captures which approval events are associated with which certification records. This table enables the many-to-many relationship: a single certification record can be subject to multiple approval events (initial, surveillance, recertification), and a single approval event can reference multiple records.

**Table `standards_records`**

| management_standard_id | certification_record_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `standards_records` table is a generic junction table that links `management_standards` to `certification_records`. Its two columns—`management_standard_id` and `certification_record_id`—form a composite key. While `certification_records` already carries a direct foreign key to `management_standards`, this junction table provides an additional association layer that may support historical tracking of standard changes or multi-standard certifications.

**Table `events_records`**

| approval_event_id | certification_record_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `events_records` table is a generic junction table that links `approval_events` to `certification_records`. Its two columns—`approval_event_id` and `certification_record_id`—form a composite key. Like `records_events`, this table provides an additional association path between events and records, potentially supporting audit trails or multi-record approval events.

The base tables together form a normalized schema where the central fact table `certification_records` is surrounded by dimension tables and junction tables that resolve many-to-many relationships. The foreign key constraints enforce referential integrity: `certification_records.certified_organization_id` → `certified_organizations.id`, `certification_records.management_standard_id` → `management_standards.id`, `certification_records.certification_scope_id` → `certification_scopes.certification_scope_id`, `approval_events.management_standard_id` → `management_standards.id`, and the junction tables enforce their respective composite associations.

## Analytical Views

The view layer reconstructs domain facts by joining the normalized tables into denormalized result sets suitable for reporting and analysis. Each view answers a specific analytical question by projecting relevant columns from two or more tables.

**View `v_certified_organization_certification_record_detail`**

```sql
CREATE VIEW v_certified_organization_certification_record_detail AS
SELECT a.id, a.legal_name, a.registered_address, b.id AS record_id, b.certificate_identity_number AS record_certificate_identity_number, b.current_issue_date AS record_current_issue_date
FROM certified_organizations a
  JOIN organizations_records j ON j.certified_organization_id = a.id
  JOIN certification_records b ON b.id = j.certification_record_id;
```

| id | legal_name | registered_address | record_id | record_certificate_identity_number | record_current_issue_date |
|---|---|---|---|---|---|
| 1 | Adaptive Model | regional-register-36 | 1 | CER-2539 | 2023-10-24T21:51:00 |
| 1 | Adaptive Model | regional-register-36 | 2 | CER-2544 | 2024-03-08T04:08:00 |
| 2 | Primary Cluster | legacy-register-37 | 2 | CER-2544 | 2024-03-08T04:08:00 |
| 2 | Primary Cluster | legacy-register-37 | 3 | CER-2549 | 2025-08-19T11:25:00 |
| 3 | Composite Review D | compact-register-38 | 3 | CER-2549 | 2025-08-19T11:25:00 |
| 3 | Composite Review D | compact-register-38 | 4 | CER-2554 | 2022-01-03T18:42:00 |
| 4 | Compact Initiative | composite-register-39 | 4 | CER-2554 | 2022-01-03T18:42:00 |
| 4 | Compact Initiative | composite-register-39 | 1 | CER-2539 | 2023-10-24T21:51:00 |

This view joins `certified_organizations` to `certification_records` on the organization identifier, producing a denormalized view of each certification record enriched with the organization's legal name, address, and certification body details. It answers the question: "What certification record does this organization hold, and what are the organization's details?" A sample row would show "Adaptive Model" (organization id 1) with certificate "CER-2539" in "active" status, carrying the certification body "integrated-certific-58" and title "Seasonal Review".

**View `v_certification_record_certified_organization`**

```sql
CREATE VIEW v_certification_record_certified_organization AS
SELECT a.id, a.certificate_identity_number, a.current_issue_date, a.expiry_date, b.id AS organization_id, b.legal_name AS organization_legal_name, b.registered_address AS organization_registered_address
FROM certification_records a JOIN certified_organizations b ON a.certified_organization_id = b.id;
```

| id | certificate_identity_number | current_issue_date | expiry_date | organization_id | organization_legal_name | organization_registered_address |
|---|---|---|---|---|---|---|
| 1 | CER-2539 | 2023-10-24T21:51:00 | 2023-10-24T21:15:00 | 1 | Adaptive Model | regional-register-36 |
| 2 | CER-2544 | 2024-03-08T04:08:00 | 2024-03-08T04:32:00 | 2 | Primary Cluster | legacy-register-37 |
| 3 | CER-2549 | 2025-08-19T11:25:00 | 2025-08-19T11:49:00 | 3 | Composite Review D | compact-register-38 |
| 4 | CER-2554 | 2022-01-03T18:42:00 | 2022-01-03T18:06:00 | 4 | Compact Initiative | composite-register-39 |

This view performs the inverse join, starting from `certification_records` and attaching the `certified_organizations` dimension. It answers: "Which organization holds this certification record?" A row for certificate "CER-2544" would show organization "Primary Cluster" (id 2) with registered address "legacy-register-37" and certification body "seasonal-certific-59".

**View `v_certification_record_management_standard`**

```sql
CREATE VIEW v_certification_record_management_standard AS
SELECT a.id, a.certificate_identity_number, a.current_issue_date, a.expiry_date, b.id AS standard_id, b.standard_identifier AS standard_standard_identifier, b.standard_title AS standard_standard_title
FROM certification_records a JOIN management_standards b ON a.management_standard_id = b.id;
```

| id | certificate_identity_number | current_issue_date | expiry_date | standard_id | standard_standard_identifier | standard_standard_title |
|---|---|---|---|---|---|---|
| 1 | CER-2539 | 2023-10-24T21:51:00 | 2023-10-24T21:15:00 | 100 | STA-2646 | Primary Standard A |
| 2 | CER-2544 | 2024-03-08T04:08:00 | 2024-03-08T04:32:00 | 101 | STA-2649 | Composite Framework |
| 3 | CER-2549 | 2025-08-19T11:25:00 | 2025-08-19T11:49:00 | 102 | STA-2652 | Compact Protocol |
| 4 | CER-2554 | 2022-01-03T18:42:00 | 2022-01-03T18:06:00 | 103 | STA-2655 | Legacy Programme D |

This view joins `certification_records` to `management_standards` on the standard identifier, producing a denormalized view of each certification enriched with the standard's title, version, and issuing body. It answers: "Against which management standard is this certification issued?" A row for certificate "CER-2549" would show standard "Compact Protocol" (id 102) with version "VER-2253", issued by "extended-issuing-15" in year 41.

**View `v_certification_record_certification_scope`**

```sql
CREATE VIEW v_certification_record_certification_scope AS
SELECT a.id, a.certificate_identity_number, a.current_issue_date, a.expiry_date, b.certification_scope_id AS scope_certification_scope_id, b.scope_description AS scope_scope_description, b.activity_type AS scope_activity_type
FROM certification_records a JOIN certification_scopes b ON a.certification_scope_id = b.certification_scope_id;
```

| id | certificate_identity_number | current_issue_date | expiry_date | scope_certification_scope_id | scope_scope_description | scope_activity_type |
|---|---|---|---|---|---|---|
| 1 | CER-2539 | 2023-10-24T21:51:00 | 2023-10-24T21:15:00 | 1 | Integrated Model A | manufacture |
| 2 | CER-2544 | 2024-03-08T04:08:00 | 2024-03-08T04:32:00 | 2 | Extended Cluster | service |
| 3 | CER-2549 | 2025-08-19T11:25:00 | 2025-08-19T11:49:00 | 3 | Pilot Review | design |
| 4 | CER-2554 | 2022-01-03T18:42:00 | 2022-01-03T18:06:00 | 4 | Baseline Initiative D | assembly |

This view joins `certification_records` to `certification_scopes` on the scope identifier, producing a denormalized view of each certification enriched with the scope description, activity type, and product category. It answers: "What is the operational scope of this certification?" A row for certificate "CER-2554" would show scope "Baseline Initiative D" with activity type "assembly" and product category "distributed-product-90".

**View `v_certification_record_approval_event_detail`**

```sql
CREATE VIEW v_certification_record_approval_event_detail AS
SELECT a.id, a.certificate_identity_number, a.current_issue_date, b.approval_event_id AS event_approval_event_id, b.approval_date AS event_approval_date, b.approval_number AS event_approval_number
FROM certification_records a
  JOIN records_events j ON j.certification_record_id = a.id
  JOIN approval_events b ON b.approval_event_id = j.approval_event_id;
```

| id | certificate_identity_number | current_issue_date | event_approval_event_id | event_approval_date | event_approval_number |
|---|---|---|---|---|---|
| 1 | CER-2539 | 2023-10-24T21:51:00 | 1 | 2023-10-10T21:27:00 | APP-2621 |
| 1 | CER-2539 | 2023-10-24T21:51:00 | 2 | 2024-03-21T04:44:00 | APP-2628 |
| 2 | CER-2544 | 2024-03-08T04:08:00 | 2 | 2024-03-21T04:44:00 | APP-2628 |
| 2 | CER-2544 | 2024-03-08T04:08:00 | 3 | 2025-08-05T11:01:00 | APP-2635 |
| 3 | CER-2549 | 2025-08-19T11:25:00 | 3 | 2025-08-05T11:01:00 | APP-2635 |
| 3 | CER-2549 | 2025-08-19T11:25:00 | 4 | 2022-01-16T18:18:00 | APP-2642 |
| 4 | CER-2554 | 2022-01-03T18:42:00 | 4 | 2022-01-16T18:18:00 | APP-2642 |
| 4 | CER-2554 | 2022-01-03T18:42:00 | 1 | 2023-10-10T21:27:00 | APP-2621 |

This view joins `certification_records` to `approval_events` through the junction tables, producing a denormalized view of each certification enriched with its associated approval events. It answers: "What approval events are associated with this certification record?" A row for certificate "CER-2539" would show approval event "APP-2621" of type "initial" dated "2023-10-10T21:27:00" under standard 100.

**View `v_management_standard_certification_record_detail`**

```sql
CREATE VIEW v_management_standard_certification_record_detail AS
SELECT a.id, a.standard_identifier, a.standard_title, b.id AS record_id, b.certificate_identity_number AS record_certificate_identity_number, b.current_issue_date AS record_current_issue_date
FROM management_standards a
  JOIN standards_records j ON j.management_standard_id = a.id
  JOIN certification_records b ON b.id = j.certification_record_id;
```

| id | standard_identifier | standard_title | record_id | record_certificate_identity_number | record_current_issue_date |
|---|---|---|---|---|---|
| 100 | STA-2646 | Primary Standard A | 1 | CER-2539 | 2023-10-24T21:51:00 |
| 100 | STA-2646 | Primary Standard A | 2 | CER-2544 | 2024-03-08T04:08:00 |
| 101 | STA-2649 | Composite Framework | 2 | CER-2544 | 2024-03-08T04:08:00 |
| 101 | STA-2649 | Composite Framework | 3 | CER-2549 | 2025-08-19T11:25:00 |
| 102 | STA-2652 | Compact Protocol | 3 | CER-2549 | 2025-08-19T11:25:00 |
| 102 | STA-2652 | Compact Protocol | 4 | CER-2554 | 2022-01-03T18:42:00 |
| 103 | STA-2655 | Legacy Programme D | 4 | CER-2554 | 2022-01-03T18:42:00 |
| 103 | STA-2655 | Legacy Programme D | 1 | CER-2539 | 2023-10-24T21:51:00 |

This view joins `management_standards` to `certification_records`, producing a denormalized view of each certification enriched with the standard's full details. It answers: "Which certification records are issued against this management standard?" A row for standard "Primary Standard A" (id 100) would show certificate "CER-2539" with status "active" and issue date "2023-10-24T21:51:00".

**View `v_certification_scope_certification_record`**

```sql
CREATE VIEW v_certification_scope_certification_record AS
SELECT a.certification_scope_id, a.scope_description, a.activity_type, a.product_category, b.id AS record_id, b.certificate_identity_number AS record_certificate_identity_number, b.current_issue_date AS record_current_issue_date
FROM certification_scopes a JOIN certification_records b ON a.certification_record_id = b.id;
```

| certification_scope_id | scope_description | activity_type | product_category | record_id | record_certificate_identity_number | record_current_issue_date |
|---|---|---|---|---|---|---|
| 1 | Integrated Model A | manufacture | composite-product-87 | 1 | CER-2539 | 2023-10-24T21:51:00 |
| 2 | Extended Cluster | service | primary-product-88 | 2 | CER-2544 | 2024-03-08T04:08:00 |
| 3 | Pilot Review | design | adaptive-product-89 | 3 | CER-2549 | 2025-08-19T11:25:00 |
| 4 | Baseline Initiative D | assembly | distributed-product-90 | 4 | CER-2554 | 2022-01-03T18:42:00 |

This view joins `certification_scopes` to `certification_records`, producing a denormalized view of each certification enriched with the scope's full details. It answers: "Which certification records are covered by this scope?" A row for scope "Integrated Model A" (id 1) with activity type "manufacture" would show certificate "CER-2539" with identity "CER-2539" and status "active".

**View `v_approval_event_certification_record_detail`**

```sql
CREATE VIEW v_approval_event_certification_record_detail AS
SELECT a.approval_event_id, a.approval_date, a.approval_number, b.id AS record_id, b.certificate_identity_number AS record_certificate_identity_number, b.current_issue_date AS record_current_issue_date
FROM approval_events a
  JOIN events_records j ON j.approval_event_id = a.approval_event_id
  JOIN certification_records b ON b.id = j.certification_record_id;
```

| approval_event_id | approval_date | approval_number | record_id | record_certificate_identity_number | record_current_issue_date |
|---|---|---|---|---|---|
| 1 | 2023-10-10T21:27:00 | APP-2621 | 1 | CER-2539 | 2023-10-24T21:51:00 |
| 1 | 2023-10-10T21:27:00 | APP-2621 | 2 | CER-2544 | 2024-03-08T04:08:00 |
| 2 | 2024-03-21T04:44:00 | APP-2628 | 2 | CER-2544 | 2024-03-08T04:08:00 |
| 2 | 2024-03-21T04:44:00 | APP-2628 | 3 | CER-2549 | 2025-08-19T11:25:00 |
| 3 | 2025-08-05T11:01:00 | APP-2635 | 3 | CER-2549 | 2025-08-19T11:25:00 |
| 3 | 2025-08-05T11:01:00 | APP-2635 | 4 | CER-2554 | 2022-01-03T18:42:00 |
| 4 | 2022-01-16T18:18:00 | APP-2642 | 4 | CER-2554 | 2022-01-03T18:42:00 |
| 4 | 2022-01-16T18:18:00 | APP-2642 | 1 | CER-2539 | 2023-10-24T21:51:00 |

This view joins `approval_events` to `certification_records`, producing a denormalized view of each approval event enriched with the associated certification record details. It answers: "Which certification records are associated with this approval event?" A row for approval "APP-2628" of type "surveillance" dated "2024-03-21T04:44:00" would show certificate "CER-2544" with status "expired" and organization id 2.

**View `v_approval_event_management_standard`**

```sql
CREATE VIEW v_approval_event_management_standard AS
SELECT a.approval_event_id, a.approval_date, a.approval_number, a.approval_type, b.id AS standard_id, b.standard_identifier AS standard_standard_identifier, b.standard_title AS standard_standard_title
FROM approval_events a JOIN management_standards b ON a.management_standard_id = b.id;
```

| approval_event_id | approval_date | approval_number | approval_type | standard_id | standard_standard_identifier | standard_standard_title |
|---|---|---|---|---|---|---|
| 1 | 2023-10-10T21:27:00 | APP-2621 | initial | 100 | STA-2646 | Primary Standard A |
| 2 | 2024-03-21T04:44:00 | APP-2628 | surveillance | 101 | STA-2649 | Composite Framework |
| 3 | 2025-08-05T11:01:00 | APP-2635 | recertification | 102 | STA-2652 | Compact Protocol |
| 4 | 2022-01-16T18:18:00 | APP-2642 | initial | 103 | STA-2655 | Legacy Programme D |

This view joins `approval_events` to `management_standards` on the standard identifier, producing a denormalized view of each approval event enriched with the standard's details. It answers: "Which management standard is the subject of this approval event?" A row for approval "APP-2635" of type "recertification" dated "2025-08-05T11:01:00" would show standard "Compact Protocol" (id 102) with version "VER-2253" issued by "extended-issuing-15".

## Synthesis

The schema models the certification domain as a central fact table surrounded by dimension tables and junction tables that resolve many-to-many relationships. The five core entities—certified organizations, certification records, management standards, certification scopes, and approval events—are normalized into separate tables, with foreign keys enforcing referential integrity and junction tables (`organizations_records`, `records_events`, `standards_records`, `events_records`) enabling flexible many-to-many associations. The nine views reconstruct domain facts by joining the normalized tables into denormalized result sets, each answering a specific analytical question about the relationships between entities. This design supports both transactional integrity through normalization and analytical convenience through denormalized views, embodying the classic star-schema pattern adapted for a complex many-to-many certification lifecycle.