Health insurance administration sits at the intersection of regulatory compliance, benefit design, and clinical care delivery. A health plan defines the contractual boundary within which eligible individuals receive coverage, while compliance obligations ensure that every plan adheres to the reporting and documentation mandates imposed by law. Plan documents formalize the terms of coverage, reporting requirements specify what must be filed and when, and healthcare providers deliver the clinical services that generate insurance claims. The relational schema models this ecosystem as a set of normalized base tables linked by foreign keys and junction tables, with materialized views reconstructing the multi-table joins that answer the operational questions administrators actually ask.

The seven base tables fall into three conceptual groups. The first group captures the plan itself. The `health_plans` table stores one row per benefit plan, keyed by `id` and annotated with `plan_identifier` (for example, `PLA-2674`), `plan_name` (`Regional Cluster`), `insurance_type` (`fully_insured` or `self_funded`), `grandfathered_status` (`grandfathered` or `non_grandfathered`), `effective_date` and `termination_date`, a boolean `is_cafeteria_plan`, and `employer_size` (ranging from 21 to 36 in the sample data). The second group captures the people and providers. The `eligible_individuals` table records each covered person with `id`, `individual_identifier` (`IND-2258`), `first_name` and `last_name` (`Stephanie Collins`, `Paul Allen`), `date_of_birth`, `relationship_to_employee` (`employee`, `spouse`, `child`, `early_retiree`), `is_adult_dependent`, `coverage_status` (`active`, `terminated`, `pending_enrollment`), and foreign keys `health_plan_id` and `healthcare_provider_id`. The `healthcare_providers` table stores provider identity with `id`, `provider_identifier` (`PRO-2328`), `provider_name` (`Primary Initiative A`), `specialty` (`primary_care`, `ob_gyn`, `pediatrician`, `other`), `license_number` (`LIC-2589`), and `accepts_new_patients`. The third group captures the compliance artifacts. The `compliance_obligations` table holds one row per obligation with `compliance_obligation_id`, `obligation_identifier` (`OBL-2751`), `description` (`Extended Survey`), `compliance_deadline` (an ISO timestamp such as `2023-02-24T01:03:00`), `status` (`pending`, `in_progress`, `complete`, `failed`), `applicable_year` (integer values 34 through 64), `requires_amendment`, `guidance_status` (`awaiting_guidance`, `issued`, `unclear`), and foreign keys `health_plan_id` and `reporting_requirement_id`. The `plan_documents` table stores document metadata with `id`, `document_identifier` (`DOC-2128`), `document_type` (`SPD`, `plan_document`, `wrap_document`, `enrollment_material`), `version_number` (`VER-2245`), `issue_date`, `distribution_status` (`draft`, `approved`, `distributed`, `archived`), `contains_grandfather_status`, `requires_amendment`, and `health_plan_id`. The `reporting_requirements` table records filing mandates with `reporting_requirement_id`, `requirement_identifier` (`REQ-2065`), `report_type` (`W-2`, `quality_of_care`, `exchange_availability`, `minimum_essential_coverage`), `effective_date`, `is_voluntary`, `applicable_entity_size` (`small_employer`, `large_employer`), `status` (`pending`, `active`, `deprecated`), `health_plan_id`, and `created_at`. Finally, the `insurance_claims` table captures individual claims, each linked to an eligible individual and a healthcare provider.

**Table `health_plans`**

| id | plan_identifier | plan_name | insurance_type | grandfathered_status | effective_date | termination_date | is_cafeteria_plan | employer_size |
|---|---|---|---|---|---|---|---|---|
| 100 | PLA-2674 | Regional Cluster | fully_insured | grandfathered | 2023-02-14 | 2022-09-11 | true | 21 |
| 101 | PLA-2676 | Seasonal Review D | self_funded | non_grandfathered | 2024-07-25 | 2023-02-22 | false | 26 |
| 102 | PLA-2678 | Integrated Initiative | fully_insured | grandfathered | 2025-12-09 | 2024-07-06 | true | 31 |
| 103 | PLA-2680 | Extended Model | self_funded | non_grandfathered | 2022-05-20 | 2025-12-17 | false | 36 |

The `health_plans` table is the anchor of the schema. Every other entity either references a plan directly through a foreign key or reaches one through a chain of joins. The `plan_identifier` column provides a human-readable code that maps to the surrogate `id` used in all foreign-key relationships. A plan such as `PLA-2674` (id 100, `Regional Cluster`) is `fully_insured`, `grandfathered`, and operated by an employer of size 21; it is also a `cafeteria_plan`. By contrast, `PLA-2680` (id 103, `Extended Model`) is `self_funded`, `non_grandfathered`, and tied to an employer of size 36. These attributes determine which compliance obligations and reporting requirements apply.

**Table `compliance_obligations`**

| compliance_obligation_id | obligation_identifier | description | compliance_deadline | status | applicable_year | requires_amendment | guidance_status | health_plan_id | reporting_requirement_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | OBL-2751 | Extended Survey | 2023-02-24T01:03:00 | pending | 34 | true | awaiting_guidance | 100 | 1 |
| 101 | OBL-2753 | Pilot Corridor A | 2024-07-08T08:20:00 | in_progress | 44 | false | issued | 101 | 2 |
| 102 | OBL-2755 | Baseline Series | 2025-12-19T15:37:00 | complete | 54 | true | unclear | 102 | 3 |
| 103 | OBL-2757 | Distributed Assessment | 2022-05-03T22:54:00 | failed | 64 | false | awaiting_guidance | 103 | 4 |

