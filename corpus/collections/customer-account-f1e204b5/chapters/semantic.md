The financial services domain under study models the relationships between individual customers, introducing firms, brokerage accounts, financial transactions, third-party services, and the security safeguards that govern them. At its core, the domain captures a brokerage ecosystem in which introducing firms bring customers into the system, those customers open and maintain accounts, transactions flow through those accounts via third-party services, and security safeguards are attached to both services and accounts to ensure regulatory compliance. The relational schema materializes this ecosystem through six base tables that store entity data, seven junction tables that resolve many-to-many relationships, and twelve views that reconstruct domain facts by joining the normalized tables back together.

## Base Tables and Entity Types

The schema's six base tables encode the primary entity types of the domain. The `customers` table stores individual client records, each identified by a surrogate `id` (e.g., `100`, `101`, `102`, `103`) and a human-readable `customer_identifier` such as `legacy-ssn-43` or `primary-ssn-46`. Additional attributes capture the customer's `full_name` (April Snyder, Rachel Peterson, Douglas Adams, John Morales), `date_of_birth`, `occupation`, `annual_income`, `address`, `telephone_number`, and a `created_at` timestamp. The `introducing_firms` table records the brokerage firms that refer customers, keyed by `firm_identifier` (FIR-2444, FIR-2447, FIR-2450, FIR-2453) and `registration_number` (REG-2136, REG-2142, REG-2148, REG-2154). Each firm has a `firm_name` (Legacy Review D, Regional Initiative, Seasonal Model, Integrated Cluster A), a `contact_email`, and a `contact_phone`.

**Table `customer_accounts`**

| id | account_identifier | account_status | opening_date | closing_date | account_type | customer_id | introducing_firm_registration_number |
|---|---|---|---|---|---|---|---|
| 1000 | ACC-2500 | active | 2025-04-25T15:33:00 | 2022-09-11T20:12:00 | margin | 100 | REG-2136 |
| 1001 | ACC-2502 | closed | 2022-09-09T22:50:00 | 2023-02-22T03:29:00 | cash | 101 | REG-2142 |
| 1002 | ACC-2504 | suspended | 2023-02-20T05:07:00 | 2024-07-06T10:46:00 | retirement | 102 | REG-2148 |
| 1003 | ACC-2506 | active | 2024-07-04T12:24:00 | 2025-12-17T17:03:00 | margin | 103 | REG-2154 |

The `customer_accounts` table links each account to a specific customer and introducing firm through foreign keys `customer_id` and `introducing_firm_registration_number`. Account records carry an `account_identifier` (ACC-2500, ACC-2502, ACC-2504, ACC-2506), an `account_status` (active, closed, suspended), an `opening_date`, a `closing_date`, and an `account_type` (margin, cash, retirement). The temporal fields allow the system to track account lifecycles: account `ACC-2500` opened on `2025-04-25T15:33:00` and closed on `2022-09-11T20:12:00`, while `ACC-2503` remains active with a future closing date of `2025-12-17T17:03:00`.

**Table `financial_transactions`**

| id | transaction_id | transaction_date | transaction_type | amount | currency_code | status | customer_account_id | third_party_service_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 937738 | 2023-02-25T01:39:00 | buy | 13.49 | gd_fp_eu_acc3 | pending | 1000 | 100 |
| 2 | 89509 | 2024-07-09T08:56:00 | sell | 25.47 | managing-resources | completed | 1001 | 101 |
| 3 | 1186092 | 2025-12-20T15:13:00 | deposit | 19.72 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | failed | 1002 | 102 |
| 4 | 9085243 | 2022-05-04T22:30:00 | withdrawal | 12.74 | 10445649 | reversed | 1003 | 103 |

