## The Digital Identity Lifecycle

Every interaction between a platform and its users generates a trail of structured records: account creation, session activity, consent decisions, marketing outreach, and browser-based identifiers. These records form the backbone of user lifecycle management, where each phase—from initial registration through active use to consent revocation—must be tracked, audited, and correlated. The domain captures five core entities that together describe a user's journey: the account itself, the sessions through which the account is exercised, the legal consents governing data processing, the marketing messages dispatched to the account holder, and the cookie identifiers placed during active sessions. Understanding how these entities relate is essential for compliance reporting, security auditing, and campaign attribution.

**Table `user_accounts`**

| user_account_id | account_id | email_address | password_hash | account_status | created_at | last_login_at | user_session_id | data_processing_consent_id |
|---|---|---|---|---|---|---|---|---|
| 1 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 | integrated-password-76 | active | 2023-06-27T17:15:00 | 2022-09-13T20:12:00 | 1 | 100 |
| 2 | 10207152 | adaptive-email-71 | seasonal-password-77 | suspended | 2024-11-11T00:32:00 | 2023-02-24T03:29:00 | 2 | 101 |
| 3 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 | regional-password-78 | deleted | 2025-04-22T07:49:00 | 2024-07-08T10:46:00 | 3 | 102 |
| 4 | 3717632 | baseline-email-73 | legacy-password-79 | active | 2022-09-06T14:06:00 | 2025-12-19T17:03:00 | 4 | 103 |

The `user_accounts` table anchors the entire domain. Each row represents a registered identity, identified by a surrogate `user_account_id` and a business-level `account_id` that may be a UUID such as `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` or a numeric string like `10207152`. The `email_address` column stores the user's contact point—`primary-email-70`, `adaptive-email-71`, and so on—while `password_hash` holds the derived credential. The `account_status` field classifies the lifecycle stage: `active`, `suspended`, or `deleted`. Timestamps `created_at` and `last_login_at` bracket the account's temporal span; for instance, account `3717632` was created on 2022-09-06 but logged in as recently as 2025-12-19, indicating sustained engagement. Two foreign keys link the account to its most recent session (`user_session_id`) and its governing consent record (`data_processing_consent_id`), establishing the primary join paths for every downstream view.

**Table `user_sessions`**

| id | session_id | ip_address | user_agent | operating_system | device_name | country_code | session_start | session_end | user_account_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1186087 | extended-ip-15 | integrated-user-58 | distributed-operatin-66 | Julia Jones | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 2022-05-04T16:00:00 | 2024-03-27T02:54:00 | 1 |
| 2 | 2087748 | integrated-ip-16 | seasonal-user-59 | baseline-operatin-67 | Julie Wilson | lu_tax_code_template_m_I_2 | 2023-10-15T23:17:00 | 2025-08-11T09:11:00 | 2 |
| 3 | 4716414 | seasonal-ip-17 | regional-user-60 | pilot-operatin-68 | Sarah Villanueva | default_chart_a_account_57 | 2024-03-26T06:34:00 | 2022-01-22T16:28:00 | 3 |
| 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-user-61 | extended-operatin-69 | Peter Mcdowell | 727045 | 2025-08-10T13:51:00 | 2023-06-06T23:45:00 | 4 |

User sessions capture discrete periods of platform access. Each session carries a surrogate `id`, a business `session_id` (which may be numeric, as with `1186087`, or UUID-formatted, as with `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`), and a rich set of device and network attributes: `ip_address`, `user_agent`, `operating_system`, `device_name`, and `country_code`. The session lifecycle is bounded by `session_start` and `session_end`; session `2087748`, for example, began on 2023-10-15 and concluded on 2025-08-11, spanning nearly two years. The `user_account_id` column ties each session back to its owning account, enabling session-level analysis to be rolled up to the account level.

**Table `data_processing_consents`**

| id | consent_id | legal_basis | purpose_description | granted_at | revoked_at | is_revoked | user_account_id |
|---|---|---|---|---|---|---|---|
| 100 | 9fffb746-9bac-11eb-a8a2-19ed5c03f8d3 | consent | Pilot Series | 2024-11-15T10:30:00 | 2024-03-11T14:18:00 | true | 1 |
| 101 | 790462 | legitimate_interests | Baseline Assessment | 2025-04-26T17:47:00 | 2025-08-22T21:35:00 | false | 2 |
| 102 | 4277037 | performance_of_contract | Distributed Survey A | 2022-09-10T00:04:00 | 2022-01-06T04:52:00 | true | 3 |
| 103 | 3990176 | legal_obligations | Adaptive Corridor | 2023-02-21T07:21:00 | 2023-06-17T11:09:00 | false | 4 |

Data processing consents document the legal basis on which an organization may process personal data for a given account. The `id` column (values `100` through `103`) serves as the surrogate key, while `consent_id` provides a business-level identifier. The `legal_basis` field enumerates the regulatory ground—`consent`, `legitimate_interests`, `performance_of_contract`, or `legal_obligations`—and `purpose_description` names the specific activity, such as "Pilot Series" or "Baseline Assessment." Timestamps `granted_at` and `revoked_at` record the decision timeline, and the boolean `is_revoked` flag provides a quick compliance check. Consent `100` for account `1` was granted on 2024-11-15 but revoked on 2024-03-11, with `is_revoked` set to `true`; consent `101` for account `2` remains active despite a future-dated revocation window. The `user_account_id` foreign key anchors each consent to its account.

