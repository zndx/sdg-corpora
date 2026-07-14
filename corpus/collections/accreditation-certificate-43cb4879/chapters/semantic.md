## Normalised Modelling of a Calibration Accreditation Registry

A calibration accreditation registry tracks the lifecycle of certificates issued to laboratories, the standards those laboratories are accredited against, the measurement parameters they are qualified to perform, and the physical equipment they use. The domain is modelled as a set of five core entity tables, two junction tables that resolve many-to-many associations, and a family of nine materialised views that reassemble the normalised facts into domain-readable reports. Every table is keyed by a surrogate or natural identifier, and foreign-key columns bind the entities into a coherent graph.

**Table `accreditation_certificates`**

| certificate_number | issue_date | expiry_date | accreditation_body | status | calibration_laboratory_id |
|---|---|---|---|---|---|
| CER-2622 | 2023-02-01 | 2023-10-24 | integrated-accredit-88 | valid | 1 |
| CER-2626 | 2024-07-12 | 2024-03-08 | seasonal-accredit-89 | expired | 2 |
| CER-2630 | 2025-12-23 | 2025-08-19 | regional-accredit-90 | suspended | 3 |
| CER-2634 | 2022-05-07 | 2022-01-03 | legacy-accredit-91 | valid | 4 |

The `accreditation_certificates` table anchors the registry. Each row represents a single certificate issued by an accreditation body to a calibration laboratory. The primary key is `certificate_number`, a human-readable code such as `CER-2622` or `CER-2634`. The columns `issue_date` and `expiry_date` record the validity window, while `accreditation_body` names the issuing authority — values like `integrated-accredit-88` or `seasonal-accredit-89` identify the body. The `status` column carries one of three lifecycle states: `valid`, `expired`, or `suspended`. The foreign key `calibration_laboratory_id` points to the laboratory that holds the certificate, establishing a one-to-many relationship from laboratory to certificate (a laboratory may hold multiple certificates, but each certificate row references exactly one laboratory).

**Table `calibration_laboratories`**

| calibration_laboratory_id | laboratory_name | address | contact_phone | contact_person | facility_type | certificate_number |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | distributed-address-72 | Joe Tsai | Alyssa Chung | on-site | CER-2622 |
| 2 | Distributed Model | baseline-address-73 | Stephanie Collins | Brianna Mejia | laboratory | CER-2626 |
| 3 | Adaptive Cluster | pilot-address-74 | Tasha Rodriguez | Eric Schultz | on-site | CER-2630 |
| 4 | Primary Review A | extended-address-75 | Walter Pratt | Peter Montgomery | laboratory | CER-2634 |

The `calibration_laboratories` table describes the accredited entities themselves. Its primary key `calibration_laboratory_id` is an integer surrogate (1, 2, 3, 4 in the sample data). The column `laboratory_name` holds descriptive identifiers such as `Baseline Initiative D` or `Adaptive Cluster`. Contact information is captured in `address`, `contact_phone`, and `contact_person` — for example, `Alyssa Chung` at `Baseline Initiative D` can be reached at the phone number stored in `contact_phone`. The `facility_type` column distinguishes between `on-site` and `laboratory` facilities. A denormalised column `certificate_number` mirrors the certificate held by the laboratory, providing a convenient lookup path back to `accreditation_certificates`.

**Table `calibration_standards`**

| calibration_standard_id | standard_identifier | standard_name | publication_year | issuing_organization | certificate_number |
|---|---|---|---|---|---|
| 1 | STA-2646 | Compact Framework | 25 | Alphabet Inc Class A | CER-2622 |
| 2 | STA-2649 | Legacy Protocol | 33 | ITT Industries | CER-2626 |
| 3 | STA-2652 | Regional Programme A | 41 | Switch Card Services Ltd. | CER-2630 |
| 4 | STA-2655 | Seasonal Standard | 49 | Buypass AS | CER-2634 |

`calibration_standards` stores the reference standards against which laboratories are assessed. The primary key `calibration_standard_id` is an integer (1 through 4 in the sample). `standard_identifier` is a short code like `STA-2646`, while `standard_name` carries a human-readable title such as `Compact Framework` or `Legacy Protocol`. `publication_year` records the year of publication (25, 33, 41, 49 in the sample), and `issuing_organization` names the body that published the standard — `Alphabet Inc Class A`, `ITT Industries`, `Switch Card Services Ltd.`, and `Buypass AS` appear in the data. The `certificate_number` column links each standard to the accreditation certificate under which it is invoked.

