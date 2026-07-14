The domain of standard weights and measures traces the lifecycle of calibration artifacts from their certification through storage, field deployment, and governmental oversight. A national metrology infrastructure maintains reference standards—physical artifacts or digital representations of units such as the kilogram or the meter—each of which must be certified, stored under controlled conditions, periodically re-verified in the field, and tracked through the chain of custody that links storage facilities, certification authorities, and government offices. The relational model captures this ecosystem as six base tables whose columns encode entity attributes and foreign-key references, and as a family of join views that reconstruct the multi-table relationships required for operational queries. Every standard weight or measure carries a unique identifier, a certification timeline, a storage location, and links to the authority that certified it, the facility that houses it, and the field standard under which it is deployed.

## The Core Entity: Standard Weights and Measures

The central entity of the model is `standard_weight_or_measures`, which records each calibration reference as a row. Its primary key is `id`, an integer surrogate, while `standard_identifier` provides a human-readable code such as `STA-2646` or `STA-2655`. The table captures the certification lifecycle through three date columns: `certification_date` records when the standard was originally certified, `last_certification_date` records the most recent certification event, and `next_certification_due_date` flags the upcoming deadline. For example, row 1 (`STA-2646`) was certified on `2025-08-01`, last certified on `2024-03-08`, and has its next certification due on `2025-08-13`. The `certification_status` column classifies the current state as `pending`, `certified`, `expired`, or `failed`, while `standard_type` distinguishes between `weight` and `measure` artifacts. The boolean `is_primary_standard` marks whether the row represents a primary reference.

The storage location is recorded in the `storage_location` column, with values such as `distributed-storage-48` or `baseline-storage-49`. Three foreign keys link this table to the other base tables: `secure_storage_facility_id` references `secure_storage_facilities`, `certification_authority_id` references `certification_authorities`, and `field_standard_id` references `field_standards`. These foreign keys establish the many-to-one relationships that allow any standard to be associated with exactly one storage facility, one certification authority, and one field standard.

**Table `standard_weight_or_measures`**

| id | standard_identifier | certification_date | last_certification_date | next_certification_due_date | storage_location | certification_status | standard_type | is_primary_standard | secure_storage_facility_id | certification_authority_id | field_standard_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | STA-2646 | 2025-08-01 | 2024-03-08 | 2025-08-13 | distributed-storage-48 | pending | weight | true | 1 | 100 | 1000 |
| 2 | STA-2649 | 2022-01-12 | 2025-08-19 | 2022-01-24 | baseline-storage-49 | certified | measure | false | 2 | 101 | 1001 |
| 3 | STA-2652 | 2023-06-23 | 2022-01-03 | 2023-06-08 | pilot-storage-50 | expired | weight | true | 3 | 102 | 1002 |
| 4 | STA-2655 | 2024-11-07 | 2023-06-14 | 2024-11-19 | extended-storage-51 | failed | measure | false | 4 | 103 | 1003 |

## Secure Storage Facilities

The `secure_storage_facilities` table models the physical or logical locations where calibration artifacts are housed. Each row is identified by `id` and `facility_identifier` (e.g., `FAC-2066`), with `facility_name` providing a descriptive label such as `Integrated Protocol A` or `Extended Programme`. The `location_description` column adds contextual detail—`Compact Initiative`, `Legacy Model`, `Regional Cluster A`—while `security_level` classifies the facility as `low`, `medium`, `high`, or `maximum`. The `access_control_policy` column stores policy identifiers like `legacy-access-61` or `compact-access-62`, and `is_authorized_for_removal` is a boolean flag indicating whether artifacts may be removed from the facility.

Two foreign keys in this table link it outward: `standard_weight_or_measure_id` references the `standard_weight_or_measures` table, and `government_office_id` references `government_offices`. The presence of `standard_weight_or_measure_id` in `secure_storage_facilities` means that each storage facility row is associated with exactly one standard weight or measure, establishing a one-to-one or one-to-many relationship depending on the cardinality constraints. In the sample data, facility `FAC-2066` (row 1) is linked to standard `STA-2646` (row 1 of `standard_weight_or_measures`) and to government office `OFF-2045` (row 1 of `government_offices`).

**Table `secure_storage_facilities`**

