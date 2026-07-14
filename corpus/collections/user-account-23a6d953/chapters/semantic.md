## Ontology-Grounded Relational Modelling: User Accounts, Sessions, and Service Feedback

The domain under examination captures the lifecycle of a digital service platform where individual users register accounts, browse the site across multiple sessions, submit structured feedback about services, and leave behind persistent browser cookies. The ontology distinguishes six entity types: `user_accounts`, `web_sessions`, `demographic_profiles`, `survey_responses`, `service_offerings`, and `cookie_records`. Each entity type materialises as a base table whose primary key anchors a set of attributes, while foreign keys encode the cardinality-bounded relationships that the ontology prescribes. The twelve views then reconstitute domain facts by joining these normalised tables back together, answering analytical questions that span the boundary between two entity types.

**Table `user_accounts`**

| id | account_id | email_address | full_name | home_address | work_address | telephone_number | account_status | date_created | session_id | survey_response_id | demographic_profile_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 | Theodore Mcgrath | distributed-home-60 | compact-work-74 | TEL-2173 | active | 2024-11-08T10:54:00 | 1186087 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 10207152 | adaptive-email-71 | Account Name | baseline-home-61 | composite-work-75 | TEL-2177 | inactive | 2025-04-19T17:11:00 | 2087748 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 | Saipan International Airport | pilot-home-62 | primary-work-76 | TEL-2181 | suspended | 2022-09-03T00:28:00 | 4716414 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 3717632 | baseline-email-73 | Norma Fisher | extended-home-63 | adaptive-work-77 | TEL-2185 | pending_verification | 2023-02-14T07:45:00 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `user_accounts` table is the central hub of the schema. Its surrogate primary key `id` is an integer (100–103 in the sample), while the business-level `account_id` carries either a UUID such as `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3` or a short numeric code like `10207152`. Descriptive columns — `email_address` (e.g. `primary-email-70`), `full_name` (e.g. `Theodore Mcgrath`), `home_address` (e.g. `distributed-home-60`), `work_address` (e.g. `compact-work-74`), and `telephone_number` (e.g. `TEL-2173`) — store the user's contact information. The `account_status` column constrains values to the finite set {`active`, `inactive`, `suspended`, `pending_verification`}, and `date_created` records the registration timestamp. Audit columns `created_at` and `updated_at` track row-level modification history. Crucially, `user_accounts` also carries three foreign-key columns — `session_id`, `survey_response_id`, and `demographic_profile_id` — that point into `web_sessions`, `survey_responses`, and `demographic_profiles` respectively, establishing a one-to-one or one-to-many relationship from the user account outward to each of those entities. In the sample, row 100 links to session `1186087`, survey response `1`, and demographic profile `1`.

**Table `web_sessions`**

| session_id | ip_address | browser_type | domain_name | access_timestamp | referring_url | session_duration_seconds | is_secure | user_account_id | cookie_record_id |
|---|---|---|---|---|---|---|---|---|---|
| 1186087 | extended-ip-15 | integrated-browser-76 | Regional Protocol | 2024-07-18T18:30:00 | https://flatiron.com/careers/engineering/28108 | 35 | false | 100 | 1000 |
| 2087748 | integrated-ip-16 | seasonal-browser-77 | Seasonal Programme D | 2025-12-02T01:47:00 | https://archive.org/details/CNNW_20180609_220000_Smerconish | 45 | true | 101 | 1001 |
| 4716414 | seasonal-ip-17 | regional-browser-78 | Integrated Standard | 2022-05-13T08:04:00 | http://eol.org/pages/330794/overview | 55 | false | 102 | 1002 |
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-browser-79 | Extended Framework | 2023-10-24T15:21:00 | https://grants.nih.gov/grants/guide/pa-files/PAR-18-251.html | 65 | true | 103 | 1003 |