**Table `calibration_parameters`**

| calibration_parameter_id | parameter_name | measurement_range | expanded_uncertainty | uncertainty_unit | frequency_range | coverage_factor | calibration_laboratory_id | calibration_standard_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Extended Model | primary-measurem-88 | 17.45 | primary-uncertai-88 | seasonal-frequenc-41 | 4.95 | 1 | 1 |
| 2 | Pilot Cluster A | adaptive-measurem-89 | 20.90 | adaptive-uncertai-89 | regional-frequenc-42 | 8.90 | 2 | 2 |
| 3 | Baseline Review | distributed-measurem-90 | 24.35 | distributed-uncertai-90 | legacy-frequenc-43 | 12.85 | 3 | 3 |
| 4 | Distributed Initiative | baseline-measurem-91 | 27.80 | baseline-uncertai-91 | compact-frequenc-44 | 16.80 | 4 | 4 |

The `calibration_parameters` table captures the specific measurement capabilities of a laboratory. Its primary key is `calibration_parameter_id`. The `parameter_name` column holds names such as `Extended Model`, `Pilot Cluster A`, `Baseline Review`, and `Distributed Initiative`. Quantitative attributes include `measurement_range` (e.g. `primary-measurem-88`), `expanded_uncertainty` (17.45, 20.90, 24.35, 27.80), `uncertainty_unit` (e.g. `primary-uncertai-88`), `frequency_range` (e.g. `seasonal-frequenc-41`), and `coverage_factor` (4.95, 8.90, 12.85, 16.80). Two foreign keys bind this table to the rest of the schema: `calibration_laboratory_id` identifies the laboratory that performs the parameter, and `calibration_standard_id` identifies the standard under which the parameter is accredited. Together these two FKs enforce that every calibration parameter is attributed to exactly one laboratory and one standard.

**Table `measurement_equipments`**

| equipment_type | equipment_model | serial_number | manufacturer | calibration_status | calibration_parameter_id | calibration_laboratory_id |
|---|---|---|---|---|---|---|
| integrated-equipmen-58 | legacy-equipmen-25 | 5844275 | Standard Chartered | calibrated | 1 | 1 |
| seasonal-equipmen-59 | compact-equipmen-26 | 69422 | General Motors | pending | 2 | 2 |
| regional-equipmen-60 | composite-equipmen-27 | 7731874 | Column Name cannot be empty | out_of_service | 3 | 3 |
| legacy-equipmen-61 | primary-equipmen-28 | 10445632 | Financial Information Service Co. Ltd. | calibrated | 4 | 4 |

`measurement_equipments` records the physical instruments used in calibration work. The primary key is `serial_number` (e.g. `5844275`, `69422`, `7731874`, `10445632`). The `equipment_type` and `equipment_model` columns classify the instrument — values such as `integrated-equipmen-58` and `legacy-equipmen-25` appear in the sample. `manufacturer` names the producer, with entries like `Standard Chartered`, `General Motors`, and `Financial Information Service Co. Ltd.`. The `calibration_status` column carries one of three states: `calibrated`, `pending`, or `out_of_service`. Two foreign keys, `calibration_parameter_id` and `calibration_laboratory_id`, tie each piece of equipment to the parameter it is used for and the laboratory that owns it.

**Table `certificates_standards`**

| certificate_number | calibration_standard_id |
|---|---|
| CER-2622 | 1 |
| CER-2622 | 2 |
| CER-2626 | 2 |
| CER-2626 | 3 |
| CER-2630 | 3 |
| CER-2630 | 4 |
| CER-2634 | 4 |
| CER-2634 | 1 |

The `certificates_standards` table is a junction table that resolves the many-to-many relationship between accreditation certificates and calibration standards. Its composite primary key consists of `certificate_number` and `calibration_standard_id`. In the sample data, certificate `CER-2622` is associated with standards 1 and 2, `CER-2626` with standards 2 and 3, `CER-2630` with standards 3 and 4, and `CER-2634` with standards 4 and 1. This table allows a single certificate to reference multiple standards and a single standard to be invoked under multiple certificates.

**Table `laboratories_parameters`**