| id | facility_identifier | facility_name | location_description | security_level | access_control_policy | is_authorized_for_removal | standard_weight_or_measure_id | government_office_id |
|---|---|---|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | Compact Initiative | low | legacy-access-61 | false | 1 | 1 |
| 2 | FAC-2067 | Extended Programme | Legacy Model | medium | compact-access-62 | true | 2 | 2 |
| 3 | FAC-2068 | Pilot Standard | Regional Cluster A | high | composite-access-63 | false | 3 | 3 |
| 4 | FAC-2069 | Baseline Framework D | Seasonal Review | maximum | primary-access-64 | true | 4 | 4 |

## Certification Authorities

The `certification_authorities` table represents the organizations or individuals responsible for certifying standard weights and measures. Each authority has a surrogate key `id`, an `authority_identifier` such as `AUT-2570`, and an `authority_name` like `Sean Green` or `Elizabeth Woods`. The `certification_protocol` column stores the protocol used (e.g., `regional-certific-24`, `legacy-certific-25`), while `certification_frequency` is an integer indicating how often recertification occurs. The `is_federal_agency` column contains descriptive text values such as `Link Title` or `LDAP First Name Field` that indicate the agency type.

This table contains two foreign-key columns: `standard_weight_or_measure_id` references `standard_weight_or_measures`, and `issues_certification_for_standard_weight_or_measure_id` also references `standard_weight_or_measures`, creating a self-referential or cross-referential link that records which standard the authority is certifying. In the sample data, authority `AUT-2570` (row 100) is linked to standard `STA-2646` (row 1) and issues certification for standard `STA-2646` (row 1).

**Table `certification_authorities`**

| id | authority_identifier | authority_name | certification_protocol | certification_frequency | is_federal_agency | standard_weight_or_measure_id | issues_certification_for_standard_weight_or_measure_id |
|---|---|---|---|---|---|---|---|
| 100 | AUT-2570 | Sean Green | regional-certific-24 | 7 | Link Title | 1 | 1 |
| 101 | AUT-2574 | Elizabeth Woods | legacy-certific-25 | 13 | Link Title | 2 | 2 |
| 102 | AUT-2578 | Kimberly Smith | compact-certific-26 | 19 | LDAP First Name Field | 3 | 3 |
| 103 | AUT-2582 | Kimberly Smith | composite-certific-27 | 25 | Cisco Systems | 4 | 4 |

## Field Standards

The `field_standards` table captures the deployment context of standards when they are used outside the primary storage facility. Each row has an `id`, a `field_standard_identifier` such as `FIE-2227`, and a `verification_date` recording when the last verification occurred. The `verification_status` column classifies the status as `verified`, `pending`, or `failed`, while `usage_context` indicates the domain of use—`commercial`, `scientific`, or `regulatory`. The boolean `is_portable` flag indicates whether the standard can be transported, and `last_calibration_date` records the most recent calibration event.

The foreign key `standard_weight_or_measure_id` links each field standard to its parent standard weight or measure. In the sample data, field standard `FIE-2227` (row 1000) is verified, used in a `commercial` context, is not portable, and is linked to standard `STA-2646` (row 1).

**Table `field_standards`**

| id | field_standard_identifier | verification_date | verification_status | usage_context | is_portable | last_calibration_date | standard_weight_or_measure_id |
|---|---|---|---|---|---|---|---|
| 1000 | FIE-2227 | 2024-07-24 | verified | commercial | false | 2025-12-01 | 1 |
| 1001 | FIE-2234 | 2025-12-08 | pending | scientific | true | 2022-05-12 | 2 |
| 1002 | FIE-2241 | 2022-05-19 | failed | regulatory | false | 2023-10-23 | 3 |
| 1003 | FIE-2248 | 2023-10-03 | verified | commercial | true | 2024-03-07 | 4 |

## Government Offices

The `government_offices` table models the administrative bodies that oversee weights and measures activities. Its primary key is `government_office_id`, and each office has an `office_identifier` (e.g., `OFF-2045`), an `office_name` such as `Pilot Review`, an `office_type` (`executive`, `administrative`, or `regulatory`), and a `jurisdiction_level` (`state`, `commonwealth`, or `local`). The boolean `is_responsible_for_standards` indicates whether the office has direct responsibility for standards oversight.

