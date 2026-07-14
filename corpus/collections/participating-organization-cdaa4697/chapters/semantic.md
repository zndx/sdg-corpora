The agricultural festival ecosystem brings together producer organizations, event coordinators, quality evaluators, and product vendors in a structured marketplace. Each participating organization submits an enrollment for a specific festival, receives a quality assessment, and is allocated a physical stall where agricultural products are displayed and sold. The domain model captures this workflow as a network of interrelated entities: organizations that apply, enrollments that bind them to festivals, assessments that grade their compliance, stalls that house their presence, products that they offer, and directors who oversee the evaluation process. The relational schema materializes these entities as normalized tables linked by foreign keys, with junction tables mediating many-to-many relationships between stalls and products, and a suite of views reconstructing the domain facts that stakeholders need to query.

**Table `participating_organizations`**

| participating_organization_id | organization_id | legal_name | organization_type | registration_date | contact_person | contact_phone | contact_email | enrollment_status | festival_enrollment_id | festival_stall_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Shell Oil | Adaptive Model | FPO | 2023-06-19T17:27:00 | Alyssa Chung | Joe Tsai | Christopher Wilson | pending | 1000 | 100 |
| 2 | GlobalPlatform Inc. | Primary Cluster | FPC | 2024-11-03T00:44:00 | Brianna Mejia | Stephanie Collins | Charles Larsen | under_evaluation | 1001 | 101 |
| 3 | Whatsapp Inc. | Composite Review D | FIG | 2025-04-14T07:01:00 | Eric Schultz | Tasha Rodriguez | Mary Alvarez | approved | 1002 | 102 |
| 4 | American Institutes for Research | Compact Initiative | FarmersClub | 2022-09-25T14:18:00 | Peter Montgomery | Walter Pratt | April Snyder | rejected | 1003 | 103 |

The `participating_organizations` table is the anchor of the domain model. Each row represents a legal entity seeking to exhibit at a festival, identified by a surrogate `participating_organization_id` (1 through 4 in the sample data) and a business `organization_id` such as `Shell Oil` or `Whatsapp Inc.`. The `legal_name` column carries a descriptive label like `Adaptive Model` or `Compact Initiative`, while `organization_type` classifies the entity as an FPO (Farmer Producer Organization), FPC (Farmer Producer Company), FIG (Farmer Interest Group), or FarmersClub. Registration dates such as `2023-06-19T17:27:00` anchor the organization's entry into the system. Contact information is captured through `contact_person` (e.g., `Alyssa Chung`), `contact_phone` (e.g., `Joe Tsai`), and `contact_email` (e.g., `Christopher Wilson`). The `enrollment_status` column tracks the lifecycle of an organization's application with values like `pending`, `under_evaluation`, `approved`, and `rejected`. Two foreign-key columns, `festival_enrollment_id` and `festival_stall_id`, link the organization to its enrollment record and its allocated stall, respectively, establishing the core many-to-one relationships that drive the schema's join topology.

**Table `festival_enrollments`**

| id | enrollment_id | submission_date | festival_name | festival_start_date | festival_end_date | venue_name | venue_city | evaluation_outcome | participating_organization_id | quality_assessment_id | festival_stall_id | created_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 4447035 | 2025-04-24T03:57:00 | Compact Series | 2022-05-16 | 2022-01-18 | Legacy Review D | primary-venue-10 | pending | 1 | 1000 | 100 | 2025-01-01 00:14:00 |
| 1001 | gd_taxc_2121 | 2022-09-08T10:14:00 | Legacy Assessment | 2023-10-27 | 2023-06-02 | Regional Initiative | adaptive-venue-11 | passed | 2 | 1001 | 101 | 2025-02-06 03:14:00 |
| 1002 | id_30 | 2023-02-19T17:31:00 | Regional Survey A | 2024-03-11 | 2024-11-13 | Seasonal Model | distributed-venue-12 | failed | 3 | 1002 | 102 | 2025-03-11 06:14:00 |
| 1003 | b_VB-EC-0 | 2024-07-03T00:48:00 | Seasonal Corridor | 2025-08-22 | 2025-04-24 | Integrated Cluster A | baseline-venue-13 | pending | 4 | 1003 | 103 | 2025-04-16 09:14:00 |

