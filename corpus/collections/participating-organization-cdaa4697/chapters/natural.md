## The Agricultural Festival Ecosystem

Agricultural festivals serve as structured marketplaces where producer organizations present their goods under a unified evaluation framework. Each festival operates as a temporal event with defined dates, venues, and administrative oversight. Organizations enroll to participate, receive stall allocations, submit products for sale, and undergo quality assessments conducted by appointed project directors. The operational data captures every stage of this lifecycle—from initial enrollment through final evaluation—creating a traceable chain of records that links people, places, products, and processes.

**Table `participating_organizations`**

| participating_organization_id | organization_id | legal_name | organization_type | registration_date | contact_person | contact_phone | contact_email | enrollment_status | festival_enrollment_id | festival_stall_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Shell Oil | Adaptive Model | FPO | 2023-06-19T17:27:00 | Alyssa Chung | Joe Tsai | Christopher Wilson | pending | 1000 | 100 |
| 2 | GlobalPlatform Inc. | Primary Cluster | FPC | 2024-11-03T00:44:00 | Brianna Mejia | Stephanie Collins | Charles Larsen | under_evaluation | 1001 | 101 |
| 3 | Whatsapp Inc. | Composite Review D | FIG | 2025-04-14T07:01:00 | Eric Schultz | Tasha Rodriguez | Mary Alvarez | approved | 1002 | 102 |
| 4 | American Institutes for Research | Compact Initiative | FarmersClub | 2022-09-25T14:18:00 | Peter Montgomery | Walter Pratt | April Snyder | rejected | 1003 | 103 |

The foundation of the ecosystem is the roster of participating organizations, each identified by a unique internal key and an external organization identifier. Organizations fall into four distinct types: FPO (Farmer Producer Organization), FPC (Farmer Producer Company), FIG (an intermediary grouping), and FarmersClub (a cooperative society). Their enrollment status reflects their current standing in the festival pipeline—values range from `pending` through `under_evaluation`, `approved`, and `rejected`. For instance, Shell Oil (an FPO registered on 2023-06-19) holds a `pending` status, while Whatsapp Inc. (a FIG registered on 2025-04-14) has achieved `approved` standing. Contact details—person, phone, and email—are maintained for each entity, enabling direct communication between festival administrators and organization representatives.

**Table `festival_enrollments`**

| id | enrollment_id | submission_date | festival_name | festival_start_date | festival_end_date | venue_name | venue_city | evaluation_outcome | participating_organization_id | quality_assessment_id | festival_stall_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4447035 | 2025-04-24T03:57:00 | Compact Series | 2022-05-16 | 2022-01-18 | Legacy Review D | primary-venue-10 | pending | 1 | 1000 | 100 | 2025-01-01 00:14:00 |
| 1001 | gd_taxc_2121 | 2022-09-08T10:14:00 | Legacy Assessment | 2023-10-27 | 2023-06-02 | Regional Initiative | adaptive-venue-11 | passed | 2 | 1001 | 101 | 2025-02-06 03:14:00 |
| 1002 | id_30 | 2023-02-19T17:31:00 | Regional Survey A | 2024-03-11 | 2024-11-13 | Seasonal Model | distributed-venue-12 | failed | 3 | 1002 | 102 | 2025-03-11 06:14:00 |
| 1003 | b_VB-EC-0 | 2024-07-03T00:48:00 | Seasonal Corridor | 2025-08-22 | 2025-04-24 | Integrated Cluster A | baseline-venue-13 | pending | 4 | 1003 | 103 | 2025-04-16 09:14:00 |

Enrollment records formalize an organization's participation in a specific festival. Each enrollment carries a submission date, the name of the festival (such as "Compact Series" or "Seasonal Corridor"), and the event's start and end dates. Venues are identified by name and city; the four sample enrollments draw from venues including "Legacy Review D" in primary-venue-10 and "Regional Initiative" in adaptive-venue-11. The evaluation outcome column records the administrative verdict: `passed`, `failed`, or `pending`. Enrollment 1001, for example, submitted under the festival "Legacy Assessment" achieved a `passed` outcome, whereas enrollment 1002 under "Regional Survey A" received a `failed` outcome. Each enrollment is timestamped with its creation date and links to the originating organization, the assigned quality assessment, and the allocated stall.

