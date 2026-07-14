## The Biodiesel Specification and Blending Domain

The biodiesel industry operates at the intersection of regulatory compliance, chemical engineering, and supply-chain logistics. Specifications define the quality standards that biodiesel must meet—standards that vary by grade, by testing method, and by the criticality of each measured property. Blends describe how biodiesel is mixed with petroleum diesel in practice, with each blend carrying a percentage composition, a timestamp, and a lifecycle status. Fuel components represent the actual physical inputs—B100, petroleum diesel, and other constituents—tracked by volume and batch. This chapter explains how these three conceptual layers—specifications, properties, and blends—are modelled as a normalized relational schema, how many-to-many relationships are materialized through junction tables, and how a suite of views reconstructs domain facts from the normalized tables.

**Table `biodiesel_specifications`**

| biodiesel_specification_id | specification_id | standard_number | publication_year | grade | is_critical |
|---|---|---|---|---|---|
| 100 | id_26 | STA-2752 | 25 | S15 | false |
| 101 | 1437595 | STA-2757 | 33 | S500 | true |
| 102 | 4277026 | STA-2762 | 41 | S15 | false |
| 103 | 611516 | STA-2767 | 49 | S500 | true |

The `biodiesel_specifications` table is the anchor of the specification layer. Each row represents a distinct regulatory standard, identified by a surrogate key `biodiesel_specification_id` and a natural `specification_id`. The `standard_number` column carries human-readable identifiers such as `STA-2752` and `STA-2767`, while `publication_year` records the year of issuance (encoded as two-digit integers: `25`, `33`, `41`, `49`). The `grade` column distinguishes between viscosity grades—`S15` and `S500` in the data—and the boolean `is_critical` flag marks specifications that are non-negotiable for compliance. Row `101` (standard `STA-2757`, grade `S500`) and row `103` (standard `STA-2767`, grade `S500`) are both flagged as critical, whereas rows `100` and `102` (both grade `S15`) are not.

**Table `biodiesel_properties`**

| id | property_name | astm_method_number | unit_of_measure | is_critical | biodiesel_specification_id |
|---|---|---|---|---|---|
| 1 | Baseline Standard D | AST-2044 | composite-unit-69 | false | 100 |
| 2 | Distributed Framework | AST-2049 | primary-unit-70 | true | 101 |
| 3 | Adaptive Protocol | AST-2054 | adaptive-unit-71 | false | 102 |
| 4 | Primary Programme A | AST-2059 | distributed-unit-72 | true | 103 |

Properties are the measurable characteristics that specifications reference. The `biodiesel_properties` table stores each property with a surrogate `id`, a descriptive `property_name` (e.g., `Baseline Standard D`, `Distributed Framework`, `Adaptive Protocol`, `Primary Programme A`), the `astm_method_number` used for testing (`AST-2044` through `AST-2059`), the `unit_of_measure`, and an `is_critical` flag. Crucially, the foreign key `biodiesel_specification_id` binds each property to exactly one specification, establishing a cardinality-bounded one-to-many relationship: a specification can have many properties, but each property belongs to one specification. In the data, property `1` (`Baseline Standard D`) and property `3` (`Adaptive Protocol`) are both linked to specification `100` and `102` respectively, while properties `2` and `4` are linked to specifications `101` and `103`.

**Table `property_limits`**

| id | limit_value | limit_type | grade | biodiesel_property_id |
|---|---|---|---|---|
| 1000 | 15.20 | maximum | S15 | 1 |
| 1001 | 19.40 | minimum | S500 | 2 |
| 1002 | 23.60 | range | S15 | 3 |
| 1003 | 27.80 | maximum | S500 | 4 |

Property limits impose quantitative constraints on properties. The `property_limits` table stores a `limit_value` (a decimal such as `15.20`, `19.40`, `23.60`, `27.80`), a `limit_type` (`maximum`, `minimum`, or `range`), a `grade` that scopes the limit to a specific viscosity grade, and a foreign key `biodiesel_property_id` that ties the limit to its property. The grade column here mirrors the grade in `biodiesel_specifications`, enabling grade-specific enforcement: limit `1000` (value `15.20`, type `maximum`, grade `S15`) constrains property `1`, while limit `1001` (value `19.40`, type `minimum`, grade `S500`) constrains property `2`.

**Table `biodiesel_blends`**

