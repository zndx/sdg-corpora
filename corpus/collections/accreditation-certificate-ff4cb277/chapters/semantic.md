The accreditation ecosystem is a structured domain where certificates, organizations, scopes, calibration capabilities, and standards interlock to form a verifiable chain of technical authority. At its core, the model captures who holds an accreditation, what technical domains that accreditation covers, which calibration capabilities are exercised within each scope, and which measurement standards and accreditation standards underpin the entire arrangement. The relational schema materializes this ontology through a set of base tables linked by foreign keys and junction tables, then exposes the domain facts through a family of views that reassemble the normalized data into readable, question-driven projections.

## The Certificate as the Central Anchor

The `AccreditationCertificate` table is the primary entity. Each row represents a single accreditation certificate issued by a regulatory or standards body. Its columns encode the certificate's identity and lifecycle: `id` is the surrogate key, `certificateNumber` is the human-readable identifier (for example, `CER-2622`), `issueDate` and `expiryDate` bound the validity window, `status` records the current state (`active`, `suspended`, `revoked`, or `expired`), and `issuingBodyName` names the authority that granted the certificate. The columns `organizationPostalCode` and `scopeId` serve as early denormalized pointers to the organization and scope entities, while `createdAt` and `updatedAt` track audit timestamps.

**Table `AccreditationCertificate`**

| id | certificateNumber | issueDate | expiryDate | status | issuingBodyName | organizationPostalCode | scopeId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|---|
| 1 | CER-2622 | 2023-02-01 | 2023-10-24 | active | Extended Corridor | 9125611 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | CER-2626 | 2024-07-12 | 2024-03-08 | suspended | Pilot Series A | ChIJt4hBkzhu5kcRJJDUNqGUpso | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | CER-2630 | 2025-12-23 | 2025-08-19 | revoked | Baseline Assessment | 3001009030200 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | CER-2634 | 2022-05-07 | 2022-01-03 | expired | Distributed Survey | 4060635 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Consider the first row: certificate `CER-2622` was issued on `2023-02-01`, expires on `2023-10-24`, carries status `active`, and was issued by `Extended Corridor`. Its `scopeId` of `1000` links it to a specific accreditation scope, and its `organizationPostalCode` of `9125611` is a denormalized reference to the organization's postal code. The second row, `CER-2626`, is `suspended` and was issued by `Pilot Series A`, with `scopeId` `1001`. The third and fourth rows, `CER-2630` and `CER-2634`, carry statuses `revoked` and `expired` respectively, illustrating the full lifecycle spectrum.

## The Accredited Organization

The `AccreditedOrganization` table captures the legal and contact details of the entity that holds an accreditation. Its columns — `legalName`, `streetAddress`, `city`, `state`, `postalCode`, and `contactPhone` — describe the organization's identity and reachability. The foreign key `certificateId` ties each organization row back to exactly one certificate in `AccreditationCertificate`, enforcing a one-to-one or one-to-few relationship depending on whether an organization holds multiple certificates.

**Table `AccreditedOrganization`**

| legalName | streetAddress | city | state | postalCode | contactPhone | certificateId |
|---|---|---|---|---|---|---|
| Adaptive Model | composite-street-15 | integrated-city-34 | distributed-state-84 | 9125611 | Joe Tsai | 1 |
| Primary Cluster | primary-street-16 | seasonal-city-35 | baseline-state-85 | ChIJt4hBkzhu5kcRJJDUNqGUpso | Stephanie Collins | 2 |
| Composite Review D | adaptive-street-17 | regional-city-36 | pilot-state-86 | 3001009030200 | Tasha Rodriguez | 3 |
| Compact Initiative | distributed-street-18 | legacy-city-37 | extended-state-87 | 4060635 | Walter Pratt | 4 |