Compliance obligations are the regulatory work products that a plan must produce. Each obligation row carries a `health_plan_id` and a `reporting_requirement_id`, establishing a direct many-to-one relationship to both the plan and the reporting requirement. The obligation `OBL-2751` (id 100, `Extended Survey`) is `pending`, has a deadline of `2023-02-24T01:03:00`, applies to year 34, requires an amendment, and is in `awaiting_guidance` status. Its `health_plan_id` of 100 ties it to the `Regional Cluster` plan, while its `reporting_requirement_id` of 1 links it to the `W-2` filing mandate. The `status` column tracks lifecycle progression through `pending`, `in_progress`, `complete`, and `failed`.

**Table `eligible_individuals`**

| id | individual_identifier | first_name | last_name | date_of_birth | relationship_to_employee | is_adult_dependent | coverage_status | health_plan_id | healthcare_provider_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IND-2258 | Stephanie Collins | Paul Allen | 2025-04-02 | employee | false | active | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | IND-2262 | Janice Johnston | Heather Beasley | 2022-09-13 | spouse | true | terminated | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | IND-2266 | Upal Saha | Audrey Taylor | 2023-02-24 | child | false | pending_enrollment | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | IND-2270 | Katherine Snyder | Susan Wagner | 2024-07-08 | early_retiree | true | active | 103 | 4 | 2025-04-16 09:14:00 |

Eligible individuals are the covered persons. Each row records the person's identity, demographic attributes, and enrollment state. The individual `IND-2258` (id 1, `Stephanie Collins`) is an `employee` with `active` coverage under plan 100, assigned to provider 1 (`Primary Initiative A`). The individual `IND-2262` (id 2, `Janice Johnston`) is a `spouse` with `terminated` coverage under plan 101, assigned to provider 2 (`Composite Model`). The `relationship_to_employee` column distinguishes employees from dependents, while `is_adult_dependent` and `coverage_status` refine the enrollment picture. The `healthcare_provider_id` foreign key links each individual to their assigned provider.

**Table `plan_documents`**

| id | document_identifier | document_type | version_number | issue_date | distribution_status | contains_grandfather_status | requires_amendment | health_plan_id |
|---|---|---|---|---|---|---|---|---|
| 1 | DOC-2128 | SPD | VER-2245 | 2023-02-01 | draft | true | true | 100 |
| 2 | DOC-2129 | plan_document | VER-2249 | 2024-07-12 | approved | false | false | 101 |
| 3 | DOC-2130 | wrap_document | VER-2253 | 2025-12-23 | distributed | true | true | 102 |
| 4 | DOC-2131 | enrollment_material | VER-2257 | 2022-05-07 | archived | false | false | 103 |

Plan documents formalize the terms of coverage. The `document_type` column distinguishes Summary Plan Descriptions (`SPD`), generic `plan_document` entries, `wrap_document` overlays, and `enrollment_material`. The document `DOC-2128` (id 1) is an `SPD` at version `VER-2245`, issued on `2023-02-01`, currently in `draft` distribution status, and both `contains_grandfather_status` and `requires_amendment` are true. The document `DOC-2130` (id 3) is a `wrap_document` at version `VER-2253`, issued on `2025-12-23`, already `distributed`, and also requires amendment. Every document row carries a `health_plan_id` foreign key.

**Table `reporting_requirements`**

| reporting_requirement_id | requirement_identifier | report_type | effective_date | is_voluntary | applicable_entity_size | status | health_plan_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | REQ-2065 | W-2 | 2023-02-14 | true | small_employer | pending | 100 | 2025-01-01 00:14:00 |
| 2 | REQ-2068 | quality_of_care | 2024-07-25 | false | large_employer | active | 101 | 2025-02-06 03:14:00 |
| 3 | REQ-2071 | exchange_availability | 2025-12-09 | true | small_employer | deprecated | 102 | 2025-03-11 06:14:00 |
| 4 | REQ-2074 | minimum_essential_coverage | 2022-05-20 | false | large_employer | pending | 103 | 2025-04-16 09:14:00 |

Reporting requirements define the filing mandates. The `report_type` column enumerates the kind of report (`W-2`, `quality_of_care`, `exchange_availability`, `minimum_essential_coverage`). The requirement `REQ-2065` (id 1) is a `W-2` report, effective `2023-02-14`, marked `is_voluntary`, applicable to `small_employer` entities, and currently `pending`. The requirement `REQ-2068` (id 2) is a `quality_of_care` report, effective `2024-07-25`, not voluntary, for `large_employer` entities, and `active`. Each requirement carries a `health_plan_id` foreign key.

**Table `healthcare_providers`**

| id | provider_identifier | provider_name | specialty | license_number | accepts_new_patients |
|---|---|---|---|---|---|
| 1 | PRO-2328 | Primary Initiative A | primary_care | LIC-2589 | true |
| 2 | PRO-2331 | Composite Model | ob_gyn | LIC-2596 | false |
| 3 | PRO-2334 | Compact Cluster | pediatrician | LIC-2603 | true |
| 4 | PRO-2337 | Legacy Review D | other | LIC-2610 | false |

