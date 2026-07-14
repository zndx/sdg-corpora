## Ontology-Grounded Relational Modelling of the Custom Back Assembly Domain

The custom back assembly domain captures the end-to-end lifecycle of ergonomically engineered back supports, from provider account registration through manufacturing order placement to the physical composition of each assembly. A single `CustomBackAssembly` carries dimensional specifications—`shellWidth`, `shellHeight`, `shellDepth`—and a lifecycle `status` that progresses through `pending`, `confirmed`, `manufacturing`, and `shipped`. Each assembly is associated with a `ProviderAccount` (e.g. `ACC-2253` for "Primary Initiative A") and may be referenced by one or more `ManufacturingOrder` records such as `ORD-2138` or `ORD-2141`. The physical anatomy of an assembly is decomposed into `AirCellPlacement` entities—each identified by a `cellId` like `557` or `790489` and described by a `profileType` (`1_INCH`, `LOW_PROFILE`, `MID_PROFILE`, `HIGH_PROFILE`) along with grid coordinates (`gridRow`, `gridColumn`)—and `AirCompartment` entities such as the `lumbar`, `thoracic`, `sacral`, and `general` compartments, each with an `isAdjustable` flag and a `valveLocation` (`bottom_left`, `bottom_right`, `bottom_center`, `custom`). The relational schema materialises this ontology through five base tables, four junction tables, and nine denormalised views, each join reconstructing a domain fact from the normalised core.

### Base Entity Tables

The five base tables encode the principal entity types of the ontology. The `CustomBackAssembly` table anchors the product model.

**Table `CustomBackAssembly`**

| assemblyId | shellWidth | shellHeight | shellDepth | status | orderReference | manufactureLeadTime | accountId |
|---|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 | 0.07499999 | pending | extended-order-93 | 14 | 1000 |
| bss | 0.4827489 | 0.74 | 0.69 | confirmed | integrated-order-94 | 18 | 1001 |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 | 0.13 | manufacturing | seasonal-order-95 | 22 | 1002 |
| 8928501 | 0.59 | 0.6 | 0.6000001 | shipped | regional-order-96 | 26 | 1003 |

Every row carries a surrogate `assemblyId` (e.g. `lu_tax_code_template_b_VB-IC-0`, `bss`, `9222f51a-9bad-11eb-a8a2-19ed5c03f8d3`, `8928501`), three floating-point dimensions, a `status` drawn from the finite set {`pending`, `confirmed`, `manufacturing`, `shipped`}, an `orderReference` string, a `manufactureLeadTime` in days, and a foreign key `accountId` pointing to `ProviderAccount`. The `AirCellPlacement` table records individual air-cell inserts.

**Table `AirCellPlacement`**

| id | cellId | profileType | widthCm | heightCm | gridRow | gridColumn | assemblyId |
|---|---|---|---|---|---|---|---|
| 1 | 557 | 1_INCH | 0.7 | 0.615 | 46 | 11 | lu_tax_code_template_b_VB-IC-0 |
| 2 | 790489 | LOW_PROFILE | 0.48 | 0.6 | 55 | 17 | bss |
| 3 | 10445644 | MID_PROFILE | 1.2 | 1.52 | 64 | 23 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | 1186089 | HIGH_PROFILE | 0.98 | 1.33 | 73 | 29 | 8928501 |

Each placement is identified by a numeric `id` and a `cellId`, classified by `profileType`, sized in centimetres (`widthCm`, `heightCm`), positioned on a grid (`gridRow`, `gridColumn`), and linked to its parent assembly via `assemblyId`. The `AirCompartment` table captures macro-level compartments.

**Table `AirCompartment`**

| compartmentId | compartmentName | isAdjustable | valveLocation | assemblyId | createdAt | updatedAt |
|---|---|---|---|---|---|---|
| 4543 | lumbar | false | bottom_left | lu_tax_code_template_b_VB-IC-0 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 168558 | thoracic | true | bottom_right | bss | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | sacral | false | bottom_center | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 727061 | general | true | custom | 8928501 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