The first row associates `Adaptive Model` at `composite-street-15` in `integrated-city-34` with certificate `1` (i.e., `CER-2622`). The contact phone is listed as `Joe Tsai`. The second row, `Primary Cluster`, links to certificate `2` (`CER-2626`) and lists `Stephanie Collins` as the contact. The third and fourth rows, `Composite Review D` and `Compact Initiative`, follow the same pattern, each tied to certificates `3` and `4` respectively. The `postalCode` column in this table mirrors the `organizationPostalCode` in `AccreditationCertificate`, reflecting a denormalized design choice that avoids a direct FK from certificate to organization.

## The Accreditation Scope

The `AccreditationScope` table defines the technical boundaries of an accreditation. Each scope is identified by `scopeId` and described by `scopeTitle`, `technicalDomain`, `isOnSiteAvailable` (a boolean indicating whether on-site assessments are possible), and `scopeVersion`. The foreign key `certificateId` links the scope to its parent certificate.

**Table `AccreditationScope`**

| scopeId | scopeTitle | technicalDomain | isOnSiteAvailable | scopeVersion | certificateId |
|---|---|---|---|---|---|
| 1000 | Extended Standard | integrated-technica-58 | true | compact-scope-86 | 1 |
| 1001 | Pilot Framework A | seasonal-technica-59 | false | composite-scope-87 | 2 |
| 1002 | Baseline Protocol | regional-technica-60 | true | primary-scope-88 | 3 |
| 1003 | Distributed Programme | legacy-technica-61 | false | adaptive-scope-89 | 4 |

Scope `1000`, titled `Extended Standard`, operates in the `integrated-technica-58` domain, supports on-site assessment (`true`), and belongs to certificate `1`. Scope `1001`, `Pilot Framework A`, is in the `seasonal-technica-59` domain, does not support on-site assessment (`false`), and belongs to certificate `2`. The remaining scopes, `1002` (`Baseline Protocol`) and `1003` (`Distributed Programme`), follow the same structure, each tied to certificates `3` and `4` respectively.

## Calibration Capability and Measurement Standard

The `CalibrationCapability` table models the specific technical capabilities an organization exercises within a scope. Its columns include `id` (surrogate key), `parameterName`, `equipmentType`, `measurementRangeMin` and `measurementRangeMax` (defining the operational range), `unitOfMeasurement`, `expandedUncertaintyValue`, and `coverageFactor`. The foreign key `scopeId` links the capability to its parent `AccreditationScope`, while `standardId` links it to an `AccreditationStandard`.

**Table `CalibrationCapability`**

| id | parameterName | equipmentType | measurementRangeMin | measurementRangeMax | unitOfMeasurement | expandedUncertaintyValue | coverageFactor | scopeId | standardId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Extended Model | integrated-equipmen-58 | 6.20 | 19.20 | primary-unit-76 | 14.70 | 4.95 | 1000 | 1 |
| 2 | Pilot Cluster A | seasonal-equipmen-59 | 10.40 | 22.40 | adaptive-unit-77 | 18.40 | 8.90 | 1001 | 2 |
| 3 | Baseline Review | regional-equipmen-60 | 14.60 | 25.60 | distributed-unit-78 | 22.10 | 12.85 | 1002 | 3 |
| 4 | Distributed Initiative | legacy-equipmen-61 | 18.80 | 28.80 | baseline-unit-79 | 25.80 | 16.80 | 1003 | 4 |

Capability `1`, named `Extended Model`, uses `integrated-equipmen-58` equipment, operates in the range `6.20` to `19.20` in `primary-unit-76`, has an expanded uncertainty of `14.70` with a coverage factor of `4.95`, belongs to scope `1000`, and references standard `1`. Capability `2`, `Pilot Cluster A`, operates in the range `10.40` to `22.40` with uncertainty `18.40` and coverage factor `8.90`, belongs to scope `1001`, and references standard `2`. The remaining capabilities follow the same pattern.

The `MeasurementStandard` table captures the physical or procedural standards used for calibration. Its columns — `id`, `standardIdentifier`, `standardType`, `manufacturer`, `calibrationDueDate`, and `status` — describe the standard's identity and maintenance state. The foreign key `capabilityId` links each measurement standard to exactly one `CalibrationCapability`.

