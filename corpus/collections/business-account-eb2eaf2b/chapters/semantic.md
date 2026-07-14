## Ontology-Grounded Relational Modelling in Labor Costing Systems

The labor costing domain captures the organisational relationships between business entities, their software administrators, work methods, motion elements, and the standard element libraries that govern time-value calculations. At the conceptual level, the ontology distinguishes eight entity types—business accounts, software administrators, work methods, motion elements, standard element libraries, localized descriptions, platform companies, and labor costing software—connected through a mixture of direct foreign-key associations and many-to-many junction tables. The relational schema materialises these concepts as eleven base tables and seventeen derived views, each view representing a specific join that reconstructs a domain fact from the normalised tables. This chapter walks through the entity types, their attributes, the cardinality-bounded relationships that become columns and junction tables, and the view-level joins that answer concrete business questions.

**Table `business_accounts`**

| business_identifier | vat_number | registered_address | subscription_status | primary_language | software_administrator_id | method_id | labor_costing_software_id |
|---|---|---|---|---|---|---|---|
| BUS-2254 | VAT-2449 | regional-register-36 | active | English | 100 | 209228 | 1 |
| BUS-2255 | VAT-2453 | legacy-register-37 | suspended | Romanian | 101 | 7441161 | 2 |
| BUS-2256 | VAT-2457 | compact-register-38 | expired | English | 102 | 89447 | 3 |
| BUS-2257 | VAT-2461 | composite-register-39 | pending_verification | Romanian | 103 | 4180941 | 4 |

The `business_accounts` table anchors the organisational layer. Each row represents a distinct business entity identified by a `business_identifier` such as `BUS-2254` or `BUS-2255`, accompanied by a `vat_number` like `VAT-2449` and a `registered_address` drawn from values such as `regional-register-36` and `legacy-register-37`. The `subscription_status` column classifies the account lifecycle into states including `active`, `suspended`, `expired`, and `pending_verification`, while `primary_language` records the organisational language preference as `English` or `Romanian`. Three foreign-key columns—`software_administrator_id`, `method_id`, and `labor_costing_software_id`—bind each business account to its administrator, its primary work method, and its labour costing software platform. For instance, `BUS-2254` references administrator `100`, work method `209228`, and labor costing software `1`, establishing a three-way association at the account level.

**Table `software_administrators`**

| id | administrator_id | role_status | authorization_level | business_account_vat_number | method_id |
|---|---|---|---|---|---|
| 100 | 10449535 | active | full_admin | VAT-2449 | 209228 |
| 101 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | transferred | restricted | VAT-2453 | 7441161 |
| 102 | artemyarulin | revoked | full_admin | VAT-2457 | 89447 |
| 103 | gd_taxc_1121 | active | restricted | VAT-2461 | 4180941 |

The `software_administrators` table models the people or service identities that manage business accounts. Its surrogate key `id` takes integer values like `100` and `101`, while the `administrator_id` column carries heterogeneous identifiers—numeric strings such as `10449535`, UUIDs like `df2e3438-8fcc-11eb-924d-9cd76263cbd0`, and alphanumeric handles such as `artemyarulin` and `gd_taxc_1121`. The `role_status` column records the current standing of the administrator (`active`, `transferred`, `revoked`), and `authorization_level` distinguishes between `full_admin` and `restricted` privilege tiers. Two foreign keys anchor the administrator to the organisation it serves (`business_account_vat_number`, referencing `VAT-2449` through `VAT-2461`) and to the work method it operates (`method_id`, referencing `209228` through `4180941`). This dual foreign-key design enforces the cardinality constraint that each administrator is associated with exactly one business account and one work method.

**Table `work_methods`**

| method_id | data_classification | creation_date | export_format | language_code | business_account_vat_number | standard_element_library_id |
|---|---|---|---|---|---|---|
| 209228 | private | 2022-01-13T12:24:00 | PDF | 20723567 | VAT-2449 | 1 |
| 7441161 | public | 2023-06-24T19:41:00 | Excel | 32825 | VAT-2453 | 2 |
| 89447 | shared | 2024-11-08T02:58:00 | EDI_flat_file | b_VB-EC-15 | VAT-2457 | 3 |
| 4180941 | private | 2025-04-19T09:15:00 | PDF | 974927 | VAT-2461 | 4 |

Work methods represent the procedural artefacts through which labour costing calculations are executed. The `method_id` column serves as the primary key, with values such as `209228`, `7441161`, `89447`, and `4180941`. The `data_classification` attribute classifies each method as `private`, `public`, or `shared`, while `creation_date` records the timestamp of method instantiation (e.g., `2022-01-13T12:24:00` or `2025-04-19T09:15:00`). The `export_format` column specifies the output serialization—`PDF`, `Excel`, or `EDI_flat_file`—and `language_code` stores a locale identifier such as `20723567` or `b_VB-EC-15`. Two foreign keys bind the work method to its owning business account (`business_account_vat_number`) and to its governing standard element library (`standard_element_library_id`, referencing values `1` through `4`). This structure ensures that every work method is traceable to both an organisational owner and a library of standardised motion elements.