Three foreign keys in this table link it to other entities: `standard_weight_or_measure_id` references `standard_weight_or_measures`, `secure_storage_facility_id` references `secure_storage_facilities`, and `weights_and_measures_function_id` references `weights_and_measures_functions`. In the sample data, office `OFF-2045` (row 1) is of type `executive`, operates at the `state` level, is responsible for standards, and is linked to standard `STA-2646`, facility `FAC-2066`, and function `FUN-2300`.

**Table `government_offices`**

| government_office_id | office_identifier | office_name | office_type | jurisdiction_level | is_responsible_for_standards | standard_weight_or_measure_id | secure_storage_facility_id | weights_and_measures_function_id |
|---|---|---|---|---|---|---|---|---|
| 1 | OFF-2045 | Pilot Review | executive | state | true | 1 | 1 | 1000 |
| 2 | OFF-2051 | Baseline Initiative | administrative | commonwealth | false | 2 | 2 | 1001 |
| 3 | OFF-2057 | Distributed Model A | regulatory | local | true | 3 | 3 | 1002 |
| 4 | OFF-2063 | Adaptive Cluster | executive | state | false | 4 | 4 | 1003 |

## Weights and Measures Functions

The `weights_and_measures_functions` table records operational functions—activities such as calibration, verification, or transfer—that are performed under the governance of government offices. Each function has an `id`, a `function_identifier` (e.g., `FUN-2300`), a `function_name` such as `Integrated Protocol A`, and a `function_status` (`active`, `transferred`, or `pending`). The `transfer_date` records when a function was transferred, while `original_responsible_office` and `current_responsible_office` store descriptive identifiers for the offices involved in the transfer.

Three foreign keys link this table to other entities: `government_office_id` references `government_offices`, `standard_weight_or_measure_id` references `standard_weight_or_measures`, and `field_standard_id` references `field_standards`. In the sample data, function `FUN-2300` (row 1000) is `active`, was transferred on `2025-08-12`, and is associated with government office `OFF-2045`, standard `STA-2646`, and field standard `FIE-2227`.

**Table `weights_and_measures_functions`**

| id | function_identifier | function_name | function_status | transfer_date | original_responsible_office | current_responsible_office | government_office_id | standard_weight_or_measure_id | field_standard_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | FUN-2300 | Integrated Protocol A | active | 2025-08-12 | extended-original-39 | primary-current-46 | 1 | 1 | 1000 |
| 1001 | FUN-2307 | Extended Programme | transferred | 2022-01-23 | integrated-original-40 | adaptive-current-47 | 2 | 2 | 1001 |
| 1002 | FUN-2314 | Pilot Standard | pending | 2023-06-07 | seasonal-original-41 | distributed-current-48 | 3 | 3 | 1002 |
| 1003 | FUN-2321 | Baseline Framework D | active | 2024-11-18 | regional-original-42 | baseline-current-49 | 4 | 4 | 1003 |

## Reconstructing Domain Facts Through Views

The base tables are normalized to eliminate redundancy, but operational queries often require data from multiple tables. The view layer provides pre-joined result sets that reconstruct domain facts by combining columns from two or more base tables. Each view answers a specific question about the relationship between two entities.

The `standard_weight_or_measure_secure_storage_facility_view` joins `standard_weight_or_measures` with `secure_storage_facilities` on the foreign key relationship, answering the question: "Which storage facility holds each standard?" For row 1, the view would show that standard `STA-2646` is stored at facility `FAC-2066` (`Integrated Protocol A`) with a `low` security level.

The `standard_weight_or_measure_certification_authority_view` joins `standard_weight_or_measures` with `certification_authorities`, answering: "Which authority certified each standard?" Row 1 reveals that standard `STA-2646` was certified by authority `AUT-2570` (`Sean Green`) using protocol `regional-certific-24`.

The `standard_weight_or_measure_field_standard_view` joins `standard_weight_or_measures` with `field_standards`, answering: "Under which field standard is each standard deployed?" Row 1 shows that standard `STA-2646` is deployed under field standard `FIE-2227`, which has a `verified` status and is used in a `commercial` context.

The `secure_storage_facility_standard_weight_or_measure_view` reverses the perspective, joining `secure_storage_facilities` with `standard_weight_or_measures` to answer: "Which standard is stored at each facility?" Row 1 indicates that facility `FAC-2066` (`Integrated Protocol A`) stores standard `STA-2646`.

