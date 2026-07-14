In the domain of organizational certification management, a network of certified organizations, accreditation bodies, auditors, and management standards interlocks through a structured lifecycle of approvals, scopes, and statuses. The relational schema captures this ecosystem by normalizing each entity into its own table, binding them through foreign keys, and exposing multi-entity perspectives through materialized views. The six base tables — `certified_organizations`, `certification_bodies`, `certification_records`, `management_standards`, `auditors`, and `approval_histories` — together encode the full provenance of a certification event: which organization was certified, by which body, under which standard, by which auditor, and with what temporal and status metadata.

## Base Tables and Entity Types

The schema's anchor is the `certified_organizations` table, which stores the legal identity and geographic address of every entity that has undergone certification. Each row carries a surrogate primary key `id`, a human-readable `legal_name`, and a suite of address fields — `street_address`, `postal_code`, `city`, and `country` — alongside a `registration_number` for legal traceability. The table also embeds two foreign keys: `certification_body_id` points to the accrediting body that granted the organization's certification, and `certification_record_certificate_identity_number` links back to the specific `certification_records` row that documents the certification event. For example, the organization `Adaptive Model` (id 1, registration `REG-2136`) resides at `composite-street-15` in `integrated-city-34` within `compact-country-26`, and is associated with certification body id 1 and certificate identity number `CER-2539`.

**Table `certified_organizations`**

| id | legal_name | street_address | postal_code | city | country | registration_number | certification_body_id | certification_record_certificate_identity_number |
|---|---|---|---|---|---|---|---|---|
| 1 | Adaptive Model | composite-street-15 | 9125611 | integrated-city-34 | compact-country-26 | REG-2136 | 1 | CER-2539 |
| 2 | Primary Cluster | primary-street-16 | ChIJt4hBkzhu5kcRJJDUNqGUpso | seasonal-city-35 | composite-country-27 | REG-2142 | 2 | CER-2544 |
| 3 | Composite Review D | adaptive-street-17 | 3001009030200 | regional-city-36 | primary-country-28 | REG-2148 | 3 | CER-2549 |
| 4 | Compact Initiative | distributed-street-18 | 4060635 | legacy-city-37 | adaptive-country-29 | REG-2154 | 4 | CER-2554 |

The `certification_bodies` table mirrors this bidirectional linkage. Each row represents an accreditation authority, identified by `id`, `body_name`, `accreditation_code`, and `jurisdiction`. The foreign key `certified_organization_id` points to the organization that the body certifies, while `certification_record_certificate_identity_number` ties the body to the specific certification record it issued. The body `Regional Corridor` (id 1, accreditation code `4180961`) operates in `regional-jurisdic-30` and is linked to organization id 1 and certificate `CER-2539`.

**Table `certification_bodies`**

| id | body_name | accreditation_code | jurisdiction | certified_organization_id | certification_record_certificate_identity_number |
|---|---|---|---|---|---|
| 1 | Regional Corridor | 4180961 | regional-jurisdic-30 | 1 | CER-2539 |
| 2 | Seasonal Series D | 8189493 | legacy-jurisdic-31 | 2 | CER-2544 |
| 3 | Integrated Assessment | 1996919 | compact-jurisdic-32 | 3 | CER-2549 |
| 4 | Extended Survey | 5082986 | composite-jurisdic-33 | 4 | CER-2554 |

At the centre of the schema sits `certification_records`, the fact table that materializes each certification event. Its primary key is `certificate_identity_number`, a business key such as `CER-2539` or `CER-2544`. The record carries temporal metadata (`current_issue_date`, `expiry_date`), a `scope_description` (e.g., "Integrated Model A" or "Extended Cluster"), and a `status` column that enumerates the lifecycle state — `active`, `expired`, `suspended`, or `withdrawn`. Five foreign keys anchor the record to the surrounding entities: `certified_organization_id` references the certified entity, `management_standard_id` references the applicable standard, `certification_body_id` references the accrediting body, and `auditor_id` references the individual auditor who conducted the assessment. A self-referencing column, `certification_record_certificate_identity_number`, enables audit trails and re-certification chains. The record `CER-2539` (approval `APP-2621`, issued `2023-10-24T21:51:00`, status `active`) links organization 1, standard 1, body 1, and auditor 1000.

**Table `certification_records`**

