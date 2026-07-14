## Insurance Program Administration and Risk Coverage

The administration of insurance programs for organizations involves a structured ecosystem of applications, policies, events, and claims. Organizations submit insurance applications that reference specific coverage policies, associated events, and sometimes linked claim records. Within each organization, officers hold defined roles and coordinate insurance matters. Events draw participants and are covered by policies with defined limits and deductibles. This chapter documents the data structures that capture these relationships, using representative records to illustrate how the system tracks the full lifecycle from application through coverage to claims.

**Table `insurance_applications`**

| insurance_application_id | application_id | organization_name | headquarters_street | headquarters_city | headquarters_state | headquarters_zip | date_of_formation | chartered_in_state | submission_date | is_binding | organization_id | event_id | coverage_policy_id | claim_record_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 505997 | Staples Inc. | adaptive-headquar-65 | seasonal-headquar-83 | compact-headquar-74 | pilot-headquar-92 | 2023-02-08 | composite-chartere-81 | 2025-04-24T03:57:00 | true | 100 | 1 | 100 | 1000 |
| 2 | 1250196 | Oscar Health Inc. | distributed-headquar-66 | regional-headquar-84 | composite-headquar-75 | extended-headquar-93 | 2024-07-19 | primary-chartere-82 | 2022-09-08T10:14:00 | false | 101 | 2 | 101 | 1001 |
| 3 | 124 | Atlantic Richfield | baseline-headquar-67 | legacy-headquar-85 | primary-headquar-76 | integrated-headquar-94 | 2025-12-03 | adaptive-chartere-83 | 2023-02-19T17:31:00 | true | 102 | 3 | 102 | 1002 |
| 4 | IVC20det40 | Port Loko | pilot-headquar-68 | compact-headquar-86 | adaptive-headquar-77 | seasonal-headquar-95 | 2022-05-14 | distributed-chartere-84 | 2024-07-03T00:48:00 | false | 103 | 4 | 103 | 1003 |

The `insurance_applications` table serves as the central intake record for each insurance request. Each row carries a unique `insurance_application_id`, an `application_id` such as `505997` or `1250196`, and the `organization_name` applying — for example, Staples Inc., Oscar Health Inc., Atlantic Richfield, and Port Loko. The application records the organization's headquarters details across `headquarters_street`, `headquarters_city`, `headquarters_state`, and `headquarters_zip`, with values like `adaptive-headquar-65` and `seasonal-headquar-83` representing coded address components. The `date_of_formation` and `chartered_in_state` fields capture when the organization was established and where it received its charter, such as `2023-02-08` and `composite-chartere-81`. The `submission_date` records when the application was filed, for instance `2025-04-24T03:57:00`, while the `is_binding` flag indicates whether the application carries binding authority. Each application is linked to an `organization_id`, `event_id`, `coverage_policy_id`, and `claim_record_id`, forming the foreign-key backbone of the system.

**Table `organizations`**

| id | organization_id | official_name | license_number | formation_date | chartered_state | headquarters_address | telephone_number | fax_number | has_coach_instruction_program | has_injury_control_program | officer_id | insurance_application_id | event_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | Shell Oil | Extended Review | LIC-2589 | 2023-10-24 | composite-chartere-75 | baseline-headquar-43 | TEL-2173 | FAX-2047 | true | true | 1 | 1 | 1 |
| 101 | GlobalPlatform Inc. | Pilot Initiative A | LIC-2596 | 2024-03-08 | primary-chartere-76 | pilot-headquar-44 | TEL-2177 | FAX-2049 | false | false | 2 | 2 | 2 |
| 102 | Whatsapp Inc. | Baseline Model | LIC-2603 | 2025-08-19 | adaptive-chartere-77 | extended-headquar-45 | TEL-2181 | FAX-2051 | true | true | 3 | 3 | 3 |
| 103 | American Institutes for Research | Distributed Cluster | LIC-2610 | 2022-01-03 | distributed-chartere-78 | integrated-headquar-46 | TEL-2185 | FAX-2053 | false | false | 4 | 4 | 4 |

Organizations are the entities that apply for coverage. The `organizations` table stores each organization's `id`, `organization_id`, `official_name`, `license_number`, `formation_date`, and `chartered_state`. Shell Oil, with license `LIC-2589` and formation date `2023-10-24`, operates under the charter `composite-chartere-75`. GlobalPlatform Inc. holds license `LIC-2596` and was formed on `2024-03-08`. The table also records contact information through `telephone_number` and `fax_number`, and flags whether the organization runs a `has_coach_instruction_program` or a `has_injury_control_program`. Shell Oil and Whatsapp Inc. both maintain these programs, while GlobalPlatform Inc. and American Institutes for Research do not. Each organization row connects to an `officer_id`, `insurance_application_id`, and `event_id`, anchoring it within the broader application and event framework.

