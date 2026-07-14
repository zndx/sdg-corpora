## Domain Modelling and Relational Materialization

The retirement plan administration domain revolves around a single actor—the plan member—whose life events (marriage, employment changes, retirement) drive a cascade of applications, benefit elections, and beneficiary designations. The relational schema captures this lifecycle through six base tables, four junction tables that resolve many-to-many associations, and a suite of denormalized views that reconstruct the business facts an administrator needs to answer questions like "Which member applied for which benefit option, and has spousal consent been obtained?" The following sections walk through the entity types, their attributes, the foreign-key topology that binds them, and the view-level joins that materialize domain facts.

**Table `retirement_plan_members`**

| member_id | full_name | ssn | date_of_birth | gender | address | telephone | email_address | has_spouse_member_id | participating_employer_id |
|---|---|---|---|---|---|---|---|---|---|
| 10207158 | Theodore Mcgrath | legacy-ssn-43 | 2025-04-02 | Male | distributed-address-72 | adaptive-telephon-23 | primary-email-70 | 10207158 | 1 |
| 10207158 | Account Name | compact-ssn-44 | 2022-09-13 | Female | baseline-address-73 | distributed-telephon-24 | adaptive-email-71 | 10207158 | 2 |
| 25820616 | Saipan International Airport | composite-ssn-45 | 2023-02-24 | Male | pilot-address-74 | baseline-telephon-25 | distributed-email-72 | 25820616 | 3 |
| 2002007020250 | Norma Fisher | primary-ssn-46 | 2024-07-08 | Female | extended-address-75 | pilot-telephon-26 | baseline-email-73 | 2002007020250 | 4 |

The `retirement_plan_members` table is the anchor of the schema. Each row represents a plan participant identified by `member_id`, a surrogate key that doubles as a self-referencing pointer: the column `has_spouse_member_id` holds the `member_id` of the member's spouse, enabling a recursive relationship within the same table. In the sample data, member `10207158` (Theodore Mcgrath) lists himself as his own spouse, while member `25820616` (Saipan International Airport) does the same—a pattern that reflects how the data generator populates the self-reference. Personal attributes include `full_name`, `ssn`, `date_of_birth`, `gender`, `address`, `telephone`, and `email_address`. The foreign key `participating_employer_id` links each member to their sponsoring employer in the `participating_employers` table. The cardinality is one-to-many: a single employer sponsors many members, but each member belongs to exactly one employer.

**Table `participating_employers`**

| id | employer_id | employer_name | ein | plan_start_date |
|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | Air Products & Chemicals Inc | distributed-ein-90 | 2025-08-17 |
| 2 | ChargePoint Holdings. | AT&T Technologies | baseline-ein-91 | 2022-01-01 |
| 3 | Intl. Business Machines | Beam Global | pilot-ein-92 | 2023-06-12 |
| 4 | Feedback Ratings | Staples Inc. | extended-ein-93 | 2024-11-23 |

The `participating_employers` table defines the sponsoring organizations. Its primary key `id` is a surrogate, while `employer_id` carries the business identifier (e.g., "The Hongkong and Shanghai Banking Corporation Limited"). The columns `employer_name`, `ein` (Employer Identification Number), and `plan_start_date` complete the employer profile. The join from `retirement_plan_members.participating_employer_id` to `participating_employers.id` is a standard foreign-key relationship with cardinality one-to-many on the member side.

**Table `retirement_benefit_applications`**

| retirement_benefit_application_id | application_id | application_date | benefit_type | benefit_option | benefit_start_date | marital_status | spouse_consent_status | application_status | member_id | benefit_option_id | spousal_consent_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16T16:24:00 | Normal | Life Annuity with 5-Year Guarantee | 2023-02-09 | Not Married | Not Required | Submitted | 10207158 | 1 | 1 |
| 101 | 1250196 | 2023-10-27T23:41:00 | Early | Contingent Annuity with 100% Survivor Benefit | 2024-07-20 | Married | Required | Under Review | 10207158 | 2 | 2 |
| 102 | 124 | 2024-03-11T06:58:00 | Deferred | Contingent Annuity with 75% Survivor Benefit | 2025-12-04 | Not Married | Obtained | Approved | 25820616 | 3 | 3 |
| 103 | IVC20det40 | 2025-08-22T13:15:00 | Normal | Contingent Annuity with 50% Survivor Benefit | 2022-05-15 | Married | Waived - Inability to Locate | Rejected | 2002007020250 | 4 | 4 |

