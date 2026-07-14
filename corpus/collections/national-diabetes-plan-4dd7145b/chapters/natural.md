## Diabetes Surveillance and Health Service Delivery Across Jurisdictions

National diabetes management operates through a layered architecture of administrative jurisdictions, each responsible for implementing prevention strategies, funding health services, and monitoring population health outcomes. The system tracks how diabetes plans are adopted, how financial resources are allocated, and how surveillance frameworks capture incidence, prevalence, mortality, and undiagnosed case rates across distinct population segments. Understanding the interplay between these operational components requires examining both the standalone records and the composite views that reveal jurisdiction-level relationships.

**Table `jurisdictions`**

| id | jurisdiction_id | jurisdiction_name | country_code | administrative_level | population_count | area_code | population_segment_id | policy_id | health_service_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 8387534 | Pilot Cluster | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | national | 15021 | 1996912 | 1000 | 5844252 | 1 |
| 2 | 99654 | Baseline Review | lu_tax_code_template_m_I_2 | regional | 10 | 17788643 | 1001 | 10207142 | 2 |
| 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A | default_chart_a_account_57 | local | 18 | 4793470 | 1002 | 1562847 | 3 |
| 4 | 1186090 | Adaptive Model | 727045 | national | 50 | 8843760 | 1003 | ChIJkzsYUIBt5kcRM6_JHx26ONk | 4 |

Jurisdictions form the foundational administrative units through which all diabetes-related activities are organized. Each jurisdiction carries a unique identifier, a name, a country code, and an administrative level ranging from national to local. The population count and area code provide demographic and geographic context, while the jurisdiction-level foreign keys link to the preventive policy, health service, and population segment that operate within its boundaries. For example, jurisdiction 8387534, named Pilot Cluster, operates at the national level with a population of 15,021 and area code 1996912, and it is associated with population segment 1000, preventive policy 5844252, and health service 1.

**Table `population_segments`**

| id | segment_id | segment_name | age_min | age_max | total_count | diagnosed_count | undiagnosed_count | prevalence_rate | jurisdiction_id | surveillance_metric_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | 19 | 24 | 57 | 22 | 60 | 22.45 | 1 | 1 |
| 1001 | 32825 | Primary Assessment | 25 | 27 | 7 | 20 | 77 | 25.90 | 2 | 2 |
| 1002 | 974920 | Composite Survey D | 31 | 30 | 6 | 93 | 36 | 29.35 | 3 | 3 |
| 1003 | 2933482 | Compact Corridor | 37 | 33 | 0 | 12 | 14 | 32.80 | 4 | 4 |

Population segments categorize the groups within each jurisdiction that are the focus of surveillance and intervention. These segments carry identifiers such as 1000 through 1003 and are linked to their parent jurisdiction, enabling the system to track which demographic or geographic cohort is being measured. The segment-level foreign key to the jurisdiction ensures that every population cohort can be traced back to the administrative unit responsible for its health data.

**Table `surveillance_frameworks`**

| id | framework_id | framework_name | adoption_status | frequency | scope | last_review_date | surveillance_metric_id | jurisdiction_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | adopted | routine | integrated-scope-52 | 2022-09-03 | 1 | 1 |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | not_adopted | annual | seasonal-scope-53 | 2023-02-14 | 2 | 2 |
| 1002 | 8843756 | Composite Assessment D | in_development | ad_hoc | regional-scope-54 | 2024-07-25 | 3 | 3 |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | adopted | routine | legacy-scope-55 | 2025-12-09 | 4 | 4 |

Surveillance frameworks define the methodological structures under which health metrics are collected and reported. Each framework has a name, a type, a status indicating whether it is active or inactive, and a start date marking when data collection began. The framework-level foreign key to the jurisdiction establishes which administrative unit oversees the framework's operation. These frameworks serve as the containers for surveillance metrics, linking methodological design to geographic accountability.

**Table `national_diabetes_plans`**

