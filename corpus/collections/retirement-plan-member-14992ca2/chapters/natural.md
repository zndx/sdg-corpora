## Retirement Plan Administration: Records, Relationships, and Operational Views

Retirement plan administration sits at the intersection of human capital management, financial compliance, and regulatory oversight. A plan sponsor—typically an employer—enrolls eligible employees as members of a retirement plan, each member selecting from a menu of benefit options that define how and when their accrued benefits will be paid. When a member applies for retirement benefits, the application must satisfy a set of eligibility rules, including marital status verification and, where applicable, spousal consent. The resulting data ecosystem captures every participant, every employer, every benefit choice, and every procedural checkpoint in a structured set of records. This chapter walks through the core entities, the relationships that bind them, and the analytical views that practitioners rely on to answer operational questions.

At the center of the system are the plan members themselves.

**Table `retirement_plan_members`**

| member_id | full_name | ssn | date_of_birth | gender | address | telephone | email_address | has_spouse_member_id | participating_employer_id |
|---|---|---|---|---|---|---|---|---|---|
| 10207158 | Theodore Mcgrath | legacy-ssn-43 | 2025-04-02 | Male | distributed-address-72 | adaptive-telephon-23 | primary-email-70 | 10207158 | 1 |
| 10207158 | Account Name | compact-ssn-44 | 2022-09-13 | Female | baseline-address-73 | distributed-telephon-24 | adaptive-email-71 | 10207158 | 2 |
| 25820616 | Saipan International Airport | composite-ssn-45 | 2023-02-24 | Male | pilot-address-74 | baseline-telephon-25 | distributed-email-72 | 25820616 | 3 |
| 2002007020250 | Norma Fisher | primary-ssn-46 | 2024-07-08 | Female | extended-address-75 | pilot-telephon-26 | baseline-email-73 | 2002007020250 | 4 |

The `retirement_plan_members` table stores one row per enrolled individual, keyed by `member_id`. Each record carries the member's full name, Social Security number, date of birth, gender, and contact details. The column `has_spouse_member_id` mirrors `member_id` in the sample rows, indicating that the member's own identifier is used as a reference point for spousal linkage. The `participating_employer_id` column anchors the member to the employer that sponsors the plan. In the data, member `10207158` (Theodore Mcgrath) is associated with employer `1`, while member `25820616` (Saipan International Airport) belongs to employer `3`. The table also accommodates members whose names appear as organizational entities, reflecting the fictional nature of the dataset.

Employers are cataloged in their own table.

**Table `participating_employers`**

| id | employer_id | employer_name | ein | plan_start_date |
|---|---|---|---|---|
| 1 | The Hongkong and Shanghai Banking Corporation Limited | Air Products & Chemicals Inc | distributed-ein-90 | 2025-08-17 |
| 2 | ChargePoint Holdings. | AT&T Technologies | baseline-ein-91 | 2022-01-01 |
| 3 | Intl. Business Machines | Beam Global | pilot-ein-92 | 2023-06-12 |
| 4 | Feedback Ratings | Staples Inc. | extended-ein-93 | 2024-11-23 |

The `participating_employers` table lists every organization that participates in the retirement plan. Each row is identified by `id` and `employer_id`, with the `employer_name` providing the legal or trade name. The `ein` column holds the employer identification number, and `plan_start_date` records when the employer's participation began. Employer `1`, for instance, is listed as "Air Products & Chemicals Inc" with a plan start date of 2025-08-17, while employer `2` ("ChargePoint Holdings.") joined on 2022-01-01. The `id` column serves as the foreign key referenced by `participating_employer_id` in the members table, establishing the employer-to-member relationship.

The bridge between employers and members is explicit.

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

The `employers_members` table materializes the many-to-many relationship between participating employers and plan members. Each row links an `employer_id` to a `member_id`, ensuring that the plan can support multiple employers and that a member may be associated with more than one employer over time. This join table is the operational backbone for queries that need to answer "which members belong to which employer?"

When a member reaches retirement eligibility, they submit a benefit application.

**Table `retirement_benefit_applications`**

