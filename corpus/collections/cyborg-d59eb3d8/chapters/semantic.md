Cyborg systems, neural implants, and their supporting infrastructure form a tightly coupled ecosystem where biological and electronic components must be tracked, integrated, and audited across the full lifecycle of augmentation. The domain model captures four principal entity types—cyborgs, neural implants, cyborgation processes, and hybrots—alongside three supporting technical entities: computer systems, nerve fibers, and muscles. Each entity is materialized as a relational table with a surrogate primary key, a set of descriptive attributes, and foreign keys that encode the cardinality-bounded relationships between them. The resulting schema is fully normalized to third normal form, and a suite of twelve views reconstructs the domain facts that span multiple tables, allowing analysts to query the integrated picture without writing explicit joins.

## The Cyborg Entity

**Table `cyborgs`**

| id | cyborg_id | classification | implant_location | neural_integration_level | status | neural_implant_id | cyborgation_process_id |
|---|---|---|---|---|---|---|---|
| 1000 | delivery | conditional | adaptive-implant-35 | 11.20 | active | 1000 | 1 |
| 1001 | template_impcode_pagata_0 | conventional | distributed-implant-36 | 13.40 | inactive | 1001 | 2 |
| 1002 | 4463660 | conditional | baseline-implant-37 | 15.60 | experimental | 1002 | 3 |
| 1003 | c747db62-8fcc-11eb-924d-9cd76263cbd0 | conventional | pilot-implant-38 | 17.80 | active | 1003 | 4 |

The `cyborgs` table is the central actor in the augmentation lifecycle. Its surrogate key `id` is an integer (1000–1003 in the sample), while the business identifier `cyborg_id` carries a heterogeneous mix of values: the string `delivery` for a conditional-classification cyborg, the code `template_impcode_pagata_0` for a conventional template, the numeric string `4463660`, and a UUID `c747db62-8fcc-11eb-924d-9cd76263cbd0`. The `classification` column distinguishes `conditional` from `conventional` augmentations, `implant_location` names the physical site such as `adaptive-implant-35` or `pilot-implant-38`, and `neural_integration_level` is a floating-point measurement ranging from 11.20 to 17.80. The `status` column records the operational state (`active`, `inactive`, or `experimental`). Two foreign keys anchor the cyborg to its supporting infrastructure: `neural_implant_id` references `neural_implants.neural_implant_id`, and `cyborgation_process_id` references `cyborgation_processes.id`. In the sample data, cyborg 1000 is linked to neural implant 1000 and cyborgation process 1, establishing a one-to-one linkage at the row level.

## Neural Implants and Their Technical Dependencies

**Table `neural_implants`**

| neural_implant_id | implant_id | type | material | power_source | signal_format | nerve_fiber_id | computer_system_id |
|---|---|---|---|---|---|---|---|
| 1000 | 6564393 | siliconChip | primary-material-94 | primary-power-94 | analog | 1000 | 1 |
| 1001 | 8928499 | osmoticPump | adaptive-material-95 | adaptive-power-95 | digital | 1001 | 2 |
| 1002 | df2dc8c2-8fcc-11eb-924d-9cd76263cbd0 | cochlearImplant | distributed-material-96 | distributed-power-96 | analog | 1002 | 3 |
| 1003 | 4180956 | bionicEye | baseline-material-97 | baseline-power-97 | digital | 1003 | 4 |

The `neural_implants` table describes the implant hardware itself. Its primary key `neural_implant_id` (1000–1003) maps to a business `implant_id` that varies in format: the integer `6564393`, the integer `8928499`, the UUID `df2dc8c2-8fcc-11eb-924d-9cd76263cbd0`, and the integer `4180956`. The `type` column enumerates implant categories—`siliconChip`, `osmoticPump`, `cochlearImplant`, and `bionicEye`—while `material` and `power_source` carry descriptive labels such as `primary-material-94` and `primary-power-94`. The `signal_format` column is binary, holding either `analog` or `digital`. Two foreign keys connect the implant to its peripheral and computational environment: `nerve_fiber_id` references `nerve_fibers.nerve_fiber_id`, and `computer_system_id` references `computer_systems.id`. Each neural implant row is thus a hub connecting one nerve fiber and one computer system, forming the core of the biological-electronic interface.