**Table `MeasurementStandard`**

| id | standardIdentifier | standardType | manufacturer | calibrationDueDate | status | capabilityId |
|---|---|---|---|---|---|---|
| 1 | STA-2646 | extended-standard-27 | Standard Chartered | 2023-06-04 | active | 1 |
| 2 | STA-2649 | integrated-standard-28 | General Motors | 2024-11-15 | out_of_service | 2 |
| 3 | STA-2652 | seasonal-standard-29 | Column Name cannot be empty | 2025-04-26 | pending_calibration | 3 |
| 4 | STA-2655 | regional-standard-30 | Financial Information Service Co. Ltd. | 2022-09-10 | active | 4 |

Measurement standard `STA-2646` is of type `extended-standard-27`, manufactured by `Standard Chartered`, due for calibration on `2023-06-04`, and has status `active`. It is linked to capability `1`. The second row, `STA-2649`, is of type `integrated-standard-28`, manufactured by `General Motors`, due on `2024-11-15`, and has status `out_of_service`. It links to capability `2`. The third and fourth rows, `STA-2652` and `STA-2655`, link to capabilities `3` and `4` respectively, with statuses `pending_calibration` and `active`.

## The Accreditation Standard

The `AccreditationStandard` table records the normative standards that govern accreditation. Its columns — `standardId`, `standardNumber`, `standardTitle`, `publicationYear`, `issuingOrganization`, and `certificateId` — describe the standard's identity and its relationship to a certificate.

**Table `AccreditationStandard`**

| standardId | standardNumber | standardTitle | publicationYear | issuingOrganization | certificateId |
|---|---|---|---|---|---|
| 1000 | STA-2752 | Primary Standard A | 25 | Alphabet Inc Class A | 1 |
| 1001 | STA-2757 | Composite Framework | 33 | ITT Industries | 2 |
| 1002 | STA-2762 | Compact Protocol | 41 | Switch Card Services Ltd. | 3 |
| 1003 | STA-2767 | Legacy Programme D | 49 | Buypass AS | 4 |

Standard `STA-2752`, titled `Primary Standard A`, was published in year `25` by `Alphabet Inc Class A` and is associated with certificate `1`. Standard `STA-2757`, `Composite Framework`, was published in year `33` by `ITT Industries` and is associated with certificate `2`. The remaining standards, `STA-2762` and `STA-2767`, follow the same pattern.

## Junction Tables and Many-to-Many Relationships

Two junction tables resolve many-to-many relationships in the domain. The `AccreditationCertificateAccreditationStandard` table links certificates to accreditation standards, allowing a single certificate to reference multiple standards and a single standard to apply across multiple certificates. The `AccreditationScopeCalibrationCapability` table links scopes to calibration capabilities, enabling a scope to encompass multiple capabilities and a capability to be shared across scopes.

**Table `AccreditationCertificateAccreditationStandard`**

| certificateId | standardId |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `AccreditationScopeCalibrationCapability`**

| scopeId | capabilityId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

These junction tables are the relational manifestation of the domain's many-to-many cardinality. Without them, the schema would be forced into a restrictive one-to-many structure that could not express the full breadth of the accreditation domain.

## Views as Domain Projections

The views in this schema are not mere convenience aliases; they are deliberate projections that answer specific domain questions by joining the normalized base tables. Each view reconstructs a coherent fact from the distributed columns of the relational model.

The view `v_accreditation_certificate_accredited_organization` joins `AccreditationCertificate` with `AccreditedOrganization` on the certificate-organization relationship, answering the question: "Which organization holds which certificate, and what are the certificate's lifecycle details?" Reading the first row of this view would show certificate `CER-2622` held by `Adaptive Model`, with status `active` and expiry date `2023-10-24`.

**View `v_accreditation_certificate_accredited_organization`**