Festival enrollments form the central transactional entity. The `festival_enrollments` table records each organization's application to exhibit at a specific event. The primary key `id` (values 1000–1003) is a surrogate identifier, while `enrollment_id` carries a business key such as `4447035` or `gd_taxc_2121`. The `submission_date` (e.g., `2025-04-24T03:57:00`) marks when the application was filed. Festival metadata includes `festival_name` (`Compact Series`, `Legacy Assessment`, `Regional Survey A`, `Seasonal Corridor`), `festival_start_date`, and `festival_end_date`. Venue details are captured in `venue_name` (e.g., `Legacy Review D`, `Regional Initiative`) and `venue_city` (e.g., `primary-venue-10`, `adaptive-venue-11`). The `evaluation_outcome` column records the result of the review process with values `pending`, `passed`, `failed`, and `pending`. Foreign keys `participating_organization_id`, `quality_assessment_id`, and `festival_stall_id` connect the enrollment to its originating organization, its quality evaluation, and its physical stall, making this table the hub of the relational graph.

**Table `quality_assessments`**

| id | assessment_id | assessment_date | quality_score | standard_compliance | assessor_name | assessment_method | festival_enrollment_id | director_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | 19.45 | false | Primary Framework A | distributed-assessme-18 | 1000 | 195339 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | 22.90 | true | Composite Protocol | baseline-assessme-19 | 1001 | 9125611 |
| 1002 | 506000 | 2024-03-05T18:58:00 | 26.35 | false | Compact Programme | pilot-assessme-20 | 1002 | 2933481 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | 29.80 | true | Legacy Standard D | extended-assessme-21 | 1003 | 2087758 |

Quality assessments capture the compliance evaluation performed on each enrollment. The `quality_assessments` table stores the assessment `id` (1000–1003), a business `assessment_id` such as `template_ivacode_pagata_20det40ind` or `19508914`, and the `assessment_date` (e.g., `2022-05-10T04:24:00`). The `quality_score` column holds a numeric rating (19.45, 22.90, 26.35, 29.80), while `standard_compliance` is a boolean flag indicating whether the organization met the required standards. The `assessor_name` (e.g., `Primary Framework A`, `Composite Protocol`) identifies the evaluation framework, and `assessment_method` (e.g., `distributed-assessme-18`, `baseline-assessme-19`) describes the methodology used. Foreign keys `festival_enrollment_id` and `director_id` link the assessment to its parent enrollment and to the project director who oversaw it.

**Table `festival_stalls`**

| festival_stall_id | stall_id | stall_location_code | stall_size | stall_status | utility_access | festival_enrollment_id |
|---|---|---|---|---|---|---|
| 100 | gd_fp_ne_acc3 | 338536 | 0.6 | available | true | 1000 |
| 101 | 8928522 | L907 | 1.48 | allocated | false | 1001 |
| 102 | 5082980 | default_chart_a_tax_2 | 0.4827489 | occupied | true | 1002 |
| 103 | 338531 | 69423 | 1.37 | closed | false | 1003 |

Festival stalls represent the physical exhibition space allocated to each enrollment. The `festival_stalls` table uses `festival_stall_id` (100–103) as its primary key, with `stall_id` carrying a business identifier such as `gd_fp_ne_acc3` or `8928522`. The `stall_location_code` (e.g., `338536`, `L907`) and `stall_size` (a decimal ranging from 0.48 to 1.48) describe the stall's position and dimensions. The `stall_status` column tracks availability with values `available`, `allocated`, `occupied`, and `closed`, while `utility_access` is a boolean indicating whether the stall has power or water connections. The foreign key `festival_enrollment_id` ties each stall to its parent enrollment, completing the enrollment-to-stall relationship.