The `web_sessions` table records each browsing episode. Its primary key `session_id` is a mixed-type column: numeric values like `1186087` coexist with UUIDs such as `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`. Attributes capture the technical context of the visit — `ip_address` (e.g. `extended-ip-15`), `browser_type` (e.g. `integrated-browser-76`), `domain_name` (e.g. `Regional Protocol`), `access_timestamp` (e.g. `2024-07-18T18:30:00`), `referring_url` (e.g. `https://flatiron.com/careers/engineering/28108`), `session_duration_seconds` (35–65 in the sample), and `is_secure` (a boolean). The foreign key `user_account_id` binds each session to exactly one user account (values 100–103), while `cookie_record_id` points to the cookie that was active during the session. This table thus sits at the intersection of user identity, browsing behaviour, and tracking infrastructure.

**Table `demographic_profiles`**

| id | profile_id | zip_code | age_group | gender | primary_interest | favorite_category | is_anonymized | user_account_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 69434 | integrated-age-22 | compact-gender-62 | compact-primary-32 | integrated-favorite-28 | true | 100 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 13589 | seasonal-age-23 | composite-gender-63 | composite-primary-33 | seasonal-favorite-29 | false | 101 |
| 3 | 10207150 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | regional-age-24 | primary-gender-64 | primary-primary-34 | regional-favorite-30 | true | 102 |
| 4 | 611506 | 1250214 | legacy-age-25 | adaptive-gender-65 | adaptive-primary-35 | legacy-favorite-31 | false | 103 |

`demographic_profiles` stores the user's self-reported or inferred demographic attributes. Its surrogate key `id` (1–4) maps to a business `profile_id` that is itself a UUID or numeric code. The columns `zip_code`, `age_group`, `gender`, `primary_interest`, and `favorite_category` hold categorical values such as `integrated-age-22`, `compact-gender-62`, and `integrated-favorite-28`. The boolean `is_anonymized` flag indicates whether the profile has been stripped of re-identifiable information. The foreign key `user_account_id` enforces a one-to-one relationship with `user_accounts`, ensuring each user account has at most one demographic profile.

**Table `survey_responses`**

| id | response_id | survey_topic | rating_score | feedback_text | submission_date | is_anonymous | user_account_id | service_offering_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | primary-survey-10 | 29 | legacy-feedback-61 | 2025-04-24T03:57:00 | true | 100 | 1 |
| 2 | 9736917 | adaptive-survey-11 | 35 | compact-feedback-62 | 2022-09-08T10:14:00 | false | 101 | 2 |
| 3 | 8189493 | distributed-survey-12 | 41 | composite-feedback-63 | 2023-02-19T17:31:00 | true | 102 | 3 |
| 4 | Invoice | baseline-survey-13 | 47 | primary-feedback-64 | 2024-07-03T00:48:00 | false | 103 | 4 |

The `survey_responses` table captures structured feedback submitted by users. Its surrogate key `id` (1–4) pairs with a business `response_id` that may be a UUID (`ChIJr7cItPtt5kcRM6ry7ecIYgw`), a numeric string (`9736917`), or even a text token (`Invoice`). The columns `survey_topic` (e.g. `primary-survey-10`), `rating_score` (29–47), `feedback_text` (e.g. `legacy-feedback-61`), `submission_date`, and `is_anonymous` describe the content of the response. Two foreign keys anchor this table: `user_account_id` links the response to the submitting user, and `service_offering_id` links it to the service that was evaluated. This dual foreign-key design means `survey_responses` acts as a junction entity between users and services, enabling many-to-many relationships to be materialised in third normal form.

**Table `service_offerings`**

| id | service_id | service_name | service_type | is_current | is_potential | survey_response_id | session_id |
|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | housing_assistance | true | false | 1 | 1186087 |
| 2 | 3990164 | Adaptive Model D | maintenance | false | true | 2 | 2087748 |
| 3 | 5844258 | Primary Cluster | application | true | false | 3 | 4716414 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | informational | false | true | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |

`service_offerings` describes the catalog of services available on the platform. Its surrogate key `id` (1–4) maps to a business `service_id` (numeric or UUID). The columns `service_name` (e.g. `Distributed Initiative`), `service_type` (constrained to {`housing_assistance`, `maintenance`, `application`, `informational`}), and two boolean flags `is_current` and `is_potential` classify each offering. The foreign key `survey_response_id` points back to the survey response that referenced this service, while `session_id` records the web session during which the service was encountered. This bidirectional linkage — from service to survey response and from service to web session — means the table participates in relationships with two other entity types.

**Table `cookie_records`**

| id | cookie_id | cookie_name | content_hash | expiration_date | is_essential | session_id | user_account_id |
|---|---|---|---|---|---|---|---|
| 1000 | 392479 | Regional Initiative | integrated-content-40 | 2025-08-18 | false | 1186087 | 100 |
| 1001 | 6983 | Seasonal Model D | seasonal-content-41 | 2022-01-02 | true | 2087748 | 101 |
| 1002 | 19609505 | Integrated Cluster | regional-content-42 | 2023-06-13 | false | 4716414 | 102 |
| 1003 | 2106722 | Extended Review | legacy-content-43 | 2024-11-24 | true | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 103 |

`cookie_records` stores the persistent browser cookies placed during user sessions. Its surrogate key `id` (1000–1003) maps to a business `cookie_id` (numeric, e.g. `392479`). The columns `cookie_name` (e.g. `Regional Initiative`), `content_hash` (e.g. `integrated-content-40`), `expiration_date`, and `is_essential` describe the cookie's properties. Two foreign keys — `session_id` and `user_account_id` — bind each cookie to the session in which it was set and to the user account it belongs to, respectively. This dual foreign-key design mirrors the structure of `web_sessions` and ensures referential integrity across the tracking layer.

### Materialising Relationships as Foreign Keys

The schema encodes cardinality-bounded relationships through foreign keys embedded in the base tables. The most prominent pattern is the one-to-many relationship from `user_accounts` to `web_sessions`: each row in `web_sessions` carries a `user_account_id` that references exactly one row in `user_accounts`, while a single user account may appear in multiple session rows. Similarly, `demographic_profiles.user_account_id` enforces a one-to-one or one-to-zero relationship, and `survey_responses.user_account_id` allows a user to submit multiple survey responses. The `survey_responses` table is unique in carrying two foreign keys (`user_account_id` and `service_offering_id`), which materialises the many-to-many relationship between users and services through the survey response entity. The `service_offerings` table reciprocates with its own `survey_response_id` foreign key, creating a bidirectional link that allows navigation from service to response and back. Finally, `cookie_records` and `web_sessions` each carry foreign keys to the other, forming a tightly coupled pair that tracks the cookie-to-session-to-user chain.

### View-Based Reconstitution of Domain Facts

The twelve views each answer a specific analytical question by joining two base tables along their shared foreign key. They do not introduce new data; they merely reassemble normalised rows into a denormalised fact that is immediately readable.

**View `v_user_account_web_session`**

```sql
CREATE VIEW v_user_account_web_session AS
SELECT a.id, a.account_id, a.email_address, a.full_name, b.session_id AS session_session_id, b.ip_address AS session_ip_address, b.browser_type AS session_browser_type
FROM user_accounts a JOIN web_sessions b ON a.session_id = b.session_id;
```

| id | account_id | email_address | full_name | session_session_id | session_ip_address | session_browser_type |
|---|---|---|---|---|---|---|
| 100 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 | Theodore Mcgrath | 1186087 | extended-ip-15 | integrated-browser-76 |
| 101 | 10207152 | adaptive-email-71 | Account Name | 2087748 | integrated-ip-16 | seasonal-browser-77 |
| 102 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 | Saipan International Airport | 4716414 | seasonal-ip-17 | regional-browser-78 |
| 103 | 3717632 | baseline-email-73 | Norma Fisher | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-browser-79 |