```sql
CREATE VIEW v_accreditation_certificate_accredited_organization AS
SELECT a.id, a.certificateNumber, a.issueDate, a.expiryDate, b.legalName AS organization_legalName, b.streetAddress AS organization_streetAddress, b.city AS organization_city
FROM AccreditationCertificate a JOIN AccreditedOrganization b ON a.organizationPostalCode = b.postalCode;
```

| id | certificateNumber | issueDate | expiryDate | organization_legalName | organization_streetAddress | organization_city |
|---|---|---|---|---|---|---|
| 1 | CER-2622 | 2023-02-01 | 2023-10-24 | Adaptive Model | composite-street-15 | integrated-city-34 |
| 2 | CER-2626 | 2024-07-12 | 2024-03-08 | Primary Cluster | primary-street-16 | seasonal-city-35 |
| 3 | CER-2630 | 2025-12-23 | 2025-08-19 | Composite Review D | adaptive-street-17 | regional-city-36 |
| 4 | CER-2634 | 2022-05-07 | 2022-01-03 | Compact Initiative | distributed-street-18 | legacy-city-37 |

The view `v_accreditation_certificate_accreditation_scope` joins `AccreditationCertificate` with `AccreditationScope`, answering: "What scope does each certificate cover, and what are the scope's technical parameters?" The first row would show certificate `CER-2622` covering scope `1000` (`Extended Standard`) in the `integrated-technica-58` domain, with on-site assessment available.

**View `v_accreditation_certificate_accreditation_scope`**

```sql
CREATE VIEW v_accreditation_certificate_accreditation_scope AS
SELECT a.id, a.certificateNumber, a.issueDate, a.expiryDate, b.scopeId AS scope_scopeId, b.scopeTitle AS scope_scopeTitle, b.technicalDomain AS scope_technicalDomain
FROM AccreditationCertificate a JOIN AccreditationScope b ON a.scopeId = b.scopeId;
```

| id | certificateNumber | issueDate | expiryDate | scope_scopeId | scope_scopeTitle | scope_technicalDomain |
|---|---|---|---|---|---|---|
| 1 | CER-2622 | 2023-02-01 | 2023-10-24 | 1000 | Extended Standard | integrated-technica-58 |
| 2 | CER-2626 | 2024-07-12 | 2024-03-08 | 1001 | Pilot Framework A | seasonal-technica-59 |
| 3 | CER-2630 | 2025-12-23 | 2025-08-19 | 1002 | Baseline Protocol | regional-technica-60 |
| 4 | CER-2634 | 2022-05-07 | 2022-01-03 | 1003 | Distributed Programme | legacy-technica-61 |

The view `v_accreditation_certificate_accreditation_standard_detail` joins `AccreditationCertificate` with `AccreditationStandard` (through the junction table), answering: "Which accreditation standards apply to each certificate?" The first row would show certificate `CER-2622` governed by standard `STA-2752` (`Primary Standard A`), published in year `25` by `Alphabet Inc Class A`.

**View `v_accreditation_certificate_accreditation_standard_detail`**

```sql
CREATE VIEW v_accreditation_certificate_accreditation_standard_detail AS
SELECT a.id, a.certificateNumber, a.issueDate, b.standardId AS standard_standardId, b.standardNumber AS standard_standardNumber, b.standardTitle AS standard_standardTitle
FROM AccreditationCertificate a
  JOIN AccreditationCertificateAccreditationStandard j ON j.certificateId = a.id
  JOIN AccreditationStandard b ON b.standardId = j.standardId;
```

| id | certificateNumber | issueDate | standard_standardId | standard_standardNumber | standard_standardTitle |
|---|---|---|---|---|---|
| 1 | CER-2622 | 2023-02-01 | 1000 | STA-2752 | Primary Standard A |
| 1 | CER-2622 | 2023-02-01 | 1001 | STA-2757 | Composite Framework |
| 2 | CER-2626 | 2024-07-12 | 1001 | STA-2757 | Composite Framework |
| 2 | CER-2626 | 2024-07-12 | 1002 | STA-2762 | Compact Protocol |
| 3 | CER-2630 | 2025-12-23 | 1002 | STA-2762 | Compact Protocol |
| 3 | CER-2630 | 2025-12-23 | 1003 | STA-2767 | Legacy Programme D |
| 4 | CER-2634 | 2022-05-07 | 1003 | STA-2767 | Legacy Programme D |
| 4 | CER-2634 | 2022-05-07 | 1000 | STA-2752 | Primary Standard A |