## Cyborgation Processes

**Table `cyborgation_processes`**

| id | process_id | start_date | end_date | procedure_type | success_rate | cyborg_id | neural_implant_id |
|---|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | surgical | 15.70 | 1000 | 1000 |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | nonSurgical | 17.40 | 1001 | 1001 |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | surgical | 19.10 | 1002 | 1002 |
| 4 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | nonSurgical | 20.80 | 1003 | 1003 |

The `cyborgation_processes` table records the augmentation procedure as a temporal event. Its surrogate `id` (1–4) is paired with a business `process_id` that again mixes formats: `template_ivacode_pagata_art15`, the UUID `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`, the UUID `57e52fbc-8fcd-11eb-924d-9cd76263cbd0`, and the alphanumeric code `1205-0002-XL`. The `start_date` and `end_date` columns store ISO-8601 timestamps; notably, the end dates precede the start dates in the sample (e.g., `2022-09-01T08:00:00` before `2022-09-05T20:24:00`), which may encode a scheduling convention or a data-entry artifact. The `procedure_type` is either `surgical` or `nonSurgical`, and `success_rate` is a floating-point percentage (15.70 to 20.80). Two foreign keys tie the process to its participants: `cyborg_id` references `cyborgs.id`, and `neural_implant_id` references `neural_implants.neural_implant_id`. Process 1, for instance, links cyborg 1000 with neural implant 1000, completing the triad of cyborg–implant–procedure.

## Hybrots: The Biological-Electronic Hybrid

**Table `hybrots`**

| id | hybrot_id | biological_component | electronic_component | longevity | status | neural_implant_id | computer_system_id |
|---|---|---|---|---|---|---|---|
| 1 | 1450665 | pilot-biologic-86 | distributed-electron-90 | 21.70 | semiliving | 1000 | 1 |
| 2 | 1450663 | extended-biologic-87 | baseline-electron-91 | 24.40 | inactive | 1001 | 2 |
| 3 | 520 | integrated-biologic-88 | pilot-electron-92 | 27.10 | semiliving | 1002 | 3 |
| 4 | 7021001070110 | seasonal-biologic-89 | extended-electron-93 | 29.80 | inactive | 1003 | 4 |

The `hybrots` table captures a distinct class of augmented entity that combines a biological component with an electronic one. Its surrogate `id` (1–4) maps to a `hybrot_id` of mixed type: `1450665`, `1450663`, `520`, and `7021001070110`. The `biological_component` column names the organic part (e.g., `pilot-biologic-86`, `extended-biologic-87`), while `electronic_component` names the electronic counterpart (e.g., `distributed-electron-90`, `baseline-electron-91`). The `longevity` attribute is a floating-point measure (21.70 to 29.80), and `status` is either `semiliving` or `inactive`. Two foreign keys, `neural_implant_id` and `computer_system_id`, link each hybrot to its neural implant and computing platform respectively. Hybrot 1, for example, is associated with neural implant 1000 and computer system 1, placing it within the same infrastructure cluster as cyborg 1000.

## Computer Systems

**Table `computer_systems`**

| id | system_id | processing_power | storage_capacity | communication_protocol | status | neural_implant_id | cyborg_id |
|---|---|---|---|---|---|---|---|
| 1 | 8189503 | 14.95 | 4.45 | wireless | active | 1000 | 1000 |
| 2 | 3717623 | 18.90 | 7.90 | wired | inactive | 1001 | 1001 |
| 3 | 7441161 | 22.85 | 11.35 | wireless | active | 1002 | 1002 |
| 4 | 605963 | 26.80 | 14.80 | wired | inactive | 1003 | 1003 |