The view `v_user_account_web_session` joins `user_accounts` to `web_sessions` on `user_accounts.session_id = web_sessions.session_id`. It answers the question: "Which web session did a given user account initiate, and what were the technical characteristics of that session?" Reading row 100 as evidence, the view would present `Theodore Mcgrath` (email `primary-email-70`, status `active`) alongside session `1186087` (IP `extended-ip-15`, browser `integrated-browser-76`, duration 35 seconds, non-secure). This view is the primary lens for correlating user identity with browsing behaviour.

**View `v_user_account_survey_response`**

```sql
CREATE VIEW v_user_account_survey_response AS
SELECT a.id, a.account_id, a.email_address, a.full_name, b.id AS response_id, b.response_id AS response_response_id, b.survey_topic AS response_survey_topic
FROM user_accounts a JOIN survey_responses b ON a.survey_response_id = b.id;
```

| id | account_id | email_address | full_name | response_id | response_response_id | response_survey_topic |
|---|---|---|---|---|---|---|
| 100 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 | Theodore Mcgrath | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | primary-survey-10 |
| 101 | 10207152 | adaptive-email-71 | Account Name | 2 | 9736917 | adaptive-survey-11 |
| 102 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 | Saipan International Airport | 3 | 8189493 | distributed-survey-12 |
| 103 | 3717632 | baseline-email-73 | Norma Fisher | 4 | Invoice | baseline-survey-13 |

`v_user_account_survey_response` joins `user_accounts` to `survey_responses` on `user_accounts.id = survey_responses.user_account_id`. It answers: "What survey feedback did a user submit, and what was the rating?" Row 100 in the sample maps to survey response `ChIJr7cItPtt5kcRM6ry7ecIYgw` on topic `primary-survey-10` with a rating of 29 and feedback text `legacy-feedback-61`, submitted on `2025-04-24T03:57:00` and marked anonymous. This view enables direct analysis of user satisfaction by user.

**View `v_user_account_demographic_profile`**

```sql
CREATE VIEW v_user_account_demographic_profile AS
SELECT a.id, a.account_id, a.email_address, a.full_name, b.id AS profile_id, b.profile_id AS profile_profile_id, b.zip_code AS profile_zip_code
FROM user_accounts a JOIN demographic_profiles b ON a.demographic_profile_id = b.id;
```

| id | account_id | email_address | full_name | profile_id | profile_profile_id | profile_zip_code |
|---|---|---|---|---|---|---|
| 100 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 | Theodore Mcgrath | 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 69434 |
| 101 | 10207152 | adaptive-email-71 | Account Name | 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 13589 |
| 102 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 | Saipan International Airport | 3 | 10207150 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 103 | 3717632 | baseline-email-73 | Norma Fisher | 4 | 611506 | 1250214 |

`v_user_account_demographic_profile` joins `user_accounts` to `demographic_profiles` on `user_accounts.id = demographic_profiles.user_account_id`. It answers: "What are the demographic attributes of a user?" Row 100 maps to profile `72623baa-9bad-11eb-a8a2-19ed5c03f8d3` with zip code `69434`, age group `integrated-age-22`, gender `compact-gender-62`, primary interest `compact-primary-32`, favorite category `integrated-favorite-28`, and `is_anonymized = true`. This view supports demographic segmentation of the user base.

**View `v_web_session_user_account`**

```sql
CREATE VIEW v_web_session_user_account AS
SELECT a.session_id, a.ip_address, a.browser_type, a.domain_name, b.id AS account_id, b.account_id AS account_account_id, b.email_address AS account_email_address
FROM web_sessions a JOIN user_accounts b ON a.user_account_id = b.id;
```

| session_id | ip_address | browser_type | domain_name | account_id | account_account_id | account_email_address |
|---|---|---|---|---|---|---|
| 1186087 | extended-ip-15 | integrated-browser-76 | Regional Protocol | 100 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 |
| 2087748 | integrated-ip-16 | seasonal-browser-77 | Seasonal Programme D | 101 | 10207152 | adaptive-email-71 |
| 4716414 | seasonal-ip-17 | regional-browser-78 | Integrated Standard | 102 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 |
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-browser-79 | Extended Framework | 103 | 3717632 | baseline-email-73 |