| certificate_identity_number | approval_number | current_issue_date | expiry_date | scope_description | status | certified_organization_id | management_standard_id | certification_body_id | auditor_id | certification_record_certificate_identity_number |
|---|---|---|---|---|---|---|---|---|---|---|
| CER-2539 | APP-2621 | 2023-10-24T21:51:00 | 2023-10-24 | Integrated Model A | active | 1 | 1 | 1 | 1000 | CER-2539 |
| CER-2544 | APP-2628 | 2024-03-08T04:08:00 | 2024-03-08 | Extended Cluster | expired | 2 | 2 | 2 | 1001 | CER-2544 |
| CER-2549 | APP-2635 | 2025-08-19T11:25:00 | 2025-08-19 | Pilot Review | suspended | 3 | 3 | 3 | 1002 | CER-2549 |
| CER-2554 | APP-2642 | 2022-01-03T18:42:00 | 2022-01-03 | Baseline Initiative D | withdrawn | 4 | 4 | 4 | 1003 | CER-2554 |

The `management_standards` table catalogs the normative frameworks under which certifications are granted. Each row is keyed by `management_standard_id` and carries a `standard_identifier` (e.g., `STA-2646`), a `standard_version` (e.g., `compact-standard-86`), and the `issuing_organization` (e.g., `Alphabet Inc Class A`). A foreign key `certification_record_certificate_identity_number` links each standard to the certification record that invokes it. Standard 1 (`STA-2646`, version `compact-standard-86`, issued by `Alphabet Inc Class A`) is referenced by certificate `CER-2539`.

**Table `management_standards`**

| management_standard_id | standard_identifier | standard_version | issuing_organization | certification_record_certificate_identity_number |
|---|---|---|---|---|
| 1 | STA-2646 | compact-standard-86 | Alphabet Inc Class A | CER-2539 |
| 2 | STA-2649 | composite-standard-87 | ITT Industries | CER-2544 |
| 3 | STA-2652 | primary-standard-88 | Switch Card Services Ltd. | CER-2549 |
| 4 | STA-2655 | adaptive-standard-89 | Buypass AS | CER-2554 |

The `auditors` table stores the personnel who perform certification assessments. Each auditor has a surrogate `id`, a `auditor_name`, a `auditor_title`, and a `region` of operation. Two foreign keys bind the auditor to the broader schema: `certification_record_certificate_identity_number` links the auditor to the specific certification record they assessed, and `certification_body_id` links them to the body under which they operate. Auditor 1000, named `Compact Initiative` with title `Extended Survey`, operates in `distributed-region-12`, is associated with certificate `CER-2539`, and works under certification body 1.

**Table `auditors`**

| id | auditor_name | auditor_title | region | certification_record_certificate_identity_number | certification_body_id |
|---|---|---|---|---|---|
| 1000 | Compact Initiative | Extended Survey | distributed-region-12 | CER-2539 | 1 |
| 1001 | Legacy Model | Pilot Corridor A | baseline-region-13 | CER-2544 | 2 |
| 1002 | Regional Cluster A | Baseline Series | pilot-region-14 | CER-2549 | 3 |
| 1003 | Seasonal Review | Distributed Assessment | extended-region-15 | CER-2554 | 4 |

Finally, `approval_histories` captures the temporal provenance of certifications. Each row, keyed by `approval_history_id`, records an `original_approval_date`, a `historical_approval_number` (e.g., `HIS-2669`), and a `historical_standard` (e.g., `seasonal-historic-53`). Two foreign keys — `certified_organization_id` and `management_standard_id` — tie the historical approval to the organization and the standard it pertains to. History entry 1000 (date `2025-08-04`, number `HIS-2669`, standard `seasonal-historic-53`) links organization 1 with standard 1.

**Table `approval_histories`**

| approval_history_id | original_approval_date | historical_approval_number | historical_standard | certified_organization_id | management_standard_id |
|---|---|---|---|---|---|
| 1000 | 2025-08-04 | HIS-2669 | seasonal-historic-53 | 1 | 1 |
| 1001 | 2022-01-15 | HIS-2676 | regional-historic-54 | 2 | 2 |
| 1002 | 2023-06-26 | HIS-2683 | legacy-historic-55 | 3 | 3 |
| 1003 | 2024-11-10 | HIS-2690 | compact-historic-56 | 4 | 4 |

## Foreign-Key Topology