**Table `marketing_communications`**

| id | message_id | subject_line | sent_at | delivery_status | campaign_type | user_account_id | data_processing_consent_id |
|---|---|---|---|---|---|---|---|
| 1 | ChIJD7fiBh9u5kcRYJSMaMOCCwQ | primary-subject-46 | 2023-10-21T09:03:00 | pending | regional-campaign-42 | 1 | 100 |
| 2 | state_uk_4 | adaptive-subject-47 | 2024-03-05T16:20:00 | sent | legacy-campaign-43 | 2 | 101 |
| 3 | 1250194 | distributed-subject-48 | 2025-08-16T23:37:00 | failed | compact-campaign-44 | 3 | 102 |
| 4 | 6969416 | baseline-subject-49 | 2022-01-27T06:54:00 | opted_out | composite-campaign-45 | 4 | 103 |

Marketing communications track outbound messages sent to account holders. Each row is identified by a surrogate `id` and a business `message_id`, which may be a Google Maps–style identifier like `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` or a short string such as `state_uk_4`. The `subject_line` describes the message content, `sent_at` records dispatch time, and `delivery_status` indicates the outcome: `pending`, `sent`, `failed`, or `opted_out`. The `campaign_type` categorizes the outreach effort, and the dual foreign keys `user_account_id` and `data_processing_consent_id` link the message to both the recipient and the consent under which it was authorized. Message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` was sent to account `1` under consent `100` with a `pending` status, while message `6969416` to account `4` under consent `103` carries an `opted_out` status, illustrating how delivery outcomes can diverge even within the same consent framework.

**Table `cookie_identifiers`**

| id | cookie_id | cookie_name | purpose | expiry_date | is_third_party | user_session_id | created_at |
|---|---|---|---|---|---|---|---|
| 1 | 392479 | Regional Initiative | analytics | 2023-10-24 | true | 1 | 2025-01-01 00:14:00 |
| 2 | 6983 | Seasonal Model D | marketing | 2024-03-08 | false | 2 | 2025-02-06 03:14:00 |
| 3 | 19609505 | Integrated Cluster | session_management | 2025-08-19 | true | 3 | 2025-03-11 06:14:00 |
| 4 | 2106722 | Extended Review | preferences | 2022-01-03 | false | 4 | 2025-04-16 09:14:00 |

Cookie identifiers record the browser-level tracking tokens placed during user sessions. Each row has a surrogate `id`, a business `cookie_id`, and a `cookie_name` such as "Regional Initiative" or "Seasonal Model D." The `purpose` field classifies the cookie's function—`analytics`, `marketing`, `session_management`, or `preferences`—while `expiry_date` and `is_third_party` capture its lifecycle and trust boundary. The `user_session_id` foreign key ties each cookie to the session during which it was created, and `created_at` records the placement timestamp. Cookie `392479` ("Regional Initiative") is an analytics cookie placed during session `1`, marked as third-party with an expiry of 2023-10-24; cookie `6983` ("Seasonal Model D") is a first-party marketing cookie for session `2`, expiring on 2024-03-08.

## Account-to-Session Correlation

The relationship between accounts and sessions is the most direct join in the domain, and the view `vw_user_account_user_session` materializes it by joining `user_accounts` to `user_sessions` on the condition that `user_accounts.user_session_id = user_sessions.id`. This view answers the question: "Which session is currently associated with each account, and what are the session's network attributes?"

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

Reading the first row of the view, account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (email `primary-email-70`) is linked to session `1`, whose business `session_id` is `1186087` and whose IP address is `extended-ip-15`. The second row shows account `10207152` (email `adaptive-email-71`) associated with session `2` (business ID `2087748`, IP `integrated-ip-16`). The view preserves the account's `user_account_id`, `account_id`, `email_address`, and `password_hash` alongside the session's surrogate `id`, business `session_id`, and `ip_address`, providing a single-row-per-account summary of the current session context. This join is critical for security audits that need to correlate account activity with network-level evidence.

## Consent-to-Account Alignment

Compliance reporting requires a clear mapping between each account and its governing data processing consent. The view `vw_user_account_data_processing_consent` joins `user_accounts` to `data_processing_consents` on `user_accounts.data_processing_consent_id = data_processing_consents.id`, answering: "Under what legal basis is this account's data being processed, and has that consent been revoked?"

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

The first row reveals that account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (email `primary-email-70`) is governed by consent `100` (business ID `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`), which relies on the legal basis `consent` for the purpose "Pilot Series" and carries `is_revoked = true`. The second row shows account `10207152` (email `adaptive-email-71`) under consent `101` (business ID `790462`), based on `legitimate_interests` for "Baseline Assessment" with `is_revoked = false`. This view enables compliance officers to filter accounts by consent status, legal basis, or revocation flag, producing audit-ready reports without manual cross-referencing.

## Session-to-Account Rollup

While the account-to-session view answers which session belongs to an account, the reverse perspective—`vw_user_session_user_account`—answers which account owns a given session. This view joins `user_sessions` to `user_accounts` on `user_sessions.id = user_accounts.user_session_id`, producing a session-centric record that includes the account's identifying attributes.

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

The first row shows session `1` (business `session_id` `1186087`, IP `extended-ip-15`) is owned by account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` with email `primary-email-70`. The fourth row maps session `4` (business `session_id` `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`, IP `regional-ip-18`) to account `3717632` (email `baseline-email-73`). This orientation is useful for session-level dashboards that need to display account context alongside session telemetry, such as correlating a specific IP address with the account holder's email for fraud detection.