`v_web_session_user_account` performs the inverse join of `v_user_account_web_session`, joining `web_sessions` to `user_accounts` on `web_sessions.user_account_id = user_accounts.id`. It answers: "Which user account owns this web session, and what are the account's descriptive attributes?" Row `1186087` in the sample resolves to user account 100 (`Theodore Mcgrath`, email `primary-email-70`, status `active`). This view is useful when the analyst starts from session-level telemetry and needs to enrich it with user identity.

**View `v_web_session_cookie_record`**

```sql
CREATE VIEW v_web_session_cookie_record AS
SELECT a.session_id, a.ip_address, a.browser_type, a.domain_name, b.id AS record_id, b.cookie_id AS record_cookie_id, b.cookie_name AS record_cookie_name
FROM web_sessions a JOIN cookie_records b ON a.cookie_record_id = b.id;
```

| session_id | ip_address | browser_type | domain_name | record_id | record_cookie_id | record_cookie_name |
|---|---|---|---|---|---|---|
| 1186087 | extended-ip-15 | integrated-browser-76 | Regional Protocol | 1000 | 392479 | Regional Initiative |
| 2087748 | integrated-ip-16 | seasonal-browser-77 | Seasonal Programme D | 1001 | 6983 | Seasonal Model D |
| 4716414 | seasonal-ip-17 | regional-browser-78 | Integrated Standard | 1002 | 19609505 | Integrated Cluster |
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-browser-79 | Extended Framework | 1003 | 2106722 | Extended Review |

`v_web_session_cookie_record` joins `web_sessions` to `cookie_records` on `web_sessions.cookie_record_id = cookie_records.id`. It answers: "Which cookie was active during this session, and is it essential?" Row `1186087` maps to cookie record 1000 (`cookie_name = Regional Initiative`, `content_hash = integrated-content-40`, `expiration_date = 2025-08-18`, `is_essential = false`). This view supports cookie compliance auditing by revealing which non-essential cookies were placed during each session.

**View `v_demographic_profile_user_account`**

```sql
CREATE VIEW v_demographic_profile_user_account AS
SELECT a.id, a.profile_id, a.zip_code, a.age_group, b.id AS account_id, b.account_id AS account_account_id, b.email_address AS account_email_address
FROM demographic_profiles a JOIN user_accounts b ON a.user_account_id = b.id;
```

| id | profile_id | zip_code | age_group | account_id | account_account_id | account_email_address |
|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 69434 | integrated-age-22 | 100 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 13589 | seasonal-age-23 | 101 | 10207152 | adaptive-email-71 |
| 3 | 10207150 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | regional-age-24 | 102 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 |
| 4 | 611506 | 1250214 | legacy-age-25 | 103 | 3717632 | baseline-email-73 |

`v_demographic_profile_user_account` joins `demographic_profiles` to `user_accounts` on `demographic_profiles.user_account_id = user_accounts.id`. It answers: "Which user account is associated with this demographic profile?" Row 1 in the sample resolves to user account 100 (`Theodore Mcgrath`, email `primary-email-70`). This view is the inverse of `v_user_account_demographic_profile` and is useful when demographic analysis starts from the profile side.

**View `v_survey_response_user_account`**

```sql
CREATE VIEW v_survey_response_user_account AS
SELECT a.id, a.response_id, a.survey_topic, a.rating_score, b.id AS account_id, b.account_id AS account_account_id, b.email_address AS account_email_address
FROM survey_responses a JOIN user_accounts b ON a.user_account_id = b.id;
```

| id | response_id | survey_topic | rating_score | account_id | account_account_id | account_email_address |
|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | primary-survey-10 | 29 | 100 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 |
| 2 | 9736917 | adaptive-survey-11 | 35 | 101 | 10207152 | adaptive-email-71 |
| 3 | 8189493 | distributed-survey-12 | 41 | 102 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 |
| 4 | Invoice | baseline-survey-13 | 47 | 103 | 3717632 | baseline-email-73 |