The foreign-key graph forms a star centred on `certification_records`. Every other base table either points into `certification_records` (via `certification_record_certificate_identity_number`) or is pointed to by it (via `certified_organization_id`, `management_standard_id`, `certification_body_id`, `auditor_id`). The `certified_organizations` and `certification_bodies` tables each carry a dual foreign key — one pointing to the other table and one pointing to `certification_records` — creating a triangular linkage that ensures referential integrity across the organization–body–record triad. The `approval_histories` table forms a secondary star, linking organizations and standards through historical approvals without directly referencing the current certification record, thereby preserving a clean separation between current and historical states.

## Views as Reconstructed Domain Facts

Each view in the schema is a declarative join that reconstructs a domain fact from the normalized tables. The views fall into three categories: entity-to-entity bridges, entity-to-record enrichments, and record-centric multi-entity rollups.

### Entity-to-Entity Bridges

The view `certified_organization_certification_body_view` joins `certified_organizations` with `certification_bodies` on their mutual foreign keys, answering the question: "Which certification body is associated with which certified organization?" A row from this view might show `Adaptive Model` paired with `Regional Corridor`, revealing the direct organizational accreditation relationship.

The view `certification_body_certified_organization_view` performs the inverse join, answering: "Which certified organizations does a given certification body serve?" A row might pair `Regional Corridor` with `Adaptive Model`, presenting the body's perspective on its portfolio.

### Entity-to-Record Enrichments

The view `certified_organization_certification_record_view` joins `certified_organizations` with `certification_records`, answering: "What certification records belong to a given organization?" A row might show `Adaptive Model` alongside certificate `CER-2539` with scope "Integrated Model A" and status `active`, giving the organization a direct view of its certification portfolio.

The view `certification_body_certification_record_view` joins `certification_bodies` with `certification_records`, answering: "Which certification records has a given body issued?" A row might pair `Regional Corridor` with `CER-2539`, revealing the body's issuance history.

The view `management_standard_certification_record_view` joins `management_standards` with `certification_records`, answering: "Which certification records invoke a given management standard?" A row might show standard `STA-2646` (version `compact-standard-86`, issued by `Alphabet Inc Class A`) alongside certificate `CER-2539`, tracing the standard's practical application.

### Record-Centric Multi-Entity Rollups

The view `certification_record_certified_organization_view` joins `certification_records` with `certified_organizations`, answering: "For a given certification record, which organization is certified?" A row might present `CER-2539` alongside `Adaptive Model` at `composite-street-15`, `integrated-city-34`, `compact-country-26`, providing the full organizational context for the record.

The view `certification_record_management_standard_view` joins `certification_records` with `management_standards`, answering: "For a given certification record, which management standard applies?" A row might show `CER-2539` alongside standard `STA-2646` (version `compact-standard-86`, issued by `Alphabet Inc Class A`), revealing the normative framework under which the certification was granted.

The view `certification_record_certification_body_view` joins `certification_records` with `certification_bodies`, answering: "For a given certification record, which body issued it?" A row might pair `CER-2539` with `Regional Corridor` (accreditation code `4180961`, jurisdiction `regional-jurisdic-30`), providing the accrediting authority's details.

The view `certification_record_auditor_view` joins `certification_records` with `auditors`, answering: "For a given certification record, which auditor conducted the assessment?" A row might show `CER-2539` alongside auditor 1000 (`Compact Initiative`, title `Extended Survey`, region `distributed-region-12`), identifying the assessor.

The view `certification_record_certification_record_view` is a self-join on `certification_records`, answering: "How does a certification record relate to itself through its audit trail?" A row might show `CER-2539` linked to itself, enabling the view to surface re-certification chains and historical references within the certification lifecycle.

The view `auditor_certification_record_view` joins `auditors` with `certification_records`, answering: "Which certification records has a given auditor assessed?" A row might pair auditor 1000 (`Compact Initiative`) with certificate `CER-2539` (scope "Integrated Model A", status `active`), presenting the auditor's assessment history.

The view `auditor_certification_body_view` joins `auditors` with `certification_bodies`, answering: "Which certification body does a given auditor work under?" A row might show auditor 1000 (`Compact Initiative`) alongside body 1 (`Regional Corridor`, accreditation code `4180961`), revealing the organizational affiliation of the assessor.

### Historical Provenance Views

The view `approval_history_certified_organization_view` joins `approval_histories` with `certified_organizations`, answering: "For a given historical approval, which organization was involved?" A row might show history entry 1000 (date `2025-08-04`, number `HIS-2669`, standard `seasonal-historic-53`) alongside organization `Adaptive Model` (registration `REG-2136`), tracing the organization's historical certification lineage.

