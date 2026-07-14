## Regulatory Licensing and Oversight: A Practitioner's Reference

The regulatory licensing ecosystem governs how service providers enter, operate within, and remain accountable to oversight bodies. At its core, the system tracks applications submitted by organizations seeking authorization, maps those applications to the fee structures imposed by regulatory authorities, and enforces compliance requirements that vary by jurisdiction. Practitioners must understand not only the individual records but also the relationships that bind providers to authorities, fees to applications, and custodian accounts to corporate entities. This chapter walks through the data model as it exists in practice, using concrete records to illustrate how each component functions and how joined views surface the operational picture.

The foundation of the system is the set of base tables that capture the primary entities and their direct attributes. These tables store the raw records that feed every analytical view.

**Table `license_applications`**

| license_application_id | application_id | submission_date | status | regulatory_reference | service_provider_id | regulatory_authority_id | fee_schedule_id |
|---|---|---|---|---|---|---|---|
| 1000 | 505997 | 2025-04-24T03:57:00 | submitted | adaptive-regulato-89 | 1000 | 1 | 1 |
| 1001 | 1250196 | 2022-09-08T10:14:00 | under_review | distributed-regulato-90 | 1001 | 2 | 2 |
| 1002 | 124 | 2023-02-19T17:31:00 | approved | baseline-regulato-91 | 1002 | 3 | 3 |
| 1003 | IVC20det40 | 2024-07-03T00:48:00 | rejected | pilot-regulato-92 | 1003 | 4 | 4 |

The `license_applications` table is the central event log of the licensing process. Each row represents a single application, identified by a surrogate `license_application_id` and a human-readable `application_id` such as `505997` or the alphanumeric `IVC20det40`. The `submission_date` anchors the application in time, ranging from `2022-09-08` to `2025-04-24` in the current dataset. The `status` column tracks the lifecycle stage — `submitted`, `under_review`, `approved`, or `rejected` — and the `regulatory_reference` field provides a domain-specific code like `adaptive-regulato-89` or `pilot-regulato-92`. Critically, each application row carries three foreign keys: `service_provider_id`, `regulatory_authority_id`, and `fee_schedule_id`, which link the application to the applicant, the overseeing body, and the applicable fee structure. These links are the backbone of the entire system.

**Table `service_providers`**

| service_provider_id | legal_name | incorporation_date | shareholding_structure | compliance_status | account_number |
|---|---|---|---|---|---|
| 1000 | Adaptive Model | 2025-08-22 | legacy-sharehol-73 | compliant | ACC-2253 |
| 1001 | Primary Cluster | 2022-01-06 | compact-sharehol-74 | non_compliant | ACC-2256 |
| 1002 | Composite Review D | 2023-06-17 | composite-sharehol-75 | under_review | ACC-2259 |
| 1003 | Compact Initiative | 2024-11-01 | primary-sharehol-76 | compliant | ACC-2262 |

Service providers are the organizations seeking authorization. The `service_providers` table records each entity's `legal_name` — for example, "Adaptive Model" or "Compact Initiative" — along with its `incorporation_date`, `shareholding_structure`, `compliance_status`, and `account_number`. The `compliance_status` field mirrors the application lifecycle, taking values such as `compliant`, `non_compliant`, or `under_review`. The `account_number` column (e.g., `ACC-2253`) ties the provider to its custodian account, a relationship explored in later sections. The `shareholding_structure` values like `legacy-sharehol-73` and `compact-sharehol-74` encode the ownership model, which may influence regulatory scrutiny.

**Table `fee_schedules`**

| id | application_fee | initial_license_fee | annual_renewal_fee | currency | regulatory_authority_id |
|---|---|---|---|---|---|
| 1 | 43.25 | 29.99 | 11.94 | seasonal-currency-71 | 1 |
| 2 | 43.25 | 14.31 | 27.32 | regional-currency-72 | 2 |
| 3 | 11.88 | 34.08 | 19.95 | legacy-currency-73 | 3 |
| 4 | 30.51 | 32.21 | 16.11 | compact-currency-74 | 4 |