Retirement benefit applications are captured in `retirement_benefit_applications`. Each row is identified by `retirement_benefit_application_id` and carries an `application_id` (a business-level identifier such as `505997` or the alphanumeric `IVC20det40`). The columns `application_date`, `benefit_type` (Normal, Early, Deferred), `benefit_option` (a human-readable label like "Life Annuity with 5-Year Guarantee"), `benefit_start_date`, `marital_status`, `spouse_consent_status`, and `application_status` (Submitted, Under Review, Approved, Rejected) describe the application lifecycle. Two foreign keys anchor the application to its parent entities: `member_id` references `retirement_plan_members`, `benefit_option_id` references `benefit_options`, and `spousal_consent_id` references `spousal_consents`. The cardinality from member to application is one-to-many—a member can submit multiple applications over time, as seen with member `10207158` who has applications `100` and `101`.

**Table `benefit_options`**

| id | option_id | option_name | payment_duration | has_guarantee_period | guarantee_months | survivor_benefit_percentage |
|---|---|---|---|---|---|---|
| 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative | Lifetime | true | 22 | 14.45 |
| 2 | 1204-0009-S | Integrated Model | Lifetime with Survivor | false | 31 | 17.90 |
| 3 | 9424920 | Extended Cluster D | Lifetime | true | 40 | 21.35 |
| 4 | 1186083 | Pilot Review | Lifetime with Survivor | false | 49 | 24.80 |

The `benefit_options` table is a lookup of available benefit election types. Its surrogate primary key `id` maps to a business `option_id` (UUIDs like `a4e3c328-8fb9-11eb-924d-9cd76263cbd0` or codes like `1204-0009-S`). The columns `option_name`, `payment_duration` (Lifetime, Lifetime with Survivor), `has_guarantee_period` (boolean), `guarantee_months`, and `survivor_benefit_percentage` define the structural parameters of each option. An application's `benefit_option_id` foreign key points to this table, establishing a many-to-one relationship: many applications can select the same benefit option.

**Table `beneficiaries`**

| id | beneficiary_id | full_name | relationship | ssn | date_of_birth | address | telephone | email_address | beneficiary_type | member_id | benefit_option_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 325448 | Theodore Mcgrath | baseline-relation-67 | legacy-ssn-43 | 2025-04-02 | distributed-address-72 | adaptive-telephon-23 | primary-email-70 | Primary | 10207158 | 1 |
| 101 | 7731875 | Account Name | pilot-relation-68 | compact-ssn-44 | 2022-09-13 | baseline-address-73 | distributed-telephon-24 | adaptive-email-71 | Secondary | 10207158 | 2 |
| 102 | 4447008 | Saipan International Airport | extended-relation-69 | composite-ssn-45 | 2023-02-24 | pilot-address-74 | baseline-telephon-25 | distributed-email-72 | Primary | 25820616 | 3 |
| 103 | 39800616 | Norma Fisher | integrated-relation-70 | primary-ssn-46 | 2024-07-08 | extended-address-75 | pilot-telephon-26 | baseline-email-73 | Secondary | 2002007020250 | 4 |

Beneficiaries are recorded in `beneficiaries`, with surrogate key `id` and business key `beneficiary_id`. The columns `full_name`, `relationship`, `ssn`, `date_of_birth`, `address`, `telephone`, `email_address`, and `beneficiary_type` (Primary or Secondary) describe the designated recipient. Two foreign keys—`member_id` and `benefit_option_id`—link a beneficiary to the plan member who designated them and to the specific benefit option under which the designation applies. The cardinality is one-to-many from member to beneficiary: member `10207158` has two beneficiaries (ids `100` and `101`), one Primary and one Secondary.

**Table `spousal_consents`**

| spousal_consent_id | consent_id | consent_date | spouse_ssn | notary_name | notary_commission_expiry | witnessed_by_plan_rep | retirement_benefit_application_id | member_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 | distributed-spouse-54 | Extended Review | 2025-08-07 | false | 100 | 10207158 |
| 2 | 790462 | 2024-03-14T16:32:00 | baseline-spouse-55 | Pilot Initiative A | 2022-01-18 | true | 101 | 10207158 |
| 3 | 4277037 | 2025-08-25T23:49:00 | pilot-spouse-56 | Baseline Model | 2023-06-02 | false | 102 | 25820616 |
| 4 | 3990176 | 2022-01-09T06:06:00 | extended-spouse-57 | Distributed Cluster | 2024-11-13 | true | 103 | 2002007020250 |

