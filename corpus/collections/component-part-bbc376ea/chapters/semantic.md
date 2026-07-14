## Ontology-Grounded Relational Modelling of Component Parts

The component parts domain captures the structured specification of electronic components across electrical, mechanical, and screening dimensions. Each component part is a distinct entity identified by a surrogate key and a human-readable part number, further disambiguated by a base part number and a suffix that encodes variant information. The relational schema normalises these attributes across five base tables, each responsible for a single concern area, and exposes seven denormalised views that reconstruct domain facts through explicit joins. The following sections walk through the entity types, their attributes, the cardinality-bounded relationships that materialise as foreign keys, and the view-level joins that answer concrete engineering questions.

### Base Tables and Entity Types

The central entity is the component part.

**Table `component_parts`**

| id | part_number | base_part_number | suffix | case_style | marking_style | is_ro_hs_compliant | is_high_reliability | screening_standard | electrical_specification_id | mechanical_specification_id | electrical_rating_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 100 | PAR-2291 | BAS-2332 | integrated-suffix-58 | composite-case-45 | integrated-marking-64 | false | true | adaptive-screenin-83 | 1 | 1 | 1 |
| 101 | PAR-2297 | BAS-2336 | seasonal-suffix-59 | primary-case-46 | seasonal-marking-65 | true | false | distributed-screenin-84 | 2 | 2 | 2 |
| 102 | PAR-2303 | BAS-2340 | regional-suffix-60 | adaptive-case-47 | regional-marking-66 | false | true | baseline-screenin-85 | 3 | 3 | 3 |
| 103 | PAR-2309 | BAS-2344 | legacy-suffix-61 | distributed-case-48 | legacy-marking-67 | true | false | pilot-screenin-86 | 4 | 4 | 4 |

The `component_parts` table anchors the schema. Its primary key is `id`, a surrogate integer that uniquely identifies each row. The business-identifying columns are `part_number` (e.g. `PAR-2291`), `base_part_number` (e.g. `BAS-2332`), and `suffix` (e.g. `integrated-suffix-58`). The `case_style` and `marking_style` columns store categorical descriptors such as `composite-case-45` and `integrated-marking-64`. Boolean flags `is_ro_hs_compliant` and `is_high_reliability` capture compliance and quality-tier attributes. The remaining three columns — `screening_standard`, `electrical_specification_id`, `mechanical_specification_id`, and `electrical_rating_id` — are foreign keys that link the component part to its associated screening standard, electrical specification, mechanical specification, and electrical rating respectively. Every component part row carries exactly one value in each of these FK columns, enforcing a one-to-one relationship with each of the four specification tables.

The electrical specification table stores the test and operational parameters of a component.

**Table `electrical_specifications`**

| electrical_specification_id | test_ambient_temperature | test_condition_description | blocking_voltage_rating | dc_on_state_current | repetitive_peak_on_state_current | peak_surge_current | peak_gate_current | average_gate_current | reverse_gate_voltage | junction_temperature_range | component_part_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 0.74 | Composite Protocol | 9.95 | 19.20 | 14.70 | 6.20 | 12.45 | 3.70 | 16.70 | adaptive-junction-59 | 100 |
| 2 | 0.13 | Compact Programme A | 11.90 | 22.40 | 18.40 | 8.40 | 14.90 | 7.40 | 18.40 | distributed-junction-60 | 101 |
| 3 | 0.075 | Legacy Standard | 13.85 | 25.60 | 22.10 | 10.60 | 17.35 | 11.10 | 20.10 | baseline-junction-61 | 102 |
| 4 | 0.195 | Regional Framework | 15.80 | 28.80 | 25.80 | 12.80 | 19.80 | 14.80 | 21.80 | pilot-junction-62 | 103 |

The `electrical_specifications` table uses `electrical_specification_id` as its primary key. Its columns capture test conditions (`test_ambient_temperature`, `test_condition_description`), current and voltage ratings (`blocking_voltage_rating`, `dc_on_state_current`, `repetitive_peak_on_state_current`, `peak_surge_current`, `peak_gate_current`, `average_gate_current`, `reverse_gate_voltage`), and the `junction_temperature_range` as a categorical code. The foreign key `component_part_id` points back to `component_parts.id`, establishing a one-to-one relationship: each electrical specification belongs to exactly one component part, and each component part has exactly one electrical specification. For instance, row `1` of `electrical_specifications` (with `test_ambient_temperature = 0.74` and `test_condition_description = 'Composite Protocol'`) is linked to component part `100` (`PAR-2291`).

