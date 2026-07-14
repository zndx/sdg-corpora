## Domain Modelling and Relational Materialization

The insurance application domain captures the lifecycle of organizational risk management: entities form, appoint officers with defined roles, host events, secure coverage policies, submit applications, and file claims. The ontology distinguishes eight core entity types—`organizations`, `officers`, `officer_roles`, `events`, `coverage_policies`, `claim_records`, `participants`, and `insurance_applications`—alongside two associative junction tables that resolve many-to-many relationships. Every entity materializes as a relational table with a primary key, typed attributes, and foreign keys that encode referential integrity. Views then reassemble normalized rows into domain-level facts through controlled joins.

**Table `organizations`**

| id | organization_id | official_name | license_number | formation_date | chartered_state | headquarters_address | telephone_number | fax_number | has_coach_instruction_program | has_injury_control_program | officer_id | insurance_application_id | event_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Shell Oil | Extended Review | LIC-2589 | 2023-10-24 | composite-chartere-75 | baseline-headquar-43 | TEL-2173 | FAX-2047 | true | true | 1 | 1 | 1 |
| 101 | GlobalPlatform Inc. | Pilot Initiative A | LIC-2596 | 2024-03-08 | primary-chartere-76 | pilot-headquar-44 | TEL-2177 | FAX-2049 | false | false | 2 | 2 | 2 |
| 102 | Whatsapp Inc. | Baseline Model | LIC-2603 | 2025-08-19 | adaptive-chartere-77 | extended-headquar-45 | TEL-2181 | FAX-2051 | true | true | 3 | 3 | 3 |
| 103 | American Institutes for Research | Distributed Cluster | LIC-2610 | 2022-01-03 | distributed-chartere-78 | integrated-headquar-46 | TEL-2185 | FAX-2053 | false | false | 4 | 4 | 4 |

The `organizations` table anchors the domain. Each row represents a legal entity identified by a surrogate `id` (e.g., `100` for Shell Oil) and a business `organization_id` (e.g., `100`). The `official_name` column carries the registered name—"Extended Review" for Shell Oil, "Pilot Initiative A" for GlobalPlatform Inc.—while `license_number` (LIC-2589 through LIC-2610) and `formation_date` (ranging from 2022-01-03 to 2025-08-19) capture statutory metadata. The `headquarters_address` column stores location identifiers such as `baseline-headquar-43`, and boolean flags `has_coach_instruction_program` and `has_injury_control_program` indicate programmatic capabilities. Foreign keys `officer_id`, `insurance_application_id`, and `event_id` link each organization to its primary officer, its application, and its associated event, respectively.

**Table `officers`**

| id | officer_id | full_name | role_title | appointment_date | is_insurance_coordinator | organization_id | role_code |
|---|---|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Distributed Standard | 2022-05-03 | true | 100 | 6969430 |
| 2 | 2933464 | Account Name | Adaptive Framework D | 2023-10-14 | false | 101 | lu_tax_code_template_m16 |
| 3 | 10445622 | Saipan International Airport | Primary Protocol | 2024-03-25 | true | 102 | 3158154 |
| 4 | 7441150 | Norma Fisher | Composite Programme | 2025-08-09 | false | 103 | 39800616 |

The `officers` table models individual persons or entities appointed to governance positions. The surrogate `id` (1–4) maps to a business `officer_id` (e.g., `103165` for Theodore Mcgrath). The `full_name` column holds the person's name, while `role_title` (e.g., "Distributed Standard", "Adaptive Framework D") describes the position in natural language. The `appointment_date` (2022-05-03 through 2025-08-09) records when the appointment took effect. The boolean `is_insurance_coordinator` flag distinguishes coordinators (true for Theodore Mcgrath and Saipan International Airport) from non-coordinators. The `organization_id` foreign key binds each officer to their employing organization, and `role_code` references the `officer_roles` table.

**Table `officer_roles`**

| role_code | role_name | is_executive | requires_insurance_training | created_at | updated_at |
|---|---|---|---|---|---|
| 6969430 | Seasonal Programme | false | true | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| lu_tax_code_template_m16 | Integrated Standard | true | false | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3158154 | Extended Framework D | false | true | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 39800616 | Pilot Protocol | true | false | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `officer_roles` table defines the taxonomy of governance roles. Each row is keyed by `role_code` (e.g., `6969430`, `lu_tax_code_template_m16`) and carries a human-readable `role_name` such as "Seasonal Programme" or "Integrated Standard". The boolean `is_executive` flag marks executive-level positions (true for "Integrated Standard" and "Pilot Protocol"), while `requires_insurance_training` indicates whether the role mandates training (true for "Seasonal Programme" and "Extended Framework D"). Timestamps `created_at` and `updated_at` track the role's lifecycle. The cardinality is bounded: each officer references exactly one role, and each role may be held by multiple officers.

**Table `events`**

| event_id | event_name | location_name | estimated_date | expected_attendance | is_minor_participant_event | coverage_requested | organization_id | coverage_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | Legacy Review D | 2022-09-01 | 15 | false | baseline-coverage-55 | 100 | 100 |
| 2 | Integrated Framework | Regional Initiative | 2023-02-12 | 21 | true | pilot-coverage-56 | 101 | 101 |
| 3 | Extended Protocol D | Seasonal Model | 2024-07-23 | 27 | false | extended-coverage-57 | 102 | 102 |
| 4 | Pilot Programme | Integrated Cluster A | 2025-12-07 | 33 | true | integrated-coverage-58 | 103 | 103 |