A compartment row carries a `compartmentId`, a human-readable `compartmentName` (`lumbar`, `thoracic`, `sacral`, `general`), a boolean `isAdjustable`, a `valveLocation`, timestamps (`createdAt`, `updatedAt`), and the same `assemblyId` foreign key. The `ProviderAccount` table stores the external-facing provider information.

**Table `ProviderAccount`**

| accountId | accountNumber | providerName | addressLine1 | addressLine2 | city | state | zipCode | country | phone | email |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ACC-2253 | Primary Initiative A | adaptive-address-77 | regional-address-90 | integrated-city-34 | distributed-state-84 | 69434 | compact-country-26 | compact-phone-26 | seasonal-email-11 |
| 1001 | ACC-2256 | Composite Model | distributed-address-78 | legacy-address-91 | seasonal-city-35 | baseline-state-85 | 13589 | composite-country-27 | composite-phone-27 | regional-email-12 |
| 1002 | ACC-2259 | Compact Cluster | baseline-address-79 | compact-address-92 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | primary-country-28 | primary-phone-28 | legacy-email-13 |
| 1003 | ACC-2262 | Legacy Review D | pilot-address-80 | composite-address-93 | legacy-city-37 | extended-state-87 | 1250214 | adaptive-country-29 | adaptive-phone-29 | compact-email-14 |

Each account has a surrogate `accountId` (1000–1003), a business-facing `accountNumber` (`ACC-2253` through `ACC-2262`), a `providerName`, address fields (`addressLine1`, `addressLine2`, `city`, `state`, `zipCode`, `country`), and contact details (`phone`, `email`). The `ManufacturingOrder` table records the commercial side of the domain.

**Table `ManufacturingOrder`**

| orderId | orderNumber | orderDate | orderType | poNumber | specialInstructions | assemblyId | accountId |
|---|---|---|---|---|---|---|---|
| 100 | ORD-2138 | 2023-02-27T13:15:00 | QUOTE | PO-2630 | regional-special-78 | lu_tax_code_template_b_VB-IC-0 | 1000 |
| 101 | ORD-2139 | 2024-07-11T20:32:00 | ORDER | PO-2637 | legacy-special-79 | bss | 1001 |
| 102 | ORD-2140 | 2025-12-22T03:49:00 | QUOTE | PO-2644 | compact-special-80 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1002 |
| 103 | ORD-2141 | 2022-05-06T10:06:00 | ORDER | PO-2651 | composite-special-81 | 8928501 | 1003 |

An order row carries `orderId`, `orderNumber` (`ORD-2138`–`ORD-2141`), `orderDate`, `orderType` (`QUOTE` or `ORDER`), a `poNumber`, optional `specialInstructions`, and two foreign keys: `assemblyId` and `accountId`.

### Junction Tables for Many-to-Many Relationships

The ontology specifies several many-to-many relationships that cannot be expressed through simple foreign keys. The `CustomBackAssemblyAirCellPlacement` junction table resolves the N:M relationship between assemblies and air-cell placements.

**Table `CustomBackAssemblyAirCellPlacement`**

| assemblyId | placementId |
|---|---|
| lu_tax_code_template_b_VB-IC-0 | 1 |
| lu_tax_code_template_b_VB-IC-0 | 2 |
| bss | 2 |
| bss | 3 |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 3 |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 4 |
| 8928501 | 4 |
| 8928501 | 1 |

Each row pairs an `assemblyId` with a `placementId`. For example, assembly `lu_tax_code_template_b_VB-IC-0` contains placements `1` and `2`; assembly `bss` contains placements `2` and `3`; assembly `9222f51a-9bad-11eb-a8a2-19ed5c03f8d3` contains placements `3` and `4`; and assembly `8928501` contains placements `4` and `1`. The composite primary key is (`assemblyId`, `placementId`), and both columns are foreign keys referencing their respective base tables.

