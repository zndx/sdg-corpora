In precision manufacturing, a taper gage is a calibrated measuring instrument used to verify the geometry of tapered workpieces — whether cylindrical bores, conical shafts, or Morse-taper tool holders. Each gage carries a unique identity, a type classification, and a suite of dimensional and tolerance attributes that together define its metrological profile. The domain model captures four entity types: the gage itself, its dimensional specification, its tolerance requirement, and its inspection gage steps. These entities are normalised into four base tables and exposed through five materialised views that reconstruct the domain facts by joining the normalised tables back together.

## The taper gage as the central entity

The table `taper_gages` is the anchor of the schema. Every row represents a single physical gage and carries a surrogate primary key `id`, a categorical `gage_type` (either "Ring" or "Plug"), a human-readable `tool_number` such as `TOO-2137`, and a `mark_size` label like `compact-mark-38`. The gage's geometry is recorded in three decimal columns: `large_end_diameter`, `small_end_diameter`, and `taper_rate`. Two further decimal columns — `taper_tolerance` and `included_angle` — capture the allowable deviation and the cone angle in degrees.

**Table `taper_gages`**

| id | gage_type | tool_number | mark_size | large_end_diameter | small_end_diameter | taper_rate | taper_tolerance | included_angle | dimensional_specification_id | tolerance_requirement_id |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | Ring | TOO-2137 | compact-mark-38 | 21.95 | 13.45 | 15.45 | 5.95 | 7.20 | 100 | 1 |
| 1001 | Plug | TOO-2139 | composite-mark-39 | 25.90 | 16.90 | 19.90 | 7.90 | 11.40 | 101 | 2 |
| 1002 | Ring | TOO-2141 | primary-mark-40 | 29.85 | 20.35 | 24.35 | 9.85 | 15.60 | 102 | 3 |
| 1003 | Plug | TOO-2143 | adaptive-mark-41 | 33.80 | 23.80 | 28.80 | 11.80 | 19.80 | 103 | 4 |

Four rows illustrate the population. Gage `1000` is a Ring tool (`TOO-2137`) with a compact mark, spanning a large-end diameter of 21.95 down to a small-end diameter of 13.45, with a taper rate of 15.45 and an included angle of 7.20°. Gage `1001` is a Plug tool (`TOO-2139`) with a composite mark, larger at 25.90 / 16.90, and a steeper taper rate of 19.90. The pattern continues through `1002` and `1003`, whose diameters grow to 29.85 / 20.35 and 33.80 / 23.80 respectively.

Two foreign-key columns in `taper_gages` link outward to the other base tables. The column `dimensional_specification_id` references `dimensional_specifications.dimensional_specification_id`, and `tolerance_requirement_id` references `tolerance_requirements.id`. A third relationship — gage steps — is captured in a separate table with its own FK back to `taper_gages`.

## Dimensional specifications

The table `dimensional_specifications` stores the geometric blueprint for each gage. Its primary key is `dimensional_specification_id`, and it carries the same `large_end_diameter` and `small_end_diameter` columns found in `taper_gages`, along with two additional rate columns — `taper_rate_per_foot` and `taper_rate_per_inch` — that express the taper in different units. The angular geometry is captured in `half_angle` and `included_angle`. A FK column `taper_gage_id` points back to `taper_gages.id`, establishing a bidirectional link between the two tables.

**Table `dimensional_specifications`**

| dimensional_specification_id | large_end_diameter | small_end_diameter | taper_rate_per_foot | taper_rate_per_inch | half_angle | included_angle | taper_gage_id |
|---|---|---|---|---|---|---|---|
| 100 | 21.95 | 13.45 | 9.70 | 3.70 | 9.95 | 7.20 | 1000 |
| 101 | 25.90 | 16.90 | 11.40 | 6.40 | 12.90 | 11.40 | 1001 |
| 102 | 29.85 | 20.35 | 13.10 | 9.10 | 15.85 | 15.60 | 1002 |
| 103 | 33.80 | 23.80 | 14.80 | 11.80 | 18.80 | 19.80 | 1003 |

Each specification row is paired with exactly one gage. Specification `100` belongs to gage `1000` and records a large-end diameter of 21.95, a small-end diameter of 13.45, a taper rate per foot of 9.70, and an included angle of 7.20°. Specification `101` pairs with gage `1001` and shows a taper rate per foot of 11.40 and an included angle of 11.40°. The half-angle column provides the complementary angular measure — 9.95° for specification `100`, rising to 18.80° for specification `103`.