Fee schedules define the financial obligations associated with licensing. The `fee_schedules` table stores the `application_fee`, `initial_license_fee`, and `annual_renewal_fee` as decimal amounts, alongside a `currency` identifier such as `seasonal-currency-71` or `regional-currency-72`. Each schedule is tied to a specific `regulatory_authority_id`, meaning that the authority determines the fee structure. In the current data, application fees range from `11.88` to `43.25`, while initial license fees span from `14.31` to `34.08`. The `regulatory_authority_id` foreign key ensures that every fee schedule is attributable to a single oversight body.

**Table `custodian_accounts`**

| account_number | minimum_capital_requirement | asset_liquidity_status | bank_identifier | service_provider_id |
|---|---|---|---|---|
| ACC-2253 | 17.70 | false | BAN-2796 | 1000 |
| ACC-2256 | 22.40 | true | BAN-2798 | 1001 |
| ACC-2259 | 27.10 | false | BAN-2800 | 1002 |
| ACC-2262 | 31.80 | true | BAN-2802 | 1003 |

Custodian accounts represent the financial infrastructure supporting service providers. The `custodian_accounts` table links an `account_number` (e.g., `ACC-2253`) to a `minimum_capital_requirement` (ranging from `17.70` to `31.80`), an `asset_liquidity_status` flag (`true` or `false`), a `bank_identifier` such as `BAN-2796`, and the `service_provider_id` of the owning entity. The liquidity flag and capital requirement together indicate the financial health threshold that a provider must maintain to remain in good standing.

**Table `regulatory_authorities`**

| id | authority_name | website_url | effective_date | oversight_scope |
|---|---|---|---|---|
| 1 | Sean Green | https://github.com/chiphuyen/lazynlp | 2023-02-14 | distributed-oversigh-24 |
| 2 | Elizabeth Woods | https://bugs.launchpad.net/ironic/+bug/1346406 | 2024-07-25 | baseline-oversigh-25 |
| 3 | Kimberly Smith | http://en.wikipedia.org/wiki/Hyla_femoralis | 2025-12-09 | pilot-oversigh-26 |
| 4 | Kimberly Smith | https://www.nature.com/articles/nphoton.2014.41 | 2022-05-20 | extended-oversigh-27 |

Regulatory authorities are the oversight bodies that administer licensing and enforcement. The `regulatory_authorities` table records the `authority_name` (e.g., "Sean Green" or "Elizabeth Woods"), a `website_url`, an `effective_date` marking when the authority's jurisdiction became active, and an `oversight_scope` code such as `distributed-oversigh-24` or `pilot-oversigh-26`. The `effective_date` values span from `2022-05-20` to `2025-12-09`, reflecting the staggered establishment of oversight bodies.

**Table `compliance_requirements`**

| requirement_id | category | legal_reference | is_mandatory | regulatory_authority_id |
|---|---|---|---|---|
| 778568 | AML_CFT | composite-legal-63 | true | 1 |
| lu_tax_code_template_b_VB-EC-0 | financial_integrity | primary-legal-64 | false | 2 |
| 99901 | IT_security | adaptive-legal-65 | true | 3 |
| 5917277 | accounting_standards | distributed-legal-66 | false | 4 |

Compliance requirements encode the rules that service providers must satisfy. The `compliance_requirements` table stores a `requirement_id`, a `category` (such as `AML_CFT`, `financial_integrity`, `IT_security`, or `accounting_standards`), a `legal_reference` code, an `is_mandatory` boolean, and the `regulatory_authority_id` that promulgated the requirement. Mandatory requirements (`is_mandatory = true`) include `AML_CFT` under authority `1` and `IT_security` under authority `3`, while non-mandatory items like `financial_integrity` under authority `2` serve as advisory benchmarks.

Beyond the primary entity tables, the system includes junction tables that capture the many-to-many relationships between applications and the entities that interact with them. These tables record which providers, fee schedules, and authorities have engaged with which applications.

**Table `providers_applications`**

| service_provider_id | license_application_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

**Table `schedules_applications`**