## Consent-to-Account Reverse Lookup

The view `vw_data_processing_consent_user_account` joins `data_processing_consents` to `user_accounts` on `data_processing_consents.id = user_accounts.data_processing_consent_id`, providing a consent-centric view that answers: "Which account is governed by this consent record?"

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

The first row shows consent `100` (business ID `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`, legal basis `consent`, purpose "Pilot Series") governs account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (email `primary-email-70`). The third row links consent `102` (business ID `4277037`, legal basis `performance_of_contract`, purpose "Distributed Survey A") to account `a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3` (email `distributed-email-72`). This perspective is valuable when auditing a specific consent record to verify which accounts it covers, particularly when assessing the scope of a revocation or a legal basis change.

## Marketing-to-Account Attribution

Marketing campaigns must be attributable to specific accounts, and the view `vw_marketing_communication_user_account` joins `marketing_communications` to `user_accounts` on `marketing_communications.user_account_id = user_accounts.user_account_id`, answering: "Which account received this marketing message, and what is the message's delivery outcome?"

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

The first row shows message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (subject `primary-subject-46`, sent 2023-10-21, status `pending`, campaign `regional-campaign-42`) was sent to account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` (email `primary-email-70`). The fourth row maps message `6969416` (subject `baseline-subject-49`, sent 2022-01-27, status `opted_out`, campaign `composite-campaign-45`) to account `3717632` (email `baseline-email-73`). This view supports campaign performance analysis by combining message-level metadata with account-level contact information, enabling marketers to correlate delivery outcomes with account attributes.

## Marketing-to-Consent Compliance

Not every marketing message is sent under a valid consent. The view `vw_marketing_communication_data_processing_consent` joins `marketing_communications` to `data_processing_consents` on `marketing_communications.data_processing_consent_id = data_processing_consents.id`, answering: "Under which consent was this message dispatched, and what is the consent's current compliance status?"

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

The first row shows message `ChIJD7fiBh9u5kcRYJSMaMOCCwQ` (subject `primary-subject-46`, status `pending`, campaign `regional-campaign-42`) was sent under consent `100` (business ID `9fffb746-9bac-11eb-a8a2-19ed5c03f8d3`, legal basis `consent`, purpose "Pilot Series", `is_revoked = true`). The fourth row maps message `6969416` (subject `baseline-subject-49`, status `opted_out`, campaign `composite-campaign-45`) to consent `103` (business ID `3990176`, legal basis `legal_obligations`, purpose "Adaptive Corridor", `is_revoked = false`). This view is essential for compliance audits: it reveals whether messages were dispatched under active consents or under revoked ones, flagging potential regulatory violations. The first row, for instance, shows a message sent under a revoked consent, which may require investigation.

## Cookie-to-Session Attribution

Cookies are session-scoped artifacts, and the view `vw_cookie_identifier_user_session` joins `cookie_identifiers` to `user_sessions` on `cookie_identifiers.user_session_id = user_sessions.id`, answering: "Which session placed this cookie, and what are the session's network and device attributes?"

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

The first row shows cookie `392479` ("Regional Initiative", purpose `analytics`, third-party, expiry 2023-10-24) was placed during session `1` (business `session_id` `1186087`, IP `extended-ip-15`). The third row maps cookie `19609505` ("Integrated Cluster", purpose `session_management`, third-party, expiry 2025-08-19) to session `3` (business `session_id` `4716414`, IP `seasonal-ip-17`). This view supports privacy audits by correlating cookie attributes with session-level network data, enabling analysts to assess whether third-party cookies were placed during sessions originating from specific IP ranges or geographic regions.

## Synthesis

The five base tables and seven views together form a coherent model of user lifecycle management. Accounts serve as the central entity, linked to sessions, consents, and marketing messages through foreign keys. Sessions provide the device and network context for account activity. Consents encode the legal basis for data processing, with revocation status that directly impacts marketing compliance. Marketing communications record the outbound messages dispatched to accounts, with delivery outcomes that reflect both technical success and user preference. Cookie identifiers capture the browser-level artifacts placed during sessions, with purpose and third-party status that inform privacy assessments. The views materialize the join paths between these entities, answering specific operational questions: which session belongs to which account, under what consent a message was sent, and which session placed a given cookie. Together, they enable compliance reporting, security auditing, campaign attribution, and privacy analysis without requiring ad hoc joins at query time.