Spousal consent records live in `spousal_consents`. Each row has `spousal_consent_id`, a business `consent_id`, `consent_date`, `spouse_ssn`, `notary_name`, `notary_commission_expiry`, and a boolean `witnessed_by_plan_rep`. The foreign key `retirement_benefit_application_id` ties the consent to a specific application, while `member_id` ties it to the member. The cardinality from application to consent is one-to-one in the sample data: application `100` has consent `1`, application `101` has consent `2`, and so on.

**Table `members_applications`**

| member_id | retirement_benefit_application_id |
|---|---|
| 10207158 | 100 |
| 10207158 | 101 |
| 10207158 | 101 |
| 10207158 | 102 |
| 25820616 | 102 |
| 25820616 | 103 |
| 2002007020250 | 103 |
| 2002007020250 | 100 |

The junction table `members_applications` resolves the many-to-many relationship between members and benefit applications. Although the `retirement_benefit_applications` table already carries a `member_id` foreign key (making the direct link functional), this junction table provides an explicit association layer that can carry additional metadata in extended schemas. In the current model it serves as a denormalized bridge for query convenience.

**Table `members_beneficiaries`**

| member_id | beneficiary_id |
|---|---|
| 10207158 | 100 |
| 10207158 | 101 |
| 10207158 | 101 |
| 10207158 | 102 |
| 25820616 | 102 |
| 25820616 | 103 |
| 2002007020250 | 103 |
| 2002007020250 | 100 |

Similarly, `members_beneficiaries` is a junction table linking members to their designated beneficiaries. It mirrors the `member_id` foreign key already present in `beneficiaries`, providing an explicit association table that can be extended with designation percentages or effective dates without altering the core entity.

**Table `options_applications`**

| benefit_option_id | retirement_benefit_application_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

The `options_applications` junction table connects benefit options to benefit applications. Since `retirement_benefit_applications` already references `benefit_options` via `benefit_option_id`, this junction table acts as an explicit many-to-many bridge, allowing a single application to reference multiple benefit options in future extensions.

**Table `employers_members`**

| participating_employer_id | member_id |
|---|---|
| 1 | 10207158 |
| 1 | 10207158 |
| 2 | 10207158 |
| 2 | 25820616 |
| 3 | 25820616 |
| 3 | 2002007020250 |
| 4 | 2002007020250 |
| 4 | 10207158 |

The `employers_members` junction table links participating employers to their sponsored members. Like the other junction tables, it duplicates the foreign-key relationship already expressible through `retirement_plan_members.participating_employer_id`, but provides a dedicated association layer for queries that enumerate members by employer or employers by member.

With the base tables and junction tables defined, the schema's foreign-key topology can be summarized. The `retirement_plan_members` table sits at the center, connected to `participating_employers` (one-to-many), `retirement_benefit_applications` (one-to-many), and `beneficiaries` (one-to-many). The `retirement_benefit_applications` table, in turn, connects to `benefit_options` (many-to-one) and `spousal_consents` (one-to-one). The junction tables (`members_applications`, `members_beneficiaries`, `options_applications`, `employers_members`) provide explicit association layers that mirror these relationships.

The views materialize domain facts by joining these normalized tables. Each view answers a specific analytical question by denormalizing the relevant entities into a single flat result set.

**View `vw_retirement_plan_member_retirement_benefit_application_detail`**

```sql
CREATE VIEW vw_retirement_plan_member_retirement_benefit_application_detail AS
SELECT a.member_id, a.full_name, a.ssn, b.retirement_benefit_application_id AS application_retirement_benefit_application_id, b.application_id AS application_application_id, b.application_date AS application_application_date
FROM retirement_plan_members a
  JOIN members_applications j ON j.member_id = a.member_id
  JOIN retirement_benefit_applications b ON b.retirement_benefit_application_id = j.retirement_benefit_application_id;
```