| fee_schedule_id | license_application_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `authorities_applications`**

| regulatory_authority_id | license_application_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `authorities_requirements`**

| regulatory_authority_id | requirement_id |
|---|---|
| 1 | 778568 |
| 1 | lu_tax_code_template_b_VB-EC-0 |
| 2 | lu_tax_code_template_b_VB-EC-0 |
| 2 | 99901 |
| 3 | 99901 |
| 3 | 5917277 |
| 4 | 5917277 |
| 4 | 778568 |

**Table `requirements_providers`**

| requirement_id | service_provider_id |
|---|---|
| 778568 | 1000 |
| 778568 | 1001 |
| lu_tax_code_template_b_VB-EC-0 | 1001 |
| lu_tax_code_template_b_VB-EC-0 | 1002 |
| 99901 | 1002 |
| 99901 | 1003 |
| 5917277 | 1003 |
| 5917277 | 1000 |

These junction tables enable flexible association patterns. A single application may be linked to multiple providers, fee schedules, or authorities, and conversely, a provider or authority may appear across many applications. The `requirements_providers` table specifically tracks which compliance requirements apply to which service providers, independent of any single application.

The true analytical power of the system emerges in the joined views, which combine base tables and junction tables to answer specific operational questions. Each view is designed to surface a particular facet of the licensing ecosystem.

**View `v_license_application_service_provider`**

```sql
CREATE VIEW v_license_application_service_provider AS
SELECT a.license_application_id, a.application_id, a.submission_date, a.status, b.service_provider_id AS provider_service_provider_id, b.legal_name AS provider_legal_name, b.incorporation_date AS provider_incorporation_date
FROM license_applications a JOIN service_providers b ON a.service_provider_id = b.service_provider_id;
```

| license_application_id | application_id | submission_date | status | provider_service_provider_id | provider_legal_name | provider_incorporation_date |
|---|---|---|---|---|---|---|
| 1000 | 505997 | 2025-04-24T03:57:00 | submitted | 1000 | Adaptive Model | 2025-08-22 |
| 1001 | 1250196 | 2022-09-08T10:14:00 | under_review | 1001 | Primary Cluster | 2022-01-06 |
| 1002 | 124 | 2023-02-19T17:31:00 | approved | 1002 | Composite Review D | 2023-06-17 |
| 1003 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 1003 | Compact Initiative | 2024-11-01 |

The view `v_license_application_service_provider` joins license applications with their corresponding service providers, answering the question: which organization submitted which application, and what is that organization's current compliance standing? Reading the row for `license_application_id` `1000`, we see that "Adaptive Model" (provider `1000`) submitted application `505997` on `2025-04-24` with status `submitted`, and the provider itself holds a `compliant` status. In contrast, provider `1001` ("Primary Cluster") submitted application `1250196` on `2022-09-08`, which is `under_review`, while the provider's own `compliance_status` is `non_compliant` — a potential red flag for regulators.

**View `v_license_application_regulatory_authority`**

```sql
CREATE VIEW v_license_application_regulatory_authority AS
SELECT a.license_application_id, a.application_id, a.submission_date, a.status, b.id AS authority_id, b.authority_name AS authority_authority_name, b.website_url AS authority_website_url
FROM license_applications a JOIN regulatory_authorities b ON a.regulatory_authority_id = b.id;
```

| license_application_id | application_id | submission_date | status | authority_id | authority_authority_name | authority_website_url |
|---|---|---|---|---|---|---|
| 1000 | 505997 | 2025-04-24T03:57:00 | submitted | 1 | Sean Green | https://github.com/chiphuyen/lazynlp |
| 1001 | 1250196 | 2022-09-08T10:14:00 | under_review | 2 | Elizabeth Woods | https://bugs.launchpad.net/ironic/+bug/1346406 |
| 1002 | 124 | 2023-02-19T17:31:00 | approved | 3 | Kimberly Smith | http://en.wikipedia.org/wiki/Hyla_femoralis |
| 1003 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 4 | Kimberly Smith | https://www.nature.com/articles/nphoton.2014.41 |

