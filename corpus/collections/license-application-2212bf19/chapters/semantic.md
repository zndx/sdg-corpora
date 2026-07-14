The financial regulatory licensing domain captures the lifecycle of service providers seeking authorization from regulatory authorities, the fee structures that govern those authorizations, and the compliance obligations that bind them. At its core, the model distinguishes between the organizations that provide services, the authorities that oversee them, the applications that request permission, the fees that monetize oversight, and the compliance requirements that ensure integrity. Each concept materializes as a table with a primary key, typed attributes, and foreign keys that encode cardinality-bounded relationships. The views then rejoin these normalized tables to answer domain questions directly.

## Core Entity Types and Their Attributes

The central fact of the domain is the license application. The `license_applications` table records each submission with a surrogate `license_application_id`, an external `application_id` (such as `505997` or the alphanumeric `IVC20det40`), a `submission_date` like `2025-04-24T03:57:00`, a `status` drawn from the set {`submitted`, `under_review`, `approved`, `rejected`}, a `regulatory_reference` string (e.g. `adaptive-regulato-89`), and three foreign keys pointing to the service provider, the regulatory authority, and the applicable fee schedule.

**Table `license_applications`**

| license_application_id | application_id | submission_date | status | regulatory_reference | service_provider_id | regulatory_authority_id | fee_schedule_id |
|---|---|---|---|---|---|---|---|
| 1000 | 505997 | 2025-04-24T03:57:00 | submitted | adaptive-regulato-89 | 1000 | 1 | 1 |
| 1001 | 1250196 | 2022-09-08T10:14:00 | under_review | distributed-regulato-90 | 1001 | 2 | 2 |
| 1002 | 124 | 2023-02-19T17:31:00 | approved | baseline-regulato-91 | 1002 | 3 | 3 |
| 1003 | IVC20det40 | 2024-07-03T00:48:00 | rejected | pilot-regulato-92 | 1003 | 4 | 4 |

A service provider is an organization seeking authorization. The `service_providers` table stores each provider's `service_provider_id`, its `legal_name` (such as `Adaptive Model` or `Compact Initiative`), its `incorporation_date`, a `shareholding_structure` category (e.g. `legacy-sharehol-73`), a `compliance_status` (one of `compliant`, `non_compliant`, or `under_review`), and an `account_number` like `ACC-2253`.

**Table `service_providers`**

| service_provider_id | legal_name | incorporation_date | shareholding_structure | compliance_status | account_number |
|---|---|---|---|---|---|
| 1000 | Adaptive Model | 2025-08-22 | legacy-sharehol-73 | compliant | ACC-2253 |
| 1001 | Primary Cluster | 2022-01-06 | compact-sharehol-74 | non_compliant | ACC-2256 |
| 1002 | Composite Review D | 2023-06-17 | composite-sharehol-75 | under_review | ACC-2259 |
| 1003 | Compact Initiative | 2024-11-01 | primary-sharehol-76 | compliant | ACC-2262 |

Fee schedules define the monetary obligations tied to a regulatory authority. The `fee_schedules` table holds an `id`, an `application_fee` (e.g. `43.25`), an `initial_license_fee` (e.g. `29.99`), an `annual_renewal_fee` (e.g. `11.94`), a `currency` code (such as `seasonal-currency-71`), and a `regulatory_authority_id` foreign key.

**Table `fee_schedules`**

| id | application_fee | initial_license_fee | annual_renewal_fee | currency | regulatory_authority_id |
|---|---|---|---|---|---|
| 1 | 43.25 | 29.99 | 11.94 | seasonal-currency-71 | 1 |
| 2 | 43.25 | 14.31 | 27.32 | regional-currency-72 | 2 |
| 3 | 11.88 | 34.08 | 19.95 | legacy-currency-73 | 3 |
| 4 | 30.51 | 32.21 | 16.11 | compact-currency-74 | 4 |

Custodian accounts are bank-level accounts linked to service providers. The `custodian_accounts` table records an `account_number` (e.g. `ACC-2253`), a `minimum_capital_requirement` (e.g. `17.70`), an `asset_liquidity_status` boolean (`true` or `false`), a `bank_identifier` (e.g. `BAN-2796`), and a `service_provider_id` foreign key.

**Table `custodian_accounts`**

