The European tyre type-approval ecosystem is a tightly regulated domain where legislative instruments, corrective amendments, product specifications, and testing infrastructure interlock to ensure that every tyre placed on the market satisfies a defined set of environmental and safety criteria. At the heart of the data model sit six base tables — `Regulation`, `Corrigendum`, `TyreType`, `TestProtocol`, `TestFacility`, and `TypeApprovalAuthority` — each capturing a distinct facet of the approval lifecycle. The tables are normalised to third normal form, with foreign keys establishing referential integrity across the domain. Materialised views then reassemble the normalised facts into readable, question-oriented joins that answer the kinds of queries regulators, manufacturers, and auditors actually ask.

## The Regulation and Corrigendum Tables

**Table `Regulation`**

| regulationId | identifier | title | status | effectiveDate | issuingBody | corrigendumId | typeId | supersededByRegulationId |
|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | draft | 2025-04-08 | compact-issuing-32 | 100 | 1000 | 1 |
| 2 | IDE-2091 | Legacy Model | in_force | 2022-09-19 | composite-issuing-33 | 101 | 1001 | 2 |
| 3 | IDE-2096 | Regional Cluster A | amended | 2023-02-03 | primary-issuing-34 | 102 | 1002 | 3 |
| 4 | IDE-2101 | Seasonal Review | withdrawn | 2024-07-14 | adaptive-issuing-35 | 103 | 1003 | 4 |

The `Regulation` table is the legislative anchor of the model. Each row represents a single regulatory instrument identified by a surrogate `regulationId` (1 through 4 in the sample data) and a human-readable `identifier` such as `IDE-2086` or `IDE-2101`. The `title` column carries the common name — *Compact Initiative*, *Legacy Model*, *Regional Cluster A*, *Seasonal Review* — while `status` constrains the instrument to one of four lifecycle states: `draft`, `in_force`, `amended`, or `withdrawn`. The `effectiveDate` records when the regulation took legal effect, and `issuingBody` names the organisation that promulgated it, for example `compact-issuing-32` or `adaptive-issuing-35`.

Two foreign keys on `Regulation` link it to other base tables. The `corrigendumId` column points to a row in `Corrigendum`, establishing a one-to-one correspondence: every regulation has exactly one corrigendum record that tracks its amendment history. The `typeId` column references `TyreType`, binding the regulation to the specific tyre product category it governs. A self-referential column, `supersededByRegulationId`, creates a chain of regulatory succession — in the sample data each regulation's `supersededByRegulationId` equals its own `regulationId`, indicating that the current instrument has not yet been replaced by a later one.

**Table `Corrigendum`**

| corrigendumId | identifier | issueNumber | submissionDate | proposingEntity | status | regulationId | protocolId |
|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 24 | 2024-03-27 | composite-proposin-93 | proposed | 1 | 1 |
| 101 | IDE-2091 | 32 | 2025-08-11 | primary-proposin-94 | accepted | 2 | 2 |
| 102 | IDE-2096 | 40 | 2022-01-22 | adaptive-proposin-95 | rejected | 3 | 3 |
| 103 | IDE-2101 | 48 | 2023-06-06 | distributed-proposin-96 | implemented | 4 | 4 |

The `Corrigendum` table captures the corrective amendments that modify an existing regulation. Its primary key is `corrigendumId` (100–103), which also serves as the target of `Regulation.corrigendumId`. The `identifier` column mirrors the regulation's identifier (`IDE-2086`, `IDE-2091`, etc.), while `issueNumber` provides a sequential amendment number — 24, 32, 40, 48. The `submissionDate` records when the corrigendum was filed, and `proposingEntity` names the organisation that drafted it, such as `composite-proposin-93` or `distributed-proposin-96`. The `status` column tracks the corrigendum's disposition: `proposed`, `accepted`, `rejected`, or `implemented`.

Two additional foreign keys on `Corrigendum` extend the model. The `regulationId` column points back to `Regulation.regulationId`, completing the bidirectional link between a regulation and its corrigendum. The `protocolId` column references `TestProtocol`, connecting the amendment to the specific testing protocol that the corrigendum modifies or mandates.

## The TyreType Table

**Table `TyreType`**

| id | typeCode | manufacturerId | rollingNoiseDb | widthMm | profileIndex | loadIndex | speedRating | facilityId | authorityId | protocolId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ang | Skillz Inc. | 7.70 | 39 | 43 | 33 | integrated-speed-16 | 39800621 | 1000 | 1 |
| 1001 | 5006438 | LDAP First Name Field | 9.40 | 47 | 49 | 43 | seasonal-speed-17 | 1889772 | 1001 | 2 |
| 1002 | 10966225 | The College-Ready Promise | 11.10 | 55 | 55 | 53 | regional-speed-18 | d9d94964-8fcc-11eb-924d-9cd76263cbd0 | 1002 | 3 |
| 1003 | Q1ZVN2 | National Institute of Standards and Technology | 12.80 | 63 | 61 | 63 | legacy-speed-19 | 8843756 | 1003 | 4 |