**Table `quality_assessments`**

| id | assessment_id | assessment_date | quality_score | standard_compliance | assessor_name | assessment_method | festival_enrollment_id | director_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 19.45 | false | Primary Framework A | distributed-assessme-18 | 1000 | 195339 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 22.90 | true | Composite Protocol | baseline-assessme-19 | 1001 | 9125611 |
| 1002 | 506000 | 2024-03-05T18:58:00 | 26.35 | false | Compact Programme | pilot-assessme-20 | 1002 | 2933481 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 29.80 | true | Legacy Standard D | extended-assessme-21 | 1003 | 2087758 |

Quality assessments provide the evaluative backbone of the festival process. Each assessment records a date, a numeric quality score ranging from 19.45 to 29.80 in the sample data, and a boolean flag for standard compliance. Assessments employ distinct methods—"distributed-assessme-18", "baseline-assessme-19", "pilot-assessme-20", and "extended-assessme-21"—and are attributed to named frameworks such as "Primary Framework A" and "Composite Protocol". Compliance is not guaranteed: assessment 1000 scored 19.45 with `false` compliance, while assessment 1003 reached 29.80 with `true` compliance. Every assessment ties back to a specific festival enrollment and is overseen by a project director.

**Table `festival_stalls`**

| festival_stall_id | stall_id | stall_location_code | stall_size | stall_status | utility_access | festival_enrollment_id |
|---|---|---|---|---|---|---|
| 100 | gd_fp_ne_acc3 | 338536 | 0.6 | available | true | 1000 |
| 101 | 8928522 | L907 | 1.48 | allocated | false | 1001 |
| 102 | 5082980 | default_chart_a_tax_2 | 0.4827489 | occupied | true | 1002 |
| 103 | 338531 | 69423 | 1.37 | closed | false | 1003 |

Festival stalls represent the physical infrastructure allocated to enrolled organizations. Each stall carries a location code, a size measurement (ranging from 0.48 to 1.48 in the sample), and a status indicating its current state: `available`, `allocated`, `occupied`, or `closed`. Utility access is a binary attribute—stalls 100 and 102 have utilities enabled, while stalls 101 and 103 do not. Stall 100, with location code 338536 and size 0.6, remains available; stall 102, at location default_chart_a_tax_2 with size 0.48274890, is already occupied. The stall record links directly to its parent festival enrollment, anchoring the physical allocation to the administrative enrollment.

**Table `agricultural_products`**

| product_id | product_name | product_category | weight | unit_of_measure | price | expiry_date | participating_organization_id |
|---|---|---|---|---|---|---|---|
| PRO-2172 | Composite Assessment | raw_produce | 1.02669 | kg | 12.87 | 2023-10-24 | 1 |
| PRO-2179 | Compact Survey A | processed_food | 0.6 | g | 35.45 | 2024-03-08 | 2 |
| PRO-2186 | Legacy Corridor | organic | 0.48410348 | litre | 29.24 | 2025-08-19 | 3 |
| PRO-2193 | Regional Series | conventional | 0.6000001 | piece | 29.99 | 2022-01-03 | 4 |

The products table catalogs the agricultural goods offered by participating organizations. Products span four categories: `raw_produce`, `processed_food`, `organic`, and `conventional`. Each product has a unique identifier (such as PRO-2172 or PRO-2193), a name, a weight with its unit of measure (kilograms, grams, litres, or pieces), a price, and an expiry date. Composite Assessment (PRO-2172), a raw produce item weighing 1.02669 kg, is priced at 12.87 and expires on 2023-10-24. Legacy Corridor (PRO-2186), classified as organic and measured in litres at 0.48410348, carries a price of 29.24. Products are attributed to the participating organization that offers them.

**Table `project_directors`**

| director_id | full_name | office_location | office_address | office_city | office_pincode | quality_assessment_id | festival_enrollment_id |
|---|---|---|---|---|---|---|---|
| 195339 | Theodore Mcgrath | composite-office-99 | primary-office-46 | legacy-office-61 | OFF-2260 | 1000 | 1000 |
| 9125611 | Account Name | primary-office-100 | adaptive-office-47 | compact-office-62 | OFF-2264 | 1001 | 1001 |
| 2933481 | Saipan International Airport | adaptive-office-101 | distributed-office-48 | composite-office-63 | OFF-2268 | 1002 | 1002 |
| 2087758 | Norma Fisher | distributed-office-102 | baseline-office-49 | primary-office-64 | OFF-2272 | 1003 | 1003 |