**Table `motion_elements`**

| id | element_id | element_type | standard_time_value | copyright_owner | method_id | localized_description_id |
|---|---|---|---|---|---|---|
| 1 | 0471948470 | predefined_macro | 11.70 | Company | 209228 | 100 |
| 2 | 605949 | custom_developed | 14.40 | Business | 7441161 | 101 |
| 3 | 10449522 | shared_item | 17.10 | Shared_Parties | 89447 | 102 |
| 4 | 325465 | predefined_macro | 19.80 | Company | 4180941 | 103 |

Motion elements are the atomic time-value units used within work methods. The `id` column provides a surrogate primary key, while `element_id` carries the business identifier for the motion element—values such as `0471948470`, `605949`, `10449522`, and `325465`. The `element_type` attribute distinguishes between `predefined_macro`, `custom_developed`, and `shared_item`, and `standard_time_value` records the quantitative time cost (e.g., `11.70`, `14.40`, `17.10`, `19.80`). The `copyright_owner` column indicates ownership as `Company`, `Business`, or `Shared_Parties`. Two foreign keys anchor each motion element to its parent work method (`method_id`) and to its human-readable description (`localized_description_id`, referencing `100` through `103`). The cardinality here is bounded: each motion element belongs to exactly one work method and has exactly one associated localized description.

**Table `standard_element_libraries`**

| standard_element_library_id | library_version | content_status | last_updated | platform_company_id |
|---|---|---|---|---|
| 1 | primary-library-64 | active | 2023-06-17T17:27:00 | 100 |
| 2 | adaptive-library-65 | deprecated | 2024-11-01T00:44:00 | 101 |
| 3 | distributed-library-66 | archived | 2025-04-12T07:01:00 | 102 |
| 4 | baseline-library-67 | active | 2022-09-23T14:18:00 | 103 |

Standard element libraries are curated collections of reusable motion elements. The `standard_element_library_id` column serves as the primary key with values `1` through `4`. The `library_version` column carries descriptive version strings such as `primary-library-64`, `adaptive-library-65`, `distributed-library-66`, and `baseline-library-67`. The `content_status` attribute tracks the lifecycle state of the library as `active`, `deprecated`, or `archived`, while `last_updated` records the most recent modification timestamp. A single foreign key, `platform_company_id`, binds each library to its hosting platform company (referencing `100` through `103`). This one-to-many relationship means a single platform company can host multiple standard element libraries, but each library belongs to exactly one platform company.

**Table `localized_descriptions`**

| id | locale_code | text_content | translation_status | motion_element_id |
|---|---|---|---|---|
| 100 | en | integrated-text-58 | verified | 1 |
| 101 | ro | seasonal-text-59 | draft | 2 |
| 102 | en | regional-text-60 | pending | 3 |
| 103 | ro | legacy-text-61 | verified | 4 |

Localized descriptions provide human-readable text for motion elements across different locales. The `id` column is the primary key, with values `100` through `103`. The `locale_code` column specifies the language locale (`en` for English, `ro` for Romanian), and `text_content` carries the actual description text such as `integrated-text-58`, `seasonal-text-59`, `regional-text-60`, and `legacy-text-61`. The `translation_status` attribute records the verification state as `verified`, `draft`, or `pending`. A foreign key, `motion_element_id`, binds each description to its parent motion element (referencing `1` through `4`), enforcing the constraint that each motion element has exactly one localized description row.

**Table `platform_companies`**

| id | company_registration_number | vat_number | registered_office | jurisdiction | labor_costing_software_id | standard_element_library_id |
|---|---|---|---|---|---|---|
| 100 | American Airlines Group | VAT-2449 | pilot-register-20 | regional-jurisdic-30 | 1 | 1 |
| 101 | Sanniquellie Mahn | VAT-2453 | extended-register-21 | legacy-jurisdic-31 | 2 | 2 |
| 102 | Link Title | VAT-2457 | integrated-register-22 | compact-jurisdic-32 | 3 | 3 |
| 103 | Gazprom Neft | VAT-2461 | seasonal-register-23 | composite-jurisdic-33 | 4 | 4 |

Platform companies represent the organisations that host and distribute standard element libraries. Each row identifies a platform company with a surrogate key and associated metadata that ties it to the broader ecosystem of labor costing software and libraries. The platform company entity serves as the organisational root for the library distribution chain, with its identity referenced by both `standard_element_libraries` and `labor_costing_softwares`.

