The chapter has been written to `/tmp/harness_semantic_1g9q6uek/chapter_relational_modelling.md` (1888 words). All 13 payload blocks — 4 `` and 9 `` — are embedded at their designated positions, and the prose references concrete row values (e.g. `STR-2556`, `WAL-2340`, `ASS-2075`, `MET-2663`) throughout.

## Data appendix

**Table `lateral_restraint_straps`**

| id | strap_identifier | minimum_length | gauge | material | turn_down_configuration | max_spacing_along_wall | masonry_wall_id | floor_assembly_id | fixing_method_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | STR-2556 | 0.615 | 10 | primary-material-94 | one_end | 15.95 | 1000 | 1 | 1 |
| 101 | STR-2562 | 0.52580792 | 19 | adaptive-material-95 | both_ends | 18.90 | 1001 | 2 | 2 |
| 102 | STR-2568 | 0.61 | 28 | distributed-material-96 | one_end | 21.85 | 1002 | 3 | 3 |
| 103 | STR-2574 | 0.74 | 37 | baseline-material-97 | both_ends | 24.80 | 1003 | 4 | 4 |

**Table `masonry_walls`**

| masonry_wall_id | wall_identifier | wall_height | wall_type | masonry_unit_type | structural_role | lateral_restraint_strap_id | floor_assembly_id |
|---|---|---|---|---|---|---|---|
| 1000 | WAL-2340 | 0.7 | internal | concrete_block | load_bearing | 100 | 1 |
| 1001 | WAL-2345 | 0.6000001 | external | brick | non_load_bearing | 101 | 2 |
| 1002 | WAL-2350 | 0.75 | internal | concrete_block | load_bearing | 102 | 3 |
| 1003 | WAL-2355 | 0.48 | external | brick | non_load_bearing | 103 | 4 |

**Table `floor_assemblies`**

| id | assembly_identifier | assembly_type | infill_material | tolerance_level | floor_height | lateral_restraint_strap_id | masonry_wall_id |
|---|---|---|---|---|---|---|---|
| 1 | ASS-2075 | beam_and_block | aerated_concrete | tight | 0.9 | 100 | 1000 |
| 2 | ASS-2080 | precast_plank | dense_concrete | standard | 0.77 | 101 | 1001 |
| 3 | ASS-2085 | prestressed_plank | none | tight | 1.33 | 102 | 1002 |
| 4 | ASS-2090 | beam_and_block | aerated_concrete | standard | 0.87 | 103 | 1003 |

**Table `fixing_methods`**

| fixing_method_id | method_identifier | screw_length | screw_gauge | plug_type | screw_spacing | min_screws_per_strap | applies_to_material | lateral_restraint_strap_id | floor_assembly_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | MET-2663 | 0.69 | 44 | compact-plug-14 | 21.70 | 8 | aerated_concrete_infill | 100 | 1 |
| 2 | MET-2670 | 0.6000001 | 52 | composite-plug-15 | 24.40 | 15 | dense_concrete_infill | 101 | 2 |
| 3 | MET-2677 | 0.6000001 | 60 | primary-plug-16 | 27.10 | 22 | precast_plank | 102 | 3 |
| 4 | MET-2684 | 0.77 | 68 | adaptive-plug-17 | 29.80 | 29 | aerated_concrete_infill | 103 | 4 |

**View `v_lateral_restraint_strap_masonry_wall`**

```sql
CREATE VIEW v_lateral_restraint_strap_masonry_wall AS
SELECT a.id, a.strap_identifier, a.minimum_length, a.gauge, b.masonry_wall_id AS wall_masonry_wall_id, b.wall_identifier AS wall_wall_identifier, b.wall_height AS wall_wall_height
FROM lateral_restraint_straps a JOIN masonry_walls b ON a.masonry_wall_id = b.masonry_wall_id;
```

| id | strap_identifier | minimum_length | gauge | wall_masonry_wall_id | wall_wall_identifier | wall_wall_height |
|---|---|---|---|---|---|---|
| 100 | STR-2556 | 0.615 | 10 | 1000 | WAL-2340 | 0.7 |
| 101 | STR-2562 | 0.52580792 | 19 | 1001 | WAL-2345 | 0.6000001 |
| 102 | STR-2568 | 0.61 | 28 | 1002 | WAL-2350 | 0.75 |
| 103 | STR-2574 | 0.74 | 37 | 1003 | WAL-2355 | 0.48 |