The `CustomBackAssemblyAirCompartment` junction table resolves the N:M relationship between assemblies and air compartments.

**Table `CustomBackAssemblyAirCompartment`**

| assemblyId | compartmentId |
|---|---|
| lu_tax_code_template_b_VB-IC-0 | 4543 |
| lu_tax_code_template_b_VB-IC-0 | 168558 |
| bss | 168558 |
| bss | 1367e39e-8fcc-11eb-924d-9cd76263cbd0 |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1367e39e-8fcc-11eb-924d-9cd76263cbd0 |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 727061 |
| 8928501 | 727061 |
| 8928501 | 4543 |

Although the sample data shows a one-to-one mapping (each assembly has exactly one compartment), the junction structure permits an assembly to host multiple compartments and a compartment template to be reused across assemblies. The composite key is (`assemblyId`, `compartmentId`).

The `AirCompartmentAirCellPlacement` junction table captures the spatial relationship between compartments and the individual air cells they contain.

**Table `AirCompartmentAirCellPlacement`**

| compartmentId | placementId |
|---|---|
| 4543 | 1 |
| 4543 | 2 |
| 168558 | 2 |
| 168558 | 3 |
| 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | 3 |
| 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | 4 |
| 727061 | 4 |
| 727061 | 1 |

Each row links a `compartmentId` to a `placementId`, enabling queries that answer "which air cells belong to which compartment" without assuming a fixed hierarchy.

The `ProviderAccountCustomBackAssembly` junction table resolves the N:M relationship between providers and assemblies.

**Table `ProviderAccountCustomBackAssembly`**

| accountId | assemblyId |
|---|---|
| 1000 | lu_tax_code_template_b_VB-IC-0 |
| 1000 | bss |
| 1001 | bss |
| 1001 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1002 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 |
| 1002 | 8928501 |
| 1003 | 8928501 |
| 1003 | lu_tax_code_template_b_VB-IC-0 |

Each row pairs an `accountId` with an `assemblyId`, allowing a single provider to commission multiple assemblies and a single assembly to be attributed to multiple providers. The composite key is (`accountId`, `assemblyId`).

### View-Based Reconstructive Joins

The nine views materialise denormalised projections that answer specific domain questions by joining the normalised tables. Each view is described below with its join logic and representative rows.

#### `custom_back_assembly_air_cell_placement_detail_view`

This view joins `CustomBackAssembly` to `AirCellPlacement` through `CustomBackAssemblyAirCellPlacement`, reconstructing the full detail of each air-cell placement within its parent assembly. It answers the question: "What are the dimensional and profile characteristics of every air cell in a given assembly?" A representative row shows assembly `lu_tax_code_template_b_VB-IC-0` (status `pending`, shell dimensions 1.3 × 1.12 × 0.075) containing placement `1` (cell `557`, profile `1_INCH`, 0.7 × 0.615 cm, grid position 46, 11). Another row shows assembly `bss` (status `confirmed`, dimensions 0.483 × 0.74 × 0.69) containing placement `2` (cell `790489`, profile `LOW_PROFILE`, 0.48 × 0.6 cm, grid position 55, 17).

#### `custom_back_assembly_air_compartment_detail_view`

This view joins `CustomBackAssembly` to `AirCompartment` through `CustomBackAssemblyAirCompartment`, presenting each compartment alongside its parent assembly's dimensions and status. It answers: "Which compartments belong to each assembly, and what are their adjustability and valve settings?" A representative row pairs assembly `lu_tax_code_template_b_VB-IC-0` with compartment `4543` (`lumbar`, `isAdjustable = false`, `valveLocation = bottom_left`, created `2025-01-01`). Another row pairs assembly `bss` with compartment `168558` (`thoracic`, `isAdjustable = true`, `valveLocation = bottom_right`, created `2025-02-06`).

#### `custom_back_assembly_provider_account_view`