| retirement_benefit_application_id | application_id | application_date | benefit_type | benefit_option | benefit_start_date | marital_status | spouse_consent_status | application_status | member_id | benefit_option_id | spousal_consent_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 505997 | 2022-05-16T16:24:00 | Normal | Life Annuity with 5-Year Guarantee | 2023-02-09 | Not Married | Not Required | Submitted | 10207158 | 1 | 1 |
| 101 | 1250196 | 2023-10-27T23:41:00 | Early | Contingent Annuity with 100% Survivor Benefit | 2024-07-20 | Married | Required | Under Review | 10207158 | 2 | 2 |
| 102 | 124 | 2024-03-11T06:58:00 | Deferred | Contingent Annuity with 75% Survivor Benefit | 2025-12-04 | Not Married | Obtained | Approved | 25820616 | 3 | 3 |
| 103 | IVC20det40 | 2025-08-22T13:15:00 | Normal | Contingent Annuity with 50% Survivor Benefit | 2022-05-15 | Married | Waived - Inability to Locate | Rejected | 2002007020250 | 4 | 4 |

The `retirement_benefit_applications` table records every retirement benefit application. The primary key is `retirement_benefit_application_id`, and each row references the member through `member_id`. The `application_id` column carries a separate identifier used in upstream processing. Key fields include `application_date`, `benefit_type` (Normal, Early, or Deferred), `benefit_option` (a human-readable label), `benefit_start_date`, `marital_status`, `spouse_consent_status`, and `application_status` (Submitted, Under Review, Approved, or Rejected). Application `100` for member `10207158` is a Normal benefit with a Life Annuity option, submitted on 2022-05-16 and currently in Submitted status. Application `103` for member `2002007020250` is a Normal benefit with a Contingent Annuity option, marked Rejected with the reason "Waived - Inability to Locate" for spousal consent.

The benefit options available to members are defined separately.

**Table `benefit_options`**

| id | option_id | option_name | payment_duration | has_guarantee_period | guarantee_months | survivor_benefit_percentage |
|---|---|---|---|---|---|---|
| 1 | a4e3c328-8fb9-11eb-924d-9cd76263cbd0 | Seasonal Initiative | Lifetime | true | 22 | 14.45 |
| 2 | 1204-0009-S | Integrated Model | Lifetime with Survivor | false | 31 | 17.90 |
| 3 | 9424920 | Extended Cluster D | Lifetime | true | 40 | 21.35 |
| 4 | 1186083 | Pilot Review | Lifetime with Survivor | false | 49 | 24.80 |

The `benefit_options` table enumerates the pension products that members may select. Each option has an `id`, an `option_id` (a UUID or alphanumeric code), an `option_name`, a `payment_duration` (such as "Lifetime" or "Lifetime with Survivor"), a boolean `has_guarantee_period`, the number of `guarantee_months`, and the `survivor_benefit_percentage`. Option `1` ("Seasonal Initiative") offers lifetime payments with a 22-month guarantee period and a 14.45% survivor benefit. Option `4` ("Pilot Review") provides lifetime-with-survivor payments, no guarantee period, and a 24.80% survivor benefit. The `id` column is referenced by `benefit_option_id` in the applications and beneficiaries tables.

Members designate beneficiaries to receive survivor benefits.

**Table `beneficiaries`**

| id | beneficiary_id | full_name | relationship | ssn | date_of_birth | address | telephone | email_address | beneficiary_type | member_id | benefit_option_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 325448 | Theodore Mcgrath | baseline-relation-67 | legacy-ssn-43 | 2025-04-02 | distributed-address-72 | adaptive-telephon-23 | primary-email-70 | Primary | 10207158 | 1 |
| 101 | 7731875 | Account Name | pilot-relation-68 | compact-ssn-44 | 2022-09-13 | baseline-address-73 | distributed-telephon-24 | adaptive-email-71 | Secondary | 10207158 | 2 |
| 102 | 4447008 | Saipan International Airport | extended-relation-69 | composite-ssn-45 | 2023-02-24 | pilot-address-74 | baseline-telephon-25 | distributed-email-72 | Primary | 25820616 | 3 |
| 103 | 39800616 | Norma Fisher | integrated-relation-70 | primary-ssn-46 | 2024-07-08 | extended-address-75 | pilot-telephon-26 | baseline-email-73 | Secondary | 2002007020250 | 4 |