**Table `officers`**

| id | officer_id | full_name | role_title | appointment_date | is_insurance_coordinator | organization_id | role_code |
|---|---|---|---|---|---|---|---|
| 1 | 103165 | Theodore Mcgrath | Distributed Standard | 2022-05-03 | true | 100 | 6969430 |
| 2 | 2933464 | Account Name | Adaptive Framework D | 2023-10-14 | false | 101 | lu_tax_code_template_m16 |
| 3 | 10445622 | Saipan International Airport | Primary Protocol | 2024-03-25 | true | 102 | 3158154 |
| 4 | 7441150 | Norma Fisher | Composite Programme | 2025-08-09 | false | 103 | 39800616 |

Individuals who serve as officers within organizations are recorded in the `officers` table. Each officer has an `id`, an `officer_id` such as `103165` or `2933464`, a `full_name`, and a `role_title`. Theodore Mcgrath holds the title Distributed Standard and was appointed on `2022-05-03`. Account Name serves as an officer with the title Adaptive Framework D, appointed on `2023-10-14`. The `is_insurance_coordinator` flag identifies whether the officer is responsible for insurance coordination — Theodore Mcgrath and Saipan International Airport both serve in this capacity. The `role_code` field links the officer to a definition in the `officer_roles` table, and `organization_id` ties the officer to their employing organization.

**Table `officer_roles`**

| role_code | role_name | is_executive | requires_insurance_training | created_at | updated_at |
|---|---|---|---|---|---|
| 6969430 | Seasonal Programme | false | true | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| lu_tax_code_template_m16 | Integrated Standard | true | false | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3158154 | Extended Framework D | false | true | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 39800616 | Pilot Protocol | true | false | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `officer_roles` table defines the catalog of roles that officers may hold. Each role has a `role_code`, a `role_name`, and flags for `is_executive` and `requires_insurance_training`. The role `6969430` corresponds to Seasonal Programme, is not executive, and requires insurance training. The role `lu_tax_code_template_m16` maps to Integrated Standard, is executive, and does not require insurance training. The role `3158154` represents Extended Framework D, which is non-executive but requires training. The role `39800616` defines Pilot Protocol, an executive role without a training requirement. Timestamps `created_at` and `updated_at` track when each role definition was established and last modified.

**Table `events`**

| event_id | event_name | location_name | estimated_date | expected_attendance | is_minor_participant_event | coverage_requested | organization_id | coverage_policy_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Seasonal Standard | Legacy Review D | 2022-09-01 | 15 | false | baseline-coverage-55 | 100 | 100 |
| 2 | Integrated Framework | Regional Initiative | 2023-02-12 | 21 | true | pilot-coverage-56 | 101 | 101 |
| 3 | Extended Protocol D | Seasonal Model | 2024-07-23 | 27 | false | extended-coverage-57 | 102 | 102 |
| 4 | Pilot Programme | Integrated Cluster A | 2025-12-07 | 33 | true | integrated-coverage-58 | 103 | 103 |

Events represent the activities or gatherings for which coverage is sought. The `events` table records each event's `event_id`, `event_name`, `location_name`, `estimated_date`, and `expected_attendance`. The Seasonal Standard event, held at Legacy Review D on `2022-09-01`, expects 15 attendees. The Integrated Framework event at Regional Initiative on `2023-02-12` expects 21 attendees and is flagged as a `is_minor_participant_event`. The Extended Protocol D event on `2024-07-23` anticipates 27 participants, while the Pilot Programme on `2025-12-07` expects 33. The `coverage_requested` field specifies the type of coverage, such as `baseline-coverage-55` or `pilot-coverage-56`. Each event is associated with an `organization_id` and a `coverage_policy_id`.

**Table `coverage_policies`**

| id | policy_id | coverage_type | coverage_limit | deductible_amount | is_excess_coverage | claim_excess_threshold | event_id | organization_id | participant_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | 5844252 | adaptive-coverage-53 | 22.20 | 233.57 | true | 2.70 | 1 | 100 | 1 |
| 101 | 10207142 | distributed-coverage-54 | 25.40 | 2,190 | false | 5.40 | 2 | 101 | 2 |
| 102 | 1562847 | baseline-coverage-55 | 28.60 | 3,374 | true | 8.10 | 3 | 102 | 3 |
| 103 | ChIJkzsYUIBt5kcRM6_JHx26ONk | pilot-coverage-56 | 31.80 | 55.49 | false | 10.80 | 4 | 103 | 4 |

