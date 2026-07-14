The biological-neurological domain under examination models the lifecycle of cellular protoplasm as it gives rise to cells, which in turn house nuclei, while engrams encode stimulus-driven memory traces that intersect with mental disorder phenotypes and human subjects. The schema normalizes these concepts into ten base tables and seventeen derived views, each view materializing a specific domain fact by joining the appropriate normalized tables. The design follows a star-and-spoke pattern: `protoplasms` sits at the centre as the generative substrate, with `cells` and `engrams` radiating outward as direct children, while `nucleuses`, `stimuluses`, `mental_disorders`, and `humans` attach through foreign keys that enforce referential integrity. Self-referencing junction tables (`cells_cells`, `nucleuses_nucleuses`, `disorders_engrams`) capture many-to-many relationships that cannot be expressed through simple column-level foreign keys.

## The Protoplasm Substrate

**Table `protoplasms`**

| protoplasm_id | origin_date | irritability_level | engram_count | nuclear_intelligence | protoplasm_type | cell_id | engram_id |
|---|---|---|---|---|---|---|---|
| 100 | 2023-10-13T21:39:00 | 21.95 | 2 | true | somatic | 557 | 100 |
| 101 | 2024-03-24T04:56:00 | 25.90 | 4 | false | germ | 790489 | 101 |
| 102 | 2025-08-08T11:13:00 | 29.85 | 2 | true | somatic | 10445644 | 102 |
| 103 | 2022-01-19T18:30:00 | 33.80 | 0 | false | germ | 1186089 | 103 |

The `protoplasms` table is the root entity. Each row represents a distinct protoplasmic entity identified by `protoplasm_id` (a small integer such as `100` or `103`). The column `origin_date` records when the protoplasm came into existence — for example, `2023-10-13T21:39:00` for protoplasm `100`. The numeric attribute `irritability_level` quantifies responsiveness (values range from `21.95` to `33.80` across the sample), while `engram_count` stores an integer tally of associated engrams (`0` through `4`). The boolean column `nuclear_intelligence` indicates whether the protoplasm is expected to host an intelligent nucleus. The categorical column `protoplasm_type` distinguishes `somatic` from `germ` lineages. Two foreign keys anchor the protoplasm to its downstream entities: `cell_id` references `cells.cell_id` (e.g. `557` for protoplasm `100`), and `engram_id` references `engrams.id` (e.g. `100` for protoplasm `100`). This dual FK design means every protoplasm row simultaneously points to one cell and one engram, establishing a one-to-one bridge between the substrate and its two primary derivatives.

## Cells and Nuclei

**Table `cells`**

| cell_id | division_stage | nucleus_present | cell_type | creation_date | protoplasm_id | nucleus_id |
|---|---|---|---|---|---|---|
| 557 | pre-division | false | monocell | 2022-01-13T12:24:00 | 100 | 1000 |
| 790489 | dividing | true | somatic | 2023-06-24T19:41:00 | 101 | 1001 |
| 10445644 | post-division | false | germ | 2024-11-08T02:58:00 | 102 | 1002 |
| 1186089 | pre-division | true | monocell | 2025-04-19T09:15:00 | 103 | 1003 |

The `cells` table captures cellular entities. Its primary key `cell_id` is a large integer — `557`, `790489`, `10445644`, `1186089` — each referencing a specific cell. The column `division_stage` is an enumerated attribute with values such as `pre-division`, `dividing`, and `post-division`. The boolean `nucleus_present` signals whether the cell contains a nucleus (e.g. `false` for cell `557`, `true` for cell `790489`). The categorical `cell_type` distinguishes `monocell`, `somatic`, and `germ` classifications. The `creation_date` column (e.g. `2022-01-13T12:24:00`) records the cell's birth. Two foreign keys complete the cell record: `protoplasm_id` points back to `protoplasms.protoplasm_id` (cell `557` belongs to protoplasm `100`), and `nucleus_id` points to `nucleuses.id` (cell `557` hosts nucleus `1000`).

**Table `nucleuses`**

| id | nucleus_id | intelligence_level | chromosome_count | division_state | cell_id |
|---|---|---|---|---|---|
| 1000 | 7fb9304c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.70 | 55 | intact | 557 |
| 1001 | 89820 | 14.40 | 7 | dividing | 790489 |
| 1002 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | 17.10 | 34 | divided | 10445644 |
| 1003 | 10782181 | 19.80 | 6 | intact | 1186089 |

The `nucleuses` table stores nuclear entities. Its primary key `id` is an integer (`1000` through `1003`), while the column `nucleus_id` carries a secondary identifier that can be a UUID (`7fb9304c-9bad-11eb-a8a2-19ed5c03f8d3`) or a numeric string (`89820`). The numeric attribute `intelligence_level` ranges from `11.70` to `19.80`. The integer `chromosome_count` records the number of chromosomes (values `7`, `34`, `55`, `6`). The categorical `division_state` takes values `intact`, `dividing`, or `divided`. The foreign key `cell_id` references `cells.cell_id`, creating a one-to-one link from nucleus to its parent cell — nucleus `1000` belongs to cell `557`.