The `secure_storage_facility_government_office_view` joins `secure_storage_facilities` with `government_offices`, answering: "Which government office oversees each storage facility?" Row 1 shows that facility `FAC-2066` is overseen by office `OFF-2045` (`Pilot Review`), an `executive` office at the `state` level.

The `certification_authority_standard_weight_or_measure_view` joins `certification_authorities` with `standard_weight_or_measures`, answering: "Which standards does each authority certify?" Row 100 reveals that authority `AUT-2570` (`Sean Green`) certifies standard `STA-2646`.

The `field_standard_standard_weight_or_measure_view` joins `field_standards` with `standard_weight_or_measures`, answering: "Which standard is associated with each field standard?" Row 1000 shows that field standard `FIE-2227` is associated with standard `STA-2646`.

The `government_office_standard_weight_or_measure_view` joins `government_offices` with `standard_weight_or_measures`, answering: "Which standards does each government office oversee?" Row 1 indicates that office `OFF-2045` (`Pilot Review`) oversees standard `STA-2646`.

The `government_office_secure_storage_facility_view` joins `government_offices` with `secure_storage_facilities`, answering: "Which storage facilities does each government office manage?" Row 1 shows that office `OFF-2045` manages facility `FAC-2066`.

The `government_office_weights_and_measures_function_view` joins `government_offices` with `weights_and_measures_functions`, answering: "Which functions does each government office perform?" Row 1 reveals that office `OFF-2045` performs function `FUN-2300` (`Integrated Protocol A`), which is currently `active`.

The `weights_and_measures_function_government_office_view` joins `weights_and_measures_functions` with `government_offices`, answering: "Which government office is responsible for each function?" Row 1000 shows that function `FUN-2300` is overseen by office `OFF-2045`.

The `weights_and_measures_function_standard_weight_or_measure_view` joins `weights_and_measures_functions` with `standard_weight_or_measures`, answering: "Which standard is associated with each function?" Row 1000 indicates that function `FUN-2300` is associated with standard `STA-2646`.

The `weights_and_measures_function_field_standard_view` joins `weights_and_measures_functions` with `field_standards`, answering: "Which field standard is involved in each function?" Row 1000 shows that function `FUN-2300` involves field standard `FIE-2227`.

## Synthesis

The relational model of the weights and measures domain achieves a clean separation between entity data and relationship data. The six base tables store atomic facts about standards, facilities, authorities, field deployments, offices, and functions. Foreign keys in `standard_weight_or_measures` point to the facility, authority, and field standard associated with each artifact, while foreign keys in the other tables point back, creating a web of bidirectional references. The view layer materializes these references as flat, queryable result sets, each answering a specific relational question by joining two tables on their shared key. This architecture allows analysts to query from any entity's perspective—starting from a standard, a facility, an authority, or a function—and reconstruct the full context of the domain fact without manually writing join clauses. The normalization ensures data integrity, while the views provide the convenience of denormalized access for operational reporting.

## Data appendix

**View `standard_weight_or_measure_secure_storage_facility_view`**

```sql
CREATE VIEW standard_weight_or_measure_secure_storage_facility_view AS
SELECT a.id, a.standard_identifier, a.certification_date, a.last_certification_date, b.id AS facility_id, b.facility_identifier AS facility_facility_identifier, b.facility_name AS facility_facility_name
FROM standard_weight_or_measures a JOIN secure_storage_facilities b ON a.secure_storage_facility_id = b.id;
```

| id | standard_identifier | certification_date | last_certification_date | facility_id | facility_facility_identifier | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | STA-2646 | 2025-08-01 | 2024-03-08 | 1 | FAC-2066 | Integrated Protocol A |
| 2 | STA-2649 | 2022-01-12 | 2025-08-19 | 2 | FAC-2067 | Extended Programme |
| 3 | STA-2652 | 2023-06-23 | 2022-01-03 | 3 | FAC-2068 | Pilot Standard |
| 4 | STA-2655 | 2024-11-07 | 2023-06-14 | 4 | FAC-2069 | Baseline Framework D |

**View `standard_weight_or_measure_certification_authority_view`**