| biodiesel_blend_id | blend_id | biodiesel_percentage | petroleum_diesel_percentage | blend_date | status |
|---|---|---|---|---|---|
| 1 | 10238262 | 7.70 | 12.70 | 2022-05-18T16:36:00 | pending |
| 2 | Bjalle | 11.40 | 17.40 | 2023-10-02T23:53:00 | running |
| 3 | 50515872-8fb2-11eb-924d-9cd76263cbd0 | 15.10 | 22.10 | 2024-03-13T06:10:00 | complete |
| 4 | Ubah | 18.80 | 26.80 | 2025-08-24T13:27:00 | failed |

The blending layer is captured in `biodiesel_blends`. Each row represents a blend instance with a surrogate `biodiesel_blend_id`, a natural `blend_id` (which can be numeric like `10238262` or alphanumeric like `Bjalle` and `Ubah`), the `biodiesel_percentage` and `petroleum_diesel_percentage` that define the mixture ratio, a `blend_date` timestamp, and a `status` (`pending`, `running`, `complete`, `failed`). Blend `1` (blend_id `10238262`) has `7.70%` biodiesel and `12.70%` petroleum diesel and is in `pending` status; blend `4` (blend_id `Ubah`) has `18.80%` biodiesel and `26.80%` petroleum diesel and is in `failed` status.

**Table `fuel_components`**

| component_id | component_type | volume | batch_id | biodiesel_blend_id | biodiesel_specification_id |
|---|---|---|---|---|---|
| 3001009030210 | B100 | 9.45 | 050bdfa8-8fc7-11eb-924d-9cd76263cbd0 | 1 | 100 |
| id_10 | PetroleumDiesel | 11.90 | 2087741 | 2 | 101 |
| 325462 | B100 | 14.35 | 2106724 | 3 | 102 |
| 168556 | PetroleumDiesel | 16.80 | 4060663 | 4 | 103 |

Fuel components are the physical inputs to blends. The `fuel_components` table stores a `component_id` (which can be a long numeric string like `3001009030210` or a short identifier like `id_10`), a `component_type` (`B100` or `PetroleumDiesel`), a `volume` (decimal liters such as `9.45`, `11.90`, `14.35`, `16.80`), a `batch_id` (UUID or numeric), and two foreign keys: `biodiesel_blend_id` linking the component to its blend, and `biodiesel_specification_id` linking the component to the specification it must satisfy. Component `3001009030210` (type `B100`, volume `9.45`) belongs to blend `1` and specification `100`; component `id_10` (type `PetroleumDiesel`, volume `11.90`) belongs to blend `2` and specification `101`.

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

The `specifications_properties` table is a junction table that materializes a many-to-many relationship between specifications and properties. Although the `biodiesel_properties` table already carries a `biodiesel_specification_id` foreign key suggesting a direct one-to-many relationship, the presence of `specifications_properties` indicates that the domain model supports a richer association: a specification can reference multiple properties, and a property can be referenced by multiple specifications. The data confirms this multiplicity. Specification `100` is associated with properties `1` and `2`; specification `101` with properties `2` and `3`; specification `102` with properties `3` and `4`; and specification `103` with properties `4` and `1`. This cross-referencing pattern—where property `1` appears under both specification `100` and `103`, and property `2` under both `100` and `101`—demonstrates that the junction table captures a true many-to-many relationship that cannot be expressed through a single foreign key column.

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

Similarly, `properties_limits` is a junction table linking properties to their limits. Each row pairs a `biodiesel_property_id` with a `property_limit_id` (implicitly the `id` from `property_limits`). This allows a single property to have multiple limits (e.g., different limits for different grades) and a single limit to apply to multiple properties. The data shows property `1` linked to limit `1000`, property `2` to limit `1001`, property `3` to limit `1002`, and property `4` to limit `1003`.

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

The `blends_components` junction table connects blends to their fuel components. Each row pairs a `biodiesel_blend_id` with a `fuel_component_id`, enabling a blend to consist of multiple components and a component to appear in multiple blends. In the data, blend `1` is associated with component `3001009030210`, blend `2` with component `id_10`, blend `3` with component `325462`, and blend `4` with component `168556`.

With the base tables established, the views reconstruct domain facts by joining these normalized tables. Each view answers a specific analytical question.

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

