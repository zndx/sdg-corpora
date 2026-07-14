## Oversight and Delivery in Social Service Provision

The administration of family support services rests on a structured chain of oversight, assessment, and delivery. Regulatory bodies conduct inspections across defined service domains, producing formal reports that capture the state of compliance and quality. These reports feed into the operational planning of service delivery, where individual family units are assessed for their needs and matched with appropriate support programmes. The entire lifecycle—from statutory inspection through needs evaluation to the actual provision of services—forms an interconnected system of accountability and care.

**Table `inspection_reports`**

| inspection_report_id | report_id | publication_date | reference_code | publisher | status | inspection_body_id | service_domain_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2025-12-01 | 62ae4aad5ce84e42acc1003ae3490641 | pilot-publishe-50 | published | 1000 | 100 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 8189500 | 2022-05-12 | 2618580 | extended-publishe-51 | draft | 1001 | 101 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | L355 | 2023-10-23 | 10207148 | integrated-publishe-52 | archived | 1002 | 102 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | 5844272 | 2024-03-07 | 2618577 | seasonal-publishe-53 | published | 1003 | 103 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Inspection reports constitute the foundational audit records of the system. Each report carries a unique internal identifier, a human-readable reference code, and a publication date that anchors it to a specific point in the oversight calendar. The reference codes vary in format: some follow an alphanumeric hash pattern such as `62ae4aad5ce84e42acc1003ae3490641`, while others use structured identifiers like `1202-0008-S` or simple numeric strings such as `8189500`. The publisher field identifies the originating publication entity, with values ranging from `pilot-publishe-50` to `seasonal-publishe-53`, each denoting a distinct publishing channel within the oversight infrastructure. Reports progress through a lifecycle captured by the status column, which takes values of `published`, `draft`, or `archived`. The temporal metadata—`created_at` and `updated_at` timestamps—records when each report entered the system and when its last modification occurred, enabling audit trails across the full reporting cycle.

**Table `inspection_bodies`**

| inspection_body_id | body_name | parent_department | statutory_powers | jurisdiction |
|---|---|---|---|---|
| 1000 | Regional Corridor | compact-parent-98 | false | regional-jurisdic-30 |
| 1001 | Seasonal Series D | composite-parent-99 | true | legacy-jurisdic-31 |
| 1002 | Integrated Assessment | primary-parent-100 | false | compact-jurisdic-32 |
| 1003 | Extended Survey | adaptive-parent-101 | true | composite-jurisdic-33 |

The inspection reports are produced by designated inspection bodies, each operating within a defined jurisdiction and possessing a specific mandate. The body named `Regional Corridor` operates under the `compact-parent-98` department with regional jurisdiction and no statutory powers, while `Seasonal Series D` functions under `composite-parent-99` with legacy jurisdiction and full statutory authority. The `Integrated Assessment` body, reporting to `primary-parent-100`, covers compact jurisdiction without statutory powers, and `Extended Survey`, under `adaptive-parent-101`, exercises statutory powers within composite jurisdiction. The `statutory_powers` flag distinguishes bodies that can enforce compliance from those that conduct advisory assessments, a distinction that shapes the weight and consequences of their findings.

**Table `service_domains`**

| service_domain_id | domain_name | target_population | service_type | is_holistic | inspection_report_id |
|---|---|---|---|---|---|
| 100 | Regional Protocol | composite-target-21 | personal | true | 1000 |
| 101 | Seasonal Programme D | primary-target-22 | childcare | false | 1001 |
| 102 | Integrated Standard | adaptive-target-23 | multi-purpose | true | 1002 |
| 103 | Extended Framework | distributed-target-24 | specialized | false | 1003 |

