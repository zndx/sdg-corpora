## Time and Motion Data Management in Labor Costing Systems

Modern labor costing platforms organize work measurement data through a structured ecosystem of business entities, administrative controls, and standardized motion elements. At the core of this ecosystem sits the business account, which serves as the organizational anchor for all time-and-motion records. Each business account carries a unique identifier, a VAT registration number, a registered address, and a subscription status that determines access to costing features. The primary language setting reflects the operational locale of the organization, while foreign-key references tie the account to its software administrator, its active work method, and the labor costing software platform it subscribes to.

**Table `business_accounts`**

| business_identifier | vat_number | registered_address | subscription_status | primary_language | software_administrator_id | method_id | labor_costing_software_id |
|---|---|---|---|---|---|---|---|
| BUS-2254 | VAT-2449 | regional-register-36 | active | English | 100 | 209228 | 1 |
| BUS-2255 | VAT-2453 | legacy-register-37 | suspended | Romanian | 101 | 7441161 | 2 |
| BUS-2256 | VAT-2457 | compact-register-38 | expired | English | 102 | 89447 | 3 |
| BUS-2257 | VAT-2461 | composite-register-39 | pending_verification | Romanian | 103 | 4180941 | 4 |

The business account records demonstrate a range of subscription states. Account BUS-2254, registered under VAT-2449 at regional-register-36, maintains an active subscription and operates in English. Its counterpart BUS-2255, tied to VAT-2453 at legacy-register-37, holds a suspended status and uses Romanian as its primary language. The remaining accounts—BUS-2256 with an expired subscription and BUS-2257 pending verification—illustrate the lifecycle transitions organizations undergo as they engage with labor costing services. Each account references a specific software administrator, a work method, and a labor costing software instance, establishing the foundational relationships that enable downstream reporting and analysis.

The software administrator table governs who controls access to business accounts and their associated work methods. Administrators are identified by a system-generated id, an external administrator_id that may take the form of a numeric code, a UUID, or a human-readable username, and a role_status indicating their current authorization state. The authorization_level field distinguishes between full administrative privileges and restricted access, while the business_account_vat_number column creates the link back to the owning business account.

**Table `software_administrators`**

| id | administrator_id | role_status | authorization_level | business_account_vat_number | method_id |
|---|---|---|---|---|---|
| 100 | 10449535 | active | full_admin | VAT-2449 | 209228 |
| 101 | df2e3438-8fcc-11eb-924d-9cd76263cbd0 | transferred | restricted | VAT-2453 | 7441161 |
| 102 | artemyarulin | revoked | full_admin | VAT-2457 | 89447 |
| 103 | gd_taxc_1121 | active | restricted | VAT-2461 | 4180941 |

Administrator 100, holding the external identifier 10449535, exercises full_admin authority over VAT-2449 and is currently active. In contrast, administrator 101, identified by the UUID df2e3438-8fcc-11eb-924d-9cd76263cbd0, has been transferred and operates under restricted permissions for VAT-2453. The username artemyarulin (id 102) has had its authorization revoked despite previously holding full_admin rights, while gd_taxc_1121 (id 103) remains active with restricted access to VAT-2461. The method_id column in this table further connects each administrator to a specific work method, ensuring that administrative control is always contextualized within a particular measurement framework.

Work methods represent the operational procedures through which labor time is classified, formatted, and exported. Each method carries a data_classification—private, public, or shared—that determines visibility, a creation_date marking when the method was established, and an export_format specifying the output type such as PDF, Excel, or EDI_flat_file. The language_code field encodes the linguistic context of the method's content, while the business_account_vat_number and standard_element_library_id columns anchor the method to its organizational owner and its library of standardized elements.

**Table `work_methods`**