The `computer_systems` table describes the computational backbone supporting implants and cyborgs. Its surrogate `id` (1–4) maps to a `system_id` that varies: `8189503`, `3717623`, `7441161`, and `605963`. The `processing_power` and `storage_capacity` columns are floating-point values (processing power ranges from 14.95 to 26.80; storage from 4.45 to 14.80). The `communication_protocol` is either `wireless` or `wired`, and `status` is `active` or `inactive`. Two foreign keys connect the system to the broader model: `neural_implant_id` references `neural_implants.neural_implant_id`, and `cyborg_id` references `cyborgs.id`. Computer system 1, for instance, is linked to neural implant 1000 and cyborg 1000, forming a tight triplet with the cyborg and its implant.

## Nerve Fibers and Muscles

**Table `nerve_fibers`**

| nerve_fiber_id | fiber_id | location | diameter | signal_speed | neural_implant_id | muscle_id |
|---|---|---|---|---|---|---|
| 1000 | 9424910 | extended-location-99 | 3.95 | 0.88669 | 1000 | 1 |
| 1001 | 6564372 | integrated-location-100 | 5.90 | 0.6 | 1001 | 2 |
| 1002 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 7.85 | 0.74 | 1002 | 3 |
| 1003 | 21248390 | regional-location-102 | 9.80 | 0.6000001 | 1003 | 4 |

The `nerve_fibers` table models the biological conduits through which neural signals travel. Its surrogate `nerve_fiber_id` (1000–1003) maps to a business `fiber_id` of mixed format: `9424910`, `6564372`, the UUID `57e48f58-8fcd-11eb-924d-9cd76263cbd0`, and `21248390`. The `location` column names the anatomical site (e.g., `extended-location-99`, `integrated-location-100`), `diameter` is a floating-point measurement (3.95 to 9.80), and `signal_speed` is a decimal (0.6 to 0.88669). Two foreign keys anchor the fiber: `neural_implant_id` references `neural_implants.neural_implant_id`, and `muscle_id` references `muscles.muscle_id`. Nerve fiber 1000, for example, connects neural implant 1000 to muscle 1.

**Table `muscles`**

| muscle_id | type | location | strength | nerve_fiber_id |
|---|---|---|---|---|
| 1 | composite-type-69 | extended-location-99 | 17.95 | 1000 |
| 2 | primary-type-70 | integrated-location-100 | 20.90 | 1001 |
| 3 | adaptive-type-71 | seasonal-location-101 | 23.85 | 1002 |
| 4 | distributed-type-72 | regional-location-102 | 26.80 | 1003 |

The `muscles` table is the simplest entity in the model, providing the biological endpoint for nerve fibers. Its primary key `muscle_id` (1–4) identifies each muscle, and the sample data shows a one-to-one correspondence with nerve fibers: muscle 1 pairs with nerve fiber 1000, muscle 2 with 1001, and so on. The table's minimal structure reflects its role as a lookup entity that completes the nerve-fiber-to-muscle chain.

## Reconstructing Domain Facts Through Views

The normalized tables capture atomic facts, but domain analysts need joined perspectives. The view layer provides these by materializing the most common multi-table queries.

### Cyborg–Implant and Cyborg–Process Views

**View `cyborg_neural_implant_view`**

```sql
CREATE VIEW cyborg_neural_implant_view AS
SELECT a.id, a.cyborg_id, a.classification, a.implant_location, b.neural_implant_id AS implant_neural_implant_id, b.implant_id AS implant_implant_id, b.type AS implant_type
FROM cyborgs a JOIN neural_implants b ON a.neural_implant_id = b.neural_implant_id;
```