Service domains define the categories of support offered to families, each characterized by its target population, service type, and scope. The `Regional Protocol` domain serves a `composite-target-21` population with personal care services and is designated as holistic, meaning it addresses multiple dimensions of family need simultaneously. The `Seasonal Programme D` targets a `primary-target-22` demographic with childcare services and operates as a focused, non-holistic intervention. The `Integrated Standard` domain provides multi-purpose services to an `adaptive-target-23` population with a holistic approach, while the `Extended Framework` delivers specialized services to a `distributed-target-24` group without claiming comprehensive coverage. Each domain is linked to an inspection report, establishing the oversight relationship between the service category and its regulatory review.

**Table `needs_assessments`**

| id | assessment_id | assessment_date | assessment_type | family_size | status | family_unit_id |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | holistic | 9 | pending | 100 |
| 1001 | 19508914 | 2023-10-21T11:41:00 | service-led | 12 | in_progress | 101 |
| 1002 | 506000 | 2024-03-05T18:58:00 | partial | 15 | complete | 102 |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | holistic | 18 | failed | 103 |

At the operational level, individual family units undergo needs assessments that document their circumstances and guide service allocation. The assessment records carry template identifiers—such as `template_ivacode_pagata_20det40ind` for the holistic assessment of family unit 100, or the structured code `1204-0009-M` for the holistic assessment of family unit 103. Assessment dates span from May 2022 through August 2025, reflecting an ongoing evaluation cycle. The assessment type categorizes the scope of the review: `holistic` assessments examine the full spectrum of family needs, `service-led` assessments are driven by specific programme requirements, and `partial` assessments cover a limited subset of concerns. Family size ranges from 9 members in the pending holistic assessment to 18 members in the failed holistic assessment, illustrating the diversity of household compositions within the system. The status field tracks progress through the assessment lifecycle, with values of `pending`, `in_progress`, `complete`, and `failed` indicating where each evaluation stands.

**Table `family_units`**

| family_unit_id | family_id | has_disabled_parent | has_children | impairment_type | needs_assessment_id |
|---|---|---|---|---|---|
| 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false | false | learning | 1000 |
| 101 | democrm | true | true | physical | 1001 |
| 102 | 4060635 | false | false | sensory | 1002 |
| 103 | 69430 | true | true | chronic_sickness | 1003 |

Family units represent the households at the center of the service provision model. Each unit is identified by a UUID or numeric family identifier—`5f91638e-8fcd-11eb-924d-9cd76263cbd0` for family unit 100, `democrm` for family unit 101—and carries demographic markers that inform service matching. The `has_disabled_parent` flag indicates whether a parent has a disability, while `has_children` records the presence of dependent children. Impairment types include `learning`, `physical`, `sensory`, and `chronic_sickness`, each representing a distinct category of need that shapes the assessment and subsequent service allocation. Every family unit is linked to a needs assessment, creating the direct bridge between household circumstances and the formal evaluation process.

**Table `service_deliveries`**

| delivery_id | start_date | end_date | provider_type | quality_rating | family_unit_id | needs_assessment_id |
|---|---|---|---|---|---|---|
| 4060633 | 2022-09-05 | 2022-09-01 | local_council | 12.20 | 100 | 1000 |
| 48753454 | 2023-02-16 | 2023-02-12 | voluntary | 16.40 | 101 | 1001 |
| ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 | private | 20.60 | 102 | 1002 |
| 1336176 | 2025-12-11 | 2025-12-07 | multi_disciplinary | 24.80 | 103 | 1003 |

Service deliveries record the actual provision of support to families, with each delivery spanning a defined period between a start date and an end date. The delivery identifiers range from numeric codes like `4060633` to UUIDs such as `ba649482-8fbb-11eb-924d-9cd76263cbd0`. Provider types include `local_council`, `voluntary`, `private`, and `multi_disciplinary`, reflecting the diverse ecosystem of service providers. Quality ratings, expressed as decimal values, range from 12.20 for the local council delivery to 24.80 for the multi-disciplinary delivery, providing a quantitative measure of service performance. Each delivery is associated with both a family unit and a needs assessment, ensuring that every service provision can be traced back to the household it serves and the assessment that justified it.