| id | plan_identifier | jurisdiction_name | implementation_status | adoption_date | policy_scope | responsible_agency | jurisdiction_id |
|---|---|---|---|---|---|---|---|
| 1 | PLA-2674 | Pilot Cluster | developing | 2025-08-12 | adaptive-policy-41 | General Telephone & Electronics | 1 |
| 2 | PLA-2676 | Baseline Review | partially_implemented | 2022-01-23 | distributed-policy-42 | New Mexico Business Roundtable for Educational Excellence | 2 |
| 3 | PLA-2678 | Distributed Initiative A | fully_implemented | 2023-06-07 | baseline-policy-43 | Senseonics Holdings Inc. | 3 |
| 4 | PLA-2680 | Adaptive Model | not_adopted | 2024-11-18 | pilot-policy-44 | National University of Singapore | 4 |

National diabetes plans represent the formal policy instruments through which jurisdictions commit to diabetes management. Each plan carries a plan identifier such as PLA-2674, a jurisdiction name, an implementation status ranging from developing to fully implemented, an adoption date, a policy scope, and a responsible agency. The plan-level foreign key to the jurisdiction ties each policy instrument to the administrative unit that adopted it. Plan PLA-2674, for instance, is associated with the Pilot Cluster jurisdiction, is in developing status, was adopted on 2025-08-12, operates under adaptive-policy-41 scope, and is managed by General Telephone & Electronics.

**Table `healthcare_expenditures`**

| expenditure_id | currency_code | amount_per_person | total_amount | fiscal_year | coverage_percentage | allocation_region | jurisdiction_id |
|---|---|---|---|---|---|---|---|
| default_chart_a_tax_code_21 | gd_fp_eu_acc3 | 30.51 | 112.11 | 17 | 2.45 | legacy-allocati-37 | 1 |
| 7441141 | managing-resources | 19.95 | 1,979 | 20 | 4.90 | compact-allocati-38 | 2 |
| 46bceece-8fc2-11eb-924d-9cd76263cbd0 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 33.06 | 15,418 | 23 | 7.35 | composite-allocati-39 | 3 |
| L331 | 10445649 | 12.74 | 12,579 | 26 | 9.80 | primary-allocati-40 | 4 |

Healthcare expenditures quantify the financial resources dedicated to diabetes management within each jurisdiction. Each expenditure record carries an expenditure identifier, a currency code, an amount per person, a total amount, a fiscal year, a coverage percentage, an allocation region, and a jurisdiction-level foreign key. The expenditure default_chart_a_tax_code_21, for example, is recorded in currency code gd_fp_eu_acc3, shows an amount per person of 30.51, a total amount of 112.11, covers fiscal year 17, has a coverage percentage of 2.45, is allocated to region legacy-allocati-37, and belongs to jurisdiction 1.

**Table `surveillance_metrics`**

| id | metric_id | metric_type | value | unit | measurement_date | population_age_range | data_source | population_segment_id | surveillance_framework_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 3744010 | incidence | 19.95 | distributed-unit-18 | 2024-07-01 | pilot-populati-86 | pilot-data-38 | 1000 | 1000 |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence | 21.90 | baseline-unit-19 | 2025-12-12 | extended-populati-87 | extended-data-39 | 1001 | 1001 |
| 3 | 2986226 | mortality | 23.85 | pilot-unit-20 | 2022-05-23 | integrated-populati-88 | integrated-data-40 | 1002 | 1002 |
| 4 | 2002007020010 | undiagnosed_cases | 25.80 | extended-unit-21 | 2023-10-07 | seasonal-populati-89 | seasonal-data-41 | 1003 | 1003 |

Surveillance metrics capture the actual health measurements collected under each surveillance framework. Each metric carries a metric identifier, a metric type such as incidence, prevalence, mortality, or undiagnosed_cases, a numeric value, a unit, a measurement date, a population age range, a data source, and foreign keys to the population segment and surveillance framework. Metric 3744010, of type incidence, records a value of 19.95 in distributed-unit-18 on 2024-07-01, covers the pilot-populati-86 age range, draws from pilot-data-38, and is linked to population segment 1000 and surveillance framework 1000.