| method_id | data_classification | creation_date | export_format | language_code | business_account_vat_number | standard_element_library_id |
|---|---|---|---|---|---|---|
| 209228 | private | 2022-01-13T12:24:00 | PDF | 20723567 | VAT-2449 | 1 |
| 7441161 | public | 2023-06-24T19:41:00 | Excel | 32825 | VAT-2453 | 2 |
| 89447 | shared | 2024-11-08T02:58:00 | EDI_flat_file | b_VB-EC-15 | VAT-2457 | 3 |
| 4180941 | private | 2025-04-19T09:15:00 | PDF | 974927 | VAT-2461 | 4 |

Method 209228, created on 2022-01-13, is classified as private, exports to PDF, and uses language code 20723567. It belongs to VAT-2449 and draws its standardized elements from library 1. Method 7441161, established more recently on 2023-06-24, is publicly accessible, exports in Excel format, and references language code 32825. The method 8941161 associated with VAT-2457 uses EDI_flat_file export and the language code b_VB-EC-15, while method 4180941, created on 2025-04-19, mirrors the private classification and PDF export of the first method but operates under language code 974927.

Motion elements constitute the granular building blocks of time-and-motion studies. Each element is assigned a unique id, an element_id that may be a numeric string, and an element_type that categorizes it as a predefined_macro, custom_developed, or shared_item. The standard_time_value records the measured duration in seconds or minutes, the copyright_owner indicates whether the element belongs to a Company, a Business, or Shared_Parties, and the method_id links the element to its parent work method. The localized_description_id column provides a reference to multilingual descriptions of the element's purpose and application.

**Table `motion_elements`**

| id | element_id | element_type | standard_time_value | copyright_owner | method_id | localized_description_id |
|---|---|---|---|---|---|---|
| 1 | 0471948470 | predefined_macro | 11.70 | Company | 209228 | 100 |
| 2 | 605949 | custom_developed | 14.40 | Business | 7441161 | 101 |
| 3 | 10449522 | shared_item | 17.10 | Shared_Parties | 89447 | 102 |
| 4 | 325465 | predefined_macro | 19.80 | Company | 4180941 | 103 |

Element 1, with the identifier 0471948470, is a predefined_macro with a standard time of 11.70, owned by the Company, and associated with method 209228. Element 2 (605949) is a custom_developed item requiring 14.40 units of time, owned by a Business entity, and tied to method 7441161. Element 3 (10449522), a shared_item with a standard time of 17.10, is owned by Shared_Parties and belongs to method 89447. Element 4 (325465) is another predefined_macro, this one valued at 19.80, owned by the Company, and linked to method 4180941.

Standard element libraries provide the curated collections from which work methods draw their reusable components. Each library has a standard_element_library_id, a library_version name, a content_status indicating whether it is active, deprecated, or archived, and a last_updated timestamp. The platform_company_id column connects the library to the company that maintains it.

**Table `standard_element_libraries`**

| standard_element_library_id | library_version | content_status | last_updated | platform_company_id |
|---|---|---|---|---|
| 1 | primary-library-64 | active | 2023-06-17T17:27:00 | 100 |
| 2 | adaptive-library-65 | deprecated | 2024-11-01T00:44:00 | 101 |
| 3 | distributed-library-66 | archived | 2025-04-12T07:01:00 | 102 |
| 4 | baseline-library-67 | active | 2022-09-23T14:18:00 | 103 |

Library 1, named primary-library-64, is currently active and was last updated on 2023-06-17. It is maintained by platform company 100. Library 2, adaptive-library-65, carries a deprecated status and was last updated on 2024-11-01, maintained by company 101. Library 3, distributed-library-66, is archived as of 2025-04-12 and belongs to company 102. Library 4, baseline-library-67, is active and was last updated on 2022-09-23, maintained by company 103. The progression from active to deprecated to archived reflects the lifecycle management of standardized element collections.

Localized descriptions provide multilingual annotations for motion elements, enabling organizations that operate across linguistic boundaries to maintain consistent time-and-motion records. Each description is identified by an id, associated with a locale_code such as en or ro, contains a text_content field with the translated or original text, and carries a translation_status of verified, draft, or pending. The motion_element_id column creates the link back to the motion element being described.