The view `v_accredited_organization_accreditation_certificate` reverses the perspective of the first view, answering: "For a given organization, what certificates does it hold?" The first row would show `Adaptive Model` holding certificate `CER-2622`, with the certificate's issue date, expiry date, and status.

**View `v_accredited_organization_accreditation_certificate`**

```sql
CREATE VIEW v_accredited_organization_accreditation_certificate AS
SELECT a.legalName, a.streetAddress, a.city, a.state, b.id AS certificate_id, b.certificateNumber AS certificate_certificateNumber, b.issueDate AS certificate_issueDate
FROM AccreditedOrganization a JOIN AccreditationCertificate b ON a.certificateId = b.id;
```

| legalName | streetAddress | city | state | certificate_id | certificate_certificateNumber | certificate_issueDate |
|---|---|---|---|---|---|---|
| Adaptive Model | composite-street-15 | integrated-city-34 | distributed-state-84 | 1 | CER-2622 | 2023-02-01 |
| Primary Cluster | primary-street-16 | seasonal-city-35 | baseline-state-85 | 2 | CER-2626 | 2024-07-12 |
| Composite Review D | adaptive-street-17 | regional-city-36 | pilot-state-86 | 3 | CER-2630 | 2025-12-23 |
| Compact Initiative | distributed-street-18 | legacy-city-37 | extended-state-87 | 4 | CER-2634 | 2022-05-07 |

The view `v_accreditation_scope_accreditation_certificate` joins `AccreditationScope` with `AccreditationCertificate`, answering: "For a given scope, which certificate does it belong to?" The first row would show scope `1000` (`Extended Standard`) belonging to certificate `CER-2622`, with the certificate's status and issuing body.

**View `v_accreditation_scope_accreditation_certificate`**

```sql
CREATE VIEW v_accreditation_scope_accreditation_certificate AS
SELECT a.scopeId, a.scopeTitle, a.technicalDomain, a.isOnSiteAvailable, b.id AS certificate_id, b.certificateNumber AS certificate_certificateNumber, b.issueDate AS certificate_issueDate
FROM AccreditationScope a JOIN AccreditationCertificate b ON a.certificateId = b.id;
```

| scopeId | scopeTitle | technicalDomain | isOnSiteAvailable | certificate_id | certificate_certificateNumber | certificate_issueDate |
|---|---|---|---|---|---|---|
| 1000 | Extended Standard | integrated-technica-58 | true | 1 | CER-2622 | 2023-02-01 |
| 1001 | Pilot Framework A | seasonal-technica-59 | false | 2 | CER-2626 | 2024-07-12 |
| 1002 | Baseline Protocol | regional-technica-60 | true | 3 | CER-2630 | 2025-12-23 |
| 1003 | Distributed Programme | legacy-technica-61 | false | 4 | CER-2634 | 2022-05-07 |

The view `v_accreditation_scope_calibration_capability_detail` joins `AccreditationScope` with `CalibrationCapability` (through the junction table), answering: "What calibration capabilities are exercised within each scope?" The first row would show scope `1000` containing capability `1` (`Extended Model`), with its measurement range of `6.20` to `19.20` and expanded uncertainty of `14.70`.

**View `v_accreditation_scope_calibration_capability_detail`**

```sql
CREATE VIEW v_accreditation_scope_calibration_capability_detail AS
SELECT a.scopeId, a.scopeTitle, a.technicalDomain, b.id AS capability_id, b.parameterName AS capability_parameterName, b.equipmentType AS capability_equipmentType
FROM AccreditationScope a
  JOIN AccreditationScopeCalibrationCapability j ON j.scopeId = a.scopeId
  JOIN CalibrationCapability b ON b.id = j.capabilityId;
```