Project directors provide oversight and accountability for the assessment process. Each director has a full name, an office location, a full address, a city, and a pincode. The sample includes Theodore Mcgrath at composite-office-99, Account Name at primary-office-100, Saipan International Airport at adaptive-office-101, and Norma Fisher at distributed-office-102. Directors are linked to specific quality assessments and festival enrollments, creating a chain of responsibility from the individual assessor through the administrative enrollment to the festival event itself.

**Table `stalls_products`**

| festival_stall_id | product_id |
|---|---|
| 100 | PRO-2172 |
| 100 | PRO-2179 |
| 101 | PRO-2179 |
| 101 | PRO-2186 |
| 102 | PRO-2186 |
| 102 | PRO-2193 |
| 103 | PRO-2193 |
| 103 | PRO-2172 |
**Table `products_stalls`**

| product_id | festival_stall_id |
|---|---|
| PRO-2172 | 100 |
| PRO-2172 | 101 |
| PRO-2179 | 101 |
| PRO-2179 | 102 |
| PRO-2186 | 102 |
| PRO-2186 | 103 |
| PRO-2193 | 103 |
| PRO-2193 | 100 |

The stalls_products and products_stalls tables serve as junction records that connect physical stalls to the agricultural products displayed within them. These associative tables enable many-to-many relationships: a single stall may host multiple products, and a product may be offered across multiple stalls. The dual naming convention reflects the bidirectional navigability of the relationship—stalls_products emphasizes the stall as the anchor, while products_stalls emphasizes the product. Together, they form the operational bridge between the physical marketplace and the product catalog.

### Cross-Cutting Views

The following views synthesize the base tables into analytical perspectives, each answering a specific operational question.

**View `v_participating_organization_festival_enrollment`**

```sql
CREATE VIEW v_participating_organization_festival_enrollment AS
SELECT a.participating_organization_id, a.organization_id, a.legal_name, a.organization_type, b.id AS enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.submission_date AS enrollment_submission_date
FROM participating_organizations a JOIN festival_enrollments b ON a.festival_enrollment_id = b.id;
```

| participating_organization_id | organization_id | legal_name | organization_type | enrollment_id | enrollment_enrollment_id | enrollment_submission_date |
|---|---|---|---|---|---|---|
| 1 | Shell Oil | Adaptive Model | FPO | 1000 | 4447035 | 2025-04-24T03:57:00 |
| 2 | GlobalPlatform Inc. | Primary Cluster | FPC | 1001 | gd_taxc_2121 | 2022-09-08T10:14:00 |
| 3 | Whatsapp Inc. | Composite Review D | FIG | 1002 | id_30 | 2023-02-19T17:31:00 |
| 4 | American Institutes for Research | Compact Initiative | FarmersClub | 1003 | b_VB-EC-0 | 2024-07-03T00:48:00 |

This view joins organizations with their enrollments, answering which organizations have enrolled in which festivals. Reading enrollment 1000, we see Shell Oil (Adaptive Model, FPO) enrolled in the Compact Series festival at Legacy Review D with a pending evaluation outcome. Enrollment 1002 shows Whatsapp Inc. (Composite Review D, FIG) enrolled in Regional Survey A at Seasonal Model, with a failed outcome.

**View `v_participating_organization_festival_stall`**

```sql
CREATE VIEW v_participating_organization_festival_stall AS
SELECT a.participating_organization_id, a.organization_id, a.legal_name, a.organization_type, b.festival_stall_id AS stall_festival_stall_id, b.stall_id AS stall_stall_id, b.stall_location_code AS stall_stall_location_code
FROM participating_organizations a JOIN festival_stalls b ON a.festival_stall_id = b.festival_stall_id;
```

