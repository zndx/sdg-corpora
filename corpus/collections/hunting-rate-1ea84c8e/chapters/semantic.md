Hunting operations in this domain revolve around the orchestration of service packages, each of which bundles together licensed services, accommodation, and rate structures into a coherent commercial offering. A hunting package is the central business entity: it carries a name such as *Legacy Standard D* or *Integrated Programme A*, a total price, a currency, a duration expressed both in nights and days, and a status that tracks whether the package is available, booked, or cancelled. Every package is anchored to a single accommodation record and may carry one or more associated hunting services, each of which in turn references a hunting licence. Rates are attached to packages with a validity window, while trophy fees are attached to individual services and vary by scoring range. The relational schema captures this hierarchy through a small set of base tables linked by foreign keys and two junction tables that resolve the one-to-many and many-to-many relationships between packages, services, and licences.

## Base tables and their entity types

The schema contains eight base tables. Six of them are entity tables that store the core domain objects; the remaining two are junction tables that materialise the relationships between packages and services.

**Table `HuntingRate`**

| id | rateId | rateType | dailyFee | currency | validFrom | validTo | packageId |
|---|---|---|---|---|---|---|---|
| 1000 | 3990179 | 1x1 | 17.12 | seasonal-currency-71 | 2025-12-17 | 2023-06-19 | 1000 |
| 1001 | 13195 | 2x1 | 17.41 | regional-currency-72 | 2022-05-01 | 2024-11-03 | 1001 |
| 1002 | 89419 | Observer | 30.51 | legacy-currency-73 | 2023-10-12 | 2025-04-14 | 1002 |
| 1003 | 6926379 | Secretary | 12.87 | compact-currency-74 | 2024-03-23 | 2022-09-25 | 1003 |

The `HuntingRate` table stores pricing information attached to a package. Each row carries a surrogate `id`, a business `rateId`, a `rateType` (for example `1x1`, `2x1`, `Observer`, or `Secretary`), a `dailyFee` expressed as a decimal, a `currency` drawn from a controlled set such as `seasonal-currency-71`, and a validity window defined by `validFrom` and `validTo`. The foreign key `packageId` ties the rate to its parent package. In the sample data, rate `3990179` of type `1x1` charges a daily fee of `17.12` in `seasonal-currency-71` and is valid from `2025-12-17` to `2023-06-19` for package `1000`. The inverted date range on this row is a data artefact rather than a modelling error — the schema itself imposes no constraint on the ordering of `validFrom` and `validTo`.

**Table `HuntingPackage`**

| packageId | packageName | totalPrice | currency | durationNights | durationDays | status | accommodationId |
|---|---|---|---|---|---|---|---|
| 1000 | Legacy Standard D | 43.48 | seasonal-currency-71 | 22 | 38 | available | 1 |
| 1001 | Regional Framework | 25.36 | regional-currency-72 | 32 | 49 | booked | 2 |
| 1002 | Seasonal Protocol | 16.11 | legacy-currency-73 | 42 | 60 | cancelled | 3 |
| 1003 | Integrated Programme A | 14.31 | compact-currency-74 | 52 | 71 | available | 4 |

The `HuntingPackage` table is the commercial hub of the domain. Its columns are `packageId` (the primary key), `packageName`, `totalPrice`, `currency`, `durationNights`, `durationDays`, `status`, and `accommodationId`. The `status` column is an enumerated attribute whose values in the sample data are `available`, `booked`, and `cancelled`. The `accommodationId` column is a foreign key pointing to the `Accommodation` table, establishing a mandatory one-to-one association: every package must have exactly one accommodation. Package `1000`, named *Legacy Standard D*, has a total price of `43.48` in `seasonal-currency-71`, lasts `22` nights and `38` days, is currently `available`, and is linked to accommodation `1`.

**Table `HuntingService`**

| serviceId | serviceName | serviceType | unitPrice | unitType | quantity | packageId | licenseId |
|---|---|---|---|---|---|---|---|
| 1 | Distributed Initiative | Shooting | 5,692 | per_day | 9 | 1000 | 1 |
| 2 | Adaptive Model D | Transport | 45,650 | per_box | 8 | 1001 | 2 |
| 3 | Primary Cluster | Staffing | 2,705 | flat_fee | 0 | 1002 | 3 |
| 4 | Composite Review | Administrative | 211.07 | per_day | 12 | 1003 | 4 |

