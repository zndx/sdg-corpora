Health plan compliance management operates at the intersection of regulatory oversight, employer responsibility, and individual coverage. Organizations administer benefit programs that must satisfy federal and state mandates while maintaining accurate records of eligible participants, contracted providers, and required filings. The compliance lifecycle begins with a health plan's establishment, proceeds through documentation and obligation tracking, and culminates in ongoing reporting and claims resolution. Each stage generates structured records that, when examined together, reveal the operational health of a benefit program. This chapter walks through the core entities, their interrelationships, and the analytical views that surface actionable detail.

## Health Plans and Their Structure

At the center of the compliance ecosystem sits the health plan itself—a formal benefit arrangement governed by specific insurance structures and employer parameters.

**Table `health_plans`**

| id | plan_identifier | plan_name | insurance_type | grandfathered_status | effective_date | termination_date | is_cafeteria_plan | employer_size |
|---|---|---|---|---|---|---|---|---|
| 100 | PLA-2674 | Regional Cluster | fully_insured | grandfathered | 2023-02-14 | 2022-09-11 | true | 21 |
| 101 | PLA-2676 | Seasonal Review D | self_funded | non_grandfathered | 2024-07-25 | 2023-02-22 | false | 26 |
| 102 | PLA-2678 | Integrated Initiative | fully_insured | grandfathered | 2025-12-09 | 2024-07-06 | true | 31 |
| 103 | PLA-2680 | Extended Model | self_funded | non_grandfathered | 2022-05-20 | 2025-12-17 | false | 36 |

Each plan carries a unique identifier such as PLA-2674 or PLA-2680, alongside a descriptive name like Regional Cluster or Extended Model. The insurance_type field distinguishes fully_insured arrangements from self_funded ones, a classification that determines where risk resides. The grandfathered_status field tracks whether a plan retains grandfathered benefit status under the Affordable Care Act, which carries distinct regulatory exemptions. Effective dates and termination dates define the plan's operational window; note that termination dates may precede effective dates in the data, reflecting administrative backdating or plan restructuring. The is_cafeteria_plan flag indicates whether the plan qualifies under Section 125, and employer_size records the headcount bracket that influences certain reporting thresholds.

## Compliance Obligations and Deadlines

Every health plan generates a set of compliance obligations—specific regulatory duties with defined deadlines and statuses.

**Table `compliance_obligations`**

| compliance_obligation_id | obligation_identifier | description | compliance_deadline | status | applicable_year | requires_amendment | guidance_status | health_plan_id | reporting_requirement_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | OBL-2751 | Extended Survey | 2023-02-24T01:03:00 | pending | 34 | true | awaiting_guidance | 100 | 1 |
| 101 | OBL-2753 | Pilot Corridor A | 2024-07-08T08:20:00 | in_progress | 44 | false | issued | 101 | 2 |
| 102 | OBL-2755 | Baseline Series | 2025-12-19T15:37:00 | complete | 54 | true | unclear | 102 | 3 |
| 103 | OBL-2757 | Distributed Assessment | 2022-05-03T22:54:00 | failed | 64 | false | awaiting_guidance | 103 | 4 |

An obligation such as OBL-2751 (Extended Survey) carries a compliance_deadline in ISO 8601 format, a status ranging from pending through in_progress to complete or failed, and an applicable_year that anchors it to a fiscal cycle. The requires_amendment flag signals whether the obligation triggers a plan document revision, while guidance_status (awaiting_guidance, issued, or unclear) reflects the regulator's current position. Each obligation references a health_plan_id and a reporting_requirement_id, tying the duty to both the plan and the underlying reporting mandate.

## Eligible Individuals and Coverage

The individuals covered under a health plan form the population that compliance measures protect.

**Table `eligible_individuals`**

| id | individual_identifier | first_name | last_name | date_of_birth | relationship_to_employee | is_adult_dependent | coverage_status | health_plan_id | healthcare_provider_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | IND-2258 | Stephanie Collins | Paul Allen | 2025-04-02 | employee | false | active | 100 | 1 | 2025-01-01 00:14:00 |
| 2 | IND-2262 | Janice Johnston | Heather Beasley | 2022-09-13 | spouse | true | terminated | 101 | 2 | 2025-02-06 03:14:00 |
| 3 | IND-2266 | Upal Saha | Audrey Taylor | 2023-02-24 | child | false | pending_enrollment | 102 | 3 | 2025-03-11 06:14:00 |
| 4 | IND-2270 | Katherine Snyder | Susan Wagner | 2024-07-08 | early_retiree | true | active | 103 | 4 | 2025-04-16 09:14:00 |