| participating_organization_id | organization_id | legal_name | organization_type | stall_festival_stall_id | stall_stall_id | stall_stall_location_code |
|---|---|---|---|---|---|---|
| 1 | Shell Oil | Adaptive Model | FPO | 100 | gd_fp_ne_acc3 | 338536 |
| 2 | GlobalPlatform Inc. | Primary Cluster | FPC | 101 | 8928522 | L907 |
| 3 | Whatsapp Inc. | Composite Review D | FIG | 102 | 5082980 | default_chart_a_tax_2 |
| 4 | American Institutes for Research | Compact Initiative | FarmersClub | 103 | 338531 | 69423 |

By extending the organization-enrollment join to include stall data, this view reveals the physical allocation for each enrollment. Stall 100 (location 338536, size 0.6, available, with utilities) is assigned to enrollment 1000 of Shell Oil. Stall 102 (location default_chart_a_tax_2, size 0.4827489, occupied, with utilities) corresponds to enrollment 1002 of Whatsapp Inc.

**View `v_festival_enrollment_participating_organization`**

```sql
CREATE VIEW v_festival_enrollment_participating_organization AS
SELECT a.id, a.enrollment_id, a.submission_date, a.festival_name, b.participating_organization_id AS organization_participating_organization_id, b.organization_id AS organization_organization_id, b.legal_name AS organization_legal_name
FROM festival_enrollments a JOIN participating_organizations b ON a.participating_organization_id = b.participating_organization_id;
```

| id | enrollment_id | submission_date | festival_name | organization_participating_organization_id | organization_organization_id | organization_legal_name |
|---|---|---|---|---|---|---|
| 1000 | 4447035 | 2025-04-24T03:57:00 | Compact Series | 1 | Shell Oil | Adaptive Model |
| 1001 | gd_taxc_2121 | 2022-09-08T10:14:00 | Legacy Assessment | 2 | GlobalPlatform Inc. | Primary Cluster |
| 1002 | id_30 | 2023-02-19T17:31:00 | Regional Survey A | 3 | Whatsapp Inc. | Composite Review D |
| 1003 | b_VB-EC-0 | 2024-07-03T00:48:00 | Seasonal Corridor | 4 | American Institutes for Research | Compact Initiative |

This is the enrollment-centric counterpart to the first view, answering which organization is associated with each enrollment record. Enrollment 1001 (gd_taxc_2121) under the festival Legacy Assessment links to GlobalPlatform Inc. (Primary Cluster, FPC), which holds an under_evaluation status.

**View `v_festival_enrollment_quality_assessment`**

```sql
CREATE VIEW v_festival_enrollment_quality_assessment AS
SELECT a.id, a.enrollment_id, a.submission_date, a.festival_name, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM festival_enrollments a JOIN quality_assessments b ON a.quality_assessment_id = b.id;
```

| id | enrollment_id | submission_date | festival_name | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 1000 | 4447035 | 2025-04-24T03:57:00 | Compact Series | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 1001 | gd_taxc_2121 | 2022-09-08T10:14:00 | Legacy Assessment | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 1002 | id_30 | 2023-02-19T17:31:00 | Regional Survey A | 1002 | 506000 | 2024-03-05T18:58:00 |
| 1003 | b_VB-EC-0 | 2024-07-03T00:48:00 | Seasonal Corridor | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

This view connects enrollments to their quality assessments, enabling a direct comparison between the enrollment outcome and the assessment score. Enrollment 1000 (Compact Series, pending outcome) has assessment 1000 with a quality score of 19.45 and false standard compliance. Enrollment 1001 (Legacy Assessment, passed outcome) has assessment 1001 with a score of 22.90 and true compliance.

**View `v_festival_enrollment_festival_stall`**

```sql
CREATE VIEW v_festival_enrollment_festival_stall AS
SELECT a.id, a.enrollment_id, a.submission_date, a.festival_name, b.festival_stall_id AS stall_festival_stall_id, b.stall_id AS stall_stall_id, b.stall_location_code AS stall_stall_location_code
FROM festival_enrollments a JOIN festival_stalls b ON a.festival_stall_id = b.festival_stall_id;
```

| id | enrollment_id | submission_date | festival_name | stall_festival_stall_id | stall_stall_id | stall_stall_location_code |
|---|---|---|---|---|---|---|
| 1000 | 4447035 | 2025-04-24T03:57:00 | Compact Series | 100 | gd_fp_ne_acc3 | 338536 |
| 1001 | gd_taxc_2121 | 2022-09-08T10:14:00 | Legacy Assessment | 101 | 8928522 | L907 |
| 1002 | id_30 | 2023-02-19T17:31:00 | Regional Survey A | 102 | 5082980 | default_chart_a_tax_2 |
| 1003 | b_VB-EC-0 | 2024-07-03T00:48:00 | Seasonal Corridor | 103 | 338531 | 69423 |