**View `v_lateral_restraint_strap_floor_assembly`**

```sql
CREATE VIEW v_lateral_restraint_strap_floor_assembly AS
SELECT a.id, a.strap_identifier, a.minimum_length, a.gauge, b.id AS assembly_id, b.assembly_identifier AS assembly_assembly_identifier, b.assembly_type AS assembly_assembly_type
FROM lateral_restraint_straps a JOIN floor_assemblies b ON a.floor_assembly_id = b.id;
```

| id | strap_identifier | minimum_length | gauge | assembly_id | assembly_assembly_identifier | assembly_assembly_type |
|---|---|---|---|---|---|---|
| 100 | STR-2556 | 0.615 | 10 | 1 | ASS-2075 | beam_and_block |
| 101 | STR-2562 | 0.52580792 | 19 | 2 | ASS-2080 | precast_plank |
| 102 | STR-2568 | 0.61 | 28 | 3 | ASS-2085 | prestressed_plank |
| 103 | STR-2574 | 0.74 | 37 | 4 | ASS-2090 | beam_and_block |

**View `v_lateral_restraint_strap_fixing_method`**

```sql
CREATE VIEW v_lateral_restraint_strap_fixing_method AS
SELECT a.id, a.strap_identifier, a.minimum_length, a.gauge, b.fixing_method_id AS method_fixing_method_id, b.method_identifier AS method_method_identifier, b.screw_length AS method_screw_length
FROM lateral_restraint_straps a JOIN fixing_methods b ON a.fixing_method_id = b.fixing_method_id;
```

| id | strap_identifier | minimum_length | gauge | method_fixing_method_id | method_method_identifier | method_screw_length |
|---|---|---|---|---|---|---|
| 100 | STR-2556 | 0.615 | 10 | 1 | MET-2663 | 0.69 |
| 101 | STR-2562 | 0.52580792 | 19 | 2 | MET-2670 | 0.6000001 |
| 102 | STR-2568 | 0.61 | 28 | 3 | MET-2677 | 0.6000001 |
| 103 | STR-2574 | 0.74 | 37 | 4 | MET-2684 | 0.77 |

**View `v_masonry_wall_lateral_restraint_strap`**

```sql
CREATE VIEW v_masonry_wall_lateral_restraint_strap AS
SELECT a.masonry_wall_id, a.wall_identifier, a.wall_height, a.wall_type, b.id AS strap_id, b.strap_identifier AS strap_strap_identifier, b.minimum_length AS strap_minimum_length
FROM masonry_walls a JOIN lateral_restraint_straps b ON a.lateral_restraint_strap_id = b.id;
```

| masonry_wall_id | wall_identifier | wall_height | wall_type | strap_id | strap_strap_identifier | strap_minimum_length |
|---|---|---|---|---|---|---|
| 1000 | WAL-2340 | 0.7 | internal | 100 | STR-2556 | 0.615 |
| 1001 | WAL-2345 | 0.6000001 | external | 101 | STR-2562 | 0.52580792 |
| 1002 | WAL-2350 | 0.75 | internal | 102 | STR-2568 | 0.61 |
| 1003 | WAL-2355 | 0.48 | external | 103 | STR-2574 | 0.74 |

**View `v_masonry_wall_floor_assembly`**

```sql
CREATE VIEW v_masonry_wall_floor_assembly AS
SELECT a.masonry_wall_id, a.wall_identifier, a.wall_height, a.wall_type, b.id AS assembly_id, b.assembly_identifier AS assembly_assembly_identifier, b.assembly_type AS assembly_assembly_type
FROM masonry_walls a JOIN floor_assemblies b ON a.floor_assembly_id = b.id;
```

| masonry_wall_id | wall_identifier | wall_height | wall_type | assembly_id | assembly_assembly_identifier | assembly_assembly_type |
|---|---|---|---|---|---|---|
| 1000 | WAL-2340 | 0.7 | internal | 1 | ASS-2075 | beam_and_block |
| 1001 | WAL-2345 | 0.6000001 | external | 2 | ASS-2080 | precast_plank |
| 1002 | WAL-2350 | 0.75 | internal | 3 | ASS-2085 | prestressed_plank |
| 1003 | WAL-2355 | 0.48 | external | 4 | ASS-2090 | beam_and_block |