| id | cyborg_id | classification | implant_location | implant_neural_implant_id | implant_implant_id | implant_type |
|---|---|---|---|---|---|---|
| 1000 | delivery | conditional | adaptive-implant-35 | 1000 | 6564393 | siliconChip |
| 1001 | template_impcode_pagata_0 | conventional | distributed-implant-36 | 1001 | 8928499 | osmoticPump |
| 1002 | 4463660 | conditional | baseline-implant-37 | 1002 | df2dc8c2-8fcc-11eb-924d-9cd76263cbd0 | cochlearImplant |
| 1003 | c747db62-8fcc-11eb-924d-9cd76263cbd0 | conventional | pilot-implant-38 | 1003 | 4180956 | bionicEye |

The `cyborg_neural_implant_view` joins `cyborgs` to `neural_implants` on the shared `neural_implant_id`, answering the question: "Which neural implant is associated with each cyborg?" A row from this view might show cyborg `delivery` (id 1000) paired with a `siliconChip` implant (id 1000) using `analog` signal format and `primary-power-94` as its power source. This view collapses the cyborg's `neural_implant_id` foreign key into a denormalized row that presents the full implant profile alongside the cyborg's classification and integration level.

**View `cyborg_cyborgation_process_view`**

```sql
CREATE VIEW cyborg_cyborgation_process_view AS
SELECT a.id, a.cyborg_id, a.classification, a.implant_location, b.id AS process_id, b.process_id AS process_process_id, b.start_date AS process_start_date
FROM cyborgs a JOIN cyborgation_processes b ON a.cyborgation_process_id = b.id;
```

| id | cyborg_id | classification | implant_location | process_id | process_process_id | process_start_date |
|---|---|---|---|---|---|---|
| 1000 | delivery | conditional | adaptive-implant-35 | 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 |
| 1001 | template_impcode_pagata_0 | conventional | distributed-implant-36 | 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 |
| 1002 | 4463660 | conditional | baseline-implant-37 | 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 |
| 1003 | c747db62-8fcc-11eb-924d-9cd76263cbd0 | conventional | pilot-implant-38 | 4 | 1205-0002-XL | 2025-12-11T17:15:00 |

The `cyborg_cyborgation_process_view` joins `cyborgs` to `cyborgation_processes` on `cyborg_id`, answering: "Which augmentation procedure was performed on each cyborg?" A representative row links cyborg `template_impcode_pagata_0` (id 1001) to process `27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3`, a `nonSurgical` procedure with a 17.40 success rate. The view surfaces the procedure's temporal bounds and outcome metrics alongside the cyborg's status and implant location.

### Neural Implant Peripheral Views

**View `neural_implant_nerve_fiber_view`**

```sql
CREATE VIEW neural_implant_nerve_fiber_view AS
SELECT a.neural_implant_id, a.implant_id, a.type, a.material, b.nerve_fiber_id AS fiber_nerve_fiber_id, b.fiber_id AS fiber_fiber_id, b.location AS fiber_location
FROM neural_implants a JOIN nerve_fibers b ON a.nerve_fiber_id = b.nerve_fiber_id;
```

| neural_implant_id | implant_id | type | material | fiber_nerve_fiber_id | fiber_fiber_id | fiber_location |
|---|---|---|---|---|---|---|
| 1000 | 6564393 | siliconChip | primary-material-94 | 1000 | 9424910 | extended-location-99 |
| 1001 | 8928499 | osmoticPump | adaptive-material-95 | 1001 | 6564372 | integrated-location-100 |
| 1002 | df2dc8c2-8fcc-11eb-924d-9cd76263cbd0 | cochlearImplant | distributed-material-96 | 1002 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 |
| 1003 | 4180956 | bionicEye | baseline-material-97 | 1003 | 21248390 | regional-location-102 |

The `neural_implant_nerve_fiber_view` joins `neural_implants` to `nerve_fibers` on `nerve_fiber_id`, answering: "Which nerve fiber is connected to each neural implant?" A row might show the `bionicEye` implant (neural_implant_id 1003) connected to nerve fiber `21248390` at `regional-location-102` with a signal speed of 0.6000001. This view reconstructs the biological interface path from implant to peripheral nerve.

**View `neural_implant_computer_system_view`**