**Table `agricultural_products`**

| product_id | product_name | product_category | weight | unit_of_measure | price | expiry_date | participating_organization_id |
|---|---|---|---|---|---|---|---|
| PRO-2172 | Composite Assessment | raw_produce | 1.02669 | kg | 12.87 | 2023-10-24 | 1 |
| PRO-2179 | Compact Survey A | processed_food | 0.6 | g | 35.45 | 2024-03-08 | 2 |
| PRO-2186 | Legacy Corridor | organic | 0.48410348 | litre | 29.24 | 2025-08-19 | 3 |
| PRO-2193 | Regional Series | conventional | 0.6000001 | piece | 29.99 | 2022-01-03 | 4 |

Agricultural products are the goods exhibited and sold by participating organizations. The `agricultural_products` table uses `product_id` as its primary key, with values like `PRO-2172` and `PRO-2179`. The `product_name` (e.g., `Composite Assessment`, `Compact Survey A`) and `product_category` (e.g., `raw_produce`, `processed_food`, `organic`, `conventional`) describe the item. Physical attributes include `weight` (e.g., 1.02669, 0.6) and `unit_of_measure` (kg, g, litre, piece). The `price` column holds the monetary value (12.87, 35.45, 29.24, 29.99), and `expiry_date` (e.g., `2023-10-24`, `2024-03-08`) indicates shelf life. The foreign key `participating_organization_id` links each product to the organization that offers it, establishing the product-to-organization relationship.

**Table `project_directors`**

| director_id | full_name | office_location | office_address | office_city | office_pincode | quality_assessment_id | festival_enrollment_id |
|---|---|---|---|---|---|---|---|
| 195339 | Theodore Mcgrath | composite-office-99 | primary-office-46 | legacy-office-61 | OFF-2260 | 1000 | 1000 |
| 9125611 | Account Name | primary-office-100 | adaptive-office-47 | compact-office-62 | OFF-2264 | 1001 | 1001 |
| 2933481 | Saipan International Airport | adaptive-office-101 | distributed-office-48 | composite-office-63 | OFF-2268 | 1002 | 1002 |
| 2087758 | Norma Fisher | distributed-office-102 | baseline-office-49 | primary-office-64 | OFF-2272 | 1003 | 1003 |

Project directors are the individuals responsible for overseeing quality assessments. The `project_directors` table stores `director_id` (e.g., 195339, 9125611, 2933481, 2087758) as the primary key, with `full_name` (e.g., `Theodore Mcgrath`, `Account Name`, `Saipan International Airport`, `Norma Fisher`) as the human-readable identifier. Office details are captured in `office_location`, `office_address`, `office_city`, and `office_pincode` (e.g., `OFF-2260`, `OFF-2264`). Foreign keys `quality_assessment_id` and `festival_enrollment_id` link each director to the assessment they supervised and the enrollment they evaluated, respectively.

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

The `stalls_products` table serves as a junction table that resolves the many-to-many relationship between festival stalls and agricultural products. Each row records that a specific stall carries a specific product, effectively materializing the assignment of products to exhibition spaces. The table's composite foreign keys reference `festival_stall_id` and `product_id`, enabling queries that answer which products are displayed at which stalls and which stalls carry which products.

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

The `products_stalls` table is a second junction table that provides an alternative many-to-many mapping between agricultural products and festival stalls. While functionally similar to `stalls_products`, this table may encode the relationship from the product's perspective, with foreign keys referencing `product_id` and `festival_stall_id`. Together, these two junction tables support bidirectional traversal of the stall-product association, allowing the schema to answer both "what products are at this stall?" and "which stalls carry this product?"

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