The cardinality between `taper_gages` and `dimensional_specifications` is one-to-one in this dataset: every gage has exactly one specification, and every specification references exactly one gage. The FK `taper_gages.dimensional_specification_id` and the reverse FK `dimensional_specifications.taper_gage_id` together enforce this bijection at the relational level.

## Tolerance requirements

The table `tolerance_requirements` captures the metrological constraints that apply to each gage. Its primary key is `id`, and it stores `large_end_tolerance` and `taper_tolerance_per_inch` as decimal values, a `reference_standard` string (such as `extended-referenc-15`), and a `created_at` timestamp. The FK column `taper_gage_id` links back to `taper_gages.id`.

**Table `tolerance_requirements`**

| id | large_end_tolerance | taper_tolerance_per_inch | reference_standard | taper_gage_id | created_at |
|---|---|---|---|---|---|
| 1 | 19.70 | 4.20 | extended-referenc-15 | 1000 | 2025-01-01 00:14:00 |
| 2 | 22.40 | 7.40 | integrated-referenc-16 | 1001 | 2025-02-06 03:14:00 |
| 3 | 25.10 | 10.60 | seasonal-referenc-17 | 1002 | 2025-03-11 06:14:00 |
| 4 | 27.80 | 13.80 | regional-referenc-18 | 1003 | 2025-04-16 09:14:00 |

Tolerance record `1` applies to gage `1000`, specifying a large-end tolerance of 19.70 and a taper tolerance per inch of 4.20, governed by the reference standard `extended-referenc-15`. Record `2` covers gage `1001` with a large-end tolerance of 22.40 and a taper tolerance per inch of 7.40, under `integrated-referenc-16`. The reference standards follow a naming convention that encodes the standard family — `extended`, `integrated`, `seasonal`, `regional` — while the tolerance values increase monotonically with gage size.

As with dimensional specifications, the relationship is one-to-one: each gage has exactly one tolerance requirement, and each requirement references exactly one gage. The FK `taper_gages.tolerance_requirement_id` and `tolerance_requirements.taper_gage_id` enforce this constraint.

## Gage steps

The table `gage_steps` records inspection checkpoints along the gage. Its primary key is `id`, and each row carries a `location` (either "Large End" or "Small End"), a boolean `is_present` flag, and timestamps `created_at` and `updated_at`. The FK column `taper_gage_id` links to `taper_gages.id`.

**Table `gage_steps`**

| id | location | is_present | taper_gage_id | created_at | updated_at |
|---|---|---|---|---|---|
| 1 | Large End | false | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | Small End | true | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | Large End | false | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | Small End | true | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Gage step `1` is located at the Large End of gage `1000` and is marked as not present (`false`), created on 2025-01-01 and last updated on 2025-01-02. Gage step `2` is at the Small End of gage `1001` and is present (`true`), created on 2025-02-06. The pattern alternates: gage `1002` has a Large End step that is absent, while gage `1003` has a Small End step that is present. Unlike the one-to-one relationships with dimensional specifications and tolerance requirements, the gage steps table supports a one-to-many relationship — a single gage could have multiple steps, though in this dataset each gage has exactly one step.

## Materialised views as domain-fact reconstructions

The five views in the schema are materialised joins that reconstruct domain facts from the normalised tables. Each view answers a specific question by bringing together the central gage entity with one of its related entities.

### The dimensional specification view

The view `v_taper_gage_dimensional_specification` joins `taper_gages` to `dimensional_specifications` on `taper_gages.dimensional_specification_id = dimensional_specifications.dimensional_specification_id`. It selects the gage's identity columns (`id`, `gage_type`, `tool_number`, `mark_size`) alongside the specification's key dimensions, renaming the specification columns with a `specification_` prefix to avoid ambiguity.

**View `v_taper_gage_dimensional_specification`**

```sql
CREATE VIEW v_taper_gage_dimensional_specification AS
SELECT a.id, a.gage_type, a.tool_number, a.mark_size, b.dimensional_specification_id AS specification_dimensional_specification_id, b.large_end_diameter AS specification_large_end_diameter, b.small_end_diameter AS specification_small_end_diameter
FROM taper_gages a JOIN dimensional_specifications b ON a.dimensional_specification_id = b.dimensional_specification_id;
```