| account_number | minimum_capital_requirement | asset_liquidity_status | bank_identifier | service_provider_id |
|---|---|---|---|---|
| ACC-2253 | 17.70 | false | BAN-2796 | 1000 |
| ACC-2256 | 22.40 | true | BAN-2798 | 1001 |
| ACC-2259 | 27.10 | false | BAN-2800 | 1002 |
| ACC-2262 | 31.80 | true | BAN-2802 | 1003 |

Regulatory authorities are the oversight bodies. The `regulatory_authorities` table stores an `id`, an `authority_name` (e.g. `Sean Green` or `Elizabeth Woods`), a `website_url`, an `effective_date` (e.g. `2023-02-14`), and an `oversight_scope` category (e.g. `distributed-oversigh-24`).

**Table `regulatory_authorities`**

| id | authority_name | website_url | effective_date | oversight_scope |
|---|---|---|---|---|
| 1 | Sean Green | https://github.com/chiphuyen/lazynlp | 2023-02-14 | distributed-oversigh-24 |
| 2 | Elizabeth Woods | https://bugs.launchpad.net/ironic/+bug/1346406 | 2024-07-25 | baseline-oversigh-25 |
| 3 | Kimberly Smith | http://en.wikipedia.org/wiki/Hyla_femoralis | 2025-12-09 | pilot-oversigh-26 |
| 4 | Kimberly Smith | https://www.nature.com/articles/nphoton.2014.41 | 2022-05-20 | extended-oversigh-27 |

Compliance requirements are the rules that authorities impose. The `compliance_requirements` table holds a `requirement_id` (e.g. `778568` or the template-style `lu_tax_code_template_b_VB-EC-0`), a `category` (one of `AML_CFT`, `financial_integrity`, `IT_security`, or `accounting_standards`), a `legal_reference` string (e.g. `composite-legal-63`), an `is_mandatory` boolean, and a `regulatory_authority_id` foreign key.

**Table `compliance_requirements`**

| requirement_id | category | legal_reference | is_mandatory | regulatory_authority_id |
|---|---|---|---|---|
| 778568 | AML_CFT | composite-legal-63 | true | 1 |
| lu_tax_code_template_b_VB-EC-0 | financial_integrity | primary-legal-64 | false | 2 |
| 99901 | IT_security | adaptive-legal-65 | true | 3 |
| 5917277 | accounting_standards | distributed-legal-66 | false | 4 |

## Junction and Association Tables

Beyond the six core entities, the model includes five junction tables that capture many-to-many relationships between entities. The `providers_applications` table links service providers to license applications. The `schedules_applications` table links fee schedules to license applications. The `authorities_applications` table links regulatory authorities to license applications. The `authorities_requirements` table links regulatory authorities to compliance requirements. The `requirements_providers` table links compliance requirements to service providers.

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

These junction tables normalize relationships that would otherwise require repeating groups. For example, a single service provider may appear in multiple license applications, and a single license application may reference multiple compliance requirements through the `requirements_providers` junction. The foreign keys in these tables reference the primary keys of the core tables, ensuring referential integrity across the many-to-many associations.

## View Reconstructions: From Normalized Tables to Domain Facts

The views rejoin the normalized tables to answer specific domain questions. Each view's `SELECT` reconstructs a fact by joining the relevant tables on their foreign keys, producing a denormalized result set that reads like a business report.

### Application-to-Provider and Application-to-Authority Views

The view `v_license_application_service_provider` joins `license_applications` to `service_providers` on `service_provider_id`, producing rows that pair each application with its provider's legal name and compliance status. Reading the first row: application `505997` (status `submitted`) belongs to `Adaptive Model`, which holds `compliant` status. This view answers the question "which provider submitted which application, and what is that provider's standing?"

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

The view `v_license_application_regulatory_authority` joins `license_applications` to `regulatory_authorities` on `regulatory_authority_id`, pairing each application with the overseeing authority's name and oversight scope. The first row shows application `505997` overseen by `Sean Green` with scope `distributed-oversigh-24`. This view answers "which authority governs each application?"

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

### Application-to-Fee-Schedule View

The view `v_license_application_fee_schedule` joins `license_applications` to `fee_schedules` on `fee_schedule_id`, attaching the fee amounts and currency to each application. The first row reveals that application `505997` carries an application fee of `43.25`, an initial license fee of `29.99`, and an annual renewal fee of `11.94` in `seasonal-currency-71`. This view answers "what are the financial obligations for each application?"

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

### Provider-Centric Detail Views