## Engrams, Stimuli, and Disorders

**Table `engrams`**

| id | engram_id | stimulus_energy | reaction_pattern | retention_date | disorder_association | protoplasm_id | stimulus_id | mental_disorder_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 1186100 | 20.45 | composite-reaction-75 | 2024-07-22T18:54:00 | true | 100 | 100 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 8843757 | 24.90 | primary-reaction-76 | 2025-12-06T01:11:00 | false | 101 | 101 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | f2094b32-8fcd-11eb-924d-9cd76263cbd0 | 29.35 | adaptive-reaction-77 | 2022-05-17T08:28:00 | true | 102 | 102 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 5844256 | 33.80 | distributed-reaction-78 | 2023-10-01T15:45:00 | false | 103 | 103 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `engrams` table encodes memory traces. Its primary key `id` is an integer (`100`–`103`), while `engram_id` provides a secondary identifier (UUIDs like `f2094b32-8fcd-11eb-924d-9cd76263cbd0` or integers like `1186100`). The numeric `stimulus_energy` column (values `20.45` to `33.80`) quantifies the energy of the originating stimulus. The categorical `reaction_pattern` describes the response type — `composite-reaction-75`, `primary-reaction-76`, `adaptive-reaction-77`, `distributed-reaction-78`. The `retention_date` records when the engram was retained (e.g. `2024-07-22T18:54:00`). The boolean `disorder_association` indicates whether the engram is linked to a mental disorder (`true` for engram `100`, `false` for engram `101`). Timestamps `created_at` and `updated_at` track the engram's lifecycle. Three foreign keys anchor the engram: `protoplasm_id` references `protoplasms.protoplasm_id`, `stimulus_id` references `stimuluses.stimulus_id`, and `mental_disorder_id` references `mental_disorders.id`.

**Table `stimuluses`**

| stimulus_id | energy_level | stimulus_type | timestamp | source | protoplasm_id | engram_id |
|---|---|---|---|---|---|---|
| 100 | 18.20 | physical | 2024-07-08T18:18:00 | seasonal-source-65 | 100 | 100 |
| 101 | 22.40 | chemical | 2025-12-19T01:35:00 | regional-source-66 | 101 | 101 |
| 102 | 26.60 | psychological | 2022-05-03T08:52:00 | legacy-source-67 | 102 | 102 |
| 103 | 30.80 | physical | 2023-10-14T15:09:00 | compact-source-68 | 103 | 103 |

The `stimuluses` table captures external stimuli. Its primary key `stimulus_id` is an integer (`100`–`103`). The numeric `energy_level` ranges from `18.20` to `30.80`. The categorical `stimulus_type` distinguishes `physical`, `chemical`, and `psychological` stimuli. The `timestamp` column records when the stimulus occurred (e.g. `2024-07-08T18:18:00`). The `source` column identifies the origin — `seasonal-source-65`, `regional-source-66`, `legacy-source-67`, `compact-source-68`. Two foreign keys link the stimulus: `protoplasm_id` references `protoplasms.protoplasm_id`, and `engram_id` references `engrams.id`.

**Table `mental_disorders`**

| id | disorder_id | disorder_name | severity | onset_date | treatment_status | human_id |
|---|---|---|---|---|---|---|
| 1000 | c746ead6-8fcc-11eb-924d-9cd76263cbd0 | Primary Framework A | 9.45 | 2023-10-07T21:03:00 | untreated | 1 |
| 1001 | 3001009030200 | Composite Protocol | 13.90 | 2024-03-18T04:20:00 | in-progress | 2 |
| 1002 | lu_tax_code_template_b_VB-TR-6 | Compact Programme | 18.35 | 2025-08-02T11:37:00 | resolved | 3 |
| 1003 | 727055 | Legacy Standard D | 22.80 | 2022-01-13T18:54:00 | untreated | 4 |

The `mental_disorders` table stores disorder phenotypes. Its primary key `id` is an integer (`1000`–`1003`). The column `disorder_id` carries a secondary identifier (UUIDs like `c746ead6-8fcc-11eb-924d-9cd76263cbd0` or numeric strings like `3001009030200`). The categorical `disorder_name` provides a human-readable label — `Primary Framework A`, `Composite Protocol`, `Compact Programme`, `Legacy Standard D`. The numeric `severity` ranges from `9.45` to `22.80`. The `onset_date` records when the disorder manifested (e.g. `2023-10-07T21:03:00`). The categorical `treatment_status` takes values `untreated`, `in-progress`, or `resolved`. The foreign key `human_id` references `humans` (not shown in the sample data but present in the schema).

**Table `humans`**

| id | human_id | birth_date | genetic_lineage | early_stimulus_exposure | collective_unconscious_access | protoplasm_id | stimulus_id | engram_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 8189488 | 2023-10-18T21:39:00 | distributed-genetic-48 | 17.20 | false | 100 | 100 | 100 |
| 2 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:56:00 | baseline-genetic-49 | 20.40 | true | 101 | 101 | 101 |
| 3 | 8350025 | 2025-08-13T11:13:00 | pilot-genetic-50 | 23.60 | false | 102 | 102 | 102 |
| 4 | 727070 | 2022-01-24T18:30:00 | extended-genetic-51 | 26.80 | true | 103 | 103 | 103 |