Records like IND-2258 (Stephanie Collins) and IND-2262 (Janice Johnston) encode the relationship_to_employee—employee, spouse, child, or early_retiree—and whether the person is an adult_dependent. The coverage_status field tracks active, terminated, or pending_enrollment states. Each individual record links to a health_plan_id and a healthcare_provider_id, establishing the care network that supports the covered population.

## Plan Documents and Distribution

Regulatory compliance requires that plan documents be drafted, approved, and distributed according to strict timelines.

**Table `plan_documents`**

| id | document_identifier | document_type | version_number | issue_date | distribution_status | contains_grandfather_status | requires_amendment | health_plan_id |
|---|---|---|---|---|---|---|---|---|
| 1 | DOC-2128 | SPD | VER-2245 | 2023-02-01 | draft | true | true | 100 |
| 2 | DOC-2129 | plan_document | VER-2249 | 2024-07-12 | approved | false | false | 101 |
| 3 | DOC-2130 | wrap_document | VER-2253 | 2025-12-23 | distributed | true | true | 102 |
| 4 | DOC-2131 | enrollment_material | VER-2257 | 2022-05-07 | archived | false | false | 103 |

Document types include SPD (Summary Plan Description), plan_document, wrap_document, and enrollment_material, each identified by a code like DOC-2128. The version_number (VER-2245, VER-2249, etc.) tracks revisions, while distribution_status—draft, approved, distributed, or archived—indicates the document's lifecycle stage. The contains_grandfather_status flag mirrors the plan's own grandfathered classification, and requires_amendment signals whether the document must be updated in response to a compliance obligation.

## Reporting Requirements

Health plans must file specific reports with regulatory bodies, each governed by its own set of rules.

**Table `reporting_requirements`**

| reporting_requirement_id | requirement_identifier | report_type | effective_date | is_voluntary | applicable_entity_size | status | health_plan_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1 | REQ-2065 | W-2 | 2023-02-14 | true | small_employer | pending | 100 | 2025-01-01 00:14:00 |
| 2 | REQ-2068 | quality_of_care | 2024-07-25 | false | large_employer | active | 101 | 2025-02-06 03:14:00 |
| 3 | REQ-2071 | exchange_availability | 2025-12-09 | true | small_employer | deprecated | 102 | 2025-03-11 06:14:00 |
| 4 | REQ-2074 | minimum_essential_coverage | 2022-05-20 | false | large_employer | pending | 103 | 2025-04-16 09:14:00 |

A reporting requirement such as REQ-2065 (W-2) or REQ-2074 (minimum_essential_coverage) specifies a report_type, an effective_date, and whether filing is voluntary. The applicable_entity_size field (small_employer or large_employer) determines which organizations must comply, while status (pending, active, deprecated) reflects the requirement's current enforceability. Each requirement is associated with a health_plan_id, anchoring the filing obligation to the plan that generates the data.

## Healthcare Providers

The network of healthcare providers delivers the services that health plans cover.

**Table `healthcare_providers`**

| id | provider_identifier | provider_name | specialty | license_number | accepts_new_patients |
|---|---|---|---|---|---|
| 1 | PRO-2328 | Primary Initiative A | primary_care | LIC-2589 | true |
| 2 | PRO-2331 | Composite Model | ob_gyn | LIC-2596 | false |
| 3 | PRO-2334 | Compact Cluster | pediatrician | LIC-2603 | true |
| 4 | PRO-2337 | Legacy Review D | other | LIC-2610 | false |

Providers such as PRO-2328 (Primary Initiative A) and PRO-2337 (Legacy Review D) are categorized by specialty—primary_care, ob_gyn, pediatrician, or other—and identified by a license_number like LIC-2589. The accepts_new_patients flag indicates current intake capacity, which is relevant for network adequacy assessments. Each provider is linked to eligible individuals, forming the care delivery chain.

## Insurance Claims

Insurance claims represent the operational output of a health plan—the actual utilization of covered services.

**Table `insurance_claims`**