Financial transactions are stored in `financial_transactions`, where each row represents a discrete monetary event. The table's `id` serves as the primary key, while `transaction_id` provides a business-level identifier (937738, 89509, 1186092, 9085243). The `transaction_date` records when the event occurred, `transaction_type` classifies it as `buy`, `sell`, `deposit`, or `withdrawal`, and `amount` captures the monetary value (13.49, 25.47, 19.72, 12.74). The `currency_code` column holds values such as `gd_fp_eu_acc3` and `managing-resources`, while `status` indicates the transaction lifecycle state (`pending`, `completed`, `failed`, `reversed`). Each transaction is linked to a `customer_account_id` (1000, 1001, 1002, 1003) and optionally to a `third_party_service_id`.

**Table `third_party_services`**

| id | service_id | service_name | service_type | contract_start_date | contract_end_date | security_level |
|---|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | data_processing | 2022-01-26 | 2025-12-07 | low |
| 101 | 3990164 | Adaptive Model D | securities_execution | 2023-06-10 | 2022-05-18 | medium |
| 102 | 5844258 | Primary Cluster | security_safeguard | 2024-11-21 | 2023-10-02 | high |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | compliance_monitoring | 2025-04-05 | 2024-03-13 | low |

The `third_party_services` table catalogs external service providers used by the brokerage. Each service has a surrogate `id` (100, 101, 102, 103), a `service_id` (1996925, 3990164, 5844258, e29bafe2-8fd1-11eb-924d-9cd76263cbd0), a `service_name` (Distributed Initiative, Adaptive Model D, Primary Cluster, Composite Review), and a `service_type` (data_processing, securities_execution, security_safeguard, compliance_monitoring). Contractual terms are captured in `contract_start_date` and `contract_end_date`, while `security_level` classifies the service as `low`, `medium`, or `high`.

**Table `security_safeguards`**

| id | safeguard_id | safeguard_name | safeguard_type | implementation_date | last_audit_date | compliance_status | third_party_service_id |
|---|---|---|---|---|---|---|---|
| 1 | id_23 | Compact Model | firewall | 2024-11-14 | 2023-10-23 | compliant | 100 |
| 2 | 2933462 | Legacy Cluster | encryption | 2025-04-25 | 2024-03-07 | non_compliant | 101 |
| 3 | 10445644 | Regional Review A | user_authentication | 2022-09-09 | 2025-08-18 | pending_review | 102 |
| 4 | 3990177 | Seasonal Initiative | access_control | 2023-02-20 | 2022-01-02 | compliant | 103 |

Security safeguards are stored in `security_safeguards`, which records the protective measures applied to third-party services. Each safeguard has a surrogate `id`, a `safeguard_id` (id_23, 2933462, 10445644, 3990177), a `safeguard_name` (Compact Model, Legacy Cluster, Regional Review A, Seasonal Initiative), and a `safeguard_type` (firewall, encryption, user_authentication, access_control). The `implementation_date` and `last_audit_date` track the safeguard's lifecycle, `compliance_status` records whether the safeguard is `compliant`, `non_compliant`, or `pending_review`, and `third_party_service_id` links the safeguard to the service it protects.

## Junction Tables and Many-to-Many Relationships

The seven junction tables resolve many-to-many relationships that cannot be expressed through simple foreign keys. The `customers_accounts` junction table connects customers to their accounts, enabling a single customer to hold multiple accounts and a single account to be associated with multiple customer records. Similarly, `firms_customers` links introducing firms to the customers they refer, `firms_accounts` connects firms to accounts, and `services_accounts` associates third-party services with customer accounts. The `services_customers` table provides a direct customer-to-service linkage, while `safeguards_accounts` ties security safeguards to accounts. The `accounts_transactions` junction table bridges accounts and transactions, allowing the system to track which transactions belong to which accounts.

These junction tables follow a standard pattern: each contains foreign keys referencing the two entity tables it connects, and together they enforce the cardinality constraints of the domain. A customer can have many accounts, an account can belong to many customers, and the junction table's composite key ensures no duplicate pairings. The same logic applies across all seven junctions, creating a fully normalized relational model where entity data, relationship data, and transactional data are cleanly separated.

## Views and Domain Fact Reconstruction