This view joins `CustomBackAssembly` to `ProviderAccount` through `ProviderAccountCustomBackAssembly`, attributing each assembly to its provider. It answers: "Which provider commissioned which assembly?" A representative row shows assembly `lu_tax_code_template_b_VB-IC-0` attributed to account `1000` (`ACC-2253`, "Primary Initiative A", city `integrated-city-34`, country `compact-country-26`). Another row shows assembly `bss` attributed to account `1001` (`ACC-2256`, "Composite Model", city `seasonal-city-35`, country `composite-country-27`).

#### `air_cell_placement_custom_back_assembly_view`

This view reverses the perspective of the first view, joining `AirCellPlacement` to `CustomBackAssembly` to answer: "Which assembly contains a given air-cell placement?" A representative row shows placement `1` (cell `557`, profile `1_INCH`) belonging to assembly `lu_tax_code_template_b_VB-IC-0` (status `pending`, dimensions 1.3 × 1.12 × 0.075). Another row shows placement `4` (cell `1186089`, profile `HIGH_PROFILE`) belonging to assembly `8928501` (status `shipped`, dimensions 0.59 × 0.6 × 0.6).

#### `air_compartment_air_cell_placement_detail_view`

This view joins `AirCompartment` to `AirCellPlacement` through `AirCompartmentAirCellPlacement`, reconstructing the spatial composition of each compartment. It answers: "Which air cells are contained within each compartment?" A representative row pairs compartment `4543` (`lumbar`, `isAdjustable = false`) with placement `1` (cell `557`, profile `1_INCH`). Another row pairs compartment `168558` (`thoracic`, `isAdjustable = true`) with placement `2` (cell `790489`, profile `LOW_PROFILE`).

#### `air_compartment_custom_back_assembly_view`

This view joins `AirCompartment` to `CustomBackAssembly` through `CustomBackAssemblyAirCompartment`, presenting each compartment alongside its parent assembly's full dimensional profile. It answers: "What are the physical dimensions of the assembly that hosts a given compartment?" A representative row shows compartment `4543` (`lumbar`) within assembly `lu_tax_code_template_b_VB-IC-0` (shell dimensions 1.3 × 1.12 × 0.075, status `pending`). Another row shows compartment `727061` (`general`, `isAdjustable = true`, `valveLocation = custom`) within assembly `8928501` (shell dimensions 0.59 × 0.6 × 0.6, status `shipped`).

#### `provider_account_custom_back_assembly_detail_view`

This view joins `ProviderAccount` to `CustomBackAssembly` through `ProviderAccountCustomBackAssembly`, presenting each assembly alongside its provider's full contact and address information. It answers: "Which assemblies does a given provider commission, and what are the provider's contact details?" A representative row shows account `1000` (`ACC-2253`, "Primary Initiative A", zip `69434`, phone `compact-phone-26`, email `seasonal-email-11`) commissioning assembly `lu_tax_code_template_b_VB-IC-0` (status `pending`, lead time 14 days). Another row shows account `1003` (`ACC-2262`, "Legacy Review D", zip `1250214`, phone `adaptive-phone-29`, email `compact-email-14`) commissioning assembly `8928501` (status `shipped`, lead time 26 days).

#### `manufacturing_order_custom_back_assembly_view`

This view joins `ManufacturingOrder` to `CustomBackAssembly`, linking each commercial order to the physical assembly it references. It answers: "Which assembly is referenced by a given manufacturing order, and what is the assembly's current status?" A representative row shows order `100` (`ORD-2138`, type `QUOTE`, PO `PO-2630`, date `2023-02-27`) referencing assembly `lu_tax_code_template_b_VB-IC-0` (status `pending`, dimensions 1.3 × 1.12 × 0.075). Another row shows order `103` (`ORD-2141`, type `ORDER`, PO `PO-2651`, date `2022-05-06`) referencing assembly `8928501` (status `shipped`, dimensions 0.59 × 0.6 × 0.6).

#### `manufacturing_order_provider_account_view`