The view `approval_history_management_standard_view` joins `approval_histories` with `management_standards`, answering: "For a given historical approval, which management standard was referenced?" A row might pair history entry 1000 (standard `seasonal-historic-53`) with standard 1 (`STA-2646`, version `compact-standard-86`, issued by `Alphabet Inc Class A`), connecting historical approvals to their current standard equivalents.

## Closing Synthesis

The schema models certification management as a fact-centric star topology: `certification_records` sits at the centre, radiating foreign-key relationships to `certified_organizations`, `certification_bodies`, `management_standards`, and `auditors`, while `approval_histories` forms a parallel historical star anchored on organizations and standards. The fourteen views materialize every pairwise and record-centric perspective that a practitioner might need — from "which body certifies which organization" to "which auditor assessed which record under which standard" — by joining the normalized base tables. Each view answers a single, well-scoped question, and together they provide a complete relational lens on the certification domain without requiring ad-hoc joins at query time.

## Data appendix

**View `certified_organization_certification_body_view`**

```sql
CREATE VIEW certified_organization_certification_body_view AS
SELECT a.id, a.legal_name, a.street_address, a.postal_code, b.id AS body_id, b.body_name AS body_body_name, b.accreditation_code AS body_accreditation_code
FROM certified_organizations a JOIN certification_bodies b ON a.certification_body_id = b.id;
```

| id | legal_name | street_address | postal_code | body_id | body_body_name | body_accreditation_code |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | composite-street-15 | 9125611 | 1 | Regional Corridor | 4180961 |
| 2 | Primary Cluster | primary-street-16 | ChIJt4hBkzhu5kcRJJDUNqGUpso | 2 | Seasonal Series D | 8189493 |
| 3 | Composite Review D | adaptive-street-17 | 3001009030200 | 3 | Integrated Assessment | 1996919 |
| 4 | Compact Initiative | distributed-street-18 | 4060635 | 4 | Extended Survey | 5082986 |

**View `certified_organization_certification_record_view`**

```sql
CREATE VIEW certified_organization_certification_record_view AS
SELECT a.id, a.legal_name, a.street_address, a.postal_code, b.certificate_identity_number AS record_certificate_identity_number, b.approval_number AS record_approval_number, b.current_issue_date AS record_current_issue_date
FROM certified_organizations a JOIN certification_records b ON a.certification_record_certificate_identity_number = b.certificate_identity_number;
```

| id | legal_name | street_address | postal_code | record_certificate_identity_number | record_approval_number | record_current_issue_date |
|---|---|---|---|---|---|---|
| 1 | Adaptive Model | composite-street-15 | 9125611 | CER-2539 | APP-2621 | 2023-10-24T21:51:00 |
| 2 | Primary Cluster | primary-street-16 | ChIJt4hBkzhu5kcRJJDUNqGUpso | CER-2544 | APP-2628 | 2024-03-08T04:08:00 |
| 3 | Composite Review D | adaptive-street-17 | 3001009030200 | CER-2549 | APP-2635 | 2025-08-19T11:25:00 |
| 4 | Compact Initiative | distributed-street-18 | 4060635 | CER-2554 | APP-2642 | 2022-01-03T18:42:00 |

**View `certification_body_certified_organization_view`**

```sql
CREATE VIEW certification_body_certified_organization_view AS
SELECT a.id, a.body_name, a.accreditation_code, a.jurisdiction, b.id AS organization_id, b.legal_name AS organization_legal_name, b.street_address AS organization_street_address
FROM certification_bodies a JOIN certified_organizations b ON a.certified_organization_id = b.id;
```

| id | body_name | accreditation_code | jurisdiction | organization_id | organization_legal_name | organization_street_address |
|---|---|---|---|---|---|---|
| 1 | Regional Corridor | 4180961 | regional-jurisdic-30 | 1 | Adaptive Model | composite-street-15 |
| 2 | Seasonal Series D | 8189493 | legacy-jurisdic-31 | 2 | Primary Cluster | primary-street-16 |
| 3 | Integrated Assessment | 1996919 | compact-jurisdic-32 | 3 | Composite Review D | adaptive-street-17 |
| 4 | Extended Survey | 5082986 | composite-jurisdic-33 | 4 | Compact Initiative | distributed-street-18 |