**Table `preventive_policies`**

| policy_id | policy_name | policy_type | implementation_status | target_demographic | effective_date | enforcing_body | jurisdiction_id |
|---|---|---|---|---|---|---|---|
| 5844252 | Regional Series | voluntary_agreement | developing | regional-target-84 | 2023-02-14 | seasonal-enforcin-59 | 1 |
| 10207142 | Seasonal Assessment D | regulation | partially_implemented | legacy-target-85 | 2024-07-25 | regional-enforcin-60 | 2 |
| 1562847 | Integrated Survey | promotion | fully_implemented | compact-target-86 | 2025-12-09 | legacy-enforcin-61 | 3 |
| ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | ban | not_adopted | composite-target-87 | 2022-05-20 | compact-enforcin-62 | 4 |

Preventive policies are the operational instruments through which jurisdictions enforce or encourage diabetes prevention behaviors. Each policy carries a policy identifier, a policy name, a policy type such as voluntary_agreement, regulation, promotion, or ban, an implementation status, a target demographic, an effective date, an enforcing body, and a jurisdiction-level foreign key. Policy 5844252, named Regional Series, is of type voluntary_agreement, is in developing status, targets regional-target-84, became effective on 2023-02-14, is enforced by seasonal-enforcin-59, and operates within jurisdiction 1.

**Table `health_services`**

| health_service_id | service_id | service_name | service_category | availability_status | target_group | geographic_coverage | cost_coverage_percent | jurisdiction_id | population_segment_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | self_management_education | limited | composite-target-81 | pilot-geograph-26 | 18.47 | 1 | 1000 |
| 2 | 3990164 | Adaptive Model D | specialized_care | available | primary-target-82 | extended-geograph-27 | 19.97 | 2 | 1001 |
| 3 | 5844258 | Primary Cluster | preventive_screening | restricted | adaptive-target-83 | integrated-geograph-28 | 9.54 | 3 | 1002 |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | treatment | limited | distributed-target-84 | seasonal-geograph-29 | 13.94 | 4 | 1003 |

Health services represent the clinical and educational interventions available to populations within each jurisdiction. Each service carries a health service identifier, a service identifier, a service name, a service category such as self_management_education, specialized_care, preventive_screening, or treatment, an availability status, a target group, a geographic coverage area, a cost coverage percentage, and foreign keys to the jurisdiction and population segment. Health service 1, named Distributed Initiative, falls under self_management_education, has limited availability, targets composite-target-81, covers pilot-geograph-26, provides 18.47 percent cost coverage, operates in jurisdiction 1, and serves population segment 1000.

### Cross-Jurisdictional Plan and Expenditure Views

The national diabetes plan jurisdiction view joins plan records with their parent jurisdictions, answering the question of which administrative units have adopted which diabetes plans and at what stage of implementation. This view reveals that jurisdiction 8387534 (Pilot Cluster) hosts plan PLA-2674 in developing status, while jurisdiction 99654 (Baseline Review) hosts plan PLA-2676 in partially_implemented status. The joined record for plan PLA-2678 shows it is fully_implemented within jurisdiction lu_tax_code_template_m_I_4 (Distributed Initiative A), managed by Senseonics Holdings Inc. under baseline-policy-43 scope.

**View `national_diabetes_plan_jurisdiction_view`**