**Table `localized_descriptions`**

| id | locale_code | text_content | translation_status | motion_element_id |
|---|---|---|---|---|
| 100 | en | integrated-text-58 | verified | 1 |
| 101 | ro | seasonal-text-59 | draft | 2 |
| 102 | en | regional-text-60 | pending | 3 |
| 103 | ro | legacy-text-61 | verified | 4 |

Description 100, in locale en, contains the text integrated-text-58 and has a verified translation status for motion element 1. Description 101, in locale ro, holds seasonal-text-59 in draft status for element 2. Description 102, also in locale en, contains regional-text-60 with a pending status for element 3. Description 103, in locale ro, carries legacy-text-61 in verified status for element 4. The mix of verified, draft, and pending statuses illustrates the ongoing translation workflow that keeps motion element descriptions current across languages.

Platform companies are the organizations that develop, maintain, and distribute standard element libraries. They serve as the institutional source of truth for reusable motion element collections and may also operate labor costing software platforms that business accounts subscribe to.

**Table `platform_companies`**

| id | company_registration_number | vat_number | registered_office | jurisdiction | labor_costing_software_id | standard_element_library_id |
|---|---|---|---|---|---|---|
| 100 | American Airlines Group | VAT-2449 | pilot-register-20 | regional-jurisdic-30 | 1 | 1 |
| 101 | Sanniquellie Mahn | VAT-2453 | extended-register-21 | legacy-jurisdic-31 | 2 | 2 |
| 102 | Link Title | VAT-2457 | integrated-register-22 | compact-jurisdic-32 | 3 | 3 |
| 103 | Gazprom Neft | VAT-2461 | seasonal-register-23 | composite-jurisdic-33 | 4 | 4 |

Labor costing software represents the commercial or internal software platforms through which business accounts access work measurement capabilities. Each software entry is identified by a labor_costing_software_id and carries a name, a version, and a platform_company_id linking it to the company that provides it.

**Table `labor_costing_softwares`**

| id | software_version | licensing_model | edi_enabled | export_capabilities | standard_element_library_id | created_at |
|---|---|---|---|---|---|---|
| 1 | seasonal-software-47 | primary-licensin-16 | false | PDF | 1 | 2025-01-01 00:14:00 |
| 2 | regional-software-48 | adaptive-licensin-17 | true | Excel | 2 | 2025-02-06 03:14:00 |
| 3 | legacy-software-49 | distributed-licensin-18 | false | EDI_flat_file | 3 | 2025-03-11 06:14:00 |
| 4 | compact-software-50 | baseline-licensin-19 | true | PDF | 4 | 2025-04-16 09:14:00 |

The methods_elements table records the many-to-many relationship between work methods and motion elements, specifying which elements are included in which methods.

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

The libraries_elements table similarly records the relationship between standard element libraries and motion elements, indicating which elements are cataloged within each library.

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

The softwares_accounts table captures the subscription relationship between labor costing software platforms and business accounts, documenting which accounts use which software.

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

### Cross-Entity Relationships and Analytical Views

The power of this data model emerges in the joined views that combine information across tables to answer specific operational questions. The view v_business_account_software_administrator links business accounts to their controlling administrators, revealing which administrator manages which account and under what authorization level. For instance, the join between BUS-2254 and administrator 100 shows an active account managed by a full_admin user, while BUS-2255's link to administrator 101 reveals a suspended account under a transferred administrator with restricted permissions.

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

The view v_business_account_work_method connects business accounts to their active work methods, exposing the classification, export format, and library association for each account's primary measurement procedure. BUS-2254's method 209228 appears as a private PDF export drawing from library 1, while BUS-2255's method 7441161 is a public Excel export from library 2. This view enables organizations to audit the diversity of their work method configurations across accounts.

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

The view v_business_account_labor_costing_software ties business accounts to the labor costing software platforms they subscribe to, providing a clear picture of software utilization across the organization. This relationship is critical for license management and platform migration planning.

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