**Table `policy_instruments`**

| instrument_id | title | enactment_date | scope | is_statutory | service_domain_id | needs_assessment_id |
|---|---|---|---|---|---|---|
| 6926365 | Compact Initiative | 2022-01-04 | national | false | 100 | 1000 |
| account_pymes_691 | Legacy Model | 2023-06-15 | local | true | 101 | 1001 |
| 726063 | Regional Cluster A | 2024-11-26 | agency_specific | false | 102 | 1002 |
| 23256422 | Seasonal Review | 2025-04-10 | national | true | 103 | 1003 |

Policy instruments form the regulatory and strategic framework within which all service activities operate. These instruments establish the rules, funding mechanisms, and quality standards that govern inspection bodies, service domains, and delivery providers. While the specific instruments vary in their scope and application, they collectively define the boundaries and expectations for the entire service ecosystem.

**Table `units_deliveries`**

| family_unit_id | delivery_id |
|---|---|
| 100 | 4060633 |
| 100 | 48753454 |
| 101 | 48753454 |
| 101 | ba649482-8fbb-11eb-924d-9cd76263cbd0 |
| 102 | ba649482-8fbb-11eb-924d-9cd76263cbd0 |
| 102 | 1336176 |
| 103 | 1336176 |
| 103 | 4060633 |

The units_deliveries table captures the granular mapping between family units and their service deliveries, enabling precise tracking of which households receive which services and in what quantities. This linkage ensures that resource allocation can be audited at the most detailed level, connecting individual family circumstances to the specific services they have been allocated.

### Inspection Oversight and Organizational Context

The relationship between inspection reports and their producing bodies creates a clear chain of accountability. Each report is attributable to a single inspection body, and the body's jurisdictional scope and statutory authority determine the nature of the oversight it provides.

**View `v_inspection_report_inspection_body`**

```sql
CREATE VIEW v_inspection_report_inspection_body AS
SELECT a.inspection_report_id, a.report_id, a.publication_date, a.reference_code, b.inspection_body_id AS body_inspection_body_id, b.body_name AS body_body_name, b.parent_department AS body_parent_department
FROM inspection_reports a JOIN inspection_bodies b ON a.inspection_body_id = b.inspection_body_id;
```

| inspection_report_id | report_id | publication_date | reference_code | body_inspection_body_id | body_body_name | body_parent_department |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2025-12-01 | 62ae4aad5ce84e42acc1003ae3490641 | 1000 | Regional Corridor | compact-parent-98 |
| 1001 | 8189500 | 2022-05-12 | 2618580 | 1001 | Seasonal Series D | composite-parent-99 |
| 1002 | L355 | 2023-10-23 | 10207148 | 1002 | Integrated Assessment | primary-parent-100 |
| 1003 | 5844272 | 2024-03-07 | 2618577 | 1003 | Extended Survey | adaptive-parent-101 |

This view joins inspection reports with their originating inspection bodies, answering the question of which organization produced each report and under what authority. The first row shows that report `1202-0008-S`, published on 2025-12-01 by `pilot-publishe-50` in published status, was produced by the `Regional Corridor` body operating under `compact-parent-98` with regional jurisdiction and no statutory powers. The second row reveals that report `8189500`, dated 2022-05-12 and currently in draft status, was generated by `Seasonal Series D`, which holds statutory powers and operates under legacy jurisdiction. This join enables analysts to evaluate whether reports from bodies with statutory powers differ in their publication patterns or quality outcomes from those produced by advisory bodies.

### Service Domain Oversight

Service domains are directly overseen through inspection reports, creating a regulatory link between the categories of service offered and the formal reviews they undergo.

**View `v_inspection_report_service_domain`**

```sql
CREATE VIEW v_inspection_report_service_domain AS
SELECT a.inspection_report_id, a.report_id, a.publication_date, a.reference_code, b.service_domain_id AS domain_service_domain_id, b.domain_name AS domain_domain_name, b.target_population AS domain_target_population
FROM inspection_reports a JOIN service_domains b ON a.service_domain_id = b.service_domain_id;
```