| calibration_laboratory_id | calibration_parameter_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `laboratories_parameters` table is a second junction table, resolving the many-to-many relationship between calibration laboratories and calibration parameters. Its composite primary key is formed by `calibration_laboratory_id` and `calibration_parameter_id`. While the sample data for this table is not enumerated, its structural role is symmetric to `certificates_standards`: it permits a laboratory to be qualified for multiple parameters and a parameter to be performed by multiple laboratories.

The five base tables and two junction tables form a normalised schema in which each entity type is stored once and relationships are expressed through foreign keys and junction rows. The nine views materialise this normalised graph into denormalised result sets that answer specific domain questions.

**View `v_accreditation_certificate_calibration_laboratory`**

```sql
CREATE VIEW v_accreditation_certificate_calibration_laboratory AS
SELECT a.certificate_number, a.issue_date, a.expiry_date, a.accreditation_body, b.calibration_laboratory_id AS laboratory_calibration_laboratory_id, b.laboratory_name AS laboratory_laboratory_name, b.address AS laboratory_address
FROM accreditation_certificates a JOIN calibration_laboratories b ON a.calibration_laboratory_id = b.calibration_laboratory_id;
```

| certificate_number | issue_date | expiry_date | accreditation_body | laboratory_calibration_laboratory_id | laboratory_laboratory_name | laboratory_address |
|---|---|---|---|---|---|---|
| CER-2622 | 2023-02-01 | 2023-10-24 | integrated-accredit-88 | 1 | Baseline Initiative D | distributed-address-72 |
| CER-2626 | 2024-07-12 | 2024-03-08 | seasonal-accredit-89 | 2 | Distributed Model | baseline-address-73 |
| CER-2630 | 2025-12-23 | 2025-08-19 | regional-accredit-90 | 3 | Adaptive Cluster | pilot-address-74 |
| CER-2634 | 2022-05-07 | 2022-01-03 | legacy-accredit-91 | 4 | Primary Review A | extended-address-75 |

The view `v_accreditation_certificate_calibration_laboratory` joins `accreditation_certificates` to `calibration_laboratories` on the foreign key `calibration_laboratory_id`. It answers the question: "Which laboratory holds which certificate, and what is the certificate's current status?" A representative row shows certificate `CER-2622` held by `Baseline Initiative D` with status `valid`, while `CER-2626` held by `Distributed Model` carries status `expired`. This view is the primary lookup for certificate-to-laboratory traceability.

**View `v_accreditation_certificate_calibration_standard_detail`**

```sql
CREATE VIEW v_accreditation_certificate_calibration_standard_detail AS
SELECT a.certificate_number, a.issue_date, a.expiry_date, b.calibration_standard_id AS standard_calibration_standard_id, b.standard_identifier AS standard_standard_identifier, b.standard_name AS standard_standard_name
FROM accreditation_certificates a
  JOIN certificates_standards j ON j.certificate_number = a.certificate_number
  JOIN calibration_standards b ON b.calibration_standard_id = j.calibration_standard_id;
```

| certificate_number | issue_date | expiry_date | standard_calibration_standard_id | standard_standard_identifier | standard_standard_name |
|---|---|---|---|---|---|
| CER-2622 | 2023-02-01 | 2023-10-24 | 1 | STA-2646 | Compact Framework |
| CER-2622 | 2023-02-01 | 2023-10-24 | 2 | STA-2649 | Legacy Protocol |
| CER-2626 | 2024-07-12 | 2024-03-08 | 2 | STA-2649 | Legacy Protocol |
| CER-2626 | 2024-07-12 | 2024-03-08 | 3 | STA-2652 | Regional Programme A |
| CER-2630 | 2025-12-23 | 2025-08-19 | 3 | STA-2652 | Regional Programme A |
| CER-2630 | 2025-12-23 | 2025-08-19 | 4 | STA-2655 | Seasonal Standard |
| CER-2634 | 2022-05-07 | 2022-01-03 | 4 | STA-2655 | Seasonal Standard |
| CER-2634 | 2022-05-07 | 2022-01-03 | 1 | STA-2646 | Compact Framework |

The view `v_accreditation_certificate_calibration_standard_detail` joins `accreditation_certificates` through `certificates_standards` to `calibration_standards`. It answers: "Which standards are invoked under a given accreditation certificate?" For certificate `CER-2622`, the view produces two rows — one for standard `STA-2646` (`Compact Framework`, issued by `Alphabet Inc Class A`) and one for standard `STA-2649` (`Legacy Protocol`, issued by `ITT Industries`). This view is essential for auditing which standards a certificate covers.