The electrical ratings table captures discrete rating values with symbolic identifiers.

**Table `electrical_ratings`**

| electrical_rating_id | symbol | value | unit | condition | is_repetitive | is_surge | component_part_id |
|---|---|---|---|---|---|---|---|
| 1 | compact-symbol-38 | 19.95 | distributed-unit-18 | seasonal-conditio-89 | true | false | 100 |
| 2 | composite-symbol-39 | 21.90 | baseline-unit-19 | regional-conditio-90 | false | true | 101 |
| 3 | primary-symbol-40 | 23.85 | pilot-unit-20 | legacy-conditio-91 | true | false | 102 |
| 4 | adaptive-symbol-41 | 25.80 | extended-unit-21 | compact-conditio-92 | false | true | 103 |

The `electrical_ratings` table uses `electrical_rating_id` as its primary key. Each row represents a single rated quantity, described by `symbol` (e.g. `compact-symbol-38`), `value` (e.g. `19.95`), `unit` (e.g. `distributed-unit-18`), and `condition` (e.g. `seasonal-conditio-89`). Boolean flags `is_repetitive` and `is_surge` classify the rating type. The foreign key `component_part_id` links each rating to its owning component part. Again, the cardinality is one-to-one: each component part has exactly one electrical rating row, and each rating row belongs to exactly one component part. Row `1` of `electrical_ratings` (symbol `compact-symbol-38`, value `19.95`, unit `distributed-unit-18`) is associated with component part `100`.

The mechanical specifications table records physical and environmental attributes.

**Table `mechanical_specifications`**

| id | case_style | marking_style | pinout_description | storage_temperature_range | component_part_id |
|---|---|---|---|---|---|
| 1 | composite-case-45 | integrated-marking-64 | Distributed Initiative | legacy-storage-19 | 100 |
| 2 | primary-case-46 | seasonal-marking-65 | Adaptive Model D | compact-storage-20 | 101 |
| 3 | adaptive-case-47 | regional-marking-66 | Primary Cluster | composite-storage-21 | 102 |
| 4 | distributed-case-48 | legacy-marking-67 | Composite Review | primary-storage-22 | 103 |

The `mechanical_specifications` table uses `id` as its primary key. Its columns include `case_style` and `marking_style` (which mirror the categorical values in `component_parts` but are stored here as the canonical mechanical specification), `pinout_description` (e.g. `Distributed Initiative`), and `storage_temperature_range` (e.g. `legacy-storage-19`). The foreign key `component_part_id` establishes the one-to-one link to `component_parts`. Row `1` (case `composite-case-45`, pinout `Distributed Initiative`) corresponds to component part `100`.

The screening standards table encodes quality and compliance protocols.

**Table `screening_standards`**

| id | standard_code | level | description | component_part_id |
|---|---|---|---|---|
| 1 | L459 | seasonal-level-71 | Extended Survey | 100 |
| 2 | account_pymes_596 | regional-level-72 | Pilot Corridor A | 101 |
| 3 | 9125613 | legacy-level-73 | Baseline Series | 102 |
| 4 | 8189504 | compact-level-74 | Distributed Assessment | 103 |

The `screening_standards` table uses `id` as its primary key. Its columns are `standard_code` (e.g. `L459`), `level` (e.g. `seasonal-level-71`), `description` (e.g. `Extended Survey`), and the foreign key `component_part_id`. Each screening standard applies to exactly one component part, and each component part references exactly one screening standard. Row `1` (code `L459`, level `seasonal-level-71`, description `Extended Survey`) is linked to component part `100`.

### View-Level Reconstructiion of Domain Facts

The seven views each join `component_parts` with one of the four specification tables, projecting a flattened result that answers a specific engineering question. The join key is always the foreign key column in `component_parts` matching the primary key of the target specification table.