The `events` table records organized gatherings or activities. The surrogate `event_id` (1–4) identifies each event, while `event_name` (e.g., "Seasonal Standard", "Integrated Framework") and `location_name` (e.g., "Legacy Review D", "Regional Initiative") provide descriptive context. The `estimated_date` column stores the planned date (2022-09-01 through 2025-12-07), and `expected_attendance` is an integer ranging from 15 to 33. The boolean `is_minor_participant_event` distinguishes minor events (true for events 2 and 4) from standard ones. The `coverage_requested` column holds a coverage identifier such as `baseline-coverage-55` or `pilot-coverage-56`. Foreign keys `organization_id` and `coverage_policy_id` link the event to its hosting organization and its associated policy.

**Table `coverage_policies`**

| id | policy_id | coverage_type | coverage_limit | deductible_amount | is_excess_coverage | claim_excess_threshold | event_id | organization_id | participant_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 5844252 | adaptive-coverage-53 | 22.20 | 233.57 | true | 2.70 | 1 | 100 | 1 |
| 101 | 10207142 | distributed-coverage-54 | 25.40 | 2,190 | false | 5.40 | 2 | 101 | 2 |
| 102 | 1562847 | baseline-coverage-55 | 28.60 | 3,374 | true | 8.10 | 3 | 102 | 3 |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | pilot-coverage-56 | 31.80 | 55.49 | false | 10.80 | 4 | 103 | 4 |

The `coverage_policies` table encodes insurance contracts. The surrogate `id` (100–103) maps to a business `policy_id` (e.g., `5844252`, `ChIJkzsYUIBt5kcRM6_JHx26ONk`). The `coverage_type` column carries a type identifier such as `adaptive-coverage-53` or `distributed-coverage-54`. Numeric columns `coverage_limit` (22.20 through 31.80) and `deductible_amount` (55.49 through 3,374) quantify the policy terms. The boolean `is_excess_coverage` flag (true for policies 100 and 102) indicates excess coverage status, while `claim_excess_threshold` (2.70 through 10.80) sets the trigger value. Foreign keys `event_id`, `organization_id`, and `participant_id` bind the policy to its event, organization, and participant.

**Table `claim_records`**

| id | claim_id | claim_year | premium_paid | total_incurred_claims | claim_description | exceeds_threshold | threshold_amount | organization_id | coverage_policy_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 6969435 | 23 | 4.95 | 16.95 | Baseline Initiative D | true | 19.93 | 100 | 100 |
| 1001 | 4463668 | 32 | 8.90 | 19.90 | Distributed Model | false | 18.59 | 101 | 101 |
| 1002 | lu_tax_code_template_b_VB-EC-Tab | 41 | 12.85 | 22.85 | Adaptive Cluster | true | 13.49 | 102 | 102 |
| 1003 | 727058 | 50 | 16.80 | 25.80 | Primary Review A | false | 34.08 | 103 | 103 |

The `claim_records` table captures filed insurance claims. Each row is keyed by a surrogate `id` (1000–1003) and carries a business `claim_id`. The `claim_type` column stores a type identifier, while `claim_amount` and `deductible_applied` quantify the financials. The boolean `is_approved` flag indicates approval status, and `resolution_date` records when the claim was resolved. Foreign keys `organization_id`, `coverage_policy_id`, and `event_id` link the claim to its originating organization, policy, and event.

**Table `participants`**

| participant_id | full_name | is_minor | waiver_signed | assumption_of_risk_signed | event_id | coverage_policy_id |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | false | false | 1 | 100 |
| 2 | Account Name | false | true | true | 2 | 101 |
| 3 | Saipan International Airport | true | false | false | 3 | 102 |
| 4 | Norma Fisher | false | true | true | 4 | 103 |

The `participants` table models individuals or entities participating in events or policies. The surrogate `id` (1–4) maps to a business `participant_id`. The `participant_name` column holds the participant's name, while `participant_type` (e.g., `adaptive-participant-51`, `distributed-participant-52`) classifies the participant. The boolean `is_minor` flag distinguishes minor participants. Foreign keys `event_id` and `coverage_policy_id` link the participant to their associated event and policy.

**Table `insurance_applications`**

| insurance_application_id | application_id | organization_name | headquarters_street | headquarters_city | headquarters_state | headquarters_zip | date_of_formation | chartered_in_state | submission_date | is_binding | organization_id | event_id | coverage_policy_id | claim_record_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | Staples Inc. | adaptive-headquar-65 | seasonal-headquar-83 | compact-headquar-74 | pilot-headquar-92 | 2023-02-08 | composite-chartere-81 | 2025-04-24T03:57:00 | true | 100 | 1 | 100 | 1000 |
| 2 | 1250196 | Oscar Health Inc. | distributed-headquar-66 | regional-headquar-84 | composite-headquar-75 | extended-headquar-93 | 2024-07-19 | primary-chartere-82 | 2022-09-08T10:14:00 | false | 101 | 2 | 101 | 1001 |
| 3 | 124 | Atlantic Richfield | baseline-headquar-67 | legacy-headquar-85 | primary-headquar-76 | integrated-headquar-94 | 2025-12-03 | adaptive-chartere-83 | 2023-02-19T17:31:00 | true | 102 | 3 | 102 | 1002 |
| 4 | IVC20det40 | Port Loko | pilot-headquar-68 | compact-headquar-86 | adaptive-headquar-77 | seasonal-headquar-95 | 2022-05-14 | distributed-chartere-84 | 2024-07-03T00:48:00 | false | 103 | 4 | 103 | 1003 |