The `humans` table represents human subjects. Although the sample data does not display its columns explicitly, the foreign key `human_id` in `mental_disorders` (values `1` through `4`) indicates that each disorder is associated with a human subject. The table provides the human-level context for the disorder-engram-protoplasm chain.

## Self-Referencing Junction Tables

**Table `cells_cells`**

| cell_id | divides_into_cell_id |
|---|---|
| 557 | 557 |
| 557 | 790489 |
| 790489 | 790489 |
| 790489 | 10445644 |
| 10445644 | 10445644 |
| 10445644 | 1186089 |
| 1186089 | 1186089 |
| 1186089 | 557 |

The `cells_cells` junction table captures many-to-many relationships between cells. It contains foreign keys referencing `cells.cell_id` on both sides, enabling a cell to relate to multiple other cells (e.g. a parent cell dividing into daughter cells, or cells forming tissue structures). The table's structure allows bidirectional traversal: from cell `557` to its related cells and vice versa.

**Table `nucleuses_nucleuses`**

| nucleus_id | divides_into_nucleus_id |
|---|---|
| 1000 | 1000 |
| 1000 | 1001 |
| 1001 | 1001 |
| 1001 | 1002 |
| 1002 | 1002 |
| 1002 | 1003 |
| 1003 | 1003 |
| 1003 | 1000 |

The `nucleuses_nucleuses` junction table captures many-to-many relationships between nuclei. It contains foreign keys referencing `nucleuses.id` on both sides, enabling nuclei to relate to one another (e.g. during nuclear fusion or division events). The table supports bidirectional traversal between nucleus `1000` and its related nuclei.

**Table `disorders_engrams`**

| mental_disorder_id | engram_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

The `disorders_engrams` junction table captures many-to-many relationships between mental disorders and engrams. It contains foreign keys referencing `mental_disorders.id` and `engrams.id`, enabling a disorder to be associated with multiple engrams and an engram to be linked to multiple disorders. This junction table complements the direct `disorder_association` boolean and `mental_disorder_id` foreign key in the `engrams` table, providing a richer relational model for complex disorder-engram mappings.

## View-Based Reconstructive Joins

Each view materializes a specific domain fact by joining the appropriate normalized tables. The following sections interpret what question each join answers and read concrete rows as evidence.

**View `vw_protoplasm_cell`**

```sql
CREATE VIEW vw_protoplasm_cell AS
SELECT a.protoplasm_id, a.origin_date, a.irritability_level, a.engram_count, b.cell_id AS cell_cell_id, b.division_stage AS cell_division_stage, b.nucleus_present AS cell_nucleus_present
FROM protoplasms a JOIN cells b ON a.cell_id = b.cell_id;
```

| protoplasm_id | origin_date | irritability_level | engram_count | cell_cell_id | cell_division_stage | cell_nucleus_present |
|---|---|---|---|---|---|---|
| 100 | 2023-10-13T21:39:00 | 21.95 | 2 | 557 | pre-division | false |
| 101 | 2024-03-24T04:56:00 | 25.90 | 4 | 790489 | dividing | true |
| 102 | 2025-08-08T11:13:00 | 29.85 | 2 | 10445644 | post-division | false |
| 103 | 2022-01-19T18:30:00 | 33.80 | 0 | 1186089 | pre-division | true |

The view `vw_protoplasm_cell` joins `protoplasms` to `cells` via `protoplasms.cell_id = cells.cell_id`. It answers the question: "Which cell does each protoplasm give rise to?" For protoplasm `100` (a `somatic` protoplasm with `irritability_level` `21.95`), the view reveals cell `557` (a `monocell` in `pre-division` stage, created on `2022-01-13T12:24:00`). For protoplasm `101` (a `germ` protoplasm with `irritability_level` `25.90`), the view reveals cell `790489` (a `somatic` cell in `dividing` stage).

**View `vw_protoplasm_engram`**

```sql
CREATE VIEW vw_protoplasm_engram AS
SELECT a.protoplasm_id, a.origin_date, a.irritability_level, a.engram_count, b.id AS engram_id, b.engram_id AS engram_engram_id, b.stimulus_energy AS engram_stimulus_energy
FROM protoplasms a JOIN engrams b ON a.engram_id = b.id;
```

| protoplasm_id | origin_date | irritability_level | engram_count | engram_id | engram_engram_id | engram_stimulus_energy |
|---|---|---|---|---|---|---|
| 100 | 2023-10-13T21:39:00 | 21.95 | 2 | 100 | 1186100 | 20.45 |
| 101 | 2024-03-24T04:56:00 | 25.90 | 4 | 101 | 8843757 | 24.90 |
| 102 | 2025-08-08T11:13:00 | 29.85 | 2 | 102 | f2094b32-8fcd-11eb-924d-9cd76263cbd0 | 29.35 |
| 103 | 2022-01-19T18:30:00 | 33.80 | 0 | 103 | 5844256 | 33.80 |

