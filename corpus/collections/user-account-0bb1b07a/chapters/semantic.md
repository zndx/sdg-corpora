## Domain Modelling and Relational Materialization

The domain under examination concerns the lifecycle management of digital user identities within a consent-aware marketing platform. At its core, the system must track who a user is, how they interact with the platform across sessions, what data-processing consents they have granted or revoked, which marketing messages have been dispatched to them, and which cookies have been placed on their devices during those sessions. Five base tables materialize these concerns into a normalized relational schema, while six views reconstruct denormalized facts by joining the tables back together. The design follows a star-like topology: `user_accounts` sits at the centre, with `user_sessions`, `data_processing_consents`, and `marketing_communications` each linked directly to it, and `cookie_identifiers` linked to `user_sessions`. This section walks through the entity types, their attributes, the foreign-key relationships that bind them, and the view-level joins that answer concrete business questions.

**Table `user_accounts`**

| user_account_id | account_id | email_address | password_hash | account_status | created_at | last_login_at | user_session_id | data_processing_consent_id |
|---|---|---|---|---|---|---|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 | integrated-password-76 | active | 2023-06-27T17:15:00 | 2022-09-13T20:12:00 | 1 | 100 |
| 2 | 10207152 | adaptive-email-71 | seasonal-password-77 | suspended | 2024-11-11T00:32:00 | 2023-02-24T03:29:00 | 2 | 101 |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 | regional-password-78 | deleted | 2025-04-22T07:49:00 | 2024-07-08T10:46:00 | 3 | 102 |
| 4 | 3717632 | baseline-email-73 | legacy-password-79 | active | 2022-09-06T14:06:00 | 2025-12-19T17:03:00 | 4 | 103 |

The `user_accounts` table is the primary entity in the domain. Each row represents a distinct user identity, identified by the surrogate key `user_account_id` (an auto-incrementing integer) and the business-level `account_id`, which carries either a UUID such as `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` or a numeric identifier like `10207152`. The `email_address` column stores the user's contact address (e.g., `primary-email-70`), while `password_hash` holds the hashed credential (e.g., `integrated-password-76`). The `account_status` column constrains the lifecycle state to one of three values: `active`, `suspended`, or `deleted`, as seen in rows 1 through 3. Timestamps `created_at` and `last_login_at` record the account's birth and most recent activity; note that `last_login_at` may precede `created_at` in the sample data (row 1 shows `2022-09-13T20:12:00` before `2023-06-27T17:15:00`), reflecting the synthetic nature of the dataset. Two foreign-key columns, `user_session_id` and `data_processing_consent_id`, anchor this table to `user_sessions` and `data_processing_consents` respectively, establishing one-to-one relationships in the current data.

**Table `user_sessions`**

| id | session_id | ip_address | user_agent | operating_system | device_name | country_code | session_start | session_end | user_account_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1186087 | extended-ip-15 | integrated-user-58 | distributed-operatin-66 | Julia Jones | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-04T16:00:00 | 2024-03-27T02:54:00 | 1 |
| 2 | 2087748 | integrated-ip-16 | seasonal-user-59 | baseline-operatin-67 | Julie Wilson | lu_tax_code_template_m_I_2 | 2023-10-15T23:17:00 | 2025-08-11T09:11:00 | 2 |
| 3 | 4716414 | seasonal-ip-17 | regional-user-60 | pilot-operatin-68 | Sarah Villanueva | default_chart_a_account_57 | 2024-03-26T06:34:00 | 2022-01-22T16:28:00 | 3 |
| 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-user-61 | extended-operatin-69 | Peter Mcdowell | 727045 | 2025-08-10T13:51:00 | 2023-06-06T23:45:00 | 4 |