```sql
CREATE VIEW standard_weight_or_measure_certification_authority_view AS
SELECT a.id, a.standard_identifier, a.certification_date, a.last_certification_date, b.id AS authority_id, b.authority_identifier AS authority_authority_identifier, b.authority_name AS authority_authority_name
FROM standard_weight_or_measures a JOIN certification_authorities b ON a.certification_authority_id = b.id;
```

| id | standard_identifier | certification_date | last_certification_date | authority_id | authority_authority_identifier | authority_authority_name |
|---|---|---|---|---|---|---|
| 1 | STA-2646 | 2025-08-01 | 2024-03-08 | 100 | AUT-2570 | Sean Green |
| 2 | STA-2649 | 2022-01-12 | 2025-08-19 | 101 | AUT-2574 | Elizabeth Woods |
| 3 | STA-2652 | 2023-06-23 | 2022-01-03 | 102 | AUT-2578 | Kimberly Smith |
| 4 | STA-2655 | 2024-11-07 | 2023-06-14 | 103 | AUT-2582 | Kimberly Smith |

**View `standard_weight_or_measure_field_standard_view`**

```sql
CREATE VIEW standard_weight_or_measure_field_standard_view AS
SELECT a.id, a.standard_identifier, a.certification_date, a.last_certification_date, b.id AS standard_id, b.field_standard_identifier AS standard_field_standard_identifier, b.verification_date AS standard_verification_date
FROM standard_weight_or_measures a JOIN field_standards b ON a.field_standard_id = b.id;
```

| id | standard_identifier | certification_date | last_certification_date | standard_id | standard_field_standard_identifier | standard_verification_date |
|---|---|---|---|---|---|---|
| 1 | STA-2646 | 2025-08-01 | 2024-03-08 | 1000 | FIE-2227 | 2024-07-24 |
| 2 | STA-2649 | 2022-01-12 | 2025-08-19 | 1001 | FIE-2234 | 2025-12-08 |
| 3 | STA-2652 | 2023-06-23 | 2022-01-03 | 1002 | FIE-2241 | 2022-05-19 |
| 4 | STA-2655 | 2024-11-07 | 2023-06-14 | 1003 | FIE-2248 | 2023-10-03 |

**View `secure_storage_facility_standard_weight_or_measure_view`**

```sql
CREATE VIEW secure_storage_facility_standard_weight_or_measure_view AS
SELECT a.id, a.facility_identifier, a.facility_name, a.location_description, b.id AS measure_id, b.standard_identifier AS measure_standard_identifier, b.certification_date AS measure_certification_date
FROM secure_storage_facilities a JOIN standard_weight_or_measures b ON a.standard_weight_or_measure_id = b.id;
```

| id | facility_identifier | facility_name | location_description | measure_id | measure_standard_identifier | measure_certification_date |
|---|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | Compact Initiative | 1 | STA-2646 | 2025-08-01 |
| 2 | FAC-2067 | Extended Programme | Legacy Model | 2 | STA-2649 | 2022-01-12 |
| 3 | FAC-2068 | Pilot Standard | Regional Cluster A | 3 | STA-2652 | 2023-06-23 |
| 4 | FAC-2069 | Baseline Framework D | Seasonal Review | 4 | STA-2655 | 2024-11-07 |

**View `secure_storage_facility_government_office_view`**

```sql
CREATE VIEW secure_storage_facility_government_office_view AS
SELECT a.id, a.facility_identifier, a.facility_name, a.location_description, b.government_office_id AS office_government_office_id, b.office_identifier AS office_office_identifier, b.office_name AS office_office_name
FROM secure_storage_facilities a JOIN government_offices b ON a.government_office_id = b.government_office_id;
```

| id | facility_identifier | facility_name | location_description | office_government_office_id | office_office_identifier | office_office_name |
|---|---|---|---|---|---|---|
| 1 | FAC-2066 | Integrated Protocol A | Compact Initiative | 1 | OFF-2045 | Pilot Review |
| 2 | FAC-2067 | Extended Programme | Legacy Model | 2 | OFF-2051 | Baseline Initiative |
| 3 | FAC-2068 | Pilot Standard | Regional Cluster A | 3 | OFF-2057 | Distributed Model A |
| 4 | FAC-2069 | Baseline Framework D | Seasonal Review | 4 | OFF-2063 | Adaptive Cluster |

**View `certification_authority_standard_weight_or_measure_view`**