**Table `labor_costing_softwares`**

| id | software_version | licensing_model | edi_enabled | export_capabilities | standard_element_library_id | created_at |
|---|---|---|---|---|---|---|
| 1 | seasonal-software-47 | primary-licensin-16 | false | PDF | 1 | 2025-01-01 00:14:00 |
| 2 | regional-software-48 | adaptive-licensin-17 | true | Excel | 2 | 2025-02-06 03:14:00 |
| 3 | legacy-software-49 | distributed-licensin-18 | false | EDI_flat_file | 3 | 2025-03-11 06:14:00 |
| 4 | compact-software-50 | baseline-licensin-19 | true | PDF | 4 | 2025-04-16 09:14:00 |

Labor costing software represents the commercial or open-source software platforms used by business accounts to perform time-value calculations. Each row identifies a software product with a surrogate key and metadata describing its capabilities and licensing. The labor costing software entity is referenced by `business_accounts` through the `labor_costing_software_id` column, establishing the association between a business account and the software platform it uses.

The many-to-many relationships between work methods and motion elements, and between standard element libraries and motion elements, are materialised through two junction tables.

**Table `methods_elements`**

| method_id | motion_element_id |
|---|---|
| 209228 | 1 |
| 209228 | 2 |
| 7441161 | 2 |
| 7441161 | 3 |
| 89447 | 3 |
| 89447 | 4 |
| 4180941 | 4 |
| 4180941 | 1 |

The `methods_elements` junction table resolves the many-to-many relationship between `work_methods` and `motion_elements`. Each row in this table links a `method_id` to an `element_id`, effectively enumerating which motion elements are included in which work methods. This design allows a single work method to reference multiple motion elements and a single motion element to participate in multiple work methods, while preserving referential integrity through foreign-key constraints on both sides.

**Table `libraries_elements`**

| standard_element_library_id | motion_element_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `libraries_elements` junction table resolves the many-to-many relationship between `standard_element_libraries` and `motion_elements`. Each row links a `standard_element_library_id` to an `element_id`, enumerating which motion elements are catalogued within which standard element libraries. This junction enables the ontology's requirement that motion elements can be shared across multiple libraries while each library maintains its own curated collection.

The remaining foreign-key relationships are direct and do not require junction tables. The `softwares_accounts` junction table resolves the many-to-many relationship between `labor_costing_softwares` and `business_accounts`, allowing a single software product to be used by multiple business accounts and a single business account to use multiple software products.

The seventeen views materialise the domain facts by joining the normalised tables. Each view answers a specific analytical question by reconstructing a multi-table fact from the base schema.

**View `v_business_account_software_administrator`**

```sql
CREATE VIEW v_business_account_software_administrator AS
SELECT a.business_identifier, a.vat_number, a.registered_address, a.subscription_status, b.id AS administrator_id, b.administrator_id AS administrator_administrator_id, b.role_status AS administrator_role_status
FROM business_accounts a JOIN software_administrators b ON a.software_administrator_id = b.id;
```

| business_identifier | vat_number | registered_address | subscription_status | administrator_id | administrator_administrator_id | administrator_role_status |
|---|---|---|---|---|---|---|
| BUS-2254 | VAT-2449 | regional-register-36 | active | 100 | 10449535 | active |
| BUS-2255 | VAT-2453 | legacy-register-37 | suspended | 101 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | transferred |
| BUS-2256 | VAT-2457 | compact-register-38 | expired | 102 | artemyarulin | revoked |
| BUS-2257 | VAT-2461 | composite-register-39 | pending_verification | 103 | gd_taxc_1121 | active |

This view joins `business_accounts` with `software_administrators` on the `software_administrator_id` / `id` relationship, answering the question: which software administrator manages which business account? A row such as `BUS-2254` paired with administrator `100` (identifier `10449535`, status `active`, authorization `full_admin`) demonstrates the direct organisational assignment. The view surfaces the business account's `vat_number` alongside the administrator's `role_status` and `authorization_level`, enabling compliance audits that verify whether an administrator's privilege tier matches the sensitivity of the business account they manage.

**View `v_business_account_work_method`**

```sql
CREATE VIEW v_business_account_work_method AS
SELECT a.business_identifier, a.vat_number, a.registered_address, a.subscription_status, b.method_id AS method_method_id, b.data_classification AS method_data_classification, b.creation_date AS method_creation_date
FROM business_accounts a JOIN work_methods b ON a.method_id = b.method_id;
```