| inspection_report_id | report_id | publication_date | reference_code | domain_service_domain_id | domain_domain_name | domain_target_population |
|---|---|---|---|---|---|---|
| 1000 | 1202-0008-S | 2025-12-01 | 62ae4aad5ce84e42acc1003ae3490641 | 100 | Regional Protocol | composite-target-21 |
| 1001 | 8189500 | 2022-05-12 | 2618580 | 101 | Seasonal Programme D | primary-target-22 |
| 1002 | L355 | 2023-10-23 | 10207148 | 102 | Integrated Standard | adaptive-target-23 |
| 1003 | 5844272 | 2024-03-07 | 2618577 | 103 | Extended Framework | distributed-target-24 |

This view connects inspection reports to the service domains they cover, revealing which regulatory reviews apply to which service categories. The first row pairs report `1202-0008-S` with the `Regional Protocol` domain, a holistic personal care service targeting a composite population. The second row links report `8189500` to `Seasonal Programme D`, a non-holistic childcare service for a primary target demographic. This join supports analysis of whether holistic service domains receive different inspection frequencies or outcomes compared to focused, single-purpose domains.

### Service Domain and Inspection Cross-Reference

The reverse perspective—starting from the service domain and tracing back to its inspection report—provides a domain-centric view of the oversight landscape.

**View `v_service_domain_inspection_report`**

```sql
CREATE VIEW v_service_domain_inspection_report AS
SELECT a.service_domain_id, a.domain_name, a.target_population, a.service_type, b.inspection_report_id AS report_inspection_report_id, b.report_id AS report_report_id, b.publication_date AS report_publication_date
FROM service_domains a JOIN inspection_reports b ON a.inspection_report_id = b.inspection_report_id;
```

| service_domain_id | domain_name | target_population | service_type | report_inspection_report_id | report_report_id | report_publication_date |
|---|---|---|---|---|---|---|
| 100 | Regional Protocol | composite-target-21 | personal | 1000 | 1202-0008-S | 2025-12-01 |
| 101 | Seasonal Programme D | primary-target-22 | childcare | 1001 | 8189500 | 2022-05-12 |
| 102 | Integrated Standard | adaptive-target-23 | multi-purpose | 1002 | L355 | 2023-10-23 |
| 103 | Extended Framework | distributed-target-24 | specialized | 1003 | 5844272 | 2024-03-07 |

This view inverts the relationship, presenting each service domain alongside its associated inspection report. The `Regional Protocol` domain is linked to report `1202-0008-S`, published and authored by the `Regional Corridor` body. The `Integrated Standard` domain connects to report `L355`, which is archived and was produced by the `Integrated Assessment` body. This perspective is particularly useful for service domain managers who need to understand the regulatory history and current status of their domain's oversight.

### Needs Assessment and Family Unit Linkage

The core operational relationship in the service model connects family units to their needs assessments, establishing the evidentiary basis for service allocation.

**View `v_needs_assessment_family_unit`**

```sql
CREATE VIEW v_needs_assessment_family_unit AS
SELECT a.id, a.assessment_id, a.assessment_date, a.assessment_type, b.family_unit_id AS unit_family_unit_id, b.family_id AS unit_family_id, b.has_disabled_parent AS unit_has_disabled_parent
FROM needs_assessments a JOIN family_units b ON a.family_unit_id = b.family_unit_id;
```

| id | assessment_id | assessment_date | assessment_type | unit_family_unit_id | unit_family_id | unit_has_disabled_parent |
|---|---|---|---|---|---|---|
| 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 | holistic | 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false |
| 1001 | 19508914 | 2023-10-21T11:41:00 | service-led | 101 | democrm | true |
| 1002 | 506000 | 2024-03-05T18:58:00 | partial | 102 | 4060635 | false |
| 1003 | 1204-0009-M | 2025-08-16T01:15:00 | holistic | 103 | 69430 | true |