The `user_sessions` table captures individual browsing or application sessions. Its surrogate key is `id`, while `session_id` carries the session's business identifier (e.g., `1186087` or the UUID `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`). Contextual attributes include `ip_address` (such as `extended-ip-15`), `user_agent` (`integrated-user-58`), `operating_system` (`distributed-operatin-66`), `device_name` (`Julia Jones`), and `country_code` (which in the sample data contains values like `2e55e0b6-8fcc-11eb-924d-9cd76263cbd0` and `lu_tax_code_template_m_I_2`). The session's temporal span is recorded by `session_start` and `session_end`. The foreign key `user_account_id` links each session to exactly one row in `user_accounts`, enforcing the one-to-many relationship from account to sessions. In the sample data, session `id` 1 belongs to `user_account_id` 1, session `id` 2 to `user_account_id` 2, and so on, yielding a clean one-to-one mapping in the current snapshot.

**Table `data_processing_consents`**

| id | consent_id | legal_basis | purpose_description | granted_at | revoked_at | is_revoked | user_account_id |
|---|---|---|---|---|---|---|---|
| 100 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | consent | Pilot Series | 2024-11-15T10:30:00 | 2024-03-11T14:18:00 | true | 1 |
| 101 | 790462 | legitimate_interests | Baseline Assessment | 2025-04-26T17:47:00 | 2025-08-22T21:35:00 | false | 2 |
| 102 | 4277037 | performance_of_contract | Distributed Survey A | 2022-09-10T00:04:00 | 2022-01-06T04:52:00 | true | 3 |
| 103 | 3990176 | legal_obligations | Adaptive Corridor | 2023-02-21T07:21:00 | 2023-06-17T11:09:00 | false | 4 |

Consent management is modelled by `data_processing_consents`. The surrogate key `id` (values 100–103) distinguishes consent records, while `consent_id` carries the business-level identifier (e.g., `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`). The `legal_basis` column constrains the regulatory ground for processing to one of four values: `consent`, `legitimate_interests`, `performance_of_contract`, or `legal_obligations`. The `purpose_description` field names the processing purpose (e.g., `Pilot Series`, `Baseline Assessment`). Temporal columns `granted_at` and `revoked_at` record when consent was given and, if applicable, withdrawn. The boolean `is_revoked` provides a fast lookup flag; row 100 has `is_revoked = true` with a `revoked_at` of `2024-03-11T14:18:00`, while row 101 has `is_revoked = false` despite having a `revoked_at` value of `2025-08-22T21:35:00`, illustrating that the sample data is synthetic and not internally consistent. The foreign key `user_account_id` ties each consent record to its owning account.

**Table `marketing_communications`**

| id | message_id | subject_line | sent_at | delivery_status | campaign_type | user_account_id | data_processing_consent_id |
|---|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | primary-subject-46 | 2023-10-21T09:03:00 | pending | regional-campaign-42 | 1 | 100 |
| 2 | state_uk_4 | adaptive-subject-47 | 2024-03-05T16:20:00 | sent | legacy-campaign-43 | 2 | 101 |
| 3 | 1250194 | distributed-subject-48 | 2025-08-16T23:37:00 | failed | compact-campaign-44 | 3 | 102 |
| 4 | 6969416 | baseline-subject-49 | 2022-01-27T06:54:00 | opted_out | composite-campaign-45 | 4 | 103 |

The `marketing_communications` table logs outbound marketing messages. Its surrogate key `id` (1–4) is distinct from the business-level `message_id`, which in the sample data contains values ranging from a Google Maps-style identifier (`ChIJD7fiBh9u5kcRYJSMaMOCCwQ`) to a state code (`state_uk_4`). The `subject_line` (e.g., `primary-subject-46`) and `sent_at` timestamp record the message content and dispatch time. `delivery_status` constrains the outcome to `pending`, `sent`, `failed`, or `opted_out`. The `campaign_type` column categorizes the campaign (e.g., `regional-campaign-42`). Two foreign keys anchor this table: `user_account_id` links the message to its recipient, and `data_processing_consent_id` links it to the specific consent record under which the message was sent. This dual foreign-key design allows the system to verify that a message was dispatched only when a valid consent record existed.

**Table `cookie_identifiers`**