```sql
CREATE VIEW national_diabetes_plan_jurisdiction_view AS
SELECT a.id, a.plan_identifier, a.jurisdiction_name, a.implementation_status, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM national_diabetes_plans a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| id | plan_identifier | jurisdiction_name | implementation_status | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1 | PLA-2674 | Pilot Cluster | developing | 1 | 8387534 | Pilot Cluster |
| 2 | PLA-2676 | Baseline Review | partially_implemented | 2 | 99654 | Baseline Review |
| 3 | PLA-2678 | Distributed Initiative A | fully_implemented | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 4 | PLA-2680 | Adaptive Model | not_adopted | 4 | 1186090 | Adaptive Model |

The healthcare expenditure jurisdiction view links financial records to their responsible jurisdictions, enabling comparison of per-person spending, total allocation, and coverage percentages across administrative units. In this view, jurisdiction 8387534 shows expenditure default_chart_a_tax_code_21 with an amount per person of 30.51 and a coverage percentage of 2.45 in fiscal year 17. Jurisdiction 99654 displays expenditure 7441141 with an amount per person of 19.95 and a coverage percentage of 4.90 in fiscal year 20. The joined record for jurisdiction lu_tax_code_template_m_I_4 reveals expenditure 46bceece-8fc2-11eb-924d-9cd76263cbd0 with an amount per person of 33.06 and a notably higher coverage percentage of 7.35 in fiscal year 23.

**View `healthcare_expenditure_jurisdiction_view`**

```sql
CREATE VIEW healthcare_expenditure_jurisdiction_view AS
SELECT a.expenditure_id, a.currency_code, a.amount_per_person, a.total_amount, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM healthcare_expenditures a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| expenditure_id | currency_code | amount_per_person | total_amount | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| default_chart_a_tax_code_21 | gd_fp_eu_acc3 | 30.51 | 112.11 | 1 | 8387534 | Pilot Cluster |
| 7441141 | managing-resources | 19.95 | 1,979 | 2 | 99654 | Baseline Review |
| 46bceece-8fc2-11eb-924d-9cd76263cbd0 | f28f9a76-9bac-11eb-a8a2-19ed5c03f8d3 | 33.06 | 15,418 | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| L331 | 10445649 | 12.74 | 12,579 | 4 | 1186090 | Adaptive Model |

### Surveillance Metric Relationships

The surveillance metric population segment view connects health measurements to the specific population cohorts they describe, answering which segments are being monitored and at what metric levels. In this view, population segment 1000 is associated with metric 3744010 of type incidence, recording a value of 19.95. Population segment 1001 is linked to metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 of type prevalence with a value of 21.90. Population segment 1002 corresponds to metric 2986226 of type mortality at 23.85, while population segment 1003 is tied to metric 2002007020010 of type undiagnosed_cases at 25.80.

**View `surveillance_metric_population_segment_view`**

```sql
CREATE VIEW surveillance_metric_population_segment_view AS
SELECT a.id, a.metric_id, a.metric_type, a.value, b.id AS segment_id, b.segment_id AS segment_segment_id, b.segment_name AS segment_segment_name
FROM surveillance_metrics a JOIN population_segments b ON a.population_segment_id = b.id;
```

| id | metric_id | metric_type | value | segment_id | segment_segment_id | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 3744010 | incidence | 19.95 | 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence | 21.90 | 1001 | 32825 | Primary Assessment |
| 3 | 2986226 | mortality | 23.85 | 1002 | 974920 | Composite Survey D |
| 4 | 2002007020010 | undiagnosed_cases | 25.80 | 1003 | 2933482 | Compact Corridor |

The surveillance metric surveillance framework view ties each health measurement to the methodological framework under which it was collected. This view confirms that metric 3744010 (incidence, value 19.95) was gathered under surveillance framework 1000, metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 (prevalence, value 21.90) under framework 1001, metric 2986226 (mortality, value 23.85) under framework 1002, and metric 2002007020010 (undiagnosed_cases, value 25.80) under framework 1003. Each framework-metric pairing establishes the provenance chain from data collection methodology to reported value.

**View `surveillance_metric_surveillance_framework_view`**

```sql
CREATE VIEW surveillance_metric_surveillance_framework_view AS
SELECT a.id, a.metric_id, a.metric_type, a.value, b.id AS framework_id, b.framework_id AS framework_framework_id, b.framework_name AS framework_framework_name
FROM surveillance_metrics a JOIN surveillance_frameworks b ON a.surveillance_framework_id = b.id;
```