#### `component_part_electrical_specification_view`

**View `component_part_electrical_specification_view`**

```sql
CREATE VIEW component_part_electrical_specification_view AS
SELECT a.id, a.part_number, a.base_part_number, a.suffix, b.electrical_specification_id AS specification_electrical_specification_id, b.test_ambient_temperature AS specification_test_ambient_temperature, b.test_condition_description AS specification_test_condition_description
FROM component_parts a JOIN electrical_specifications b ON a.electrical_specification_id = b.electrical_specification_id;
```

| id | part_number | base_part_number | suffix | specification_electrical_specification_id | specification_test_ambient_temperature | specification_test_condition_description |
|---|---|---|---|---|---|---|
| 100 | PAR-2291 | BAS-2332 | integrated-suffix-58 | 1 | 0.74 | Composite Protocol |
| 101 | PAR-2297 | BAS-2336 | seasonal-suffix-59 | 2 | 0.13 | Compact Programme A |
| 102 | PAR-2303 | BAS-2340 | regional-suffix-60 | 3 | 0.075 | Legacy Standard |
| 103 | PAR-2309 | BAS-2344 | legacy-suffix-61 | 4 | 0.195 | Regional Framework |

This view answers the question: *What electrical specification parameters apply to each component part?* It joins `component_parts` on `electrical_specification_id = electrical_specifications.electrical_specification_id` and projects the part identity columns alongside a subset of the electrical specification columns. The result for component part `100` (`PAR-2291`) shows `specification_electrical_specification_id = 1` and `specification_test_ambient_temperature = 0.74` with `specification_test_condition_description = 'Composite Protocol'`. Component part `103` (`PAR-2309`) maps to specification `4` with `test_ambient_temperature = 0.195` and `test_condition_description = 'Regional Framework'`. The view effectively materialises the one-to-one relationship between a component part and its electrical specification as a single denormalised row.

#### `component_part_mechanical_specification_view`

**View `component_part_mechanical_specification_view`**

```sql
CREATE VIEW component_part_mechanical_specification_view AS
SELECT a.id, a.part_number, a.base_part_number, a.suffix, b.id AS specification_id, b.case_style AS specification_case_style, b.marking_style AS specification_marking_style
FROM component_parts a JOIN mechanical_specifications b ON a.mechanical_specification_id = b.id;
```

| id | part_number | base_part_number | suffix | specification_id | specification_case_style | specification_marking_style |
|---|---|---|---|---|---|---|
| 100 | PAR-2291 | BAS-2332 | integrated-suffix-58 | 1 | composite-case-45 | integrated-marking-64 |
| 101 | PAR-2297 | BAS-2336 | seasonal-suffix-59 | 2 | primary-case-46 | seasonal-marking-65 |
| 102 | PAR-2303 | BAS-2340 | regional-suffix-60 | 3 | adaptive-case-47 | regional-marking-66 |
| 103 | PAR-2309 | BAS-2344 | legacy-suffix-61 | 4 | distributed-case-48 | legacy-marking-67 |

This view answers: *What mechanical specification applies to each component part?* It joins `component_parts` on `mechanical_specification_id = mechanical_specifications.id`. The projected columns include the part identity and the mechanical specification's `case_style`, `marking_style`, `pinout_description`, and `storage_temperature_range`. For component part `100` (`PAR-2291`), the view returns `case_style = composite-case-45`, `pinout_description = Distributed Initiative`, and `storage_temperature_range = legacy-storage-19`. For component part `102` (`PAR-2303`), the view shows `case_style = adaptive-case-47`, `pinout_description = Primary Cluster`, and `storage_temperature_range = composite-storage-21`.

#### `component_part_electrical_rating_view`

**View `component_part_electrical_rating_view`**

```sql
CREATE VIEW component_part_electrical_rating_view AS
SELECT a.id, a.part_number, a.base_part_number, a.suffix, b.electrical_rating_id AS rating_electrical_rating_id, b.symbol AS rating_symbol, b.value AS rating_value
FROM component_parts a JOIN electrical_ratings b ON a.electrical_rating_id = b.electrical_rating_id;
```