```sql
CREATE VIEW neural_implant_computer_system_view AS
SELECT a.neural_implant_id, a.implant_id, a.type, a.material, b.id AS system_id, b.system_id AS system_system_id, b.processing_power AS system_processing_power
FROM neural_implants a JOIN computer_systems b ON a.computer_system_id = b.id;
```

| neural_implant_id | implant_id | type | material | system_id | system_system_id | system_processing_power |
|---|---|---|---|---|---|---|
| 1000 | 6564393 | siliconChip | primary-material-94 | 1 | 8189503 | 14.95 |
| 1001 | 8928499 | osmoticPump | adaptive-material-95 | 2 | 3717623 | 18.90 |
| 1002 | df2dc8c2-8fcc-11eb-924d-9cd76263cbd0 | cochlearImplant | distributed-material-96 | 3 | 7441161 | 22.85 |
| 1003 | 4180956 | bionicEye | baseline-material-97 | 4 | 605963 | 26.80 |

The `neural_implant_computer_system_view` joins `neural_implants` to `computer_systems` on `computer_system_id`, answering: "Which computer system supports each neural implant?" A row could pair the `osmoticPump` implant (neural_implant_id 1001) with computer system `3717623`, which has a processing power of 18.90, storage capacity of 7.90, and uses a `wired` protocol. This view is essential for capacity planning and troubleshooting the computational side of the implant.

### Cyborgation Process Participant Views

**View `cyborgation_process_cyborg_view`**

```sql
CREATE VIEW cyborgation_process_cyborg_view AS
SELECT a.id, a.process_id, a.start_date, a.end_date, b.id AS cyborg_id, b.cyborg_id AS cyborg_cyborg_id, b.classification AS cyborg_classification
FROM cyborgation_processes a JOIN cyborgs b ON a.cyborg_id = b.id;
```

| id | process_id | start_date | end_date | cyborg_id | cyborg_cyborg_id | cyborg_classification |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | delivery | conditional |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | template_impcode_pagata_0 | conventional |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | 4463660 | conditional |
| 4 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | c747db62-8fcc-11eb-924d-9cd76263cbd0 | conventional |

The `cyborgation_process_cyborg_view` joins `cyborgation_processes` to `cyborgs` on `cyborg_id`, answering: "Which cyborg underwent each augmentation procedure?" A row might show process `1205-0002-XL` (a `nonSurgical` procedure with 20.80 success rate) performed on cyborg `c747db62-8fcc-11eb-924d-9cd76263cbd0` (id 1003), who has a `conventional` classification and `pilot-implant-38` as the implant location. This view inverts the cyborg-centric perspective to focus on the procedure as the primary entity.

**View `cyborgation_process_neural_implant_view`**

```sql
CREATE VIEW cyborgation_process_neural_implant_view AS
SELECT a.id, a.process_id, a.start_date, a.end_date, b.neural_implant_id AS implant_neural_implant_id, b.implant_id AS implant_implant_id, b.type AS implant_type
FROM cyborgation_processes a JOIN neural_implants b ON a.neural_implant_id = b.neural_implant_id;
```

| id | process_id | start_date | end_date | implant_neural_implant_id | implant_implant_id | implant_type |
|---|---|---|---|---|---|---|
| 1 | template_ivacode_pagata_art15 | 2022-09-05T20:24:00 | 2022-09-01T08:00:00 | 1000 | 6564393 | siliconChip |
| 2 | 27cebc1c-9bad-11eb-a8a2-19ed5c03f8d3 | 2023-02-16T03:41:00 | 2023-02-12T15:17:00 | 1001 | 8928499 | osmoticPump |
| 3 | 57e52fbc-8fcd-11eb-924d-9cd76263cbd0 | 2024-07-27T10:58:00 | 2024-07-23T22:34:00 | 1002 | df2dc8c2-8fcc-11eb-924d-9cd76263cbd0 | cochlearImplant |
| 4 | 1205-0002-XL | 2025-12-11T17:15:00 | 2025-12-07T05:51:00 | 1003 | 4180956 | bionicEye |