| scopeId | scopeTitle | technicalDomain | capability_id | capability_parameterName | capability_equipmentType |
|---|---|---|---|---|---|
| 1000 | Extended Standard | integrated-technica-58 | 1 | Extended Model | integrated-equipmen-58 |
| 1000 | Extended Standard | integrated-technica-58 | 2 | Pilot Cluster A | seasonal-equipmen-59 |
| 1001 | Pilot Framework A | seasonal-technica-59 | 2 | Pilot Cluster A | seasonal-equipmen-59 |
| 1001 | Pilot Framework A | seasonal-technica-59 | 3 | Baseline Review | regional-equipmen-60 |
| 1002 | Baseline Protocol | regional-technica-60 | 3 | Baseline Review | regional-equipmen-60 |
| 1002 | Baseline Protocol | regional-technica-60 | 4 | Distributed Initiative | legacy-equipmen-61 |
| 1003 | Distributed Programme | legacy-technica-61 | 4 | Distributed Initiative | legacy-equipmen-61 |
| 1003 | Distributed Programme | legacy-technica-61 | 1 | Extended Model | integrated-equipmen-58 |

The view `v_calibration_capability_accreditation_scope` reverses the perspective of the previous view, answering: "For a given capability, which scope does it belong to?" The first row would show capability `1` (`Extended Model`) belonging to scope `1000` (`Extended Standard`), with the scope's technical domain and on-site availability flag.

**View `v_calibration_capability_accreditation_scope`**

```sql
CREATE VIEW v_calibration_capability_accreditation_scope AS
SELECT a.id, a.parameterName, a.equipmentType, a.measurementRangeMin, b.scopeId AS scope_scopeId, b.scopeTitle AS scope_scopeTitle, b.technicalDomain AS scope_technicalDomain
FROM CalibrationCapability a JOIN AccreditationScope b ON a.scopeId = b.scopeId;
```

| id | parameterName | equipmentType | measurementRangeMin | scope_scopeId | scope_scopeTitle | scope_technicalDomain |
|---|---|---|---|---|---|---|
| 1 | Extended Model | integrated-equipmen-58 | 6.20 | 1000 | Extended Standard | integrated-technica-58 |
| 2 | Pilot Cluster A | seasonal-equipmen-59 | 10.40 | 1001 | Pilot Framework A | seasonal-technica-59 |
| 3 | Baseline Review | regional-equipmen-60 | 14.60 | 1002 | Baseline Protocol | regional-technica-60 |
| 4 | Distributed Initiative | legacy-equipmen-61 | 18.80 | 1003 | Distributed Programme | legacy-technica-61 |

The view `v_calibration_capability_measurement_standard` joins `CalibrationCapability` with `MeasurementStandard`, answering: "What measurement standard is associated with each calibration capability?" The first row would show capability `1` (`Extended Model`) using measurement standard `STA-2646`, which is of type `extended-standard-27`, manufactured by `Standard Chartered`, and currently `active`.

**View `v_calibration_capability_measurement_standard`**

```sql
CREATE VIEW v_calibration_capability_measurement_standard AS
SELECT a.id, a.parameterName, a.equipmentType, a.measurementRangeMin, b.id AS standard_id, b.standardIdentifier AS standard_standardIdentifier, b.standardType AS standard_standardType
FROM CalibrationCapability a JOIN MeasurementStandard b ON a.standardId = b.id;
```

| id | parameterName | equipmentType | measurementRangeMin | standard_id | standard_standardIdentifier | standard_standardType |
|---|---|---|---|---|---|---|
| 1 | Extended Model | integrated-equipmen-58 | 6.20 | 1 | STA-2646 | extended-standard-27 |
| 2 | Pilot Cluster A | seasonal-equipmen-59 | 10.40 | 2 | STA-2649 | integrated-standard-28 |
| 3 | Baseline Review | regional-equipmen-60 | 14.60 | 3 | STA-2652 | seasonal-standard-29 |
| 4 | Distributed Initiative | legacy-equipmen-61 | 18.80 | 4 | STA-2655 | regional-standard-30 |