Healthcare providers are the clinical entities that deliver covered services. The `specialty` column captures the provider's clinical focus (`primary_care`, `ob_gyn`, `pediatrician`, `other`). Provider `PRO-2328` (id 1, `Primary Initiative A`) is a `primary_care` physician with license `LIC-2589` who `accepts_new_patients`. Provider `PRO-2331` (id 2, `Composite Model`) is an `ob_gyn` with license `LIC-2596` who does not accept new patients. The `license_number` column provides a regulatory identifier.

**Table `insurance_claims`**

| id | claim_identifier | claim_date | claim_amount | claim_status | covers_over_the_counter | requires_pre_authorization | eligible_individual_id | health_plan_id | healthcare_provider_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | CLA-2155 | 2023-02-19 | 8.88 | submitted | false | true | 1 | 100 | 1 |
| 2 | CLA-2159 | 2024-07-03 | 233.57 | under_review | true | false | 2 | 101 | 2 |
| 3 | CLA-2163 | 2025-12-14 | 105,297 | approved | false | true | 3 | 102 | 3 |
| 4 | CLA-2167 | 2022-05-25 | 303,354 | denied | true | false | 4 | 103 | 4 |

Insurance claims record the utilization events. Each claim is linked to an eligible individual and a healthcare provider through foreign keys, forming the clinical utilization trail that connects people to providers to plans.

The schema also includes seven junction tables that resolve many-to-many relationships not expressible through direct foreign keys in the base tables. The `plans_obligations` table links health plans to compliance obligations, enabling a plan to be associated with multiple obligations and an obligation to be tracked across multiple plan instances. The `plans_individuals` table links health plans to eligible individuals, supporting scenarios where an individual's coverage spans multiple plan versions. The `obligations_documents` and `documents_obligations` tables (dual-directional junctions) link compliance obligations to plan documents, allowing a single obligation to reference multiple document versions and a single document to satisfy multiple obligations. The `individuals_claims` table links eligible individuals to insurance claims, supporting the case where a single individual file contains multiple claims. The `providers_individuals` table links healthcare providers to eligible individuals, and the `providers_claims` table links healthcare providers to insurance claims, together enabling the provider-to-claim and provider-to-individual relationships that the base tables alone do not fully capture.

**Table `plans_obligations`**

| health_plan_id | compliance_obligation_id |
|---|---|
| 100 | 100 |
| 100 | 101 |
| 101 | 101 |
| 101 | 102 |
| 102 | 102 |
| 102 | 103 |
| 103 | 103 |
| 103 | 100 |

**Table `plans_individuals`**

| health_plan_id | eligible_individual_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `obligations_documents`**

| compliance_obligation_id | plan_document_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `individuals_claims`**

| eligible_individual_id | insurance_claim_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `documents_obligations`**

| plan_document_id | compliance_obligation_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `documents_individuals`**

| plan_document_id | eligible_individual_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `providers_individuals`**

| healthcare_provider_id | eligible_individual_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `providers_claims`**

| healthcare_provider_id | insurance_claim_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The junction tables materialize the cardinality-bounded relationships that the ontology expresses as many-to-many object properties. In the relational model, a many-to-many relationship cannot be represented by a single foreign key column; instead, a junction table with two foreign-key columns serves as the bridge. Each row in a junction table asserts that the pair of entities it references participates in the relationship. For example, a row in `plans_obligations` with `health_plan_id = 100` and `compliance_obligation_id = 100` asserts that the `Regional Cluster` plan is subject to the `Extended Survey` obligation. The dual-directional junctions `obligations_documents` and `documents_obligations` reflect the bidirectional nature of the document-obligation relationship in the domain ontology: a document can satisfy an obligation, and an obligation can reference multiple documents.

The materialized views reconstruct the normalized data into denormalized result sets that answer specific administrative questions. Each view joins the relevant base tables and junction tables to produce a single-row-per-fact output.

**View `health_plan_compliance_obligation_detail_view`**

```sql
CREATE VIEW health_plan_compliance_obligation_detail_view AS
SELECT a.id, a.plan_identifier, a.plan_name, b.compliance_obligation_id AS obligation_compliance_obligation_id, b.obligation_identifier AS obligation_obligation_identifier, b.description AS obligation_description
FROM health_plans a
  JOIN plans_obligations j ON j.health_plan_id = a.id
  JOIN compliance_obligations b ON b.compliance_obligation_id = j.compliance_obligation_id;
```

| id | plan_identifier | plan_name | obligation_compliance_obligation_id | obligation_obligation_identifier | obligation_description |
|---|---|---|---|---|---|
| 100 | PLA-2674 | Regional Cluster | 100 | OBL-2751 | Extended Survey |
| 100 | PLA-2674 | Regional Cluster | 101 | OBL-2753 | Pilot Corridor A |
| 101 | PLA-2676 | Seasonal Review D | 101 | OBL-2753 | Pilot Corridor A |
| 101 | PLA-2676 | Seasonal Review D | 102 | OBL-2755 | Baseline Series |
| 102 | PLA-2678 | Integrated Initiative | 102 | OBL-2755 | Baseline Series |
| 102 | PLA-2678 | Integrated Initiative | 103 | OBL-2757 | Distributed Assessment |
| 103 | PLA-2680 | Extended Model | 103 | OBL-2757 | Distributed Assessment |
| 103 | PLA-2680 | Extended Model | 100 | OBL-2751 | Extended Survey |