```sql
CREATE VIEW certification_authority_standard_weight_or_measure_view AS
SELECT a.id, a.authority_identifier, a.authority_name, a.certification_protocol, b.id AS measure_id, b.standard_identifier AS measure_standard_identifier, b.certification_date AS measure_certification_date
FROM certification_authorities a JOIN standard_weight_or_measures b ON a.standard_weight_or_measure_id = b.id;
```

| id | authority_identifier | authority_name | certification_protocol | measure_id | measure_standard_identifier | measure_certification_date |
|---|---|---|---|---|---|---|
| 100 | AUT-2570 | Sean Green | regional-certific-24 | 1 | STA-2646 | 2025-08-01 |
| 101 | AUT-2574 | Elizabeth Woods | legacy-certific-25 | 2 | STA-2649 | 2022-01-12 |
| 102 | AUT-2578 | Kimberly Smith | compact-certific-26 | 3 | STA-2652 | 2023-06-23 |
| 103 | AUT-2582 | Kimberly Smith | composite-certific-27 | 4 | STA-2655 | 2024-11-07 |

**View `field_standard_standard_weight_or_measure_view`**

```sql
CREATE VIEW field_standard_standard_weight_or_measure_view AS
SELECT a.id, a.field_standard_identifier, a.verification_date, a.verification_status, b.id AS measure_id, b.standard_identifier AS measure_standard_identifier, b.certification_date AS measure_certification_date
FROM field_standards a JOIN standard_weight_or_measures b ON a.standard_weight_or_measure_id = b.id;
```

| id | field_standard_identifier | verification_date | verification_status | measure_id | measure_standard_identifier | measure_certification_date |
|---|---|---|---|---|---|---|
| 1000 | FIE-2227 | 2024-07-24 | verified | 1 | STA-2646 | 2025-08-01 |
| 1001 | FIE-2234 | 2025-12-08 | pending | 2 | STA-2649 | 2022-01-12 |
| 1002 | FIE-2241 | 2022-05-19 | failed | 3 | STA-2652 | 2023-06-23 |
| 1003 | FIE-2248 | 2023-10-03 | verified | 4 | STA-2655 | 2024-11-07 |

**View `government_office_standard_weight_or_measure_view`**

```sql
CREATE VIEW government_office_standard_weight_or_measure_view AS
SELECT a.government_office_id, a.office_identifier, a.office_name, a.office_type, b.id AS measure_id, b.standard_identifier AS measure_standard_identifier, b.certification_date AS measure_certification_date
FROM government_offices a JOIN standard_weight_or_measures b ON a.standard_weight_or_measure_id = b.id;
```

| government_office_id | office_identifier | office_name | office_type | measure_id | measure_standard_identifier | measure_certification_date |
|---|---|---|---|---|---|---|
| 1 | OFF-2045 | Pilot Review | executive | 1 | STA-2646 | 2025-08-01 |
| 2 | OFF-2051 | Baseline Initiative | administrative | 2 | STA-2649 | 2022-01-12 |
| 3 | OFF-2057 | Distributed Model A | regulatory | 3 | STA-2652 | 2023-06-23 |
| 4 | OFF-2063 | Adaptive Cluster | executive | 4 | STA-2655 | 2024-11-07 |

**View `government_office_secure_storage_facility_view`**

```sql
CREATE VIEW government_office_secure_storage_facility_view AS
SELECT a.government_office_id, a.office_identifier, a.office_name, a.office_type, b.id AS facility_id, b.facility_identifier AS facility_facility_identifier, b.facility_name AS facility_facility_name
FROM government_offices a JOIN secure_storage_facilities b ON a.secure_storage_facility_id = b.id;
```

| government_office_id | office_identifier | office_name | office_type | facility_id | facility_facility_identifier | facility_facility_name |
|---|---|---|---|---|---|---|
| 1 | OFF-2045 | Pilot Review | executive | 1 | FAC-2066 | Integrated Protocol A |
| 2 | OFF-2051 | Baseline Initiative | administrative | 2 | FAC-2067 | Extended Programme |
| 3 | OFF-2057 | Distributed Model A | regulatory | 3 | FAC-2068 | Pilot Standard |
| 4 | OFF-2063 | Adaptive Cluster | executive | 4 | FAC-2069 | Baseline Framework D |