The view `v_license_application_regulatory_authority` links applications to their overseeing regulatory authorities, answering: which authority is responsible for processing or reviewing this application? For `license_application_id` `1000`, the overseeing authority is `1` ("Sean Green"), with an oversight scope of `distributed-oversigh-24`. Application `1003` falls under authority `4` ("Kimberly Smith"), whose oversight scope is `extended-oversigh-27`. This view allows practitioners to trace the chain of regulatory responsibility for any given application.

**View `v_license_application_fee_schedule`**

```sql
CREATE VIEW v_license_application_fee_schedule AS
SELECT a.license_application_id, a.application_id, a.submission_date, a.status, b.id AS schedule_id, b.application_fee AS schedule_application_fee, b.initial_license_fee AS schedule_initial_license_fee
FROM license_applications a JOIN fee_schedules b ON a.fee_schedule_id = b.id;
```

| license_application_id | application_id | submission_date | status | schedule_id | schedule_application_fee | schedule_initial_license_fee |
|---|---|---|---|---|---|---|
| 1000 | 505997 | 2025-04-24T03:57:00 | submitted | 1 | 43.25 | 29.99 |
| 1001 | 1250196 | 2022-09-08T10:14:00 | under_review | 2 | 43.25 | 14.31 |
| 1002 | 124 | 2023-02-19T17:31:00 | approved | 3 | 11.88 | 34.08 |
| 1003 | IVC20det40 | 2024-07-03T00:48:00 | rejected | 4 | 30.51 | 32.21 |

The view `v_license_application_fee_schedule` associates applications with their applicable fee schedules, answering: what are the financial obligations for this application? Application `1000` is tied to fee schedule `1`, which imposes an application fee of `43.25`, an initial license fee of `29.99`, and an annual renewal fee of `11.94` in `seasonal-currency-71`. Application `1002` maps to fee schedule `3`, with an application fee of `11.88`, an initial license fee of `34.08`, and an annual renewal fee of `19.95` in `legacy-currency-73`. The variation in fee amounts across schedules reflects the differing financial policies of the overseeing authorities.

**View `v_service_provider_license_application_detail`**

```sql
CREATE VIEW v_service_provider_license_application_detail AS
SELECT a.service_provider_id, a.legal_name, a.incorporation_date, b.license_application_id AS application_license_application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM service_providers a
  JOIN providers_applications j ON j.service_provider_id = a.service_provider_id
  JOIN license_applications b ON b.license_application_id = j.license_application_id;
```

| service_provider_id | legal_name | incorporation_date | application_license_application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|
| 1000 | Adaptive Model | 2025-08-22 | 1000 | 505997 | 2025-04-24T03:57:00 |
| 1000 | Adaptive Model | 2025-08-22 | 1001 | 1250196 | 2022-09-08T10:14:00 |
| 1001 | Primary Cluster | 2022-01-06 | 1001 | 1250196 | 2022-09-08T10:14:00 |
| 1001 | Primary Cluster | 2022-01-06 | 1002 | 124 | 2023-02-19T17:31:00 |
| 1002 | Composite Review D | 2023-06-17 | 1002 | 124 | 2023-02-19T17:31:00 |
| 1002 | Composite Review D | 2023-06-17 | 1003 | IVC20det40 | 2024-07-03T00:48:00 |
| 1003 | Compact Initiative | 2024-11-01 | 1003 | IVC20det40 | 2024-07-03T00:48:00 |
| 1003 | Compact Initiative | 2024-11-01 | 1000 | 505997 | 2025-04-24T03:57:00 |

The view `v_service_provider_license_application_detail` provides a provider-centric perspective by joining service providers with all their submitted applications. This view answers: what is the complete application history for a given provider? For provider `1000` ("Adaptive Model"), the detail view surfaces application `1000` with status `submitted` and regulatory reference `adaptive-regulato-89`. Provider `1002` ("Composite Review D") has application `1002` with status `approved` and reference `baseline-regulato-91`, indicating a successful licensing outcome.

**View `v_service_provider_custodian_account`**