`TyreType` is the product specification table. Each row describes a distinct tyre model with a surrogate primary key `id` (1000–1003) and a `typeCode` such as `ang` or `Q1ZVN2`. The `manufacturerId` column names the manufacturer — `Skillz Inc.`, `LDAP First Name Field`, `The College-Ready Promise`, `National Institute of Standards and Technology` — while the physical specifications are stored as numeric columns: `rollingNoiseDb` (7.70 to 12.80), `widthMm` (39 to 63), `profileIndex` (43 to 61), and `loadIndex` (33 to 63). The `speedRating` column carries a categorical code like `integrated-speed-16` or `legacy-speed-19`.

Three foreign keys on `TyreType` tie the product specification to the testing and approval infrastructure. The `facilityId` column references `TestFacility.facilityId`, indicating which test facility is associated with the tyre type. The `authorityId` column references `TypeApprovalAuthority.id`, naming the authority responsible for granting type approval. The `protocolId` column references `TestProtocol.protocolId`, binding the tyre type to the specific test protocol under which it is evaluated.

## The TestProtocol Table

**Table `TestProtocol`**

| protocolId | protocolVersion | measurementUnit | witnessingRequired | testEnvironment | temperatureCelsius | pressureBar | typeId | facilityId | regulationId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-protocol-12 | legacy-measurem-43 | true | extended-test-45 | 73.98476 | 16.45 | 1000 | 39800621 | 1 |
| 2 | baseline-protocol-13 | compact-measurem-44 | false | integrated-test-46 | 38.53310265213535 | 19.90 | 1001 | 1889772 | 2 |
| 3 | pilot-protocol-14 | composite-measurem-45 | true | seasonal-test-47 | 5.0 | 23.35 | 1002 | d9d94964-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 4 | extended-protocol-15 | primary-measurem-46 | false | regional-test-48 | 0.6 | 26.80 | 1003 | 8843756 | 4 |

`TestProtocol` defines the testing methodology applied to a tyre type. Its primary key is `protocolId` (1–4), and the `protocolVersion` column carries a descriptive version string such as `distributed-protocol-12` or `extended-protocol-15`. The `measurementUnit` column specifies the unit of measurement used during testing (`legacy-measurem-43`, `compact-measurem-44`, etc.), while `witnessingRequired` is a boolean flag — `true` for protocols 1 and 3, `false` for protocols 2 and 4. The `testEnvironment` column describes the testing environment (`extended-test-45`, `integrated-test-46`, etc.).

The physical conditions under which testing occurs are captured by `temperatureCelsius` (ranging from 0.6 to 73.98) and `pressureBar` (16.45 to 26.80). Three foreign keys on `TestProtocol` complete the model: `typeId` references `TyreType.id`, `facilityId` references `TestFacility.facilityId`, and `regulationId` references `Regulation.regulationId`. This last link creates a direct association between a test protocol and the regulation under which it operates.

## The TestFacility and TypeApprovalAuthority Tables

**Table `TestFacility`**

| facilityId | facilityName | location | certificationStatus | ownerType | protocolId | authorityId |
|---|---|---|---|---|---|---|
| 39800621 | Regional Model | extended-location-99 | approved | manufacturer | 1 | 1000 |
| 1889772 | Seasonal Cluster D | integrated-location-100 | pending | independent | 2 | 1001 |
| d9d94964-8fcc-11eb-924d-9cd76263cbd0 | Integrated Review | seasonal-location-101 | suspended | government | 3 | 1002 |
| 8843756 | Extended Initiative | regional-location-102 | approved | manufacturer | 4 | 1003 |

`TestFacility` records the physical locations where tyre testing takes place. The `facilityId` column serves as the primary key and also appears as a UUID in some rows (e.g., `d9d94964-8fcc-11eb-924d-9cd76263cbd0`). The `facilityName` column provides a human-readable name such as *Regional Model* or *Extended Initiative*, while `location` carries a descriptive location code. The `certificationStatus` column constrains the facility to one of three states: `approved`, `pending`, or `suspended`. The `ownerType` column distinguishes between `manufacturer`, `independent`, and `government` facilities.

Two foreign keys on `TestFacility` link it to the broader model. The `protocolId` column references `TestProtocol.protocolId`, and the `authorityId` column references `TypeApprovalAuthority.id`.