| id | cookie_id | cookie_name | purpose | expiry_date | is_third_party | user_session_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | 392479 | Regional Initiative | analytics | 2023-10-24 | true | 1 | 2025-01-01 00:14:00 |
| 2 | 6983 | Seasonal Model D | marketing | 2024-03-08 | false | 2 | 2025-02-06 03:14:00 |
| 3 | 19609505 | Integrated Cluster | session_management | 2025-08-19 | true | 3 | 2025-03-11 06:14:00 |
| 4 | 2106722 | Extended Review | preferences | 2022-01-03 | false | 4 | 2025-04-16 09:14:00 |

Cookie tracking is handled by `cookie_identifiers`. The surrogate key `id` (1–4) is distinct from `cookie_id` (e.g., `392479` or `6983`). The `cookie_name` carries a human-readable label such as `Regional Initiative` or `Seasonal Model D`. The `purpose` column constrains the cookie's function to `analytics`, `marketing`, `session_management`, or `preferences`. The `expiry_date` (e.g., `2023-10-24`) and `is_third_party` boolean (true or false) provide operational metadata. The foreign key `user_session_id` links each cookie to the session during which it was placed, establishing a one-to-many relationship from sessions to cookies. The `created_at` timestamp records when the cookie was instantiated (e.g., `2025-01-01 00:14:00`).

The foreign-key topology of the schema can be summarized as follows. `user_accounts.user_session_id` references `user_sessions.id`, and `user_accounts.data_processing_consent_id` references `data_processing_consents.id`, creating two one-to-one relationships from the central account table. `user_sessions.user_account_id` references `user_accounts.user_account_id`, forming the reverse leg of the session-to-account relationship. `data_processing_consents.user_account_id` references `user_accounts.user_account_id`, linking consent records to their owning accounts. `marketing_communications.user_account_id` and `marketing_communications.data_processing_consent_id` reference `user_accounts.user_account_id` and `data_processing_consents.id` respectively, creating two incoming relationships to the marketing table. Finally, `cookie_identifiers.user_session_id` references `user_sessions.id`, linking cookies to their originating sessions. No junction tables are required because all relationships are direct foreign-key links; the schema avoids many-to-many decomposition because the current domain model treats each account as having at most one active session, one consent record, and a one-to-many set of cookies per session.

**View `vw_user_account_user_session`**

```sql
CREATE VIEW vw_user_account_user_session AS
SELECT a.user_account_id, a.account_id, a.email_address, a.password_hash, b.id AS session_id, b.session_id AS session_session_id, b.ip_address AS session_ip_address
FROM user_accounts a JOIN user_sessions b ON a.user_session_id = b.id;
```

| user_account_id | account_id | email_address | password_hash | session_id | session_session_id | session_ip_address |
|---|---|---|---|---|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 | integrated-password-76 | 1 | 1186087 | extended-ip-15 |
| 2 | 10207152 | adaptive-email-71 | seasonal-password-77 | 2 | 2087748 | integrated-ip-16 |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 | regional-password-78 | 3 | 4716414 | seasonal-ip-17 |
| 4 | 3717632 | baseline-email-73 | legacy-password-79 | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 |

The view `vw_user_account_user_session` reconstructs the account–session relationship by joining `user_accounts` to `user_sessions` on `user_accounts.user_session_id = user_sessions.id`. The SELECT list projects the account's `user_account_id`, `account_id`, `email_address`, and `password_hash`, alongside the session's `id` (aliased as `session_id`), `session_id` (aliased as `session_session_id`), and `ip_address` (aliased as `session_ip_address`). This view answers the question: "Which session was active for each user account, and what was that session's IP address?" Reading the first row, account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (email `primary-email-70`) is joined to session `1186087` originating from IP `extended-ip-15`. The fourth row shows account `3717632` (email `baseline-email-73`) linked to session `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` from IP `regional-ip-18`. The view materializes a single denormalized row per account, collapsing the two-table relationship into a flat fact.

**View `vw_user_account_data_processing_consent`**

```sql
CREATE VIEW vw_user_account_data_processing_consent AS
SELECT a.user_account_id, a.account_id, a.email_address, a.password_hash, b.id AS consent_id, b.consent_id AS consent_consent_id, b.legal_basis AS consent_legal_basis
FROM user_accounts a JOIN data_processing_consents b ON a.data_processing_consent_id = b.id;
```