| id | claim_identifier | claim_date | claim_amount | claim_status | covers_over_the_counter | requires_pre_authorization | eligible_individual_id | health_plan_id | healthcare_provider_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | CLA-2155 | 2023-02-19 | 8.88 | submitted | false | true | 1 | 100 | 1 |
| 2 | CLA-2159 | 2024-07-03 | 233.57 | under_review | true | false | 2 | 101 | 2 |
| 3 | CLA-2163 | 2025-12-14 | 105,297 | approved | false | true | 3 | 102 | 3 |
| 4 | CLA-2167 | 2022-05-25 | 303,354 | denied | true | false | 4 | 103 | 4 |

Each claim records a claim_identifier, the date of service, the amount billed, the amount paid, and the adjudication status (paid, denied, pending, or in_review). The claim references an eligible_individual_id and a healthcare_provider_id, connecting the financial transaction to the person who received care and the provider who delivered it. Claims data feeds into compliance reporting, particularly for quality-of-care and minimum-essential-coverage filings.

## Cross-Reference Relationships

The domain uses associative tables to model many-to-many relationships that cannot be captured by simple foreign keys. These tables record the explicit links between plans, obligations, documents, individuals, providers, and claims.

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

The plans_obligations table records which compliance obligations apply to which health plans. A plan like PLA-2674 may be linked to multiple obligations, and an obligation may span multiple plans. The link_id serves as a unique key for the association, while plan_id and obligation_id reference the parent records. This table enables the tracking of obligation coverage across a portfolio of plans.

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

The plans_individuals table maps eligible individuals to the health plans under which they are covered. An individual such as IND-2258 may appear in multiple plan associations if they are covered under more than one arrangement. The link_id uniquely identifies each association, and the plan_id and individual_id fields anchor the relationship.

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

The obligations_documents table connects compliance obligations to the plan documents that must be amended or produced in response. An obligation like OBL-2751 may require updates to multiple documents, and a single document may satisfy multiple obligations. The link_id identifies the association, while obligation_id and document_id reference the parent records.

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

The individuals_claims table records which insurance claims were filed on behalf of which eligible individuals. This many-to-many link supports scenarios where a single claim involves multiple covered persons or where an individual has claims across different plans. The link_id uniquely identifies the association, and individual_id and claim_id anchor the relationship.

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

The documents_obligations table provides a second associative link between plan documents and compliance obligations, capturing the bidirectional nature of the relationship. While obligations_documents records which documents an obligation requires, documents_obligations records which obligations a document satisfies. The link_id identifies the association, and document_id and obligation_id reference the parent records.

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

The documents_individuals table links eligible individuals to the plan documents that pertain to them. This association is critical for tracking distribution requirements—ensuring that every eligible individual receives the documents they are entitled to under the plan. The link_id identifies the association, and document_id and individual_id reference the parent records.

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

The providers_individuals table maps eligible individuals to their assigned healthcare providers. This link establishes the primary care relationship that determines network adequacy and care coordination. The link_id identifies the association, and provider_id and individual_id reference the parent records.

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

The providers_claims table records which healthcare providers submitted which insurance claims. This association is essential for claims adjudication, provider performance tracking, and network utilization analysis. The link_id identifies the association, and provider_id and claim_id reference the parent records.

## Analytical Views

The domain provides a suite of joined views that synthesize data across multiple tables, answering specific operational questions. Each view combines entities to surface relationships that are not visible when examining tables in isolation.

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

This view joins health plans with their compliance obligations, answering the question: which obligations apply to which plans, and what is their current status? A row might show PLA-2674 (Regional Cluster) linked to OBL-2751 (Extended Survey) with a status of pending and a compliance deadline of 2023-02-24. This view is the primary tool for compliance officers tracking upcoming deadlines across their plan portfolio.

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

This view joins health plans with their eligible individuals, answering: who is covered under which plan, and what is their coverage status? A row might show PLA-2678 (Integrated Initiative) linked to IND-2266 (Upal Saha) with a relationship of child and a coverage_status of pending_enrollment. This view supports enrollment audits and population health analysis.

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

This view joins compliance obligations with their associated health plans, answering: which plan is responsible for each obligation, and what is the plan's insurance structure? A row might show OBL-2753 (Pilot Corridor A) linked to PLA-2676 (Seasonal Review D) with an insurance_type of self_funded. This view helps auditors verify that obligations are assigned to the correct plan type.

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

This view joins compliance obligations with the plan documents they reference, answering: which documents are affected by each obligation, and what is their distribution status? A row might show OBL-2755 (Baseline Series) linked to DOC-2130 (wrap_document) with a distribution_status of distributed. This view is essential for document revision tracking.

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