This view joins `ManufacturingOrder` to `ProviderAccount` through the shared `accountId`, linking each commercial order to the provider who placed it. It answers: "Which provider placed a given manufacturing order, and what are the provider's contact details?" A representative row shows order `100` (`ORD-2138`, type `QUOTE`) placed by account `1000` (`ACC-2253`, "Primary Initiative A", city `integrated-city-34`, country `compact-country-26`). Another row shows order `102` (`ORD-2140`, type `QUOTE`, PO `PO-2644`, date `2025-12-22`) placed by account `1002` (`ACC-2259`, "Compact Cluster", city `regional-city-36`, country `primary-country-28`).

### Closing Synthesis

The relational schema faithfully materialises the custom back assembly ontology through a disciplined separation of concerns: five base tables encode the core entity types with their atomic attributes; four junction tables resolve the many-to-many relationships that the ontology declares but that a first-normal-form schema cannot express; and nine views provide denormalised projections that answer the specific analytical questions the domain stakeholders need. Every foreign key—`assemblyId` in `AirCellPlacement`, `AirCompartment`, and `ManufacturingOrder`; `accountId` in `CustomBackAssembly` and `ManufacturingOrder`; the composite keys in the junction tables—creates a navigable graph from any entity to its related peers. The views then collapse this graph along specific paths, reconstructing domain facts such as "the lumbar compartment of assembly `lu_tax_code_template_b_VB-IC-0` contains air cell `557` of profile `1_INCH`" or "order `ORD-2141` was placed by provider 'Legacy Review D' for assembly `8928501` which is currently `shipped`." This architecture ensures that the normalised base tables preserve update consistency while the views provide the analytical convenience of denormalised reporting.

## Data appendix

**View `custom_back_assembly_air_cell_placement_detail_view`**

```sql
CREATE VIEW custom_back_assembly_air_cell_placement_detail_view AS
SELECT a.assemblyId, a.shellWidth, a.shellHeight, b.id AS placement_id, b.cellId AS placement_cellId, b.profileType AS placement_profileType
FROM CustomBackAssembly a
  JOIN CustomBackAssemblyAirCellPlacement j ON j.assemblyId = a.assemblyId
  JOIN AirCellPlacement b ON b.id = j.placementId;
```

| assemblyId | shellWidth | shellHeight | placement_id | placement_cellId | placement_profileType |
|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 | 1 | 557 | 1_INCH |
| lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 | 2 | 790489 | LOW_PROFILE |
| bss | 0.4827489 | 0.74 | 2 | 790489 | LOW_PROFILE |
| bss | 0.4827489 | 0.74 | 3 | 10445644 | MID_PROFILE |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 | 3 | 10445644 | MID_PROFILE |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 | 4 | 1186089 | HIGH_PROFILE |
| 8928501 | 0.59 | 0.6 | 4 | 1186089 | HIGH_PROFILE |
| 8928501 | 0.59 | 0.6 | 1 | 557 | 1_INCH |

**View `custom_back_assembly_air_compartment_detail_view`**

```sql
CREATE VIEW custom_back_assembly_air_compartment_detail_view AS
SELECT a.assemblyId, a.shellWidth, a.shellHeight, b.compartmentId AS compartment_compartmentId, b.compartmentName AS compartment_compartmentName, b.isAdjustable AS compartment_isAdjustable
FROM CustomBackAssembly a
  JOIN CustomBackAssemblyAirCompartment j ON j.assemblyId = a.assemblyId
  JOIN AirCompartment b ON b.compartmentId = j.compartmentId;
```

| assemblyId | shellWidth | shellHeight | compartment_compartmentId | compartment_compartmentName | compartment_isAdjustable |
|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 | 4543 | lumbar | false |
| lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 | 168558 | thoracic | true |
| bss | 0.4827489 | 0.74 | 168558 | thoracic | true |
| bss | 0.4827489 | 0.74 | 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | sacral | false |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 | 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | sacral | false |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 | 727061 | general | true |
| 8928501 | 0.59 | 0.6 | 727061 | general | true |
| 8928501 | 0.59 | 0.6 | 4543 | lumbar | false |