| business_identifier | vat_number | registered_address | subscription_status | method_method_id | method_data_classification | method_creation_date |
|---|---|---|---|---|---|---|
| BUS-2254 | VAT-2449 | regional-register-36 | active | 209228 | private | 2022-01-13T12:24:00 |
| BUS-2255 | VAT-2453 | legacy-register-37 | suspended | 7441161 | public | 2023-06-24T19:41:00 |
| BUS-2256 | VAT-2457 | compact-register-38 | expired | 89447 | shared | 2024-11-08T02:58:00 |
| BUS-2257 | VAT-2461 | composite-register-39 | pending_verification | 4180941 | private | 2025-04-19T09:15:00 |

By joining `business_accounts` with `work_methods` on the `method_id` / `method_id` relationship, this view answers: which work method is associated with which business account? The row for `BUS-2254` (VAT `VAT-2449`, status `active`) linked to method `209228` (classification `private`, export format `PDF`, creation date `2022-01-13T12:24:00`) illustrates how the view reconstructs the full context of a business account's primary work method, including its data classification and output format.

**View `v_business_account_labor_costing_software`**

```sql
CREATE VIEW v_business_account_labor_costing_software AS
SELECT a.business_identifier, a.vat_number, a.registered_address, a.subscription_status, b.id AS software_id, b.software_version AS software_software_version, b.licensing_model AS software_licensing_model
FROM business_accounts a JOIN labor_costing_softwares b ON a.labor_costing_software_id = b.id;
```

| business_identifier | vat_number | registered_address | subscription_status | software_id | software_software_version | software_licensing_model |
|---|---|---|---|---|---|---|
| BUS-2254 | VAT-2449 | regional-register-36 | active | 1 | seasonal-software-47 | primary-licensin-16 |
| BUS-2255 | VAT-2453 | legacy-register-37 | suspended | 2 | regional-software-48 | adaptive-licensin-17 |
| BUS-2256 | VAT-2457 | compact-register-38 | expired | 3 | legacy-software-49 | distributed-licensin-18 |
| BUS-2257 | VAT-2461 | composite-register-39 | pending_verification | 4 | compact-software-50 | baseline-licensin-19 |

This view joins `business_accounts` with `labor_costing_softwares` on the `labor_costing_software_id` / `id` relationship, answering: which labor costing software does each business account use? The row for `BUS-2254` linked to software `1` demonstrates the association, enabling procurement analysis that maps business accounts to their software licensing and usage patterns.

**View `v_software_administrator_business_account`**

```sql
CREATE VIEW v_software_administrator_business_account AS
SELECT a.id, a.administrator_id, a.role_status, a.authorization_level, b.business_identifier AS account_business_identifier, b.vat_number AS account_vat_number, b.registered_address AS account_registered_address
FROM software_administrators a JOIN business_accounts b ON a.business_account_vat_number = b.vat_number;
```

| id | administrator_id | role_status | authorization_level | account_business_identifier | account_vat_number | account_registered_address |
|---|---|---|---|---|---|---|
| 100 | 10449535 | active | full_admin | BUS-2254 | VAT-2449 | regional-register-36 |
| 101 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | transferred | restricted | BUS-2255 | VAT-2453 | legacy-register-37 |
| 102 | artemyarulin | revoked | full_admin | BUS-2256 | VAT-2457 | compact-register-38 |
| 103 | gd_taxc_1121 | active | restricted | BUS-2257 | VAT-2461 | composite-register-39 |

This view reverses the join direction, starting from `software_administrators` and joining to `business_accounts`. It answers: which business account does each software administrator serve? The row for administrator `100` (identifier `10449535`, status `active`) linked to business account `BUS-2254` (VAT `VAT-2449`, status `active`) provides an administrator-centric view useful for workload distribution analysis and access control auditing.

**View `v_software_administrator_work_method`**

```sql
CREATE VIEW v_software_administrator_work_method AS
SELECT a.id, a.administrator_id, a.role_status, a.authorization_level, b.method_id AS method_method_id, b.data_classification AS method_data_classification, b.creation_date AS method_creation_date
FROM software_administrators a JOIN work_methods b ON a.method_id = b.method_id;
```

| id | administrator_id | role_status | authorization_level | method_method_id | method_data_classification | method_creation_date |
|---|---|---|---|---|---|---|
| 100 | 10449535 | active | full_admin | 209228 | private | 2022-01-13T12:24:00 |
| 101 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | transferred | restricted | 7441161 | public | 2023-06-24T19:41:00 |
| 102 | artemyarulin | revoked | full_admin | 89447 | shared | 2024-11-08T02:58:00 |
| 103 | gd_taxc_1121 | active | restricted | 4180941 | private | 2025-04-19T09:15:00 |

Joining `software_administrators` with `work_methods` on the `method_id` / `method_id` relationship, this view answers: which work method does each software administrator operate? The row for administrator `100` linked to method `209228` (classification `private`, export format `PDF`) demonstrates how the view reconstructs the operational context of each administrator, including the data classification of the methods they manage.