The view `v_participating_organization_festival_enrollment` joins `participating_organizations` with `festival_enrollments` on `participating_organization_id`, reconstructing the fact of which organization submitted which enrollment. Reading the first row, we see that organization 1 (`Shell Oil`, type `FPO`, status `pending`) submitted enrollment `4447035` for the `Compact Series` festival at `Legacy Review D`. The second row shows organization 2 (`GlobalPlatform Inc.`, type `FPC`, status `under_evaluation`) with enrollment `gd_taxc_2121` for `Legacy Assessment` at `Regional Initiative`. This view answers the question: "For each organization, what festival enrollment did they submit and what is their current status?"

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

The view `v_participating_organization_festival_stall` joins `participating_organizations` with `festival_stalls` through the `festival_stall_id` foreign key, reconstructing the allocation of physical stalls to organizations. The first row reveals that organization 1 (`Shell Oil`) was assigned stall 100 (`gd_fp_ne_acc3`, size 0.6, status `available`, with utility access). The third row shows organization 3 (`Whatsapp Inc.`, type `FIG`, status `approved`) allocated stall 102 (`5082980`, size 0.48, status `occupied`, with utility access). This view answers: "Which stall was allocated to each participating organization, and what is its current status?"

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

The view `v_festival_enrollment_participating_organization` reverses the join direction, starting from `festival_enrollments` and linking to `participating_organizations`. The first row shows enrollment `4447035` for the `Compact Series` festival was submitted by organization 1 (`Shell Oil`, type `FPO`, status `pending`). The fourth row shows enrollment `b_VB-EC-0` for `Seasonal Corridor` was submitted by organization 4 (`American Institutes for Research`, type `FarmersClub`, status `rejected`). This view answers: "For each enrollment, which organization submitted it and what is that organization's status?"

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

The view `v_festival_enrollment_quality_assessment` joins `festival_enrollments` with `quality_assessments` on `quality_assessment_id`, reconstructing the evaluation outcome for each enrollment. The first row shows enrollment `4447035` received assessment `template_ivacode_pagata_20det40ind` with a quality score of 19.45 and `standard_compliance` set to false. The second row shows enrollment `gd_taxc_2121` received assessment `19508914` with a score of 22.90 and `standard_compliance` set to true. This view answers: "For each enrollment, what quality assessment was performed, what score was assigned, and did the organization meet compliance standards?"

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

The view `v_festival_enrollment_festival_stall` joins `festival_enrollments` with `festival_stalls` on `festival_stall_id`, reconstructing the stall allocation for each enrollment. The first row shows enrollment `4447035` was allocated stall 100 (`gd_fp_ne_acc3`, size 0.6, status `available`, with utility access). The third row shows enrollment `id_30` was allocated stall 102 (`5082980`, size 0.48, status `occupied`, with utility access). This view answers: "For each enrollment, which stall was assigned and what are its physical characteristics and availability status?"

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

The view `v_quality_assessment_festival_enrollment` joins `quality_assessments` with `festival_enrollments` on `festival_enrollment_id`, reconstructing the enrollment context for each assessment. The first row shows assessment `template_ivacode_pagata_20det40ind` (score 19.45, non-compliant) was performed on enrollment `4447035` for the `Compact Series` festival. The fourth row shows assessment `1204-0009-M` (score 29.80, compliant) was performed on enrollment `b_VB-EC-0` for `Seasonal Corridor`. This view answers: "For each quality assessment, which enrollment was evaluated and what festival was it for?"

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

The view `v_quality_assessment_project_director` joins `quality_assessments` with `project_directors` on `director_id`, reconstructing the directorship of each assessment. The first row shows assessment `template_ivacode_pagata_20det40ind` (score 19.45) was overseen by director 195339 (`Theodore Mcgrath`, office `composite-office-99`). The third row shows assessment `506000` (score 26.35) was overseen by director 2933481 (`Saipan International Airport`, office `adaptive-office-101`). This view answers: "For each quality assessment, which project director supervised it and where is that director's office located?"

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