This view joins needs assessments with their corresponding family units, answering which household each assessment pertains to and what its characteristics are. The first row shows that the holistic assessment `template_ivacode_pagata_20det40ind`, conducted on 2022-05-10 for a family of 9 members in pending status, applies to family unit `5f91638e-8fcd-11eb-924d-9cd76263cbd0`, which has no disabled parent, no children, and a learning impairment. The second row reveals that the service-led assessment `19508914`, dated 2023-10-21 for a family of 12 in progress, covers family unit `democrm`, which has both a disabled parent and children, with a physical impairment. This join is essential for understanding how household composition and impairment type correlate with assessment type and status.

### Family Unit and Needs Assessment Perspective

The inverse view—starting from the family unit and tracing to its assessment—provides a household-centric perspective on the evaluation process.

**View `v_family_unit_needs_assessment`**

```sql
CREATE VIEW v_family_unit_needs_assessment AS
SELECT a.family_unit_id, a.family_id, a.has_disabled_parent, a.has_children, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM family_units a JOIN needs_assessments b ON a.needs_assessment_id = b.id;
```

| family_unit_id | family_id | has_disabled_parent | has_children | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false | false | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 101 | democrm | true | true | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 102 | 4060635 | false | false | 1002 | 506000 | 2024-03-05T18:58:00 |
| 103 | 69430 | true | true | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

This view presents each family unit alongside its needs assessment, enabling analysts to examine how family characteristics relate to assessment outcomes. Family unit `5f91638e-8fcd-11eb-924d-9cd76263cbd0` with a learning impairment is linked to a holistic assessment of 9 family members that remains pending. In contrast, family unit `69430` with a chronic sickness and both a disabled parent and children is associated with a holistic assessment of 18 members that has failed. This perspective highlights the relationship between household complexity and assessment outcomes, suggesting that larger, more complex families may face greater challenges in completing the assessment process.

### Family Unit Service Delivery Detail

The connection between family units and their service deliveries reveals how assessed needs translate into actual support provision.

**View `v_family_unit_service_delivery_detail`**

```sql
CREATE VIEW v_family_unit_service_delivery_detail AS
SELECT a.family_unit_id, a.family_id, a.has_disabled_parent, b.delivery_id AS delivery_delivery_id, b.start_date AS delivery_start_date, b.end_date AS delivery_end_date
FROM family_units a
  JOIN units_deliveries j ON j.family_unit_id = a.family_unit_id
  JOIN service_deliveries b ON b.delivery_id = j.delivery_id;
```

| family_unit_id | family_id | has_disabled_parent | delivery_delivery_id | delivery_start_date | delivery_end_date |
|---|---|---|---|---|---|
| 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false | 4060633 | 2022-09-05 | 2022-09-01 |
| 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false | 48753454 | 2023-02-16 | 2023-02-12 |
| 101 | democrm | true | 48753454 | 2023-02-16 | 2023-02-12 |
| 101 | democrm | true | ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 |
| 102 | 4060635 | false | ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 |
| 102 | 4060635 | false | 1336176 | 2025-12-11 | 2025-12-07 |
| 103 | 69430 | true | 1336176 | 2025-12-11 | 2025-12-07 |
| 103 | 69430 | true | 4060633 | 2022-09-05 | 2022-09-01 |

This view joins family units with their service deliveries, answering which families have received which services and under what conditions. The first row shows that family unit `5f91638e-8fcd-11eb-924d-9cd76263cbd0` received a delivery from a `local_council` provider, running from 2022-09-05 to 2022-09-01 with a quality rating of 12.20. The second row indicates that family unit `democrm` received a delivery from a `voluntary` provider during the period 2023-02-16 to 2023-02-12, achieving a quality rating of 16.40. The third row shows a `private` provider delivery to family unit `4060635` with a quality rating of 20.60, and the fourth row records a `multi_disciplinary` delivery to family unit `69430` with the highest quality rating of 24.80. This join enables analysis of whether provider type correlates with quality outcomes and whether families with different impairment types receive services from different provider categories.