The `health_plan_compliance_obligation_detail_view` joins `health_plans` to `compliance_obligations` through the `plans_obligations` junction table, producing one row per plan-obligation pairing. It answers the question: "Which compliance obligations apply to which health plans?" A row with `plan_name = Regional Cluster` and `obligation_identifier = OBL-2751` tells the administrator that the `Regional Cluster` plan is subject to the `Extended Survey` obligation, which is currently `pending` with a deadline of `2023-02-24T01:03:00`.

**View `health_plan_eligible_individual_detail_view`**

```sql
CREATE VIEW health_plan_eligible_individual_detail_view AS
SELECT a.id, a.plan_identifier, a.plan_name, b.id AS individual_id, b.individual_identifier AS individual_individual_identifier, b.first_name AS individual_first_name
FROM health_plans a
  JOIN plans_individuals j ON j.health_plan_id = a.id
  JOIN eligible_individuals b ON b.id = j.eligible_individual_id;
```

| id | plan_identifier | plan_name | individual_id | individual_individual_identifier | individual_first_name |
|---|---|---|---|---|---|
| 100 | PLA-2674 | Regional Cluster | 1 | IND-2258 | Stephanie Collins |
| 100 | PLA-2674 | Regional Cluster | 2 | IND-2262 | Janice Johnston |
| 101 | PLA-2676 | Seasonal Review D | 2 | IND-2262 | Janice Johnston |
| 101 | PLA-2676 | Seasonal Review D | 3 | IND-2266 | Upal Saha |
| 102 | PLA-2678 | Integrated Initiative | 3 | IND-2266 | Upal Saha |
| 102 | PLA-2678 | Integrated Initiative | 4 | IND-2270 | Katherine Snyder |
| 103 | PLA-2680 | Extended Model | 4 | IND-2270 | Katherine Snyder |
| 103 | PLA-2680 | Extended Model | 1 | IND-2258 | Stephanie Collins |

The `health_plan_eligible_individual_detail_view` joins `health_plans` to `eligible_individuals` through the `plans_individuals` junction table, answering: "Which eligible individuals are covered under which health plans?" A row showing `plan_name = Regional Cluster` alongside `individual_identifier = IND-2258` and `first_name = Stephanie Collins` reveals that Stephanie Collins is an active employee covered under the Regional Cluster plan.

**View `compliance_obligation_health_plan_view`**

```sql
CREATE VIEW compliance_obligation_health_plan_view AS
SELECT a.compliance_obligation_id, a.obligation_identifier, a.description, a.compliance_deadline, b.id AS plan_id, b.plan_identifier AS plan_plan_identifier, b.plan_name AS plan_plan_name
FROM compliance_obligations a JOIN health_plans b ON a.health_plan_id = b.id;
```

| compliance_obligation_id | obligation_identifier | description | compliance_deadline | plan_id | plan_plan_identifier | plan_plan_name |
|---|---|---|---|---|---|---|
| 100 | OBL-2751 | Extended Survey | 2023-02-24T01:03:00 | 100 | PLA-2674 | Regional Cluster |
| 101 | OBL-2753 | Pilot Corridor A | 2024-07-08T08:20:00 | 101 | PLA-2676 | Seasonal Review D |
| 102 | OBL-2755 | Baseline Series | 2025-12-19T15:37:00 | 102 | PLA-2678 | Integrated Initiative |
| 103 | OBL-2757 | Distributed Assessment | 2022-05-03T22:54:00 | 103 | PLA-2680 | Extended Model |

The `compliance_obligation_health_plan_view` joins `compliance_obligations` back to `health_plans`, answering: "Under which health plan does each compliance obligation fall?" A row with `obligation_identifier = OBL-2751` and `plan_name = Regional Cluster` confirms that the `Extended Survey` obligation belongs to the `Regional Cluster` plan.

**View `compliance_obligation_plan_document_detail_view`**

```sql
CREATE VIEW compliance_obligation_plan_document_detail_view AS
SELECT a.compliance_obligation_id, a.obligation_identifier, a.description, b.id AS document_id, b.document_identifier AS document_document_identifier, b.document_type AS document_document_type
FROM compliance_obligations a
  JOIN obligations_documents j ON j.compliance_obligation_id = a.compliance_obligation_id
  JOIN plan_documents b ON b.id = j.plan_document_id;
```

| compliance_obligation_id | obligation_identifier | description | document_id | document_document_identifier | document_document_type |
|---|---|---|---|---|---|
| 100 | OBL-2751 | Extended Survey | 1 | DOC-2128 | SPD |
| 100 | OBL-2751 | Extended Survey | 2 | DOC-2129 | plan_document |
| 101 | OBL-2753 | Pilot Corridor A | 2 | DOC-2129 | plan_document |
| 101 | OBL-2753 | Pilot Corridor A | 3 | DOC-2130 | wrap_document |
| 102 | OBL-2755 | Baseline Series | 3 | DOC-2130 | wrap_document |
| 102 | OBL-2755 | Baseline Series | 4 | DOC-2131 | enrollment_material |
| 103 | OBL-2757 | Distributed Assessment | 4 | DOC-2131 | enrollment_material |
| 103 | OBL-2757 | Distributed Assessment | 1 | DOC-2128 | SPD |