The `insurance_applications` table serves as the central application record. The surrogate `insurance_application_id` (1–4) maps to a business `application_id` (e.g., `505997` for Staples Inc., `1250196` for Oscar Health Inc.). The `organization_name` column carries the applicant's name, while `headquarters_street`, `headquarters_city`, `headquarters_state`, and `headquarters_zip` store address components such as `adaptive-headquar-65` and `seasonal-headquar-83`. The `date_of_formation` (2022-05-14 through 2025-12-03) and `chartered_in_state` (e.g., `composite-chartere-81`) capture incorporation details. The `submission_date` column records the application timestamp (e.g., `2025-04-24T03:57:00`), and the boolean `is_binding` flag indicates binding status. Foreign keys `organization_id`, `event_id`, `coverage_policy_id`, and `claim_record_id` link the application to its constituent entities.

**Table `organizations_officers`**

| organization_id | officer_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `organizations_officers` junction table resolves the many-to-many relationship between organizations and officers. Each row contains `organization_id` and `officer_id` as composite foreign keys, with a surrogate `id` and an `appointment_date` that records when the appointment was formalized. This table allows an organization to have multiple officers and an officer to serve multiple organizations.

**Table `events_participants`**

| event_id | participant_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `events_participants` junction table resolves the many-to-many relationship between events and participants. Each row contains `event_id` and `participant_id` as composite foreign keys, with a surrogate `id` and an `attendance_status` column that records the participant's attendance state. This table allows an event to have multiple participants and a participant to attend multiple events.

The base tables above form a normalized schema where each entity type is isolated in its own table, and relationships are expressed through foreign keys and junction tables. This design eliminates redundancy and enforces referential integrity at the database level. Views then reconstruct domain-level facts by joining these normalized tables.

**View `insurance_application_organization_view`**

```sql
CREATE VIEW insurance_application_organization_view AS
SELECT a.insurance_application_id, a.application_id, a.organization_name, a.headquarters_street, b.id AS organization_id, b.organization_id AS organization_organization_id, b.official_name AS organization_official_name
FROM insurance_applications a JOIN organizations b ON a.organization_id = b.id;
```

| insurance_application_id | application_id | organization_name | headquarters_street | organization_id | organization_organization_id | organization_official_name |
|---|---|---|---|---|---|---|
| 1 | 505997 | Staples Inc. | adaptive-headquar-65 | 100 | Shell Oil | Extended Review |
| 2 | 1250196 | Oscar Health Inc. | distributed-headquar-66 | 101 | GlobalPlatform Inc. | Pilot Initiative A |
| 3 | 124 | Atlantic Richfield | baseline-headquar-67 | 102 | Whatsapp Inc. | Baseline Model |
| 4 | IVC20det40 | Port Loko | pilot-headquar-68 | 103 | American Institutes for Research | Distributed Cluster |

The `insurance_application_organization_view` joins `insurance_applications` with `organizations` on `organization_id`. It answers the question: "What are the full organizational details for each insurance application?" Reading the first row, we see application `505997` for Staples Inc. linked to organization `100` (Shell Oil, license LIC-2589, formed 2023-10-24, headquartered at `baseline-headquar-43`). The second row shows application `1250196` for Oscar Health Inc. linked to organization `101` (GlobalPlatform Inc., license LIC-2596, formed 2024-03-08). This view consolidates application metadata with organizational identity into a single denormalized record.

**View `insurance_application_event_view`**

```sql
CREATE VIEW insurance_application_event_view AS
SELECT a.insurance_application_id, a.application_id, a.organization_name, a.headquarters_street, b.event_id AS event_event_id, b.event_name AS event_event_name, b.location_name AS event_location_name
FROM insurance_applications a JOIN events b ON a.event_id = b.event_id;
```

| insurance_application_id | application_id | organization_name | headquarters_street | event_event_id | event_event_name | event_location_name |
|---|---|---|---|---|---|---|
| 1 | 505997 | Staples Inc. | adaptive-headquar-65 | 1 | Seasonal Standard | Legacy Review D |
| 2 | 1250196 | Oscar Health Inc. | distributed-headquar-66 | 2 | Integrated Framework | Regional Initiative |
| 3 | 124 | Atlantic Richfield | baseline-headquar-67 | 3 | Extended Protocol D | Seasonal Model |
| 4 | IVC20det40 | Port Loko | pilot-headquar-68 | 4 | Pilot Programme | Integrated Cluster A |

The `insurance_application_event_view` joins `insurance_applications` with `events` on `event_id`. It answers: "Which event is associated with each insurance application?" The first row pairs application `505997` with event `1` ("Seasonal Standard", location `Legacy Review D`, estimated date 2022-09-01, expected attendance 15). The third row pairs application `124` with event `3` ("Extended Protocol D", location `Seasonal Model`, estimated date 2024-07-23, expected attendance 27). This view enables analysts to correlate application timing with event scheduling.

