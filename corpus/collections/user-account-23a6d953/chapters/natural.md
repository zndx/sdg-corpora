## Digital Engagement and Service Delivery

Organizations that deliver services through digital channels must track the full arc of user interaction—from initial account creation through browsing behavior, demographic context, and direct feedback. This domain captures every layer of that engagement: who the users are, how they navigate the platform, what services they encounter, and how they evaluate their experience. The records span six interconnected domains, each preserving a distinct facet of the relationship between the organization and its audience.

**Table `user_accounts`**

| id | account_id | email_address | full_name | home_address | work_address | telephone_number | account_status | date_created | session_id | survey_response_id | demographic_profile_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3 | primary-email-70 | Theodore Mcgrath | distributed-home-60 | compact-work-74 | TEL-2173 | active | 2024-11-08T10:54:00 | 1186087 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 10207152 | adaptive-email-71 | Account Name | baseline-home-61 | composite-work-75 | TEL-2177 | inactive | 2025-04-19T17:11:00 | 2087748 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | a4afb8ee-9bad-11eb-a8a2-19ed5c03f8d3 | distributed-email-72 | Saipan International Airport | pilot-home-62 | primary-work-76 | TEL-2181 | suspended | 2022-09-03T00:28:00 | 4716414 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 3717632 | baseline-email-73 | Norma Fisher | extended-home-63 | adaptive-work-77 | TEL-2185 | pending_verification | 2023-02-14T07:45:00 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

User accounts form the foundational identity layer. Each account carries a unique identifier, an email address, and a full name, alongside residential and work addresses that anchor the user geographically. Telephone numbers provide an additional contact channel. The account status field tracks the lifecycle state—active, inactive, suspended, or pending verification—allowing the organization to segment users by their current standing. Theodore Mcgrath (account `fbc33b0c-9bac-11eb-a8a2-19ed5c03f8d3`) holds an active status and was created on November 8, 2024, while Norma Fisher (account `3717632`) remains in pending verification as of February 2023. The timestamps `created_at` and `updated_at` record when the account was provisioned and last modified, providing an audit trail for account management.

**Table `web_sessions`**

| session_id | ip_address | browser_type | domain_name | access_timestamp | referring_url | session_duration_seconds | is_secure | user_account_id | cookie_record_id |
|---|---|---|---|---|---|---|---|---|---|
| 1186087 | extended-ip-15 | integrated-browser-76 | Regional Protocol | 2024-07-18T18:30:00 | https://flatiron.com/careers/engineering/28108 | 35 | false | 100 | 1000 |
| 2087748 | integrated-ip-16 | seasonal-browser-77 | Seasonal Programme D | 2025-12-02T01:47:00 | https://archive.org/details/CNNW_20180609_220000_Smerconish | 45 | true | 101 | 1001 |
| 4716414 | seasonal-ip-17 | regional-browser-78 | Integrated Standard | 2022-05-13T08:04:00 | http://eol.org/pages/330794/overview | 55 | false | 102 | 1002 |
| 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | regional-ip-18 | legacy-browser-79 | Extended Framework | 2023-10-24T15:21:00 | https://grants.nih.gov/grants/guide/pa-files/PAR-18-251.html | 65 | true | 103 | 1003 |

Web sessions capture the moment-to-moment interaction between a user and the platform. Each session is identified by a session ID, which may be a numeric token such as `1186087` or a UUID like `005588c4-9bac-11eb-a8a2-19ed5c03f8d3`. The IP address and browser type characterize the technical environment, while the domain name indicates which section of the platform was accessed—Regional Protocol, Seasonal Programme D, Integrated Standard, or Extended Framework. The referring URL preserves the entry point, whether a career page, an archive document, or a grants guide. Session duration in seconds ranges from 35 to 65 across the sample, and the `is_secure` flag distinguishes HTTPS connections from plain HTTP. Each session is tied to a specific user account, creating the bridge between identity and behavior.

**Table `demographic_profiles`**

| id | profile_id | zip_code | age_group | gender | primary_interest | favorite_category | is_anonymized | user_account_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 72623baa-9bad-11eb-a8a2-19ed5c03f8d3 | 69434 | integrated-age-22 | compact-gender-62 | compact-primary-32 | integrated-favorite-28 | true | 100 |
| 2 | d9d925ce-8fcc-11eb-924d-9cd76263cbd0 | 13589 | seasonal-age-23 | composite-gender-63 | composite-primary-33 | seasonal-favorite-29 | false | 101 |
| 3 | 10207150 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | regional-age-24 | primary-gender-64 | primary-primary-34 | regional-favorite-30 | true | 102 |
| 4 | 611506 | 1250214 | legacy-age-25 | adaptive-gender-65 | adaptive-primary-35 | legacy-favorite-31 | false | 103 |