The `HuntingService` table represents individual services that can be offered within a package. Its columns are `serviceId` (primary key), `serviceName`, `serviceType`, `unitPrice`, `unitType`, `quantity`, `packageId`, and `licenseId`. The `serviceType` is a categorical attribute with values such as `Shooting`, `Transport`, `Staffing`, and `Administrative`. The `unitType` describes the pricing granularity — `per_day`, `per_box`, or `flat_fee`. The `packageId` and `licenseId` columns are both foreign keys: `packageId` links the service to its parent package, and `licenseId` links it to a `HuntingLicense` record. Service `1`, named *Distributed Initiative*, is of type `Shooting`, costs `5,692` per `per_day`, has a quantity of `9`, belongs to package `1000`, and references licence `1`.

**Table `HuntingLicense`**

| id | licenseId | licenseType | issuingAuthority | feeAmount | issueDate | expiryDate | status |
|---|---|---|---|---|---|---|---|
| 1 | account_pymes_296 | regional-license-78 | extended-issuing-33 | 38.08 | 2023-02-01 | 2023-10-24 | pending |
| 2 | 1250199 | legacy-license-79 | integrated-issuing-34 | 18.47 | 2024-07-12 | 2024-03-08 | issued |
| 3 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | compact-license-80 | seasonal-issuing-35 | 38.08 | 2025-12-23 | 2025-08-19 | expired |
| 4 | 605958 | composite-license-81 | regional-issuing-36 | 26.25 | 2022-05-07 | 2022-01-03 | pending |

The `HuntingLicense` table stores the regulatory licences that authorise hunting activities. Its columns are `id` (surrogate primary key), `licenseId` (business identifier), `licenseType`, `issuingAuthority`, `feeAmount`, `issueDate`, `expiryDate`, and `status`. The `status` column takes values such as `pending`, `issued`, and `expired`. Licence `1` has the business identifier `account_pymes_296`, is of type `regional-license-78`, was issued by `extended-issuing-33`, carries a fee of `38.08`, was issued on `2023-02-01`, expires on `2023-10-24`, and is currently `pending`.

**Table `TrophyFee`**

| id | feeId | scoringRange | surchargeAmount | currency | appliesToTrophy | serviceId |
|---|---|---|---|---|---|---|
| 1 | 10966225 | SCI_Bronze | 4.15 | seasonal-currency-71 | adaptive-applies-29 | 1 |
| 2 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | SCI_Gold | 763.46 | regional-currency-72 | distributed-applies-30 | 2 |
| 3 | Penangguhan | SCI_Bronze | 8.17 | legacy-currency-73 | baseline-applies-31 | 3 |
| 4 | 11856350 | SCI_Gold | 0.02 | compact-currency-74 | pilot-applies-32 | 4 |

The `TrophyFee` table captures surcharges that apply to individual hunting services based on the scoring range of the trophy. Its columns are `id` (surrogate primary key), `feeId` (business identifier), `scoringRange`, `surchargeAmount`, `currency`, `appliesToTrophy`, and `serviceId`. The `scoringRange` is a categorical attribute with values like `SCI_Bronze` and `SCI_Gold`. The `appliesToTrophy` column is a descriptive attribute (not a foreign key) that indicates the trophy category, with values such as `adaptive-applies-29` and `distributed-applies-30`. The `serviceId` column is a foreign key linking the fee to its parent service. Fee `10966225` applies to service `1`, has a scoring range of `SCI_Bronze`, a surcharge of `4.15` in `seasonal-currency-71`, and applies to trophy category `adaptive-applies-29`.

**Table `Accommodation`**

| id | accommodationId | accommodationType | location | nightsIncluded | mealPlan | packageId |
|---|---|---|---|---|---|---|
| 1 | 4277036 | Hotel | extended-location-99 | 16 | Full | 1000 |
| 2 | 5917290 | Lodge | integrated-location-100 | 26 | Half | 1001 |
| 3 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Cabin | seasonal-location-101 | 36 | None | 1002 |
| 4 | 1186097 | Hotel | regional-location-102 | 46 | Full | 1003 |

The `Accommodation` table stores lodging information associated with packages. Its columns are `id` (surrogate primary key), `accommodationId` (business identifier), `accommodationType`, `location`, `nightsIncluded`, `mealPlan`, and `packageId`. The `accommodationType` takes values such as `Hotel`, `Lodge`, and `Cabin`. The `mealPlan` column is categorical with values `Full`, `Half`, and `None`. The `packageId` column is a foreign key linking the accommodation to its parent package. Accommodation `1` is a `Hotel` at `extended-location-99`, includes `16` nights, offers a `Full` meal plan, and is linked to package `1000`.