| id | gage_type | tool_number | mark_size | specification_dimensional_specification_id | specification_large_end_diameter | specification_small_end_diameter |
|---|---|---|---|---|---|---|
| 1000 | Ring | TOO-2137 | compact-mark-38 | 100 | 21.95 | 13.45 |
| 1001 | Plug | TOO-2139 | composite-mark-39 | 101 | 25.90 | 16.90 |
| 1002 | Ring | TOO-2141 | primary-mark-40 | 102 | 29.85 | 20.35 |
| 1003 | Plug | TOO-2143 | adaptive-mark-41 | 103 | 33.80 | 23.80 |

This view answers the question: "What are the dimensional specifications for each taper gage?" Row `1000` shows that gage `TOO-2137` (a Ring with mark `compact-mark-38`) has a specification with a large-end diameter of 21.95 and a small-end diameter of 13.45 — values that match the gage's own diameter columns, confirming the one-to-one alignment. Row `1003` shows gage `TOO-2143` (a Plug with mark `adaptive-mark-41`) paired with specification `103`, which records diameters of 33.80 and 23.80.

### The tolerance requirement view

The view `v_taper_gage_tolerance_requirement` joins `taper_gages` to `tolerance_requirements` on `taper_gages.tolerance_requirement_id = tolerance_requirements.id`. It selects the gage's identity columns and the tolerance's key attributes, renaming them with a `requirement_` prefix.

**View `v_taper_gage_tolerance_requirement`**

```sql
CREATE VIEW v_taper_gage_tolerance_requirement AS
SELECT a.id, a.gage_type, a.tool_number, a.mark_size, b.id AS requirement_id, b.large_end_tolerance AS requirement_large_end_tolerance, b.taper_tolerance_per_inch AS requirement_taper_tolerance_per_inch
FROM taper_gages a JOIN tolerance_requirements b ON a.tolerance_requirement_id = b.id;
```

| id | gage_type | tool_number | mark_size | requirement_id | requirement_large_end_tolerance | requirement_taper_tolerance_per_inch |
|---|---|---|---|---|---|---|
| 1000 | Ring | TOO-2137 | compact-mark-38 | 1 | 19.70 | 4.20 |
| 1001 | Plug | TOO-2139 | composite-mark-39 | 2 | 22.40 | 7.40 |
| 1002 | Ring | TOO-2141 | primary-mark-40 | 3 | 25.10 | 10.60 |
| 1003 | Plug | TOO-2143 | adaptive-mark-41 | 4 | 27.80 | 13.80 |

This view answers: "What tolerance constraints apply to each taper gage?" Row `1000` reveals that gage `TOO-2137` carries tolerance requirement `1`, with a large-end tolerance of 19.70 and a taper tolerance per inch of 4.20. Row `1002` shows gage `TOO-2141` linked to requirement `3`, which specifies a large-end tolerance of 25.10 and a taper tolerance per inch of 10.60. The view makes it straightforward to audit which gages meet which tolerance bands.

### The dimensional specification reverse view

The view `v_dimensional_specification_taper_gage` presents the same join from the opposite direction — starting from the dimensional specification and pulling in the gage's identifying attributes. This orientation is useful when a query originates from the specification side, such as "Which gage corresponds to specification `102`?"

**View `v_dimensional_specification_taper_gage`**

```sql
CREATE VIEW v_dimensional_specification_taper_gage AS
SELECT a.dimensional_specification_id, a.large_end_diameter, a.small_end_diameter, a.taper_rate_per_foot, b.id AS gage_id, b.gage_type AS gage_gage_type, b.tool_number AS gage_tool_number
FROM dimensional_specifications a JOIN taper_gages b ON a.taper_gage_id = b.id;
```

| dimensional_specification_id | large_end_diameter | small_end_diameter | taper_rate_per_foot | gage_id | gage_gage_type | gage_tool_number |
|---|---|---|---|---|---|---|
| 100 | 21.95 | 13.45 | 9.70 | 1000 | Ring | TOO-2137 |
| 101 | 25.90 | 16.90 | 11.40 | 1001 | Plug | TOO-2139 |
| 102 | 29.85 | 20.35 | 13.10 | 1002 | Ring | TOO-2141 |
| 103 | 33.80 | 23.80 | 14.80 | 1003 | Plug | TOO-2143 |