The `beneficiaries` table stores one row per beneficiary designation. Each row includes the beneficiary's `id`, `beneficiary_id`, `full_name`, `relationship`, SSN, date of birth, contact information, and `beneficiary_type` (Primary or Secondary). The `member_id` column links the beneficiary to the plan member, and `benefit_option_id` ties the designation to a specific benefit option. Beneficiary `100` (Theodore Mcgrath) is designated as Primary for member `10207158` under benefit option `1`, while beneficiary `101` (Account Name) is Secondary for the same member under option `2`.

When a member is married, spousal consent may be required.

**Table `spousal_consents`**

| spousal_consent_id | consent_id | consent_date | spouse_ssn | notary_name | notary_commission_expiry | witnessed_by_plan_rep | retirement_benefit_application_id | member_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | 2023-10-03T09:15:00 | distributed-spouse-54 | Extended Review | 2025-08-07 | false | 100 | 10207158 |
| 2 | 790462 | 2024-03-14T16:32:00 | baseline-spouse-55 | Pilot Initiative A | 2022-01-18 | true | 101 | 10207158 |
| 3 | 4277037 | 2025-08-25T23:49:00 | pilot-spouse-56 | Baseline Model | 2023-06-02 | false | 102 | 25820616 |
| 4 | 3990176 | 2022-01-09T06:06:00 | extended-spouse-57 | Distributed Cluster | 2024-11-13 | true | 103 | 2002007020250 |

The `spousal_consents` table captures consent documentation for married members. Each row is keyed by `spousal_consent_id` and includes a `consent_id`, the `consent_date`, the spouse's SSN, the `notary_name`, the notary's commission expiry date, a flag `witnessed_by_plan_rep` indicating whether a plan representative witnessed the consent, and the associated `retirement_benefit_application_id` and `member_id`. Consent `1` for member `10207158` was dated 2023-10-03, notarized by "Extended Review," and was not witnessed by a plan representative. Consent `2` for the same member was dated 2024-03-14, notarized by "Pilot Initiative A," and was witnessed by a plan representative.

The plan also maintains explicit join tables to track the associations between members and their applications, beneficiaries, and benefit options.

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

The `members_applications` table records the link between a `member_id` and an `application_id`. This join table ensures that the system can track which applications belong to which members, supporting the one-to-many relationship where a single member may submit multiple applications over time.

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

The `members_beneficiaries` table links a `member_id` to a `beneficiary_id`, capturing the designation relationship. A member may have multiple beneficiaries, and each beneficiary is associated with exactly one member.

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

The `options_applications` table connects a `benefit_option_id` to an `application_id`, recording which benefit option was selected for each application. This supports the one-to-many relationship where a single benefit option may be selected across multiple applications.

With the base tables and join tables in place, the system provides a set of analytical views that join these records into coherent, queryable structures. Each view answers a specific operational question by bringing together related data.

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

This view joins `retirement_plan_members` with `retirement_benefit_applications` to produce a detailed record of each member's benefit applications. It answers the question: "What benefit applications has this member submitted, and what are the current statuses?" A row for member `10207158` would show application `100` (Normal, Life Annuity with 5-Year Guarantee, Submitted) and application `101` (Early, Contingent Annuity with 100% Survivor Benefit, Under Review), allowing a plan administrator to see the full application history for a single member at a glance.

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

This view joins `retirement_plan_members` with `beneficiaries` to present each member's beneficiary designations. It answers: "Who are the beneficiaries for this member, and what is their relationship and type?" For member `10207158`, the view would surface beneficiary `100` (Theodore Mcgrath, Primary) and beneficiary `101` (Account Name, Secondary), giving the administrator a complete picture of who stands to receive benefits.

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

This self-referencing view on `retirement_plan_members` produces a detailed roster of all plan members. It answers: "Who is enrolled in the plan, and what are their demographic and contact details?" Each row in the view corresponds to a member record, enriched with all identifying and contact fields, enabling bulk queries for member lookups, demographic reporting, and communication campaigns.

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