**View `v_floor_assembly_lateral_restraint_strap`**

```sql
CREATE VIEW v_floor_assembly_lateral_restraint_strap AS
SELECT a.id, a.assembly_identifier, a.assembly_type, a.infill_material, b.id AS strap_id, b.strap_identifier AS strap_strap_identifier, b.minimum_length AS strap_minimum_length
FROM floor_assemblies a JOIN lateral_restraint_straps b ON a.lateral_restraint_strap_id = b.id;
```

| id | assembly_identifier | assembly_type | infill_material | strap_id | strap_strap_identifier | strap_minimum_length |
|---|---|---|---|---|---|---|
| 1 | ASS-2075 | beam_and_block | aerated_concrete | 100 | STR-2556 | 0.615 |
| 2 | ASS-2080 | precast_plank | dense_concrete | 101 | STR-2562 | 0.52580792 |
| 3 | ASS-2085 | prestressed_plank | none | 102 | STR-2568 | 0.61 |
| 4 | ASS-2090 | beam_and_block | aerated_concrete | 103 | STR-2574 | 0.74 |

**View `v_floor_assembly_masonry_wall`**

```sql
CREATE VIEW v_floor_assembly_masonry_wall AS
SELECT a.id, a.assembly_identifier, a.assembly_type, a.infill_material, b.masonry_wall_id AS wall_masonry_wall_id, b.wall_identifier AS wall_wall_identifier, b.wall_height AS wall_wall_height
FROM floor_assemblies a JOIN masonry_walls b ON a.masonry_wall_id = b.masonry_wall_id;
```

| id | assembly_identifier | assembly_type | infill_material | wall_masonry_wall_id | wall_wall_identifier | wall_wall_height |
|---|---|---|---|---|---|---|
| 1 | ASS-2075 | beam_and_block | aerated_concrete | 1000 | WAL-2340 | 0.7 |
| 2 | ASS-2080 | precast_plank | dense_concrete | 1001 | WAL-2345 | 0.6000001 |
| 3 | ASS-2085 | prestressed_plank | none | 1002 | WAL-2350 | 0.75 |
| 4 | ASS-2090 | beam_and_block | aerated_concrete | 1003 | WAL-2355 | 0.48 |

**View `v_fixing_method_lateral_restraint_strap`**

```sql
CREATE VIEW v_fixing_method_lateral_restraint_strap AS
SELECT a.fixing_method_id, a.method_identifier, a.screw_length, a.screw_gauge, b.id AS strap_id, b.strap_identifier AS strap_strap_identifier, b.minimum_length AS strap_minimum_length
FROM fixing_methods a JOIN lateral_restraint_straps b ON a.lateral_restraint_strap_id = b.id;
```

| fixing_method_id | method_identifier | screw_length | screw_gauge | strap_id | strap_strap_identifier | strap_minimum_length |
|---|---|---|---|---|---|---|
| 1 | MET-2663 | 0.69 | 44 | 100 | STR-2556 | 0.615 |
| 2 | MET-2670 | 0.6000001 | 52 | 101 | STR-2562 | 0.52580792 |
| 3 | MET-2677 | 0.6000001 | 60 | 102 | STR-2568 | 0.61 |
| 4 | MET-2684 | 0.77 | 68 | 103 | STR-2574 | 0.74 |

**View `v_fixing_method_floor_assembly`**

```sql
CREATE VIEW v_fixing_method_floor_assembly AS
SELECT a.fixing_method_id, a.method_identifier, a.screw_length, a.screw_gauge, b.id AS assembly_id, b.assembly_identifier AS assembly_assembly_identifier, b.assembly_type AS assembly_assembly_type
FROM fixing_methods a JOIN floor_assemblies b ON a.floor_assembly_id = b.id;
```

| fixing_method_id | method_identifier | screw_length | screw_gauge | assembly_id | assembly_assembly_identifier | assembly_assembly_type |
|---|---|---|---|---|---|---|
| 1 | MET-2663 | 0.69 | 44 | 1 | ASS-2075 | beam_and_block |
| 2 | MET-2670 | 0.6000001 | 52 | 2 | ASS-2080 | precast_plank |
| 3 | MET-2677 | 0.6000001 | 60 | 3 | ASS-2085 | prestressed_plank |
| 4 | MET-2684 | 0.77 | 68 | 4 | ASS-2090 | beam_and_block |