**Table `HuntingPackageHuntingService`**

| packageId | serviceId |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |

The `HuntingPackageHuntingService` table is a junction table that resolves the relationship between packages and services. Although the `HuntingService` table already carries a `packageId` foreign key, this junction table exists to support a many-to-many relationship in the conceptual model: a package can offer multiple services, and a service definition can be reused across packages. The table's columns are `id`, `packageId`, and `serviceId`, forming a composite foreign-key pair that references `HuntingPackage(packageId)` and `HuntingService(serviceId)`.

**Table `HuntingLicenseHuntingService`**

| licenseId | serviceId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `HuntingLicenseHuntingService` table is the second junction table. It resolves the relationship between licences and services. Its columns are `id`, `licenseId`, and `serviceId`, forming a composite foreign-key pair that references `HuntingLicense(licenseId)` and `HuntingService(serviceId)`. This table allows a single licence to be associated with multiple services and a single service to be covered by multiple licences.

## Foreign-key topology and cardinality

The foreign-key graph forms a star-like topology centred on `HuntingPackage`. The `HuntingPackage.accommodationId` column points to `Accommodation.id`, enforcing a mandatory one-to-one relationship: every package must have exactly one accommodation, and each accommodation row is referenced by at most one package in the current schema. The `HuntingRate.packageId` column points to `HuntingPackage.packageId`, enforcing a one-to-many relationship: a package can have multiple rate rows (for different rate types or validity periods), but each rate row belongs to exactly one package.

The `HuntingService` table has two outgoing foreign keys. Its `packageId` column points to `HuntingPackage.packageId`, enforcing a one-to-many relationship: a package can offer multiple services, but each service row belongs to exactly one package. Its `licenseId` column points to `HuntingLicense.id`, enforcing a many-to-one relationship: multiple services can reference the same licence, but each service references exactly one licence. The `TrophyFee.serviceId` column points to `HuntingService.serviceId`, enforcing a one-to-many relationship: a service can have multiple trophy fee rows (for different scoring ranges), but each fee row belongs to exactly one service.

The two junction tables, `HuntingPackageHuntingService` and `HuntingLicenseHuntingService`, sit alongside the direct foreign keys in `HuntingService`. In a fully normalised design, the `packageId` and `licenseId` columns on `HuntingService` would be removed and the junction tables would be the sole carriers of the relationship. The current schema retains both the direct FKs and the junction tables, which is a common pragmatic pattern in operational systems where the direct FK provides a quick path for single-package queries while the junction table supports the richer many-to-many semantics.

## Views and their join reconstructions

The schema provides eight views that materialise domain facts by joining the normalised tables. Each view answers a specific analytical question by denormalising the relevant portion of the graph.

**View `hunting_rate_hunting_package_view`**

```sql
CREATE VIEW hunting_rate_hunting_package_view AS
SELECT a.id, a.rateId, a.rateType, a.dailyFee, b.packageId AS package_packageId, b.packageName AS package_packageName, b.totalPrice AS package_totalPrice
FROM HuntingRate a JOIN HuntingPackage b ON a.packageId = b.packageId;
```

| id | rateId | rateType | dailyFee | package_packageId | package_packageName | package_totalPrice |
|---|---|---|---|---|---|---|
| 1000 | 3990179 | 1x1 | 17.12 | 1000 | Legacy Standard D | 43.48 |
| 1001 | 13195 | 2x1 | 17.41 | 1001 | Regional Framework | 25.36 |
| 1002 | 89419 | Observer | 30.51 | 1002 | Seasonal Protocol | 16.11 |
| 1003 | 6926379 | Secretary | 12.87 | 1003 | Integrated Programme A | 14.31 |

This view joins `HuntingRate` with `HuntingPackage` on `packageId` to present each rate alongside its parent package's commercial details. The join reconstructs the fact "this rate applies to this package" by bringing together the rate's `rateType`, `dailyFee`, and validity window with the package's `packageName`, `totalPrice`, `durationNights`, and `status`. Reading the row for rate `3990179`, the view would show that the `1x1` rate at a daily fee of `17.12` applies to package *Legacy Standard D*, which costs `43.48` in total and is currently `available`. This view answers the question: "What are the rates for each package, and what are the package's commercial attributes?"