**View `custom_back_assembly_provider_account_view`**

```sql
CREATE VIEW custom_back_assembly_provider_account_view AS
SELECT a.assemblyId, a.shellWidth, a.shellHeight, a.shellDepth, b.accountId AS account_accountId, b.accountNumber AS account_accountNumber, b.providerName AS account_providerName
FROM CustomBackAssembly a JOIN ProviderAccount b ON a.accountId = b.accountId;
```

| assemblyId | shellWidth | shellHeight | shellDepth | account_accountId | account_accountNumber | account_providerName |
|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 | 0.07499999 | 1000 | ACC-2253 | Primary Initiative A |
| bss | 0.4827489 | 0.74 | 0.69 | 1001 | ACC-2256 | Composite Model |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 | 0.13 | 1002 | ACC-2259 | Compact Cluster |
| 8928501 | 0.59 | 0.6 | 0.6000001 | 1003 | ACC-2262 | Legacy Review D |

**View `air_cell_placement_custom_back_assembly_view`**

```sql
CREATE VIEW air_cell_placement_custom_back_assembly_view AS
SELECT a.id, a.cellId, a.profileType, a.widthCm, b.assemblyId AS assembly_assemblyId, b.shellWidth AS assembly_shellWidth, b.shellHeight AS assembly_shellHeight
FROM AirCellPlacement a JOIN CustomBackAssembly b ON a.assemblyId = b.assemblyId;
```

| id | cellId | profileType | widthCm | assembly_assemblyId | assembly_shellWidth | assembly_shellHeight |
|---|---|---|---|---|---|---|
| 1 | 557 | 1_INCH | 0.7 | lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 |
| 2 | 790489 | LOW_PROFILE | 0.48 | bss | 0.4827489 | 0.74 |
| 3 | 10445644 | MID_PROFILE | 1.2 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 |
| 4 | 1186089 | HIGH_PROFILE | 0.98 | 8928501 | 0.59 | 0.6 |

**View `air_compartment_air_cell_placement_detail_view`**

```sql
CREATE VIEW air_compartment_air_cell_placement_detail_view AS
SELECT a.compartmentId, a.compartmentName, a.isAdjustable, b.id AS placement_id, b.cellId AS placement_cellId, b.profileType AS placement_profileType
FROM AirCompartment a
  JOIN AirCompartmentAirCellPlacement j ON j.compartmentId = a.compartmentId
  JOIN AirCellPlacement b ON b.id = j.placementId;
```

| compartmentId | compartmentName | isAdjustable | placement_id | placement_cellId | placement_profileType |
|---|---|---|---|---|---|
| 4543 | lumbar | false | 1 | 557 | 1_INCH |
| 4543 | lumbar | false | 2 | 790489 | LOW_PROFILE |
| 168558 | thoracic | true | 2 | 790489 | LOW_PROFILE |
| 168558 | thoracic | true | 3 | 10445644 | MID_PROFILE |
| 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | sacral | false | 3 | 10445644 | MID_PROFILE |
| 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | sacral | false | 4 | 1186089 | HIGH_PROFILE |
| 727061 | general | true | 4 | 1186089 | HIGH_PROFILE |
| 727061 | general | true | 1 | 557 | 1_INCH |

**View `air_compartment_custom_back_assembly_view`**

```sql
CREATE VIEW air_compartment_custom_back_assembly_view AS
SELECT a.compartmentId, a.compartmentName, a.isAdjustable, a.valveLocation, b.assemblyId AS assembly_assemblyId, b.shellWidth AS assembly_shellWidth, b.shellHeight AS assembly_shellHeight
FROM AirCompartment a JOIN CustomBackAssembly b ON a.assemblyId = b.assemblyId;
```