**View `v_work_method_motion_element_detail`**

```sql
CREATE VIEW v_work_method_motion_element_detail AS
SELECT a.method_id, a.data_classification, a.creation_date, b.id AS element_id, b.element_id AS element_element_id, b.element_type AS element_element_type
FROM work_methods a
  JOIN methods_elements j ON j.method_id = a.method_id
  JOIN motion_elements b ON b.id = j.motion_element_id;
```

| method_id | data_classification | creation_date | element_id | element_element_id | element_element_type |
|---|---|---|---|---|---|
| 209228 | private | 2022-01-13T12:24:00 | 1 | 0471948470 | predefined_macro |
| 209228 | private | 2022-01-13T12:24:00 | 2 | 605949 | custom_developed |
| 7441161 | public | 2023-06-24T19:41:00 | 2 | 605949 | custom_developed |
| 7441161 | public | 2023-06-24T19:41:00 | 3 | 10449522 | shared_item |
| 89447 | shared | 2024-11-08T02:58:00 | 3 | 10449522 | shared_item |
| 89447 | shared | 2024-11-08T02:58:00 | 4 | 325465 | predefined_macro |
| 4180941 | private | 2025-04-19T09:15:00 | 4 | 325465 | predefined_macro |
| 4180941 | private | 2025-04-19T09:15:00 | 1 | 0471948470 | predefined_macro |

This view joins `work_methods` with `motion_elements` through the `methods_elements` junction table, answering: which motion elements are included in which work methods? The join reconstructs the many-to-many relationship by traversing the junction table, producing rows that pair a work method's `method_id` and `data_classification` with a motion element's `element_id`, `element_type`, and `standard_time_value`. For example, a row linking method `209228` (classification `private`) with motion element `0471948470` (type `predefined_macro`, time value `11.70`) demonstrates the full detail of a work method's composition.

**View `v_work_method_business_account`**

```sql
CREATE VIEW v_work_method_business_account AS
SELECT a.method_id, a.data_classification, a.creation_date, a.export_format, b.business_identifier AS account_business_identifier, b.vat_number AS account_vat_number, b.registered_address AS account_registered_address
FROM work_methods a JOIN business_accounts b ON a.business_account_vat_number = b.vat_number;
```

| method_id | data_classification | creation_date | export_format | account_business_identifier | account_vat_number | account_registered_address |
|---|---|---|---|---|---|---|
| 209228 | private | 2022-01-13T12:24:00 | PDF | BUS-2254 | VAT-2449 | regional-register-36 |
| 7441161 | public | 2023-06-24T19:41:00 | Excel | BUS-2255 | VAT-2453 | legacy-register-37 |
| 89447 | shared | 2024-11-08T02:58:00 | EDI_flat_file | BUS-2256 | VAT-2457 | compact-register-38 |
| 4180941 | private | 2025-04-19T09:15:00 | PDF | BUS-2257 | VAT-2461 | composite-register-39 |

This view joins `work_methods` with `business_accounts` on the `business_account_vat_number` / `vat_number` relationship, answering: which business account owns which work method? The row for method `209228` (classification `private`, export format `PDF`) linked to business account `BUS-2254` (VAT `VAT-2449`, status `active`) reconstructs the ownership chain from the method back to its organisational parent.

**View `v_work_method_standard_element_library`**

```sql
CREATE VIEW v_work_method_standard_element_library AS
SELECT a.method_id, a.data_classification, a.creation_date, a.export_format, b.standard_element_library_id AS library_standard_element_library_id, b.library_version AS library_library_version, b.content_status AS library_content_status
FROM work_methods a JOIN standard_element_libraries b ON a.standard_element_library_id = b.standard_element_library_id;
```

| method_id | data_classification | creation_date | export_format | library_standard_element_library_id | library_library_version | library_content_status |
|---|---|---|---|---|---|---|
| 209228 | private | 2022-01-13T12:24:00 | PDF | 1 | primary-library-64 | active |
| 7441161 | public | 2023-06-24T19:41:00 | Excel | 2 | adaptive-library-65 | deprecated |
| 89447 | shared | 2024-11-08T02:58:00 | EDI_flat_file | 3 | distributed-library-66 | archived |
| 4180941 | private | 2025-04-19T09:15:00 | PDF | 4 | baseline-library-67 | active |

Joining `work_methods` with `standard_element_libraries` on the `standard_element_library_id` / `standard_element_library_id` relationship, this view answers: which standard element library governs which work method? The row for method `209228` (classification `private`) linked to library `1` (version `primary-library-64`, status `active`) demonstrates how the view surfaces the library context that constrains the motion elements available within a work method.

**View `v_motion_element_work_method`**