Demographic profiles enrich the raw account data with audience segmentation attributes. The profile ID, zip code, age group, and gender fields construct a portrait of the user's background. Primary interest and favorite category reveal content preferences, while the `is_anonymized` flag indicates whether the profile has been stripped of personally identifiable information. Profile `72623baa-9bad-11eb-a8a2-19ed5c03f8d3` belongs to a user in zip code 69434 with an integrated age bracket and compact gender classification, marked as anonymized. In contrast, profile `d9d925ce-8fcc-11eb-924d-9cd76263cbd0` in zip code 13589 is not anonymized and carries a seasonal age group designation. These profiles are linked to user accounts, enabling the organization to analyze engagement patterns across demographic segments.

**Table `survey_responses`**

| id | response_id | survey_topic | rating_score | feedback_text | submission_date | is_anonymous | user_account_id | service_offering_id |
|---|---|---|---|---|---|---|---|---|
| 1 | ChIJr7cItPtt5kcRM6ry7ecIYgw | primary-survey-10 | 29 | legacy-feedback-61 | 2025-04-24T03:57:00 | true | 100 | 1 |
| 2 | 9736917 | adaptive-survey-11 | 35 | compact-feedback-62 | 2022-09-08T10:14:00 | false | 101 | 2 |
| 3 | 8189493 | distributed-survey-12 | 41 | composite-feedback-63 | 2023-02-19T17:31:00 | true | 102 | 3 |
| 4 | Invoice | baseline-survey-13 | 47 | primary-feedback-64 | 2024-07-03T00:48:00 | false | 103 | 4 |

Survey responses constitute the direct feedback channel between users and the organization. Each response carries a response ID—ranging from the alphanumeric `ChIJr7cItPtt5kcRM6ry7ecIYgw` to the simple numeric `9736917`—and is categorized by survey topic such as primary-survey-10 or adaptive-survey-11. The rating score, spanning from 29 to 47 in the sample data, quantifies the user's evaluation, while the feedback text provides qualitative context. Legacy-feedback-61 and compact-feedback-62 are representative entries. The `is_anonymous` flag controls whether the respondent's identity is preserved, and the submission date anchors the feedback in time. Each response is associated with both a user account and a service offering, creating a direct line from service delivery to user evaluation.

**Table `service_offerings`**

| id | service_id | service_name | service_type | is_current | is_potential | survey_response_id | session_id |
|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | housing_assistance | true | false | 1 | 1186087 |
| 2 | 3990164 | Adaptive Model D | maintenance | false | true | 2 | 2087748 |
| 3 | 5844258 | Primary Cluster | application | true | false | 3 | 4716414 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | informational | false | true | 4 | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 |

Service offerings represent the catalog of programs and initiatives that the organization delivers. Each offering has a service ID, a descriptive name such as Distributed Initiative or Adaptive Model D, and a service type—housing_assistance, maintenance, application, or informational. The `is_current` flag indicates whether the offering is actively available, while `is_potential` marks offerings under consideration for future deployment. Distributed Initiative, for example, is current but not potential, whereas Adaptive Model D is not current but is flagged as potential. Each service offering is linked to a survey response and a web session, connecting the service to both user feedback and the browsing context in which it was encountered.

**Table `cookie_records`**

| id | cookie_id | cookie_name | content_hash | expiration_date | is_essential | session_id | user_account_id |
|---|---|---|---|---|---|---|---|
| 1000 | 392479 | Regional Initiative | integrated-content-40 | 2025-08-18 | false | 1186087 | 100 |
| 1001 | 6983 | Seasonal Model D | seasonal-content-41 | 2022-01-02 | true | 2087748 | 101 |
| 1002 | 19609505 | Integrated Cluster | regional-content-42 | 2023-06-13 | false | 4716414 | 102 |
| 1003 | 2106722 | Extended Review | legacy-content-43 | 2024-11-24 | true | 005588c4-9bac-11eb-a8a2-19ed5c03f8d3 | 103 |

Cookie records document the tracking artifacts placed on user devices during sessions. Each cookie has a unique record ID, a cookie ID (such as `392479` or `6983`), and a cookie name like Regional Initiative or Seasonal Model D. The content hash—integrated-content-40, seasonal-content-41—serves as a fingerprint of the cookie's payload. The expiration date, ranging from 2022-01-02 to 2025-08-18, determines how long the cookie persists. The `is_essential` flag distinguishes cookies required for core functionality from those used for analytics or personalization. Each cookie record is associated with a specific web session and user account, completing the chain from device-level tracking to user identity.

### Cross-Domain Engagement Views

The platform provides a suite of joined views that synthesize these domains into actionable perspectives. Each view answers a specific analytical question by combining records across tables.

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

This view correlates user accounts with their web sessions, answering the question of which users accessed which sessions and under what conditions. Theodore Mcgrath's account maps to session `1186087`, which lasted 35 seconds on the Regional Protocol domain via an integrated browser. The joined record reveals that this session was not secure and originated from the Flatiron Engineering careers page, providing context for the user's visit.

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