The twelve views in the schema reconstruct domain facts by joining the normalized base and junction tables. Each view answers a specific analytical question by denormalizing the relevant entities into a single flat result set.

**View `v_customer_account_customer`**

```sql
CREATE VIEW v_customer_account_customer AS
SELECT a.id, a.account_identifier, a.account_status, a.opening_date, b.id AS customer_id, b.customer_identifier AS customer_customer_identifier, b.full_name AS customer_full_name
FROM customer_accounts a JOIN customers b ON a.customer_id = b.id;
```

| id | account_identifier | account_status | opening_date | customer_id | customer_customer_identifier | customer_full_name |
|---|---|---|---|---|---|---|
| 1000 | ACC-2500 | active | 2025-04-25T15:33:00 | 100 | April Snyder | Theodore Mcgrath |
| 1001 | ACC-2502 | closed | 2022-09-09T22:50:00 | 101 | Rachel Peterson | Account Name |
| 1002 | ACC-2504 | suspended | 2023-02-20T05:07:00 | 102 | Douglas Adams | Saipan International Airport |
| 1003 | ACC-2506 | active | 2024-07-04T12:24:00 | 103 | John Morales | Norma Fisher |

The view `v_customer_account_customer` joins `customer_accounts` with `customers` to produce a customer-account relationship view. It answers the question: "Which customer holds which account?" A row from this view might show customer `April Snyder` (id `100`) holding account `ACC-2500` (id `1000`), with the customer's `full_name` and `telephone_number` (TEL-2173) appearing alongside the account's `account_status` (active) and `account_type` (margin). This view is the foundation for customer-facing account summaries.

**View `v_customer_account_introducing_firm`**

```sql
CREATE VIEW v_customer_account_introducing_firm AS
SELECT a.id, a.account_identifier, a.account_status, a.opening_date, b.firm_identifier AS firm_firm_identifier, b.firm_name AS firm_firm_name, b.registration_number AS firm_registration_number
FROM customer_accounts a JOIN introducing_firms b ON a.introducing_firm_registration_number = b.registration_number;
```

| id | account_identifier | account_status | opening_date | firm_firm_identifier | firm_firm_name | firm_registration_number |
|---|---|---|---|---|---|---|
| 1000 | ACC-2500 | active | 2025-04-25T15:33:00 | FIR-2444 | Legacy Review D | REG-2136 |
| 1001 | ACC-2502 | closed | 2022-09-09T22:50:00 | FIR-2447 | Regional Initiative | REG-2142 |
| 1002 | ACC-2504 | suspended | 2023-02-20T05:07:00 | FIR-2450 | Seasonal Model | REG-2148 |
| 1003 | ACC-2506 | active | 2024-07-04T12:24:00 | FIR-2453 | Integrated Cluster A | REG-2154 |

The view `v_customer_account_introducing_firm` joins `customer_accounts` with `introducing_firms` to reveal which introducing firm brought each customer-account pair into the system. It answers: "Which firm referred the customer who holds this account?" A representative row shows account `ACC-2500` (id `1000`) associated with introducing firm `Legacy Review D` (firm_identifier `FIR-2444`, registration `REG-2136`), with the firm's `contact_email` (Christopher Wilson) and `contact_phone` (Joe Tsai) available for outreach. This view supports compliance reporting and firm performance analysis.

**View `v_customer_account_financial_transaction_detail`**

```sql
CREATE VIEW v_customer_account_financial_transaction_detail AS
SELECT a.id, a.account_identifier, a.account_status, b.id AS transaction_id, b.transaction_id AS transaction_transaction_id, b.transaction_date AS transaction_transaction_date
FROM customer_accounts a
  JOIN accounts_transactions j ON j.customer_account_id = a.id
  JOIN financial_transactions b ON b.id = j.financial_transaction_id;
```