The view `v_service_provider_license_application_detail` joins `service_providers` to `license_applications` on `service_provider_id`, producing one row per application per provider. The first row shows `Adaptive Model` (incorporated `2025-08-22`, compliance status `compliant`) with application `505997` submitted on `2025-04-24T03:57:00` and status `submitted`. This view answers "what applications has each provider filed, and what are their statuses?"

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

The view `v_service_provider_custodian_account` joins `service_providers` to `custodian_accounts` on `service_provider_id`, pairing each provider with its custodian account details. The first row shows `Adaptive Model` linked to account `ACC-2253`, which has a minimum capital requirement of `17.70`, a bank identifier of `BAN-2796`, and `asset_liquidity_status` set to `false`. This view answers "which custodian account belongs to which provider, and what are its capital and liquidity parameters?"

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

### Fee Schedule-Centric Views

The view `v_fee_schedule_license_application_detail` joins `fee_schedules` to `license_applications` on `fee_schedule_id`, producing rows that show which applications are governed by which fee schedule. The first row shows fee schedule `1` (application fee `43.25`, currency `seasonal-currency-71`) applied to application `505997` with status `submitted`. This view answers "which applications fall under each fee schedule?"

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

The view `v_fee_schedule_regulatory_authority` joins `fee_schedules` to `regulatory_authorities` on `regulatory_authority_id`, pairing each fee schedule with its overseeing authority. The first row shows fee schedule `1` overseen by `Sean Green` with scope `distributed-oversigh-24`. This view answers "which authority sets each fee schedule?"

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

### Custodian Account View

The view `v_custodian_account_service_provider` joins `custodian_accounts` to `service_providers` on `service_provider_id`, producing rows that show each account alongside its provider's legal name and compliance status. The first row shows account `ACC-2253` belonging to `Adaptive Model` (compliance status `compliant`) with a minimum capital requirement of `17.70` and bank identifier `BAN-2796`. This view answers "which provider holds which custodian account, and what are the account's financial parameters?"

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

### Regulatory Authority-Centric Views

The view `v_regulatory_authority_license_application_detail` joins `regulatory_authorities` to `license_applications` on `regulatory_authority_id`, producing rows that show which applications each authority oversees. The first row shows `Sean Green` overseeing application `505997` (status `submitted`, reference `adaptive-regulato-89`). This view answers "which applications fall under each authority's jurisdiction?"

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

The view `v_regulatory_authority_compliance_requirement_detail` joins `regulatory_authorities` to `compliance_requirements` on `regulatory_authority_id`, pairing each authority with the requirements it imposes. The first row shows authority `1` (`Sean Green`) imposing requirement `778568` in category `AML_CFT`, which is mandatory (`is_mandatory = true`) with legal reference `composite-legal-63`. This view answers "which compliance requirements does each authority mandate?"

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

### Compliance Requirement-Centric Views

The view `v_compliance_requirement_service_provider_detail` joins `compliance_requirements` to `service_providers` through the `requirements_providers` junction table, producing rows that show which providers are subject to which requirements. The first row shows requirement `778568` (category `AML_CFT`, mandatory) applied to provider `Adaptive Model` (compliance status `compliant`). This view answers "which providers must satisfy each compliance requirement?"

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

The view `v_compliance_requirement_regulatory_authority` joins `compliance_requirements` to `regulatory_authorities` on `regulatory_authority_id`, pairing each requirement with its overseeing authority. The first row shows requirement `778568` (category `AML_CFT`, mandatory) overseen by authority `1` (`Sean Green`, scope `distributed-oversigh-24`). This view answers "which authority enforces each compliance requirement?"

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

## Closing Synthesis

The relational schema models the financial regulatory licensing domain through six core entity tables and five junction tables, connected by foreign keys that encode one-to-many and many-to-many relationships. The core tables capture the entities themselves — applications, providers, fee schedules, custodian accounts, regulatory authorities, and compliance requirements — each with typed attributes and surrogate or natural keys. The junction tables resolve the many-to-many associations that arise when providers file multiple applications, when authorities impose multiple requirements, and when requirements apply to multiple providers.

The twelve views then reconstruct domain facts by joining these normalized tables. Each view answers a specific question: which provider submitted which application, what fees apply to which application, which authority oversees which requirement, and which providers are subject to which compliance rules. The concrete values in the data — application `505997` submitted by `Adaptive Model`, overseen by `Sean Green`, governed by fee schedule `1` with an application fee of `43.25`, subject to mandatory `AML_CFT` requirement `778568` — illustrate how the normalized schema and the denormalized views together provide both data integrity and business readability.