```sql
CREATE VIEW v_motion_element_work_method AS
SELECT a.id, a.element_id, a.element_type, a.standard_time_value, b.method_id AS method_method_id, b.data_classification AS method_data_classification, b.creation_date AS method_creation_date
FROM motion_elements a JOIN work_methods b ON a.method_id = b.method_id;
```

| id | element_id | element_type | standard_time_value | method_method_id | method_data_classification | method_creation_date |
|---|---|---|---|---|---|---|
| 1 | 0471948470 | predefined_macro | 11.70 | 209228 | private | 2022-01-13T12:24:00 |
| 2 | 605949 | custom_developed | 14.40 | 7441161 | public | 2023-06-24T19:41:00 |
| 3 | 10449522 | shared_item | 17.10 | 89447 | shared | 2024-11-08T02:58:00 |
| 4 | 325465 | predefined_macro | 19.80 | 4180941 | private | 2025-04-19T09:15:00 |

This view reverses the perspective, joining `motion_elements` with `work_methods` on the `method_id` / `method_id` relationship, answering: which work method contains which motion element? The row for motion element `0471948470` (type `predefined_macro`, time value `11.70`, copyright owner `Company`) linked to method `209228` (classification `private`, export format `PDF`) provides a motion-element-centric view useful for time-value aggregation and copyright tracking.

**View `v_motion_element_localized_description`**

```sql
CREATE VIEW v_motion_element_localized_description AS
SELECT a.id, a.element_id, a.element_type, a.standard_time_value, b.id AS description_id, b.locale_code AS description_locale_code, b.text_content AS description_text_content
FROM motion_elements a JOIN localized_descriptions b ON a.localized_description_id = b.id;
```

| id | element_id | element_type | standard_time_value | description_id | description_locale_code | description_text_content |
|---|---|---|---|---|---|---|
| 1 | 0471948470 | predefined_macro | 11.70 | 100 | en | integrated-text-58 |
| 2 | 605949 | custom_developed | 14.40 | 101 | ro | seasonal-text-59 |
| 3 | 10449522 | shared_item | 17.10 | 102 | en | regional-text-60 |
| 4 | 325465 | predefined_macro | 19.80 | 103 | ro | legacy-text-61 |

Joining `motion_elements` with `localized_descriptions` on the `localized_description_id` / `id` relationship, this view answers: which localized description corresponds to which motion element? The row for motion element `0471948470` (type `predefined_macro`) linked to description `100` (locale `en`, text `integrated-text-58`, status `verified`) demonstrates how the view reconstructs the human-readable context of each motion element, enabling multilingual reporting and translation management.

**View `v_standard_element_library_motion_element_detail`**

```sql
CREATE VIEW v_standard_element_library_motion_element_detail AS
SELECT a.standard_element_library_id, a.library_version, a.content_status, b.id AS element_id, b.element_id AS element_element_id, b.element_type AS element_element_type
FROM standard_element_libraries a
  JOIN libraries_elements j ON j.standard_element_library_id = a.standard_element_library_id
  JOIN motion_elements b ON b.id = j.motion_element_id;
```

| standard_element_library_id | library_version | content_status | element_id | element_element_id | element_element_type |
|---|---|---|---|---|---|
| 1 | primary-library-64 | active | 1 | 0471948470 | predefined_macro |
| 1 | primary-library-64 | active | 2 | 605949 | custom_developed |
| 2 | adaptive-library-65 | deprecated | 2 | 605949 | custom_developed |
| 2 | adaptive-library-65 | deprecated | 3 | 10449522 | shared_item |
| 3 | distributed-library-66 | archived | 3 | 10449522 | shared_item |
| 3 | distributed-library-66 | archived | 4 | 325465 | predefined_macro |
| 4 | baseline-library-67 | active | 4 | 325465 | predefined_macro |
| 4 | baseline-library-67 | active | 1 | 0471948470 | predefined_macro |

This view joins `standard_element_libraries` with `motion_elements` through the `libraries_elements` junction table, answering: which motion elements are catalogued within which standard element libraries? The join traverses the junction table to produce rows that pair a library's `standard_element_library_id` and `content_status` with a motion element's `element_id`, `element_type`, and `standard_time_value`. For example, a row linking library `1` (version `primary-library-64`, status `active`) with motion element `0471948470` (type `predefined_macro`, time value `11.70`) demonstrates the full detail of a library's composition.

**View `v_standard_element_library_platform_company`**

```sql
CREATE VIEW v_standard_element_library_platform_company AS
SELECT a.standard_element_library_id, a.library_version, a.content_status, a.last_updated, b.id AS company_id, b.company_registration_number AS company_company_registration_number, b.vat_number AS company_vat_number
FROM standard_element_libraries a JOIN platform_companies b ON a.platform_company_id = b.id;
```