| id | account_identifier | account_status | transaction_id | transaction_transaction_id | transaction_transaction_date |
|---|---|---|---|---|---|
| 1000 | ACC-2500 | active | 1 | 937738 | 2023-02-25T01:39:00 |
| 1000 | ACC-2500 | active | 2 | 89509 | 2024-07-09T08:56:00 |
| 1001 | ACC-2502 | closed | 2 | 89509 | 2024-07-09T08:56:00 |
| 1001 | ACC-2502 | closed | 3 | 1186092 | 2025-12-20T15:13:00 |
| 1002 | ACC-2504 | suspended | 3 | 1186092 | 2025-12-20T15:13:00 |
| 1002 | ACC-2504 | suspended | 4 | 9085243 | 2022-05-04T22:30:00 |
| 1003 | ACC-2506 | active | 4 | 9085243 | 2022-05-04T22:30:00 |
| 1003 | ACC-2506 | active | 1 | 937738 | 2023-02-25T01:39:00 |

The view `v_customer_account_financial_transaction_detail` joins `customer_accounts` with `financial_transactions` to produce a detailed transaction ledger per account. It answers: "What financial transactions have occurred on this account?" A row might show account `ACC-2500` (id `1000`) with transaction `937738` of type `buy`, amount `13.49`, status `pending`, and date `2023-02-25T01:39:00`. This view is the primary instrument for account-level transaction auditing.

**View `v_customer_customer_account_detail`**

```sql
CREATE VIEW v_customer_customer_account_detail AS
SELECT a.id, a.customer_identifier, a.full_name, b.id AS account_id, b.account_identifier AS account_account_identifier, b.account_status AS account_account_status
FROM customers a
  JOIN customers_accounts j ON j.customer_id = a.id
  JOIN customer_accounts b ON b.id = j.customer_account_id;
```

| id | customer_identifier | full_name | account_id | account_account_identifier | account_account_status |
|---|---|---|---|---|---|
| 100 | April Snyder | Theodore Mcgrath | 1000 | ACC-2500 | active |
| 100 | April Snyder | Theodore Mcgrath | 1001 | ACC-2502 | closed |
| 101 | Rachel Peterson | Account Name | 1001 | ACC-2502 | closed |
| 101 | Rachel Peterson | Account Name | 1002 | ACC-2504 | suspended |
| 102 | Douglas Adams | Saipan International Airport | 1002 | ACC-2504 | suspended |
| 102 | Douglas Adams | Saipan International Airport | 1003 | ACC-2506 | active |
| 103 | John Morales | Norma Fisher | 1003 | ACC-2506 | active |
| 103 | John Morales | Norma Fisher | 1000 | ACC-2500 | active |

The view `v_customer_customer_account_detail` joins `customers` with `customer_accounts` to produce a customer-centric account overview. It answers: "What accounts does this customer hold, and what are their statuses?" A row might show customer `April Snyder` (id `100`, customer_identifier `legacy-ssn-43`) holding account `ACC-2500` (id `1000`, type `margin`, status `active`), with the account's `opening_date` (`2025-04-25T15:33:00`) and `closing_date` (`2022-09-11T20:12:00`) visible. This view supports customer relationship management and account portfolio analysis.

**View `v_introducing_firm_customer_detail`**

```sql
CREATE VIEW v_introducing_firm_customer_detail AS
SELECT a.firm_identifier, a.firm_name, a.registration_number, b.id AS customer_id, b.customer_identifier AS customer_customer_identifier, b.full_name AS customer_full_name
FROM introducing_firms a
  JOIN firms_customers j ON j.introducing_firm_registration_number = a.registration_number
  JOIN customers b ON b.id = j.customer_id;
```

| firm_identifier | firm_name | registration_number | customer_id | customer_customer_identifier | customer_full_name |
|---|---|---|---|---|---|
| FIR-2444 | Legacy Review D | REG-2136 | 100 | April Snyder | Theodore Mcgrath |
| FIR-2444 | Legacy Review D | REG-2136 | 101 | Rachel Peterson | Account Name |
| FIR-2447 | Regional Initiative | REG-2142 | 101 | Rachel Peterson | Account Name |
| FIR-2447 | Regional Initiative | REG-2142 | 102 | Douglas Adams | Saipan International Airport |
| FIR-2450 | Seasonal Model | REG-2148 | 102 | Douglas Adams | Saipan International Airport |
| FIR-2450 | Seasonal Model | REG-2148 | 103 | John Morales | Norma Fisher |
| FIR-2453 | Integrated Cluster A | REG-2154 | 103 | John Morales | Norma Fisher |
| FIR-2453 | Integrated Cluster A | REG-2154 | 100 | April Snyder | Theodore Mcgrath |