| id | metric_id | metric_type | value | framework_id | framework_framework_id | framework_framework_name |
|---|---|---|---|---|---|---|
| 1 | 3744010 | incidence | 19.95 | 1000 | lu_tax_code_template_m11 | Adaptive Corridor |
| 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence | 21.90 | 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series |
| 3 | 2986226 | mortality | 23.85 | 1002 | 8843756 | Composite Assessment D |
| 4 | 2002007020010 | undiagnosed_cases | 25.80 | 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey |

### Preventive Policy and Health Service Distribution

The preventive policy jurisdiction view maps each preventive policy to its responsible jurisdiction, clarifying which administrative units enforce which types of prevention instruments. In this view, jurisdiction 8387534 (Pilot Cluster) enforces policy 5844252 (Regional Series) of type voluntary_agreement in developing status. Jurisdiction 99654 (Baseline Review) enforces policy 10207142 (Seasonal Assessment D) of type regulation in partially_implemented status. Jurisdiction lu_tax_code_template_m_I_4 (Distributed Initiative A) enforces policy 1562847 (Integrated Survey) of type promotion in fully_implemented status. Jurisdiction 1186090 (Adaptive Model) enforces policy ChIJkzsYUIBt5kcRM6_JHx26ONk (Extended Corridor) of type ban in not_adopted status.

**View `preventive_policy_jurisdiction_view`**

```sql
CREATE VIEW preventive_policy_jurisdiction_view AS
SELECT a.policy_id, a.policy_name, a.policy_type, a.implementation_status, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM preventive_policies a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| policy_id | policy_name | policy_type | implementation_status | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 5844252 | Regional Series | voluntary_agreement | developing | 1 | 8387534 | Pilot Cluster |
| 10207142 | Seasonal Assessment D | regulation | partially_implemented | 2 | 99654 | Baseline Review |
| 1562847 | Integrated Survey | promotion | fully_implemented | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | ban | not_adopted | 4 | 1186090 | Adaptive Model |

The health service jurisdiction view links clinical and educational services to the jurisdictions that provide them, revealing the geographic distribution of diabetes care capacity. In this view, jurisdiction 8387534 provides health service 1 (Distributed Initiative) of category self_management_education with limited availability and 18.47 percent cost coverage. Jurisdiction 99654 provides health service 2 (Adaptive Model D) of category specialized_care with available status and 19.97 percent cost coverage. Jurisdiction lu_tax_code_template_m_I_4 provides health service 3 (Primary Cluster) of category preventive_screening with restricted availability and 9.54 percent cost coverage. Jurisdiction 1186090 provides health service 4 (Composite Review) of category treatment with limited availability and 13.94 percent cost coverage.

**View `health_service_jurisdiction_view`**

```sql
CREATE VIEW health_service_jurisdiction_view AS
SELECT a.health_service_id, a.service_id, a.service_name, a.service_category, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM health_services a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| health_service_id | service_id | service_name | service_category | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | self_management_education | 1 | 8387534 | Pilot Cluster |
| 2 | 3990164 | Adaptive Model D | specialized_care | 2 | 99654 | Baseline Review |
| 3 | 5844258 | Primary Cluster | preventive_screening | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | treatment | 4 | 1186090 | Adaptive Model |

The health service population segment view connects each health service to the population segment it targets, answering which cohorts receive which types of intervention. In this view, population segment 1000 receives health service 1 (Distributed Initiative) in the self_management_education category. Population segment 1001 receives health service 2 (Adaptive Model D) in the specialized_care category. Population segment 1002 receives health service 3 (Primary Cluster) in the preventive_screening category. Population segment 1003 receives health service 4 (Composite Review) in the treatment category.

**View `health_service_population_segment_view`**

```sql
CREATE VIEW health_service_population_segment_view AS
SELECT a.health_service_id, a.service_id, a.service_name, a.service_category, b.id AS segment_id, b.segment_id AS segment_segment_id, b.segment_name AS segment_segment_name
FROM health_services a JOIN population_segments b ON a.population_segment_id = b.id;
```