Coverage policies define the terms under which organizations and events are insured. The `coverage_policies` table stores each policy's `id`, `policy_id`, `coverage_type`, `coverage_limit`, `deductible_amount`, and flags for `is_excess_coverage` and `claim_excess_threshold`. Policy `5844252` provides adaptive-coverage-53 with a limit of `22.20`, a deductible of `233.57`, and is excess coverage with a threshold of `2.70`. Policy `10207142` offers distributed-coverage-54 at a limit of `25.40` with a deductible of `2,190`, and is not excess coverage. Policy `1562847` covers baseline-coverage-55 with a limit of `28.60` and a deductible of `3,374`, carrying excess coverage at a threshold of `8.10`. Policy `ChIJkzsYUIBt5kcRM6_JHx26ONk` provides pilot-coverage-56 at a limit of `31.80` with a deductible of `55.49`. Each policy references an `event_id`, `organization_id`, and `participant_id`.

**Table `claim_records`**

| id | claim_id | claim_year | premium_paid | total_incurred_claims | claim_description | exceeds_threshold | threshold_amount | organization_id | coverage_policy_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 6969435 | 23 | 4.95 | 16.95 | Baseline Initiative D | true | 19.93 | 100 | 100 |
| 1001 | 4463668 | 32 | 8.90 | 19.90 | Distributed Model | false | 18.59 | 101 | 101 |
| 1002 | lu_tax_code_template_b_VB-EC-Tab | 41 | 12.85 | 22.85 | Adaptive Cluster | true | 13.49 | 102 | 102 |
| 1003 | 727058 | 50 | 16.80 | 25.80 | Primary Review A | false | 34.08 | 103 | 103 |

Claim records document insurance claims filed under coverage policies. The `claim_records` table captures each claim's `claim_id`, `claim_number`, `claim_status`, `claim_amount`, `date_of_loss`, `date_reported`, `date_resolved`, `description`, `organization_id`, `coverage_policy_id`, and `event_id`. Claims progress through statuses such as Open, Under Review, and Closed, with amounts and dates tracking the lifecycle from loss through resolution.

**Table `participants`**

| participant_id | full_name | is_minor | waiver_signed | assumption_of_risk_signed | event_id | coverage_policy_id |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | false | false | 1 | 100 |
| 2 | Account Name | false | true | true | 2 | 101 |
| 3 | Saipan International Airport | true | false | false | 3 | 102 |
| 4 | Norma Fisher | false | true | true | 4 | 103 |

Participants are individuals or entities associated with events and coverage policies. The `participants` table records each participant's `participant_id`, `participant_name`, `participant_type`, `registration_date`, `event_id`, and `coverage_policy_id`. Participants may be individuals, organizations, or other entities, and their registration ties them to specific events and the policies covering those events.

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

The `organizations_officers` table establishes the many-to-many relationship between organizations and their officers. Each row links an `organization_id` to an `officer_id`, with a `role_assignment_date` and `is_active` flag indicating the status of the assignment. This junction table allows organizations to have multiple officers and officers to serve across multiple organizations.

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

The `events_participants` table links events to their participants. Each row connects an `event_id` to a `participant_id`, with a `registration_date` and `attendance_status` field. This junction table supports the tracking of which participants are associated with which events, enabling coverage and attendance reporting.

The following views provide joined perspectives across these base tables, answering specific operational questions.

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

The `insurance_application_organization_view` joins insurance applications with their corresponding organizations, answering which organization submitted each application and what its operational characteristics are. For application `505997` from Staples Inc., the view reveals the organization Shell Oil with license `LIC-2589`, formed on `2023-10-24`, and flagged for both coach instruction and injury control programs. This join allows administrators to assess an application against the organization's programmatic capabilities.

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

The `insurance_application_event_view` links applications to their associated events, answering which event an application covers and what the event's parameters are. Application `1250196` from Oscar Health Inc. connects to the Integrated Framework event at Regional Initiative, expected to draw 21 attendees on `2023-02-12`, with pilot-coverage-56 requested. This view supports event-level risk assessment tied to specific applications.

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

The `insurance_application_coverage_policy_view` joins applications with their coverage policies, answering what terms and limits apply to each application. Application `124` from Atlantic Richfield is covered by policy `1562847` providing baseline-coverage-55 with a limit of `28.60` and a deductible of `3,374`, marked as excess coverage with a threshold of `8.10`. This view enables direct comparison of policy terms across applications.

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

The `insurance_application_claim_record_view` connects applications to their claim records, answering whether an application has an associated claim and what its status is. Application `IVC20det40` from Port Loko links to claim record `1003`, allowing administrators to trace claims back to their originating applications and assess claim frequency by organization.

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

The `organization_officer_detail_view` provides a detailed view of officers within organizations, answering who serves as an officer and what their role entails. For organization Shell Oil, officer Theodore Mcgrath (ID `103165`) holds the title Distributed Standard, serves as an insurance coordinator, and carries role code `6969430`. This view supports organizational staffing and compliance reviews.

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