The view `v_introducing_firm_customer_detail` joins `introducing_firms` with `customers` to reveal which customers were referred by which firm. It answers: "Which customers did this introducing firm bring in?" A row might show firm `Legacy Review D` (firm_identifier `FIR-2444`, registration `REG-2136`) associated with customer `April Snyder` (id `100`, full_name `Theodore Mcgrath`, occupation `legacy-occupati-37`, annual_income `26.04`). This view is essential for evaluating firm referral quality and commission calculations.

**View `v_introducing_firm_customer_account_detail`**

```sql
CREATE VIEW v_introducing_firm_customer_account_detail AS
SELECT a.firm_identifier, a.firm_name, a.registration_number, b.id AS account_id, b.account_identifier AS account_account_identifier, b.account_status AS account_account_status
FROM introducing_firms a
  JOIN firms_accounts j ON j.introducing_firm_registration_number = a.registration_number
  JOIN customer_accounts b ON b.id = j.customer_account_id;
```

| firm_identifier | firm_name | registration_number | account_id | account_account_identifier | account_account_status |
|---|---|---|---|---|---|
| FIR-2444 | Legacy Review D | REG-2136 | 1000 | ACC-2500 | active |
| FIR-2444 | Legacy Review D | REG-2136 | 1001 | ACC-2502 | closed |
| FIR-2447 | Regional Initiative | REG-2142 | 1001 | ACC-2502 | closed |
| FIR-2447 | Regional Initiative | REG-2142 | 1002 | ACC-2504 | suspended |
| FIR-2450 | Seasonal Model | REG-2148 | 1002 | ACC-2504 | suspended |
| FIR-2450 | Seasonal Model | REG-2148 | 1003 | ACC-2506 | active |
| FIR-2453 | Integrated Cluster A | REG-2154 | 1003 | ACC-2506 | active |
| FIR-2453 | Integrated Cluster A | REG-2154 | 1000 | ACC-2500 | active |

The view `v_introducing_firm_customer_account_detail` joins `introducing_firms`, `customers`, and `customer_accounts` to produce a comprehensive firm-customer-account triangle. It answers: "Which firm referred which customer, and what accounts does that customer hold?" A row might show firm `Regional Initiative` (firm_identifier `FIR-2447`, registration `REG-2142`) having referred customer `Rachel Peterson` (id `101`, full_name `Account Name`, occupation `compact-occupati-38`, annual_income `19.97`), who holds account `ACC-2502` (id `1001`, type `cash`, status `closed`). This view supports end-to-end referral chain analysis.

**View `v_financial_transaction_customer_account`**

```sql
CREATE VIEW v_financial_transaction_customer_account AS
SELECT a.id, a.transaction_id, a.transaction_date, a.transaction_type, b.id AS account_id, b.account_identifier AS account_account_identifier, b.account_status AS account_account_status
FROM financial_transactions a JOIN customer_accounts b ON a.customer_account_id = b.id;
```

| id | transaction_id | transaction_date | transaction_type | account_id | account_account_identifier | account_account_status |
|---|---|---|---|---|---|---|
| 1 | 937738 | 2023-02-25T01:39:00 | buy | 1000 | ACC-2500 | active |
| 2 | 89509 | 2024-07-09T08:56:00 | sell | 1001 | ACC-2502 | closed |
| 3 | 1186092 | 2025-12-20T15:13:00 | deposit | 1002 | ACC-2504 | suspended |
| 4 | 9085243 | 2022-05-04T22:30:00 | withdrawal | 1003 | ACC-2506 | active |