| member_id | full_name | ssn | application_retirement_benefit_application_id | application_application_id | application_application_date |
|---|---|---|---|---|---|
| 10207158 | Account Name | compact-ssn-44 | 100 | 505997 | 2022-05-16T16:24:00 |
| 10207158 | Account Name | compact-ssn-44 | 101 | 1250196 | 2023-10-27T23:41:00 |
| 10207158 | Account Name | compact-ssn-44 | 101 | 1250196 | 2023-10-27T23:41:00 |
| 10207158 | Account Name | compact-ssn-44 | 102 | 124 | 2024-03-11T06:58:00 |
| 25820616 | Saipan International Airport | composite-ssn-45 | 102 | 124 | 2024-03-11T06:58:00 |
| 25820616 | Saipan International Airport | composite-ssn-45 | 103 | IVC20det40 | 2025-08-22T13:15:00 |
| 2002007020250 | Norma Fisher | primary-ssn-46 | 103 | IVC20det40 | 2025-08-22T13:15:00 |
| 2002007020250 | Norma Fisher | primary-ssn-46 | 100 | 505997 | 2022-05-16T16:24:00 |

This view joins `retirement_plan_members` with `retirement_benefit_applications` to produce a member-application detail row. It answers the question: "What benefit application did this member submit, and what is its current status?" For member `10207158` (Theodore Mcgrath), the view would surface application `100` (submitted 2022-05-16, benefit type Normal, status Submitted) and application `101` (submitted 2023-10-27, benefit type Early, status Under Review), allowing an administrator to see the full application history for a single member in one row per application.

**View `vw_retirement_plan_member_beneficiary_detail`**

```sql
CREATE VIEW vw_retirement_plan_member_beneficiary_detail AS
SELECT a.member_id, a.full_name, a.ssn, b.id AS beneficiary_id, b.beneficiary_id AS beneficiary_beneficiary_id, b.full_name AS beneficiary_full_name
FROM retirement_plan_members a
  JOIN members_beneficiaries j ON j.member_id = a.member_id
  JOIN beneficiaries b ON b.id = j.beneficiary_id;
```

| member_id | full_name | ssn | beneficiary_id | beneficiary_beneficiary_id | beneficiary_full_name |
|---|---|---|---|---|---|
| 10207158 | Account Name | compact-ssn-44 | 100 | 325448 | Theodore Mcgrath |
| 10207158 | Account Name | compact-ssn-44 | 101 | 7731875 | Account Name |
| 10207158 | Account Name | compact-ssn-44 | 101 | 7731875 | Account Name |
| 10207158 | Account Name | compact-ssn-44 | 102 | 4447008 | Saipan International Airport |
| 25820616 | Saipan International Airport | composite-ssn-45 | 102 | 4447008 | Saipan International Airport |
| 25820616 | Saipan International Airport | composite-ssn-45 | 103 | 39800616 | Norma Fisher |
| 2002007020250 | Norma Fisher | primary-ssn-46 | 103 | 39800616 | Norma Fisher |
| 2002007020250 | Norma Fisher | primary-ssn-46 | 100 | 325448 | Theodore Mcgrath |

This view joins `retirement_plan_members` with `beneficiaries` to answer: "Who are the designated beneficiaries for this member, and under which benefit option?" Member `10207158` appears with two beneficiary rows: beneficiary `100` (Theodore Mcgrath, Primary, linked to benefit option `1`) and beneficiary `101` (Account Name, Secondary, linked to benefit option `2`). The view makes it trivial to audit beneficiary designations per member.

**View `vw_retirement_plan_member_retirement_plan_member`**

```sql
CREATE VIEW vw_retirement_plan_member_retirement_plan_member AS
SELECT a.member_id, a.full_name, a.ssn, a.date_of_birth, b.member_id AS member_member_id, b.full_name AS member_full_name, b.ssn AS member_ssn
FROM retirement_plan_members a JOIN retirement_plan_members b ON a.has_spouse_member_id = b.member_id;
```

| member_id | full_name | ssn | date_of_birth | member_member_id | member_full_name | member_ssn |
|---|---|---|---|---|---|---|
| 10207158 | Theodore Mcgrath | legacy-ssn-43 | 2025-04-02 | 10207158 | Account Name | compact-ssn-44 |
| 10207158 | Account Name | compact-ssn-44 | 2022-09-13 | 10207158 | Account Name | compact-ssn-44 |
| 25820616 | Saipan International Airport | composite-ssn-45 | 2023-02-24 | 25820616 | Saipan International Airport | composite-ssn-45 |
| 2002007020250 | Norma Fisher | primary-ssn-46 | 2024-07-08 | 2002007020250 | Norma Fisher | primary-ssn-46 |