| user_account_id | account_id | email_address | password_hash | consent_id | consent_consent_id | consent_legal_basis |
|---|---|---|---|---|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 | integrated-password-76 | 100 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | consent |
| 2 | 10207152 | adaptive-email-71 | seasonal-password-77 | 101 | 790462 | legitimate_interests |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 | regional-password-78 | 102 | 4277037 | performance_of_contract |
| 4 | 3717632 | baseline-email-73 | legacy-password-79 | 103 | 3990176 | legal_obligations |

The view `vw_user_account_data_processing_consent` joins `user_accounts` to `data_processing_consents` on `user_accounts.data_processing_consent_id = data_processing_consents.id`. It projects the account's `user_account_id`, `account_id`, `email_address`, and `password_hash`, together with the consent's `id`, `consent_id`, `legal_basis`, `purpose_description`, `granted_at`, `revoked_at`, and `is_revoked`. This view answers: "What is the data-processing consent status for each user account?" Row 1 shows account `primary-email-70` with consent `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3` based on `consent` for the purpose `Pilot Series`, which is revoked (`is_revoked = true`). Row 2 shows account `adaptive-email-71` with consent `790462` based on `legitimate_interests` for `Baseline Assessment`, which is not revoked. The view flattens the account–consent relationship so that compliance audits can be performed without a join.

**View `vw_user_session_user_account`**

```sql
CREATE VIEW vw_user_session_user_account AS
SELECT a.id, a.session_id, a.ip_address, a.user_agent, b.user_account_id AS account_user_account_id, b.account_id AS account_account_id, b.email_address AS account_email_address
FROM user_sessions a JOIN user_accounts b ON a.user_account_id = b.user_account_id;
```

| id | session_id | ip_address | user_agent | account_user_account_id | account_account_id | account_email_address |
|---|---|---|---|---|---|---|
| 1 | 1186087 | extended-ip-15 | integrated-user-58 | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 |
| 2 | 2087748 | integrated-ip-16 | seasonal-user-59 | 2 | 10207152 | adaptive-email-71 |
| 3 | 4716414 | seasonal-ip-17 | regional-user-60 | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 |
| 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-user-61 | 4 | 3717632 | baseline-email-73 |

The view `vw_user_session_user_account` performs the inverse join of `vw_user_account_user_session`, starting from `user_sessions` and joining to `user_accounts` on `user_sessions.user_account_id = user_accounts.user_account_id`. It projects the session's `id`, `session_id`, `ip_address`, and `user_agent`, alongside the account's `user_account_id`, `account_id`, and `email_address`. This view answers: "Which user account initiated each session, and what were the session's technical attributes?" Row 1 shows session `1186087` from IP `extended-ip-15` with user agent `integrated-user-58` was initiated by account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (email `primary-email-70`). Row 4 shows session `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` from IP `regional-ip-18` with user agent `legacy-user-61` was initiated by account `3717632` (email `baseline-email-73`). The perspective shift from account-centric to session-centric is useful for security and forensic queries that start from a session identifier and need to resolve the owning account.

**View `vw_data_processing_consent_user_account`**

```sql
CREATE VIEW vw_data_processing_consent_user_account AS
SELECT a.id, a.consent_id, a.legal_basis, a.purpose_description, b.user_account_id AS account_user_account_id, b.account_id AS account_account_id, b.email_address AS account_email_address
FROM data_processing_consents a JOIN user_accounts b ON a.user_account_id = b.user_account_id;
```

| id | consent_id | legal_basis | purpose_description | account_user_account_id | account_account_id | account_email_address |
|---|---|---|---|---|---|---|
| 100 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | consent | Pilot Series | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 |
| 101 | 790462 | legitimate_interests | Baseline Assessment | 2 | 10207152 | adaptive-email-71 |
| 102 | 4277037 | performance_of_contract | Distributed Survey A | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 |
| 103 | 3990176 | legal_obligations | Adaptive Corridor | 4 | 3717632 | baseline-email-73 |