The view `v_measurement_standard_calibration_capability` reverses the perspective, answering: "For a given measurement standard, which calibration capability uses it?" The first row would show standard `STA-2646` used by capability `1` (`Extended Model`), with the capability's measurement range and uncertainty values.

**View `v_measurement_standard_calibration_capability`**

```sql
CREATE VIEW v_measurement_standard_calibration_capability AS
SELECT a.id, a.standardIdentifier, a.standardType, a.manufacturer, b.id AS capability_id, b.parameterName AS capability_parameterName, b.equipmentType AS capability_equipmentType
FROM MeasurementStandard a JOIN CalibrationCapability b ON a.capabilityId = b.id;
```

| id | standardIdentifier | standardType | manufacturer | capability_id | capability_parameterName | capability_equipmentType |
|---|---|---|---|---|---|---|
| 1 | STA-2646 | extended-standard-27 | Standard Chartered | 1 | Extended Model | integrated-equipmen-58 |
| 2 | STA-2649 | integrated-standard-28 | General Motors | 2 | Pilot Cluster A | seasonal-equipmen-59 |
| 3 | STA-2652 | seasonal-standard-29 | Column Name cannot be empty | 3 | Baseline Review | regional-equipmen-60 |
| 4 | STA-2655 | regional-standard-30 | Financial Information Service Co. Ltd. | 4 | Distributed Initiative | legacy-equipmen-61 |

The view `v_accreditation_standard_accreditation_certificate` joins `AccreditationStandard` with `AccreditationCertificate` (through the junction table), answering: "For a given accreditation standard, which certificates does it govern?" The first row would show standard `STA-2752` (`Primary Standard A`) governing certificate `CER-2622`, with the certificate's status and expiry date.

**View `v_accreditation_standard_accreditation_certificate`**

```sql
CREATE VIEW v_accreditation_standard_accreditation_certificate AS
SELECT a.standardId, a.standardNumber, a.standardTitle, a.publicationYear, b.id AS certificate_id, b.certificateNumber AS certificate_certificateNumber, b.issueDate AS certificate_issueDate
FROM AccreditationStandard a JOIN AccreditationCertificate b ON a.certificateId = b.id;
```

| standardId | standardNumber | standardTitle | publicationYear | certificate_id | certificate_certificateNumber | certificate_issueDate |
|---|---|---|---|---|---|---|
| 1000 | STA-2752 | Primary Standard A | 25 | 1 | CER-2622 | 2023-02-01 |
| 1001 | STA-2757 | Composite Framework | 33 | 2 | CER-2626 | 2024-07-12 |
| 1002 | STA-2762 | Compact Protocol | 41 | 3 | CER-2630 | 2025-12-23 |
| 1003 | STA-2767 | Legacy Programme D | 49 | 4 | CER-2634 | 2022-05-07 |

## Synthesis

The schema models the accreditation domain as a network of six base tables connected by foreign keys and two junction tables that resolve many-to-many relationships. The `AccreditationCertificate` table serves as the central anchor, with `AccreditedOrganization`, `AccreditationScope`, and `AccreditationStandard` each linked directly to it. `CalibrationCapability` links to both `AccreditationScope` and `AccreditationStandard`, while `MeasurementStandard` links to `CalibrationCapability`. This structure mirrors the domain's natural hierarchy: certificates encompass scopes and standards; scopes contain capabilities; capabilities use measurement standards. The ten views then reassemble these normalized tables into projections that answer specific domain questions, each view joining 2–3 tables to reconstruct a coherent fact from the distributed columns. The result is a schema that is both rigorously normalized for data integrity and richly expressive through its view layer, allowing analysts and applications to query the accreditation ecosystem at the level of domain concepts rather than relational primitives.