The `compliance_obligation_plan_document_detail_view` joins `compliance_obligations` to `plan_documents` through the `obligations_documents` junction table, answering: "Which plan documents are associated with which compliance obligations?" A row linking `obligation_identifier = OBL-2751` to `document_identifier = DOC-2128` (an `SPD` of type `SPD` at version `VER-2245`) shows that the `Extended Survey` obligation references the Summary Plan Description document.

**View `compliance_obligation_reporting_requirement_view`**

```sql
CREATE VIEW compliance_obligation_reporting_requirement_view AS
SELECT a.compliance_obligation_id, a.obligation_identifier, a.description, a.compliance_deadline, b.reporting_requirement_id AS requirement_reporting_requirement_id, b.requirement_identifier AS requirement_requirement_identifier, b.report_type AS requirement_report_type
FROM compliance_obligations a JOIN reporting_requirements b ON a.reporting_requirement_id = b.reporting_requirement_id;
```

| compliance_obligation_id | obligation_identifier | description | compliance_deadline | requirement_reporting_requirement_id | requirement_requirement_identifier | requirement_report_type |
|---|---|---|---|---|---|---|
| 100 | OBL-2751 | Extended Survey | 2023-02-24T01:03:00 | 1 | REQ-2065 | W-2 |
| 101 | OBL-2753 | Pilot Corridor A | 2024-07-08T08:20:00 | 2 | REQ-2068 | quality_of_care |
| 102 | OBL-2755 | Baseline Series | 2025-12-19T15:37:00 | 3 | REQ-2071 | exchange_availability |
| 103 | OBL-2757 | Distributed Assessment | 2022-05-03T22:54:00 | 4 | REQ-2074 | minimum_essential_coverage |

The `compliance_obligation_reporting_requirement_view` joins `compliance_obligations` to `reporting_requirements`, answering: "Which reporting requirement is tied to each compliance obligation?" A row with `obligation_identifier = OBL-2751` and `requirement_identifier = REQ-2065` reveals that the `Extended Survey` obligation is linked to the `W-2` reporting requirement, which is `pending` and applicable to `small_employer` entities.

**View `eligible_individual_health_plan_view`**

```sql
CREATE VIEW eligible_individual_health_plan_view AS
SELECT a.id, a.individual_identifier, a.first_name, a.last_name, b.id AS plan_id, b.plan_identifier AS plan_plan_identifier, b.plan_name AS plan_plan_name
FROM eligible_individuals a JOIN health_plans b ON a.health_plan_id = b.id;
```

| id | individual_identifier | first_name | last_name | plan_id | plan_plan_identifier | plan_plan_name |
|---|---|---|---|---|---|---|
| 1 | IND-2258 | Stephanie Collins | Paul Allen | 100 | PLA-2674 | Regional Cluster |
| 2 | IND-2262 | Janice Johnston | Heather Beasley | 101 | PLA-2676 | Seasonal Review D |
| 3 | IND-2266 | Upal Saha | Audrey Taylor | 102 | PLA-2678 | Integrated Initiative |
| 4 | IND-2270 | Katherine Snyder | Susan Wagner | 103 | PLA-2680 | Extended Model |

The `eligible_individual_health_plan_view` joins `eligible_individuals` to `health_plans`, answering: "Which health plan covers each eligible individual?" A row with `individual_identifier = IND-2258` and `plan_name = Regional Cluster` shows that Stephanie Collins is covered under the Regional Cluster plan.

**View `eligible_individual_healthcare_provider_view`**

```sql
CREATE VIEW eligible_individual_healthcare_provider_view AS
SELECT a.id, a.individual_identifier, a.first_name, a.last_name, b.id AS provider_id, b.provider_identifier AS provider_provider_identifier, b.provider_name AS provider_provider_name
FROM eligible_individuals a JOIN healthcare_providers b ON a.healthcare_provider_id = b.id;
```

| id | individual_identifier | first_name | last_name | provider_id | provider_provider_identifier | provider_provider_name |
|---|---|---|---|---|---|---|
| 1 | IND-2258 | Stephanie Collins | Paul Allen | 1 | PRO-2328 | Primary Initiative A |
| 2 | IND-2262 | Janice Johnston | Heather Beasley | 2 | PRO-2331 | Composite Model |
| 3 | IND-2266 | Upal Saha | Audrey Taylor | 3 | PRO-2334 | Compact Cluster |
| 4 | IND-2270 | Katherine Snyder | Susan Wagner | 4 | PRO-2337 | Legacy Review D |

The `eligible_individual_healthcare_provider_view` joins `eligible_individuals` to `healthcare_providers` through the `providers_individuals` junction table, answering: "Which healthcare provider is assigned to each eligible individual?" A row with `individual_identifier = IND-2258` and `provider_name = Primary Initiative A` reveals that Stephanie Collins is assigned to the `Primary Initiative A` provider, a `primary_care` physician.

**View `eligible_individual_insurance_claim_detail_view`**

```sql
CREATE VIEW eligible_individual_insurance_claim_detail_view AS
SELECT a.id, a.individual_identifier, a.first_name, b.id AS claim_id, b.claim_identifier AS claim_claim_identifier, b.claim_date AS claim_claim_date
FROM eligible_individuals a
  JOIN individuals_claims j ON j.eligible_individual_id = a.id
  JOIN insurance_claims b ON b.id = j.insurance_claim_id;
```