This self-join view on `retirement_plan_members` answers: "Which members are spouses of other members within the plan?" Since `has_spouse_member_id` is a self-referencing foreign key, this view reconstructs the spousal pairing. Member `10207158` (Theodore Mcgrath) is paired with itself as spouse, and member `2002007020250` (Norma Fisher) is similarly self-referenced. The view is useful for identifying married couples who are both plan participants.

**View `vw_retirement_plan_member_participating_employer`**

```sql
CREATE VIEW vw_retirement_plan_member_participating_employer AS
SELECT a.member_id, a.full_name, a.ssn, a.date_of_birth, b.id AS employer_id, b.employer_id AS employer_employer_id, b.employer_name AS employer_employer_name
FROM retirement_plan_members a JOIN participating_employers b ON a.participating_employer_id = b.id;
```

| member_id | full_name | ssn | date_of_birth | employer_id | employer_employer_id | employer_employer_name |
|---|---|---|---|---|---|---|
| 10207158 | Theodore Mcgrath | legacy-ssn-43 | 2025-04-02 | 1 | The Hongkong and Shanghai Banking Corporation Limited | Air Products & Chemicals Inc |
| 10207158 | Account Name | compact-ssn-44 | 2022-09-13 | 2 | ChargePoint Holdings. | AT&T Technologies |
| 25820616 | Saipan International Airport | composite-ssn-45 | 2023-02-24 | 3 | Intl. Business Machines | Beam Global |
| 2002007020250 | Norma Fisher | primary-ssn-46 | 2024-07-08 | 4 | Feedback Ratings | Staples Inc. |

This view joins `retirement_plan_members` with `participating_employers` to answer: "Which employer sponsors this member?" Member `10207158` (Theodore Mcgrath) is linked to employer id `1` (The Hongkong and Shanghai Banking Corporation Limited / Air Products & Chemicals Inc), while member `25820616` (Saipan International Airport) is linked to employer id `3` (Intl. Business Machines / Beam Global). The view flattens the employer name and EIN alongside member personal data for reporting.

**View `vw_retirement_benefit_application_retirement_plan_member`**

```sql
CREATE VIEW vw_retirement_benefit_application_retirement_plan_member AS
SELECT a.retirement_benefit_application_id, a.application_id, a.application_date, a.benefit_type, b.member_id AS member_member_id, b.full_name AS member_full_name, b.ssn AS member_ssn
FROM retirement_benefit_applications a JOIN retirement_plan_members b ON a.member_id = b.member_id;
```

| retirement_benefit_application_id | application_id | application_date | benefit_type | member_member_id | member_full_name | member_ssn |
|---|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16T16:24:00 | Normal | 10207158 | Account Name | compact-ssn-44 |
| 101 | 1250196 | 2023-10-27T23:41:00 | Early | 10207158 | Account Name | compact-ssn-44 |
| 102 | 124 | 2024-03-11T06:58:00 | Deferred | 25820616 | Saipan International Airport | composite-ssn-45 |
| 103 | IVC20det40 | 2025-08-22T13:15:00 | Normal | 2002007020250 | Norma Fisher | primary-ssn-46 |

This view joins `retirement_benefit_applications` with `retirement_plan_members` to answer: "Which member submitted this application, and what are their personal details?" Application `100` (submitted 2022-05-16, benefit type Normal, status Submitted) is attributed to member `10207158` (Theodore Mcgrath, DOB 2025-04-02). Application `103` (submitted 2025-08-22, benefit type Normal, status Rejected) is attributed to member `2002007020250` (Norma Fisher, DOB 2024-07-08). The view is the natural starting point for application-level audits.

**View `vw_retirement_benefit_application_benefit_option`**

```sql
CREATE VIEW vw_retirement_benefit_application_benefit_option AS
SELECT a.retirement_benefit_application_id, a.application_id, a.application_date, a.benefit_type, b.id AS option_id, b.option_id AS option_option_id, b.option_name AS option_option_name
FROM retirement_benefit_applications a JOIN benefit_options b ON a.benefit_option_id = b.id;
```