**View `v_calibration_laboratory_accreditation_certificate`**

```sql
CREATE VIEW v_calibration_laboratory_accreditation_certificate AS
SELECT a.calibration_laboratory_id, a.laboratory_name, a.address, a.contact_phone, b.certificate_number AS certificate_certificate_number, b.issue_date AS certificate_issue_date, b.expiry_date AS certificate_expiry_date
FROM calibration_laboratories a JOIN accreditation_certificates b ON a.certificate_number = b.certificate_number;
```

| calibration_laboratory_id | laboratory_name | address | contact_phone | certificate_certificate_number | certificate_issue_date | certificate_expiry_date |
|---|---|---|---|---|---|---|
| 1 | Baseline Initiative D | distributed-address-72 | Joe Tsai | CER-2622 | 2023-02-01 | 2023-10-24 |
| 2 | Distributed Model | baseline-address-73 | Stephanie Collins | CER-2626 | 2024-07-12 | 2024-03-08 |
| 3 | Adaptive Cluster | pilot-address-74 | Tasha Rodriguez | CER-2630 | 2025-12-23 | 2025-08-19 |
| 4 | Primary Review A | extended-address-75 | Walter Pratt | CER-2634 | 2022-05-07 | 2022-01-03 |

The view `v_calibration_laboratory_accreditation_certificate` joins `calibration_laboratories` to `accreditation_certificates` via the `certificate_number` column. It answers: "What certificate does a given laboratory hold, and what are its dates and status?" A row for `Baseline Initiative D` shows certificate `CER-2622` issued on `2023-02-01` and expiring on `2023-10-24` with status `valid`. The inverse orientation of this view (lab-to-certificate rather than certificate-to-lab) supports laboratory-centric queries such as "list all certificates for a facility."

**View `v_calibration_laboratory_calibration_parameter_detail`**

```sql
CREATE VIEW v_calibration_laboratory_calibration_parameter_detail AS
SELECT a.calibration_laboratory_id, a.laboratory_name, a.address, b.calibration_parameter_id AS parameter_calibration_parameter_id, b.parameter_name AS parameter_parameter_name, b.measurement_range AS parameter_measurement_range
FROM calibration_laboratories a
  JOIN laboratories_parameters j ON j.calibration_laboratory_id = a.calibration_laboratory_id
  JOIN calibration_parameters b ON b.calibration_parameter_id = j.calibration_parameter_id;
```

| calibration_laboratory_id | laboratory_name | address | parameter_calibration_parameter_id | parameter_parameter_name | parameter_measurement_range |
|---|---|---|---|---|---|
| 1 | Baseline Initiative D | distributed-address-72 | 1 | Extended Model | primary-measurem-88 |
| 1 | Baseline Initiative D | distributed-address-72 | 2 | Pilot Cluster A | adaptive-measurem-89 |
| 2 | Distributed Model | baseline-address-73 | 2 | Pilot Cluster A | adaptive-measurem-89 |
| 2 | Distributed Model | baseline-address-73 | 3 | Baseline Review | distributed-measurem-90 |
| 3 | Adaptive Cluster | pilot-address-74 | 3 | Baseline Review | distributed-measurem-90 |
| 3 | Adaptive Cluster | pilot-address-74 | 4 | Distributed Initiative | baseline-measurem-91 |
| 4 | Primary Review A | extended-address-75 | 4 | Distributed Initiative | baseline-measurem-91 |
| 4 | Primary Review A | extended-address-75 | 1 | Extended Model | primary-measurem-88 |

The view `v_calibration_laboratory_calibration_parameter_detail` joins `calibration_laboratories` to `calibration_parameters` on `calibration_laboratory_id`. It answers: "Which calibration parameters is a laboratory qualified to perform, and what are their uncertainty and frequency characteristics?" A row for `Baseline Initiative D` shows parameter `Extended Model` with an expanded uncertainty of `17.45` and a coverage factor of `4.95`. This view is the operational report for laboratory capability assessment.

**View `v_calibration_standard_accreditation_certificate`**

```sql
CREATE VIEW v_calibration_standard_accreditation_certificate AS
SELECT a.calibration_standard_id, a.standard_identifier, a.standard_name, a.publication_year, b.certificate_number AS certificate_certificate_number, b.issue_date AS certificate_issue_date, b.expiry_date AS certificate_expiry_date
FROM calibration_standards a JOIN accreditation_certificates b ON a.certificate_number = b.certificate_number;
```