```sql
CREATE VIEW v_service_provider_custodian_account AS
SELECT a.service_provider_id, a.legal_name, a.incorporation_date, a.shareholding_structure, b.account_number AS account_account_number, b.minimum_capital_requirement AS account_minimum_capital_requirement, b.asset_liquidity_status AS account_asset_liquidity_status
FROM service_providers a JOIN custodian_accounts b ON a.account_number = b.account_number;
```

| service_provider_id | legal_name | incorporation_date | shareholding_structure | account_account_number | account_minimum_capital_requirement | account_asset_liquidity_status |
|---|---|---|---|---|---|---|
| 1000 | Adaptive Model | 2025-08-22 | legacy-sharehol-73 | ACC-2253 | 17.70 | false |
| 1001 | Primary Cluster | 2022-01-06 | compact-sharehol-74 | ACC-2256 | 22.40 | true |
| 1002 | Composite Review D | 2023-06-17 | composite-sharehol-75 | ACC-2259 | 27.10 | false |
| 1003 | Compact Initiative | 2024-11-01 | primary-sharehol-76 | ACC-2262 | 31.80 | true |

The view `v_service_provider_custodian_account` joins service providers with their custodian accounts, answering: what are the financial parameters of a provider's custodial arrangement? Provider `1000` ("Adaptive Model") holds account `ACC-2253` with a minimum capital requirement of `17.70`, a liquidity status of `false`, and bank identifier `BAN-2796`. Provider `1003` ("Compact Initiative") holds account `ACC-2262` with a higher minimum capital requirement of `31.80`, a liquidity status of `true`, and bank identifier `BAN-2802`. The liquidity flag and capital threshold together form a risk profile for each provider.

**View `v_fee_schedule_license_application_detail`**

```sql
CREATE VIEW v_fee_schedule_license_application_detail AS
SELECT a.id, a.application_fee, a.initial_license_fee, b.license_application_id AS application_license_application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM fee_schedules a
  JOIN schedules_applications j ON j.fee_schedule_id = a.id
  JOIN license_applications b ON b.license_application_id = j.license_application_id;
```

| id | application_fee | initial_license_fee | application_license_application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|
| 1 | 43.25 | 29.99 | 1000 | 505997 | 2025-04-24T03:57:00 |
| 1 | 43.25 | 29.99 | 1001 | 1250196 | 2022-09-08T10:14:00 |
| 2 | 43.25 | 14.31 | 1001 | 1250196 | 2022-09-08T10:14:00 |
| 2 | 43.25 | 14.31 | 1002 | 124 | 2023-02-19T17:31:00 |
| 3 | 11.88 | 34.08 | 1002 | 124 | 2023-02-19T17:31:00 |
| 3 | 11.88 | 34.08 | 1003 | IVC20det40 | 2024-07-03T00:48:00 |
| 4 | 30.51 | 32.21 | 1003 | IVC20det40 | 2024-07-03T00:48:00 |
| 4 | 30.51 | 32.21 | 1000 | 505997 | 2025-04-24T03:57:00 |

The view `v_fee_schedule_license_application_detail` connects fee schedules to the applications they govern, answering: which applications are subject to a given fee schedule? Fee schedule `1` (application fee `43.25`, initial license fee `29.99`) applies to application `1000` with status `submitted`. Fee schedule `4` (application fee `30.51`, initial license fee `32.21`) applies to application `1003` with status `rejected`. This view is particularly useful for financial reconciliation and audit purposes.

**View `v_fee_schedule_regulatory_authority`**

```sql
CREATE VIEW v_fee_schedule_regulatory_authority AS
SELECT a.id, a.application_fee, a.initial_license_fee, a.annual_renewal_fee, b.id AS authority_id, b.authority_name AS authority_authority_name, b.website_url AS authority_website_url
FROM fee_schedules a JOIN regulatory_authorities b ON a.regulatory_authority_id = b.id;
```