**Table `TypeApprovalAuthority`**

| id | authorityId | authorityName | jurisdiction | witnessingPolicy | contactEmail | typeId | facilityId | protocolId |
|---|---|---|---|---|---|---|---|---|
| 1000 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | Laurie Wallace | regional-jurisdic-30 | mandatory | Julie Chen | 1000 | 39800621 | 1 |
| 1001 | 9246308 | Stan Kroenke | legacy-jurisdic-31 | optional | Bobby Flores | 1001 | 1889772 | 2 |
| 1002 | 103176 | Collin Lopez | compact-jurisdic-32 | none | Elizabeth Woods | 1002 | d9d94964-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 1003 | 5082964 | Dana Nguyen | composite-jurisdic-33 | mandatory | Herb Simon | 1003 | 8843756 | 4 |

`TypeApprovalAuthority` is the governance table. Its surrogate primary key is `id` (1000–1003), while the `authorityId` column carries a unique identifier such as `ChIJyxw4mjhu5kcR9yl4qn8CFbo` or `9246308`. The `authorityName` column names the responsible individual — *Laurie Wallace*, *Stan Kroenke*, *Collin Lopez*, *Dana Nguyen* — and `jurisdiction` describes the regulatory scope (`regional-jurisdic-30`, `legacy-jurisdic-31`, etc.). The `witnessingPolicy` column specifies whether third-party witnessing is `mandatory`, `optional`, or `none`. The `contactEmail` column stores a contact name rather than an email address in the sample data (e.g., `Julie Chen`, `Bobby Flores`).

Three foreign keys on `TypeApprovalAuthority` — `typeId`, `facilityId`, and `protocolId` — reference `TyreType.id`, `TestFacility.facilityId`, and `TestProtocol.protocolId` respectively, completing the web of relationships that bind product specifications to testing infrastructure and regulatory oversight.

## Materialised Views: Reconstructing Domain Facts

The base tables are normalised to eliminate redundancy, but domain stakeholders need to query the data in ways that reflect their natural questions. Materialised views solve this by performing the joins that reconstruct a complete domain fact from the normalised tables. Each view is anchored on one base table and joins to its neighbours, producing a denormalised result set that can be queried directly.

### Regulation-Centric Views

**View `vw_regulation_corrigendum`**

```sql
CREATE VIEW vw_regulation_corrigendum AS
SELECT a.regulationId, a.identifier, a.title, a.status, b.corrigendumId AS corrigendum_corrigendumId, b.identifier AS corrigendum_identifier, b.issueNumber AS corrigendum_issueNumber
FROM Regulation a JOIN Corrigendum b ON a.corrigendumId = b.corrigendumId;
```

| regulationId | identifier | title | status | corrigendum_corrigendumId | corrigendum_identifier | corrigendum_issueNumber |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | draft | 100 | IDE-2086 | 24 |
| 2 | IDE-2091 | Legacy Model | in_force | 101 | IDE-2091 | 32 |
| 3 | IDE-2096 | Regional Cluster A | amended | 102 | IDE-2096 | 40 |
| 4 | IDE-2101 | Seasonal Review | withdrawn | 103 | IDE-2101 | 48 |

This view joins `Regulation` to `Corrigendum` on the one-to-one relationship between a regulation and its corrigendum. It answers the question: *What corrigendum is associated with each regulation, and what is its current status?* A representative row shows regulation `IDE-2086` (*Compact Initiative*, status `draft`) linked to corrigendum `IDE-2086` with issue number 24, submitted on `2024-03-27` by `composite-proposin-93` in `proposed` status. Another row pairs regulation `IDE-2101` (*Seasonal Review*, status `withdrawn`) with corrigendum `IDE-2101` (issue 48, status `implemented`), illustrating that even a withdrawn regulation may have an implemented corrigendum.

**View `vw_regulation_tyre_type`**

```sql
CREATE VIEW vw_regulation_tyre_type AS
SELECT a.regulationId, a.identifier, a.title, a.status, b.id AS type_id, b.typeCode AS type_typeCode, b.manufacturerId AS type_manufacturerId
FROM Regulation a JOIN TyreType b ON a.typeId = b.id;
```

| regulationId | identifier | title | status | type_id | type_typeCode | type_manufacturerId |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | draft | 1000 | ang | Skillz Inc. |
| 2 | IDE-2091 | Legacy Model | in_force | 1001 | 5006438 | LDAP First Name Field |
| 3 | IDE-2096 | Regional Cluster A | amended | 1002 | 10966225 | The College-Ready Promise |
| 4 | IDE-2101 | Seasonal Review | withdrawn | 1003 | Q1ZVN2 | National Institute of Standards and Technology |

This view joins `Regulation` to `TyreType` via the `typeId` foreign key, answering: *Which tyre type does each regulation govern, and what are its physical specifications?* The row for regulation `IDE-2086` shows it governs tyre type `ang` (manufacturer `Skillz Inc.`, rolling noise 7.70 dB, width 39 mm). The row for regulation `IDE-2101` shows it governs tyre type `Q1ZVN2` (manufacturer `National Institute of Standards and Technology`, rolling noise 12.80 dB, width 63 mm), demonstrating the range of tyre specifications covered by the regulatory framework.

**View `vw_regulation_regulation`**

```sql
CREATE VIEW vw_regulation_regulation AS
SELECT a.regulationId, a.identifier, a.title, a.status, b.regulationId AS regulation_regulationId, b.identifier AS regulation_identifier, b.title AS regulation_title
FROM Regulation a JOIN Regulation b ON a.supersededByRegulationId = b.regulationId;
```

| regulationId | identifier | title | status | regulation_regulationId | regulation_identifier | regulation_title |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | draft | 1 | IDE-2086 | Compact Initiative |
| 2 | IDE-2091 | Legacy Model | in_force | 2 | IDE-2091 | Legacy Model |
| 3 | IDE-2096 | Regional Cluster A | amended | 3 | IDE-2096 | Regional Cluster A |
| 4 | IDE-2101 | Seasonal Review | withdrawn | 4 | IDE-2101 | Seasonal Review |

This self-joining view on `Regulation` answers: *Which regulation supersedes which?* It joins `Regulation` to itself via the `supersededByRegulationId` foreign key, producing a row for each regulation that includes both its own details and the identifier of the regulation that replaces it. In the sample data, each regulation's `supersededByRegulationId` equals its own `regulationId`, indicating no supersession has occurred yet — each regulation is its own successor.

### Corrigendum-Centric Views

**View `vw_corrigendum_regulation`**

```sql
CREATE VIEW vw_corrigendum_regulation AS
SELECT a.corrigendumId, a.identifier, a.issueNumber, a.submissionDate, b.regulationId AS regulation_regulationId, b.identifier AS regulation_identifier, b.title AS regulation_title
FROM Corrigendum a JOIN Regulation b ON a.regulationId = b.regulationId;
```

| corrigendumId | identifier | issueNumber | submissionDate | regulation_regulationId | regulation_identifier | regulation_title |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 24 | 2024-03-27 | 1 | IDE-2086 | Compact Initiative |
| 101 | IDE-2091 | 32 | 2025-08-11 | 2 | IDE-2091 | Legacy Model |
| 102 | IDE-2096 | 40 | 2022-01-22 | 3 | IDE-2096 | Regional Cluster A |
| 103 | IDE-2101 | 48 | 2023-06-06 | 4 | IDE-2101 | Seasonal Review |

This view joins `Corrigendum` to `Regulation` via the `regulationId` foreign key, answering: *Which regulation does each corrigendum amend?* The row for corrigendum `IDE-2086` (issue 24, status `proposed`) links to regulation `IDE-2086` (*Compact Initiative*, status `draft`). The row for corrigendum `IDE-2101` (issue 48, status `implemented`) links to regulation `IDE-2101` (*Seasonal Review*, status `withdrawn`), showing that corrigenda can be implemented even for regulations that have since been withdrawn.

**View `vw_corrigendum_test_protocol`**

```sql
CREATE VIEW vw_corrigendum_test_protocol AS
SELECT a.corrigendumId, a.identifier, a.issueNumber, a.submissionDate, b.protocolId AS protocol_protocolId, b.protocolVersion AS protocol_protocolVersion, b.measurementUnit AS protocol_measurementUnit
FROM Corrigendum a JOIN TestProtocol b ON a.protocolId = b.protocolId;
```

| corrigendumId | identifier | issueNumber | submissionDate | protocol_protocolId | protocol_protocolVersion | protocol_measurementUnit |
|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 24 | 2024-03-27 | 1 | distributed-protocol-12 | legacy-measurem-43 |
| 101 | IDE-2091 | 32 | 2025-08-11 | 2 | baseline-protocol-13 | compact-measurem-44 |
| 102 | IDE-2096 | 40 | 2022-01-22 | 3 | pilot-protocol-14 | composite-measurem-45 |
| 103 | IDE-2101 | 48 | 2023-06-06 | 4 | extended-protocol-15 | primary-measurem-46 |

This view joins `Corrigendum` to `TestProtocol` via the `protocolId` foreign key, answering: *Which test protocol is associated with each corrigendum?* The row for corrigendum `IDE-2086` links to protocol `distributed-protocol-12` (measurement unit `legacy-measurem-43`, witnessing required, temperature 73.98 °C, pressure 16.45 bar). The row for corrigendum `IDE-2101` links to protocol `extended-protocol-15` (measurement unit `primary-measurem-46`, no witnessing required, temperature 0.6 °C, pressure 26.80 bar), illustrating the diversity of testing conditions across corrigenda.

### TyreType-Centric Views

**View `vw_tyre_type_test_facility`**

```sql
CREATE VIEW vw_tyre_type_test_facility AS
SELECT a.id, a.typeCode, a.manufacturerId, a.rollingNoiseDb, b.facilityId AS facility_facilityId, b.facilityName AS facility_facilityName, b.location AS facility_location
FROM TyreType a JOIN TestFacility b ON a.facilityId = b.facilityId;
```

| id | typeCode | manufacturerId | rollingNoiseDb | facility_facilityId | facility_facilityName | facility_location |
|---|---|---|---|---|---|---|
| 1000 | ang | Skillz Inc. | 7.70 | 39800621 | Regional Model | extended-location-99 |
| 1001 | 5006438 | LDAP First Name Field | 9.40 | 1889772 | Seasonal Cluster D | integrated-location-100 |
| 1002 | 10966225 | The College-Ready Promise | 11.10 | d9d94964-8fcc-11eb-924d-9cd76263cbd0 | Integrated Review | seasonal-location-101 |
| 1003 | Q1ZVN2 | National Institute of Standards and Technology | 12.80 | 8843756 | Extended Initiative | regional-location-102 |

This view joins `TyreType` to `TestFacility` via the `facilityId` foreign key, answering: *Which test facility is associated with each tyre type?* The row for tyre type `ang` links to facility `Regional Model` (location `extended-location-99`, status `approved`, owner `manufacturer`). The row for tyre type `10966225` links to facility `Integrated Review` (location `seasonal-location-101`, status `suspended`, owner `government`), showing that a suspended facility can still be associated with a tyre type in the data.

**View `vw_tyre_type_type_approval_authority`**

```sql
CREATE VIEW vw_tyre_type_type_approval_authority AS
SELECT a.id, a.typeCode, a.manufacturerId, a.rollingNoiseDb, b.id AS authority_id, b.authorityId AS authority_authorityId, b.authorityName AS authority_authorityName
FROM TyreType a JOIN TypeApprovalAuthority b ON a.authorityId = b.id;
```

| id | typeCode | manufacturerId | rollingNoiseDb | authority_id | authority_authorityId | authority_authorityName |
|---|---|---|---|---|---|---|
| 1000 | ang | Skillz Inc. | 7.70 | 1000 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | Laurie Wallace |
| 1001 | 5006438 | LDAP First Name Field | 9.40 | 1001 | 9246308 | Stan Kroenke |
| 1002 | 10966225 | The College-Ready Promise | 11.10 | 1002 | 103176 | Collin Lopez |
| 1003 | Q1ZVN2 | National Institute of Standards and Technology | 12.80 | 1003 | 5082964 | Dana Nguyen |

This view joins `TyreType` to `TypeApprovalAuthority` via the `authorityId` foreign key, answering: *Which authority is responsible for approving each tyre type?* The row for tyre type `ang` links to authority `ChIJyxw4mjhu5kcR9yl4qn8CFbo` (name *Laurie Wallace*, jurisdiction `regional-jurisdic-30`, witnessing policy `mandatory`, contact `Julie Chen`). The row for tyre type `10966225` links to authority `103176` (name *Collin Lopez*, jurisdiction `compact-jurisdic-32`, witnessing policy `none`, contact `Elizabeth Woods`), demonstrating the range of witnessing policies across authorities.

**View `vw_tyre_type_test_protocol`**

```sql
CREATE VIEW vw_tyre_type_test_protocol AS
SELECT a.id, a.typeCode, a.manufacturerId, a.rollingNoiseDb, b.protocolId AS protocol_protocolId, b.protocolVersion AS protocol_protocolVersion, b.measurementUnit AS protocol_measurementUnit
FROM TyreType a JOIN TestProtocol b ON a.protocolId = b.protocolId;
```

| id | typeCode | manufacturerId | rollingNoiseDb | protocol_protocolId | protocol_protocolVersion | protocol_measurementUnit |
|---|---|---|---|---|---|---|
| 1000 | ang | Skillz Inc. | 7.70 | 1 | distributed-protocol-12 | legacy-measurem-43 |
| 1001 | 5006438 | LDAP First Name Field | 9.40 | 2 | baseline-protocol-13 | compact-measurem-44 |
| 1002 | 10966225 | The College-Ready Promise | 11.10 | 3 | pilot-protocol-14 | composite-measurem-45 |
| 1003 | Q1ZVN2 | National Institute of Standards and Technology | 12.80 | 4 | extended-protocol-15 | primary-measurem-46 |

This view joins `TyreType` to `TestProtocol` via the `protocolId` foreign key, answering: *Which test protocol applies to each tyre type?* The row for tyre type `ang` links to protocol `distributed-protocol-12` (witnessing required, test environment `extended-test-45`). The row for tyre type `5006438` links to protocol `baseline-protocol-13` (witnessing not required, test environment `integrated-test-46`), showing how different tyre types are evaluated under different protocols.

### TestProtocol-Centric Views

**View `vw_test_protocol_tyre_type`**

```sql
CREATE VIEW vw_test_protocol_tyre_type AS
SELECT a.protocolId, a.protocolVersion, a.measurementUnit, a.witnessingRequired, b.id AS type_id, b.typeCode AS type_typeCode, b.manufacturerId AS type_manufacturerId
FROM TestProtocol a JOIN TyreType b ON a.typeId = b.id;
```

| protocolId | protocolVersion | measurementUnit | witnessingRequired | type_id | type_typeCode | type_manufacturerId |
|---|---|---|---|---|---|---|
| 1 | distributed-protocol-12 | legacy-measurem-43 | true | 1000 | ang | Skillz Inc. |
| 2 | baseline-protocol-13 | compact-measurem-44 | false | 1001 | 5006438 | LDAP First Name Field |
| 3 | pilot-protocol-14 | composite-measurem-45 | true | 1002 | 10966225 | The College-Ready Promise |
| 4 | extended-protocol-15 | primary-measurem-46 | false | 1003 | Q1ZVN2 | National Institute of Standards and Technology |

This view joins `TestProtocol` to `TyreType` via the `typeId` foreign key, answering: *Which tyre type is evaluated under each test protocol?* The row for protocol `distributed-protocol-12` links to tyre type `ang` (rolling noise 7.70 dB, width 39 mm). The row for protocol `extended-protocol-15` links to tyre type `Q1ZVN2` (rolling noise 12.80 dB, width 63 mm), demonstrating the mapping from testing methodology to product specification.

**View `vw_test_protocol_test_facility`**

```sql
CREATE VIEW vw_test_protocol_test_facility AS
SELECT a.protocolId, a.protocolVersion, a.measurementUnit, a.witnessingRequired, b.facilityId AS facility_facilityId, b.facilityName AS facility_facilityName, b.location AS facility_location
FROM TestProtocol a JOIN TestFacility b ON a.facilityId = b.facilityId;
```

| protocolId | protocolVersion | measurementUnit | witnessingRequired | facility_facilityId | facility_facilityName | facility_location |
|---|---|---|---|---|---|---|
| 1 | distributed-protocol-12 | legacy-measurem-43 | true | 39800621 | Regional Model | extended-location-99 |
| 2 | baseline-protocol-13 | compact-measurem-44 | false | 1889772 | Seasonal Cluster D | integrated-location-100 |
| 3 | pilot-protocol-14 | composite-measurem-45 | true | d9d94964-8fcc-11eb-924d-9cd76263cbd0 | Integrated Review | seasonal-location-101 |
| 4 | extended-protocol-15 | primary-measurem-46 | false | 8843756 | Extended Initiative | regional-location-102 |

This view joins `TestProtocol` to `TestFacility` via the `facilityId` foreign key, answering: *Which test facility conducts each protocol?* The row for protocol `distributed-protocol-12` links to facility `Regional Model` (status `approved`, owner `manufacturer`). The row for protocol `pilot-protocol-14` links to facility `Integrated Review` (status `suspended`, owner `government`), showing that protocols can be associated with facilities of varying certification statuses.

**View `vw_test_protocol_regulation`**

```sql
CREATE VIEW vw_test_protocol_regulation AS
SELECT a.protocolId, a.protocolVersion, a.measurementUnit, a.witnessingRequired, b.regulationId AS regulation_regulationId, b.identifier AS regulation_identifier, b.title AS regulation_title
FROM TestProtocol a JOIN Regulation b ON a.regulationId = b.regulationId;
```

| protocolId | protocolVersion | measurementUnit | witnessingRequired | regulation_regulationId | regulation_identifier | regulation_title |
|---|---|---|---|---|---|---|
| 1 | distributed-protocol-12 | legacy-measurem-43 | true | 1 | IDE-2086 | Compact Initiative |
| 2 | baseline-protocol-13 | compact-measurem-44 | false | 2 | IDE-2091 | Legacy Model |
| 3 | pilot-protocol-14 | composite-measurem-45 | true | 3 | IDE-2096 | Regional Cluster A |
| 4 | extended-protocol-15 | primary-measurem-46 | false | 4 | IDE-2101 | Seasonal Review |

This view joins `TestProtocol` to `Regulation` via the `regulationId` foreign key, answering: *Under which regulation does each test protocol operate?* The row for protocol `distributed-protocol-12` links to regulation `IDE-2086` (*Compact Initiative*, status `draft`). The row for protocol `extended-protocol-15` links to regulation `IDE-2101` (*Seasonal Review*, status `withdrawn`), illustrating the regulatory context of each testing protocol.

### TestFacility-Centric Views

**View `vw_test_facility_test_protocol`**

```sql
CREATE VIEW vw_test_facility_test_protocol AS
SELECT a.facilityId, a.facilityName, a.location, a.certificationStatus, b.protocolId AS protocol_protocolId, b.protocolVersion AS protocol_protocolVersion, b.measurementUnit AS protocol_measurementUnit
FROM TestFacility a JOIN TestProtocol b ON a.protocolId = b.protocolId;
```

| facilityId | facilityName | location | certificationStatus | protocol_protocolId | protocol_protocolVersion | protocol_measurementUnit |
|---|---|---|---|---|---|---|
| 39800621 | Regional Model | extended-location-99 | approved | 1 | distributed-protocol-12 | legacy-measurem-43 |
| 1889772 | Seasonal Cluster D | integrated-location-100 | pending | 2 | baseline-protocol-13 | compact-measurem-44 |
| d9d94964-8fcc-11eb-924d-9cd76263cbd0 | Integrated Review | seasonal-location-101 | suspended | 3 | pilot-protocol-14 | composite-measurem-45 |
| 8843756 | Extended Initiative | regional-location-102 | approved | 4 | extended-protocol-15 | primary-measurem-46 |

This view joins `TestFacility` to `TestProtocol` via the `protocolId` foreign key, answering: *Which test protocol is conducted at each facility?* The row for facility `Regional Model` links to protocol `distributed-protocol-12` (witnessing required, temperature 73.98 °C). The row for facility `Seasonal Cluster D` links to protocol `baseline-protocol-13` (witnessing not required, temperature 38.53 °C), showing the variety of testing conditions across facilities.

**View `vw_test_facility_type_approval_authority`**

```sql
CREATE VIEW vw_test_facility_type_approval_authority AS
SELECT a.facilityId, a.facilityName, a.location, a.certificationStatus, b.id AS authority_id, b.authorityId AS authority_authorityId, b.authorityName AS authority_authorityName
FROM TestFacility a JOIN TypeApprovalAuthority b ON a.authorityId = b.id;
```

| facilityId | facilityName | location | certificationStatus | authority_id | authority_authorityId | authority_authorityName |
|---|---|---|---|---|---|---|
| 39800621 | Regional Model | extended-location-99 | approved | 1000 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | Laurie Wallace |
| 1889772 | Seasonal Cluster D | integrated-location-100 | pending | 1001 | 9246308 | Stan Kroenke |
| d9d94964-8fcc-11eb-924d-9cd76263cbd0 | Integrated Review | seasonal-location-101 | suspended | 1002 | 103176 | Collin Lopez |
| 8843756 | Extended Initiative | regional-location-102 | approved | 1003 | 5082964 | Dana Nguyen |

This view joins `TestFacility` to `TypeApprovalAuthority` via the `authorityId` foreign key, answering: *Which authority oversees each test facility?* The row for facility `Regional Model` links to authority `ChIJyxw4mjhu5kcR9yl4qn8CFbo` (name *Laurie Wallace*, witnessing policy `mandatory`). The row for facility `Seasonal Cluster D` links to authority `9246308` (name *Stan Kroenke*, witnessing policy `optional`), demonstrating the governance structure across facilities.

### TypeApprovalAuthority-Centric Views

**View `vw_type_approval_authority_tyre_type`**

```sql
CREATE VIEW vw_type_approval_authority_tyre_type AS
SELECT a.id, a.authorityId, a.authorityName, a.jurisdiction, b.id AS type_id, b.typeCode AS type_typeCode, b.manufacturerId AS type_manufacturerId
FROM TypeApprovalAuthority a JOIN TyreType b ON a.typeId = b.id;
```

| id | authorityId | authorityName | jurisdiction | type_id | type_typeCode | type_manufacturerId |
|---|---|---|---|---|---|---|
| 1000 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | Laurie Wallace | regional-jurisdic-30 | 1000 | ang | Skillz Inc. |
| 1001 | 9246308 | Stan Kroenke | legacy-jurisdic-31 | 1001 | 5006438 | LDAP First Name Field |
| 1002 | 103176 | Collin Lopez | compact-jurisdic-32 | 1002 | 10966225 | The College-Ready Promise |
| 1003 | 5082964 | Dana Nguyen | composite-jurisdic-33 | 1003 | Q1ZVN2 | National Institute of Standards and Technology |

This view joins `TypeApprovalAuthority` to `TyreType` via the `typeId` foreign key, answering: *Which tyre types does each authority approve?* The row for authority `ChIJyxw4mjhu5kcR9yl4qn8CFbo` links to tyre type `ang` (rolling noise 7.70 dB, speed rating `integrated-speed-16`). The row for authority `5082964` links to tyre type `Q1ZVN2` (rolling noise 12.80 dB, speed rating `legacy-speed-19`), showing the range of products under each authority's purview.

**View `vw_type_approval_authority_test_facility`**

```sql
CREATE VIEW vw_type_approval_authority_test_facility AS
SELECT a.id, a.authorityId, a.authorityName, a.jurisdiction, b.facilityId AS facility_facilityId, b.facilityName AS facility_facilityName, b.location AS facility_location
FROM TypeApprovalAuthority a JOIN TestFacility b ON a.facilityId = b.facilityId;
```

| id | authorityId | authorityName | jurisdiction | facility_facilityId | facility_facilityName | facility_location |
|---|---|---|---|---|---|---|
| 1000 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | Laurie Wallace | regional-jurisdic-30 | 39800621 | Regional Model | extended-location-99 |
| 1001 | 9246308 | Stan Kroenke | legacy-jurisdic-31 | 1889772 | Seasonal Cluster D | integrated-location-100 |
| 1002 | 103176 | Collin Lopez | compact-jurisdic-32 | d9d94964-8fcc-11eb-924d-9cd76263cbd0 | Integrated Review | seasonal-location-101 |
| 1003 | 5082964 | Dana Nguyen | composite-jurisdic-33 | 8843756 | Extended Initiative | regional-location-102 |

This view joins `TypeApprovalAuthority` to `TestFacility` via the `facilityId` foreign key, answering: *Which test facilities are overseen by each authority?* The row for authority `ChIJyxw4mjhu5kcR9yl4qn8CFbo` links to facility `Regional Model` (status `approved`, owner `manufacturer`). The row for authority `103176` links to facility `Integrated Review` (status `suspended`, owner `government`), illustrating the diversity of facility types under each authority.

**View `vw_type_approval_authority_test_protocol`**

```sql
CREATE VIEW vw_type_approval_authority_test_protocol AS
SELECT a.id, a.authorityId, a.authorityName, a.jurisdiction, b.protocolId AS protocol_protocolId, b.protocolVersion AS protocol_protocolVersion, b.measurementUnit AS protocol_measurementUnit
FROM TypeApprovalAuthority a JOIN TestProtocol b ON a.protocolId = b.protocolId;
```

| id | authorityId | authorityName | jurisdiction | protocol_protocolId | protocol_protocolVersion | protocol_measurementUnit |
|---|---|---|---|---|---|---|
| 1000 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | Laurie Wallace | regional-jurisdic-30 | 1 | distributed-protocol-12 | legacy-measurem-43 |
| 1001 | 9246308 | Stan Kroenke | legacy-jurisdic-31 | 2 | baseline-protocol-13 | compact-measurem-44 |
| 1002 | 103176 | Collin Lopez | compact-jurisdic-32 | 3 | pilot-protocol-14 | composite-measurem-45 |
| 1003 | 5082964 | Dana Nguyen | composite-jurisdic-33 | 4 | extended-protocol-15 | primary-measurem-46 |

This view joins `TypeApprovalAuthority` to `TestProtocol` via the `protocolId` foreign key, answering: *Which test protocols does each authority govern?* The row for authority `ChIJyxw4mjhu5kcR9yl4qn8CFbo` links to protocol `distributed-protocol-12` (witnessing required, test environment `extended-test-45`). The row for authority `5082964` links to protocol `extended-protocol-15` (witnessing not required, test environment `regional-test-48`), completing the picture of how authorities, facilities, and protocols interlock to form the approval ecosystem.

## Synthesis

The domain model is a six-table normalised schema where every foreign key represents a real-world dependency: a regulation governs a tyre type, a corrigendum amends a regulation, a test protocol evaluates a tyre type, a test facility conducts a protocol, and a type approval authority oversees both facilities and tyre types. The materialised views reassemble these normalised facts into question-oriented joins — each view answers a single natural-language query by joining the anchored table to its neighbours. The result is a schema that is both rigorously normalised at the storage layer and immediately queryable at the presentation layer, with every row in every view traceable back to its constituent base tables through the foreign keys that bind the domain together.