By joining user accounts with survey responses, this view surfaces the feedback each user has submitted. Account `100` (Theodore Mcgrath) submitted response `ChIJr7cItPtt5kcRM6ry7ecIYgw` on primary-survey-10 with a rating of 29, marked as anonymous. Account `103` (Norma Fisher) submitted response `Invoice` on baseline-survey-13 with a rating of 47, which is non-anonymous. The view enables the organization to correlate user identity with satisfaction levels across survey topics.

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

This view links user accounts to their demographic profiles, enabling audience segmentation analysis. Account `100` is associated with profile `72623baa-9bad-11eb-a8a2-19ed5c03f8d3` in zip code 69434, classified as anonymized with an integrated age group and compact gender designation. Account `101` maps to profile `d9d925ce-8fcc-11eb-924d-9cd76263cbd0` in zip code 13589, which is not anonymized and carries a seasonal age group. The view supports targeted service delivery based on demographic characteristics.

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

This view inverts the relationship, presenting web sessions with their associated user account details. Session `2087748` is tied to account `10207152` (Account Name), which holds an inactive status. The session occurred on December 2, 2025, at 01:47 UTC, lasted 45 seconds, and was secured via HTTPS. The referring URL points to an archive.org document, suggesting the user arrived from an external research source. This perspective is useful for auditing session activity by account status.

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

This view connects web sessions to the cookies placed during those sessions. Session `4716414` is associated with cookie record `1002`, which carries the name Integrated Cluster and a content hash of regional-content-42. The cookie is not essential and expires on 2023-06-13. Session `005588c4-9bac-11eb-a8a2-19ed5c03f8d3` maps to cookie record `1003` (Extended Review, legacy-content-43), which is marked as essential and expires on 2024-11-24. This view supports cookie lifecycle management and compliance auditing.

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

This view presents demographic profiles alongside their linked user accounts, enabling reverse lookup from audience segment to identity. Profile `10207150` in zip code `9bb5fec0-8fcc-11eb-924d-9cd76263cbd0` is linked to account `102`, which holds a suspended status. The profile is anonymized and carries a regional age group with a primary gender classification. This perspective is valuable for verifying that anonymized profiles are correctly decoupled from identifiable account data.

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

This view pairs survey responses with their originating user accounts, providing a complete picture of feedback attribution. Response `8189493` on distributed-survey-12 received a rating of 41 and was submitted by account `102` (Saipan International Airport). The response is anonymous and contains the feedback text composite-feedback-63. Response `Invoice` on baseline-survey-13, rated 47, was submitted by account `103` (Norma Fisher) and is non-anonymous. The view supports both aggregated satisfaction analysis and individual follow-up.

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

This view links survey responses to the service offerings they evaluate, answering which services received which feedback. Response `ChIJr7cItPtt5kcRM6ry7ecIYgw` (rating 29) is associated with service offering `1996925` (Distributed Initiative, housing_assistance type). Response `9736917` (rating 35) corresponds to service offering `3990164` (Adaptive Model D, maintenance type). This view enables the organization to identify which services are underperforming and which are meeting user expectations.

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

This view inverts the relationship, presenting service offerings with their associated survey responses. Distributed Initiative (service ID `1996925`, type housing_assistance, currently active) is linked to response `ChIJr7cItPtt5kcRM6ry7ecIYgw` with a rating of 29. Composite Review (service ID `e29bafe2-8fd1-11eb-924d-9cd76263cbd0`, type informational, not current but potential) is linked to response `Invoice` with a rating of 47. This perspective helps service managers understand the feedback landscape for each offering.

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

This view connects service offerings to the web sessions in which they were encountered. Distributed Initiative (service ID `1996925`) is associated with session `1186087`, which lasted 35 seconds and was not secure. Adaptive Model D (service ID `3990164`) is linked to session `2087748`, a 45-second HTTPS session on the Seasonal Programme D domain. This view reveals the browsing context surrounding service exposure, informing decisions about service placement and presentation.

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

This view maps cookie records to their parent web sessions, supporting tracking compliance and lifecycle analysis. Cookie record `1000` (Regional Initiative, cookie ID `392479`) is tied to session `1186087` and is not essential. Cookie record `1001` (Seasonal Model D, cookie ID `6983`) is tied to session `2087748` and is marked as essential. The view enables the organization to audit which cookies were active during which sessions and whether essential cookies were properly classified.

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

This view links cookie records directly to user accounts, providing a user-centric view of tracking artifacts. Cookie record `1000` (Regional Initiative) is associated with account `100` (Theodore Mcgrath), while cookie record `1003` (Extended Review) is associated with account `103` (Norma Fisher). Each cookie carries its expiration date and essentiality flag, allowing the organization to manage consent and data retention at the user level.

### Synthesis

The six base tables and twelve joined views together form a comprehensive framework for understanding digital engagement. User accounts establish identity, web sessions capture behavior, demographic profiles provide context, survey responses deliver feedback, service offerings define the catalog, and cookie records track device-level artifacts. The views synthesize these domains into specific analytical lenses—correlating identity with behavior, feedback with service quality, and tracking with compliance. Together, they enable the organization to operate with visibility into every layer of the user journey, from first visit through sustained engagement and direct evaluation.