`v_survey_response_user_account` joins `survey_responses` to `user_accounts` on `survey_responses.user_account_id = user_accounts.id`. It answers: "Which user submitted this survey response?" Row 1 (`response_id = ChIJr7cItPtt5kcRM6ry7ecIYgw`, topic `primary-survey-10`, rating 29) resolves to user account 100 (`Theodore Mcgrath`, status `active`). This view supports feedback attribution and user-level satisfaction roll-ups.

**View `v_survey_response_service_offering`**

```sql
CREATE VIEW v_survey_response_service_offering AS
SELECT a.id, a.response_id, a.survey_topic, a.rating_score, b.id AS offering_id, b.service_id AS offering_service_id, b.service_name AS offering_service_name
FROM survey_responses a JOIN service_offerings b ON a.service_offering_id = b.id;
```

| id | response_id | survey_topic | rating_score | offering_id | offering_service_id | offering_service_name |
|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | primary-survey-10 | 29 | 1 | 1996925 | Distributed Initiative |
| 2 | 9736917 | adaptive-survey-11 | 35 | 2 | 3990164 | Adaptive Model D |
| 3 | 8189493 | distributed-survey-12 | 41 | 3 | 5844258 | Primary Cluster |
| 4 | Invoice | baseline-survey-13 | 47 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

`v_survey_response_service_offering` joins `survey_responses` to `service_offerings` on `survey_responses.service_offering_id = service_offerings.id`. It answers: "Which service offering was evaluated in this survey response?" Row 1 maps to service offering 1 (`service_name = Distributed Initiative`, `service_type = housing_assistance`, `is_current = true`). This view is critical for service-level quality analysis, as it links feedback directly to the service being rated.

**View `v_service_offering_survey_response`**

```sql
CREATE VIEW v_service_offering_survey_response AS
SELECT a.id, a.service_id, a.service_name, a.service_type, b.id AS response_id, b.response_id AS response_response_id, b.survey_topic AS response_survey_topic
FROM service_offerings a JOIN survey_responses b ON a.survey_response_id = b.id;
```

| id | service_id | service_name | service_type | response_id | response_response_id | response_survey_topic |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | housing_assistance | 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | primary-survey-10 |
| 2 | 3990164 | Adaptive Model D | maintenance | 2 | 9736917 | adaptive-survey-11 |
| 3 | 5844258 | Primary Cluster | application | 3 | 8189493 | distributed-survey-12 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | informational | 4 | Invoice | baseline-survey-13 |

`v_service_offering_survey_response` performs the inverse join of `v_survey_response_service_offering`, joining `service_offerings` to `survey_responses` on `service_offerings.survey_response_id = survey_responses.id`. It answers: "Which survey response referenced this service offering?" Row 1 (`Distributed Initiative`, type `housing_assistance`) resolves to survey response 1 (`ChIJr7cItPtt5kcRM6ry7ecIYgw`, rating 29). This view supports the reverse navigation from service catalog to user feedback.

**View `v_service_offering_web_session`**

```sql
CREATE VIEW v_service_offering_web_session AS
SELECT a.id, a.service_id, a.service_name, a.service_type, b.session_id AS session_session_id, b.ip_address AS session_ip_address, b.browser_type AS session_browser_type
FROM service_offerings a JOIN web_sessions b ON a.session_id = b.session_id;
```

| id | service_id | service_name | service_type | session_session_id | session_ip_address | session_browser_type |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | housing_assistance | 1186087 | extended-ip-15 | integrated-browser-76 |
| 2 | 3990164 | Adaptive Model D | maintenance | 2087748 | integrated-ip-16 | seasonal-browser-77 |
| 3 | 5844258 | Primary Cluster | application | 4716414 | seasonal-ip-17 | regional-browser-78 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | informational | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-browser-79 |