| id | application_fee | initial_license_fee | annual_renewal_fee | authority_id | authority_authority_name | authority_website_url |
|---|---|---|---|---|---|---|
| 1 | 43.25 | 29.99 | 11.94 | 1 | Sean Green | https://github.com/chiphuyen/lazynlp |
| 2 | 43.25 | 14.31 | 27.32 | 2 | Elizabeth Woods | https://bugs.launchpad.net/ironic/+bug/1346406 |
| 3 | 11.88 | 34.08 | 19.95 | 3 | Kimberly Smith | http://en.wikipedia.org/wiki/Hyla_femoralis |
| 4 | 30.51 | 32.21 | 16.11 | 4 | Kimberly Smith | https://www.nature.com/articles/nphoton.2014.41 |

The view `v_fee_schedule_regulatory_authority` links fee schedules to their originating regulatory authorities, answering: which authority established each fee schedule? Fee schedule `1` originates from authority `1` ("Sean Green"), while fee schedule `4` originates from authority `4` ("Kimberly Smith"). This view confirms the one-to-many relationship between authorities and fee schedules, as each authority can define multiple schedules.

**View `v_custodian_account_service_provider`**

```sql
CREATE VIEW v_custodian_account_service_provider AS
SELECT a.account_number, a.minimum_capital_requirement, a.asset_liquidity_status, a.bank_identifier, b.service_provider_id AS provider_service_provider_id, b.legal_name AS provider_legal_name, b.incorporation_date AS provider_incorporation_date
FROM custodian_accounts a JOIN service_providers b ON a.service_provider_id = b.service_provider_id;
```

| account_number | minimum_capital_requirement | asset_liquidity_status | bank_identifier | provider_service_provider_id | provider_legal_name | provider_incorporation_date |
|---|---|---|---|---|---|---|
| ACC-2253 | 17.70 | false | BAN-2796 | 1000 | Adaptive Model | 2025-08-22 |
| ACC-2256 | 22.40 | true | BAN-2798 | 1001 | Primary Cluster | 2022-01-06 |
| ACC-2259 | 27.10 | false | BAN-2800 | 1002 | Composite Review D | 2023-06-17 |
| ACC-2262 | 31.80 | true | BAN-2802 | 1003 | Compact Initiative | 2024-11-01 |

The view `v_custodian_account_service_provider` presents the custodian account perspective, answering: which provider owns each account, and what are the account's financial parameters? Account `ACC-2253` is owned by provider `1000` ("Adaptive Model") with a minimum capital requirement of `17.70` and liquidity status `false`. Account `ACC-2259` is owned by provider `1002` ("Composite Review D") with a minimum capital requirement of `27.10` and liquidity status `false`. The view enables practitioners to monitor the financial health of all provider accounts in a single query.

**View `v_regulatory_authority_license_application_detail`**

```sql
CREATE VIEW v_regulatory_authority_license_application_detail AS
SELECT a.id, a.authority_name, a.website_url, b.license_application_id AS application_license_application_id, b.application_id AS application_application_id, b.submission_date AS application_submission_date
FROM regulatory_authorities a
  JOIN authorities_applications j ON j.regulatory_authority_id = a.id
  JOIN license_applications b ON b.license_application_id = j.license_application_id;
```

| id | authority_name | website_url | application_license_application_id | application_application_id | application_submission_date |
|---|---|---|---|---|---|
| 1 | Sean Green | https://github.com/chiphuyen/lazynlp | 1000 | 505997 | 2025-04-24T03:57:00 |
| 1 | Sean Green | https://github.com/chiphuyen/lazynlp | 1001 | 1250196 | 2022-09-08T10:14:00 |
| 2 | Elizabeth Woods | https://bugs.launchpad.net/ironic/+bug/1346406 | 1001 | 1250196 | 2022-09-08T10:14:00 |
| 2 | Elizabeth Woods | https://bugs.launchpad.net/ironic/+bug/1346406 | 1002 | 124 | 2023-02-19T17:31:00 |
| 3 | Kimberly Smith | http://en.wikipedia.org/wiki/Hyla_femoralis | 1002 | 124 | 2023-02-19T17:31:00 |
| 3 | Kimberly Smith | http://en.wikipedia.org/wiki/Hyla_femoralis | 1003 | IVC20det40 | 2024-07-03T00:48:00 |
| 4 | Kimberly Smith | https://www.nature.com/articles/nphoton.2014.41 | 1003 | IVC20det40 | 2024-07-03T00:48:00 |
| 4 | Kimberly Smith | https://www.nature.com/articles/nphoton.2014.41 | 1000 | 505997 | 2025-04-24T03:57:00 |