Merging enrollment data with stall allocation, this view answers where each enrollment is physically situated. Enrollment 1002 (Regional Survey A, failed outcome) is allocated to stall 102 at location default_chart_a_tax_2, which is currently occupied and has utility access enabled.

**View `v_quality_assessment_festival_enrollment`**

```sql
CREATE VIEW v_quality_assessment_festival_enrollment AS
SELECT a.id, a.assessment_id, a.assessment_date, a.quality_score, b.id AS enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.submission_date AS enrollment_submission_date
FROM quality_assessments a JOIN festival_enrollments b ON a.festival_enrollment_id = b.id;
```

| id | assessment_id | assessment_date | quality_score | enrollment_id | enrollment_enrollment_id | enrollment_submission_date |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 19.45 | 1000 | 4447035 | 2025-04-24T03:57:00 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 22.90 | 1001 | gd_taxc_2121 | 2022-09-08T10:14:00 |
| 1002 | 506000 | 2024-03-05T18:58:00 | 26.35 | 1002 | id_30 | 2023-02-19T17:31:00 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 29.80 | 1003 | b_VB-EC-0 | 2024-07-03T00:48:00 |

Reversing the perspective, this view starts from the quality assessment and traces back to the enrollment. Assessment 1002 (Compact Programme, score 26.35, non-compliant) links to enrollment 1002 (Regional Survey A, failed outcome). Assessment 1003 (Legacy Standard D, score 29.80, compliant) links to enrollment 1003 (Seasonal Corridor, pending outcome).

**View `v_quality_assessment_project_director`**

```sql
CREATE VIEW v_quality_assessment_project_director AS
SELECT a.id, a.assessment_id, a.assessment_date, a.quality_score, b.director_id AS director_director_id, b.full_name AS director_full_name, b.office_location AS director_office_location
FROM quality_assessments a JOIN project_directors b ON a.director_id = b.director_id;
```

| id | assessment_id | assessment_date | quality_score | director_director_id | director_full_name | director_office_location |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 19.45 | 195339 | Theodore Mcgrath | composite-office-99 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 22.90 | 9125611 | Account Name | primary-office-100 |
| 1002 | 506000 | 2024-03-05T18:58:00 | 26.35 | 2933481 | Saipan International Airport | adaptive-office-101 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 29.80 | 2087758 | Norma Fisher | distributed-office-102 |

This view pairs each quality assessment with its overseeing project director. Assessment 1000 (Primary Framework A, score 19.45) is overseen by Theodore Mcgrath at composite-office-99. Assessment 1001 (Composite Protocol, score 22.90) is overseen by Account Name at primary-office-100. Assessment 1002 (Compact Programme, score 26.35) is overseen by Saipan International Airport at adaptive-office-101. Assessment 1003 (Legacy Standard D, score 29.80) is overseen by Norma Fisher at distributed-office-102.

**View `v_festival_stall_festival_enrollment`**

```sql
CREATE VIEW v_festival_stall_festival_enrollment AS
SELECT a.festival_stall_id, a.stall_id, a.stall_location_code, a.stall_size, b.id AS enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.submission_date AS enrollment_submission_date
FROM festival_stalls a JOIN festival_enrollments b ON a.festival_enrollment_id = b.id;
```

| festival_stall_id | stall_id | stall_location_code | stall_size | enrollment_id | enrollment_enrollment_id | enrollment_submission_date |
|---|---|---|---|---|---|---|
| 100 | gd_fp_ne_acc3 | 338536 | 0.6 | 1000 | 4447035 | 2025-04-24T03:57:00 |
| 101 | 8928522 | L907 | 1.48 | 1001 | gd_taxc_2121 | 2022-09-08T10:14:00 |
| 102 | 5082980 | default_chart_a_tax_2 | 0.4827489 | 1002 | id_30 | 2023-02-19T17:31:00 |
| 103 | 338531 | 69423 | 1.37 | 1003 | b_VB-EC-0 | 2024-07-03T00:48:00 |