| health_service_id | service_id | service_name | service_category | segment_id | segment_segment_id | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 1996925 | Distributed Initiative | self_management_education | 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series |
| 2 | 3990164 | Adaptive Model D | specialized_care | 1001 | 32825 | Primary Assessment |
| 3 | 5844258 | Primary Cluster | preventive_screening | 1002 | 974920 | Composite Survey D |
| 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review | treatment | 1003 | 2933482 | Compact Corridor |

### Jurisdiction-Population and Jurisdiction-Policy Cross-References

The jurisdiction population segment view joins administrative units with the population segments they oversee, confirming the mapping between geographic administration and demographic targeting. In this view, jurisdiction 8387534 (Pilot Cluster) oversees population segment 1000, jurisdiction 99654 (Baseline Review) oversees segment 1001, jurisdiction lu_tax_code_template_m_I_4 (Distributed Initiative A) oversees segment 1002, and jurisdiction 1186090 (Adaptive Model) oversees segment 1003. Each jurisdiction-segment pairing establishes the administrative responsibility for that cohort's health data.

**View `jurisdiction_population_segment_view`**

```sql
CREATE VIEW jurisdiction_population_segment_view AS
SELECT a.id, a.jurisdiction_id, a.jurisdiction_name, a.country_code, b.id AS segment_id, b.segment_id AS segment_segment_id, b.segment_name AS segment_segment_name
FROM jurisdictions a JOIN population_segments b ON a.population_segment_id = b.id;
```

| id | jurisdiction_id | jurisdiction_name | country_code | segment_id | segment_segment_id | segment_segment_name |
|---|---|---|---|---|---|---|
| 1 | 8387534 | Pilot Cluster | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series |
| 2 | 99654 | Baseline Review | lu_tax_code_template_m_I_2 | 1001 | 32825 | Primary Assessment |
| 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A | default_chart_a_account_57 | 1002 | 974920 | Composite Survey D |
| 4 | 1186090 | Adaptive Model | 727045 | 1003 | 2933482 | Compact Corridor |

The jurisdiction preventive policy view links each jurisdiction to the preventive policy it enforces, providing a consolidated view of policy governance. In this view, jurisdiction 8387534 enforces policy 5844252 (Regional Series), jurisdiction 99654 enforces policy 10207142 (Seasonal Assessment D), jurisdiction lu_tax_code_template_m_I_4 enforces policy 1562847 (Integrated Survey), and jurisdiction 1186090 enforces policy ChIJkzsYUIBt5kcRM6_JHx26ONk (Extended Corridor). The view makes explicit the one-to-one mapping between jurisdictions and their primary preventive policy instruments.

**View `jurisdiction_preventive_policy_view`**

```sql
CREATE VIEW jurisdiction_preventive_policy_view AS
SELECT a.id, a.jurisdiction_id, a.jurisdiction_name, a.country_code, b.policy_id AS policy_policy_id, b.policy_name AS policy_policy_name, b.policy_type AS policy_policy_type
FROM jurisdictions a JOIN preventive_policies b ON a.policy_id = b.policy_id;
```

| id | jurisdiction_id | jurisdiction_name | country_code | policy_policy_id | policy_policy_name | policy_policy_type |
|---|---|---|---|---|---|---|
| 1 | 8387534 | Pilot Cluster | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 5844252 | Regional Series | voluntary_agreement |
| 2 | 99654 | Baseline Review | lu_tax_code_template_m_I_2 | 10207142 | Seasonal Assessment D | regulation |
| 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A | default_chart_a_account_57 | 1562847 | Integrated Survey | promotion |
| 4 | 1186090 | Adaptive Model | 727045 | ChIJkzsYUIBt5kcRM6_JHx26ONk | Extended Corridor | ban |