| id | individual_identifier | first_name | claim_id | claim_claim_identifier | claim_claim_date |
|---|---|---|---|---|---|
| 1 | IND-2258 | Stephanie Collins | 1 | CLA-2155 | 2023-02-19 |
| 1 | IND-2258 | Stephanie Collins | 2 | CLA-2159 | 2024-07-03 |
| 2 | IND-2262 | Janice Johnston | 2 | CLA-2159 | 2024-07-03 |
| 2 | IND-2262 | Janice Johnston | 3 | CLA-2163 | 2025-12-14 |
| 3 | IND-2266 | Upal Saha | 3 | CLA-2163 | 2025-12-14 |
| 3 | IND-2266 | Upal Saha | 4 | CLA-2167 | 2022-05-25 |
| 4 | IND-2270 | Katherine Snyder | 4 | CLA-2167 | 2022-05-25 |
| 4 | IND-2270 | Katherine Snyder | 1 | CLA-2155 | 2023-02-19 |

The `eligible_individual_insurance_claim_detail_view` joins `eligible_individuals` to `insurance_claims` through the `individuals_claims` junction table, answering: "Which insurance claims are filed by which eligible individuals?" A row with `individual_identifier = IND-2258` and a claim identifier shows that Stephanie Collins has filed insurance claims, linking her coverage to actual utilization events.

**View `plan_document_health_plan_view`**

```sql
CREATE VIEW plan_document_health_plan_view AS
SELECT a.id, a.document_identifier, a.document_type, a.version_number, b.id AS plan_id, b.plan_identifier AS plan_plan_identifier, b.plan_name AS plan_plan_name
FROM plan_documents a JOIN health_plans b ON a.health_plan_id = b.id;
```

| id | document_identifier | document_type | version_number | plan_id | plan_plan_identifier | plan_plan_name |
|---|---|---|---|---|---|---|
| 1 | DOC-2128 | SPD | VER-2245 | 100 | PLA-2674 | Regional Cluster |
| 2 | DOC-2129 | plan_document | VER-2249 | 101 | PLA-2676 | Seasonal Review D |
| 3 | DOC-2130 | wrap_document | VER-2253 | 102 | PLA-2678 | Integrated Initiative |
| 4 | DOC-2131 | enrollment_material | VER-2257 | 103 | PLA-2680 | Extended Model |

The `plan_document_health_plan_view` joins `plan_documents` to `health_plans`, answering: "Which health plan does each plan document belong to?" A row with `document_identifier = DOC-2128` and `plan_name = Regional Cluster` shows that the `SPD` document `DOC-2128` belongs to the Regional Cluster plan.

**View `plan_document_compliance_obligation_detail_view`**

```sql
CREATE VIEW plan_document_compliance_obligation_detail_view AS
SELECT a.id, a.document_identifier, a.document_type, b.compliance_obligation_id AS obligation_compliance_obligation_id, b.obligation_identifier AS obligation_obligation_identifier, b.description AS obligation_description
FROM plan_documents a
  JOIN documents_obligations j ON j.plan_document_id = a.id
  JOIN compliance_obligations b ON b.compliance_obligation_id = j.compliance_obligation_id;
```

| id | document_identifier | document_type | obligation_compliance_obligation_id | obligation_obligation_identifier | obligation_description |
|---|---|---|---|---|---|
| 1 | DOC-2128 | SPD | 100 | OBL-2751 | Extended Survey |
| 1 | DOC-2128 | SPD | 101 | OBL-2753 | Pilot Corridor A |
| 2 | DOC-2129 | plan_document | 101 | OBL-2753 | Pilot Corridor A |
| 2 | DOC-2129 | plan_document | 102 | OBL-2755 | Baseline Series |
| 3 | DOC-2130 | wrap_document | 102 | OBL-2755 | Baseline Series |
| 3 | DOC-2130 | wrap_document | 103 | OBL-2757 | Distributed Assessment |
| 4 | DOC-2131 | enrollment_material | 103 | OBL-2757 | Distributed Assessment |
| 4 | DOC-2131 | enrollment_material | 100 | OBL-2751 | Extended Survey |

The `plan_document_compliance_obligation_detail_view` joins `plan_documents` to `compliance_obligations` through the `documents_obligations` junction table, answering: "Which compliance obligations reference which plan documents?" A row with `document_identifier = DOC-2128` and `obligation_identifier = OBL-2751` shows that the `Extended Survey` obligation references the `SPD` document `DOC-2128`.

**View `plan_document_eligible_individual_detail_view`**

```sql
CREATE VIEW plan_document_eligible_individual_detail_view AS
SELECT a.id, a.document_identifier, a.document_type, b.id AS individual_id, b.individual_identifier AS individual_individual_identifier, b.first_name AS individual_first_name
FROM plan_documents a
  JOIN documents_individuals j ON j.plan_document_id = a.id
  JOIN eligible_individuals b ON b.id = j.eligible_individual_id;
```

| id | document_identifier | document_type | individual_id | individual_individual_identifier | individual_first_name |
|---|---|---|---|---|---|
| 1 | DOC-2128 | SPD | 1 | IND-2258 | Stephanie Collins |
| 1 | DOC-2128 | SPD | 2 | IND-2262 | Janice Johnston |
| 2 | DOC-2129 | plan_document | 2 | IND-2262 | Janice Johnston |
| 2 | DOC-2129 | plan_document | 3 | IND-2266 | Upal Saha |
| 3 | DOC-2130 | wrap_document | 3 | IND-2266 | Upal Saha |
| 3 | DOC-2130 | wrap_document | 4 | IND-2270 | Katherine Snyder |
| 4 | DOC-2131 | enrollment_material | 4 | IND-2270 | Katherine Snyder |
| 4 | DOC-2131 | enrollment_material | 1 | IND-2258 | Stephanie Collins |

