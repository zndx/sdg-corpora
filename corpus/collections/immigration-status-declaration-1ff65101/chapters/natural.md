# Immigration Status Documentation in Housing Allocation

Housing allocation systems require rigorous documentation of immigration status to ensure compliance with federal regulations and fair-housing standards. The records in this system track declarations of immigration status across household members and minor dependents, linking each declaration to supporting documents, verification consent forms, assigned leasing officers, and the housing units they occupy. Every declaration carries a unique identifier, a form version, a certification status, and timestamps for both initial filing and any subsequent revisions. The system maintains seven base tables that capture declarations, household composition, dependents, supporting documents, consent records, officer assignments, and housing unit assignments, alongside twelve joined views that surface cross-entity relationships for operational review.

**Table `immigration_status_declarations`**

| id | declaration_id | declaration_date | revision_date | form_version | certification_status | perjury_acknowledged | member_id | minor_dependent_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 10966231 | 2022-09-25 | 2023-02-03 | distributed-form-96 | pending | true | 10207158 | 100 |
| 1001 | 1996917 | 2023-02-09 | 2024-07-14 | baseline-form-97 | verified | false | 10207158 | 101 |
| 1002 | 557 | 2024-07-20 | 2025-12-25 | pilot-form-98 | rejected | true | 25820616 | 102 |
| 1003 | default_chart_a_tax_code_26 | 2025-12-04 | 2022-05-09 | extended-form-99 | pending | false | 2002007020250 | 103 |

Each row in the declarations table represents a single filing event. The `declaration_id` column holds the external reference number—`10966231`, `1996917`, `557`, and `default_chart_a_tax_code_26` in the sample data—while `declaration_date` records when the form was originally submitted. The `revision_date` captures any amendment; for instance, declaration `1000` was filed on 2022-09-25 and revised on 2023-02-03. The `form_version` field distinguishes between `distributed-form-96`, `baseline-form-97`, `pilot-form-98`, and `extended-form-99`, reflecting different iterations of the declaration form in circulation. The `certification_status` column tracks the lifecycle of each declaration through `pending`, `verified`, and `rejected` states. The `perjury_acknowledged` flag indicates whether the filer attested to the truthfulness of the declaration under penalty of perjury. Each declaration is linked to a `member_id` and optionally a `minor_dependent_id`, anchoring the filing to a specific person in the household.

**Table `household_members`**

| member_id | full_name | ssn | role | age | is_senior | immigration_status_declaration_id | housing_unit_id |
|---|---|---|---|---|---|---|---|
| 10207158 | Theodore Mcgrath | legacy-ssn-43 | Head of Household | 35 | false | 1000 | 1 |
| 10207158 | Account Name | compact-ssn-44 | Adult Non-Head | 40 | true | 1001 | 2 |
| 25820616 | Saipan International Airport | composite-ssn-45 | Head of Household | 45 | false | 1002 | 3 |
| 2002007020250 | Norma Fisher | primary-ssn-46 | Adult Non-Head | 50 | true | 1003 | 4 |

Household members form the primary unit of occupancy. The `member_id` serves as the foreign key back to declarations, and the `full_name` column provides the person's legal name—`Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, and `Norma Fisher` appear in the sample. The `ssn` column stores Social Security numbers in various formats, including `legacy-ssn-43`, `compact-ssn-44`, `composite-ssn-45`, and `primary-ssn-46`. The `role` field classifies each member as either `Head of Household` or `Adult Non-Head`, which determines authority in the declaration process. The `age` and `is_senior` columns capture demographic information; members aged 35 through 50 are recorded, with `is_senior` set to `true` for those aged 40 and above. The `housing_unit_id` column links each member to their assigned unit, ranging from 1 to 4 in the sample data.

**Table `minor_dependents`**

| minor_dependent_id | minor_id | full_name | age | citizenship_status | immigration_status_declaration_id | leasing_officer_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | b_VB-EC-12 | Theodore Mcgrath | 35 | Citizen | 1000 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 20155792 | Account Name | 40 | Naturalized Citizen | 1001 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | 1889764 | Saipan International Airport | 45 | National | 1002 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 32806 | Norma Fisher | 50 | Eligible Noncitizen | 1003 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Minor dependents are tracked separately from adult household members, even though the sample data shows ages that overlap with adult ranges—a quirk of the test dataset. The `minor_dependent_id` is the primary key, and `minor_id` provides an alternate identifier such as `b_VB-EC-12`, `20155792`, `1889764`, and `32806`. The `full_name` column mirrors the names found in the household members table. The `citizenship_status` field distinguishes between `Citizen`, `Naturalized Citizen`, `National`, and `Eligible Noncitizen`, which directly affects the verification pathway. Each minor is linked to an `immigration_status_declaration_id` and a `leasing_officer_id`, and the `created_at` and `updated_at` timestamps record the audit trail of changes.