**View `hunting_package_hunting_service_detail_view`**

```sql
CREATE VIEW hunting_package_hunting_service_detail_view AS
SELECT a.packageId, a.packageName, a.totalPrice, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName, b.serviceType AS service_serviceType
FROM HuntingPackage a
  JOIN HuntingPackageHuntingService j ON j.packageId = a.packageId
  JOIN HuntingService b ON b.serviceId = j.serviceId;
```

| packageId | packageName | totalPrice | service_serviceId | service_serviceName | service_serviceType |
|---|---|---|---|---|---|
| 1000 | Legacy Standard D | 43.48 | 1 | Distributed Initiative | Shooting |
| 1000 | Legacy Standard D | 43.48 | 2 | Adaptive Model D | Transport |
| 1001 | Regional Framework | 25.36 | 2 | Adaptive Model D | Transport |
| 1001 | Regional Framework | 25.36 | 3 | Primary Cluster | Staffing |
| 1002 | Seasonal Protocol | 16.11 | 3 | Primary Cluster | Staffing |
| 1002 | Seasonal Protocol | 16.11 | 4 | Composite Review | Administrative |
| 1003 | Integrated Programme A | 14.31 | 4 | Composite Review | Administrative |
| 1003 | Integrated Programme A | 14.31 | 1 | Distributed Initiative | Shooting |

This view joins `HuntingPackage` with `HuntingService` on `packageId` to present each service alongside its parent package. The join reconstructs the fact "this service is offered by this package" by bringing together the package's `packageName`, `totalPrice`, and `status` with the service's `serviceName`, `serviceType`, `unitPrice`, `unitType`, and `quantity`. Reading the row for service `1`, the view would show that *Distributed Initiative* (type `Shooting`, unit price `5,692` per `per_day`, quantity `9`) is offered by package *Legacy Standard D*, which costs `43.48` and is `available`. This view answers the question: "Which services does each package offer, and what are the service-level pricing details?"

**View `hunting_package_accommodation_view`**

```sql
CREATE VIEW hunting_package_accommodation_view AS
SELECT a.packageId, a.packageName, a.totalPrice, a.currency, b.id AS accommodation_id, b.accommodationId AS accommodation_accommodationId, b.accommodationType AS accommodation_accommodationType
FROM HuntingPackage a JOIN Accommodation b ON a.accommodationId = b.id;
```

| packageId | packageName | totalPrice | currency | accommodation_id | accommodation_accommodationId | accommodation_accommodationType |
|---|---|---|---|---|---|---|
| 1000 | Legacy Standard D | 43.48 | seasonal-currency-71 | 1 | 4277036 | Hotel |
| 1001 | Regional Framework | 25.36 | regional-currency-72 | 2 | 5917290 | Lodge |
| 1002 | Seasonal Protocol | 16.11 | legacy-currency-73 | 3 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Cabin |
| 1003 | Integrated Programme A | 14.31 | compact-currency-74 | 4 | 1186097 | Hotel |

This view joins `HuntingPackage` with `Accommodation` on `accommodationId` to present each package alongside its lodging details. The join reconstructs the fact "this package includes this accommodation" by bringing together the package's `packageName`, `totalPrice`, and `durationNights` with the accommodation's `accommodationType`, `location`, `nightsIncluded`, and `mealPlan`. Reading the row for package `1000`, the view would show that *Legacy Standard D* includes a `Hotel` at `extended-location-99` with `16` nights and a `Full` meal plan, and that the package itself lasts `22` nights with a total price of `43.48`. This view answers the question: "What accommodation is included in each package, and how does the package duration compare to the nights included?"

**View `hunting_service_hunting_package_view`**

```sql
CREATE VIEW hunting_service_hunting_package_view AS
SELECT a.serviceId, a.serviceName, a.serviceType, a.unitPrice, b.packageId AS package_packageId, b.packageName AS package_packageName, b.totalPrice AS package_totalPrice
FROM HuntingService a JOIN HuntingPackage b ON a.packageId = b.packageId;
```

| serviceId | serviceName | serviceType | unitPrice | package_packageId | package_packageName | package_totalPrice |
|---|---|---|---|---|---|---|
| 1 | Distributed Initiative | Shooting | 5,692 | 1000 | Legacy Standard D | 43.48 |
| 2 | Adaptive Model D | Transport | 45,650 | 1001 | Regional Framework | 25.36 |
| 3 | Primary Cluster | Staffing | 2,705 | 1002 | Seasonal Protocol | 16.11 |
| 4 | Composite Review | Administrative | 211.07 | 1003 | Integrated Programme A | 14.31 |

This view joins `HuntingService` with `HuntingPackage` on `packageId` to present each service alongside its parent package. Structurally similar to `hunting_package_hunting_service_detail_view`, this view reverses the join perspective: it starts from the service and surfaces the package context. The join reconstructs the same fact — "this service belongs to this package" — but the column ordering and naming convention signal a service-centric query. Reading the row for service `2`, *Adaptive Model D* (type `Transport`, unit price `45,650` per `per_box`), the view would show that it belongs to package *Regional Framework*, which costs `25.36`, lasts `32` nights, and has a `booked` status. This view answers the question: "For each service, what is the parent package and its status?"

**View `hunting_service_hunting_license_view`**

```sql
CREATE VIEW hunting_service_hunting_license_view AS
SELECT a.serviceId, a.serviceName, a.serviceType, a.unitPrice, b.id AS license_id, b.licenseId AS license_licenseId, b.licenseType AS license_licenseType
FROM HuntingService a JOIN HuntingLicense b ON a.licenseId = b.id;
```

| serviceId | serviceName | serviceType | unitPrice | license_id | license_licenseId | license_licenseType |
|---|---|---|---|---|---|---|
| 1 | Distributed Initiative | Shooting | 5,692 | 1 | account_pymes_296 | regional-license-78 |
| 2 | Adaptive Model D | Transport | 45,650 | 2 | 1250199 | legacy-license-79 |
| 3 | Primary Cluster | Staffing | 2,705 | 3 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | compact-license-80 |
| 4 | Composite Review | Administrative | 211.07 | 4 | 605958 | composite-license-81 |

This view joins `HuntingService` with `HuntingLicense` on `licenseId` to present each service alongside its authorising licence. The join reconstructs the fact "this service is authorised by this licence" by bringing together the service's `serviceName`, `serviceType`, and `unitPrice` with the licence's `licenseId`, `licenseType`, `issuingAuthority`, `feeAmount`, `issueDate`, `expiryDate`, and `status`. Reading the row for service `1`, the view would show that *Distributed Initiative* is authorised by licence `account_pymes_296` (type `regional-license-78`, issued by `extended-issuing-33`, fee `38.08`, status `pending`). This view answers the question: "Which licence authorises each service, and what are the licence's regulatory details?"

**View `hunting_license_hunting_service_detail_view`**

```sql
CREATE VIEW hunting_license_hunting_service_detail_view AS
SELECT a.id, a.licenseId, a.licenseType, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName, b.serviceType AS service_serviceType
FROM HuntingLicense a
  JOIN HuntingLicenseHuntingService j ON j.licenseId = a.id
  JOIN HuntingService b ON b.serviceId = j.serviceId;
```

| id | licenseId | licenseType | service_serviceId | service_serviceName | service_serviceType |
|---|---|---|---|---|---|
| 1 | account_pymes_296 | regional-license-78 | 1 | Distributed Initiative | Shooting |
| 1 | account_pymes_296 | regional-license-78 | 2 | Adaptive Model D | Transport |
| 2 | 1250199 | legacy-license-79 | 2 | Adaptive Model D | Transport |
| 2 | 1250199 | legacy-license-79 | 3 | Primary Cluster | Staffing |
| 3 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | compact-license-80 | 3 | Primary Cluster | Staffing |
| 3 | ChIJm7V_gxFu5kcRAbqaOJHQUy0 | compact-license-80 | 4 | Composite Review | Administrative |
| 4 | 605958 | composite-license-81 | 4 | Composite Review | Administrative |
| 4 | 605958 | composite-license-81 | 1 | Distributed Initiative | Shooting |

This view joins `HuntingLicense` with `HuntingService` on `licenseId` to present each licence alongside its associated services. Structurally similar to `hunting_service_hunting_license_view`, this view reverses the join perspective: it starts from the licence and surfaces the service context. The join reconstructs the same fact — "this licence covers this service" — but the column ordering signals a licence-centric query. Reading the row for licence `1`, the view would show that licence `account_pymes_296` (type `regional-license-78`, status `pending`, fee `38.08`) covers service `1`, *Distributed Initiative* (type `Shooting`, unit price `5,692`). This view answers the question: "For each licence, which services does it authorise, and what are the service-level details?"

**View `trophy_fee_hunting_service_view`**

```sql
CREATE VIEW trophy_fee_hunting_service_view AS
SELECT a.id, a.feeId, a.scoringRange, a.surchargeAmount, b.serviceId AS service_serviceId, b.serviceName AS service_serviceName, b.serviceType AS service_serviceType
FROM TrophyFee a JOIN HuntingService b ON a.serviceId = b.serviceId;
```

| id | feeId | scoringRange | surchargeAmount | service_serviceId | service_serviceName | service_serviceType |
|---|---|---|---|---|---|---|
| 1 | 10966225 | SCI_Bronze | 4.15 | 1 | Distributed Initiative | Shooting |
| 2 | c7474e2c-8fcc-11eb-924d-9cd76263cbd0 | SCI_Gold | 763.46 | 2 | Adaptive Model D | Transport |
| 3 | Penangguhan | SCI_Bronze | 8.17 | 3 | Primary Cluster | Staffing |
| 4 | 11856350 | SCI_Gold | 0.02 | 4 | Composite Review | Administrative |

This view joins `TrophyFee` with `HuntingService` on `serviceId` to present each trophy fee alongside its parent service. The join reconstructs the fact "this trophy surcharge applies to this service" by bringing together the fee's `scoringRange`, `surchargeAmount`, and `currency` with the service's `serviceName`, `serviceType`, `unitPrice`, and `unitType`. Reading the row for fee `10966225`, the view would show that the `SCI_Bronze` surcharge of `4.15` in `seasonal-currency-71` applies to service `1`, *Distributed Initiative* (type `Shooting`, unit price `5,692` per `per_day`). This view answers the question: "What trophy surcharges apply to each service, and what are the service's pricing details?"

**View `accommodation_hunting_package_view`**

```sql
CREATE VIEW accommodation_hunting_package_view AS
SELECT a.id, a.accommodationId, a.accommodationType, a.location, b.packageId AS package_packageId, b.packageName AS package_packageName, b.totalPrice AS package_totalPrice
FROM Accommodation a JOIN HuntingPackage b ON a.packageId = b.packageId;
```

| id | accommodationId | accommodationType | location | package_packageId | package_packageName | package_totalPrice |
|---|---|---|---|---|---|---|
| 1 | 4277036 | Hotel | extended-location-99 | 1000 | Legacy Standard D | 43.48 |
| 2 | 5917290 | Lodge | integrated-location-100 | 1001 | Regional Framework | 25.36 |
| 3 | 9229485c-9bad-11eb-a8a2-19ed5c03f8d3 | Cabin | seasonal-location-101 | 1002 | Seasonal Protocol | 16.11 |
| 4 | 1186097 | Hotel | regional-location-102 | 1003 | Integrated Programme A | 14.31 |

This view joins `Accommodation` with `HuntingPackage` on `packageId` to present each accommodation alongside its parent package. Structurally similar to `hunting_package_accommodation_view`, this view reverses the join perspective: it starts from the accommodation and surfaces the package context. The join reconstructs the same fact — "this accommodation is included in this package" — but the column ordering signals an accommodation-centric query. Reading the row for accommodation `1`, the view would show that the `Hotel` at `extended-location-99` (with `16` nights and a `Full` meal plan) is included in package *Legacy Standard D*, which costs `43.48`, lasts `22` nights, and is `available`. This view answers the question: "For each accommodation, which package includes it, and what are the package's commercial attributes?"

## Closing synthesis

The schema models the hunting domain as a hierarchy of commercial entities anchored on `HuntingPackage`. Rates, services, and accommodations are child entities linked by foreign keys, while trophy fees are grandchildren linked through services. The two junction tables, `HuntingPackageHuntingService` and `HuntingLicenseHuntingService`, provide a many-to-many overlay on top of the direct foreign-key relationships, enabling the same service or licence to be referenced from multiple packages or from multiple licences. The eight views denormalise specific subgraphs of this schema to answer concrete business questions: rate composition, service offerings, accommodation inclusion, licence authorisation, and trophy surcharges. Each view's join is a lossless reconstruction of a domain fact — no information is created or lost, only reorganised from the normalised base tables into a flat, query-ready form.