`v_service_offering_web_session` joins `service_offerings` to `web_sessions` on `service_offerings.session_id = web_sessions.session_id`. It answers: "During which web session was this service offering encountered?" Row 1 (`Distributed Initiative`) maps to session `1186087` (IP `extended-ip-15`, browser `integrated-browser-76`, duration 35 seconds). This view enables attribution of service exposure to specific browsing sessions.

**View `v_cookie_record_web_session`**

```sql
CREATE VIEW v_cookie_record_web_session AS
SELECT a.id, a.cookie_id, a.cookie_name, a.content_hash, b.session_id AS session_session_id, b.ip_address AS session_ip_address, b.browser_type AS session_browser_type
FROM cookie_records a JOIN web_sessions b ON a.session_id = b.session_id;
```

| id | cookie_id | cookie_name | content_hash | session_session_id | session_ip_address | session_browser_type |
|---|---|---|---|---|---|---|
| 1000 | 392479 | Regional Initiative | integrated-content-40 | 1186087 | extended-ip-15 | integrated-browser-76 |
| 1001 | 6983 | Seasonal Model D | seasonal-content-41 | 2087748 | integrated-ip-16 | seasonal-browser-77 |
| 1002 | 19609505 | Integrated Cluster | regional-content-42 | 4716414 | seasonal-ip-17 | regional-browser-78 |
| 1003 | 2106722 | Extended Review | legacy-content-43 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-browser-79 |

`v_cookie_record_web_session` joins `cookie_records` to `web_sessions` on `cookie_records.session_id = web_sessions.session_id`. It answers: "Which web session was this cookie associated with?" Row 1000 (`Regional Initiative`, `is_essential = false`) maps to session `1186087` (browser `integrated-browser-76`, duration 35 seconds). This view supports session-level cookie auditing.

**View `v_cookie_record_user_account`**

```sql
CREATE VIEW v_cookie_record_user_account AS
SELECT a.id, a.cookie_id, a.cookie_name, a.content_hash, b.id AS account_id, b.account_id AS account_account_id, b.email_address AS account_email_address
FROM cookie_records a JOIN user_accounts b ON a.user_account_id = b.id;
```

| id | cookie_id | cookie_name | content_hash | account_id | account_account_id | account_email_address |
|---|---|---|---|---|---|---|
| 1000 | 392479 | Regional Initiative | integrated-content-40 | 100 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 |
| 1001 | 6983 | Seasonal Model D | seasonal-content-41 | 101 | 10207152 | adaptive-email-71 |
| 1002 | 19609505 | Integrated Cluster | regional-content-42 | 102 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 |
| 1003 | 2106722 | Extended Review | legacy-content-43 | 103 | 3717632 | baseline-email-73 |

`v_cookie_record_user_account` joins `cookie_records` to `user_accounts` on `cookie_records.user_account_id = user_accounts.id`. It answers: "Which user account owns this cookie record?" Row 1000 (`Regional Initiative`) resolves to user account 100 (`Theodore Mcgrath`, email `primary-email-70`, status `active`). This view enables user-level cookie tracking and consent management.

### Synthesis

The schema models a digital service platform through six base tables whose primary keys anchor entity-specific attributes and whose foreign keys encode the cardinality-bounded relationships prescribed by the domain ontology. The `user_accounts` table serves as the central hub, with foreign keys radiating outward to `web_sessions`, `survey_responses`, and `demographic_profiles`. The `survey_responses` table additionally bridges users and services through its dual foreign keys, materialising a many-to-many relationship in third normal form. The twelve views reconstitute domain facts by joining pairs of base tables along their shared keys, each view answering a specific analytical question — from correlating user identity with browsing behaviour (`v_user_account_web_session`) to attributing service feedback to individual ratings (`v_survey_response_service_offering`). The result is a normalised schema that preserves data integrity through foreign key constraints while providing denormalised analytical lenses through its views.