| standard_element_library_id | library_version | content_status | last_updated | company_id | company_company_registration_number | company_vat_number |
|---|---|---|---|---|---|---|
| 1 | primary-library-64 | active | 2023-06-17T17:27:00 | 100 | American Airlines Group | VAT-2449 |
| 2 | adaptive-library-65 | deprecated | 2024-11-01T00:44:00 | 101 | Sanniquellie Mahn | VAT-2453 |
| 3 | distributed-library-66 | archived | 2025-04-12T07:01:00 | 102 | Link Title | VAT-2457 |
| 4 | baseline-library-67 | active | 2022-09-23T14:18:00 | 103 | Gazprom Neft | VAT-2461 |

Joining `standard_element_libraries` with `platform_companies` on the `platform_company_id` / `id` relationship, this view answers: which platform company hosts which standard element library? The row for library `1` (version `primary-library-64`, status `active`) linked to platform company `100` demonstrates the hosting relationship, enabling distribution analysis that maps libraries to their platform origins.

**View `v_localized_description_motion_element`**

```sql
CREATE VIEW v_localized_description_motion_element AS
SELECT a.id, a.locale_code, a.text_content, a.translation_status, b.id AS element_id, b.element_id AS element_element_id, b.element_type AS element_element_type
FROM localized_descriptions a JOIN motion_elements b ON a.motion_element_id = b.id;
```

| id | locale_code | text_content | translation_status | element_id | element_element_id | element_element_type |
|---|---|---|---|---|---|---|
| 100 | en | integrated-text-58 | verified | 1 | 0471948470 | predefined_macro |
| 101 | ro | seasonal-text-59 | draft | 2 | 605949 | custom_developed |
| 102 | en | regional-text-60 | pending | 3 | 10449522 | shared_item |
| 103 | ro | legacy-text-61 | verified | 4 | 325465 | predefined_macro |

This view reverses the perspective, joining `localized_descriptions` with `motion_elements` on the `motion_element_id` / `id` relationship, answering: which motion element does each localized description describe? The row for description `100` (locale `en`, text `integrated-text-58`, status `verified`) linked to motion element `0471948470` (type `predefined_macro`, time value `11.70`) provides a description-centric view useful for translation workflow management and locale coverage analysis.

**View `v_platform_company_labor_costing_software`**

```sql
CREATE VIEW v_platform_company_labor_costing_software AS
SELECT a.id, a.company_registration_number, a.vat_number, a.registered_office, b.id AS software_id, b.software_version AS software_software_version, b.licensing_model AS software_licensing_model
FROM platform_companies a JOIN labor_costing_softwares b ON a.labor_costing_software_id = b.id;
```

| id | company_registration_number | vat_number | registered_office | software_id | software_software_version | software_licensing_model |
|---|---|---|---|---|---|---|
| 100 | American Airlines Group | VAT-2449 | pilot-register-20 | 1 | seasonal-software-47 | primary-licensin-16 |
| 101 | Sanniquellie Mahn | VAT-2453 | extended-register-21 | 2 | regional-software-48 | adaptive-licensin-17 |
| 102 | Link Title | VAT-2457 | integrated-register-22 | 3 | legacy-software-49 | distributed-licensin-18 |
| 103 | Gazprom Neft | VAT-2461 | seasonal-register-23 | 4 | compact-software-50 | baseline-licensin-19 |

Joining `platform_companies` with `labor_costing_softwares` on the `platform_company_id` / `id` relationship, this view answers: which platform company provides which labor costing software? The row for platform company `100` linked to software `1` demonstrates the software distribution chain, enabling vendor analysis that maps software products to their platform origins.

**View `v_platform_company_standard_element_library`**

```sql
CREATE VIEW v_platform_company_standard_element_library AS
SELECT a.id, a.company_registration_number, a.vat_number, a.registered_office, b.standard_element_library_id AS library_standard_element_library_id, b.library_version AS library_library_version, b.content_status AS library_content_status
FROM platform_companies a JOIN standard_element_libraries b ON a.standard_element_library_id = b.standard_element_library_id;
```

| id | company_registration_number | vat_number | registered_office | library_standard_element_library_id | library_library_version | library_content_status |
|---|---|---|---|---|---|---|
| 100 | American Airlines Group | VAT-2449 | pilot-register-20 | 1 | primary-library-64 | active |
| 101 | Sanniquellie Mahn | VAT-2453 | extended-register-21 | 2 | adaptive-library-65 | deprecated |
| 102 | Link Title | VAT-2457 | integrated-register-22 | 3 | distributed-library-66 | archived |
| 103 | Gazprom Neft | VAT-2461 | seasonal-register-23 | 4 | baseline-library-67 | active |