**Table `immigration_documents`**

| id | document_id | form_code | issuing_agency | annotation | issue_date | expiry_date | document_type | immigration_status_declaration_id | verification_consent_form_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | IVC10I | 12616 | Technos Japan | extended-annotati-27 | 2023-02-01 | 2023-10-24 | I-551 | 1000 | 1 | 2025-01-01 00:14:00 |
| 1001 | 605943 | 2087755 | Sanniquellie Mahn | integrated-annotati-28 | 2024-07-12 | 2024-03-08 | I-94 | 1001 | 2 | 2025-02-06 03:14:00 |
| 1002 | 10449525 | template_impcode_pagata_4det50 | Greater Houston Community Foundation | seasonal-annotati-29 | 2025-12-23 | 2025-08-19 | I-688 | 1002 | 3 | 2025-03-11 06:14:00 |
| 1003 | 5f93a090-8fcd-11eb-924d-9cd76263cbd0 | id_9 | Lucas Industries | regional-annotati-30 | 2022-05-07 | 2022-01-03 | I-766 | 1003 | 4 | 2025-04-16 09:14:00 |

Supporting documents provide the evidentiary basis for each declaration. The `id` column is the primary key, and `document_id` holds the external document reference—`IVC10I`, `605943`, `10449525`, and a UUID `5f93a090-8fcd-11eb-924d-9cd76263cbd0`. The `form_code` column stores numeric codes like `12616`, `2087755`, `template_impcode_pagata_4det50`, and `id_9`. The `issuing_agency` names—`Technos Japan`, `Sanniquellie Mahn`, `Greater Houston Community Foundation`, and `Lucas Industries`—identify the organization that issued the document. The `annotation` field contains free-text notes such as `extended-annotati-27` and `integrated-annotati-28`. The `issue_date` and `expiry_date` columns define the document's validity window; note that some expiry dates precede issue dates in the sample data, indicating potential data quality issues that warrant review. The `document_type` field classifies documents as `I-551`, `I-94`, `I-688`, or `I-766`, which are standard U.S. immigration form designations. Each document is linked to a declaration via `immigration_status_declaration_id` and to a consent form via `verification_consent_form_id`.

**Table `verification_consent_forms`**

| id | consent_id | signed_date | is_signed | verification_method | immigration_status_declaration_id | member_id |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2024-07-17 | false | E-Verify | 1000 | 10207158 |
| 2 | 790462 | 2025-12-01 | true | DirectContact | 1001 | 10207158 |
| 3 | 4277037 | 2022-05-12 | false | ThirdParty | 1002 | 25820616 |
| 4 | 3990176 | 2023-10-23 | true | E-Verify | 1003 | 2002007020250 |

Verification consent forms record the authorization granted by household members for their immigration status to be verified through official channels. The `id` column is the primary key, and `consent_id` holds the external reference, including UUIDs like `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3` and numeric values like `790462`. The `signed_date` records when the consent was executed. The `is_signed` flag indicates whether the form was actually signed—values of `true` and `false` alternate across the sample rows. The `verification_method` column specifies the channel used for verification: `E-Verify`, `DirectContact`, or `ThirdParty`. Each consent form is linked to a declaration and a member, creating a clear chain of authorization.

**Table `leasing_officers`**

| leasing_officer_id | officer_id | full_name | employee_id | department | immigration_status_declaration_id | minor_dependent_id |
|---|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Norma Fisher | adaptive-departme-89 | 1000 | 100 |
| 2 | 2933464 | Account Name | Tasha Rodriguez | distributed-departme-90 | 1001 | 101 |
| 3 | 10445622 | Saipan International Airport | Theodore Mcgrath | baseline-departme-91 | 1002 | 102 |
| 4 | 7441150 | Norma Fisher | Peter Mcdowell | pilot-departme-92 | 1003 | 103 |