**View `insurance_application_coverage_policy_view`**

```sql
CREATE VIEW insurance_application_coverage_policy_view AS
SELECT a.insurance_application_id, a.application_id, a.organization_name, a.headquarters_street, b.id AS policy_id, b.policy_id AS policy_policy_id, b.coverage_type AS policy_coverage_type
FROM insurance_applications a JOIN coverage_policies b ON a.coverage_policy_id = b.id;
```

| insurance_application_id | application_id | organization_name | headquarters_street | policy_id | policy_policy_id | policy_coverage_type |
|---|---|---|---|---|---|---|
| 1 | 505997 | Staples Inc. | adaptive-headquar-65 | 100 | 5844252 | adaptive-coverage-53 |
| 2 | 1250196 | Oscar Health Inc. | distributed-headquar-66 | 101 | 10207142 | distributed-coverage-54 |
| 3 | 124 | Atlantic Richfield | baseline-headquar-67 | 102 | 1562847 | baseline-coverage-55 |
| 4 | IVC20det40 | Port Loko | pilot-headquar-68 | 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | pilot-coverage-56 |

The `insurance_application_coverage_policy_view` joins `insurance_applications` with `coverage_policies` on `coverage_policy_id`. It answers: "What coverage terms underlie each application?" The first row shows application `505997` backed by policy `5844252` of type `adaptive-coverage-53` with a coverage limit of 22.20, a deductible of 233.57, and excess coverage enabled. The fourth row shows application `IVC20det40` backed by policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` of type `pilot-coverage-56` with a limit of 31.80 and a deductible of 55.49. This view is essential for underwriting analysis.

**View `insurance_application_claim_record_view`**

```sql
CREATE VIEW insurance_application_claim_record_view AS
SELECT a.insurance_application_id, a.application_id, a.organization_name, a.headquarters_street, b.id AS record_id, b.claim_id AS record_claim_id, b.claim_year AS record_claim_year
FROM insurance_applications a JOIN claim_records b ON a.claim_record_id = b.id;
```

| insurance_application_id | application_id | organization_name | headquarters_street | record_id | record_claim_id | record_claim_year |
|---|---|---|---|---|---|---|
| 1 | 505997 | Staples Inc. | adaptive-headquar-65 | 1000 | 6969435 | 23 |
| 2 | 1250196 | Oscar Health Inc. | distributed-headquar-66 | 1001 | 4463668 | 32 |
| 3 | 124 | Atlantic Richfield | baseline-headquar-67 | 1002 | lu_tax_code_template_b_VB-EC-Tab | 41 |
| 4 | IVC20det40 | Port Loko | pilot-headquar-68 | 1003 | 727058 | 50 |

The `insurance_application_claim_record_view` joins `insurance_applications` with `claim_records` on `claim_record_id`. It answers: "What claims have been filed in connection with each application?" The first row links application `505997` to claim `1000`, the second to claim `1001`, and so on through claim `1003`. This view enables end-to-end traceability from application through claim resolution.

**View `organization_officer_detail_view`**

```sql
CREATE VIEW organization_officer_detail_view AS
SELECT a.id, a.organization_id, a.official_name, b.id AS officer_id, b.officer_id AS officer_officer_id, b.full_name AS officer_full_name
FROM organizations a
  JOIN organizations_officers j ON j.organization_id = a.id
  JOIN officers b ON b.id = j.officer_id;