The `organization_officer_view` offers a streamlined listing of officers per organization, answering which officers are associated with each organization and their appointment dates. Organization 100 (Shell Oil) has officer Theodore Mcgrath appointed on `2022-05-03`, while organization 101 (GlobalPlatform Inc.) has officer Account Name appointed on `2023-10-14`. This view supports quick organizational roster lookups.

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

The `organization_insurance_application_view` joins organizations with their insurance applications, answering which applications each organization has submitted and their submission dates. Shell Oil (ID 100) submitted application `505997` on `2025-04-24T03:57:00` with binding authority, while GlobalPlatform Inc. (ID 101) submitted application `1250196` on `2022-09-08T10:14:00` without binding authority. This view supports application tracking at the organizational level.

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

The `organization_event_view` links organizations to their events, answering which events each organization hosts or sponsors. Shell Oil is associated with the Seasonal Standard event at Legacy Review D on `2022-09-01` with 15 expected attendees, while Whatsapp Inc. hosts the Extended Protocol D event on `2024-07-23` with 27 expected attendees. This view supports event portfolio management.

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

The `officer_organization_view` connects officers to their organizations, answering which organization each officer serves. Officer Theodore Mcgrath (ID `103165`) serves organization 100 (Shell Oil), while officer Norma Fisher (ID `7441150`) serves organization 103 (American Institutes for Research). This view supports cross-organizational officer tracking.

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

The `officer_officer_role_view` joins officers with their role definitions, answering what role each officer holds and its characteristics. Officer Theodore Mcgrath holds role code `6969430` (Seasonal Programme), which is non-executive and requires insurance training. Officer Account Name holds role `lu_tax_code_template_m16` (Integrated Standard), which is executive but does not require training. This view supports role compliance verification.

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

The `event_organization_view` links events to their parent organizations, answering which organization is responsible for each event. The Seasonal Standard event is organized by Shell Oil (ID 100), while the Integrated Framework event is organized by GlobalPlatform Inc. (ID 101). This view supports organizational event accountability.

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

The `event_coverage_policy_view` joins events with their coverage policies, answering what policy covers each event. The Seasonal Standard event is covered by policy `5844252` (adaptive-coverage-53) with a limit of `22.20`, while the Integrated Framework event is covered by policy `10207142` (distributed-coverage-54) with a limit of `25.40`. This view supports event-level coverage verification.

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

The `event_participant_detail_view` provides detailed participant information for events, answering who participates in each event and their registration details. This view joins events with the `events_participants` junction table and the `participants` table, enabling attendance tracking and participant-level reporting for risk assessment.

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

The `coverage_policy_event_view` connects coverage policies to their associated events, answering which event each policy covers. Policy `5844252` covers event 1 (Seasonal Standard), while policy `10207142` covers event 2 (Integrated Framework). This view supports policy-event mapping for coverage audits.

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

The `coverage_policy_organization_view` links coverage policies to their organizations, answering which organization each policy insures. Policy `5844252` insures organization 100 (Shell Oil), while policy `10207142` insures organization 101 (GlobalPlatform Inc.). This view supports organizational coverage portfolio analysis.

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

The `coverage_policy_participant_view` joins coverage policies with their participants, answering which participants are covered under each policy. Policy `5844252` covers participant 1, while policy `10207142` covers participant 2. This view supports participant-level coverage verification.

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

The `claim_record_organization_view` connects claim records to their organizations, answering which organization filed each claim. Claim record `1000` is associated with organization 100 (Shell Oil), while claim record `1001` is associated with organization 101 (GlobalPlatform Inc.). This view supports claim analysis by organization.

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

The `claim_record_coverage_policy_view` links claim records to their coverage policies, answering which policy a claim was filed under. Claim record `1000` was filed under policy `5844252`, while claim record `1001` was filed under policy `10207142`. This view supports policy-level claim tracking and loss ratio analysis.

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

The `participant_event_view` joins participants with their events, answering which events each participant is registered for. This view uses the `events_participants` junction table to connect participants to events, supporting attendance verification and event participation reporting.

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

The `participant_coverage_policy_view` links participants to their coverage policies, answering which policy covers each participant. Participant 1 is covered under policy `5844252`, while participant 2 is covered under policy `10207142`. This view supports participant coverage verification and eligibility checks.

The data structures described above form a cohesive system for managing insurance applications, organizational officers, events, coverage policies, claims, and participants. Each base table captures a distinct entity or relationship, while the views provide joined perspectives that answer operational questions across the domain. Together, they enable administrators to track applications from submission through coverage to claims, verify officer roles and organizational compliance, assess event risk and attendance, and analyze claims by organization and policy. The foreign-key relationships between tables ensure data integrity across the full lifecycle, from the initial application through to claim resolution.