**View `government_office_weights_and_measures_function_view`**

```sql
CREATE VIEW government_office_weights_and_measures_function_view AS
SELECT a.government_office_id, a.office_identifier, a.office_name, a.office_type, b.id AS function_id, b.function_identifier AS function_function_identifier, b.function_name AS function_function_name
FROM government_offices a JOIN weights_and_measures_functions b ON a.weights_and_measures_function_id = b.id;
```

| government_office_id | office_identifier | office_name | office_type | function_id | function_function_identifier | function_function_name |
|---|---|---|---|---|---|---|
| 1 | OFF-2045 | Pilot Review | executive | 1000 | FUN-2300 | Integrated Protocol A |
| 2 | OFF-2051 | Baseline Initiative | administrative | 1001 | FUN-2307 | Extended Programme |
| 3 | OFF-2057 | Distributed Model A | regulatory | 1002 | FUN-2314 | Pilot Standard |
| 4 | OFF-2063 | Adaptive Cluster | executive | 1003 | FUN-2321 | Baseline Framework D |

**View `weights_and_measures_function_government_office_view`**

```sql
CREATE VIEW weights_and_measures_function_government_office_view AS
SELECT a.id, a.function_identifier, a.function_name, a.function_status, b.government_office_id AS office_government_office_id, b.office_identifier AS office_office_identifier, b.office_name AS office_office_name
FROM weights_and_measures_functions a JOIN government_offices b ON a.government_office_id = b.government_office_id;
```

| id | function_identifier | function_name | function_status | office_government_office_id | office_office_identifier | office_office_name |
|---|---|---|---|---|---|---|
| 1000 | FUN-2300 | Integrated Protocol A | active | 1 | OFF-2045 | Pilot Review |
| 1001 | FUN-2307 | Extended Programme | transferred | 2 | OFF-2051 | Baseline Initiative |
| 1002 | FUN-2314 | Pilot Standard | pending | 3 | OFF-2057 | Distributed Model A |
| 1003 | FUN-2321 | Baseline Framework D | active | 4 | OFF-2063 | Adaptive Cluster |

**View `weights_and_measures_function_standard_weight_or_measure_view`**

```sql
CREATE VIEW weights_and_measures_function_standard_weight_or_measure_view AS
SELECT a.id, a.function_identifier, a.function_name, a.function_status, b.id AS measure_id, b.standard_identifier AS measure_standard_identifier, b.certification_date AS measure_certification_date
FROM weights_and_measures_functions a JOIN standard_weight_or_measures b ON a.standard_weight_or_measure_id = b.id;
```

| id | function_identifier | function_name | function_status | measure_id | measure_standard_identifier | measure_certification_date |
|---|---|---|---|---|---|---|
| 1000 | FUN-2300 | Integrated Protocol A | active | 1 | STA-2646 | 2025-08-01 |
| 1001 | FUN-2307 | Extended Programme | transferred | 2 | STA-2649 | 2022-01-12 |
| 1002 | FUN-2314 | Pilot Standard | pending | 3 | STA-2652 | 2023-06-23 |
| 1003 | FUN-2321 | Baseline Framework D | active | 4 | STA-2655 | 2024-11-07 |

**View `weights_and_measures_function_field_standard_view`**

```sql
CREATE VIEW weights_and_measures_function_field_standard_view AS
SELECT a.id, a.function_identifier, a.function_name, a.function_status, b.id AS standard_id, b.field_standard_identifier AS standard_field_standard_identifier, b.verification_date AS standard_verification_date
FROM weights_and_measures_functions a JOIN field_standards b ON a.field_standard_id = b.id;
```

| id | function_identifier | function_name | function_status | standard_id | standard_field_standard_identifier | standard_verification_date |
|---|---|---|---|---|---|---|
| 1000 | FUN-2300 | Integrated Protocol A | active | 1000 | FIE-2227 | 2024-07-24 |
| 1001 | FUN-2307 | Extended Programme | transferred | 1001 | FIE-2234 | 2025-12-08 |
| 1002 | FUN-2314 | Pilot Standard | pending | 1002 | FIE-2241 | 2022-05-19 |
| 1003 | FUN-2321 | Baseline Framework D | active | 1003 | FIE-2248 | 2023-10-03 |