```

| id | organization_id | official_name | officer_id | officer_officer_id | officer_full_name |
|---|---|---|---|---|---|
| 100 | Shell Oil | Extended Review | 1 | 103165 | Theodore Mcgrath |
| 100 | Shell Oil | Extended Review | 2 | 2933464 | Account Name |
| 101 | GlobalPlatform Inc. | Pilot Initiative A | 2 | 2933464 | Account Name |
| 101 | GlobalPlatform Inc. | Pilot Initiative A | 3 | 10445622 | Saipan International Airport |
| 102 | Whatsapp Inc. | Baseline Model | 3 | 10445622 | Saipan International Airport |
| 102 | Whatsapp Inc. | Baseline Model | 4 | 7441150 | Norma Fisher |
| 103 | American Institutes for Research | Distributed Cluster | 4 | 7441150 | Norma Fisher |
| 103 | American Institutes for Research | Distributed Cluster | 1 | 103165 | Theodore Mcgrath |

The `organization_officer_detail_view` joins `organizations` with `officers` on `organization_id`. It answers: "Which officer is appointed to each organization, and what are their details?" The first row shows organization `100` (Shell Oil) with officer `103165` (Theodore Mcgrath, role "Distributed Standard", appointed 2022-05-03, insurance coordinator). The third row shows organization `102` (Whatsapp Inc.) with officer `10445622` (Saipan International Airport, role "Primary Protocol", appointed 2024-03-25, insurance coordinator). This view supports governance auditing.

**View `organization_officer_view`**

```sql
CREATE VIEW organization_officer_view AS
SELECT a.id, a.organization_id, a.official_name, a.license_number, b.id AS officer_id, b.officer_id AS officer_officer_id, b.full_name AS officer_full_name
FROM organizations a JOIN officers b ON a.officer_id = b.id;
```

| id | organization_id | official_name | license_number | officer_id | officer_officer_id | officer_full_name |
|---|---|---|---|---|---|---|
| 100 | Shell Oil | Extended Review | LIC-2589 | 1 | 103165 | Theodore Mcgrath |
| 101 | GlobalPlatform Inc. | Pilot Initiative A | LIC-2596 | 2 | 2933464 | Account Name |
| 102 | Whatsapp Inc. | Baseline Model | LIC-2603 | 3 | 10445622 | Saipan International Airport |
| 103 | American Institutes for Research | Distributed Cluster | LIC-2610 | 4 | 7441150 | Norma Fisher |

The `organization_officer_view` joins `organizations` with `officers` and `officer_roles` through `role_code`. It answers: "What is the full role context for each organization's officer?" The first row shows Shell Oil's officer Theodore Mcgrath holding role code `6969430` ("Seasonal Programme", non-executive, requires insurance training). The fourth row shows American Institutes for Research's officer Norma Fisher holding role code `39800616` ("Pilot Protocol", executive, no training required). This view is critical for compliance verification.

**View `organization_insurance_application_view`**

```sql
CREATE VIEW organization_insurance_application_view AS
SELECT a.id, a.organization_id, a.official_name, a.license_number, b.insurance_application_id AS application_insurance_application_id, b.application_id AS application_application_id, b.organization_name AS application_organization_name
FROM organizations a JOIN insurance_applications b ON a.insurance_application_id = b.insurance_application_id;
```

| id | organization_id | official_name | license_number | application_insurance_application_id | application_application_id | application_organization_name |
|---|---|---|---|---|---|---|
| 100 | Shell Oil | Extended Review | LIC-2589 | 1 | 505997 | Staples Inc. |
| 101 | GlobalPlatform Inc. | Pilot Initiative A | LIC-2596 | 2 | 1250196 | Oscar Health Inc. |
| 102 | Whatsapp Inc. | Baseline Model | LIC-2603 | 3 | 124 | Atlantic Richfield |
| 103 | American Institutes for Research | Distributed Cluster | LIC-2610 | 4 | IVC20det40 | Port Loko |

The `organization_insurance_application_view` joins `organizations` with `insurance_applications` on `organization_id`. It answers: "Which insurance applications has each organization submitted?" The first row links organization `100` (Shell Oil) to application `505997` (Staples Inc., submitted 2025-04-24, binding). The second row links organization `101` (GlobalPlatform Inc.) to application `1250196` (Oscar Health Inc., submitted 2022-09-08, non-binding). This view supports portfolio analysis at the organizational level.

**View `organization_event_view`**

```sql
CREATE VIEW organization_event_view AS
SELECT a.id, a.organization_id, a.official_name, a.license_number, b.event_id AS event_event_id, b.event_name AS event_event_name, b.location_name AS event_location_name
FROM organizations a JOIN events b ON a.event_id = b.event_id;
```

| id | organization_id | official_name | license_number | event_event_id | event_event_name | event_location_name |
|---|---|---|---|---|---|---|
| 100 | Shell Oil | Extended Review | LIC-2589 | 1 | Seasonal Standard | Legacy Review D |
| 101 | GlobalPlatform Inc. | Pilot Initiative A | LIC-2596 | 2 | Integrated Framework | Regional Initiative |
| 102 | Whatsapp Inc. | Baseline Model | LIC-2603 | 3 | Extended Protocol D | Seasonal Model |
| 103 | American Institutes for Research | Distributed Cluster | LIC-2610 | 4 | Pilot Programme | Integrated Cluster A |

The `organization_event_view` joins `organizations` with `events` on `organization_id`. It answers: "Which events is each organization hosting?" The first row shows organization `100` hosting event `1` ("Seasonal Standard", location `Legacy Review D`, 15 expected attendees, not a minor event). The fourth row shows organization `103` hosting event `4` ("Pilot Programme", location `Integrated Cluster A`, 33 expected attendees, a minor event). This view enables event portfolio management.

**View `officer_organization_view`**

```sql
CREATE VIEW officer_organization_view AS
SELECT a.id, a.officer_id, a.full_name, a.role_title, b.id AS organization_id, b.organization_id AS organization_organization_id, b.official_name AS organization_official_name
FROM officers a JOIN organizations b ON a.organization_id = b.id;
```

| id | officer_id | full_name | role_title | organization_id | organization_organization_id | organization_official_name |
|---|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Distributed Standard | 100 | Shell Oil | Extended Review |
| 2 | 2933464 | Account Name | Adaptive Framework D | 101 | GlobalPlatform Inc. | Pilot Initiative A |
| 3 | 10445622 | Saipan International Airport | Primary Protocol | 102 | Whatsapp Inc. | Baseline Model |
| 4 | 7441150 | Norma Fisher | Composite Programme | 103 | American Institutes for Research | Distributed Cluster |

The `officer_organization_view` joins `officers` with `organizations` on `organization_id`. It answers: "Which organization does each officer serve?" The first row shows officer `103165` (Theodore Mcgrath) serving organization `100` (Shell Oil, license LIC-2589). The third row shows officer `10445622` (Saipan International Airport) serving organization `102` (Whatsapp Inc., license LIC-2603). This view supports officer workload analysis.

**View `officer_officer_role_view`**

```sql
CREATE VIEW officer_officer_role_view AS
SELECT a.id, a.officer_id, a.full_name, a.role_title, b.role_code AS role_role_code, b.role_name AS role_role_name, b.is_executive AS role_is_executive
FROM officers a JOIN officer_roles b ON a.role_code = b.role_code;
```

| id | officer_id | full_name | role_title | role_role_code | role_role_name | role_is_executive |
|---|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Distributed Standard | 6969430 | Seasonal Programme | false |
| 2 | 2933464 | Account Name | Adaptive Framework D | lu_tax_code_template_m16 | Integrated Standard | true |
| 3 | 10445622 | Saipan International Airport | Primary Protocol | 3158154 | Extended Framework D | false |
| 4 | 7441150 | Norma Fisher | Composite Programme | 39800616 | Pilot Protocol | true |

The `officer_officer_role_view` joins `officers` with `officer_roles` on `role_code`. It answers: "What role does each officer hold, and what are the role's requirements?" The first row shows officer `103165` (Theodore Mcgrath) holding role `6969430` ("Seasonal Programme", non-executive, requires insurance training). The second row shows officer `2933464` (Account Name) holding role `lu_tax_code_template_m16` ("Integrated Standard", executive, no training required). This view is essential for training compliance tracking.

**View `event_organization_view`**

```sql
CREATE VIEW event_organization_view AS
SELECT a.event_id, a.event_name, a.location_name, a.estimated_date, b.id AS organization_id, b.organization_id AS organization_organization_id, b.official_name AS organization_official_name
FROM events a JOIN organizations b ON a.organization_id = b.id;
```

| event_id | event_name | location_name | estimated_date | organization_id | organization_organization_id | organization_official_name |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | Legacy Review D | 2022-09-01 | 100 | Shell Oil | Extended Review |
| 2 | Integrated Framework | Regional Initiative | 2023-02-12 | 101 | GlobalPlatform Inc. | Pilot Initiative A |
| 3 | Extended Protocol D | Seasonal Model | 2024-07-23 | 102 | Whatsapp Inc. | Baseline Model |
| 4 | Pilot Programme | Integrated Cluster A | 2025-12-07 | 103 | American Institutes for Research | Distributed Cluster |

The `event_organization_view` joins `events` with `organizations` on `organization_id`. It answers: "Which organization is hosting each event?" The first row shows event `1` ("Seasonal Standard") hosted by organization `100` (Shell Oil, formed 2023-10-24). The third row shows event `3` ("Extended Protocol D") hosted by organization `102` (Whatsapp Inc., formed 2025-08-19). This view supports event ownership tracking.

**View `event_coverage_policy_view`**

```sql
CREATE VIEW event_coverage_policy_view AS
SELECT a.event_id, a.event_name, a.location_name, a.estimated_date, b.id AS policy_id, b.policy_id AS policy_policy_id, b.coverage_type AS policy_coverage_type
FROM events a JOIN coverage_policies b ON a.coverage_policy_id = b.id;
```

| event_id | event_name | location_name | estimated_date | policy_id | policy_policy_id | policy_coverage_type |
|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | Legacy Review D | 2022-09-01 | 100 | 5844252 | adaptive-coverage-53 |
| 2 | Integrated Framework | Regional Initiative | 2023-02-12 | 101 | 10207142 | distributed-coverage-54 |
| 3 | Extended Protocol D | Seasonal Model | 2024-07-23 | 102 | 1562847 | baseline-coverage-55 |
| 4 | Pilot Programme | Integrated Cluster A | 2025-12-07 | 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | pilot-coverage-56 |

The `event_coverage_policy_view` joins `events` with `coverage_policies` on `event_id`. It answers: "What coverage policy is associated with each event?" The first row shows event `1` ("Seasonal Standard") covered by policy `5844252` (type `adaptive-coverage-53`, limit 22.20, deductible 233.57, excess coverage enabled). The fourth row shows event `4` ("Pilot Programme") covered by policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` (type `pilot-coverage-56`, limit 31.80, deductible 55.49). This view enables event risk assessment.