The jurisdiction health service view joins administrative units with the health services they operate, consolidating the service delivery landscape by jurisdiction. In this view, jurisdiction 8387534 operates health service 1 (Distributed Initiative), jurisdiction 99654 operates health service 2 (Adaptive Model D), jurisdiction lu_tax_code_template_m_I_4 operates health service 3 (Primary Cluster), and jurisdiction 1186090 operates health service 4 (Composite Review). This view enables administrators to assess which service categories are available within each jurisdiction's boundaries.

**View `jurisdiction_health_service_view`**

```sql
CREATE VIEW jurisdiction_health_service_view AS
SELECT a.id, a.jurisdiction_id, a.jurisdiction_name, a.country_code, b.health_service_id AS service_health_service_id, b.service_id AS service_service_id, b.service_name AS service_service_name
FROM jurisdictions a JOIN health_services b ON a.health_service_id = b.health_service_id;
```

| id | jurisdiction_id | jurisdiction_name | country_code | service_health_service_id | service_service_id | service_service_name |
|---|---|---|---|---|---|---|
| 1 | 8387534 | Pilot Cluster | 2e55e0b6-8fcc-11eb-924d-9cd76263cbd0 | 1 | 1996925 | Distributed Initiative |
| 2 | 99654 | Baseline Review | lu_tax_code_template_m_I_2 | 2 | 3990164 | Adaptive Model D |
| 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A | default_chart_a_account_57 | 3 | 5844258 | Primary Cluster |
| 4 | 1186090 | Adaptive Model | 727045 | 4 | e29bafe2-8fd1-11eb-924d-9cd76263cbd0 | Composite Review |

### Population Segment and Surveillance Framework Perspectives

The population segment jurisdiction view presents the relationship from the population segment's perspective, showing which jurisdiction is responsible for each cohort. In this view, population segment 1000 falls under jurisdiction 8387534 (Pilot Cluster), segment 1001 under jurisdiction 99654 (Baseline Review), segment 1002 under jurisdiction lu_tax_code_template_m_I_4 (Distributed Initiative A), and segment 1003 under jurisdiction 1186090 (Adaptive Model). This orientation is useful for demographic analysts who begin with a population cohort and need to identify the responsible administrative authority.

**View `population_segment_jurisdiction_view`**