This view joins `retirement_plan_members` with `participating_employers` to show which employer sponsors each member. It answers: "Which employer is responsible for this member's plan participation?" A row for member `10207158` would display employer `1` ("Air Products & Chemicals Inc"), while a row for member `25820616` would display employer `3` ("Intl. Business Machines"). This view is essential for employer-level reporting and compliance audits.

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

This view joins `retirement_benefit_applications` with `retirement_plan_members` to produce an application-centric detail record. It answers: "For this application, who is the member, and what are their personal details?" A row for application `102` would show member `25820616` (Saipan International Airport), the application date of 2024-03-11, the Deferred benefit type, and the Contingent Annuity with 75% Survivor Benefit option. This view is the primary tool for processing applications, as it brings together the application data with the member's identity.

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

This view joins `retirement_benefit_applications` with `benefit_options` to attach the structured benefit option details to each application. It answers: "What are the precise terms of the benefit option selected for this application?" A row for application `100` would show benefit option `1` (Seasonal Initiative, Lifetime payments, 22-month guarantee, 14.45% survivor benefit). This view is critical for actuaries and plan administrators who need to evaluate the financial terms of each application.

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

This view joins `retirement_benefit_applications` with `spousal_consents` to surface the spousal consent status alongside each application. It answers: "Has spousal consent been obtained, waived, or is it not required for this application?" A row for application `101` would show spousal consent `2`, with a consent date of 2024-03-14 and a notary of "Pilot Initiative A." This view is essential for compliance checks, as applications with a "Required" consent status cannot be approved without a corresponding consent record.

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

This view joins `benefit_options` with `retirement_benefit_applications` to produce an option-centric detail record. It answers: "Which applications have selected this benefit option, and what are their statuses?" A row for benefit option `3` (Extended Cluster D) would show application `102` (Deferred, Approved), allowing the plan to analyze the uptake of a particular option across all applications.

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

This view joins `beneficiaries` with `retirement_plan_members` to present each beneficiary alongside their sponsoring member's details. It answers: "Which member does this beneficiary belong to, and what are the member's personal details?" A row for beneficiary `102` (Saipan International Airport) would show member `25820616`, providing the full context needed for beneficiary verification and communication.

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

This view joins `beneficiaries` with `benefit_options` to link each beneficiary designation to the benefit option under which it was designated. It answers: "For which benefit option is this beneficiary designated?" A row for beneficiary `103` (Norma Fisher) would show benefit option `4` (Pilot Review), enabling the plan to verify that beneficiary designations are consistent with the selected benefit structure.

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

This view joins `spousal_consents` with `retirement_benefit_applications` to produce a consent-centric detail record. It answers: "Which application does this consent belong to, and what are the application's details?" A row for consent `3` would show application `102` (Deferred, Contingent Annuity with 75% Survivor Benefit, Approved), allowing the plan to audit the consent-to-application chain.

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

This view joins `spousal_consents` with `retirement_plan_members` to present each consent alongside the member's details. It answers: "Which member provided this spousal consent, and what are their personal details?" A row for consent `4` would show member `2002007020250` (Norma Fisher), providing the full context for consent verification.

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

This view joins `participating_employers` with `retirement_plan_members` to produce an employer-centric roster of all members. It answers: "Which members are enrolled under this employer, and what are their details?" A row for employer `1` ("Air Products & Chemicals Inc") would show member `10207158` (Theodore Mcgrath), enabling employer-level enrollment reporting and compliance documentation.

The retirement plan data model is built on a small set of well-defined entities and the relationships that connect them. Members are enrolled by participating employers, select from a menu of benefit options, and submit applications that are evaluated against eligibility rules including spousal consent requirements. Beneficiaries are designated to receive survivor benefits, and every relationship is captured in explicit join tables that support both transactional processing and analytical reporting. The views described above synthesize these records into coherent, question-driven structures that plan administrators, compliance officers, and actuaries rely on to manage the plan day to day. Understanding the entities, their columns, and the joins that bind them is the foundation of effective retirement plan administration.