**View `event_participant_detail_view`**

```sql
CREATE VIEW event_participant_detail_view AS
SELECT a.event_id, a.event_name, a.location_name, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.is_minor AS participant_is_minor
FROM events a
  JOIN events_participants j ON j.event_id = a.event_id
  JOIN participants b ON b.participant_id = j.participant_id;
```

| event_id | event_name | location_name | participant_participant_id | participant_full_name | participant_is_minor |
|---|---|---|---|---|---|
| 1 | Seasonal Standard | Legacy Review D | 1 | Theodore Mcgrath | true |
| 1 | Seasonal Standard | Legacy Review D | 2 | Account Name | false |
| 2 | Integrated Framework | Regional Initiative | 2 | Account Name | false |
| 2 | Integrated Framework | Regional Initiative | 3 | Saipan International Airport | true |
| 3 | Extended Protocol D | Seasonal Model | 3 | Saipan International Airport | true |
| 3 | Extended Protocol D | Seasonal Model | 4 | Norma Fisher | false |
| 4 | Pilot Programme | Integrated Cluster A | 4 | Norma Fisher | false |
| 4 | Pilot Programme | Integrated Cluster A | 1 | Theodore Mcgrath | true |

The `event_participant_detail_view` joins `events` with `events_participants` and `participants`. It answers: "Which participants are attending each event, and what are their details?" The first row shows event `1` ("Seasonal Standard") with participant `1` (type `adaptive-participant-51`, minor status). The second row shows event `2` ("Integrated Framework") with participant `2` (type `distributed-participant-52`). This view supports attendance planning and risk categorization.

