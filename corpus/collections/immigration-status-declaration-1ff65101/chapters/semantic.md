The immigration status declaration domain captures the administrative lifecycle of housing eligibility verification for households and their dependents. At its center sits the declaration—a formal record that binds a household member or minor dependent to a specific housing unit, a leasing officer, a set of supporting documents, and a consent-based verification workflow. Each declaration carries a unique identifier, a form version, a certification status, and timestamps that track when it was first submitted and when it was last revised. The relational schema normalizes this domain into seven base tables whose primary keys and foreign keys encode the cardinality-bounded relationships between declarations, people, places, and paperwork. The views then reassemble those normalized facts into the business-level perspectives that auditors, housing managers, and compliance officers actually query.

## The Declaration as the Central Entity

The table `immigration_status_declarations` is the anchor of the entire schema. Its surrogate primary key `id` (values such as `1000`, `1001`, `1002`, `1003`) is paired with a business-level `declaration_id` (`10966231`, `1996917`, `557`, `default_chart_a_tax_code_26`) that external systems reference. The columns `declaration_date` and `revision_date` record when the form was initially submitted and when it was last amended; for example, declaration `1000` was declared on `2022-09-25` and revised on `2023-02-03`. The `form_version` column (`distributed-form-96`, `baseline-form-97`, `pilot-form-98`, `extended-form-99`) distinguishes between different iterations of the declaration form, while `certification_status` (`pending`, `verified`, `rejected`) captures the current adjudication state. The boolean `perjury_acknowledged` indicates whether the declarant affirmed the truthfulness of the submission.

Critically, `immigration_status_declarations` holds two nullable foreign keys: `member_id` points to a row in `household_members`, and `minor_dependent_id` points to a row in `minor_dependents`. This design allows a single declaration to be associated with either a household member or a minor dependent—or, in principle, both. In the sample data, declaration `1000` links to household member `10207158` (Theodore Mcgrath) and minor dependent `100`; declaration `1001` links to the same household member `10207158` (now listed as Account Name) and minor dependent `101`; declaration `1002` links to household member `25820616` (Saipan International Airport) and minor dependent `102`; and declaration `1003` links to household member `2002007020250` (Norma Fisher) and minor dependent `103`. The presence of both foreign keys in the same table reflects a one-to-one or one-to-many relationship between declarations and the two person types, with the schema permitting a declaration to reference at most one member and at most one dependent at a time.

**Table `immigration_status_declarations`**

| id | declaration_id | declaration_date | revision_date | form_version | certification_status | perjury_acknowledged | member_id | minor_dependent_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 10966231 | 2022-09-25 | 2023-02-03 | distributed-form-96 | pending | true | 10207158 | 100 |
| 1001 | 1996917 | 2023-02-09 | 2024-07-14 | baseline-form-97 | verified | false | 10207158 | 101 |
| 1002 | 557 | 2024-07-20 | 2025-12-25 | pilot-form-98 | rejected | true | 25820616 | 102 |
| 1003 | default_chart_a_tax_code_26 | 2025-12-04 | 2022-05-09 | extended-form-99 | pending | false | 2002007020250 | 103 |

## Household Members and Housing Units

The `household_members` table stores the adults and other residents who submit declarations. Its primary key `member_id` (values `10207158`, `25820616`, `2002007020250`) is paired with `full_name` (Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher), `ssn` (legacy-ssn-43, compact-ssn-44, composite-ssn-45, primary-ssn-46), `role` (Head of Household, Adult Non-Head), `age` (35, 40, 45, 50), and `is_senior` (false, true). The column `immigration_status_declaration_id` is a foreign key pointing back to `immigration_status_declarations`, establishing a one-to-many relationship: a single household member can have multiple declarations over time (member `10207158` appears with both declaration `1000` and declaration `1001`). The column `housing_unit_id` is a foreign key pointing to `housing_units`, encoding the physical residence to which the member is assigned. In the sample data, member `10207158` resides in housing unit `1` under declaration `1000` and in housing unit `2` under declaration `1001`, illustrating that a member's housing assignment can change across declaration revisions.