This view joins compliance obligations with their associated reporting requirements, answering: which reporting mandate underlies each obligation? A row might show OBL-2757 (Distributed Assessment) linked to REQ-2074 (minimum_essential_coverage) with a status of pending. This view clarifies the regulatory lineage of each obligation.

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

This view joins eligible individuals with their health plans, answering: which plan covers each individual, and what is the plan's effective date? A row might show IND-2258 (Stephanie Collins) linked to PLA-2674 (Regional Cluster) with an effective_date of 2023-02-14. This view supports coverage verification and eligibility audits.

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

This view joins eligible individuals with their healthcare providers, answering: which provider is assigned to each individual, and what is the provider's specialty? A row might show IND-2262 (Janice Johnston) linked to PRO-2331 (Composite Model) with a specialty of ob_gyn. This view supports network adequacy assessments.

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

This view joins eligible individuals with their insurance claims, answering: which claims were filed by each individual, and what is the claim's adjudication status? A row might show IND-2270 (Katherine Snyder) linked to a claim with a status of paid and an amount_paid of $4,250.00. This view supports claims reconciliation and individual benefit utilization tracking.

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

This view joins plan documents with their associated health plans, answering: which documents belong to which plan, and what is the plan's grandfathered status? A row might show DOC-2128 (SPD) linked to PLA-2674 (Regional Cluster) with a contains_grandfather_status of true. This view ensures document-plan alignment.

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

This view joins plan documents with the compliance obligations they satisfy, answering: which obligations are addressed by each document? A row might show DOC-2129 (plan_document) linked to OBL-2753 (Pilot Corridor A) with a guidance_status of issued. This view supports compliance gap analysis.

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

This view joins plan documents with the eligible individuals they pertain to, answering: which individuals are entitled to receive each document? A row might show DOC-2131 (enrollment_material) linked to IND-2270 (Katherine Snyder) with a coverage_status of active. This view supports distribution compliance tracking.

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

This view joins reporting requirements with their associated health plans, answering: which plan must file each report, and what is the plan's employer size? A row might show REQ-2068 (quality_of_care) linked to PLA-2676 (Seasonal Review D) with an employer_size of 26. This view supports filing obligation audits.

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

This view joins healthcare providers with the eligible individuals they serve, answering: which individuals are covered by each provider, and what is their relationship to the employee? A row might show PRO-2334 (Compact Cluster) linked to IND-2266 (Upal Saha) with a relationship of child. This view supports provider utilization analysis.

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

This view joins healthcare providers with the insurance claims they submitted, answering: which claims were filed by each provider, and what is the claim's amount? A row might show PRO-2337 (Legacy Review D) linked to a claim with an amount_billed of $12,800.00 and a status of denied. This view supports provider performance and claims denial analysis.

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

This view joins insurance claims with the eligible individuals they cover, answering: which individual's benefits were used for each claim? A row might show a claim linked to IND-2258 (Stephanie Collins) with a relationship of employee and a coverage_status of active. This view supports individual benefit tracking.

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

This view joins insurance claims with their associated health plans, answering: which plan is responsible for each claim, and what is the plan's termination date? A row might show a claim linked to PLA-2680 (Extended Model) with a termination_date of 2025-12-17. This view supports plan-level claims analytics.

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

This view joins insurance claims with the healthcare providers who submitted them, answering: which provider handled each claim, and what is their license status? A row might show a claim linked to PRO-2328 (Primary Initiative A) with a license_number of LIC-2589 and accepts_new_patients of true. This view supports provider claims volume analysis.

## Synthesis

The health plan compliance domain is defined by a network of interdependent records: plans anchor obligations, obligations drive document revisions, documents inform eligible individuals, individuals generate claims, and providers deliver the services that claims cover. The associative tables—plans_obligations, plans_individuals, obligations_documents, individuals_claims, documents_obligations, documents_individuals, providers_individuals, and providers_claims—explicitly model the many-to-many relationships that arise when a single entity participates in multiple contexts. The analytical views synthesize these relationships into actionable detail, answering questions about obligation status, coverage alignment, document distribution, and claims adjudication. Together, the tables and views form a comprehensive record of a benefit program's compliance posture, enabling organizations to track deadlines, verify coverage, manage documents, and resolve claims with precision.