| calibration_standard_id | standard_identifier | standard_name | publication_year | certificate_certificate_number | certificate_issue_date | certificate_expiry_date |
|---|---|---|---|---|---|---|
| 1 | STA-2646 | Compact Framework | 25 | CER-2622 | 2023-02-01 | 2023-10-24 |
| 2 | STA-2649 | Legacy Protocol | 33 | CER-2626 | 2024-07-12 | 2024-03-08 |
| 3 | STA-2652 | Regional Programme A | 41 | CER-2630 | 2025-12-23 | 2025-08-19 |
| 4 | STA-2655 | Seasonal Standard | 49 | CER-2634 | 2022-05-07 | 2022-01-03 |

The view `v_calibration_standard_accreditation_certificate` joins `calibration_standards` through `certificates_standards` to `accreditation_certificates`. It answers: "Under which accreditation certificate is a given standard invoked?" For standard `STA-2646` (`Compact Framework`), the view shows it is invoked under certificate `CER-2622` issued by `integrated-accredit-88`. This view supports standard-centric auditing — for example, "list all certificates that invoke a particular standard."

**View `v_calibration_parameter_calibration_laboratory`**

```sql
CREATE VIEW v_calibration_parameter_calibration_laboratory AS
SELECT a.calibration_parameter_id, a.parameter_name, a.measurement_range, a.expanded_uncertainty, b.calibration_laboratory_id AS laboratory_calibration_laboratory_id, b.laboratory_name AS laboratory_laboratory_name, b.address AS laboratory_address
FROM calibration_parameters a JOIN calibration_laboratories b ON a.calibration_laboratory_id = b.calibration_laboratory_id;
```

| calibration_parameter_id | parameter_name | measurement_range | expanded_uncertainty | laboratory_calibration_laboratory_id | laboratory_laboratory_name | laboratory_address |
|---|---|---|---|---|---|---|
| 1 | Extended Model | primary-measurem-88 | 17.45 | 1 | Baseline Initiative D | distributed-address-72 |
| 2 | Pilot Cluster A | adaptive-measurem-89 | 20.90 | 2 | Distributed Model | baseline-address-73 |
| 3 | Baseline Review | distributed-measurem-90 | 24.35 | 3 | Adaptive Cluster | pilot-address-74 |
| 4 | Distributed Initiative | baseline-measurem-91 | 27.80 | 4 | Primary Review A | extended-address-75 |

The view `v_calibration_parameter_calibration_laboratory` joins `calibration_parameters` to `calibration_laboratories` on `calibration_laboratory_id`. It answers: "Which laboratory performs a given calibration parameter?" A row for parameter `Extended Model` shows it is performed by `Baseline Initiative D`. This view is the inverse of `v_calibration_laboratory_calibration_parameter_detail` and supports parameter-centric queries.

**View `v_calibration_parameter_calibration_standard`**

```sql
CREATE VIEW v_calibration_parameter_calibration_standard AS
SELECT a.calibration_parameter_id, a.parameter_name, a.measurement_range, a.expanded_uncertainty, b.calibration_standard_id AS standard_calibration_standard_id, b.standard_identifier AS standard_standard_identifier, b.standard_name AS standard_standard_name
FROM calibration_parameters a JOIN calibration_standards b ON a.calibration_standard_id = b.calibration_standard_id;
```

| calibration_parameter_id | parameter_name | measurement_range | expanded_uncertainty | standard_calibration_standard_id | standard_standard_identifier | standard_standard_name |
|---|---|---|---|---|---|---|
| 1 | Extended Model | primary-measurem-88 | 17.45 | 1 | STA-2646 | Compact Framework |
| 2 | Pilot Cluster A | adaptive-measurem-89 | 20.90 | 2 | STA-2649 | Legacy Protocol |
| 3 | Baseline Review | distributed-measurem-90 | 24.35 | 3 | STA-2652 | Regional Programme A |
| 4 | Distributed Initiative | baseline-measurem-91 | 27.80 | 4 | STA-2655 | Seasonal Standard |

The view `v_calibration_parameter_calibration_standard` joins `calibration_parameters` to `calibration_standards` on `calibration_standard_id`. It answers: "Which standard is a given calibration parameter accredited against?" For parameter `Extended Model`, the view shows standard `STA-2646` (`Compact Framework`, published in year 25 by `Alphabet Inc Class A`). This view is critical for compliance reporting, linking each parameter back to its governing standard.