The view `v_festival_stall_festival_enrollment` joins `festival_stalls` with `festival_enrollments` on `festival_enrollment_id`, reconstructing the enrollment that each stall serves. The first row shows stall 100 (`gd_fp_ne_acc3`, size 0.6, status `available`) serves enrollment `4447035` for the `Compact Series` festival at `Legacy Review D`. The fourth row shows stall 103 (`338531`, size 1.37, status `closed`) serves enrollment `b_VB-EC-0` for `Seasonal Corridor`. This view answers: "For each stall, which enrollment does it serve and what festival is that enrollment for?"

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

The view `v_festival_stall_agricultural_product_detail` joins `festival_stalls` with `agricultural_products` through the junction tables, reconstructing the product inventory at each stall. The first row shows stall 100 (`gd_fp_ne_acc3`) carries product `PRO-2172` (`Composite Assessment`, category `raw_produce`, weight 1.02669 kg, priced at 12.87, expiring `2023-10-24`). The second row shows stall 101 (`8928522`) carries product `PRO-2179` (`Compact Survey A`, category `processed_food`, weight 0.6 g, priced at 35.45, expiring `2024-03-08`). This view answers: "For each stall, what agricultural products are displayed there, including their categories, weights, and prices?"

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

The view `v_agricultural_product_festival_stall_detail` reverses the join, starting from `agricultural_products` and linking to `festival_stalls`. The first row shows product `PRO-2172` (`Composite Assessment`, `raw_produce`, 1.02669 kg, price 12.87) is displayed at stall 100 (`gd_fp_ne_acc3`, size 0.6, status `available`). The third row shows product `PRO-2186` (`Legacy Corridor`, `organic`, 0.48 litre, price 29.24) is displayed at stall 102 (`5082980`, size 0.48, status `occupied`). This view answers: "For each agricultural product, which stall displays it and what is that stall's status and size?"

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

The view `v_agricultural_product_participating_organization` joins `agricultural_products` with `participating_organizations` on `participating_organization_id`, reconstructing the product-to-organization relationship. The first row shows product `PRO-2172` (`Composite Assessment`, `raw_produce`) is offered by organization 1 (`Shell Oil`, type `FPO`, status `pending`). The fourth row shows product `PRO-2193` (`Regional Series`, `conventional`) is offered by organization 4 (`American Institutes for Research`, type `FarmersClub`, status `rejected`). This view answers: "For each agricultural product, which organization offers it and what is that organization's enrollment status?"

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

The view `v_project_director_quality_assessment` joins `project_directors` with `quality_assessments` on `quality_assessment_id`, reconstructing the assessments overseen by each director. The first row shows director 195339 (`Theodore Mcgrath`, office `composite-office-99`) oversaw assessment `template_ivacode_pagata_20det40ind` (score 19.45, non-compliant). The fourth row shows director 2087758 (`Norma Fisher`, office `distributed-office-102`) oversaw assessment `1204-0009-M` (score 29.80, compliant). This view answers: "For each project director, which quality assessments did they supervise and what were the outcomes?"

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

The view `v_project_director_festival_enrollment` joins `project_directors` with `festival_enrollments` on `festival_enrollment_id`, reconstructing the enrollment context for each director's oversight. The first row shows director 195339 (`Theodore Mcgrath`) oversaw enrollment `4447035` for the `Compact Series` festival at `Legacy Review D`. The third row shows director 2933481 (`Saipan International Airport`) oversaw enrollment `id_30` for `Regional Survey A` at `Seasonal Model`. This view answers: "For each project director, which festival enrollments did they oversee and what festivals were those enrollments for?"

The schema's design reflects a disciplined normalization strategy: each entity type occupies its own table with a surrogate primary key, foreign keys encode the cardinality-bounded relationships, and junction tables resolve the many-to-many associations between stalls and products. The views then reconstruct the domain facts that stakeholders need — which organization submitted which enrollment, which stall carries which product, which director oversaw which assessment — by joining the normalized tables along their foreign-key edges. This separation of concerns between the base tables and the views ensures that the schema remains maintainable while providing a rich query surface for the agricultural festival domain.