The `cyborgation_process_neural_implant_view` joins `cyborgation_processes` to `neural_implants` on `neural_implant_id`, answering: "Which neural implant was installed during each augmentation procedure?" A row could link process `template_ivacode_pagata_art15` (a `surgical` procedure starting `2022-09-05T20:24:00`) to the `siliconChip` implant (neural_implant_id 1000) with `primary-material-94` as its material. This view is critical for auditing which hardware was deployed in which procedure.

### Hybrot Integration Views

**View `hybrot_neural_implant_view`**

```sql
CREATE VIEW hybrot_neural_implant_view AS
SELECT a.id, a.hybrot_id, a.biological_component, a.electronic_component, b.neural_implant_id AS implant_neural_implant_id, b.implant_id AS implant_implant_id, b.type AS implant_type
FROM hybrots a JOIN neural_implants b ON a.neural_implant_id = b.neural_implant_id;
```

| id | hybrot_id | biological_component | electronic_component | implant_neural_implant_id | implant_implant_id | implant_type |
|---|---|---|---|---|---|---|
| 1 | 1450665 | pilot-biologic-86 | distributed-electron-90 | 1000 | 6564393 | siliconChip |
| 2 | 1450663 | extended-biologic-87 | baseline-electron-91 | 1001 | 8928499 | osmoticPump |
| 3 | 520 | integrated-biologic-88 | pilot-electron-92 | 1002 | df2dc8c2-8fcc-11eb-924d-9cd76263cbd0 | cochlearImplant |
| 4 | 7021001070110 | seasonal-biologic-89 | extended-electron-93 | 1003 | 4180956 | bionicEye |

The `hybrot_neural_implant_view` joins `hybrots` to `neural_implants` on `neural_implant_id`, answering: "Which neural implant is integrated into each hybrot?" A row might show hybrot `1450665` (with `pilot-biologic-86` and `distributed-electron-90` components, longevity 21.70, status `semiliving`) paired with the `siliconChip` implant (neural_implant_id 1000). This view reveals the biological-electronic pairing at the hybrot level.

**View `hybrot_computer_system_view`**

```sql
CREATE VIEW hybrot_computer_system_view AS
SELECT a.id, a.hybrot_id, a.biological_component, a.electronic_component, b.id AS system_id, b.system_id AS system_system_id, b.processing_power AS system_processing_power
FROM hybrots a JOIN computer_systems b ON a.computer_system_id = b.id;
```

| id | hybrot_id | biological_component | electronic_component | system_id | system_system_id | system_processing_power |
|---|---|---|---|---|---|---|
| 1 | 1450665 | pilot-biologic-86 | distributed-electron-90 | 1 | 8189503 | 14.95 |
| 2 | 1450663 | extended-biologic-87 | baseline-electron-91 | 2 | 3717623 | 18.90 |
| 3 | 520 | integrated-biologic-88 | pilot-electron-92 | 3 | 7441161 | 22.85 |
| 4 | 7021001070110 | seasonal-biologic-89 | extended-electron-93 | 4 | 605963 | 26.80 |

The `hybrot_computer_system_view` joins `hybrots` to `computer_systems` on `computer_system_id`, answering: "Which computer system powers each hybrot?" A row could link hybrot `7021001070110` (seasonal-biologic-89 / extended-electron-93, longevity 29.80, status `inactive`) to computer system `605963`, which has processing power 26.80 and uses a `wired` protocol. This view is useful for assessing the computational resources allocated to each hybrot.

### Computer System Integration Views

**View `computer_system_neural_implant_view`**

```sql
CREATE VIEW computer_system_neural_implant_view AS
SELECT a.id, a.system_id, a.processing_power, a.storage_capacity, b.neural_implant_id AS implant_neural_implant_id, b.implant_id AS implant_implant_id, b.type AS implant_type
FROM computer_systems a JOIN neural_implants b ON a.neural_implant_id = b.neural_implant_id;
```