| compartmentId | compartmentName | isAdjustable | valveLocation | assembly_assemblyId | assembly_shellWidth | assembly_shellHeight |
|---|---|---|---|---|---|---|
| 4543 | lumbar | false | bottom_left | lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 |
| 168558 | thoracic | true | bottom_right | bss | 0.4827489 | 0.74 |
| 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | sacral | false | bottom_center | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 |
| 727061 | general | true | custom | 8928501 | 0.59 | 0.6 |

**View `provider_account_custom_back_assembly_detail_view`**

```sql
CREATE VIEW provider_account_custom_back_assembly_detail_view AS
SELECT a.accountId, a.accountNumber, a.providerName, b.assemblyId AS assembly_assemblyId, b.shellWidth AS assembly_shellWidth, b.shellHeight AS assembly_shellHeight
FROM ProviderAccount a
  JOIN ProviderAccountCustomBackAssembly j ON j.accountId = a.accountId
  JOIN CustomBackAssembly b ON b.assemblyId = j.assemblyId;
```

| accountId | accountNumber | providerName | assembly_assemblyId | assembly_shellWidth | assembly_shellHeight |
|---|---|---|---|---|---|
| 1000 | ACC-2253 | Primary Initiative A | lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 |
| 1000 | ACC-2253 | Primary Initiative A | bss | 0.4827489 | 0.74 |
| 1001 | ACC-2256 | Composite Model | bss | 0.4827489 | 0.74 |
| 1001 | ACC-2256 | Composite Model | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 |
| 1002 | ACC-2259 | Compact Cluster | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 |
| 1002 | ACC-2259 | Compact Cluster | 8928501 | 0.59 | 0.6 |
| 1003 | ACC-2262 | Legacy Review D | 8928501 | 0.59 | 0.6 |
| 1003 | ACC-2262 | Legacy Review D | lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 |

**View `manufacturing_order_custom_back_assembly_view`**

```sql
CREATE VIEW manufacturing_order_custom_back_assembly_view AS
SELECT a.orderId, a.orderNumber, a.orderDate, a.orderType, b.assemblyId AS assembly_assemblyId, b.shellWidth AS assembly_shellWidth, b.shellHeight AS assembly_shellHeight
FROM ManufacturingOrder a JOIN CustomBackAssembly b ON a.assemblyId = b.assemblyId;
```

| orderId | orderNumber | orderDate | orderType | assembly_assemblyId | assembly_shellWidth | assembly_shellHeight |
|---|---|---|---|---|---|---|
| 100 | ORD-2138 | 2023-02-27T13:15:00 | QUOTE | lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 |
| 101 | ORD-2139 | 2024-07-11T20:32:00 | ORDER | bss | 0.4827489 | 0.74 |
| 102 | ORD-2140 | 2025-12-22T03:49:00 | QUOTE | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 |
| 103 | ORD-2141 | 2022-05-06T10:06:00 | ORDER | 8928501 | 0.59 | 0.6 |

**View `manufacturing_order_provider_account_view`**

```sql
CREATE VIEW manufacturing_order_provider_account_view AS
SELECT a.orderId, a.orderNumber, a.orderDate, a.orderType, b.accountId AS account_accountId, b.accountNumber AS account_accountNumber, b.providerName AS account_providerName
FROM ManufacturingOrder a JOIN ProviderAccount b ON a.accountId = b.accountId;
```

| orderId | orderNumber | orderDate | orderType | account_accountId | account_accountNumber | account_providerName |
|---|---|---|---|---|---|---|
| 100 | ORD-2138 | 2023-02-27T13:15:00 | QUOTE | 1000 | ACC-2253 | Primary Initiative A |
| 101 | ORD-2139 | 2024-07-11T20:32:00 | ORDER | 1001 | ACC-2256 | Composite Model |
| 102 | ORD-2140 | 2025-12-22T03:49:00 | QUOTE | 1002 | ACC-2259 | Compact Cluster |
| 103 | ORD-2141 | 2022-05-06T10:06:00 | ORDER | 1003 | ACC-2262 | Legacy Review D |