| id | part_number | base_part_number | suffix | rating_electrical_rating_id | rating_symbol | rating_value |
|---|---|---|---|---|---|---|
| 100 | PAR-2291 | BAS-2332 | integrated-suffix-58 | 1 | compact-symbol-38 | 19.95 |
| 101 | PAR-2297 | BAS-2336 | seasonal-suffix-59 | 2 | composite-symbol-39 | 21.90 |
| 102 | PAR-2303 | BAS-2340 | regional-suffix-60 | 3 | primary-symbol-40 | 23.85 |
| 103 | PAR-2309 | BAS-2344 | legacy-suffix-61 | 4 | adaptive-symbol-41 | 25.80 |

This view answers: *What electrical rating is associated with each component part?* It joins `component_parts` on `electrical_rating_id = electrical_ratings.electrical_rating_id`. The result includes the part identity alongside the rating's `symbol`, `value`, `unit`, `condition`, `is_repetitive`, and `is_surge`. Component part `100` (`PAR-2291`) yields `symbol = compact-symbol-38`, `value = 19.95`, `unit = distributed-unit-18`, `condition = seasonal-conditio-89`, with `is_repetitive = true` and `is_surge = false`. Component part `101` (`PAR-2297`) yields `symbol = composite-symbol-39`, `value = 21.90`, `unit = baseline-unit-19`, `condition = regional-conditio-90`, with `is_repetitive = false` and `is_surge = true`.

#### `electrical_specification_component_part_view`

**View `electrical_specification_component_part_view`**

```sql
CREATE VIEW electrical_specification_component_part_view AS
SELECT a.electrical_specification_id, a.test_ambient_temperature, a.test_condition_description, a.blocking_voltage_rating, b.id AS part_id, b.part_number AS part_part_number, b.base_part_number AS part_base_part_number
FROM electrical_specifications a JOIN component_parts b ON a.component_part_id = b.id;
```

| electrical_specification_id | test_ambient_temperature | test_condition_description | blocking_voltage_rating | part_id | part_part_number | part_base_part_number |
|---|---|---|---|---|---|---|
| 1 | 0.74 | Composite Protocol | 9.95 | 100 | PAR-2291 | BAS-2332 |
| 2 | 0.13 | Compact Programme A | 11.90 | 101 | PAR-2297 | BAS-2336 |
| 3 | 0.075 | Legacy Standard | 13.85 | 102 | PAR-2303 | BAS-2340 |
| 4 | 0.195 | Regional Framework | 15.80 | 103 | PAR-2309 | BAS-2344 |

This view inverts the join direction: it starts from `electrical_specifications` and joins to `component_parts` via `electrical_specification_id = component_parts.electrical_specification_id`. The question it answers is: *Which component part does this electrical specification belong to?* The result is logically identical to `component_part_electrical_specification_view` but the driving table is the specification. Row `1` shows `electrical_specification_id = 1` linked to `part_number = PAR-2291` and `base_part_number = BAS-2332`. Row `4` shows `electrical_specification_id = 4` linked to `part_number = PAR-2309` and `base_part_number = BAS-2344`.

#### `electrical_rating_component_part_view`

**View `electrical_rating_component_part_view`**

```sql
CREATE VIEW electrical_rating_component_part_view AS
SELECT a.electrical_rating_id, a.symbol, a.value, a.unit, b.id AS part_id, b.part_number AS part_part_number, b.base_part_number AS part_base_part_number
FROM electrical_ratings a JOIN component_parts b ON a.component_part_id = b.id;
```

| electrical_rating_id | symbol | value | unit | part_id | part_part_number | part_base_part_number |
|---|---|---|---|---|---|---|
| 1 | compact-symbol-38 | 19.95 | distributed-unit-18 | 100 | PAR-2291 | BAS-2332 |
| 2 | composite-symbol-39 | 21.90 | baseline-unit-19 | 101 | PAR-2297 | BAS-2336 |
| 3 | primary-symbol-40 | 23.85 | pilot-unit-20 | 102 | PAR-2303 | BAS-2340 |
| 4 | adaptive-symbol-41 | 25.80 | extended-unit-21 | 103 | PAR-2309 | BAS-2344 |