Reading row `102` in this view: specification `102` (large-end diameter 29.85, small-end diameter 20.35) is associated with gage `1002`, a Ring tool (`TOO-2141`) marked `primary-mark-40`. The view confirms that the dimensional data is consistent across both tables — the diameters in the specification match those stored directly on the gage.

### The tolerance requirement reverse view

The view `v_tolerance_requirement_taper_gage` joins from `tolerance_requirements` to `taper_gages`, presenting the tolerance side as the driving table. It answers questions like "Which gage is governed by reference standard `seasonal-referenc-17`?"

**View `v_tolerance_requirement_taper_gage`**

```sql
CREATE VIEW v_tolerance_requirement_taper_gage AS
SELECT a.id, a.large_end_tolerance, a.taper_tolerance_per_inch, a.reference_standard, b.id AS gage_id, b.gage_type AS gage_gage_type, b.tool_number AS gage_tool_number
FROM tolerance_requirements a JOIN taper_gages b ON a.taper_gage_id = b.id;
```

| id | large_end_tolerance | taper_tolerance_per_inch | reference_standard | gage_id | gage_gage_type | gage_tool_number |
|---|---|---|---|---|---|---|
| 1 | 19.70 | 4.20 | extended-referenc-15 | 1000 | Ring | TOO-2137 |
| 2 | 22.40 | 7.40 | integrated-referenc-16 | 1001 | Plug | TOO-2139 |
| 3 | 25.10 | 10.60 | seasonal-referenc-17 | 1002 | Ring | TOO-2141 |
| 4 | 27.80 | 13.80 | regional-referenc-18 | 1003 | Plug | TOO-2143 |

Row `3` in this view shows that tolerance requirement `3` (large-end tolerance 25.10, taper tolerance per inch 10.60, reference standard `seasonal-referenc-17`) applies to gage `1002` (`TOO-2141`, a Ring with mark `primary-mark-40`). The reverse view is particularly useful for compliance audits, where one starts from a standard and traces it to the gages it governs.

### The gage step view

The view `v_gage_step_taper_gage` joins `gage_steps` to `taper_gages` on `gage_steps.taper_gage_id = taper_gages.id`. It brings together the gage's identity with the step's location and presence status.

**View `v_gage_step_taper_gage`**

```sql
CREATE VIEW v_gage_step_taper_gage AS
SELECT a.id, a.location, a.is_present, a.created_at, b.id AS gage_id, b.gage_type AS gage_gage_type, b.tool_number AS gage_tool_number
FROM gage_steps a JOIN taper_gages b ON a.taper_gage_id = b.id;
```

| id | location | is_present | created_at | gage_id | gage_gage_type | gage_tool_number |
|---|---|---|---|---|---|---|
| 1 | Large End | false | 2025-01-01 00:14:00 | 1000 | Ring | TOO-2137 |
| 2 | Small End | true | 2025-02-06 03:14:00 | 1001 | Plug | TOO-2139 |
| 3 | Large End | false | 2025-03-11 06:14:00 | 1002 | Ring | TOO-2141 |
| 4 | Small End | true | 2025-04-16 09:14:00 | 1003 | Plug | TOO-2143 |

This view answers: "What inspection steps are defined for each taper gage, and are they present?" Row `1` shows that gage `1000` (`TOO-2137`, Ring, `compact-mark-38`) has a gage step at the Large End that is not present. Row `2` shows gage `1001` (`TOO-2139`, Plug, `composite-mark-39`) has a step at the Small End that is present. The view makes it easy to identify which gages have active inspection points and at which end of the tool.

## Synthesis

The taper gage domain is modelled as a central entity (`taper_gages`) with three one-to-one or one-to-many relationships to supporting entities: dimensional specifications, tolerance requirements, and gage steps. Each relationship is materialised as a foreign key in the base tables and exposed through a materialised view that joins the gage's identity columns with the related entity's attributes. The views serve as read-optimised lenses — they do not store data independently but reconstruct the domain facts on demand by joining the normalised tables. This design preserves data integrity through FK constraints while providing convenient query surfaces for the most common domain questions: which gage has which dimensions, which tolerance band applies, and which inspection steps are active.