The view `vw_data_processing_consent_user_account` joins `data_processing_consents` to `user_accounts` on `data_processing_consents.user_account_id = user_accounts.user_account_id`. It projects the consent's `id`, `consent_id`, `legal_basis`, `purpose_description`, `granted_at`, `revoked_at`, and `is_revoked`, alongside the account's `user_account_id`, `account_id`, `email_address`, and `password_hash`. This view answers: "For each consent record, which user account does it belong to, and what are the account's credentials?" Row 1 shows consent `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3` (purpose `Pilot Series`, basis `consent`, revoked) belongs to account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` with email `primary-email-70`. Row 3 shows consent `4277037` (purpose `Distributed Survey A`, basis `performance_of_contract`, revoked) belongs to account `a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3` with email `distributed-email-72`. This view is oriented toward consent auditors who need to see the full consent record alongside the account it pertains to.

**View `vw_marketing_communication_user_account`**

```sql
CREATE VIEW vw_marketing_communication_user_account AS
SELECT a.id, a.message_id, a.subject_line, a.sent_at, b.user_account_id AS account_user_account_id, b.account_id AS account_account_id, b.email_address AS account_email_address
FROM marketing_communications a JOIN user_accounts b ON a.user_account_id = b.user_account_id;
```

| id | message_id | subject_line | sent_at | account_user_account_id | account_account_id | account_email_address |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | primary-subject-46 | 2023-10-21T09:03:00 | 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 |
| 2 | state_uk_4 | adaptive-subject-47 | 2024-03-05T16:20:00 | 2 | 10207152 | adaptive-email-71 |
| 3 | 1250194 | distributed-subject-48 | 2025-08-16T23:37:00 | 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 |
| 4 | 6969416 | baseline-subject-49 | 2022-01-27T06:54:00 | 4 | 3717632 | baseline-email-73 |

The view `vw_marketing_communication_user_account` joins `marketing_communications` to `user_accounts` on `marketing_communications.user_account_id = user_accounts.user_account_id`. It projects the message's `id`, `message_id`, `subject_line`, `sent_at`, `delivery_status`, and `campaign_type`, alongside the account's `user_account_id`, `account_id`, `email_address`, and `password_hash`. This view answers: "Which marketing messages were sent to each user account, and what was their delivery outcome?" Row 1 shows message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` with subject `primary-subject-46` sent to account `primary-email-70` on `2023-10-21T09:03:00` with status `pending` under campaign `regional-campaign-42`. Row 4 shows message `6969416` with subject `baseline-subject-49` sent to account `baseline-email-73` on `2022-01-27T06:54:00` with status `opted_out` under campaign `composite-campaign-45`. This view supports marketing analytics by flattening the message–account relationship.

**View `vw_marketing_communication_data_processing_consent`**

```sql
CREATE VIEW vw_marketing_communication_data_processing_consent AS
SELECT a.id, a.message_id, a.subject_line, a.sent_at, b.id AS consent_id, b.consent_id AS consent_consent_id, b.legal_basis AS consent_legal_basis
FROM marketing_communications a JOIN data_processing_consents b ON a.data_processing_consent_id = b.id;
```

| id | message_id | subject_line | sent_at | consent_id | consent_consent_id | consent_legal_basis |
|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | primary-subject-46 | 2023-10-21T09:03:00 | 100 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | consent |
| 2 | state_uk_4 | adaptive-subject-47 | 2024-03-05T16:20:00 | 101 | 790462 | legitimate_interests |
| 3 | 1250194 | distributed-subject-48 | 2025-08-16T23:37:00 | 102 | 4277037 | performance_of_contract |
| 4 | 6969416 | baseline-subject-49 | 2022-01-27T06:54:00 | 103 | 3990176 | legal_obligations |