| id | system_id | processing_power | storage_capacity | implant_neural_implant_id | implant_implant_id | implant_type |
|---|---|---|---|---|---|---|
| 1 | 8189503 | 14.95 | 4.45 | 1000 | 6564393 | siliconChip |
| 2 | 3717623 | 18.90 | 7.90 | 1001 | 8928499 | osmoticPump |
| 3 | 7441161 | 22.85 | 11.35 | 1002 | df2dc8c2-8fcc-11eb-924d-9cd76263cbd0 | cochlearImplant |
| 4 | 605963 | 26.80 | 14.80 | 1003 | 4180956 | bionicEye |

The `computer_system_neural_implant_view` joins `computer_systems` to `neural_implants` on `neural_implant_id`, answering: "Which neural implant is served by each computer system?" A row might show computer system `8189503` (processing power 14.95, storage 4.45, `wireless` protocol, `active` status) serving the `siliconChip` implant (neural_implant_id 1000). This view inverts the implant-centric perspective to focus on the computing infrastructure.

**View `computer_system_cyborg_view`**

```sql
CREATE VIEW computer_system_cyborg_view AS
SELECT a.id, a.system_id, a.processing_power, a.storage_capacity, b.id AS cyborg_id, b.cyborg_id AS cyborg_cyborg_id, b.classification AS cyborg_classification
FROM computer_systems a JOIN cyborgs b ON a.cyborg_id = b.id;
```

| id | system_id | processing_power | storage_capacity | cyborg_id | cyborg_cyborg_id | cyborg_classification |
|---|---|---|---|---|---|---|
| 1 | 8189503 | 14.95 | 4.45 | 1000 | delivery | conditional |
| 2 | 3717623 | 18.90 | 7.90 | 1001 | template_impcode_pagata_0 | conventional |
| 3 | 7441161 | 22.85 | 11.35 | 1002 | 4463660 | conditional |
| 4 | 605963 | 26.80 | 14.80 | 1003 | c747db62-8fcc-11eb-924d-9cd76263cbd0 | conventional |

The `computer_system_cyborg_view` joins `computer_systems` to `cyborgs` on `cyborg_id`, answering: "Which cyborg is supported by each computer system?" A row could link computer system `3717623` (processing power 18.90, `wired` protocol, `inactive` status) to cyborg `template_impcode_pagata_0` (id 1001), who has a `conventional` classification and `distributed-implant-36` as the implant location. This view is essential for capacity and status reporting from the computing side.

### Nerve Fiber and Muscle Views

**View `nerve_fiber_neural_implant_view`**

```sql
CREATE VIEW nerve_fiber_neural_implant_view AS
SELECT a.nerve_fiber_id, a.fiber_id, a.location, a.diameter, b.neural_implant_id AS implant_neural_implant_id, b.implant_id AS implant_implant_id, b.type AS implant_type
FROM nerve_fibers a JOIN neural_implants b ON a.neural_implant_id = b.neural_implant_id;
```

| nerve_fiber_id | fiber_id | location | diameter | implant_neural_implant_id | implant_implant_id | implant_type |
|---|---|---|---|---|---|---|
| 1000 | 9424910 | extended-location-99 | 3.95 | 1000 | 6564393 | siliconChip |
| 1001 | 6564372 | integrated-location-100 | 5.90 | 1001 | 8928499 | osmoticPump |
| 1002 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 7.85 | 1002 | df2dc8c2-8fcc-11eb-924d-9cd76263cbd0 | cochlearImplant |
| 1003 | 21248390 | regional-location-102 | 9.80 | 1003 | 4180956 | bionicEye |

The `nerve_fiber_neural_implant_view` joins `nerve_fibers` to `neural_implants` on `neural_implant_id`, answering: "Which neural implant is connected to each nerve fiber?" A row might show nerve fiber `9424910` (at `extended-location-99`, diameter 3.95, signal speed 0.88669) connected to the `siliconChip` implant (neural_implant_id 1000). This view reconstructs the signal path from the peripheral nerve back to the implant.