**Table `household_members`**

| member_id | full_name | ssn | role | age | is_senior | immigration_status_declaration_id | housing_unit_id |
|---|---|---|---|---|---|---|---|
| 10207158 | Theodore Mcgrath | legacy-ssn-43 | Head of Household | 35 | false | 1000 | 1 |
| 10207158 | Account Name | compact-ssn-44 | Adult Non-Head | 40 | true | 1001 | 2 |
| 25820616 | Saipan International Airport | composite-ssn-45 | Head of Household | 45 | false | 1002 | 3 |
| 2002007020250 | Norma Fisher | primary-ssn-46 | Adult Non-Head | 50 | true | 1003 | 4 |

The `housing_units` table (referenced by `household_members.housing_unit_id`) stores the physical dwellings. Although its full column set is not enumerated in the sample rows, the foreign key relationship is clear: each housing unit can house multiple household members, and each member row carries a single `housing_unit_id` that anchors them to a specific unit. The view `household_member_housing_unit_view` and the view `housing_unit_household_member_view` materialize this join, allowing queries that ask which members occupy which units or, inversely, which members are assigned to a given unit.

**Table `housing_units`**

| id | unit_id | address | bedrooms | monthly_rent | occupancy_status | member_id |
|---|---|---|---|---|---|---|
| 1 | 39800614 | distributed-address-72 | 16 | 10.20 | Vacant | 10207158 |
| 2 | 611523 | baseline-address-73 | 19 | 12.40 | Occupied | 10207158 |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | pilot-address-74 | 22 | 14.60 | Pending | 25820616 |
| 4 | account_pymes_1040 | extended-address-75 | 25 | 16.80 | Vacant | 2002007020250 |

## Minor Dependents and Leasing Officers