The view `vw_marketing_communication_data_processing_consent` joins `marketing_communications` to `data_processing_consents` on `marketing_communications.data_processing_consent_id = data_processing_consents.id`. It projects the message's `id`, `message_id`, `subject_line`, `sent_at`, `delivery_status`, and `campaign_type`, alongside the consent's `id`, `consent_id`, `legal_basis`, `purpose_description`, `granted_at`, `revoked_at`, and `is_revoked`. This view answers: "Under which consent record was each marketing message dispatched, and is that consent still valid?" Row 1 shows message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (subject `primary-subject-46`, status `pending`, campaign `regional-campaign-42`) was sent under consent `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3` (purpose `Pilot Series`, basis `consent`, revoked). Row 4 shows message `6969416` (subject `baseline-subject-49`, status `opted_out`, campaign `composite-campaign-45`) was sent under consent `3990176` (purpose `Adaptive Corridor`, basis `legal_obligations`, not revoked). This view is critical for compliance verification, as it directly links each outbound message to the legal basis under which it was sent.

**View `vw_cookie_identifier_user_session`**

```sql
CREATE VIEW vw_cookie_identifier_user_session AS
SELECT a.id, a.cookie_id, a.cookie_name, a.purpose, b.id AS session_id, b.session_id AS session_session_id, b.ip_address AS session_ip_address
FROM cookie_identifiers a JOIN user_sessions b ON a.user_session_id = b.id;
```

| id | cookie_id | cookie_name | purpose | session_id | session_session_id | session_ip_address |
|---|---|---|---|---|---|---|
| 1 | 392479 | Regional Initiative | analytics | 1 | 1186087 | extended-ip-15 |
| 2 | 6983 | Seasonal Model D | marketing | 2 | 2087748 | integrated-ip-16 |
| 3 | 19609505 | Integrated Cluster | session_management | 3 | 4716414 | seasonal-ip-17 |
| 4 | 2106722 | Extended Review | preferences | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 |

The view `vw_cookie_identifier_user_session` joins `cookie_identifiers` to `user_sessions` on `cookie_identifiers.user_session_id = user_sessions.id`. It projects the cookie's `id`, `cookie_id`, `cookie_name`, `purpose`, `expiry_date`, `is_third_party`, and `created_at`, alongside the session's `id`, `session_id`, `ip_address`, `user_agent`, `operating_system`, `device_name`, `country_code`, `session_start`, and `session_end`. This view answers: "Which cookies were placed during each user session, and what were the session's technical context details?" Row 1 shows cookie `392479` (name `Regional Initiative`, purpose `analytics`, third-party, expiry `2023-10-24`) was placed during session `1186087` from IP `extended-ip-15` on device `Julia Jones` running `distributed-operatin-66`. Row 3 shows cookie `19609505` (name `Integrated Cluster`, purpose `session_management`, third-party, expiry `2025-08-19`) was placed during session `4716414` from IP `seasonal-ip-17` on device `Sarah Villanueva` running `pilot-operatin-68`. This view supports cookie audits and privacy impact assessments by reconstructing the full cookie-to-session lineage.

The schema as a whole demonstrates a disciplined normalization strategy. The five base tables each capture a single concern—identity, session, consent, marketing, and cookies—with surrogate keys providing stable identifiers and foreign keys encoding the relationships. The six views then materialize the most common join paths as virtual tables, allowing downstream queries to access denormalized facts without repeating join logic. The account-centric views (`vw_user_account_user_session`, `vw_user_account_data_processing_consent`, `vw_marketing_communication_user_account`) serve business users who think in terms of "which sessions, consents, and messages belong to this account." The session-centric view (`vw_user_session_user_account`) serves security and forensic analysts who start from a session and need to resolve the account. The consent-centric view (`vw_data_processing_consent_user_account`) serves compliance auditors. The message–consent view (`vw_marketing_communication_data_processing_consent`) serves legal verification, ensuring every outbound message can be traced to a valid legal basis. The cookie–session view (`vw_cookie_identifier_user_session`) serves privacy audits, reconstructing the full cookie placement history per session. Together, the base tables and views form a complete, queryable model of the domain, where each join path corresponds to a well-defined business relationship and each view answers a specific class of analytical question.