| retirement_benefit_application_id | application_id | application_date | benefit_type | option_id | option_option_id | option_option_name |
|---|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16T16:24:00 | Normal | 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative |
| 101 | 1250196 | 2023-10-27T23:41:00 | Early | 2 | 1204-0009-S | Integrated Model |
| 102 | 124 | 2024-03-11T06:58:00 | Deferred | 3 | 9424920 | Extended Cluster D |
| 103 | IVC20det40 | 2025-08-22T13:15:00 | Normal | 4 | 1186083 | Pilot Review |

This view joins `retirement_benefit_applications` with `benefit_options` to answer: "What benefit option did this application select, and what are its structural parameters?" Application `100` selected benefit option `1` (Seasonal Initiative, Lifetime payment duration, 22-month guarantee period, 14.45% survivor benefit). Application `101` selected benefit option `2` (Integrated Model, Lifetime with Survivor, no guarantee period, 17.90% survivor benefit). The view makes it possible to analyze benefit option selection patterns across applications.

**View `vw_retirement_benefit_application_spousal_consent`**

```sql
CREATE VIEW vw_retirement_benefit_application_spousal_consent AS
SELECT a.retirement_benefit_application_id, a.application_id, a.application_date, a.benefit_type, b.spousal_consent_id AS consent_spousal_consent_id, b.consent_id AS consent_consent_id, b.consent_date AS consent_consent_date
FROM retirement_benefit_applications a JOIN spousal_consents b ON a.spousal_consent_id = b.spousal_consent_id;
```

| retirement_benefit_application_id | application_id | application_date | benefit_type | consent_spousal_consent_id | consent_consent_id | consent_consent_date |
|---|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16T16:24:00 | Normal | 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 |
| 101 | 1250196 | 2023-10-27T23:41:00 | Early | 2 | 790462 | 2024-03-14T16:32:00 |
| 102 | 124 | 2024-03-11T06:58:00 | Deferred | 3 | 4277037 | 2025-08-25T23:49:00 |
| 103 | IVC20det40 | 2025-08-22T13:15:00 | Normal | 4 | 3990176 | 2022-01-09T06:06:00 |

This view joins `retirement_benefit_applications` with `spousal_consents` to answer: "Has spousal consent been obtained for this application, and what are the consent details?" Application `100` has consent `1` (consent date 2023-10-03, notary Extended Review, not witnessed by plan representative). Application `101` has consent `2` (consent date 2024-03-14, notary Pilot Initiative A, witnessed by plan representative). The view is critical for compliance audits, as it surfaces the consent status alongside the application status.

**View `vw_benefit_option_retirement_benefit_application_detail`**

```sql
CREATE VIEW vw_benefit_option_retirement_benefit_application_detail AS
SELECT a.id, a.option_id, a.option_name, b.retirement_benefit_application_id AS application_retirement_benefit_application_id, b.application_id AS application_application_id, b.application_date AS application_application_date
FROM benefit_options a
  JOIN options_applications j ON j.benefit_option_id = a.id
  JOIN retirement_benefit_applications b ON b.retirement_benefit_application_id = j.retirement_benefit_application_id;
```

| id | option_id | option_name | application_retirement_benefit_application_id | application_application_id | application_application_date |
|---|---|---|---|---|---|
| 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative | 100 | 505997 | 2022-05-16T16:24:00 |
| 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative | 101 | 1250196 | 2023-10-27T23:41:00 |
| 2 | 1204-0009-S | Integrated Model | 101 | 1250196 | 2023-10-27T23:41:00 |
| 2 | 1204-0009-S | Integrated Model | 102 | 124 | 2024-03-11T06:58:00 |
| 3 | 9424920 | Extended Cluster D | 102 | 124 | 2024-03-11T06:58:00 |
| 3 | 9424920 | Extended Cluster D | 103 | IVC20det40 | 2025-08-22T13:15:00 |
| 4 | 1186083 | Pilot Review | 103 | IVC20det40 | 2025-08-22T13:15:00 |
| 4 | 1186083 | Pilot Review | 100 | 505997 | 2022-05-16T16:24:00 |

This view joins `benefit_options` with `retirement_benefit_applications` to answer: "Which applications selected this benefit option, and what is the application context?" Benefit option `1` (Seasonal Initiative) is selected by application `100` (status Submitted, benefit type Normal). Benefit option `4` (Pilot Review) is selected by application `103` (status Rejected, benefit type Normal). The view supports benefit option utilization analysis.