Leasing officers are the staff members responsible for processing declarations and overseeing compliance. The `leasing_officer_id` is the primary key, and `officer_id` provides the alternate identifier. The `full_name` and `employee_id` columns store the officer's name and internal employee number. The `department` field classifies the officer's unit, with values like `adaptive-departme-89`, `distributed-departme-90`, `baseline-departme-91`, and `pilot-departme-92`. Each officer is linked to a declaration and a minor dependent, establishing accountability for specific cases.

**Table `housing_units`**

| id | unit_id | address | bedrooms | monthly_rent | occupancy_status | member_id |
|---|---|---|---|---|---|---|
| 1 | 39800614 | distributed-address-72 | 16 | 10.20 | Vacant | 10207158 |
| 2 | 611523 | baseline-address-73 | 19 | 12.40 | Occupied | 10207158 |
| 3 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | pilot-address-74 | 22 | 14.60 | Pending | 25820616 |
| 4 | account_pymes_1040 | extended-address-75 | 25 | 16.80 | Vacant | 2002007020250 |

Housing units represent the physical dwellings to which household members are assigned. The sample data references units numbered 1 through 4, each associated with a specific household member. The unit assignment is critical for occupancy reporting and fair-housing compliance audits.

## Cross-Entity Relationships

The system's twelve views surface the relationships between these base tables, enabling operators to answer complex queries about declarations, members, dependents, documents, consent, officers, and units in a single result set.

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

This view joins declarations with household members, answering the question of which member filed which declaration and under what circumstances. Row `1000` shows declaration `10966231` filed by `Theodore Mcgrath` (member `10207158`) in `pending` status, with the `distributed-form-96` version. Row `1001` shows declaration `1996917` filed by `Account Name` (same member `10207158`) in `verified` status, using `baseline-form-97` and with `perjury_acknowledged` set to `false`.

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

This view links declarations to minor dependents, revealing which dependents are associated with each declaration. Row `1000` connects declaration `10966231` to minor dependent `100` (named `Theodore Mcgrath`, citizenship status `Citizen`). Row `1002` connects declaration `557` to minor dependent `102` (named `Saipan International Airport`, citizenship status `National`).

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

This is the inverse of the first view, joining household members to their declarations. It confirms that member `10207158` (`Theodore Mcgrath`) has two declarations on record: declaration `1000` (status `pending`, form `distributed-form-96`) and declaration `1001` (status `verified`, form `baseline-form-97`). Member `25820616` (`Saipan International Airport`) has one declaration (`1002`, status `rejected`, form `pilot-form-98`).

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

This view maps household members to their assigned housing units. Member `10207158` (`Theodore Mcgrath`, role `Head of Household`) is assigned to housing unit `1`. Member `25820616` (`Saipan International Airport`, role `Head of Household`) is assigned to housing unit `3`. Member `2002007020250` (`Norma Fisher`, role `Adult Non-Head`) is assigned to housing unit `4`.

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

This view joins minor dependents to their declarations, providing a dependent-centric perspective. Minor dependent `100` (minor ID `b_VB-EC-12`, citizenship `Citizen`) is linked to declaration `1000` (form version `distributed-form-96`, status `pending`). Minor dependent `103` (minor ID `32806`, citizenship `Eligible Noncitizen`) is linked to declaration `1003` (form version `extended-form-99`, status `pending`).

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

This view connects minor dependents to their assigned leasing officers. Minor dependent `100` is assigned to leasing officer `1` (officer ID `103165`, department `adaptive-departme-89`). Minor dependent `101` is assigned to leasing officer `2` (officer ID `2933464`, department `distributed-departme-90`). Minor dependent `102` is assigned to leasing officer `3` (officer ID `10445622`, department `baseline-departme-91`). Minor dependent `103` is assigned to leasing officer `4` (officer ID `7441150`, department `pilot-departme-92`).

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

This view joins immigration documents to their parent declarations, enabling auditors to verify that each declaration has supporting documentation. Document `1000` (document ID `IVC10I`, type `I-551`, issued by `Technos Japan`) is linked to declaration `1000` (status `pending`). Document `1001` (document ID `605943`, type `I-94`, issued by `Sanniquellie Mahn`) is linked to declaration `1001` (status `verified`). Document `1002` (document ID `10449525`, type `I-688`, issued by `Greater Houston Community Foundation`) is linked to declaration `1002` (status `rejected`). Document `1003` (document ID `5f93a090-8fcd-11eb-924d-9cd76263cbd0`, type `I-766`, issued by `Lucas Industries`) is linked to declaration `1003` (status `pending`).

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