**View `certification_body_certification_record_view`**

```sql
CREATE VIEW certification_body_certification_record_view AS
SELECT a.id, a.body_name, a.accreditation_code, a.jurisdiction, b.certificate_identity_number AS record_certificate_identity_number, b.approval_number AS record_approval_number, b.current_issue_date AS record_current_issue_date
FROM certification_bodies a JOIN certification_records b ON a.certification_record_certificate_identity_number = b.certificate_identity_number;
```

| id | body_name | accreditation_code | jurisdiction | record_certificate_identity_number | record_approval_number | record_current_issue_date |
|---|---|---|---|---|---|---|
| 1 | Regional Corridor | 4180961 | regional-jurisdic-30 | CER-2539 | APP-2621 | 2023-10-24T21:51:00 |
| 2 | Seasonal Series D | 8189493 | legacy-jurisdic-31 | CER-2544 | APP-2628 | 2024-03-08T04:08:00 |
| 3 | Integrated Assessment | 1996919 | compact-jurisdic-32 | CER-2549 | APP-2635 | 2025-08-19T11:25:00 |
| 4 | Extended Survey | 5082986 | composite-jurisdic-33 | CER-2554 | APP-2642 | 2022-01-03T18:42:00 |

**View `certification_record_certified_organization_view`**

```sql
CREATE VIEW certification_record_certified_organization_view AS
SELECT a.certificate_identity_number, a.approval_number, a.current_issue_date, a.expiry_date, b.id AS organization_id, b.legal_name AS organization_legal_name, b.street_address AS organization_street_address
FROM certification_records a JOIN certified_organizations b ON a.certified_organization_id = b.id;
```

| certificate_identity_number | approval_number | current_issue_date | expiry_date | organization_id | organization_legal_name | organization_street_address |
|---|---|---|---|---|---|---|
| CER-2539 | APP-2621 | 2023-10-24T21:51:00 | 2023-10-24 | 1 | Adaptive Model | composite-street-15 |
| CER-2544 | APP-2628 | 2024-03-08T04:08:00 | 2024-03-08 | 2 | Primary Cluster | primary-street-16 |
| CER-2549 | APP-2635 | 2025-08-19T11:25:00 | 2025-08-19 | 3 | Composite Review D | adaptive-street-17 |
| CER-2554 | APP-2642 | 2022-01-03T18:42:00 | 2022-01-03 | 4 | Compact Initiative | distributed-street-18 |

**View `certification_record_management_standard_view`**

```sql
CREATE VIEW certification_record_management_standard_view AS
SELECT a.certificate_identity_number, a.approval_number, a.current_issue_date, a.expiry_date, b.management_standard_id AS standard_management_standard_id, b.standard_identifier AS standard_standard_identifier, b.standard_version AS standard_standard_version
FROM certification_records a JOIN management_standards b ON a.management_standard_id = b.management_standard_id;
```

| certificate_identity_number | approval_number | current_issue_date | expiry_date | standard_management_standard_id | standard_standard_identifier | standard_standard_version |
|---|---|---|---|---|---|---|
| CER-2539 | APP-2621 | 2023-10-24T21:51:00 | 2023-10-24 | 1 | STA-2646 | compact-standard-86 |
| CER-2544 | APP-2628 | 2024-03-08T04:08:00 | 2024-03-08 | 2 | STA-2649 | composite-standard-87 |
| CER-2549 | APP-2635 | 2025-08-19T11:25:00 | 2025-08-19 | 3 | STA-2652 | primary-standard-88 |
| CER-2554 | APP-2642 | 2022-01-03T18:42:00 | 2022-01-03 | 4 | STA-2655 | adaptive-standard-89 |

**View `certification_record_certification_body_view`**

```sql
CREATE VIEW certification_record_certification_body_view AS
SELECT a.certificate_identity_number, a.approval_number, a.current_issue_date, a.expiry_date, b.id AS body_id, b.body_name AS body_body_name, b.accreditation_code AS body_accreditation_code
FROM certification_records a JOIN certification_bodies b ON a.certification_body_id = b.id;
```