**View `vw_beneficiary_retirement_plan_member`**

```sql
CREATE VIEW vw_beneficiary_retirement_plan_member AS
SELECT a.id, a.beneficiary_id, a.full_name, a.relationship, b.member_id AS member_member_id, b.full_name AS member_full_name, b.ssn AS member_ssn
FROM beneficiaries a JOIN retirement_plan_members b ON a.member_id = b.member_id;
```

| id | beneficiary_id | full_name | relationship | member_member_id | member_full_name | member_ssn |
|---|---|---|---|---|---|---|
| 100 | 325448 | Theodore Mcgrath | baseline-relation-67 | 10207158 | Account Name | compact-ssn-44 |
| 101 | 7731875 | Account Name | pilot-relation-68 | 10207158 | Account Name | compact-ssn-44 |
| 102 | 4447008 | Saipan International Airport | extended-relation-69 | 25820616 | Saipan International Airport | composite-ssn-45 |
| 103 | 39800616 | Norma Fisher | integrated-relation-70 | 2002007020250 | Norma Fisher | primary-ssn-46 |

This view joins `beneficiaries` with `retirement_plan_members` to answer: "Which member designated this beneficiary, and what are the member's details?" Beneficiary `100` (Theodore Mcgrath, Primary) is designated by member `10207158` (Theodore Mcgrath). Beneficiary `103` (Norma Fisher, Secondary) is designated by member `2002007020250` (Norma Fisher). The view is useful for beneficiary-level reporting and for verifying that designations are current.

**View `vw_beneficiary_benefit_option`**

```sql
CREATE VIEW vw_beneficiary_benefit_option AS
SELECT a.id, a.beneficiary_id, a.full_name, a.relationship, b.id AS option_id, b.option_id AS option_option_id, b.option_name AS option_option_name
FROM beneficiaries a JOIN benefit_options b ON a.benefit_option_id = b.id;
```

| id | beneficiary_id | full_name | relationship | option_id | option_option_id | option_option_name |
|---|---|---|---|---|---|---|
| 100 | 325448 | Theodore Mcgrath | baseline-relation-67 | 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative |
| 101 | 7731875 | Account Name | pilot-relation-68 | 2 | 1204-0009-S | Integrated Model |
| 102 | 4447008 | Saipan International Airport | extended-relation-69 | 3 | 9424920 | Extended Cluster D |
| 103 | 39800616 | Norma Fisher | integrated-relation-70 | 4 | 1186083 | Pilot Review |

This view joins `beneficiaries` with `benefit_options` to answer: "Under which benefit option was this beneficiary designated?" Beneficiary `100` (Primary) is linked to benefit option `1` (Seasonal Initiative). Beneficiary `101` (Secondary) is linked to benefit option `2` (Integrated Model). The view enables analysis of beneficiary designations by benefit option type.

**View `vw_spousal_consent_retirement_benefit_application`**

```sql
CREATE VIEW vw_spousal_consent_retirement_benefit_application AS
SELECT a.spousal_consent_id, a.consent_id, a.consent_date, a.spouse_ssn, b.retirement_benefit_application_id AS application_retirement_benefit_application_id, b.application_id AS application_application_id, b.application_date AS application_application_date
FROM spousal_consents a JOIN retirement_benefit_applications b ON a.retirement_benefit_application_id = b.retirement_benefit_application_id;
```

| spousal_consent_id | consent_id | consent_date | spouse_ssn | application_retirement_benefit_application_id | application_application_id | application_application_date |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 | distributed-spouse-54 | 100 | 505997 | 2022-05-16T16:24:00 |
| 2 | 790462 | 2024-03-14T16:32:00 | baseline-spouse-55 | 101 | 1250196 | 2023-10-27T23:41:00 |
| 3 | 4277037 | 2025-08-25T23:49:00 | pilot-spouse-56 | 102 | 124 | 2024-03-11T06:58:00 |
| 4 | 3990176 | 2022-01-09T06:06:00 | extended-spouse-57 | 103 | IVC20det40 | 2025-08-22T13:15:00 |