The view `v_regulatory_authority_license_application_detail` provides an authority-centric view of applications, answering: which applications fall under the jurisdiction of a given regulatory authority? Authority `1` ("Sean Green") oversees application `1000` (status `submitted`, reference `adaptive-regulato-89`). Authority `2` ("Elizabeth Woods") oversees application `1001` (status `under_review`, reference `distributed-regulato-90`). Authority `3` ("Kimberly Smith") oversees application `1002` (status `approved`, reference `baseline-regulato-91`). Authority `4` ("Kimberly Smith") oversees application `1003` (status `rejected`, reference `pilot-regulato-92`). Note that "Kimberly Smith" appears as the authority name for both authority `3` and authority `4`, suggesting either a naming convention or a shared identity across jurisdictions.

**View `v_regulatory_authority_compliance_requirement_detail`**

```sql
CREATE VIEW v_regulatory_authority_compliance_requirement_detail AS
SELECT a.id, a.authority_name, a.website_url, b.requirement_id AS requirement_requirement_id, b.category AS requirement_category, b.legal_reference AS requirement_legal_reference
FROM regulatory_authorities a
  JOIN authorities_requirements j ON j.regulatory_authority_id = a.id
  JOIN compliance_requirements b ON b.requirement_id = j.requirement_id;
```

| id | authority_name | website_url | requirement_requirement_id | requirement_category | requirement_legal_reference |
|---|---|---|---|---|---|
| 1 | Sean Green | https://github.com/chiphuyen/lazynlp | 778568 | AML_CFT | composite-legal-63 |
| 1 | Sean Green | https://github.com/chiphuyen/lazynlp | lu_tax_code_template_b_VB-EC-0 | financial_integrity | primary-legal-64 |
| 2 | Elizabeth Woods | https://bugs.launchpad.net/ironic/+bug/1346406 | lu_tax_code_template_b_VB-EC-0 | financial_integrity | primary-legal-64 |
| 2 | Elizabeth Woods | https://bugs.launchpad.net/ironic/+bug/1346406 | 99901 | IT_security | adaptive-legal-65 |
| 3 | Kimberly Smith | http://en.wikipedia.org/wiki/Hyla_femoralis | 99901 | IT_security | adaptive-legal-65 |
| 3 | Kimberly Smith | http://en.wikipedia.org/wiki/Hyla_femoralis | 5917277 | accounting_standards | distributed-legal-66 |
| 4 | Kimberly Smith | https://www.nature.com/articles/nphoton.2014.41 | 5917277 | accounting_standards | distributed-legal-66 |
| 4 | Kimberly Smith | https://www.nature.com/articles/nphoton.2014.41 | 778568 | AML_CFT | composite-legal-63 |

The view `v_regulatory_authority_compliance_requirement_detail` connects regulatory authorities to the compliance requirements they have promulgated, answering: which rules does each authority enforce? Authority `1` ("Sean Green") has established requirement `778568` in the `AML_CFT` category, which is mandatory (`is_mandatory = true`). Authority `2` ("Elizabeth Woods") has established requirement `lu_tax_code_template_b_VB-EC-0` in the `financial_integrity` category, which is non-mandatory. Authority `3` ("Kimberly Smith") has established requirement `99901` in the `IT_security` category, which is mandatory. Authority `4` ("Kimberly Smith") has established requirement `5917277` in the `accounting_standards` category, which is non-mandatory. This view is essential for compliance officers who need to identify which rules apply under which authority.

**View `v_compliance_requirement_service_provider_detail`**