| certificate_identity_number | approval_number | current_issue_date | expiry_date | body_id | body_body_name | body_accreditation_code |
|---|---|---|---|---|---|---|
| CER-2539 | APP-2621 | 2023-10-24T21:51:00 | 2023-10-24 | 1 | Regional Corridor | 4180961 |
| CER-2544 | APP-2628 | 2024-03-08T04:08:00 | 2024-03-08 | 2 | Seasonal Series D | 8189493 |
| CER-2549 | APP-2635 | 2025-08-19T11:25:00 | 2025-08-19 | 3 | Integrated Assessment | 1996919 |
| CER-2554 | APP-2642 | 2022-01-03T18:42:00 | 2022-01-03 | 4 | Extended Survey | 5082986 |

**View `certification_record_auditor_view`**

```sql
CREATE VIEW certification_record_auditor_view AS
SELECT a.certificate_identity_number, a.approval_number, a.current_issue_date, a.expiry_date, b.id AS auditor_id, b.auditor_name AS auditor_auditor_name, b.auditor_title AS auditor_auditor_title
FROM certification_records a JOIN auditors b ON a.auditor_id = b.id;
```

| certificate_identity_number | approval_number | current_issue_date | expiry_date | auditor_id | auditor_auditor_name | auditor_auditor_title |
|---|---|---|---|---|---|---|
| CER-2539 | APP-2621 | 2023-10-24T21:51:00 | 2023-10-24 | 1000 | Compact Initiative | Extended Survey |
| CER-2544 | APP-2628 | 2024-03-08T04:08:00 | 2024-03-08 | 1001 | Legacy Model | Pilot Corridor A |
| CER-2549 | APP-2635 | 2025-08-19T11:25:00 | 2025-08-19 | 1002 | Regional Cluster A | Baseline Series |
| CER-2554 | APP-2642 | 2022-01-03T18:42:00 | 2022-01-03 | 1003 | Seasonal Review | Distributed Assessment |

**View `certification_record_certification_record_view`**

```sql
CREATE VIEW certification_record_certification_record_view AS
SELECT a.certificate_identity_number, a.approval_number, a.current_issue_date, a.expiry_date, b.certificate_identity_number AS record_certificate_identity_number, b.approval_number AS record_approval_number, b.current_issue_date AS record_current_issue_date
FROM certification_records a JOIN certification_records b ON a.certification_record_certificate_identity_number = b.certificate_identity_number;
```

| certificate_identity_number | approval_number | current_issue_date | expiry_date | record_certificate_identity_number | record_approval_number | record_current_issue_date |
|---|---|---|---|---|---|---|
| CER-2539 | APP-2621 | 2023-10-24T21:51:00 | 2023-10-24 | CER-2539 | APP-2621 | 2023-10-24T21:51:00 |
| CER-2544 | APP-2628 | 2024-03-08T04:08:00 | 2024-03-08 | CER-2544 | APP-2628 | 2024-03-08T04:08:00 |
| CER-2549 | APP-2635 | 2025-08-19T11:25:00 | 2025-08-19 | CER-2549 | APP-2635 | 2025-08-19T11:25:00 |
| CER-2554 | APP-2642 | 2022-01-03T18:42:00 | 2022-01-03 | CER-2554 | APP-2642 | 2022-01-03T18:42:00 |

**View `management_standard_certification_record_view`**

```sql
CREATE VIEW management_standard_certification_record_view AS
SELECT a.management_standard_id, a.standard_identifier, a.standard_version, a.issuing_organization, b.certificate_identity_number AS record_certificate_identity_number, b.approval_number AS record_approval_number, b.current_issue_date AS record_current_issue_date
FROM management_standards a JOIN certification_records b ON a.certification_record_certificate_identity_number = b.certificate_identity_number;
```

| management_standard_id | standard_identifier | standard_version | issuing_organization | record_certificate_identity_number | record_approval_number | record_current_issue_date |
|---|---|---|---|---|---|---|
| 1 | STA-2646 | compact-standard-86 | Alphabet Inc Class A | CER-2539 | APP-2621 | 2023-10-24T21:51:00 |
| 2 | STA-2649 | composite-standard-87 | ITT Industries | CER-2544 | APP-2628 | 2024-03-08T04:08:00 |
| 3 | STA-2652 | primary-standard-88 | Switch Card Services Ltd. | CER-2549 | APP-2635 | 2025-08-19T11:25:00 |
| 4 | STA-2655 | adaptive-standard-89 | Buypass AS | CER-2554 | APP-2642 | 2022-01-03T18:42:00 |

**View `auditor_certification_record_view`**