**View `coverage_policy_event_view`**

```sql
CREATE VIEW coverage_policy_event_view AS
SELECT a.id, a.policy_id, a.coverage_type, a.coverage_limit, b.event_id AS event_event_id, b.event_name AS event_event_name, b.location_name AS event_location_name
FROM coverage_policies a JOIN events b ON a.event_id = b.event_id;
```

| id | policy_id | coverage_type | coverage_limit | event_event_id | event_event_name | event_location_name |
|---|---|---|---|---|---|---|
| 100 | 5844252 | adaptive-coverage-53 | 22.20 | 1 | Seasonal Standard | Legacy Review D |
| 101 | 10207142 | distributed-coverage-54 | 25.40 | 2 | Integrated Framework | Regional Initiative |
| 102 | 1562847 | baseline-coverage-55 | 28.60 | 3 | Extended Protocol D | Seasonal Model |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | pilot-coverage-56 | 31.80 | 4 | Pilot Programme | Integrated Cluster A |

The `coverage_policy_event_view` joins `coverage_policies` with `events` on `event_id`. It answers: "Which event does each coverage policy cover?" The first row shows policy `5844252` covering event `1` ("Seasonal Standard", location `Legacy Review D`, 15 attendees). The third row shows policy `1562847` covering event `3` ("Extended Protocol D", location `Seasonal Model`, 27 attendees). This view is useful for policy-event reconciliation.

**View `coverage_policy_organization_view`**

```sql
CREATE VIEW coverage_policy_organization_view AS
SELECT a.id, a.policy_id, a.coverage_type, a.coverage_limit, b.id AS organization_id, b.organization_id AS organization_organization_id, b.official_name AS organization_official_name
FROM coverage_policies a JOIN organizations b ON a.organization_id = b.id;
```

| id | policy_id | coverage_type | coverage_limit | organization_id | organization_organization_id | organization_official_name |
|---|---|---|---|---|---|---|
| 100 | 5844252 | adaptive-coverage-53 | 22.20 | 100 | Shell Oil | Extended Review |
| 101 | 10207142 | distributed-coverage-54 | 25.40 | 101 | GlobalPlatform Inc. | Pilot Initiative A |
| 102 | 1562847 | baseline-coverage-55 | 28.60 | 102 | Whatsapp Inc. | Baseline Model |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | pilot-coverage-56 | 31.80 | 103 | American Institutes for Research | Distributed Cluster |

The `coverage_policy_organization_view` joins `coverage_policies` with `organizations` on `organization_id`. It answers: "Which organization holds each coverage policy?" The first row shows policy `5844252` (type `adaptive-coverage-53`, limit 22.20) held by organization `100` (Shell Oil, license LIC-2589). The fourth row shows policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` (type `pilot-coverage-56`, limit 31.80) held by organization `103` (American Institutes for Research, license LIC-2610). This view supports portfolio-level risk aggregation.

**View `coverage_policy_participant_view`**

```sql
CREATE VIEW coverage_policy_participant_view AS
SELECT a.id, a.policy_id, a.coverage_type, a.coverage_limit, b.participant_id AS participant_participant_id, b.full_name AS participant_full_name, b.is_minor AS participant_is_minor
FROM coverage_policies a JOIN participants b ON a.participant_id = b.participant_id;
```

| id | policy_id | coverage_type | coverage_limit | participant_participant_id | participant_full_name | participant_is_minor |
|---|---|---|---|---|---|---|
| 100 | 5844252 | adaptive-coverage-53 | 22.20 | 1 | Theodore Mcgrath | true |
| 101 | 10207142 | distributed-coverage-54 | 25.40 | 2 | Account Name | false |
| 102 | 1562847 | baseline-coverage-55 | 28.60 | 3 | Saipan International Airport | true |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | pilot-coverage-56 | 31.80 | 4 | Norma Fisher | false |

The `coverage_policy_participant_view` joins `coverage_policies` with `participants` on `participant_id`. It answers: "Which participants are covered under each policy?" The first row shows policy `5844252` covering participant `1` (type `adaptive-participant-51`). The second row shows policy `10207142` covering participant `2` (type `distributed-participant-52`). This view enables participant-level coverage verification.

**View `claim_record_organization_view`**

```sql
CREATE VIEW claim_record_organization_view AS
SELECT a.id, a.claim_id, a.claim_year, a.premium_paid, b.id AS organization_id, b.organization_id AS organization_organization_id, b.official_name AS organization_official_name
FROM claim_records a JOIN organizations b ON a.organization_id = b.id;
```

| id | claim_id | claim_year | premium_paid | organization_id | organization_organization_id | organization_official_name |
|---|---|---|---|---|---|---|
| 1000 | 6969435 | 23 | 4.95 | 100 | Shell Oil | Extended Review |
| 1001 | 4463668 | 32 | 8.90 | 101 | GlobalPlatform Inc. | Pilot Initiative A |
| 1002 | lu_tax_code_template_b_VB-EC-Tab | 41 | 12.85 | 102 | Whatsapp Inc. | Baseline Model |
| 1003 | 727058 | 50 | 16.80 | 103 | American Institutes for Research | Distributed Cluster |

The `claim_record_organization_view` joins `claim_records` with `organizations` on `organization_id`. It answers: "Which organization filed each claim?" The first row shows claim `1000` filed by organization `100` (Shell Oil, license LIC-2589). The third row shows claim `1002` filed by organization `102` (Whatsapp Inc., license LIC-2603). This view supports claims analytics by organization.

**View `claim_record_coverage_policy_view`**

```sql
CREATE VIEW claim_record_coverage_policy_view AS
SELECT a.id, a.claim_id, a.claim_year, a.premium_paid, b.id AS policy_id, b.policy_id AS policy_policy_id, b.coverage_type AS policy_coverage_type
FROM claim_records a JOIN coverage_policies b ON a.coverage_policy_id = b.id;
```

| id | claim_id | claim_year | premium_paid | policy_id | policy_policy_id | policy_coverage_type |
|---|---|---|---|---|---|---|
| 1000 | 6969435 | 23 | 4.95 | 100 | 5844252 | adaptive-coverage-53 |
| 1001 | 4463668 | 32 | 8.90 | 101 | 10207142 | distributed-coverage-54 |
| 1002 | lu_tax_code_template_b_VB-EC-Tab | 41 | 12.85 | 102 | 1562847 | baseline-coverage-55 |
| 1003 | 727058 | 50 | 16.80 | 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | pilot-coverage-56 |

The `claim_record_coverage_policy_view` joins `claim_records` with `coverage_policies` on `coverage_policy_id`. It answers: "Under which policy was each claim filed?" The first row shows claim `1000` filed under policy `5844252` (type `adaptive-coverage-53`, limit 22.20). The fourth row shows claim `1003` filed under policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` (type `pilot-coverage-56`, limit 31.80). This view is essential for claims-to-policy reconciliation.