### Service Delivery and Family Unit Perspective

The reverse view—starting from the service delivery and tracing back to the family unit—provides a delivery-centric perspective on the service ecosystem.

**View `v_service_delivery_family_unit`**

```sql
CREATE VIEW v_service_delivery_family_unit AS
SELECT a.delivery_id, a.start_date, a.end_date, a.provider_type, b.family_unit_id AS unit_family_unit_id, b.family_id AS unit_family_id, b.has_disabled_parent AS unit_has_disabled_parent
FROM service_deliveries a JOIN family_units b ON a.family_unit_id = b.family_unit_id;
```

| delivery_id | start_date | end_date | provider_type | unit_family_unit_id | unit_family_id | unit_has_disabled_parent |
|---|---|---|---|---|---|---|
| 4060633 | 2022-09-05 | 2022-09-01 | local_council | 100 | 5f91638e-8fcd-11eb-924d-9cd76263cbd0 | false |
| 48753454 | 2023-02-16 | 2023-02-12 | voluntary | 101 | democrm | true |
| ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 | private | 102 | 4060635 | false |
| 1336176 | 2025-12-11 | 2025-12-07 | multi_disciplinary | 103 | 69430 | true |

This view presents each service delivery alongside its associated family unit, enabling analysts to examine the characteristics of the households receiving each type of service. The local council delivery `4060633` serves family unit `5f91638e-8fcd-11eb-924d-9cd76263cbd0`, a household with a learning impairment but no disabled parent or children. The voluntary delivery `48753454` serves family unit `democrm`, which has both a disabled parent and children with a physical impairment. This perspective is valuable for understanding how different provider types serve different household profiles and for evaluating whether service allocation patterns align with family need profiles.

### Service Delivery and Needs Assessment Linkage

The connection between service deliveries and their originating needs assessments ensures that every service provision can be traced to the assessment that justified it.

**View `v_service_delivery_needs_assessment`**

```sql
CREATE VIEW v_service_delivery_needs_assessment AS
SELECT a.delivery_id, a.start_date, a.end_date, a.provider_type, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM service_deliveries a JOIN needs_assessments b ON a.needs_assessment_id = b.id;
```

| delivery_id | start_date | end_date | provider_type | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 4060633 | 2022-09-05 | 2022-09-01 | local_council | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| 48753454 | 2023-02-16 | 2023-02-12 | voluntary | 1001 | 19508914 | 2023-10-21T11:41:00 |
| ba649482-8fbb-11eb-924d-9cd76263cbd0 | 2024-07-27 | 2024-07-23 | private | 1002 | 506000 | 2024-03-05T18:58:00 |
| 1336176 | 2025-12-11 | 2025-12-07 | multi_disciplinary | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

This view joins service deliveries with their corresponding needs assessments, answering which assessment led to which service provision. The first row shows that delivery `4060633` from the local council provider was justified by the holistic assessment `template_ivacode_pagata_20det40ind` for a family of 9. The second row links the voluntary delivery `48753454` to the service-led assessment `19508914` for a family of 12. The third row connects the private delivery `ba649482-8fbb-11eb-924d-9cd76263cbd0` to the partial assessment `506000` for a family of 15, and the fourth row ties the multi-disciplinary delivery `1336176` to the holistic assessment `1204-0009-M` for a family of 18. This join is critical for audit purposes, ensuring that every service delivery has a documented assessment basis and that the assessment type aligns with the scope of services provided.

### Policy Instruments and Service Domains

Policy instruments establish the regulatory framework for service domains, defining the standards and requirements that each domain must meet.

**View `v_policy_instrument_service_domain`**