```sql
CREATE VIEW auditor_certification_record_view AS
SELECT a.id, a.auditor_name, a.auditor_title, a.region, b.certificate_identity_number AS record_certificate_identity_number, b.approval_number AS record_approval_number, b.current_issue_date AS record_current_issue_date
FROM auditors a JOIN certification_records b ON a.certification_record_certificate_identity_number = b.certificate_identity_number;
```

| id | auditor_name | auditor_title | region | record_certificate_identity_number | record_approval_number | record_current_issue_date |
|---|---|---|---|---|---|---|
| 1000 | Compact Initiative | Extended Survey | distributed-region-12 | CER-2539 | APP-2621 | 2023-10-24T21:51:00 |
| 1001 | Legacy Model | Pilot Corridor A | baseline-region-13 | CER-2544 | APP-2628 | 2024-03-08T04:08:00 |
| 1002 | Regional Cluster A | Baseline Series | pilot-region-14 | CER-2549 | APP-2635 | 2025-08-19T11:25:00 |
| 1003 | Seasonal Review | Distributed Assessment | extended-region-15 | CER-2554 | APP-2642 | 2022-01-03T18:42:00 |

**View `auditor_certification_body_view`**

```sql
CREATE VIEW auditor_certification_body_view AS
SELECT a.id, a.auditor_name, a.auditor_title, a.region, b.id AS body_id, b.body_name AS body_body_name, b.accreditation_code AS body_accreditation_code
FROM auditors a JOIN certification_bodies b ON a.certification_body_id = b.id;
```

| id | auditor_name | auditor_title | region | body_id | body_body_name | body_accreditation_code |
|---|---|---|---|---|---|---|
| 1000 | Compact Initiative | Extended Survey | distributed-region-12 | 1 | Regional Corridor | 4180961 |
| 1001 | Legacy Model | Pilot Corridor A | baseline-region-13 | 2 | Seasonal Series D | 8189493 |
| 1002 | Regional Cluster A | Baseline Series | pilot-region-14 | 3 | Integrated Assessment | 1996919 |
| 1003 | Seasonal Review | Distributed Assessment | extended-region-15 | 4 | Extended Survey | 5082986 |

**View `approval_history_certified_organization_view`**

```sql
CREATE VIEW approval_history_certified_organization_view AS
SELECT a.approval_history_id, a.original_approval_date, a.historical_approval_number, a.historical_standard, b.id AS organization_id, b.legal_name AS organization_legal_name, b.street_address AS organization_street_address
FROM approval_histories a JOIN certified_organizations b ON a.certified_organization_id = b.id;
```

| approval_history_id | original_approval_date | historical_approval_number | historical_standard | organization_id | organization_legal_name | organization_street_address |
|---|---|---|---|---|---|---|
| 1000 | 2025-08-04 | HIS-2669 | seasonal-historic-53 | 1 | Adaptive Model | composite-street-15 |
| 1001 | 2022-01-15 | HIS-2676 | regional-historic-54 | 2 | Primary Cluster | primary-street-16 |
| 1002 | 2023-06-26 | HIS-2683 | legacy-historic-55 | 3 | Composite Review D | adaptive-street-17 |
| 1003 | 2024-11-10 | HIS-2690 | compact-historic-56 | 4 | Compact Initiative | distributed-street-18 |

**View `approval_history_management_standard_view`**

```sql
CREATE VIEW approval_history_management_standard_view AS
SELECT a.approval_history_id, a.original_approval_date, a.historical_approval_number, a.historical_standard, b.management_standard_id AS standard_management_standard_id, b.standard_identifier AS standard_standard_identifier, b.standard_version AS standard_standard_version
FROM approval_histories a JOIN management_standards b ON a.management_standard_id = b.management_standard_id;
```

| approval_history_id | original_approval_date | historical_approval_number | historical_standard | standard_management_standard_id | standard_standard_identifier | standard_standard_version |
|---|---|---|---|---|---|---|
| 1000 | 2025-08-04 | HIS-2669 | seasonal-historic-53 | 1 | STA-2646 | compact-standard-86 |
| 1001 | 2022-01-15 | HIS-2676 | regional-historic-54 | 2 | STA-2649 | composite-standard-87 |
| 1002 | 2023-06-26 | HIS-2683 | legacy-historic-55 | 3 | STA-2652 | primary-standard-88 |
| 1003 | 2024-11-10 | HIS-2690 | compact-historic-56 | 4 | STA-2655 | adaptive-standard-89 |