```sql
CREATE VIEW population_segment_jurisdiction_view AS
SELECT a.id, a.segment_id, a.segment_name, a.age_min, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM population_segments a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| id | segment_id | segment_name | age_min | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | 19 | 1 | 8387534 | Pilot Cluster |
| 1001 | 32825 | Primary Assessment | 25 | 2 | 99654 | Baseline Review |
| 1002 | 974920 | Composite Survey D | 31 | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 1003 | 2933482 | Compact Corridor | 37 | 4 | 1186090 | Adaptive Model |

The population segment surveillance metric view connects each population segment to the surveillance metrics that measure its health outcomes. In this view, population segment 1000 is measured by metric 3744010 (incidence, value 19.95), segment 1001 by metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 (prevalence, value 21.90), segment 1002 by metric 2986226 (mortality, value 23.85), and segment 1003 by metric 2002007020010 (undiagnosed_cases, value 25.80). This view supports epidemiological analysis by grouping metrics under their target populations.

**View `population_segment_surveillance_metric_view`**

```sql
CREATE VIEW population_segment_surveillance_metric_view AS
SELECT a.id, a.segment_id, a.segment_name, a.age_min, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_type AS metric_metric_type
FROM population_segments a JOIN surveillance_metrics b ON a.surveillance_metric_id = b.id;
```

| id | segment_id | segment_name | age_min | metric_id | metric_metric_id | metric_metric_type |
|---|---|---|---|---|---|---|
| 1000 | 422a03c4-8fcc-11eb-924d-9cd76263cbd0 | Adaptive Series | 19 | 1 | 3744010 | incidence |
| 1001 | 32825 | Primary Assessment | 25 | 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence |
| 1002 | 974920 | Composite Survey D | 31 | 3 | 2986226 | mortality |
| 1003 | 2933482 | Compact Corridor | 37 | 4 | 2002007020010 | undiagnosed_cases |

The surveillance framework surveillance metric view presents the relationship from the framework's perspective, showing which metrics each framework collects. In this view, surveillance framework 1000 collects metric 3744010 (incidence), framework 1001 collects metric 136630a8-8fcc-11eb-924d-9cd76263cbd0 (prevalence), framework 1002 collects metric 2986226 (mortality), and framework 1003 collects metric 2002007020010 (undiagnosed_cases). This orientation is valuable for methodologists who need to audit the completeness and scope of each surveillance framework.

**View `surveillance_framework_surveillance_metric_view`**

```sql
CREATE VIEW surveillance_framework_surveillance_metric_view AS
SELECT a.id, a.framework_id, a.framework_name, a.adoption_status, b.id AS metric_id, b.metric_id AS metric_metric_id, b.metric_type AS metric_metric_type
FROM surveillance_frameworks a JOIN surveillance_metrics b ON a.surveillance_metric_id = b.id;
```

| id | framework_id | framework_name | adoption_status | metric_id | metric_metric_id | metric_metric_type |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | adopted | 1 | 3744010 | incidence |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | not_adopted | 2 | 136630a8-8fcc-11eb-924d-9cd76263cbd0 | prevalence |
| 1002 | 8843756 | Composite Assessment D | in_development | 3 | 2986226 | mortality |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | adopted | 4 | 2002007020010 | undiagnosed_cases |

The surveillance framework jurisdiction view links each surveillance framework to the jurisdiction that oversees it, establishing the chain of administrative accountability for data collection. In this view, surveillance framework 1000 is overseen by jurisdiction 8387534 (Pilot Cluster), framework 1001 by jurisdiction 99654 (Baseline Review), framework 1002 by jurisdiction lu_tax_code_template_m_I_4 (Distributed Initiative A), and framework 1003 by jurisdiction 1186090 (Adaptive Model). This view ensures that every metric can be traced through its framework to the jurisdiction responsible for its collection and reporting.

**View `surveillance_framework_jurisdiction_view`**

```sql
CREATE VIEW surveillance_framework_jurisdiction_view AS
SELECT a.id, a.framework_id, a.framework_name, a.adoption_status, b.id AS jurisdiction_id, b.jurisdiction_id AS jurisdiction_jurisdiction_id, b.jurisdiction_name AS jurisdiction_jurisdiction_name
FROM surveillance_frameworks a JOIN jurisdictions b ON a.jurisdiction_id = b.id;
```

| id | framework_id | framework_name | adoption_status | jurisdiction_id | jurisdiction_jurisdiction_id | jurisdiction_jurisdiction_name |
|---|---|---|---|---|---|---|
| 1000 | lu_tax_code_template_m11 | Adaptive Corridor | adopted | 1 | 8387534 | Pilot Cluster |
| 1001 | 228bd7e4-9bad-11eb-a8a2-19ed5c03f8d3 | Primary Series | not_adopted | 2 | 99654 | Baseline Review |
| 1002 | 8843756 | Composite Assessment D | in_development | 3 | lu_tax_code_template_m_I_4 | Distributed Initiative A |
| 1003 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | Compact Survey | adopted | 4 | 1186090 | Adaptive Model |

### Synthesis

The diabetes surveillance and health service delivery system operates through a tightly coupled set of jurisdictional, demographic, and methodological relationships. Each jurisdiction serves as the central node, hosting a diabetes plan, a preventive policy, a health service, a population segment, and a surveillance framework, while also managing healthcare expenditures and collecting surveillance metrics. The cross-jurisdictional views demonstrate that the system supports both top-down administrative analysis—starting from a jurisdiction and enumerating its resources—and bottom-up demographic analysis—starting from a population segment or metric and tracing back to its governing authority. The diversity of implementation statuses, from fully implemented to not adopted, and the range of metric values across incidence, prevalence, mortality, and undiagnosed cases, reflect a system in active development with varying levels of maturity across its constituent jurisdictions.