This view links immigration documents to their associated verification consent forms. Document `1000` is linked to consent form `1` (verification method `E-Verify`, not signed). Document `1001` is linked to consent form `2` (verification method `DirectContact`, signed). Document `1002` is linked to consent form `3` (verification method `ThirdParty`, not signed). Document `1003` is linked to consent form `4` (verification method `E-Verify`, signed).

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

This view joins consent forms to their declarations, showing which declarations have authorized verification. Consent form `1` (signed date `2024-07-17`, method `E-Verify`, not signed) is linked to declaration `1000` (status `pending`). Consent form `2` (signed date `2025-12-01`, method `DirectContact`, signed) is linked to declaration `1001` (status `verified`). Consent form `3` (signed date `2022-05-12`, method `ThirdParty`, not signed) is linked to declaration `1002` (status `rejected`). Consent form `4` (signed date `2023-10-23`, method `E-Verify`, signed) is linked to declaration `1003` (status `pending`).

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

This view connects consent forms to the household members who provided them. Consent form `1` (method `E-Verify`, not signed) was provided by member `10207158` (`Theodore Mcgrath`, role `Head of Household`). Consent form `2` (method `DirectContact`, signed) was also provided by member `10207158`. Consent form `3` (method `ThirdParty`, not signed) was provided by member `25820616` (`Saipan International Airport`, role `Head of Household`). Consent form `4` (method `E-Verify`, signed) was provided by member `2002007020250` (`Norma Fisher`, role `Adult Non-Head`).

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

This view links leasing officers to the declarations they oversee. Leasing officer `1` (officer ID `103165`, department `adaptive-departme-89`) is associated with declaration `1000` (status `pending`, form version `distributed-form-96`). Leasing officer `2` (officer ID `2933464`, department `distributed-departme-90`) is associated with declaration `1001` (status `verified`, form version `baseline-form-97`). Leasing officer `3` (officer ID `10445622`, department `baseline-departme-91`) is associated with declaration `1002` (status `rejected`, form version `pilot-form-98`). Leasing officer `4` (officer ID `7441150`, department `pilot-departme-92`) is associated with declaration `1003` (status `pending`, form version `extended-form-99`).

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

This view connects leasing officers to the minor dependents under their purview. Leasing officer `1` oversees minor dependent `100` (citizenship `Citizen`, declaration `1000`). Leasing officer `2` oversees minor dependent `101` (citizenship `Naturalized Citizen`, declaration `1001`). Leasing officer `3` oversees minor dependent `102` (citizenship `National`, declaration `1002`). Leasing officer `4` oversees minor dependent `103` (citizenship `Eligible Noncitizen`, declaration `1003`).

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

This final view maps housing units to their assigned household members, completing the occupancy picture. Housing unit `1` is assigned to member `10207158` (`Theodore Mcgrath`, age `35`, role `Head of Household`). Housing unit `2` is assigned to member `10207158` (`Account Name`, age `40`, role `Adult Non-Head`). Housing unit `3` is assigned to member `25820616` (`Saipan International Airport`, age `45`, role `Head of Household`). Housing unit `4` is assigned to member `2002007020250` (`Norma Fisher`, age `50`, role `Adult Non-Head`).

## Summary

The immigration status documentation system for housing allocation integrates seven base tables and twelve joined views to create a comprehensive record of declarations, household composition, dependents, supporting documents, consent forms, officer assignments, and housing unit placements. Each declaration carries a form version, certification status, and perjury acknowledgment, and is linked to a household member and optionally a minor dependent. Supporting documents of types `I-551`, `I-94`, `I-688`, and `I-766` provide evidentiary backing, while verification consent forms authorize the use of `E-Verify`, `DirectContact`, or `ThirdParty` verification methods. Leasing officers from departments such as `adaptive-departme-89` and `pilot-departme-92` are assigned to specific declarations and dependents, ensuring accountability. Housing units 1 through 4 are mapped to household members, completing the occupancy record. The twelve views enable operators to trace any declaration through its member, dependent, document, consent, officer, and unit relationships in a single query, supporting compliance audits, fair-housing reviews, and operational reporting.