The `minor_dependents` table captures the dependents associated with declarations. Its primary key `minor_dependent_id` (values `100`, `101`, `102`, `103`) is paired with a business identifier `minor_id` (b_VB-EC-12, 20155792, 1889764, 32806), `full_name` (Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher), `age` (35, 40, 45, 50), and `citizenship_status` (Citizen, Naturalized Citizen, National, Eligible Noncitizen). The columns `immigration_status_declaration_id` and `leasing_officer_id` are foreign keys pointing to `immigration_status_declarations` and `leasing_officers`, respectively. This establishes two relationships: each minor dependent is associated with exactly one declaration (one-to-one from the declaration's perspective, as encoded by the nullable FK in `immigration_status_declarations`), and each minor dependent is assigned to exactly one leasing officer. The timestamps `created_at` and `updated_at` track the lifecycle of the dependent record; for instance, minor dependent `100` was created on `2025-01-01 00:14:00` and last updated on `2025-01-02 00:41:00`.

**Table `minor_dependents`**

| minor_dependent_id | minor_id | full_name | age | citizenship_status | immigration_status_declaration_id | leasing_officer_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | b_VB-EC-12 | Theodore Mcgrath | 35 | Citizen | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 20155792 | Account Name | 40 | Naturalized Citizen | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 1889764 | Saipan International Airport | 45 | National | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 32806 | Norma Fisher | 50 | Eligible Noncitizen | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `leasing_officers` table stores the staff members who oversee the verification process. Its primary key `leasing_officer_id` (values `1`, `2`, `3`, `4`) is paired with `officer_id` (103165, 2933464, 10445622, 7441150), `full_name` (Theodore Mcgrath, Account Name, Saipan International Airport, Norma Fisher), `employee_id` (Norma Fisher, Tasha Rodriguez, Theodore Mcgrath, Peter Mcdowell), and `department` (adaptive-departme-89, distributed-departme-90, baseline-departme-91, pilot-departme-92). The foreign keys `immigration_status_declaration_id` and `minor_dependent_id` create a dual relationship: each leasing officer is linked to one declaration and one minor dependent, mirroring the structure in `minor_dependents`. This bidirectional linkage ensures that the officer who oversees a minor dependent is also the officer associated with the corresponding declaration. The views `minor_dependent_leasing_officer_view` and `leasing_officer_minor_dependent_view` materialize this join, enabling queries that list the officer assigned to each dependent or, conversely, all dependents overseen by a given officer.

**Table `leasing_officers`**

| leasing_officer_id | officer_id | full_name | employee_id | department | immigration_status_declaration_id | minor_dependent_id |
|---|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Norma Fisher | adaptive-departme-89 | 1000 | 100 |
| 2 | 2933464 | Account Name | Tasha Rodriguez | distributed-departme-90 | 1001 | 101 |
| 3 | 10445622 | Saipan International Airport | Theodore Mcgrath | baseline-departme-91 | 1002 | 102 |
| 4 | 7441150 | Norma Fisher | Peter Mcdowell | pilot-departme-92 | 1003 | 103 |

## Supporting Tables: Documents and Consent Forms

The `immigration_documents` table stores the evidentiary documents submitted in support of declarations. Its primary key `id` (values `1000`, `1001`, `1002`, `1003`) is paired with a business `document_id` (IVC10I, 605943, 10449525, 5f93a090-8fcd-11eb-924d-9cd76263cbd0), `form_code` (12616, 2087755, template_impcode_pagata_4det50, id_9), `issuing_agency` (Technos Japan, Sanniquellie Mahn, Greater Houston Community Foundation, Lucas Industries), `annotation` (extended-annotati-27, integrated-annotati-28, seasonal-annotati-29, regional-annotati-30), `issue_date` (2023-02-01, 2024-07-12, 2025-12-23, 2022-05-07), `expiry_date` (2023-10-24, 2024-03-08, 2025-08-19, 2022-01-03), and `document_type` (I-551, I-94, I-688, I-766). The foreign key `immigration_status_declaration_id` links each document to the declaration it supports, while `verification_consent_form_id` links it to the consent form that authorized its verification. The column `created_at` records when the document record was entered. The view `immigration_document_immigration_status_declaration_view` joins this table to `immigration_status_declarations`, answering questions such as which documents were submitted for a given declaration. The view `immigration_document_verification_consent_form_view` joins to `verification_consent_forms`, revealing which consent form authorized each document.

**Table `immigration_documents`**

| id | document_id | form_code | issuing_agency | annotation | issue_date | expiry_date | document_type | immigration_status_declaration_id | verification_consent_form_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | IVC10I | 12616 | Technos Japan | extended-annotati-27 | 2023-02-01 | 2023-10-24 | I-551 | 1000 | 1 | 2025-01-01 00:14:00 |
| 1001 | 605943 | 2087755 | Sanniquellie Mahn | integrated-annotati-28 | 2024-07-12 | 2024-03-08 | I-94 | 1001 | 2 | 2025-02-06 03:14:00 |
| 1002 | 10449525 | template_impcode_pagata_4det50 | Greater Houston Community Foundation | seasonal-annotati-29 | 2025-12-23 | 2025-08-19 | I-688 | 1002 | 3 | 2025-03-11 06:14:00 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | id_9 | Lucas Industries | regional-annotati-30 | 2022-05-07 | 2022-01-03 | I-766 | 1003 | 4 | 2025-04-16 09:14:00 |

The `verification_consent_forms` table records the consent mechanisms used to verify immigration status. Its primary key `id` (values `1`, `2`, `3`, `4`) is paired with `consent_id` (9fffb746-9bac-11eb-a8a2-19ed5c03f8d3, 790462, 4277037, 3990176), `signed_date` (2024-07-17, 2025-12-01, 2022-05-12, 2023-10-23), `is_signed` (false, true, false, true), and `verification_method` (E-Verify, DirectContact, ThirdParty, E-Verify). The foreign key `immigration_status_declaration_id` links the consent form to the declaration it pertains to, and `member_id` links it to the household member who provided consent. The view `verification_consent_form_immigration_status_declaration_view` joins to `immigration_status_declarations`, showing which declaration each consent form supports. The view `verification_consent_form_household_member_view` joins to `household_members`, revealing which member signed which consent form.

**Table `verification_consent_forms`**

| id | consent_id | signed_date | is_signed | verification_method | immigration_status_declaration_id | member_id |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-17 | false | E-Verify | 1000 | 10207158 |
| 2 | 790462 | 2025-12-01 | true | DirectContact | 1001 | 10207158 |
| 3 | 4277037 | 2022-05-12 | false | ThirdParty | 1002 | 25820616 |
| 4 | 3990176 | 2023-10-23 | true | E-Verify | 1003 | 2002007020250 |

## View-Based Reassembly of Domain Facts

Each view in the schema is a named join that reconstructs a domain-level fact from the normalized base tables. These views serve as the query surface for reporting, auditing, and compliance workflows.

The view `immigration_status_declaration_household_member_view` joins `immigration_status_declarations` to `household_members` on `member_id`. It answers the question: what household member submitted this declaration, and what is the current certification status? For declaration `1000`, the view returns household member `10207158` (Theodore Mcgrath, Head of Household, age 35) with certification status `pending`. For declaration `1001`, the same member `10207158` (now listed as Account Name, Adult Non-Head, age 40) appears with status `verified`.

**View `immigration_status_declaration_household_member_view`**

```sql
CREATE VIEW immigration_status_declaration_household_member_view AS
SELECT a.id, a.declaration_id, a.declaration_date, a.revision_date, b.member_id AS member_member_id, b.full_name AS member_full_name, b.ssn AS member_ssn
FROM immigration_status_declarations a JOIN household_members b ON a.member_id = b.member_id;
```

| id | declaration_id | declaration_date | revision_date | member_member_id | member_full_name | member_ssn |
|---|---|---|---|---|---|---|
| 1000 | 10966231 | 2022-09-25 | 2023-02-03 | 10207158 | Account Name | compact-ssn-44 |
| 1001 | 1996917 | 2023-02-09 | 2024-07-14 | 10207158 | Account Name | compact-ssn-44 |
| 1002 | 557 | 2024-07-20 | 2025-12-25 | 25820616 | Saipan International Airport | composite-ssn-45 |
| 1003 | default_chart_a_tax_code_26 | 2025-12-04 | 2022-05-09 | 2002007020250 | Norma Fisher | primary-ssn-46 |

The view `immigration_status_declaration_minor_dependent_view` joins `immigration_status_declarations` to `minor_dependents` on `minor_dependent_id`. It answers: which minor dependent is associated with this declaration, and what is their citizenship status? Declaration `1000` is linked to minor dependent `100` (Theodore Mcgrath, age 35, Citizen). Declaration `1003` is linked to minor dependent `103` (Norma Fisher, age 50, Eligible Noncitizen).

**View `immigration_status_declaration_minor_dependent_view`**

```sql
CREATE VIEW immigration_status_declaration_minor_dependent_view AS
SELECT a.id, a.declaration_id, a.declaration_date, a.revision_date, b.minor_dependent_id AS dependent_minor_dependent_id, b.minor_id AS dependent_minor_id, b.full_name AS dependent_full_name
FROM immigration_status_declarations a JOIN minor_dependents b ON a.minor_dependent_id = b.minor_dependent_id;
```

| id | declaration_id | declaration_date | revision_date | dependent_minor_dependent_id | dependent_minor_id | dependent_full_name |
|---|---|---|---|---|---|---|
| 1000 | 10966231 | 2022-09-25 | 2023-02-03 | 100 | b_VB-EC-12 | Theodore Mcgrath |
| 1001 | 1996917 | 2023-02-09 | 2024-07-14 | 101 | 20155792 | Account Name |
| 1002 | 557 | 2024-07-20 | 2025-12-25 | 102 | 1889764 | Saipan International Airport |
| 1003 | default_chart_a_tax_code_26 | 2025-12-04 | 2022-05-09 | 103 | 32806 | Norma Fisher |

The view `household_member_immigration_status_declaration_view` performs the inverse join: it starts from `household_members` and brings in the declaration details. This perspective answers: for a given household member, what declarations have they submitted, and what are the form versions and dates? Member `10207158` appears with declaration `1000` (form version `distributed-form-96`, declared `2022-09-25`) and with declaration `1001` (form version `baseline-form-97`, declared `2023-02-09`).

**View `household_member_immigration_status_declaration_view`**

```sql
CREATE VIEW household_member_immigration_status_declaration_view AS
SELECT a.member_id, a.full_name, a.ssn, a.role, b.id AS declaration_id, b.declaration_id AS declaration_declaration_id, b.declaration_date AS declaration_declaration_date
FROM household_members a JOIN immigration_status_declarations b ON a.immigration_status_declaration_id = b.id;
```

| member_id | full_name | ssn | role | declaration_id | declaration_declaration_id | declaration_declaration_date |
|---|---|---|---|---|---|---|
| 10207158 | Theodore Mcgrath | legacy-ssn-43 | Head of Household | 1000 | 10966231 | 2022-09-25 |
| 10207158 | Account Name | compact-ssn-44 | Adult Non-Head | 1001 | 1996917 | 2023-02-09 |
| 25820616 | Saipan International Airport | composite-ssn-45 | Head of Household | 1002 | 557 | 2024-07-20 |
| 2002007020250 | Norma Fisher | primary-ssn-46 | Adult Non-Head | 1003 | default_chart_a_tax_code_26 | 2025-12-04 |

The view `household_member_housing_unit_view` joins `household_members` to `housing_units` on `housing_unit_id`. It answers: which housing unit is each member assigned to? Member `10207158` (Theodore Mcgrath) is assigned to housing unit `1`; member `25820616` (Saipan International Airport) is assigned to housing unit `3`.

**View `household_member_housing_unit_view`**

```sql
CREATE VIEW household_member_housing_unit_view AS
SELECT a.member_id, a.full_name, a.ssn, a.role, b.id AS unit_id, b.unit_id AS unit_unit_id, b.address AS unit_address
FROM household_members a JOIN housing_units b ON a.housing_unit_id = b.id;
```

| member_id | full_name | ssn | role | unit_id | unit_unit_id | unit_address |
|---|---|---|---|---|---|---|
| 10207158 | Theodore Mcgrath | legacy-ssn-43 | Head of Household | 1 | 39800614 | distributed-address-72 |
| 10207158 | Account Name | compact-ssn-44 | Adult Non-Head | 2 | 611523 | baseline-address-73 |
| 25820616 | Saipan International Airport | composite-ssn-45 | Head of Household | 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | pilot-address-74 |
| 2002007020250 | Norma Fisher | primary-ssn-46 | Adult Non-Head | 4 | account_pymes_1040 | extended-address-75 |

The view `minor_dependent_immigration_status_declaration_view` joins `minor_dependents` to `immigration_status_declarations` on `immigration_status_declaration_id`. It answers: for a given minor dependent, what declaration are they tied to, and what is the declaration's certification status? Minor dependent `100` is tied to declaration `1000` (status `pending`); minor dependent `103` is tied to declaration `1003` (status `pending`).

**View `minor_dependent_immigration_status_declaration_view`**

```sql
CREATE VIEW minor_dependent_immigration_status_declaration_view AS
SELECT a.minor_dependent_id, a.minor_id, a.full_name, a.age, b.id AS declaration_id, b.declaration_id AS declaration_declaration_id, b.declaration_date AS declaration_declaration_date
FROM minor_dependents a JOIN immigration_status_declarations b ON a.immigration_status_declaration_id = b.id;
```

| minor_dependent_id | minor_id | full_name | age | declaration_id | declaration_declaration_id | declaration_declaration_date |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-12 | Theodore Mcgrath | 35 | 1000 | 10966231 | 2022-09-25 |
| 101 | 20155792 | Account Name | 40 | 1001 | 1996917 | 2023-02-09 |
| 102 | 1889764 | Saipan International Airport | 45 | 1002 | 557 | 2024-07-20 |
| 103 | 32806 | Norma Fisher | 50 | 1003 | default_chart_a_tax_code_26 | 2025-12-04 |

The view `minor_dependent_leasing_officer_view` joins `minor_dependents` to `leasing_officers` on `leasing_officer_id`. It answers: which leasing officer oversees each minor dependent? Minor dependent `100` is overseen by leasing officer `1` (Theodore Mcgrath, department `adaptive-departme-89`); minor dependent `103` is overseen by leasing officer `4` (Norma Fisher, department `pilot-departme-92`).

**View `minor_dependent_leasing_officer_view`**

```sql
CREATE VIEW minor_dependent_leasing_officer_view AS
SELECT a.minor_dependent_id, a.minor_id, a.full_name, a.age, b.leasing_officer_id AS officer_leasing_officer_id, b.officer_id AS officer_officer_id, b.full_name AS officer_full_name
FROM minor_dependents a JOIN leasing_officers b ON a.leasing_officer_id = b.leasing_officer_id;
```

| minor_dependent_id | minor_id | full_name | age | officer_leasing_officer_id | officer_officer_id | officer_full_name |
|---|---|---|---|---|---|---|
| 100 | b_VB-EC-12 | Theodore Mcgrath | 35 | 1 | 103165 | Theodore Mcgrath |
| 101 | 20155792 | Account Name | 40 | 2 | 2933464 | Account Name |
| 102 | 1889764 | Saipan International Airport | 45 | 3 | 10445622 | Saipan International Airport |
| 103 | 32806 | Norma Fisher | 50 | 4 | 7441150 | Norma Fisher |

The view `immigration_document_immigration_status_declaration_view` joins `immigration_documents` to `immigration_status_declarations` on `immigration_status_declaration_id`. It answers: which documents support which declaration? Document `1000` (type I-551, issued by Technos Japan) supports declaration `1000`; document `1003` (type I-766, issued by Lucas Industries) supports declaration `1003`.

**View `immigration_document_immigration_status_declaration_view`**

```sql
CREATE VIEW immigration_document_immigration_status_declaration_view AS
SELECT a.id, a.document_id, a.form_code, a.issuing_agency, b.id AS declaration_id, b.declaration_id AS declaration_declaration_id, b.declaration_date AS declaration_declaration_date
FROM immigration_documents a JOIN immigration_status_declarations b ON a.immigration_status_declaration_id = b.id;
```

| id | document_id | form_code | issuing_agency | declaration_id | declaration_declaration_id | declaration_declaration_date |
|---|---|---|---|---|---|---|
| 1000 | IVC10I | 12616 | Technos Japan | 1000 | 10966231 | 2022-09-25 |
| 1001 | 605943 | 2087755 | Sanniquellie Mahn | 1001 | 1996917 | 2023-02-09 |
| 1002 | 10449525 | template_impcode_pagata_4det50 | Greater Houston Community Foundation | 1002 | 557 | 2024-07-20 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | id_9 | Lucas Industries | 1003 | default_chart_a_tax_code_26 | 2025-12-04 |

The view `immigration_document_verification_consent_form_view` joins `immigration_documents` to `verification_consent_forms` on `verification_consent_form_id`. It answers: which consent form authorized which document? Document `1000` is authorized by consent form `1` (E-Verify, not signed); document `1003` is authorized by consent form `4` (E-Verify, signed).

**View `immigration_document_verification_consent_form_view`**

```sql
CREATE VIEW immigration_document_verification_consent_form_view AS
SELECT a.id, a.document_id, a.form_code, a.issuing_agency, b.id AS form_id, b.consent_id AS form_consent_id, b.signed_date AS form_signed_date
FROM immigration_documents a JOIN verification_consent_forms b ON a.verification_consent_form_id = b.id;
```

| id | document_id | form_code | issuing_agency | form_id | form_consent_id | form_signed_date |
|---|---|---|---|---|---|---|
| 1000 | IVC10I | 12616 | Technos Japan | 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-17 |
| 1001 | 605943 | 2087755 | Sanniquellie Mahn | 2 | 790462 | 2025-12-01 |
| 1002 | 10449525 | template_impcode_pagata_4det50 | Greater Houston Community Foundation | 3 | 4277037 | 2022-05-12 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | id_9 | Lucas Industries | 4 | 3990176 | 2023-10-23 |

The view `verification_consent_form_immigration_status_declaration_view` joins `verification_consent_forms` to `immigration_status_declarations` on `immigration_status_declaration_id`. It answers: which declaration does each consent form pertain to? Consent form `1` pertains to declaration `1000` (status `pending`); consent form `2` pertains to declaration `1001` (status `verified`).

**View `verification_consent_form_immigration_status_declaration_view`**

```sql
CREATE VIEW verification_consent_form_immigration_status_declaration_view AS
SELECT a.id, a.consent_id, a.signed_date, a.is_signed, b.id AS declaration_id, b.declaration_id AS declaration_declaration_id, b.declaration_date AS declaration_declaration_date
FROM verification_consent_forms a JOIN immigration_status_declarations b ON a.immigration_status_declaration_id = b.id;
```

| id | consent_id | signed_date | is_signed | declaration_id | declaration_declaration_id | declaration_declaration_date |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-17 | false | 1000 | 10966231 | 2022-09-25 |
| 2 | 790462 | 2025-12-01 | true | 1001 | 1996917 | 2023-02-09 |
| 3 | 4277037 | 2022-05-12 | false | 1002 | 557 | 2024-07-20 |
| 4 | 3990176 | 2023-10-23 | true | 1003 | default_chart_a_tax_code_26 | 2025-12-04 |

The view `verification_consent_form_household_member_view` joins `verification_consent_forms` to `household_members` on `member_id`. It answers: which household member provided each consent form? Consent form `1` was provided by member `10207158` (Theodore Mcgrath); consent form `3` was provided by member `25820616` (Saipan International Airport).

**View `verification_consent_form_household_member_view`**

```sql
CREATE VIEW verification_consent_form_household_member_view AS
SELECT a.id, a.consent_id, a.signed_date, a.is_signed, b.member_id AS member_member_id, b.full_name AS member_full_name, b.ssn AS member_ssn
FROM verification_consent_forms a JOIN household_members b ON a.member_id = b.member_id;
```

| id | consent_id | signed_date | is_signed | member_member_id | member_full_name | member_ssn |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-17 | false | 10207158 | Account Name | compact-ssn-44 |
| 2 | 790462 | 2025-12-01 | true | 10207158 | Account Name | compact-ssn-44 |
| 3 | 4277037 | 2022-05-12 | false | 25820616 | Saipan International Airport | composite-ssn-45 |
| 4 | 3990176 | 2023-10-23 | true | 2002007020250 | Norma Fisher | primary-ssn-46 |

The view `leasing_officer_immigration_status_declaration_view` joins `leasing_officers` to `immigration_status_declarations` on `immigration_status_declaration_id`. It answers: which leasing officer is associated with each declaration? Leasing officer `1` is associated with declaration `1000`; leasing officer `4` is associated with declaration `1003`.

**View `leasing_officer_immigration_status_declaration_view`**

```sql
CREATE VIEW leasing_officer_immigration_status_declaration_view AS
SELECT a.leasing_officer_id, a.officer_id, a.full_name, a.employee_id, b.id AS declaration_id, b.declaration_id AS declaration_declaration_id, b.declaration_date AS declaration_declaration_date
FROM leasing_officers a JOIN immigration_status_declarations b ON a.immigration_status_declaration_id = b.id;
```

| leasing_officer_id | officer_id | full_name | employee_id | declaration_id | declaration_declaration_id | declaration_declaration_date |
|---|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Norma Fisher | 1000 | 10966231 | 2022-09-25 |
| 2 | 2933464 | Account Name | Tasha Rodriguez | 1001 | 1996917 | 2023-02-09 |
| 3 | 10445622 | Saipan International Airport | Theodore Mcgrath | 1002 | 557 | 2024-07-20 |
| 4 | 7441150 | Norma Fisher | Peter Mcdowell | 1003 | default_chart_a_tax_code_26 | 2025-12-04 |

The view `leasing_officer_minor_dependent_view` joins `leasing_officers` to `minor_dependents` on `minor_dependent_id`. It answers: which minor dependent is overseen by each leasing officer? Leasing officer `1` oversees minor dependent `100`; leasing officer `4` oversees minor dependent `103`.

**View `leasing_officer_minor_dependent_view`**

```sql
CREATE VIEW leasing_officer_minor_dependent_view AS
SELECT a.leasing_officer_id, a.officer_id, a.full_name, a.employee_id, b.minor_dependent_id AS dependent_minor_dependent_id, b.minor_id AS dependent_minor_id, b.full_name AS dependent_full_name
FROM leasing_officers a JOIN minor_dependents b ON a.minor_dependent_id = b.minor_dependent_id;
```

| leasing_officer_id | officer_id | full_name | employee_id | dependent_minor_dependent_id | dependent_minor_id | dependent_full_name |
|---|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Norma Fisher | 100 | b_VB-EC-12 | Theodore Mcgrath |
| 2 | 2933464 | Account Name | Tasha Rodriguez | 101 | 20155792 | Account Name |
| 3 | 10445622 | Saipan International Airport | Theodore Mcgrath | 102 | 1889764 | Saipan International Airport |
| 4 | 7441150 | Norma Fisher | Peter Mcdowell | 103 | 32806 | Norma Fisher |

The view `housing_unit_household_member_view` joins `housing_units` to `household_members` on `housing_unit_id`. It answers: which household members are assigned to each housing unit? Housing unit `1` houses member `10207158` (Theodore Mcgrath); housing unit `4` houses member `2002007020250` (Norma Fisher).

**View `housing_unit_household_member_view`**

```sql
CREATE VIEW housing_unit_household_member_view AS
SELECT a.id, a.unit_id, a.address, a.bedrooms, b.member_id AS member_member_id, b.full_name AS member_full_name, b.ssn AS member_ssn
FROM housing_units a JOIN household_members b ON a.member_id = b.member_id;
```

| id | unit_id | address | bedrooms | member_member_id | member_full_name | member_ssn |
|---|---|---|---|---|---|---|
| 1 | 39800614 | distributed-address-72 | 16 | 10207158 | Account Name | compact-ssn-44 |
| 2 | 611523 | baseline-address-73 | 19 | 10207158 | Account Name | compact-ssn-44 |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | pilot-address-74 | 22 | 25820616 | Saipan International Airport | composite-ssn-45 |
| 4 | account_pymes_1040 | extended-address-75 | 25 | 2002007020250 | Norma Fisher | primary-ssn-46 |

## Synthesis

The schema models the immigration status declaration domain as a star-like structure centered on `immigration_status_declarations`, with six satellite tables encoding the people, places, documents, and consent mechanisms that surround each declaration. The foreign keys in `immigration_status_declarations` (`member_id`, `minor_dependent_id`) create a bidirectional bridge to the person tables, while the person tables (`household_members`, `minor_dependents`) carry their own foreign keys (`immigration_status_declaration_id`, `leasing_officer_id`, `housing_unit_id`) that complete the relationship graph. The document and consent tables (`immigration_documents`, `verification_consent_forms`) add a layer of evidentiary and procedural detail, with `immigration_documents` linking to both declarations and consent forms. The twelve views materialize every pairwise join between these tables, ensuring that any business question—whether about a member's housing assignment, a dependent's citizenship status, an officer's caseload, or a document's supporting declaration—can be answered through a single, pre-joined query. This design balances normalization (reducing redundancy by splitting declarations, members, dependents, documents, and consent into separate tables) with query convenience (providing views that reassemble the facts into the shapes that auditors and housing managers need).