The view v_software_administrator_business_account presents the same relationship from the administrator's perspective, showing which business accounts each administrator controls and the VAT numbers associated with those accounts. This orientation is useful for support teams and compliance auditors who manage administrators rather than business accounts.

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

The view v_software_administrator_work_method links administrators to the work methods they oversee, combining the administrator's role_status and authorization_level with the method's data_classification and export_format. This view answers questions such as which administrators have authority over public methods versus private ones.

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

The view v_work_method_motion_element_detail joins work methods with their constituent motion elements, revealing the element types, standard time values, and copyright ownership for each method's component parts. Method 209228, for example, includes element 1 (a predefined_macro with a standard time of 11.70 owned by the Company), providing a granular view of the method's composition.

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

The view v_work_method_business_account presents the reverse of the earlier business-account-to-method join, showing work methods alongside their owning business accounts and VAT numbers. This orientation is useful when auditing methods rather than accounts.

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

The view v_work_method_standard_element_library connects work methods to their source libraries, displaying the library version, content status, and last_updated timestamp alongside the method's classification and export format. Method 209228's association with primary-library-64 (active, last updated 2023-06-17) demonstrates how method stability can be traced to library maintenance cycles.

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

The view v_motion_element_work_method presents motion elements alongside their parent work methods, enabling analysis of element usage patterns across methods. This view is particularly useful for identifying elements that appear in multiple methods or for auditing the distribution of element types.

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

The view v_motion_element_localized_description joins motion elements with their multilingual descriptions, showing the locale_code, text_content, and translation_status for each element's annotations. Element 1's description 100 in locale en with verified status and text integrated-text-58 illustrates a complete localization record, while element 2's description 101 in locale ro with draft status and text seasonal-text-59 shows an in-progress translation.

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

The view v_standard_element_library_motion_element_detail connects standard element libraries to their constituent motion elements, revealing the element types, standard time values, and copyright owners within each library. This view supports library content audits and helps identify which libraries contain the most diverse element types.

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

The view v_standard_element_library_platform_company links standard element libraries to their maintaining platform companies, displaying the library version, content status, and last_updated timestamp alongside the company identifier. This view answers questions about which companies maintain active versus deprecated libraries.

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

The view v_localized_description_motion_element presents localized descriptions alongside their associated motion elements, providing a description-centric view of the localization data. This orientation is useful for translation management teams who work primarily with description records.

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

The view v_platform_company_labor_costing_software connects platform companies to the labor costing software they provide, showing the software name, version, and the companies that maintain them. This view clarifies the product portfolio of each platform company.

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

The view v_platform_company_standard_element_library links platform companies to the standard element libraries they maintain, displaying the library version, content status, and last_updated timestamp. This view supports governance by showing which companies are responsible for which libraries and their current maintenance state.

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

The view v_labor_costing_software_business_account_detail joins labor costing software with the business accounts that subscribe to it, revealing the account identifiers, VAT numbers, subscription statuses, and primary languages of software users. This view is essential for understanding software adoption patterns and for planning support resources across different language locales.

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

The view v_labor_costing_software_standard_element_library connects labor costing software platforms to the standard element libraries they incorporate, showing the software version alongside the library version, content status, and last_updated timestamp. This view answers critical questions about library-software compatibility and helps identify instances where deprecated libraries are still in use by active software platforms.

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

### Synthesis

The data model described in this chapter captures the full lifecycle of labor costing operations: from the business accounts that initiate engagement, through the software administrators who manage access, to the work methods that define measurement procedures, the motion elements that constitute those procedures, and the standard element libraries that provide reusable components. Localized descriptions ensure that motion elements remain accessible across linguistic boundaries, while platform companies and labor costing software form the commercial and technical infrastructure that ties everything together. The cross-entity views enable analysts to answer questions from multiple perspectives—whether auditing a specific business account, tracing a motion element through its method and library, or evaluating software adoption across the organization. Together, these tables and views form a coherent operational record that supports compliance, reporting, and continuous improvement in time-and-motion data management.