The view `vw_protoplasm_engram` joins `protoplasms` to `engrams` via `protoplasms.engram_id = engrams.id`. It answers: "Which engram is associated with each protoplasm?" Protoplasm `100` maps to engram `100` (with `stimulus_energy` `20.45` and `reaction_pattern` `composite-reaction-75`), while protoplasm `103` maps to engram `103` (with `stimulus_energy` `33.80` and `reaction_pattern` `distributed-reaction-78`).

**View `vw_cell_protoplasm`**

```sql
CREATE VIEW vw_cell_protoplasm AS
SELECT a.cell_id, a.division_stage, a.nucleus_present, a.cell_type, b.protoplasm_id AS protoplasm_protoplasm_id, b.origin_date AS protoplasm_origin_date, b.irritability_level AS protoplasm_irritability_level
FROM cells a JOIN protoplasms b ON a.protoplasm_id = b.protoplasm_id;
```

| cell_id | division_stage | nucleus_present | cell_type | protoplasm_protoplasm_id | protoplasm_origin_date | protoplasm_irritability_level |
|---|---|---|---|---|---|---|
| 557 | pre-division | false | monocell | 100 | 2023-10-13T21:39:00 | 21.95 |
| 790489 | dividing | true | somatic | 101 | 2024-03-24T04:56:00 | 25.90 |
| 10445644 | post-division | false | germ | 102 | 2025-08-08T11:13:00 | 29.85 |
| 1186089 | pre-division | true | monocell | 103 | 2022-01-19T18:30:00 | 33.80 |

The view `vw_cell_protoplasm` joins `cells` to `protoplasms` via `cells.protoplasm_id = protoplasms.protoplasm_id`. It answers the inverse question: "Which protoplasm is the parent of each cell?" Cell `557` traces back to protoplasm `100` (a `somatic` protoplasm), and cell `10445644` traces back to protoplasm `102` (a `somatic` protoplasm with `irritability_level` `29.85`).

**View `vw_cell_cell_detail`**

```sql
CREATE VIEW vw_cell_cell_detail AS
SELECT a.cell_id, a.division_stage, a.nucleus_present, b.cell_id AS cell_cell_id, b.division_stage AS cell_division_stage, b.nucleus_present AS cell_nucleus_present
FROM cells a
  JOIN cells_cells j ON j.cell_id = a.cell_id
  JOIN cells b ON b.cell_id = j.divides_into_cell_id;
```

| cell_id | division_stage | nucleus_present | cell_cell_id | cell_division_stage | cell_nucleus_present |
|---|---|---|---|---|---|
| 557 | pre-division | false | 557 | pre-division | false |
| 557 | pre-division | false | 790489 | dividing | true |
| 790489 | dividing | true | 790489 | dividing | true |
| 790489 | dividing | true | 10445644 | post-division | false |
| 10445644 | post-division | false | 10445644 | post-division | false |
| 10445644 | post-division | false | 1186089 | pre-division | true |
| 1186089 | pre-division | true | 1186089 | pre-division | true |
| 1186089 | pre-division | true | 557 | pre-division | false |

The view `vw_cell_cell_detail` joins `cells` to `cells_cells` and back to `cells`, answering: "Which cells are related to each other?" This view reconstructs the cell-to-cell relationship graph, allowing traversal from a cell through its junction table entries to its related cells.

**View `vw_cell_nucleus`**

```sql
CREATE VIEW vw_cell_nucleus AS
SELECT a.cell_id, a.division_stage, a.nucleus_present, a.cell_type, b.id AS nucleus_id, b.nucleus_id AS nucleus_nucleus_id, b.intelligence_level AS nucleus_intelligence_level
FROM cells a JOIN nucleuses b ON a.nucleus_id = b.id;
```

| cell_id | division_stage | nucleus_present | cell_type | nucleus_id | nucleus_nucleus_id | nucleus_intelligence_level |
|---|---|---|---|---|---|---|
| 557 | pre-division | false | monocell | 1000 | 7fb9304c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.70 |
| 790489 | dividing | true | somatic | 1001 | 89820 | 14.40 |
| 10445644 | post-division | false | germ | 1002 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | 17.10 |
| 1186089 | pre-division | true | monocell | 1003 | 10782181 | 19.80 |

The view `vw_cell_nucleus` joins `cells` to `nucleuses` via `cells.nucleus_id = nucleuses.id`. It answers: "Which nucleus does each cell host?" Cell `557` hosts nucleus `1000` (with `intelligence_level` `11.70` and `chromosome_count` `55`), while cell `790489` hosts nucleus `1001` (with `intelligence_level` `14.40` and `chromosome_count` `7`).

**View `vw_nucleus_cell`**

```sql
CREATE VIEW vw_nucleus_cell AS
SELECT a.id, a.nucleus_id, a.intelligence_level, a.chromosome_count, b.cell_id AS cell_cell_id, b.division_stage AS cell_division_stage, b.nucleus_present AS cell_nucleus_present
FROM nucleuses a JOIN cells b ON a.cell_id = b.cell_id;
```

| id | nucleus_id | intelligence_level | chromosome_count | cell_cell_id | cell_division_stage | cell_nucleus_present |
|---|---|---|---|---|---|---|
| 1000 | 7fb9304c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.70 | 55 | 557 | pre-division | false |
| 1001 | 89820 | 14.40 | 7 | 790489 | dividing | true |
| 1002 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | 17.10 | 34 | 10445644 | post-division | false |
| 1003 | 10782181 | 19.80 | 6 | 1186089 | pre-division | true |

The view `vw_nucleus_cell` joins `nucleuses` to `cells` via `nucleuses.cell_id = cells.cell_id`. It answers the inverse: "Which cell contains each nucleus?" Nucleus `1000` (with `nucleus_id` `7fb9304c-9bad-11eb-a8a2-19ed5c03f8d3`) is contained in cell `557`, and nucleus `1002` (with `nucleus_id` `dbea2f30-8fcb-11eb-924d-9cd76263cbd0`) is contained in cell `10445644`.

**View `vw_nucleus_nucleus_detail`**

```sql
CREATE VIEW vw_nucleus_nucleus_detail AS
SELECT a.id, a.nucleus_id, a.intelligence_level, b.id AS nucleus_id, b.nucleus_id AS nucleus_nucleus_id, b.intelligence_level AS nucleus_intelligence_level
FROM nucleuses a
  JOIN nucleuses_nucleuses j ON j.nucleus_id = a.id
  JOIN nucleuses b ON b.id = j.divides_into_nucleus_id;
```

| id | nucleus_id | intelligence_level | nucleus_id | nucleus_nucleus_id | nucleus_intelligence_level |
|---|---|---|---|---|---|
| 1000 | 7fb9304c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.70 | 1000 | 7fb9304c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.70 |
| 1000 | 7fb9304c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.70 | 1001 | 89820 | 14.40 |
| 1001 | 89820 | 14.40 | 1001 | 89820 | 14.40 |
| 1001 | 89820 | 14.40 | 1002 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | 17.10 |
| 1002 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | 17.10 | 1002 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | 17.10 |
| 1002 | dbea2f30-8fcb-11eb-924d-9cd76263cbd0 | 17.10 | 1003 | 10782181 | 19.80 |
| 1003 | 10782181 | 19.80 | 1003 | 10782181 | 19.80 |
| 1003 | 10782181 | 19.80 | 1000 | 7fb9304c-9bad-11eb-a8a2-19ed5c03f8d3 | 11.70 |

The view `vw_nucleus_nucleus_detail` joins `nucleuses` to `nucleuses_nucleuses` and back to `nucleuses`, answering: "Which nuclei are related to each other?" This view reconstructs the nucleus-to-nucleus relationship graph, enabling traversal from nucleus `1000` through its junction entries to related nuclei.

**View `vw_engram_protoplasm`**

```sql
CREATE VIEW vw_engram_protoplasm AS
SELECT a.id, a.engram_id, a.stimulus_energy, a.reaction_pattern, b.protoplasm_id AS protoplasm_protoplasm_id, b.origin_date AS protoplasm_origin_date, b.irritability_level AS protoplasm_irritability_level
FROM engrams a JOIN protoplasms b ON a.protoplasm_id = b.protoplasm_id;
```

| id | engram_id | stimulus_energy | reaction_pattern | protoplasm_protoplasm_id | protoplasm_origin_date | protoplasm_irritability_level |
|---|---|---|---|---|---|---|
| 100 | 1186100 | 20.45 | composite-reaction-75 | 100 | 2023-10-13T21:39:00 | 21.95 |
| 101 | 8843757 | 24.90 | primary-reaction-76 | 101 | 2024-03-24T04:56:00 | 25.90 |
| 102 | f2094b32-8fcd-11eb-924d-9cd76263cbd0 | 29.35 | adaptive-reaction-77 | 102 | 2025-08-08T11:13:00 | 29.85 |
| 103 | 5844256 | 33.80 | distributed-reaction-78 | 103 | 2022-01-19T18:30:00 | 33.80 |

The view `vw_engram_protoplasm` joins `engrams` to `protoplasms` via `engrams.protoplasm_id = protoplasms.protoplasm_id`. It answers: "Which protoplasm generated each engram?" Engram `100` (with `retention_date` `2024-07-22T18:54:00`) was generated by protoplasm `100` (a `somatic` protoplasm), and engram `102` (with `retention_date` `2022-05-17T08:28:00`) was generated by protoplasm `102` (a `somatic` protoplasm with `nuclear_intelligence` `true`).

**View `vw_engram_stimulus`**

```sql
CREATE VIEW vw_engram_stimulus AS
SELECT a.id, a.engram_id, a.stimulus_energy, a.reaction_pattern, b.stimulus_id AS stimulus_stimulus_id, b.energy_level AS stimulus_energy_level, b.stimulus_type AS stimulus_stimulus_type
FROM engrams a JOIN stimuluses b ON a.stimulus_id = b.stimulus_id;
```

| id | engram_id | stimulus_energy | reaction_pattern | stimulus_stimulus_id | stimulus_energy_level | stimulus_stimulus_type |
|---|---|---|---|---|---|---|
| 100 | 1186100 | 20.45 | composite-reaction-75 | 100 | 18.20 | physical |
| 101 | 8843757 | 24.90 | primary-reaction-76 | 101 | 22.40 | chemical |
| 102 | f2094b32-8fcd-11eb-924d-9cd76263cbd0 | 29.35 | adaptive-reaction-77 | 102 | 26.60 | psychological |
| 103 | 5844256 | 33.80 | distributed-reaction-78 | 103 | 30.80 | physical |

The view `vw_engram_stimulus` joins `engrams` to `stimuluses` via `engrams.stimulus_id = stimuluses.stimulus_id`. It answers: "Which stimulus triggered each engram?" Engram `100` was triggered by stimulus `100` (a `physical` stimulus with `energy_level` `18.20` from `seasonal-source-65`), while engram `102` was triggered by stimulus `102` (a `psychological` stimulus with `energy_level` `26.60` from `legacy-source-67`).

**View `vw_engram_mental_disorder`**

```sql
CREATE VIEW vw_engram_mental_disorder AS
SELECT a.id, a.engram_id, a.stimulus_energy, a.reaction_pattern, b.id AS disorder_id, b.disorder_id AS disorder_disorder_id, b.disorder_name AS disorder_disorder_name
FROM engrams a JOIN mental_disorders b ON a.mental_disorder_id = b.id;
```

| id | engram_id | stimulus_energy | reaction_pattern | disorder_id | disorder_disorder_id | disorder_disorder_name |
|---|---|---|---|---|---|---|
| 100 | 1186100 | 20.45 | composite-reaction-75 | 1000 | c746ead6-8fcc-11eb-924d-9cd76263cbd0 | Primary Framework A |
| 101 | 8843757 | 24.90 | primary-reaction-76 | 1001 | 3001009030200 | Composite Protocol |
| 102 | f2094b32-8fcd-11eb-924d-9cd76263cbd0 | 29.35 | adaptive-reaction-77 | 1002 | lu_tax_code_template_b_VB-TR-6 | Compact Programme |
| 103 | 5844256 | 33.80 | distributed-reaction-78 | 1003 | 727055 | Legacy Standard D |

The view `vw_engram_mental_disorder` joins `engrams` to `mental_disorders` via `engrams.mental_disorder_id = mental_disorders.id`. It answers: "Which mental disorder is associated with each engram?" Engram `100` (with `disorder_association` `true`) is associated with disorder `1000` (`Primary Framework A`, severity `9.45`, `untreated`), while engram `101` (with `disorder_association` `false`) is associated with disorder `1001` (`Composite Protocol`, severity `13.90`, `in-progress`).

**View `vw_stimulus_protoplasm`**

```sql
CREATE VIEW vw_stimulus_protoplasm AS
SELECT a.stimulus_id, a.energy_level, a.stimulus_type, a.timestamp, b.protoplasm_id AS protoplasm_protoplasm_id, b.origin_date AS protoplasm_origin_date, b.irritability_level AS protoplasm_irritability_level
FROM stimuluses a JOIN protoplasms b ON a.protoplasm_id = b.protoplasm_id;
```

| stimulus_id | energy_level | stimulus_type | timestamp | protoplasm_protoplasm_id | protoplasm_origin_date | protoplasm_irritability_level |
|---|---|---|---|---|---|---|
| 100 | 18.20 | physical | 2024-07-08T18:18:00 | 100 | 2023-10-13T21:39:00 | 21.95 |
| 101 | 22.40 | chemical | 2025-12-19T01:35:00 | 101 | 2024-03-24T04:56:00 | 25.90 |
| 102 | 26.60 | psychological | 2022-05-03T08:52:00 | 102 | 2025-08-08T11:13:00 | 29.85 |
| 103 | 30.80 | physical | 2023-10-14T15:09:00 | 103 | 2022-01-19T18:30:00 | 33.80 |

The view `vw_stimulus_protoplasm` joins `stimuluses` to `protoplasms` via `stimuluses.protoplasm_id = protoplasms.protoplasm_id`. It answers: "Which protoplasm was exposed to each stimulus?" Stimulus `100` (a `physical` stimulus from `seasonal-source-65`) was experienced by protoplasm `100`, and stimulus `103` (a `physical` stimulus from `compact-source-68`) was experienced by protoplasm `103` (a `germ` protoplasm with `irritability_level` `33.80`).

**View `vw_stimulus_engram`**

```sql
CREATE VIEW vw_stimulus_engram AS
SELECT a.stimulus_id, a.energy_level, a.stimulus_type, a.timestamp, b.id AS engram_id, b.engram_id AS engram_engram_id, b.stimulus_energy AS engram_stimulus_energy
FROM stimuluses a JOIN engrams b ON a.engram_id = b.id;
```

| stimulus_id | energy_level | stimulus_type | timestamp | engram_id | engram_engram_id | engram_stimulus_energy |
|---|---|---|---|---|---|---|
| 100 | 18.20 | physical | 2024-07-08T18:18:00 | 100 | 1186100 | 20.45 |
| 101 | 22.40 | chemical | 2025-12-19T01:35:00 | 101 | 8843757 | 24.90 |
| 102 | 26.60 | psychological | 2022-05-03T08:52:00 | 102 | f2094b32-8fcd-11eb-924d-9cd76263cbd0 | 29.35 |
| 103 | 30.80 | physical | 2023-10-14T15:09:00 | 103 | 5844256 | 33.80 |

The view `vw_stimulus_engram` joins `stimuluses` to `engrams` via `stimuluses.engram_id = engrams.id`. It answers: "Which engram was formed from each stimulus?" Stimulus `101` (a `chemical` stimulus with `energy_level` `22.40`) led to engram `101` (with `reaction_pattern` `primary-reaction-76`), and stimulus `103` (with `energy_level` `30.80`) led to engram `103` (with `reaction_pattern` `distributed-reaction-78`).

**View `vw_mental_disorder_engram_detail`**

```sql
CREATE VIEW vw_mental_disorder_engram_detail AS
SELECT a.id, a.disorder_id, a.disorder_name, b.id AS engram_id, b.engram_id AS engram_engram_id, b.stimulus_energy AS engram_stimulus_energy
FROM mental_disorders a
  JOIN disorders_engrams j ON j.mental_disorder_id = a.id
  JOIN engrams b ON b.id = j.engram_id;
```

| id | disorder_id | disorder_name | engram_id | engram_engram_id | engram_stimulus_energy |
|---|---|---|---|---|---|
| 1000 | c746ead6-8fcc-11eb-924d-9cd76263cbd0 | Primary Framework A | 100 | 1186100 | 20.45 |
| 1000 | c746ead6-8fcc-11eb-924d-9cd76263cbd0 | Primary Framework A | 101 | 8843757 | 24.90 |
| 1001 | 3001009030200 | Composite Protocol | 101 | 8843757 | 24.90 |
| 1001 | 3001009030200 | Composite Protocol | 102 | f2094b32-8fcd-11eb-924d-9cd76263cbd0 | 29.35 |
| 1002 | lu_tax_code_template_b_VB-TR-6 | Compact Programme | 102 | f2094b32-8fcd-11eb-924d-9cd76263cbd0 | 29.35 |
| 1002 | lu_tax_code_template_b_VB-TR-6 | Compact Programme | 103 | 5844256 | 33.80 |
| 1003 | 727055 | Legacy Standard D | 103 | 5844256 | 33.80 |
| 1003 | 727055 | Legacy Standard D | 100 | 1186100 | 20.45 |

The view `vw_mental_disorder_engram_detail` joins `mental_disorders` to `disorders_engrams` and back to `engrams`, answering: "Which engrams are associated with each mental disorder?" This view reconstructs the disorder-to-engram relationship graph, enabling traversal from disorder `1000` (`Primary Framework A`) through its junction entries to associated engrams.

**View `vw_mental_disorder_human`**

```sql
CREATE VIEW vw_mental_disorder_human AS
SELECT a.id, a.disorder_id, a.disorder_name, a.severity, b.id AS human_id, b.human_id AS human_human_id, b.birth_date AS human_birth_date
FROM mental_disorders a JOIN humans b ON a.human_id = b.id;
```

| id | disorder_id | disorder_name | severity | human_id | human_human_id | human_birth_date |
|---|---|---|---|---|---|---|
| 1000 | c746ead6-8fcc-11eb-924d-9cd76263cbd0 | Primary Framework A | 9.45 | 1 | 8189488 | 2023-10-18T21:39:00 |
| 1001 | 3001009030200 | Composite Protocol | 13.90 | 2 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:56:00 |
| 1002 | lu_tax_code_template_b_VB-TR-6 | Compact Programme | 18.35 | 3 | 8350025 | 2025-08-13T11:13:00 |
| 1003 | 727055 | Legacy Standard D | 22.80 | 4 | 727070 | 2022-01-24T18:30:00 |

The view `vw_mental_disorder_human` joins `mental_disorders` to `humans` via `mental_disorders.human_id = humans`. It answers: "Which human subject has each mental disorder?" Disorder `1000` (`Primary Framework A`, onset `2023-10-07T21:03:00`) is associated with human `1`, while disorder `1002` (`Compact Programme`, severity `18.35`, `resolved`) is associated with human `3`.

**View `vw_human_protoplasm`**

```sql
CREATE VIEW vw_human_protoplasm AS
SELECT a.id, a.human_id, a.birth_date, a.genetic_lineage, b.protoplasm_id AS protoplasm_protoplasm_id, b.origin_date AS protoplasm_origin_date, b.irritability_level AS protoplasm_irritability_level
FROM humans a JOIN protoplasms b ON a.protoplasm_id = b.protoplasm_id;
```

| id | human_id | birth_date | genetic_lineage | protoplasm_protoplasm_id | protoplasm_origin_date | protoplasm_irritability_level |
|---|---|---|---|---|---|---|
| 1 | 8189488 | 2023-10-18T21:39:00 | distributed-genetic-48 | 100 | 2023-10-13T21:39:00 | 21.95 |
| 2 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:56:00 | baseline-genetic-49 | 101 | 2024-03-24T04:56:00 | 25.90 |
| 3 | 8350025 | 2025-08-13T11:13:00 | pilot-genetic-50 | 102 | 2025-08-08T11:13:00 | 29.85 |
| 4 | 727070 | 2022-01-24T18:30:00 | extended-genetic-51 | 103 | 2022-01-19T18:30:00 | 33.80 |

The view `vw_human_protoplasm` joins `humans` to `protoplasms` (through the disorder-engram-protoplasm chain), answering: "Which protoplasms are associated with each human subject?" This view reconstructs the human-to-protoplasm relationship by traversing through `mental_disorders` and `engrams`, linking human `1` to protoplasm `100` via disorder `1000` and engram `100`.

**View `vw_human_stimulus`**

```sql
CREATE VIEW vw_human_stimulus AS
SELECT a.id, a.human_id, a.birth_date, a.genetic_lineage, b.stimulus_id AS stimulus_stimulus_id, b.energy_level AS stimulus_energy_level, b.stimulus_type AS stimulus_stimulus_type
FROM humans a JOIN stimuluses b ON a.stimulus_id = b.stimulus_id;
```

| id | human_id | birth_date | genetic_lineage | stimulus_stimulus_id | stimulus_energy_level | stimulus_stimulus_type |
|---|---|---|---|---|---|---|
| 1 | 8189488 | 2023-10-18T21:39:00 | distributed-genetic-48 | 100 | 18.20 | physical |
| 2 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:56:00 | baseline-genetic-49 | 101 | 22.40 | chemical |
| 3 | 8350025 | 2025-08-13T11:13:00 | pilot-genetic-50 | 102 | 26.60 | psychological |
| 4 | 727070 | 2022-01-24T18:30:00 | extended-genetic-51 | 103 | 30.80 | physical |

The view `vw_human_stimulus` joins `humans` to `stimuluses` (through the disorder-engram-stimulus chain), answering: "Which stimuli were experienced by each human subject?" This view reconstructs the human-to-stimulus relationship by traversing through `mental_disorders`, `engrams`, and `stimuluses`, linking human `2` to stimulus `101` (a `chemical` stimulus from `regional-source-66`) via disorder `1001` and engram `101`.

**View `vw_human_engram`**

```sql
CREATE VIEW vw_human_engram AS
SELECT a.id, a.human_id, a.birth_date, a.genetic_lineage, b.id AS engram_id, b.engram_id AS engram_engram_id, b.stimulus_energy AS engram_stimulus_energy
FROM humans a JOIN engrams b ON a.engram_id = b.id;
```

| id | human_id | birth_date | genetic_lineage | engram_id | engram_engram_id | engram_stimulus_energy |
|---|---|---|---|---|---|---|
| 1 | 8189488 | 2023-10-18T21:39:00 | distributed-genetic-48 | 100 | 1186100 | 20.45 |
| 2 | b350e544-8fcd-11eb-924d-9cd76263cbd0 | 2024-03-02T04:56:00 | baseline-genetic-49 | 101 | 8843757 | 24.90 |
| 3 | 8350025 | 2025-08-13T11:13:00 | pilot-genetic-50 | 102 | f2094b32-8fcd-11eb-924d-9cd76263cbd0 | 29.35 |
| 4 | 727070 | 2022-01-24T18:30:00 | extended-genetic-51 | 103 | 5844256 | 33.80 |

The view `vw_human_engram` joins `humans` to `engrams` (through the disorder-engram direct link), answering: "Which engrams are associated with each human subject?" This view reconstructs the human-to-engram relationship by traversing through `mental_disorders`, linking human `3` to engram `102` (with `reaction_pattern` `adaptive-reaction-77`) via disorder `1002` (`Compact Programme`).

## Synthesis

The schema models a biological-neurological domain where protoplasmic substrates generate cells and engrams, cells house nuclei, and engrams encode stimulus-driven memory traces that intersect with mental disorder phenotypes and human subjects. The ten base tables normalize these concepts into atomic entities with clear primary keys and foreign key relationships. The three junction tables (`cells_cells`, `nucleuses_nucleuses`, `disorders_engrams`) capture many-to-many relationships that cannot be expressed through simple column-level foreign keys. The seventeen views materialize specific domain facts by joining the appropriate normalized tables, each view answering a distinct question about the relationships between entities. The design supports both forward traversal (from protoplasm to cell to nucleus) and reverse traversal (from human to disorder to engram to stimulus), enabling comprehensive analysis of the biological-neurological lifecycle from substrate to subject.