The view `v_financial_transaction_customer_account` joins `financial_transactions` with `customer_accounts` to produce a transaction-to-account mapping. It answers: "Which account was this transaction executed against?" A row might show transaction `937738` (type `buy`, amount `13.49`, status `pending`, date `2023-02-25T01:39:00`) linked to account `ACC-2500` (id `1000`, type `margin`, status `active`). This view is the backbone of transaction reconciliation and account activity reporting.

**View `v_financial_transaction_third_party_service`**

```sql
CREATE VIEW v_financial_transaction_third_party_service AS
SELECT a.id, a.transaction_id, a.transaction_date, a.transaction_type, b.id AS service_id, b.service_id AS service_service_id, b.service_name AS service_service_name
FROM financial_transactions a JOIN third_party_services b ON a.third_party_service_id = b.id;
```

| id | transaction_id | transaction_date | transaction_type | service_id | service_service_id | service_service_name |
|---|---|---|---|---|---|---|
| 1 | 937738 | 2023-02-25T01:39:00 | buy | 100 | 1996925 | Distributed Initiative |
| 2 | 89509 | 2024-07-09T08:56:00 | sell | 101 | 3990164 | Adaptive Model D |
| 3 | 1186092 | 2025-12-20T15:13:00 | deposit | 102 | 5844258 | Primary Cluster |
| 4 | 9085243 | 2022-05-04T22:30:00 | withdrawal | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

The view `v_financial_transaction_third_party_service` joins `financial_transactions` with `third_party_services` to reveal which third-party service facilitated each transaction. It answers: "Which external service processed this transaction?" A row might show transaction `937738` (type `buy`, amount `13.49`) processed by service `Distributed Initiative` (id `100`, service_id `1996925`, type `data_processing`, security_level `low`). This view supports vendor performance analysis and service-level agreement monitoring.

**View `v_third_party_service_customer_account_detail`**

```sql
CREATE VIEW v_third_party_service_customer_account_detail AS
SELECT a.id, a.service_id, a.service_name, b.id AS account_id, b.account_identifier AS account_account_identifier, b.account_status AS account_account_status
FROM third_party_services a
  JOIN services_accounts j ON j.third_party_service_id = a.id
  JOIN customer_accounts b ON b.id = j.customer_account_id;
```

| id | service_id | service_name | account_id | account_account_identifier | account_account_status |
|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | 1000 | ACC-2500 | active |
| 100 | 1996925 | Distributed Initiative | 1001 | ACC-2502 | closed |
| 101 | 3990164 | Adaptive Model D | 1001 | ACC-2502 | closed |
| 101 | 3990164 | Adaptive Model D | 1002 | ACC-2504 | suspended |
| 102 | 5844258 | Primary Cluster | 1002 | ACC-2504 | suspended |
| 102 | 5844258 | Primary Cluster | 1003 | ACC-2506 | active |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 1003 | ACC-2506 | active |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 1000 | ACC-2500 | active |

The view `v_third_party_service_customer_account_detail` joins `third_party_services` with `customer_accounts` to produce a service-to-account mapping. It answers: "Which accounts use this third-party service?" A row might show service `Distributed Initiative` (id `100`, service_name `Distributed Initiative`, service_type `data_processing`, security_level `low`) associated with account `ACC-2500` (id `1000`, type `margin`, status `active`). This view supports service dependency analysis and risk assessment.

**View `v_third_party_service_customer_detail`**

```sql
CREATE VIEW v_third_party_service_customer_detail AS
SELECT a.id, a.service_id, a.service_name, b.id AS customer_id, b.customer_identifier AS customer_customer_identifier, b.full_name AS customer_full_name
FROM third_party_services a
  JOIN services_customers j ON j.third_party_service_id = a.id
  JOIN customers b ON b.id = j.customer_id;
```