This view joins `platform_companies` with `standard_element_libraries` on the `platform_company_id` / `id` relationship, answering: which platform company hosts which standard element library? The row for platform company `100` linked to library `1` (version `primary-library-64`, status `active`) reconstructs the hosting relationship, enabling library distribution analysis across platform companies.

**View `v_labor_costing_software_business_account_detail`**

```sql
CREATE VIEW v_labor_costing_software_business_account_detail AS
SELECT a.id, a.software_version, a.licensing_model, b.business_identifier AS account_business_identifier, b.vat_number AS account_vat_number, b.registered_address AS account_registered_address
FROM labor_costing_softwares a
  JOIN softwares_accounts j ON j.labor_costing_software_id = a.id
  JOIN business_accounts b ON b.vat_number = j.business_account_vat_number;
```

| id | software_version | licensing_model | account_business_identifier | account_vat_number | account_registered_address |
|---|---|---|---|---|---|
| 1 | seasonal-software-47 | primary-licensin-16 | BUS-2254 | VAT-2449 | regional-register-36 |
| 1 | seasonal-software-47 | primary-licensin-16 | BUS-2255 | VAT-2453 | legacy-register-37 |
| 2 | regional-software-48 | adaptive-licensin-17 | BUS-2255 | VAT-2453 | legacy-register-37 |
| 2 | regional-software-48 | adaptive-licensin-17 | BUS-2256 | VAT-2457 | compact-register-38 |
| 3 | legacy-software-49 | distributed-licensin-18 | BUS-2256 | VAT-2457 | compact-register-38 |
| 3 | legacy-software-49 | distributed-licensin-18 | BUS-2257 | VAT-2461 | composite-register-39 |
| 4 | compact-software-50 | baseline-licensin-19 | BUS-2257 | VAT-2461 | composite-register-39 |
| 4 | compact-software-50 | baseline-licensin-19 | BUS-2254 | VAT-2449 | regional-register-36 |

Joining `labor_costing_softwares` with `business_accounts` on the `labor_costing_software_id` / `id` relationship, this view answers: which business accounts use which labor costing software? The row for software `1` linked to business account `BUS-2254` (VAT `VAT-2449`, status `active`, primary language `English`) demonstrates the software adoption landscape, enabling licensing analysis that maps business accounts to their software usage.

**View `v_labor_costing_software_standard_element_library`**

```sql
CREATE VIEW v_labor_costing_software_standard_element_library AS
SELECT a.id, a.software_version, a.licensing_model, a.edi_enabled, b.standard_element_library_id AS library_standard_element_library_id, b.library_version AS library_library_version, b.content_status AS library_content_status
FROM labor_costing_softwares a JOIN standard_element_libraries b ON a.standard_element_library_id = b.standard_element_library_id;
```

| id | software_version | licensing_model | edi_enabled | library_standard_element_library_id | library_library_version | library_content_status |
|---|---|---|---|---|---|---|
| 1 | seasonal-software-47 | primary-licensin-16 | false | 1 | primary-library-64 | active |
| 2 | regional-software-48 | adaptive-licensin-17 | true | 2 | adaptive-library-65 | deprecated |
| 3 | legacy-software-49 | distributed-licensin-18 | false | 3 | distributed-library-66 | archived |
| 4 | compact-software-50 | baseline-licensin-19 | true | 4 | baseline-library-67 | active |

This view joins `labor_costing_softwares` with `standard_element_libraries` on the `labor_costing_software_id` / `standard_element_library_id` relationship, answering: which labor costing software is associated with which standard element library? The row for software `1` linked to library `1` (version `primary-library-64`, status `active`) demonstrates the software-library pairing, enabling compatibility analysis that maps software capabilities to the motion element libraries they support.

The relational schema faithfully materialises the ontology's entity types and relationships through a combination of direct foreign-key columns and junction tables for many-to-many associations. The eleven base tables encode the structural constraints of the domain—each business account is bound to exactly one administrator, one work method, and one labor costing software; each motion element belongs to exactly one work method and has exactly one localized description; each standard element library is hosted by exactly one platform company. The seventeen views then reconstruct the multi-table facts that answer concrete business questions, from administrator-account assignments to work method compositions to library distribution chains. Together, the base tables and views form a complete, queryable representation of the labor costing domain that preserves the semantic richness of the ontology while enabling efficient relational access patterns.

## Data appendix

**Table `softwares_accounts`**

| labor_costing_software_id | business_account_vat_number |
|---|---|
| 1 | VAT-2449 |
| 1 | VAT-2453 |
| 2 | VAT-2453 |
| 2 | VAT-2457 |
| 3 | VAT-2457 |
| 3 | VAT-2461 |
| 4 | VAT-2461 |
| 4 | VAT-2449 |