The `plan_document_eligible_individual_detail_view` joins `plan_documents` to `eligible_individuals` through the `documents_individuals` junction table, answering: "Which eligible individuals are associated with which plan documents?" A row with `document_identifier = DOC-2128` and `individual_identifier = IND-2258` shows that Stephanie Collins is associated with the `SPD` document `DOC-2128`, indicating she has received or is subject to the terms of that document.

**View `reporting_requirement_health_plan_view`**

```sql
CREATE VIEW reporting_requirement_health_plan_view AS
SELECT a.reporting_requirement_id, a.requirement_identifier, a.report_type, a.effective_date, b.id AS plan_id, b.plan_identifier AS plan_plan_identifier, b.plan_name AS plan_plan_name
FROM reporting_requirements a JOIN health_plans b ON a.health_plan_id = b.id;
```

| reporting_requirement_id | requirement_identifier | report_type | effective_date | plan_id | plan_plan_identifier | plan_plan_name |
|---|---|---|---|---|---|---|
| 1 | REQ-2065 | W-2 | 2023-02-14 | 100 | PLA-2674 | Regional Cluster |
| 2 | REQ-2068 | quality_of_care | 2024-07-25 | 101 | PLA-2676 | Seasonal Review D |
| 3 | REQ-2071 | exchange_availability | 2025-12-09 | 102 | PLA-2678 | Integrated Initiative |
| 4 | REQ-2074 | minimum_essential_coverage | 2022-05-20 | 103 | PLA-2680 | Extended Model |

The `reporting_requirement_health_plan_view` joins `reporting_requirements` to `health_plans`, answering: "Which health plan is subject to each reporting requirement?" A row with `requirement_identifier = REQ-2065` and `plan_name = Regional Cluster` shows that the `W-2` reporting requirement applies to the Regional Cluster plan.

**View `healthcare_provider_eligible_individual_detail_view`**

```sql
CREATE VIEW healthcare_provider_eligible_individual_detail_view AS
SELECT a.id, a.provider_identifier, a.provider_name, b.id AS individual_id, b.individual_identifier AS individual_individual_identifier, b.first_name AS individual_first_name
FROM healthcare_providers a
  JOIN providers_individuals j ON j.healthcare_provider_id = a.id
  JOIN eligible_individuals b ON b.id = j.eligible_individual_id;
```

| id | provider_identifier | provider_name | individual_id | individual_individual_identifier | individual_first_name |
|---|---|---|---|---|---|
| 1 | PRO-2328 | Primary Initiative A | 1 | IND-2258 | Stephanie Collins |
| 1 | PRO-2328 | Primary Initiative A | 2 | IND-2262 | Janice Johnston |
| 2 | PRO-2331 | Composite Model | 2 | IND-2262 | Janice Johnston |
| 2 | PRO-2331 | Composite Model | 3 | IND-2266 | Upal Saha |
| 3 | PRO-2334 | Compact Cluster | 3 | IND-2266 | Upal Saha |
| 3 | PRO-2334 | Compact Cluster | 4 | IND-2270 | Katherine Snyder |
| 4 | PRO-2337 | Legacy Review D | 4 | IND-2270 | Katherine Snyder |
| 4 | PRO-2337 | Legacy Review D | 1 | IND-2258 | Stephanie Collins |

The `healthcare_provider_eligible_individual_detail_view` joins `healthcare_providers` to `eligible_individuals` through the `providers_individuals` junction table, answering: "Which eligible individuals are assigned to which healthcare providers?" A row with `provider_name = Primary Initiative A` and `individual_identifier = IND-2258` reveals that the `Primary Initiative A` provider serves Stephanie Collins, an active employee under the Regional Cluster plan.

**View `healthcare_provider_insurance_claim_detail_view`**

```sql
CREATE VIEW healthcare_provider_insurance_claim_detail_view AS
SELECT a.id, a.provider_identifier, a.provider_name, b.id AS claim_id, b.claim_identifier AS claim_claim_identifier, b.claim_date AS claim_claim_date
FROM healthcare_providers a
  JOIN providers_claims j ON j.healthcare_provider_id = a.id
  JOIN insurance_claims b ON b.id = j.insurance_claim_id;
```

| id | provider_identifier | provider_name | claim_id | claim_claim_identifier | claim_claim_date |
|---|---|---|---|---|---|
| 1 | PRO-2328 | Primary Initiative A | 1 | CLA-2155 | 2023-02-19 |
| 1 | PRO-2328 | Primary Initiative A | 2 | CLA-2159 | 2024-07-03 |
| 2 | PRO-2331 | Composite Model | 2 | CLA-2159 | 2024-07-03 |
| 2 | PRO-2331 | Composite Model | 3 | CLA-2163 | 2025-12-14 |
| 3 | PRO-2334 | Compact Cluster | 3 | CLA-2163 | 2025-12-14 |
| 3 | PRO-2334 | Compact Cluster | 4 | CLA-2167 | 2022-05-25 |
| 4 | PRO-2337 | Legacy Review D | 4 | CLA-2167 | 2022-05-25 |
| 4 | PRO-2337 | Legacy Review D | 1 | CLA-2155 | 2023-02-19 |