```sql
CREATE VIEW v_policy_instrument_service_domain AS
SELECT a.instrument_id, a.title, a.enactment_date, a.scope, b.service_domain_id AS domain_service_domain_id, b.domain_name AS domain_domain_name, b.target_population AS domain_target_population
FROM policy_instruments a JOIN service_domains b ON a.service_domain_id = b.service_domain_id;
```

| instrument_id | title | enactment_date | scope | domain_service_domain_id | domain_domain_name | domain_target_population |
|---|---|---|---|---|---|---|
| 6926365 | Compact Initiative | 2022-01-04 | national | 100 | Regional Protocol | composite-target-21 |
| account_pymes_691 | Legacy Model | 2023-06-15 | local | 101 | Seasonal Programme D | primary-target-22 |
| 726063 | Regional Cluster A | 2024-11-26 | agency_specific | 102 | Integrated Standard | adaptive-target-23 |
| 23256422 | Seasonal Review | 2025-04-10 | national | 103 | Extended Framework | distributed-target-24 |

This view joins policy instruments with the service domains they govern, answering which regulatory frameworks apply to which service categories. The `Regional Protocol` domain, with its holistic personal care focus, is subject to specific policy instruments that define its operational requirements. The `Seasonal Programme D` domain, providing focused childcare services, operates under a different set of policy instruments tailored to its narrower scope. This join enables compliance officers to verify that each service domain is covered by the appropriate regulatory framework and to identify any gaps in policy coverage.

### Policy Instruments and Needs Assessments

Policy instruments also govern the needs assessment process, establishing the standards for how assessments should be conducted, what types are appropriate, and how outcomes should be recorded.

**View `v_policy_instrument_needs_assessment`**

```sql
CREATE VIEW v_policy_instrument_needs_assessment AS
SELECT a.instrument_id, a.title, a.enactment_date, a.scope, b.id AS assessment_id, b.assessment_id AS assessment_assessment_id, b.assessment_date AS assessment_assessment_date
FROM policy_instruments a JOIN needs_assessments b ON a.needs_assessment_id = b.id;
```

| instrument_id | title | enactment_date | scope | assessment_id | assessment_assessment_id | assessment_assessment_date |
|---|---|---|---|---|---|---|
| 6926365 | Compact Initiative | 2022-01-04 | national | 1000 | template_ivacode_pagata_20det40ind | 2022-05-10T04:24:00 |
| account_pymes_691 | Legacy Model | 2023-06-15 | local | 1001 | 19508914 | 2023-10-21T11:41:00 |
| 726063 | Regional Cluster A | 2024-11-26 | agency_specific | 1002 | 506000 | 2024-03-05T18:58:00 |
| 23256422 | Seasonal Review | 2025-04-10 | national | 1003 | 1204-0009-M | 2025-08-16T01:15:00 |

This view connects policy instruments with the needs assessments they regulate, answering which regulatory frameworks govern each assessment type and status. The holistic assessments, which examine the full spectrum of family needs, are subject to policy instruments that define their scope and methodology. The service-led and partial assessments operate under different policy provisions that reflect their narrower focus. This join ensures that the assessment process itself is subject to regulatory oversight, maintaining consistency and quality across the entire evaluation cycle.

### Synthesis

The service provision ecosystem operates as an integrated system of oversight, assessment, and delivery. Inspection bodies produce reports that regulate service domains, establishing the quality and compliance framework within which services operate. Family units undergo needs assessments that document their circumstances and guide service allocation, with the assessment type and outcome reflecting the complexity of each household. Service deliveries then translate assessed needs into actual support, with provider type and quality rating providing measurable indicators of service performance. The views across these tables enable analysts to trace relationships in both directions—from regulatory oversight down to individual service delivery, and from household circumstances up through assessment to the policy framework that governs the entire system. This bidirectional traceability ensures that every service provision can be justified by an assessment, every assessment can be traced to a household, and every household operates within a regulated service domain subject to formal inspection.