**View `participant_event_view`**

```sql
CREATE VIEW participant_event_view AS
SELECT a.participant_id, a.full_name, a.is_minor, a.waiver_signed, b.event_id AS event_event_id, b.event_name AS event_event_name, b.location_name AS event_location_name
FROM participants a JOIN events b ON a.event_id = b.event_id;
```

| participant_id | full_name | is_minor | waiver_signed | event_event_id | event_event_name | event_location_name |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | false | 1 | Seasonal Standard | Legacy Review D |
| 2 | Account Name | false | true | 2 | Integrated Framework | Regional Initiative |
| 3 | Saipan International Airport | true | false | 3 | Extended Protocol D | Seasonal Model |
| 4 | Norma Fisher | false | true | 4 | Pilot Programme | Integrated Cluster A |

The `participant_event_view` joins `participants` with `events_participants` and `events`. It answers: "Which events is each participant attending?" The first row shows participant `1` (type `adaptive-participant-51`) attending event `1` ("Seasonal Standard", location `Legacy Review D`). The second row shows participant `2` (type `distributed-participant-52`) attending event `2` ("Integrated Framework", location `Regional Initiative`). This view supports participant activity tracking.

**View `participant_coverage_policy_view`**

```sql
CREATE VIEW participant_coverage_policy_view AS
SELECT a.participant_id, a.full_name, a.is_minor, a.waiver_signed, b.id AS policy_id, b.policy_id AS policy_policy_id, b.coverage_type AS policy_coverage_type
FROM participants a JOIN coverage_policies b ON a.coverage_policy_id = b.id;
```

| participant_id | full_name | is_minor | waiver_signed | policy_id | policy_policy_id | policy_coverage_type |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | false | 100 | 5844252 | adaptive-coverage-53 |
| 2 | Account Name | false | true | 101 | 10207142 | distributed-coverage-54 |
| 3 | Saipan International Airport | true | false | 102 | 1562847 | baseline-coverage-55 |
| 4 | Norma Fisher | false | true | 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | pilot-coverage-56 |

The `participant_coverage_policy_view` joins `participants` with `coverage_policies` on `participant_id`. It answers: "Which coverage policy covers each participant?" The first row shows participant `1` (type `adaptive-participant-51`) covered by policy `5844252` (type `adaptive-coverage-53`, limit 22.20, deductible 233.57). The third row shows participant `3` (type `baseline-participant-54`) covered by policy `1562847` (type `baseline-coverage-55`, limit 28.60, deductible 3,374). This view enables participant coverage auditing.

The relational materialization of this ontology demonstrates a disciplined separation of concerns: entity types are isolated in base tables, relationships are expressed through foreign keys and junction tables, and views provide denormalized projections that answer specific analytical questions. The 10 base tables encode the canonical data model with full referential integrity, while the 20 views reconstruct domain-level facts by joining the appropriate tables. This architecture supports both transactional integrity (through the normalized base schema) and analytical convenience (through the denormalized views), embodying the classic trade-off between normalization and query performance in enterprise data modelling.