The `healthcare_provider_insurance_claim_detail_view` joins `healthcare_providers` to `insurance_claims` through the `providers_claims` junction table, answering: "Which insurance claims were rendered by which healthcare providers?" A row with `provider_name = Primary Initiative A` and a claim identifier shows that the `Primary Initiative A` provider has submitted insurance claims, linking clinical delivery to financial reimbursement.

**View `insurance_claim_eligible_individual_view`**

```sql
CREATE VIEW insurance_claim_eligible_individual_view AS
SELECT a.id, a.claim_identifier, a.claim_date, a.claim_amount, b.id AS individual_id, b.individual_identifier AS individual_individual_identifier, b.first_name AS individual_first_name
FROM insurance_claims a JOIN eligible_individuals b ON a.eligible_individual_id = b.id;
```

| id | claim_identifier | claim_date | claim_amount | individual_id | individual_individual_identifier | individual_first_name |
|---|---|---|---|---|---|---|
| 1 | CLA-2155 | 2023-02-19 | 8.88 | 1 | IND-2258 | Stephanie Collins |
| 2 | CLA-2159 | 2024-07-03 | 233.57 | 2 | IND-2262 | Janice Johnston |
| 3 | CLA-2163 | 2025-12-14 | 105,297 | 3 | IND-2266 | Upal Saha |
| 4 | CLA-2167 | 2022-05-25 | 303,354 | 4 | IND-2270 | Katherine Snyder |

The `insurance_claim_eligible_individual_view` joins `insurance_claims` to `eligible_individuals`, answering: "Which eligible individual filed each insurance claim?" A row with `individual_identifier = IND-2258` and a claim identifier shows that Stephanie Collins is the individual behind the claim, connecting the utilization event to the covered person.

**View `insurance_claim_health_plan_view`**

```sql
CREATE VIEW insurance_claim_health_plan_view AS
SELECT a.id, a.claim_identifier, a.claim_date, a.claim_amount, b.id AS plan_id, b.plan_identifier AS plan_plan_identifier, b.plan_name AS plan_plan_name
FROM insurance_claims a JOIN health_plans b ON a.health_plan_id = b.id;
```

| id | claim_identifier | claim_date | claim_amount | plan_id | plan_plan_identifier | plan_plan_name |
|---|---|---|---|---|---|---|
| 1 | CLA-2155 | 2023-02-19 | 8.88 | 100 | PLA-2674 | Regional Cluster |
| 2 | CLA-2159 | 2024-07-03 | 233.57 | 101 | PLA-2676 | Seasonal Review D |
| 3 | CLA-2163 | 2025-12-14 | 105,297 | 102 | PLA-2678 | Integrated Initiative |
| 4 | CLA-2167 | 2022-05-25 | 303,354 | 103 | PLA-2680 | Extended Model |

The `insurance_claim_health_plan_view` joins `insurance_claims` to `health_plans`, answering: "Which health plan is responsible for each insurance claim?" A row with `plan_name = Regional Cluster` and a claim identifier shows that the Regional Cluster plan is the payer for the claim, linking the financial liability to the benefit plan.

**View `insurance_claim_healthcare_provider_view`**

```sql
CREATE VIEW insurance_claim_healthcare_provider_view AS
SELECT a.id, a.claim_identifier, a.claim_date, a.claim_amount, b.id AS provider_id, b.provider_identifier AS provider_provider_identifier, b.provider_name AS provider_provider_name
FROM insurance_claims a JOIN healthcare_providers b ON a.healthcare_provider_id = b.id;
```

| id | claim_identifier | claim_date | claim_amount | provider_id | provider_provider_identifier | provider_provider_name |
|---|---|---|---|---|---|---|
| 1 | CLA-2155 | 2023-02-19 | 8.88 | 1 | PRO-2328 | Primary Initiative A |
| 2 | CLA-2159 | 2024-07-03 | 233.57 | 2 | PRO-2331 | Composite Model |
| 3 | CLA-2163 | 2025-12-14 | 105,297 | 3 | PRO-2334 | Compact Cluster |
| 4 | CLA-2167 | 2022-05-25 | 303,354 | 4 | PRO-2337 | Legacy Review D |

The `insurance_claim_healthcare_provider_view` joins `insurance_claims` to `healthcare_providers`, answering: "Which healthcare provider submitted each insurance claim?" A row with `provider_name = Primary Initiative A` and a claim identifier shows that the `Primary Initiative A` provider is the claimant, connecting the clinical service to the billing entity.

The schema as a whole models a healthcare benefits administration domain where health plans serve as the central organizing entity. Compliance obligations, plan documents, and reporting requirements are regulatory artifacts attached to plans, while eligible individuals and healthcare providers represent the human and clinical actors. Insurance claims form the utilization layer that connects individuals to providers and, transitively, to plans. The junction tables resolve the many-to-many relationships that the ontology expresses as symmetric or reflexive object properties, and the materialized views reconstruct the normalized data into the denormalized result sets that administrators use to answer compliance, eligibility, and utilization questions. The foreign-key chains — from `health_plans` through `plans_obligations` to `compliance_obligations`, from `eligible_individuals` through `individuals_claims` to `insurance_claims`, and from `healthcare_providers` through `providers_claims` to `insurance_claims` — form the structural backbone that the views query to produce actionable insights.