This view joins `spousal_consents` with `retirement_benefit_applications` to answer: "Which application does this spousal consent belong to, and what is the application's status?" Consent `1` (date 2023-10-03, notary Extended Review) belongs to application `100` (status Submitted). Consent `4` (date 2022-01-09, notary Distributed Cluster) belongs to application `103` (status Rejected). The view supports consent lifecycle tracking.

**View `vw_spousal_consent_retirement_plan_member`**

```sql
CREATE VIEW vw_spousal_consent_retirement_plan_member AS
SELECT a.spousal_consent_id, a.consent_id, a.consent_date, a.spouse_ssn, b.member_id AS member_member_id, b.full_name AS member_full_name, b.ssn AS member_ssn
FROM spousal_consents a JOIN retirement_plan_members b ON a.member_id = b.member_id;
```

| spousal_consent_id | consent_id | consent_date | spouse_ssn | member_member_id | member_full_name | member_ssn |
|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 | distributed-spouse-54 | 10207158 | Account Name | compact-ssn-44 |
| 2 | 790462 | 2024-03-14T16:32:00 | baseline-spouse-55 | 10207158 | Account Name | compact-ssn-44 |
| 3 | 4277037 | 2025-08-25T23:49:00 | pilot-spouse-56 | 25820616 | Saipan International Airport | composite-ssn-45 |
| 4 | 3990176 | 2022-01-09T06:06:00 | extended-spouse-57 | 2002007020250 | Norma Fisher | primary-ssn-46 |

This view joins `spousal_consents` with `retirement_plan_members` to answer: "Which member provided this spousal consent, and what are their personal details?" Consent `1` was provided by member `10207158` (Theodore Mcgrath). Consent `3` was provided by member `25820616` (Saipan International Airport). The view is useful for consent-level reporting and for identifying members who have not yet provided consent.

**View `vw_participating_employer_retirement_plan_member_detail`**

```sql
CREATE VIEW vw_participating_employer_retirement_plan_member_detail AS
SELECT a.id, a.employer_id, a.employer_name, b.member_id AS member_member_id, b.full_name AS member_full_name, b.ssn AS member_ssn
FROM participating_employers a
  JOIN employers_members j ON j.participating_employer_id = a.id
  JOIN retirement_plan_members b ON b.member_id = j.member_id;
```

| id | employer_id | employer_name | member_member_id | member_full_name | member_ssn |
|---|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | Air Products & Chemicals Inc | 10207158 | Account Name | compact-ssn-44 |
| 1 | The Hongkong and Shanghai Banking Corporation Limited | Air Products & Chemicals Inc | 10207158 | Account Name | compact-ssn-44 |
| 2 | ChargePoint Holdings. | AT&T Technologies | 10207158 | Account Name | compact-ssn-44 |
| 2 | ChargePoint Holdings. | AT&T Technologies | 25820616 | Saipan International Airport | composite-ssn-45 |
| 3 | Intl. Business Machines | Beam Global | 25820616 | Saipan International Airport | composite-ssn-45 |
| 3 | Intl. Business Machines | Beam Global | 2002007020250 | Norma Fisher | primary-ssn-46 |
| 4 | Feedback Ratings | Staples Inc. | 2002007020250 | Norma Fisher | primary-ssn-46 |
| 4 | Feedback Ratings | Staples Inc. | 10207158 | Account Name | compact-ssn-44 |

This view joins `participating_employers` with `retirement_plan_members` to answer: "Which members are sponsored by this employer, and what are their personal details?" Employer id `1` (The Hongkong and Shanghai Banking Corporation Limited) sponsors member `10207158` (Theodore Mcgrath). Employer id `3` (Intl. Business Machines) sponsors member `25820616` (Saipan International Airport). The view supports employer-level headcount and demographic reporting.

The schema design reflects a deliberate trade-off between normalization and query convenience. The six base tables capture the core entities with minimal redundancy, while the four junction tables provide explicit association layers that can be extended without altering entity definitions. The foreign-key relationships form a star-like topology centered on `retirement_plan_members`, with `retirement_benefit_applications` acting as a secondary hub connecting to `benefit_options` and `spousal_consents`. The twenty-one views materialize the most common analytical queries by denormalizing the relevant entities into flat result sets, allowing administrators to answer questions about member-application relationships, beneficiary designations, spousal consent compliance, and employer sponsorship without writing complex joins. This architecture ensures that the relational schema faithfully represents the retirement plan domain while remaining accessible to business users who rely on the views for their daily operations.