This view starts from `electrical_ratings` and joins to `component_parts` via `electrical_rating_id = component_parts.electrical_rating_id`. It answers: *Which component part owns this electrical rating?* Row `1` shows `electrical_rating_id = 1` with `symbol = compact-symbol-38` and `value = 19.95` linked to `part_number = PAR-2291`. Row `3` shows `electrical_rating_id = 3` with `symbol = primary-symbol-40` and `value = 23.85` linked to `part_number = PAR-2303`.

#### `mechanical_specification_component_part_view`

**View `mechanical_specification_component_part_view`**

```sql
CREATE VIEW mechanical_specification_component_part_view AS
SELECT a.id, a.case_style, a.marking_style, a.pinout_description, b.id AS part_id, b.part_number AS part_part_number, b.base_part_number AS part_base_part_number
FROM mechanical_specifications a JOIN component_parts b ON a.component_part_id = b.id;
```

| id | case_style | marking_style | pinout_description | part_id | part_part_number | part_base_part_number |
|---|---|---|---|---|---|---|
| 1 | composite-case-45 | integrated-marking-64 | Distributed Initiative | 100 | PAR-2291 | BAS-2332 |
| 2 | primary-case-46 | seasonal-marking-65 | Adaptive Model D | 101 | PAR-2297 | BAS-2336 |
| 3 | adaptive-case-47 | regional-marking-66 | Primary Cluster | 102 | PAR-2303 | BAS-2340 |
| 4 | distributed-case-48 | legacy-marking-67 | Composite Review | 103 | PAR-2309 | BAS-2344 |

This view starts from `mechanical_specifications` and joins to `component_parts` via `id = component_parts.mechanical_specification_id`. It answers: *Which component part does this mechanical specification describe?* Row `1` shows `id = 1` with `case_style = composite-case-45` and `pinout_description = Distributed Initiative` linked to `part_number = PAR-2291`. Row `4` shows `id = 4` with `case_style = distributed-case-48` and `pinout_description = Composite Review` linked to `part_number = PAR-2309`.

#### `screening_standard_component_part_view`

**View `screening_standard_component_part_view`**

```sql
CREATE VIEW screening_standard_component_part_view AS
SELECT a.id, a.standard_code, a.level, a.description, b.id AS part_id, b.part_number AS part_part_number, b.base_part_number AS part_base_part_number
FROM screening_standards a JOIN component_parts b ON a.component_part_id = b.id;
```

| id | standard_code | level | description | part_id | part_part_number | part_base_part_number |
|---|---|---|---|---|---|---|
| 1 | L459 | seasonal-level-71 | Extended Survey | 100 | PAR-2291 | BAS-2332 |
| 2 | account_pymes_596 | regional-level-72 | Pilot Corridor A | 101 | PAR-2297 | BAS-2336 |
| 3 | 9125613 | legacy-level-73 | Baseline Series | 102 | PAR-2303 | BAS-2340 |
| 4 | 8189504 | compact-level-74 | Distributed Assessment | 103 | PAR-2309 | BAS-2344 |

This view starts from `screening_standards` and joins to `component_parts` via `id = component_parts.screening_standard`. It answers: *Which component part is subject to this screening standard?* Row `1` shows `id = 1` with `standard_code = L459`, `level = seasonal-level-71`, and `description = Extended Survey` linked to `part_number = PAR-2291`. Row `3` shows `id = 3` with `standard_code = 9125613`, `level = legacy-level-73`, and `description = Baseline Series` linked to `part_number = PAR-2303`.

### Synthesis

The schema models the component parts domain as a hub-and-spoke topology: `component_parts` is the hub, and the four specification tables (`electrical_specifications`, `electrical_ratings`, `mechanical_specifications`, `screening_standards`) are the spokes. Each spoke is linked to the hub by a one-to-one foreign key relationship, meaning every component part has exactly one value in each specification dimension. The seven views materialise these relationships in both directions — from part to specification and from specification to part — providing denormalised result sets that answer concrete engineering queries without requiring the consumer to write joins. The normalised base tables preserve data integrity and avoid redundancy, while the views offer a convenient read layer that reconstructs domain facts from the underlying relational structure.