The view `v_biodiesel_specification_biodiesel_property_detail` joins `biodiesel_specifications` to `biodiesel_properties` through the `specifications_properties` junction table, producing a denormalized row for every specification–property association. It answers the question: "Which properties are associated with each specification, and what are their testing methods and criticality flags?" A row from this view might show specification `STA-2752` (grade `S15`, not critical) alongside property `Baseline Standard D` (AST method `AST-2044`, not critical), or specification `STA-2757` (grade `S500`, critical) alongside property `Distributed Framework` (AST method `AST-2049`, critical). The view effectively flattens the three-table join (`biodiesel_specifications` → `specifications_properties` → `biodiesel_properties`) into a single queryable result.

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

The view `v_biodiesel_property_biodiesel_specification` reverses the perspective: it starts from properties and joins back to their parent specifications. It answers: "For each property, which specification(s) reference it, and what are the specification's standard number and grade?" A row might show property `Adaptive Protocol` (AST method `AST-2054`, not critical) alongside specification `STA-2762` (grade `S15`, not critical). This view is useful for impact analysis: if a property's testing method changes, the view immediately reveals which specifications are affected.

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

The view `v_biodiesel_property_property_limit_detail` joins `biodiesel_properties` to `property_limits` through the `properties_limits` junction table. It answers: "What quantitative limits apply to each property, and under which grade?" A row might show property `Baseline Standard D` (AST method `AST-2044`) alongside limit `15.20` of type `maximum` for grade `S15`. This view is the primary interface for compliance checking: it brings together the property definition, its limit value, and the grade scope in a single row.

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

The view `v_property_limit_biodiesel_property` reverses the direction of the previous view, starting from limits and joining to their properties. It answers: "For each limit, which property does it constrain, and what is the property's name and testing method?" A row might show limit `19.40` (type `minimum`, grade `S500`) alongside property `Distributed Framework` (AST method `AST-2049`). This view is useful for limit-centric queries, such as finding all limits that exceed a threshold value.

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

The view `v_biodiesel_blend_fuel_component_detail` joins `biodiesel_blends` to `fuel_components` through the `blends_components` junction table. It answers: "Which fuel components are used in each blend, and what are their types, volumes, and batch identifiers?" A row might show blend `Bjalle` (biodiesel percentage `11.40`, status `running`) alongside component `id_10` (type `PetroleumDiesel`, volume `11.90`, batch `2087741`). This view reconstructs the composition of each blend from the normalized tables.

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

The view `v_fuel_component_biodiesel_blend` reverses the perspective, starting from components and joining to their parent blends. It answers: "For each fuel component, which blend does it belong to, and what is the blend's status and composition?" A row might show component `325462` (type `B100`, volume `14.35`, batch `2106724`) alongside blend `50515872-8fb2-11eb-924d-9cd76263cbd0` (biodiesel percentage `15.10`, status `complete`). This view supports traceability: given a batch of fuel, you can determine which blend it was used in and whether that blend succeeded or failed.

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

The view `v_fuel_component_biodiesel_specification` joins `fuel_components` directly to `biodiesel_specifications` via the `biodiesel_specification_id` foreign key in `fuel_components`. It answers: "Which specification does each fuel component satisfy, and what are the component's type and volume?" A row might show component `3001009030210` (type `B100`, volume `9.45`) alongside specification `STA-2752` (grade `S15`, not critical). This view is the simplest of the three blend-related views, requiring only a single join, and it is useful for verifying that components are associated with the correct specifications.

The schema as a whole embodies a layered normalization strategy. The specification layer (`biodiesel_specifications`, `biodiesel_properties`, `property_limits`) captures the regulatory and quality-assurance domain, with junction tables (`specifications_properties`, `properties_limits`) enabling flexible many-to-many associations. The blending layer (`biodiesel_blends`, `fuel_components`) captures the operational domain, with the `blends_components` junction table enabling flexible composition. The `fuel_components` table bridges the two layers by carrying a `biodiesel_specification_id` foreign key, thereby linking physical components to their governing specifications. The views materialize the most common analytical queries as virtual tables, eliminating the need for repeated multi-table joins while preserving the underlying normalized structure. This design supports both strict referential integrity (enforced by foreign keys) and flexible querying (enabled by the views), making it suitable for both operational data entry and analytical reporting in the biodiesel domain.