Starting from the stall, this view reveals which enrollment occupies each physical space. Stall 100 (gd_fp_ne_acc3, size 0.6, available) is linked to enrollment 1000 (Compact Series, pending). Stall 103 (338531, size 1.37, closed) is linked to enrollment 1003 (Seasonal Corridor, pending).

**View `v_festival_stall_agricultural_product_detail`**

```sql
CREATE VIEW v_festival_stall_agricultural_product_detail AS
SELECT a.festival_stall_id, a.stall_id, a.stall_location_code, b.product_id AS product_product_id, b.product_name AS product_product_name, b.product_category AS product_product_category
FROM festival_stalls a
  JOIN stalls_products j ON j.festival_stall_id = a.festival_stall_id
  JOIN agricultural_products b ON b.product_id = j.product_id;
```

| festival_stall_id | stall_id | stall_location_code | product_product_id | product_product_name | product_product_category |
|---|---|---|---|---|---|
| 100 | gd_fp_ne_acc3 | 338536 | PRO-2172 | Composite Assessment | raw_produce |
| 100 | gd_fp_ne_acc3 | 338536 | PRO-2179 | Compact Survey A | processed_food |
| 101 | 8928522 | L907 | PRO-2179 | Compact Survey A | processed_food |
| 101 | 8928522 | L907 | PRO-2186 | Legacy Corridor | organic |
| 102 | 5082980 | default_chart_a_tax_2 | PRO-2186 | Legacy Corridor | organic |
| 102 | 5082980 | default_chart_a_tax_2 | PRO-2193 | Regional Series | conventional |
| 103 | 338531 | 69423 | PRO-2193 | Regional Series | conventional |
| 103 | 338531 | 69423 | PRO-2172 | Composite Assessment | raw_produce |

This view joins stall records with the products displayed there, answering what goods are available at each stall location. Stall 100 (available, utilities enabled) hosts products from the participating organizations enrolled in its associated festival. The junction tables (stalls_products and products_stalls) provide the linkage that populates this view.

**View `v_agricultural_product_festival_stall_detail`**

```sql
CREATE VIEW v_agricultural_product_festival_stall_detail AS
SELECT a.product_id, a.product_name, a.product_category, b.festival_stall_id AS stall_festival_stall_id, b.stall_id AS stall_stall_id, b.stall_location_code AS stall_stall_location_code
FROM agricultural_products a
  JOIN products_stalls j ON j.product_id = a.product_id
  JOIN festival_stalls b ON b.festival_stall_id = j.festival_stall_id;
```

| product_id | product_name | product_category | stall_festival_stall_id | stall_stall_id | stall_stall_location_code |
|---|---|---|---|---|---|
| PRO-2172 | Composite Assessment | raw_produce | 100 | gd_fp_ne_acc3 | 338536 |
| PRO-2172 | Composite Assessment | raw_produce | 101 | 8928522 | L907 |
| PRO-2179 | Compact Survey A | processed_food | 101 | 8928522 | L907 |
| PRO-2179 | Compact Survey A | processed_food | 102 | 5082980 | default_chart_a_tax_2 |
| PRO-2186 | Legacy Corridor | organic | 102 | 5082980 | default_chart_a_tax_2 |
| PRO-2186 | Legacy Corridor | organic | 103 | 338531 | 69423 |
| PRO-2193 | Regional Series | conventional | 103 | 338531 | 69423 |
| PRO-2193 | Regional Series | conventional | 100 | gd_fp_ne_acc3 | 338536 |

The product-centric counterpart, this view starts from each agricultural product and reveals which stalls carry it. Product PRO-2172 (Composite Assessment, raw_produce, 1.02669 kg, priced at 12.87) is offered by organization 1 and appears in the stalls associated with that organization's enrollments.

**View `v_agricultural_product_participating_organization`**

```sql
CREATE VIEW v_agricultural_product_participating_organization AS
SELECT a.product_id, a.product_name, a.product_category, a.weight, b.participating_organization_id AS organization_participating_organization_id, b.organization_id AS organization_organization_id, b.legal_name AS organization_legal_name
FROM agricultural_products a JOIN participating_organizations b ON a.participating_organization_id = b.participating_organization_id;
```