```sql
CREATE VIEW v_compliance_requirement_service_provider_detail AS
SELECT a.requirement_id, a.category, a.legal_reference, b.service_provider_id AS provider_service_provider_id, b.legal_name AS provider_legal_name, b.incorporation_date AS provider_incorporation_date
FROM compliance_requirements a
  JOIN requirements_providers j ON j.requirement_id = a.requirement_id
  JOIN service_providers b ON b.service_provider_id = j.service_provider_id;
```

| requirement_id | category | legal_reference | provider_service_provider_id | provider_legal_name | provider_incorporation_date |
|---|---|---|---|---|---|
| 778568 | AML_CFT | composite-legal-63 | 1000 | Adaptive Model | 2025-08-22 |
| 778568 | AML_CFT | composite-legal-63 | 1001 | Primary Cluster | 2022-01-06 |
| lu_tax_code_template_b_VB-EC-0 | financial_integrity | primary-legal-64 | 1001 | Primary Cluster | 2022-01-06 |
| lu_tax_code_template_b_VB-EC-0 | financial_integrity | primary-legal-64 | 1002 | Composite Review D | 2023-06-17 |
| 99901 | IT_security | adaptive-legal-65 | 1002 | Composite Review D | 2023-06-17 |
| 99901 | IT_security | adaptive-legal-65 | 1003 | Compact Initiative | 2024-11-01 |
| 5917277 | accounting_standards | distributed-legal-66 | 1003 | Compact Initiative | 2024-11-01 |
| 5917277 | accounting_standards | distributed-legal-66 | 1000 | Adaptive Model | 2025-08-22 |

The view `v_compliance_requirement_service_provider_detail` links compliance requirements to the service providers they affect, answering: which providers must satisfy which requirements? This view surfaces the intersection of regulatory rules and organizational obligations, enabling practitioners to assess compliance gaps across the provider population.

**View `v_compliance_requirement_regulatory_authority`**

```sql
CREATE VIEW v_compliance_requirement_regulatory_authority AS
SELECT a.requirement_id, a.category, a.legal_reference, a.is_mandatory, b.id AS authority_id, b.authority_name AS authority_authority_name, b.website_url AS authority_website_url
FROM compliance_requirements a JOIN regulatory_authorities b ON a.regulatory_authority_id = b.id;
```

| requirement_id | category | legal_reference | is_mandatory | authority_id | authority_authority_name | authority_website_url |
|---|---|---|---|---|---|---|
| 778568 | AML_CFT | composite-legal-63 | true | 1 | Sean Green | https://github.com/chiphuyen/lazynlp |
| lu_tax_code_template_b_VB-EC-0 | financial_integrity | primary-legal-64 | false | 2 | Elizabeth Woods | https://bugs.launchpad.net/ironic/+bug/1346406 |
| 99901 | IT_security | adaptive-legal-65 | true | 3 | Kimberly Smith | http://en.wikipedia.org/wiki/Hyla_femoralis |
| 5917277 | accounting_standards | distributed-legal-66 | false | 4 | Kimberly Smith | https://www.nature.com/articles/nphoton.2014.41 |

The view `v_compliance_requirement_regulatory_authority` connects compliance requirements back to their originating regulatory authorities, answering: which authority is responsible for each requirement? This view reinforces the authority-to-requirement relationship and supports audit trails that trace any requirement to its source.

The regulatory licensing system described here operates as an interconnected network of applications, providers, authorities, fees, accounts, and compliance rules. No single table tells the complete story; the operational truth emerges only when the relationships are traversed. A practitioner examining application `1000` must understand that it was submitted by "Adaptive Model" (provider `1000`), overseen by authority `1` ("Sean Green"), subject to fee schedule `1` (with an application fee of `43.25`), and linked to custodian account `ACC-2253` (with a minimum capital requirement of `17.70`). The compliance landscape adds another layer: authority `1` mandates `AML_CFT` requirements, which may or may not apply to provider `1000` depending on the associations captured in the junction tables. The views serve as the primary interface for navigating this complexity, each one answering a specific question about the relationships that define the licensing ecosystem. Mastery of these tables and views — and the foreign keys that bind them — is essential for anyone responsible for regulatory compliance, financial oversight, or application processing within this domain.