| id | service_id | service_name | customer_id | customer_customer_identifier | customer_full_name |
|---|---|---|---|---|---|
| 100 | 1996925 | Distributed Initiative | 100 | April Snyder | Theodore Mcgrath |
| 100 | 1996925 | Distributed Initiative | 101 | Rachel Peterson | Account Name |
| 101 | 3990164 | Adaptive Model D | 101 | Rachel Peterson | Account Name |
| 101 | 3990164 | Adaptive Model D | 102 | Douglas Adams | Saipan International Airport |
| 102 | 5844258 | Primary Cluster | 102 | Douglas Adams | Saipan International Airport |
| 102 | 5844258 | Primary Cluster | 103 | John Morales | Norma Fisher |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 103 | John Morales | Norma Fisher |
| 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | 100 | April Snyder | Theodore Mcgrath |

The view `v_third_party_service_customer_detail` joins `third_party_services` with `customers` to reveal which customers interact with which third-party services. It answers: "Which customers are exposed to this service?" A row might show service `Adaptive Model D` (id `101`, service_name `Adaptive Model D`, service_type `securities_execution`, security_level `medium`) associated with customer `Rachel Peterson` (id `101`, full_name `Account Name`, occupation `compact-occupati-38`, annual_income `19.97`). This view supports customer exposure analysis and regulatory reporting.

**View `v_security_safeguard_customer_account_detail`**

```sql
CREATE VIEW v_security_safeguard_customer_account_detail AS
SELECT a.id, a.safeguard_id, a.safeguard_name, b.id AS account_id, b.account_identifier AS account_account_identifier, b.account_status AS account_account_status
FROM security_safeguards a
  JOIN safeguards_accounts j ON j.security_safeguard_id = a.id
  JOIN customer_accounts b ON b.id = j.customer_account_id;
```

| id | safeguard_id | safeguard_name | account_id | account_account_identifier | account_account_status |
|---|---|---|---|---|---|
| 1 | id_23 | Compact Model | 1000 | ACC-2500 | active |
| 1 | id_23 | Compact Model | 1001 | ACC-2502 | closed |
| 2 | 2933462 | Legacy Cluster | 1001 | ACC-2502 | closed |
| 2 | 2933462 | Legacy Cluster | 1002 | ACC-2504 | suspended |
| 3 | 10445644 | Regional Review A | 1002 | ACC-2504 | suspended |
| 3 | 10445644 | Regional Review A | 1003 | ACC-2506 | active |
| 4 | 3990177 | Seasonal Initiative | 1003 | ACC-2506 | active |
| 4 | 3990177 | Seasonal Initiative | 1000 | ACC-2500 | active |

The view `v_security_safeguard_customer_account_detail` joins `security_safeguards` with `customer_accounts` to produce a safeguard-to-account mapping. It answers: "Which accounts are protected by which security safeguards?" A row might show safeguard `Compact Model` (id `1`, safeguard_id `id_23`, safeguard_type `firewall`, compliance_status `compliant`) associated with account `ACC-2500` (id `1000`, type `margin`, status `active`). This view is critical for compliance audits and security posture reporting.

**View `v_security_safeguard_third_party_service`**

```sql
CREATE VIEW v_security_safeguard_third_party_service AS
SELECT a.id, a.safeguard_id, a.safeguard_name, a.safeguard_type, b.id AS service_id, b.service_id AS service_service_id, b.service_name AS service_service_name
FROM security_safeguards a JOIN third_party_services b ON a.third_party_service_id = b.id;
```

| id | safeguard_id | safeguard_name | safeguard_type | service_id | service_service_id | service_service_name |
|---|---|---|---|---|---|---|
| 1 | id_23 | Compact Model | firewall | 100 | 1996925 | Distributed Initiative |
| 2 | 2933462 | Legacy Cluster | encryption | 101 | 3990164 | Adaptive Model D |
| 3 | 10445644 | Regional Review A | user_authentication | 102 | 5844258 | Primary Cluster |
| 4 | 3990177 | Seasonal Initiative | access_control | 103 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