**View `nerve_fiber_muscle_view`**

```sql
CREATE VIEW nerve_fiber_muscle_view AS
SELECT a.nerve_fiber_id, a.fiber_id, a.location, a.diameter, b.muscle_id AS muscle_muscle_id, b.type AS muscle_type, b.location AS muscle_location
FROM nerve_fibers a JOIN muscles b ON a.muscle_id = b.muscle_id;
```

| nerve_fiber_id | fiber_id | location | diameter | muscle_muscle_id | muscle_type | muscle_location |
|---|---|---|---|---|---|---|
| 1000 | 9424910 | extended-location-99 | 3.95 | 1 | composite-type-69 | extended-location-99 |
| 1001 | 6564372 | integrated-location-100 | 5.90 | 2 | primary-type-70 | integrated-location-100 |
| 1002 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 | 7.85 | 3 | adaptive-type-71 | seasonal-location-101 |
| 1003 | 21248390 | regional-location-102 | 9.80 | 4 | distributed-type-72 | regional-location-102 |

The `nerve_fiber_muscle_view` joins `nerve_fibers` to `muscles` on `muscle_id`, answering: "Which muscle is innervated by each nerve fiber?" A row could link nerve fiber `6564372` (at `integrated-location-100`, diameter 5.90, signal speed 0.6) to muscle 2. This view completes the biological signal chain, showing which muscle each nerve fiber targets.

**View `muscle_nerve_fiber_view`**

```sql
CREATE VIEW muscle_nerve_fiber_view AS
SELECT a.muscle_id, a.type, a.location, a.strength, b.nerve_fiber_id AS fiber_nerve_fiber_id, b.fiber_id AS fiber_fiber_id, b.location AS fiber_location
FROM muscles a JOIN nerve_fibers b ON a.nerve_fiber_id = b.nerve_fiber_id;
```

| muscle_id | type | location | strength | fiber_nerve_fiber_id | fiber_fiber_id | fiber_location |
|---|---|---|---|---|---|---|
| 1 | composite-type-69 | extended-location-99 | 17.95 | 1000 | 9424910 | extended-location-99 |
| 2 | primary-type-70 | integrated-location-100 | 20.90 | 1001 | 6564372 | integrated-location-100 |
| 3 | adaptive-type-71 | seasonal-location-101 | 23.85 | 1002 | 57e48f58-8fcd-11eb-924d-9cd76263cbd0 | seasonal-location-101 |
| 4 | distributed-type-72 | regional-location-102 | 26.80 | 1003 | 21248390 | regional-location-102 |

The `muscle_nerve_fiber_view` joins `muscles` to `nerve_fibers` on `nerve_fiber_id`, answering: "Which nerve fiber innervates each muscle?" A row might show muscle 1 innervated by nerve fiber `9424910` (at `extended-location-99`, diameter 3.95, signal speed 0.88669). This view inverts the nerve-fiber-centric perspective to focus on the muscle as the primary entity, completing the bidirectional coverage of the biological interface.

## Synthesis

The schema models the cyborg augmentation domain as a network of seven interrelated tables, each capturing a distinct facet of the biological-electronic ecosystem. The cyborg table sits at the center, linked to its neural implant and augmentation process through foreign keys. Neural implants, in turn, connect to both nerve fibers (the biological interface) and computer systems (the computational backbone). Hybrots form a parallel track, combining biological and electronic components while referencing the same implant and computer system tables. The nerve fiber and muscle tables complete the biological signal chain. The twelve views materialize the most common multi-table queries, allowing analysts to reconstruct domain facts—such as which implant serves which cyborg, which procedure installed which hardware, or which muscle is innervated by which nerve fiber—without writing explicit joins. This design achieves a clean separation between atomic entity storage and analytical query patterns, a pattern that scales well as the domain grows in complexity.