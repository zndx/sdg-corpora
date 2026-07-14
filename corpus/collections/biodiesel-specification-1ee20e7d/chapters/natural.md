## The Biodiesel Quality Framework

Biodiesel production and distribution rest on a structured quality framework that connects regulatory standards, measurable properties, blend recipes, and fuel components into a single coherent system. Operators must ensure that every batch of biodiesel meets defined specifications, that those specifications enumerate the properties to be tested, that each property carries enforceable limits, and that the physical blends deployed in the field are traceable back to both the components used and the governing specification. The records in this domain capture every layer of that chain—from the publication of a standard like STA-2752 to the precise percentage of B100 and petroleum diesel in a blend batch dated 2022-05-18.

**Table `biodiesel_specifications`**

| biodiesel_specification_id | specification_id | standard_number | publication_year | grade | is_critical |
|---|---|---|---|---|---|
| 100 | id_26 | STA-2752 | 25 | S15 | false |
| 101 | 1437595 | STA-2757 | 33 | S500 | true |
| 102 | 4277026 | STA-2762 | 41 | S15 | false |
| 103 | 611516 | STA-2767 | 49 | S500 | true |

The `biodiesel_specifications` table anchors the entire quality framework. Each row represents a published standard identified by a standard number such as STA-2752 or STA-2757, a publication year encoded as a two-digit value like 25 or 33, and a grade designation—either S15 or S500. The `is_critical` flag distinguishes standards that carry mandatory compliance weight from those that are advisory. Specification 100, for instance, corresponds to standard STA-2752, grade S15, published in year 25, and is not marked critical. Specification 101, by contrast, carries standard STA-2757, grade S500, and is flagged as critical, meaning deviations in its associated properties trigger immediate operational review.

**Table `biodiesel_properties`**

| id | property_name | astm_method_number | unit_of_measure | is_critical | biodiesel_specification_id |
|---|---|---|---|---|---|
| 1 | Baseline Standard D | AST-2044 | composite-unit-69 | false | 100 |
| 2 | Distributed Framework | AST-2049 | primary-unit-70 | true | 101 |
| 3 | Adaptive Protocol | AST-2054 | adaptive-unit-71 | false | 102 |
| 4 | Primary Programme A | AST-2059 | distributed-unit-72 | true | 103 |

Properties are the measurable attributes that determine whether a biodiesel batch satisfies its governing specification. The `biodiesel_properties` table records each property with a descriptive name, the ASTM test method used to measure it, the unit of measure, and a criticality flag. Property 1, named "Baseline Standard D," is tested via AST-2044 using a composite-unit-69 measurement and is not critical. Property 2, "Distributed Framework," relies on AST-2049 and primary-unit-70, and is critical. Each property is linked to exactly one `biodiesel_specification_id`, establishing which standard it serves. Property 1 and Property 2 both reference specification 100, while Property 3 ("Adaptive Protocol") and Property 4 ("Primary Programme A") reference specifications 102 and 103 respectively.

**Table `property_limits`**

| id | limit_value | limit_type | grade | biodiesel_property_id |
|---|---|---|---|---|
| 1000 | 15.20 | maximum | S15 | 1 |
| 1001 | 19.40 | minimum | S500 | 2 |
| 1002 | 23.60 | range | S15 | 3 |
| 1003 | 27.80 | maximum | S500 | 4 |

Every property carries one or more enforceable limits that define acceptable performance ranges. The `property_limits` table stores each limit with a numeric `limit_value`, a `limit_type` of maximum, minimum, or range, a `grade` designation, and a reference to the owning `biodiesel_property_id`. Limit 1000 applies to property 1, sets a maximum of 15.20, and is specific to grade S15. Limit 1001 applies to property 2, sets a minimum of 19.40, and targets grade S500. Limit 1002 applies to property 3 with a range type and value of 23.60 for grade S15. Limit 1003 applies to property 4 with a maximum of 27.80 for grade S500. The limit type determines how the value is interpreted: a maximum means the measured property must not exceed the value, a minimum means it must not fall below it, and a range indicates a bounded interval.

**Table `biodiesel_blends`**

| biodiesel_blend_id | blend_id | biodiesel_percentage | petroleum_diesel_percentage | blend_date | status |
|---|---|---|---|---|---|
| 1 | 10238262 | 7.70 | 12.70 | 2022-05-18T16:36:00 | pending |
| 2 | Bjalle | 11.40 | 17.40 | 2023-10-02T23:53:00 | running |
| 3 | 50515872-8fb2-11eb-924d-9cd76263cbd0 | 15.10 | 22.10 | 2024-03-13T06:10:00 | complete |
| 4 | Ubah | 18.80 | 26.80 | 2025-08-24T13:27:00 | failed |

The `biodiesel_blends` table records the physical mixtures deployed in the field. Each blend has a unique `biodiesel_blend_id`, a `blend_id` that may be a numeric identifier like 10238262 or a named identifier like Bjalle, percentages of biodiesel and petroleum diesel, a `blend_date`, and a `status` of pending, running, complete, or failed. Blend 1, identified by blend_id 10238262, contains 7.70% biodiesel and 12.70% petroleum diesel, was created on 2022-05-18, and remains in pending status. Blend 2, named Bjalle, contains 11.40% biodiesel and 17.40% petroleum diesel, was created on 2023-10-02, and is currently running. Blend 3, with the UUID-style identifier 50515872-8fb2-11eb-924d-9cd76263cbd0, contains 15.10% biodiesel and 22.10% petroleum diesel, was created on 2024-03-13, and has reached complete status. Blend 4, named Ubah, contains 18.80% biodiesel and 26.80% petroleum diesel, was created on 2025-08-24, and has failed.

**Table `fuel_components`**

| component_id | component_type | volume | batch_id | biodiesel_blend_id | biodiesel_specification_id |
|---|---|---|---|---|---|
| 3001009030210 | B100 | 9.45 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 1 | 100 |
| id_10 | PetroleumDiesel | 11.90 | 2087741 | 2 | 101 |
| 325462 | B100 | 14.35 | 2106724 | 3 | 102 |
| 168556 | PetroleumDiesel | 16.80 | 4060663 | 4 | 103 |

Fuel components are the individual materials that make up each blend. The `fuel_components` table records each component with a `component_id`, a `component_type` of B100 or PetroleumDiesel, a `volume`, a `batch_id`, and references to both the owning `biodiesel_blend_id` and the governing `biodiesel_specification_id`. Component 3001009030210 is of type B100 with a volume of 9.45, belongs to batch 050bdfa8-8fc7-11eb-924d-9cd76263cbd0, is part of blend 1, and is governed by specification 100. Component id_10 is of type PetroleumDiesel with a volume of 11.90, belongs to batch 2087741, is part of blend 2, and is governed by specification 101. Component 325462 is B100 with volume 14.35, batch 2106724, blend 3, and specification 102. Component 168556 is PetroleumDiesel with volume 16.80, batch 4060663, blend 4, and specification 103.

**Table `specifications_properties`**

| biodiesel_specification_id | biodiesel_property_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `specifications_properties` junction table defines which properties are required by which specifications. This is a many-to-many relationship: a specification may require multiple properties, and a property may be required by multiple specifications. Specification 100 requires properties 1 and 2. Specification 101 requires properties 2 and 3. Specification 102 requires properties 3 and 4. Specification 103 requires properties 4 and 1. This cross-referencing ensures that every specification has a complete set of measurable attributes, and every property is traceable to at least one governing standard.

**Table `properties_limits`**

| biodiesel_property_id | property_limit_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

The `properties_limits` junction table links properties to their enforceable limits. Each row pairs a `biodiesel_property_id` with a `property_limit_id`, allowing a single property to carry multiple limits of different types or grades. Property 1 is associated with limit 1000 (maximum, 15.20, grade S15). Property 2 is associated with limit 1001 (minimum, 19.40, grade S500). Property 3 is associated with limit 1002 (range, 23.60, grade S15). Property 4 is associated with limit 1003 (maximum, 27.80, grade S500). This structure supports the possibility that a property might have separate limits for different grades or test conditions.

**Table `blends_components`**

| biodiesel_blend_id | component_id |
|---|---|
| 1 | 3001009030210 |
| 1 | id_10 |
| 2 | id_10 |
| 2 | 325462 |
| 3 | 325462 |
| 3 | 168556 |
| 4 | 168556 |
| 4 | 3001009030210 |

The `blends_components` junction table connects blends to their constituent fuel components. Each row pairs a `biodiesel_blend_id` with a `fuel_component_id`, establishing which components were used in which blend. This relationship is essential for traceability: given any blend, one can enumerate all its components, and given any component, one can determine which blend it belongs to.

**View `v_biodiesel_specification_biodiesel_property_detail`**

```sql
CREATE VIEW v_biodiesel_specification_biodiesel_property_detail AS
SELECT a.biodiesel_specification_id, a.specification_id, a.standard_number, b.id AS property_id, b.property_name AS property_property_name, b.astm_method_number AS property_astm_method_number
FROM biodiesel_specifications a
  JOIN specifications_properties j ON j.biodiesel_specification_id = a.biodiesel_specification_id
  JOIN biodiesel_properties b ON b.id = j.biodiesel_property_id;
```

| biodiesel_specification_id | specification_id | standard_number | property_id | property_property_name | property_astm_method_number |
|---|---|---|---|---|---|
| 100 | id_26 | STA-2752 | 1 | Baseline Standard D | AST-2044 |
| 100 | id_26 | STA-2752 | 2 | Distributed Framework | AST-2049 |
| 101 | 1437595 | STA-2757 | 2 | Distributed Framework | AST-2049 |
| 101 | 1437595 | STA-2757 | 3 | Adaptive Protocol | AST-2054 |
| 102 | 4277026 | STA-2762 | 3 | Adaptive Protocol | AST-2054 |
| 102 | 4277026 | STA-2762 | 4 | Primary Programme A | AST-2059 |
| 103 | 611516 | STA-2767 | 4 | Primary Programme A | AST-2059 |
| 103 | 611516 | STA-2767 | 1 | Baseline Standard D | AST-2044 |

The view `v_biodiesel_specification_biodiesel_property_detail` joins specifications with their required properties, producing a flat record that answers the question: "Which properties must be tested for each specification?" For specification 100 (STA-2752, grade S15), the view returns two rows—one for property 1 (Baseline Standard D, AST-2044) and one for property 2 (Distributed Framework, AST-2049). For specification 103 (STA-2767, grade S500), the view returns property 4 (Primary Programme A, AST-2059) and property 1 (Baseline Standard D, AST-2044). This view is the primary reference for laboratory technicians who need to know which tests to run for a given standard.

**View `v_biodiesel_property_biodiesel_specification`**

```sql
CREATE VIEW v_biodiesel_property_biodiesel_specification AS
SELECT a.id, a.property_name, a.astm_method_number, a.unit_of_measure, b.biodiesel_specification_id AS specification_biodiesel_specification_id, b.specification_id AS specification_specification_id, b.standard_number AS specification_standard_number
FROM biodiesel_properties a JOIN biodiesel_specifications b ON a.biodiesel_specification_id = b.biodiesel_specification_id;
```

| id | property_name | astm_method_number | unit_of_measure | specification_biodiesel_specification_id | specification_specification_id | specification_standard_number |
|---|---|---|---|---|---|---|
| 1 | Baseline Standard D | AST-2044 | composite-unit-69 | 100 | id_26 | STA-2752 |
| 2 | Distributed Framework | AST-2049 | primary-unit-70 | 101 | 1437595 | STA-2757 |
| 3 | Adaptive Protocol | AST-2054 | adaptive-unit-71 | 102 | 4277026 | STA-2762 |
| 4 | Primary Programme A | AST-2059 | distributed-unit-72 | 103 | 611516 | STA-2767 |

The view `v_biodiesel_property_biodiesel_specification` inverts the relationship, joining properties back to their governing specifications. It answers: "Which specification governs each property?" Property 1 appears in the view linked to specification 100 and specification 103, reflecting the fact that property 1 is required by both standards. Property 2 appears linked to specification 100 and specification 101. This bidirectional mapping ensures that no property exists in isolation and that every test result can be traced to its regulatory source.

**View `v_biodiesel_property_property_limit_detail`**

```sql
CREATE VIEW v_biodiesel_property_property_limit_detail AS
SELECT a.id, a.property_name, a.astm_method_number, b.id AS limit_id, b.limit_value AS limit_limit_value, b.limit_type AS limit_limit_type
FROM biodiesel_properties a
  JOIN properties_limits j ON j.biodiesel_property_id = a.id
  JOIN property_limits b ON b.id = j.property_limit_id;
```

| id | property_name | astm_method_number | limit_id | limit_limit_value | limit_limit_type |
|---|---|---|---|---|---|
| 1 | Baseline Standard D | AST-2044 | 1000 | 15.20 | maximum |
| 1 | Baseline Standard D | AST-2044 | 1001 | 19.40 | minimum |
| 2 | Distributed Framework | AST-2049 | 1001 | 19.40 | minimum |
| 2 | Distributed Framework | AST-2049 | 1002 | 23.60 | range |
| 3 | Adaptive Protocol | AST-2054 | 1002 | 23.60 | range |
| 3 | Adaptive Protocol | AST-2054 | 1003 | 27.80 | maximum |
| 4 | Primary Programme A | AST-2059 | 1003 | 27.80 | maximum |
| 4 | Primary Programme A | AST-2059 | 1000 | 15.20 | maximum |

The view `v_biodiesel_property_property_limit_detail` joins properties with their limits, answering: "What are the acceptable bounds for each property?" For property 1 (Baseline Standard D), the view shows limit 1000 with a maximum value of 15.20 for grade S15. For property 2 (Distributed Framework), the view shows limit 1001 with a minimum value of 19.40 for grade S500. For property 3 (Adaptive Protocol), the view shows limit 1002 with a range value of 23.60 for grade S15. For property 4 (Primary Programme A), the view shows limit 1003 with a maximum value of 27.80 for grade S500. Quality engineers use this view to validate test results against the correct thresholds.

**View `v_property_limit_biodiesel_property`**

```sql
CREATE VIEW v_property_limit_biodiesel_property AS
SELECT a.id, a.limit_value, a.limit_type, a.grade, b.id AS property_id, b.property_name AS property_property_name, b.astm_method_number AS property_astm_method_number
FROM property_limits a JOIN biodiesel_properties b ON a.biodiesel_property_id = b.id;
```

| id | limit_value | limit_type | grade | property_id | property_property_name | property_astm_method_number |
|---|---|---|---|---|---|---|
| 1000 | 15.20 | maximum | S15 | 1 | Baseline Standard D | AST-2044 |
| 1001 | 19.40 | minimum | S500 | 2 | Distributed Framework | AST-2049 |
| 1002 | 23.60 | range | S15 | 3 | Adaptive Protocol | AST-2054 |
| 1003 | 27.80 | maximum | S500 | 4 | Primary Programme A | AST-2059 |

The view `v_property_limit_biodiesel_property` presents the limit-to-property relationship from the limit's perspective, answering: "Which property does this limit constrain?" Limit 1000 constrains property 1 (Baseline Standard D) with a maximum of 15.20. Limit 1001 constrains property 2 (Distributed Framework) with a minimum of 19.40. Limit 1002 constrains property 3 (Adaptive Protocol) with a range of 23.60. Limit 1003 constrains property 4 (Primary Programme A) with a maximum of 27.80. This orientation is useful for limit management workflows, where an administrator needs to review or modify a specific limit and understand which property it affects.

**View `v_biodiesel_blend_fuel_component_detail`**

```sql
CREATE VIEW v_biodiesel_blend_fuel_component_detail AS
SELECT a.biodiesel_blend_id, a.blend_id, a.biodiesel_percentage, b.component_id AS component_component_id, b.component_type AS component_component_type, b.volume AS component_volume
FROM biodiesel_blends a
  JOIN blends_components j ON j.biodiesel_blend_id = a.biodiesel_blend_id
  JOIN fuel_components b ON b.component_id = j.component_id;
```

| biodiesel_blend_id | blend_id | biodiesel_percentage | component_component_id | component_component_type | component_volume |
|---|---|---|---|---|---|
| 1 | 10238262 | 7.70 | 3001009030210 | B100 | 9.45 |
| 1 | 10238262 | 7.70 | id_10 | PetroleumDiesel | 11.90 |
| 2 | Bjalle | 11.40 | id_10 | PetroleumDiesel | 11.90 |
| 2 | Bjalle | 11.40 | 325462 | B100 | 14.35 |
| 3 | 50515872-8fb2-11eb-924d-9cd76263cbd0 | 15.10 | 325462 | B100 | 14.35 |
| 3 | 50515872-8fb2-11eb-924d-9cd76263cbd0 | 15.10 | 168556 | PetroleumDiesel | 16.80 |
| 4 | Ubah | 18.80 | 168556 | PetroleumDiesel | 16.80 |
| 4 | Ubah | 18.80 | 3001009030210 | B100 | 9.45 |

The view `v_biodiesel_blend_fuel_component_detail` joins blends with their fuel components, answering: "What materials make up each blend?" For blend 1 (blend_id 10238262), the view shows component 3001009030210 of type B100 with volume 9.45, batch 050bdfa8-8fc7-11eb-924d-9cd76263cbd0, governed by specification 100. For blend 2 (named Bjalle), the view shows component id_10 of type PetroleumDiesel with volume 11.90, batch 2087741, governed by specification 101. For blend 3 (UUID 50515872-8fb2-11eb-924d-9cd76263cbd0), the view shows component 325462 of type B100 with volume 14.35, batch 2106724, governed by specification 102. For blend 4 (named Ubah), the view shows component 168556 of type PetroleumDiesel with volume 16.80, batch 4060663, governed by specification 103. This view is essential for inventory management and batch traceability.

**View `v_fuel_component_biodiesel_blend`**

```sql
CREATE VIEW v_fuel_component_biodiesel_blend AS
SELECT a.component_id, a.component_type, a.volume, a.batch_id, b.biodiesel_blend_id AS blend_biodiesel_blend_id, b.blend_id AS blend_blend_id, b.biodiesel_percentage AS blend_biodiesel_percentage
FROM fuel_components a JOIN biodiesel_blends b ON a.biodiesel_blend_id = b.biodiesel_blend_id;
```

| component_id | component_type | volume | batch_id | blend_biodiesel_blend_id | blend_blend_id | blend_biodiesel_percentage |
|---|---|---|---|---|---|---|
| 3001009030210 | B100 | 9.45 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 1 | 10238262 | 7.70 |
| id_10 | PetroleumDiesel | 11.90 | 2087741 | 2 | Bjalle | 11.40 |
| 325462 | B100 | 14.35 | 2106724 | 3 | 50515872-8fb2-11eb-924d-9cd76263cbd0 | 15.10 |
| 168556 | PetroleumDiesel | 16.80 | 4060663 | 4 | Ubah | 18.80 |

The view `v_fuel_component_biodiesel_blend` presents the component-to-blend relationship from the component's perspective, answering: "Which blend does this component belong to?" Component 3001009030210 (B100, volume 9.45) belongs to blend 1 (blend_id 10238262). Component id_10 (PetroleumDiesel, volume 11.90) belongs to blend 2 (named Bjalle). Component 325462 (B100, volume 14.35) belongs to blend 3 (UUID 50515872-8fb2-11eb-924d-9cd76263cbd0). Component 168556 (PetroleumDiesel, volume 16.80) belongs to blend 4 (named Ubah). This orientation supports component-level audits, where a practitioner needs to verify that a specific batch of material was used in the correct blend.

**View `v_fuel_component_biodiesel_specification`**

```sql
CREATE VIEW v_fuel_component_biodiesel_specification AS
SELECT a.component_id, a.component_type, a.volume, a.batch_id, b.biodiesel_specification_id AS specification_biodiesel_specification_id, b.specification_id AS specification_specification_id, b.standard_number AS specification_standard_number
FROM fuel_components a JOIN biodiesel_specifications b ON a.biodiesel_specification_id = b.biodiesel_specification_id;
```

| component_id | component_type | volume | batch_id | specification_biodiesel_specification_id | specification_specification_id | specification_standard_number |
|---|---|---|---|---|---|---|
| 3001009030210 | B100 | 9.45 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 100 | id_26 | STA-2752 |
| id_10 | PetroleumDiesel | 11.90 | 2087741 | 101 | 1437595 | STA-2757 |
| 325462 | B100 | 14.35 | 2106724 | 102 | 4277026 | STA-2762 |
| 168556 | PetroleumDiesel | 16.80 | 4060663 | 103 | 611516 | STA-2767 |

The view `v_fuel_component_biodiesel_specification` joins fuel components with their governing specifications, answering: "Which specification governs each component in each blend?" Component 3001009030210 (B100) in blend 1 is governed by specification 100 (STA-2752, grade S15). Component id_10 (PetroleumDiesel) in blend 2 is governed by specification 101 (STA-2757, grade S500). Component 325462 (B100) in blend 3 is governed by specification 102 (STA-2762, grade S15). Component 168556 (PetroleumDiesel) in blend 4 is governed by specification 103 (STA-2767, grade S500). This view closes the traceability loop: every physical component in every blend can be traced back to the exact specification that defines its quality requirements, completing the chain from standard to specification to property to limit to blend to component.

The biodiesel quality framework operates as an integrated system where standards define specifications, specifications enumerate properties, properties carry limits, and blends composed of traceable components must satisfy the applicable standards. The junction tables—specifications_properties, properties_limits, and blends_components—provide the connective tissue that allows any record to be navigated in either direction. The views synthesize these relationships into actionable queries: laboratory technicians consult specification-to-property joins to know which tests to run, quality engineers consult property-to-limit joins to validate results, and operations managers consult blend-to-component joins to track material usage. Together, these tables and views form a complete audit trail from the publication of a standard like STA-2752 to the deployment of a blend like Ubah, ensuring that every drop of biodiesel can be verified against its governing requirements.