The view `v_security_safeguard_third_party_service` joins `security_safeguards` with `third_party_services` to reveal which safeguards protect which services. It answers: "What security measures are in place for this third-party service?" A row might show service `Distributed Initiative` (id `100`, service_type `data_processing`, security_level `low`) protected by safeguard `Compact Model` (id `1`, safeguard_id `id_23`, safeguard_type `firewall`, compliance_status `compliant`, last_audit_date `2023-10-23`). This view supports security governance and vendor risk management.

## Closing Synthesis

The schema models the financial services domain as a network of six entity types connected through seven junction tables, with twelve views providing denormalized lenses for common analytical queries. The base tables enforce referential integrity through foreign keys: `customer_accounts` references both `customers` and `introducing_firms`, `financial_transactions` references `customer_accounts` and `third_party_services`, and `security_safeguards` references `third_party_services`. The junction tables resolve the many-to-many relationships that arise when customers hold multiple accounts, firms refer multiple customers, services serve multiple accounts, and safeguards protect multiple services. The views reconstruct domain facts by joining these normalized structures back into flat result sets, each answering a specific business question about customer-account relationships, transaction details, service dependencies, or security compliance. This layered architecture — entities, relationships, and views — ensures that the schema remains normalized for data integrity while providing denormalized access patterns for reporting and analysis.

## Data appendix

**Table `customers`**

| id | customer_identifier | full_name | ssn | date_of_birth | occupation | annual_income | address | telephone_number | created_at |
|---|---|---|---|---|---|---|---|---|---|
| 100 | April Snyder | Theodore Mcgrath | legacy-ssn-43 | 2025-04-02 | legacy-occupati-37 | 26.04 | distributed-address-72 | TEL-2173 | 2025-01-01 00:14:00 |
| 101 | Rachel Peterson | Account Name | compact-ssn-44 | 2022-09-13 | compact-occupati-38 | 19.97 | baseline-address-73 | TEL-2177 | 2025-02-06 03:14:00 |
| 102 | Douglas Adams | Saipan International Airport | composite-ssn-45 | 2023-02-24 | composite-occupati-39 | 20.14 | pilot-address-74 | TEL-2181 | 2025-03-11 06:14:00 |
| 103 | John Morales | Norma Fisher | primary-ssn-46 | 2024-07-08 | primary-occupati-40 | 19.95 | extended-address-75 | TEL-2185 | 2025-04-16 09:14:00 |

**Table `introducing_firms`**

| firm_identifier | firm_name | registration_number | contact_email | contact_phone |
|---|---|---|---|---|
| FIR-2444 | Legacy Review D | REG-2136 | Christopher Wilson | Joe Tsai |
| FIR-2447 | Regional Initiative | REG-2142 | Charles Larsen | Stephanie Collins |
| FIR-2450 | Seasonal Model | REG-2148 | Mary Alvarez | Tasha Rodriguez |
| FIR-2453 | Integrated Cluster A | REG-2154 | April Snyder | Walter Pratt |

**Table `accounts_transactions`**

| customer_account_id | financial_transaction_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

**Table `customers_accounts`**

| customer_id | customer_account_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `firms_customers`**

| introducing_firm_registration_number | customer_id |
|---|---|
| REG-2136 | 100 |
| REG-2136 | 101 |
| REG-2142 | 101 |
| REG-2142 | 102 |
| REG-2148 | 102 |
| REG-2148 | 103 |
| REG-2154 | 103 |
| REG-2154 | 100 |

**Table `firms_accounts`**

| introducing_firm_registration_number | customer_account_id |
|---|---|
| REG-2136 | 1000 |
| REG-2136 | 1001 |
| REG-2142 | 1001 |
| REG-2142 | 1002 |
| REG-2148 | 1002 |
| REG-2148 | 1003 |
| REG-2154 | 1003 |
| REG-2154 | 1000 |

**Table `services_accounts`**

| third_party_service_id | customer_account_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

**Table `services_customers`**

| third_party_service_id | customer_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `safeguards_accounts`**

| security_safeguard_id | customer_account_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |
