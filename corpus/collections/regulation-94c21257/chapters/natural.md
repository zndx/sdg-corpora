## Regulatory Frameworks and Tyre Certification

The certification of tyres within regulated markets depends on a structured ecosystem of rules, amendments, testing standards, and oversight bodies. At the centre of this ecosystem sit the regulations themselves — formal instruments that define what must be tested, how it must be tested, and by whom. Each regulation carries a unique identifier, a title, a status reflecting its current standing, and metadata about its issuing body and effective date. The regulatory lifecycle is further shaped by corrigenda, which propose, accept, reject, or implement changes to existing rules. Understanding how these elements interlock requires examining the records that capture every stage of this process, from initial drafting through final enforcement.

**Table `Regulation`**

| regulationId | identifier | title | status | effectiveDate | issuingBody | corrigendumId | typeId | supersededByRegulationId |
|---|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Compact Initiative | draft | 2025-04-08 | compact-issuing-32 | 100 | 1000 | 1 |
| 2 | IDE-2091 | Legacy Model | in_force | 2022-09-19 | composite-issuing-33 | 101 | 1001 | 2 |
| 3 | IDE-2096 | Regional Cluster A | amended | 2023-02-03 | primary-issuing-34 | 102 | 1002 | 3 |
| 4 | IDE-2101 | Seasonal Review | withdrawn | 2024-07-14 | adaptive-issuing-35 | 103 | 1003 | 4 |

The regulation table records four distinct instruments, each at a different point in its lifecycle. The Compact Initiative (IDE-2086) remains in draft status, having been issued on 2025-04-08 by compact-issuing-32, while the Legacy Model (IDE-2091) holds in_force status under composite-issuing-33 since 2022-09-19. Regional Cluster A (IDE-2096), issued by primary-issuing-34, carries an amended designation, and the Seasonal Review (IDE-2101) has been withdrawn by adaptive-issuing-35 as of 2024-07-14. Each regulation references a specific tyre type and may point to a superseding regulation, creating a chain of precedence that practitioners must navigate when determining which standards apply to a given product.

**Table `Corrigendum`**

| corrigendumId | identifier | issueNumber | submissionDate | proposingEntity | status | regulationId | protocolId |
|---|---|---|---|---|---|---|---|
| 100 | IDE-2086 | 24 | 2024-03-27 | composite-proposin-93 | proposed | 1 | 1 |
| 101 | IDE-2091 | 32 | 2025-08-11 | primary-proposin-94 | accepted | 2 | 2 |
| 102 | IDE-2096 | 40 | 2022-01-22 | adaptive-proposin-95 | rejected | 3 | 3 |
| 103 | IDE-2101 | 48 | 2023-06-06 | distributed-proposin-96 | implemented | 4 | 4 |

Corrigenda serve as the mechanism through which regulations evolve. The corrigendum table captures four entries, each tied to a regulation and a test protocol. Corrigendum IDE-2086, submitted on 2024-03-27 by composite-proposin-93 as issue number 24, remains in proposed status and links to regulation 1 and protocol 1. Corrigendum IDE-2091 (issue 32, accepted, submitted 2025-08-11 by primary-proposin-94) connects regulation 2 with protocol 2. Corrigendum IDE-2096 (issue 40, rejected, submitted 2022-01-22 by adaptive-proposin-95) ties to regulation 3 and protocol 3, while corrigendum IDE-2101 (issue 48, implemented, submitted 2023-06-06 by distributed-proposin-96) binds regulation 4 to protocol 4. The status field — proposed, accepted, rejected, or implemented — signals the maturity of each amendment and its readiness for enforcement.

**Table `TyreType`**

| id | typeCode | manufacturerId | rollingNoiseDb | widthMm | profileIndex | loadIndex | speedRating | facilityId | authorityId | protocolId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ang | Skillz Inc. | 7.70 | 39 | 43 | 33 | integrated-speed-16 | 39800621 | 1000 | 1 |
| 1001 | 5006438 | LDAP First Name Field | 9.40 | 47 | 49 | 43 | seasonal-speed-17 | 1889772 | 1001 | 2 |
| 1002 | 10966225 | The College-Ready Promise | 11.10 | 55 | 55 | 53 | regional-speed-18 | d9d94964-8fcc-11eb-924d-9cd76263cbd0 | 1002 | 3 |
| 1003 | Q1ZVN2 | National Institute of Standards and Technology | 12.80 | 63 | 61 | 63 | legacy-speed-19 | 8843756 | 1003 | 4 |

Tyre types represent the physical products subject to regulatory scrutiny. Each entry encodes a type code, a manufacturer identifier, and a suite of performance specifications including rolling noise measured in decibels, width in millimetres, profile index, load index, and a speed rating. The ang type produced by Skillz Inc. registers a rolling noise of 7.70 dB with a width of 39 mm and an integrated-speed-16 rating. The 5006438 type, attributed to LDAP First Name Field, shows 9.40 dB noise at 47 mm width with a seasonal-speed-17 rating. The 10966225 type from The College-Ready Promise reaches 11.10 dB at 55 mm width under regional-speed-18, while Q1ZVN2 from the National Institute of Standards and Technology records the highest noise level at 12.80 dB, with a width of 63 mm and a legacy-speed-19 rating. Each tyre type is associated with a test facility, a type approval authority, and a test protocol, forming the operational backbone of the certification chain.

**Table `TestProtocol`**

| protocolId | protocolVersion | measurementUnit | witnessingRequired | testEnvironment | temperatureCelsius | pressureBar | typeId | facilityId | regulationId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | distributed-protocol-12 | legacy-measurem-43 | true | extended-test-45 | 73.98476 | 16.45 | 1000 | 39800621 | 1 |
| 2 | baseline-protocol-13 | compact-measurem-44 | false | integrated-test-46 | 38.53310265213535 | 19.90 | 1001 | 1889772 | 2 |
| 3 | pilot-protocol-14 | composite-measurem-45 | true | seasonal-test-47 | 5.0 | 23.35 | 1002 | d9d94964-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 4 | extended-protocol-15 | primary-measurem-46 | false | regional-test-48 | 0.6 | 26.80 | 1003 | 8843756 | 4 |

Test protocols define the methodology by which tyre types are evaluated. The protocol table stores four entries, each specifying a version identifier, a measurement unit, whether witnessing is required, the test environment classification, and precise environmental conditions including temperature in Celsius and pressure in bar. Protocol distributed-protocol-12 mandates witnessing, operates under extended-test-45 conditions at 73.98°C and 16.45 bar, and links to tyre type 1000, facility 39800621, and regulation 1. Protocol baseline-protocol-13 does not require witnessing, uses integrated-test-46 at 38.53°C and 19.90 bar, and connects to tyre type 1001, facility 1889772, and regulation 2. Protocol pilot-protocol-14 requires witnessing under seasonal-test-47 at 5.0°C and 23.35 bar, associated with tyre type 1002, facility d9d94964-8fcc-11eb-924d-9cd76263cbd0, and regulation 3. Protocol extended-protocol-15, without witnessing, applies regional-test-48 conditions at 0.6°C and 26.80 bar, tied to tyre type 1003, facility 8843756, and regulation 4.

**Table `TestFacility`**

| facilityId | facilityName | location | certificationStatus | ownerType | protocolId | authorityId |
|---|---|---|---|---|---|---|
| 39800621 | Regional Model | extended-location-99 | approved | manufacturer | 1 | 1000 |
| 1889772 | Seasonal Cluster D | integrated-location-100 | pending | independent | 2 | 1001 |
| d9d94964-8fcc-11eb-924d-9cd76263cbd0 | Integrated Review | seasonal-location-101 | suspended | government | 3 | 1002 |
| 8843756 | Extended Initiative | regional-location-102 | approved | manufacturer | 4 | 1003 |

Test facilities are the physical or organisational entities where tyre testing occurs. The facility table records four entries, each with a name, location, certification status, owner type, and links to a protocol and authority. Regional Model (facility 39800621) operates from extended-location-99, holds approved status, is owned by a manufacturer, and is linked to protocol 1 and authority 1000. Seasonal Cluster D (facility 1889772) resides at integrated-location-100 with pending status under independent ownership, connected to protocol 2 and authority 1001. Integrated Review (facility d9d94964-8fcc-11eb-924d-9cd76263cbd0) is located at seasonal-location-101, carries suspended status, is government-owned, and ties to protocol 3 and authority 1002. Extended Initiative (facility 8843756) operates from regional-location-102 with approved manufacturer ownership, linked to protocol 4 and authority 1003. The certification status — approved, pending, or suspended — directly affects whether a facility may legally conduct tests for regulatory compliance.

**Table `TypeApprovalAuthority`**

| id | authorityId | authorityName | jurisdiction | witnessingPolicy | contactEmail | typeId | facilityId | protocolId |
|---|---|---|---|---|---|---|---|---|
| 1000 | ChIJyxw4mjhu5kcR9yl4qn8CFbo | Laurie Wallace | regional-jurisdic-30 | mandatory | Julie Chen | 1000 | 39800621 | 1 |
| 1001 | 9246308 | Stan Kroenke | legacy-jurisdic-31 | optional | Bobby Flores | 1001 | 1889772 | 2 |
| 1002 | 103176 | Collin Lopez | compact-jurisdic-32 | none | Elizabeth Woods | 1002 | d9d94964-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 1003 | 5082964 | Dana Nguyen | composite-jurisdic-33 | mandatory | Herb Simon | 1003 | 8843756 | 4 |

Type approval authorities provide the regulatory oversight necessary for certification. The authority table contains four entries, each with an authority identifier, a named individual, a jurisdiction, a witnessing policy, and a contact email. Authority 1000, held by Laurie Wallace under regional-jurisdic-30, enforces a mandatory witnessing policy and can be reached at Julie Chen's email; it oversees tyre type 1000, facility 39800621, and protocol 1. Authority 1001, held by Stan Kroenke under legacy-jurisdic-31, applies an optional witnessing policy with Bobby Flores as contact, covering tyre type 1001, facility 1889772, and protocol 2. Authority 1002, held by Collin Lopez under compact-jurisdic-32, has no witnessing policy, with Elizabeth Woods as contact, and manages tyre type 1002, facility d9d94964-8fcc-11eb-924d-9cd76263cbd0, and protocol 3. Authority 1003, held by Dana Nguyen under composite-jurisdic-33, requires mandatory witnessing, contacts Herb Simon, and governs tyre type 1003, facility 8843756, and protocol 4.

### Regulatory and Corrigendum Relationships

The relationship between regulations and their corrigenda forms the primary axis of regulatory evolution. A corrigendum does not exist in isolation; it modifies, clarifies, or supersedes a specific regulation, and its lifecycle status determines whether the underlying rule has been altered.

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

This view joins regulations with their associated corrigenda, answering the question of which amendments apply to which rules. Reading the first row reveals that regulation IDE-2086 (Compact Initiative, draft) is linked to corrigendum IDE-2086 (issue 24, proposed), indicating that an amendment is under consideration but not yet enacted. The second row shows regulation IDE-2091 (Legacy Model, in_force) paired with corrigendum IDE-2091 (issue 32, accepted), meaning the amendment has been formally received and is progressing toward implementation. The third row pairs regulation IDE-2096 (Regional Cluster A, amended) with corrigendum IDE-2096 (issue 40, rejected), signalling that a proposed change was declined. The fourth row connects regulation IDE-2101 (Seasonal Review, withdrawn) with corrigendum IDE-2101 (issue 48, implemented), showing a fully enacted amendment despite the regulation's withdrawn status.

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

This self-referential view captures the supersession chain among regulations. Each row maps a regulation to the regulation that replaced it, enabling practitioners to trace the lineage of regulatory requirements. When a regulation carries a non-null supersededByRegulationId, the join produces a row linking the older rule to its successor. This is essential for determining which version of a standard applies to a given tyre type at a given time, particularly when regulations have been withdrawn or amended.

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

Reversing the perspective, this view starts from corrigenda and resolves their target regulations. It answers the practical question: given a corrigendum, which regulation does it modify? The first row shows corrigendum IDE-2086 (issue 24, proposed) targeting regulation IDE-2086 (Compact Initiative, draft), issued by compact-issuing-32. The second row links corrigendum IDE-2091 (issue 32, accepted) to regulation IDE-2091 (Legacy Model, in_force), issued by composite-issuing-33. The third row connects corrigendum IDE-2096 (issue 40, rejected) with regulation IDE-2096 (Regional Cluster A, amended), issued by primary-issuing-34. The fourth row ties corrigendum IDE-2101 (issue 48, implemented) to regulation IDE-2101 (Seasonal Review, withdrawn), issued by adaptive-issuing-35. This view is particularly useful for compliance officers who receive corrigenda and need to understand their regulatory context.

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

Corrigenda are also linked to test protocols, establishing which testing methodology is affected by each amendment. This view joins corrigenda with their associated protocols, revealing the operational impact of regulatory changes. Corrigendum IDE-2086 (issue 24, proposed) maps to protocol distributed-protocol-12, which requires witnessing and operates at 73.98°C. Corrigendum IDE-2091 (issue 32, accepted) maps to protocol baseline-protocol-13, which does not require witnessing and operates at 38.53°C. Corrigendum IDE-2096 (issue 40, rejected) maps to protocol pilot-protocol-14, requiring witnessing at 5.0°C. Corrigendum IDE-2101 (issue 48, implemented) maps to protocol extended-protocol-15, without witnessing at 0.6°C. This linkage ensures that when a corrigendum is implemented, the correct testing methodology is applied.

### Tyre Type Ecosystem

Tyre types sit at the intersection of manufacturing, testing, and regulation. Each type carries physical specifications, is assigned to a test facility, overseen by a type approval authority, and evaluated under a specific test protocol. Understanding these relationships is critical for manufacturers seeking certification and for authorities conducting oversight.

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

This view connects tyre types to their designated test facilities. The first row shows tyre type ang (Skillz Inc., 7.70 dB noise, 39 mm width) assigned to facility Regional Model (39800621), which holds approved status and is manufacturer-owned. The second row links tyre type 5006438 (LDAP First Name Field, 9.40 dB, 47 mm) to facility Seasonal Cluster D (1889772), with pending status and independent ownership. The third row associates tyre type 10966225 (The College-Ready Promise, 11.10 dB, 55 mm) with facility Integrated Review (d9d94964-8fcc-11eb-924d-9cd76263cbd0), which is suspended and government-owned. The fourth row ties tyre type Q1ZVN2 (NIST, 12.80 dB, 63 mm) to facility Extended Initiative (8843756), approved and manufacturer-owned. The certification status of the facility directly affects whether the tyre type can be tested there for regulatory purposes.

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

This view maps tyre types to their overseeing type approval authorities. Tyre type ang falls under authority 1000 (Laurie Wallace, regional-jurisdic-30, mandatory witnessing). Tyre type 5006438 is overseen by authority 1001 (Stan Kroenke, legacy-jurisdic-31, optional witnessing). Tyre type 10966225 is managed by authority 1002 (Collin Lopez, compact-jurisdic-32, no witnessing policy). Tyre type Q1ZVN2 is governed by authority 1003 (Dana Nguyen, composite-jurisdic-33, mandatory witnessing). The witnessing policy determines whether an authority representative must be present during testing, which has significant implications for scheduling, cost, and transparency.

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

This view links tyre types to the test protocols under which they are evaluated. Tyre type ang is tested under distributed-protocol-12, which requires witnessing, uses legacy-measurem-43 units, and operates at 73.98°C and 16.45 bar. Tyre type 5006438 follows baseline-protocol-13, which does not require witnessing, uses compact-measurem-44 units, and operates at 38.53°C and 19.90 bar. Tyre type 10966225 is assessed under pilot-protocol-14, requiring witnessing, using composite-measurem-45 units, at 5.0°C and 23.35 bar. Tyre type Q1ZVN2 follows extended-protocol-15, without witnessing, using primary-measurem-46 units, at 0.6°C and 26.80 bar. The environmental conditions and witnessing requirements vary substantially across protocols, reflecting the diversity of testing scenarios.

### Test Protocol and Facility Coordination

Test protocols and test facilities form the operational core of the certification process. Protocols define the methodology; facilities provide the physical infrastructure. Their relationship determines whether a given test can be conducted, where, and under what conditions.

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

This view resolves the tyre types associated with each test protocol. Protocol distributed-protocol-12 evaluates tyre type ang (7.70 dB noise, 39 mm width, integrated-speed-16). Protocol baseline-protocol-13 evaluates tyre type 5006438 (9.40 dB, 47 mm, seasonal-speed-17). Protocol pilot-protocol-14 evaluates tyre type 10966225 (11.10 dB, 55 mm, regional-speed-18). Protocol extended-protocol-15 evaluates tyre type Q1ZVN2 (12.80 dB, 63 mm, legacy-speed-19). This mapping is essential for understanding which tyres are subject to which testing standards and for planning test schedules across facilities.

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

This view connects test protocols to their designated test facilities. Protocol distributed-protocol-12 is conducted at facility Regional Model (39800621), an approved manufacturer-owned site at extended-location-99. Protocol baseline-protocol-13 is conducted at facility Seasonal Cluster D (1889772), a pending independent site at integrated-location-100. Protocol pilot-protocol-14 is conducted at facility Integrated Review (d9d94964-8fcc-11eb-924d-9cd76263cbd0), a suspended government-owned site at seasonal-location-101. Protocol extended-protocol-15 is conducted at facility Extended Initiative (8843756), an approved manufacturer-owned site at regional-location-102. The facility's certification status is a critical factor: suspended facilities cannot legally conduct tests, which may create bottlenecks in the certification pipeline.

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

This view links test protocols to the regulations they serve. Protocol distributed-protocol-12 supports regulation IDE-2086 (Compact Initiative, draft), issued by compact-issuing-32. Protocol baseline-protocol-13 supports regulation IDE-2091 (Legacy Model, in_force), issued by composite-issuing-33. Protocol pilot-protocol-14 supports regulation IDE-2096 (Regional Cluster A, amended), issued by primary-issuing-34. Protocol extended-protocol-15 supports regulation IDE-2101 (Seasonal Review, withdrawn), issued by adaptive-issuing-35. This relationship ensures that testing is always aligned with the applicable regulatory framework, even when regulations are in draft, amended, or withdrawn states.

### Test Facility and Authority Oversight

Test facilities operate under the supervision of type approval authorities, creating a chain of accountability from the physical testing site to the regulatory body. This relationship ensures that testing is conducted by qualified entities under appropriate oversight.

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

This view maps test facilities to the protocols they execute. Facility Regional Model (39800621, approved, manufacturer-owned) executes protocol distributed-protocol-12, which requires witnessing at 73.98°C. Facility Seasonal Cluster D (1889772, pending, independent-owned) executes protocol baseline-protocol-13, which does not require witnessing at 38.53°C. Facility Integrated Review (d9d94964-8fcc-11eb-924d-9cd76263cbd0, suspended, government-owned) executes protocol pilot-protocol-14, requiring witnessing at 5.0°C. Facility Extended Initiative (8843756, approved, manufacturer-owned) executes protocol extended-protocol-15, without witnessing at 0.6°C. The combination of facility status and protocol requirements determines operational feasibility.

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

This view connects test facilities to their overseeing type approval authorities. Facility Regional Model (39800621) is overseen by authority 1000 (Laurie Wallace, regional-jurisdic-30, mandatory witnessing). Facility Seasonal Cluster D (1889772) is overseen by authority 1001 (Stan Kroenke, legacy-jurisdic-31, optional witnessing). Facility Integrated Review (d9d94964-8fcc-11eb-924d-9cd76263cbd0) is overseen by authority 1002 (Collin Lopez, compact-jurisdic-32, no witnessing). Facility Extended Initiative (8843756) is overseen by authority 1003 (Dana Nguyen, composite-jurisdic-33, mandatory witnessing). This oversight relationship ensures that each facility operates within the jurisdictional and procedural requirements of its authority.

### Type Approval Authority Governance

Type approval authorities sit at the apex of the certification hierarchy, overseeing tyre types, test facilities, and test protocols within their jurisdictions. Their policies and decisions shape the entire certification landscape.

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

This view maps type approval authorities to the tyre types they oversee. Authority 1000 (Laurie Wallace, regional-jurisdic-30, mandatory witnessing) oversees tyre type ang (Skillz Inc., 7.70 dB, 39 mm, integrated-speed-16). Authority 1001 (Stan Kroenke, legacy-jurisdic-31, optional witnessing) oversees tyre type 5006438 (LDAP First Name Field, 9.40 dB, 47 mm, seasonal-speed-17). Authority 1002 (Collin Lopez, compact-jurisdic-32, no witnessing) oversees tyre type 10966225 (The College-Ready Promise, 11.10 dB, 55 mm, regional-speed-18). Authority 1003 (Dana Nguyen, composite-jurisdic-33, mandatory witnessing) oversees tyre type Q1ZVN2 (NIST, 12.80 dB, 63 mm, legacy-speed-19). The witnessing policy of each authority directly influences the testing process for the tyre types under their purview.

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

This view links type approval authorities to the test facilities they supervise. Authority 1000 (Laurie Wallace) supervises facility Regional Model (39800621, approved, manufacturer-owned, extended-location-99). Authority 1001 (Stan Kroenke) supervises facility Seasonal Cluster D (1889772, pending, independent-owned, integrated-location-100). Authority 1002 (Collin Lopez) supervises facility Integrated Review (d9d94964-8fcc-11eb-924d-9cd76263cbd0, suspended, government-owned, seasonal-location-101). Authority 1003 (Dana Nguyen) supervises facility Extended Initiative (8843756, approved, manufacturer-owned, regional-location-102). The facility's certification status — approved, pending, or suspended — reflects the authority's assessment of its compliance and operational readiness.

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

This view connects type approval authorities to the test protocols they govern. Authority 1000 (Laurie Wallace, mandatory witnessing) governs protocol distributed-protocol-12, which requires witnessing, uses legacy-measurem-43 units, and operates at 73.98°C and 16.45 bar. Authority 1001 (Stan Kroenke, optional witnessing) governs protocol baseline-protocol-13, which does not require witnessing, uses compact-measurem-44 units, and operates at 38.53°C and 19.90 bar. Authority 1002 (Collin Lopez, no witnessing) governs protocol pilot-protocol-14, requiring witnessing, using composite-measurem-45 units, at 5.0°C and 23.35 bar. Authority 1003 (Dana Nguyen, mandatory witnessing) governs protocol extended-protocol-15, without witnessing, using primary-measurem-46 units, at 0.6°C and 26.80 bar. The interplay between authority policy and protocol requirements creates a complex but structured certification environment.

### Synthesis

The tyre certification ecosystem is a tightly interwoven network of regulations, corrigenda, tyre types, test protocols, test facilities, and type approval authorities. Each element carries specific attributes — identifiers, statuses, measurements, and relationships — that together determine whether a tyre can be legally certified for market. Regulations define the rules; corrigenda modify them; tyre types embody the products; test protocols specify the methods; test facilities provide the venues; and type approval authorities enforce the standards. The views derived from these tables answer practical questions: which corrigendum affects which regulation, which facility tests which tyre type, which authority oversees which protocol. Practitioners who understand these relationships can navigate the certification process with precision, ensuring compliance while managing the operational realities of testing schedules, facility availability, and regulatory status changes.

## Data appendix

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