| product_id | product_name | product_category | weight | organization_participating_organization_id | organization_organization_id | organization_legal_name |
|---|---|---|---|---|---|---|
| PRO-2172 | Composite Assessment | raw_produce | 1.02669 | 1 | Shell Oil | Adaptive Model |
| PRO-2179 | Compact Survey A | processed_food | 0.6 | 2 | GlobalPlatform Inc. | Primary Cluster |
| PRO-2186 | Legacy Corridor | organic | 0.48410348 | 3 | Whatsapp Inc. | Composite Review D |
| PRO-2193 | Regional Series | conventional | 0.6000001 | 4 | American Institutes for Research | Compact Initiative |

This view maps products back to their offering organizations, answering which organization supplies each product. PRO-2179 (Compact Survey A, processed_food, 0.6 g, priced at 35.45) is supplied by organization 2 (GlobalPlatform Inc., Primary Cluster, FPC). PRO-2186 (Legacy Corridor, organic, 0.48410348 litre, priced at 29.24) is supplied by organization 3 (Whatsapp Inc., Composite Review D, FIG).

**View `v_project_director_quality_assessment`**

```sql
CREATE VIEW v_project_director_quality_assessment AS
SELECT a.director_id, a.full_name, a.office_location, a.office_address, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM project_directors a JOIN quality_assessments b ON a.quality_assessment_id = b.id;
```

| director_id | full_name | office_location | office_address | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 195339 | Theodore Mcgrath | composite-office-99 | primary-office-46 | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 9125611 | Account Name | primary-office-100 | adaptive-office-47 | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 2933481 | Saipan International Airport | adaptive-office-101 | distributed-office-48 | 1002 | 506000 | 2024-03-05T18:58:00 |
| 2087758 | Norma Fisher | distributed-office-102 | baseline-office-49 | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

This view presents the director-assessment pairing from the director's perspective. Theodore Mcgrath (office: composite-office-99) is responsible for quality assessment 1000 (score 19.45, non-compliant). Norma Fisher (office: distributed-office-102) is responsible for quality assessment 1003 (score 29.80, compliant).

**View `v_project_director_festival_enrollment`**

```sql
CREATE VIEW v_project_director_festival_enrollment AS
SELECT a.director_id, a.full_name, a.office_location, a.office_address, b.id AS enrollment_id, b.enrollment_id AS enrollment_enrollment_id, b.submission_date AS enrollment_submission_date
FROM project_directors a JOIN festival_enrollments b ON a.festival_enrollment_id = b.id;
```

| director_id | full_name | office_location | office_address | enrollment_id | enrollment_enrollment_id | enrollment_submission_date |
|---|---|---|---|---|---|---|
| 195339 | Theodore Mcgrath | composite-office-99 | primary-office-46 | 1000 | 4447035 | 2025-04-24T03:57:00 |
| 9125611 | Account Name | primary-office-100 | adaptive-office-47 | 1001 | gd_taxc_2121 | 2022-09-08T10:14:00 |
| 2933481 | Saipan International Airport | adaptive-office-101 | distributed-office-48 | 1002 | id_30 | 2023-02-19T17:31:00 |
| 2087758 | Norma Fisher | distributed-office-102 | baseline-office-49 | 1003 | b_VB-EC-0 | 2024-07-03T00:48:00 |

Extending the director relationship to the enrollment level, this view answers which director oversees which festival enrollment. Theodore Mcgrath oversees enrollment 1000 (Compact Series, pending outcome). Account Name oversees enrollment 1001 (Legacy Assessment, passed outcome). Saipan International Airport oversees enrollment 1002 (Regional Survey A, failed outcome). Norma Fisher oversees enrollment 1003 (Seasonal Corridor, pending outcome).

### Synthesis

The festival ecosystem operates as an integrated system where administrative, physical, and evaluative dimensions intersect. Organizations enroll in festivals, receive stall allocations, offer products, and undergo quality assessments directed by appointed project directors. The base tables capture each dimension in isolation; the views synthesize them into actionable perspectives. An administrator can trace from a single organization through its enrollment, stall, products, assessment, and director—or reverse the traversal from any point in the chain. The data model supports both granular operational queries and holistic oversight, ensuring that every festival event can be understood at the level of detail required by the question at hand.