**View `v_measurement_equipment_calibration_parameter`**

```sql
CREATE VIEW v_measurement_equipment_calibration_parameter AS
SELECT a.equipment_type, a.equipment_model, a.serial_number, a.manufacturer, b.calibration_parameter_id AS parameter_calibration_parameter_id, b.parameter_name AS parameter_parameter_name, b.measurement_range AS parameter_measurement_range
FROM measurement_equipments a JOIN calibration_parameters b ON a.calibration_parameter_id = b.calibration_parameter_id;
```

| equipment_type | equipment_model | serial_number | manufacturer | parameter_calibration_parameter_id | parameter_parameter_name | parameter_measurement_range |
|---|---|---|---|---|---|---|
| integrated-equipmen-58 | legacy-equipmen-25 | 5844275 | Standard Chartered | 1 | Extended Model | primary-measurem-88 |
| seasonal-equipmen-59 | compact-equipmen-26 | 69422 | General Motors | 2 | Pilot Cluster A | adaptive-measurem-89 |
| regional-equipmen-60 | composite-equipmen-27 | 7731874 | Column Name cannot be empty | 3 | Baseline Review | distributed-measurem-90 |
| legacy-equipmen-61 | primary-equipmen-28 | 10445632 | Financial Information Service Co. Ltd. | 4 | Distributed Initiative | baseline-measurem-91 |

The view `v_measurement_equipment_calibration_parameter` joins `measurement_equipments` to `calibration_parameters` on `calibration_parameter_id`. It answers: "Which calibration parameter is a given piece of equipment used for?" A row shows equipment with serial number `5844275` (type `integrated-equipmen-58`, manufacturer `Standard Chartered`, status `calibrated`) is used for parameter `Extended Model`. This view supports equipment capability tracking.

**View `v_measurement_equipment_calibration_laboratory`**

```sql
CREATE VIEW v_measurement_equipment_calibration_laboratory AS
SELECT a.equipment_type, a.equipment_model, a.serial_number, a.manufacturer, b.calibration_laboratory_id AS laboratory_calibration_laboratory_id, b.laboratory_name AS laboratory_laboratory_name, b.address AS laboratory_address
FROM measurement_equipments a JOIN calibration_laboratories b ON a.calibration_laboratory_id = b.calibration_laboratory_id;
```

| equipment_type | equipment_model | serial_number | manufacturer | laboratory_calibration_laboratory_id | laboratory_laboratory_name | laboratory_address |
|---|---|---|---|---|---|---|
| integrated-equipmen-58 | legacy-equipmen-25 | 5844275 | Standard Chartered | 1 | Baseline Initiative D | distributed-address-72 |
| seasonal-equipmen-59 | compact-equipmen-26 | 69422 | General Motors | 2 | Distributed Model | baseline-address-73 |
| regional-equipmen-60 | composite-equipmen-27 | 7731874 | Column Name cannot be empty | 3 | Adaptive Cluster | pilot-address-74 |
| legacy-equipmen-61 | primary-equipmen-28 | 10445632 | Financial Information Service Co. Ltd. | 4 | Primary Review A | extended-address-75 |

The view `v_measurement_equipment_calibration_laboratory` joins `measurement_equipments` to `calibration_laboratories` on `calibration_laboratory_id`. It answers: "Which laboratory owns a given piece of equipment?" Equipment serial `5844275` is owned by `Baseline Initiative D`, while serial `69422` (type `seasonal-equipmen-59`, manufacturer `General Motors`, status `pending`) is owned by `Distributed Model`. This view supports asset management and facility-level equipment inventories.

The schema as a whole embodies a clean separation between entity data and relationship data. The five core tables store attributes of certificates, laboratories, standards, parameters, and equipment. The two junction tables (`certificates_standards` and `laboratories_parameters`) capture many-to-many associations that cannot be expressed through single foreign keys. The nine views reassemble these normalised pieces into denormalised reports that map directly onto domain questions — certificate-to-laboratory traceability, standard coverage under a certificate, laboratory capability profiles, parameter-to-standard compliance, and equipment-to-parameter and equipment-to-laboratory ownership. Every join in the view layer is a deterministic reconstruction of a single domain fact from the underlying normalised tables, ensuring that the relational schema faithfully reflects the ontology of the calibration accreditation domain.