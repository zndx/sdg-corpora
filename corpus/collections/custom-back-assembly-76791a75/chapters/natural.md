Custom back assemblies represent a class of engineered support systems designed to meet individual anatomical and ergonomic requirements. Each assembly is defined by its shell dimensions, a manufacturing status, and a chain of relationships to the air cells and compartments that provide its functional properties. Providers place orders for these assemblies, which are then manufactured according to precise specifications. The data model captures every stage of this lifecycle—from initial provider account registration through order placement, assembly construction, and the granular placement of air cells within compartments—enabling full traceability across the supply chain.

## The Custom Back Assembly

**Table `CustomBackAssembly`**

| assemblyId | shellWidth | shellHeight | shellDepth | status | orderReference | manufactureLeadTime | accountId |
|---|---|---|---|---|---|---|---|
| lu_tax_code_template_b_VB-IC-0 | 1.3 | 1.12 | 0.07499999 | pending | extended-order-93 | 14 | 1000 |
| bss | 0.4827489 | 0.74 | 0.69 | confirmed | integrated-order-94 | 18 | 1001 |
| 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1.15 | 0.96 | 0.13 | manufacturing | seasonal-order-95 | 22 | 1002 |
| 8928501 | 0.59 | 0.6 | 0.6000001 | shipped | regional-order-96 | 26 | 1003 |

The custom back assembly is the central product entity. Each record describes a single assembly shell with three dimensional measurements: shell width, shell height, and shell depth, all expressed in consistent linear units. The status field tracks the assembly through its production lifecycle, progressing through states such as pending, confirmed, manufacturing, and shipped. An orderReference field ties the assembly to a broader commercial order, while manufactureLeadTime records the expected production duration in days. Every assembly is associated with a provider account via the accountId column, establishing the commercial relationship from the outset.

Consider the assembly identified as `lu_tax_code_template_b_VB-IC-0`. It has a shell width of 1.3, a height of 1.12, and a depth of 0.075, and is currently in pending status under the order reference `extended-order-93`. Its lead time is 14 days, and it is linked to provider account 1000. By contrast, the assembly `8928501` has more compact dimensions—0.59 by 0.6 by 0.6—and has already reached shipped status under `regional-order-96`, with a 26-day lead time tied to account 1003.

## Air Cell Placement

**Table `AirCellPlacement`**

| id | cellId | profileType | widthCm | heightCm | gridRow | gridColumn | assemblyId |
|---|---|---|---|---|---|---|---|
| 1 | 557 | 1_INCH | 0.7 | 0.615 | 46 | 11 | lu_tax_code_template_b_VB-IC-0 |
| 2 | 790489 | LOW_PROFILE | 0.48 | 0.6 | 55 | 17 | bss |
| 3 | 10445644 | MID_PROFILE | 1.2 | 1.52 | 64 | 23 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 |
| 4 | 1186089 | HIGH_PROFILE | 0.98 | 1.33 | 73 | 29 | 8928501 |

Air cells are the functional building blocks within a back assembly. Each placement record identifies a specific air cell by its cellId and describes its profile type, which determines its structural characteristics. The four profile types observed in the data are 1_INCH, LOW_PROFILE, MID_PROFILE, and HIGH_PROFILE. Each cell has a width and height in centimeters, and its position within the assembly is specified by a gridRow and gridColumn coordinate pair. The assemblyId column links the placement to the assembly that contains it.

The air cell with id 1 carries cellId 557 and uses a 1_INCH profile. It measures 0.7 cm wide by 0.615 cm tall and is positioned at grid row 46, column 11 within assembly `lu_tax_code_template_b_VB-IC-0`. Cell id 3, with cellId 10445644, uses a MID_PROFILE and is notably larger at 1.2 cm by 1.52 cm, placed at row 64, column 23 in assembly `9222f51a-9bad-11eb-a8a2-11eb-a8a2-19ed5c03f8d3`.

## Air Compartments

**Table `AirCompartment`**

| compartmentId | compartmentName | isAdjustable | valveLocation | assemblyId | createdAt | updatedAt |
|---|---|---|---|---|---|---|
| 4543 | lumbar | false | bottom_left | lu_tax_code_template_b_VB-IC-0 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 168558 | thoracic | true | bottom_right | bss | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1367e39e-8fcc-11eb-924d-9cd76263cbd0 | sacral | false | bottom_center | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 727061 | general | true | custom | 8928501 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Air compartments group air cells into anatomically or functionally meaningful regions within an assembly. Each compartment has a name—lumbar, thoracic, sacral, and general are the observed values—and a boolean flag indicating whether it is adjustable. The valveLocation field specifies where the inflation or deflation valve is positioned, with options including bottom_left, bottom_right, bottom_center, and custom. Timestamps for createdAt and updatedAt track the compartment's creation and last modification.

The compartment `4543`, named lumbar, is not adjustable and has its valve at bottom_left. It belongs to assembly `lu_tax_code_template_b_VB-IC-0` and was created on 2025-01-01. The compartment `168558`, named thoracic, is adjustable with a bottom_right valve, linked to assembly `bss`, and was last updated on 2025-02-09. The sacral compartment `1367e39e-8fcc-11eb-924d-9cd76263cbd0` is non-adjustable with a bottom_center valve, while the general compartment `727061` is adjustable with a custom valve location.

## Provider Accounts

**Table `ProviderAccount`**

| accountId | accountNumber | providerName | addressLine1 | addressLine2 | city | state | zipCode | country | phone | email |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | ACC-2253 | Primary Initiative A | adaptive-address-77 | regional-address-90 | integrated-city-34 | distributed-state-84 | 69434 | compact-country-26 | compact-phone-26 | seasonal-email-11 |
| 1001 | ACC-2256 | Composite Model | distributed-address-78 | legacy-address-91 | seasonal-city-35 | baseline-state-85 | 13589 | composite-country-27 | composite-phone-27 | regional-email-12 |
| 1002 | ACC-2259 | Compact Cluster | baseline-address-79 | compact-address-92 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | primary-country-28 | primary-phone-28 | legacy-email-13 |
| 1003 | ACC-2262 | Legacy Review D | pilot-address-80 | composite-address-93 | legacy-city-37 | extended-state-87 | 1250214 | adaptive-country-29 | adaptive-phone-29 | compact-email-14 |

Provider accounts represent the organizations or practitioners who order custom back assemblies. Each account has a unique accountNumber (such as ACC-2253 or ACC-2262), a providerName, and a full address including addressLine1, addressLine2, city, state, zipCode, and country. Contact information is captured via phone and email fields.

Account 1000, registered as ACC-2253 and named Primary Initiative A, is located at adaptive-address-77 in integrated-city-34, distributed-state-84, with zip code 69434 in compact-country-26. Account 1001, ACC-2256, is the Composite Model provider, based at distributed-address-78 in seasonal-city-35. Account 1002, Compact Cluster, carries ACC-2259 and is situated at baseline-address-79 in regional-city-36. Account 1003, Legacy Review D, holds ACC-2262 and is located at pilot-address-80 in legacy-city-37.

## Manufacturing Orders

**Table `ManufacturingOrder`**

| orderId | orderNumber | orderDate | orderType | poNumber | specialInstructions | assemblyId | accountId |
|---|---|---|---|---|---|---|---|
| 100 | ORD-2138 | 2023-02-27T13:15:00 | QUOTE | PO-2630 | regional-special-78 | lu_tax_code_template_b_VB-IC-0 | 1000 |
| 101 | ORD-2139 | 2024-07-11T20:32:00 | ORDER | PO-2637 | legacy-special-79 | bss | 1001 |
| 102 | ORD-2140 | 2025-12-22T03:49:00 | QUOTE | PO-2644 | compact-special-80 | 9222f51a-9bad-11eb-a8a2-19ed5c03f8d3 | 1002 |
| 103 | ORD-2141 | 2022-05-06T10:06:00 | ORDER | PO-2651 | composite-special-81 | 8928501 | 1003 |

Manufacturing orders formalize the request for custom back assemblies. Each order has an orderId, an orderNumber (such as ORD-2138 or ORD-2141), an orderDate in ISO 8601 format, and an orderType that is either QUOTE or ORDER. A poNumber records the purchase order reference, and specialInstructions captures any additional manufacturing notes. The assemblyId links the order to the specific assembly being produced, and accountId ties it to the provider account.

Order 100, numbered ORD-2138, is a QUOTE dated 2023-02-27 with purchase order PO-2630 and special instructions labeled regional-special-78. It is associated with assembly `lu_tax_code_template_b_VB-IC-0` and provider account 1000. Order 101, ORD-2139, is a confirmed ORDER dated 2024-07-11 with PO-2637, linked to assembly `bss` and account 1001. Order 102, ORD-2140, is a QUOTE from 2025-12-22 with PO-2644, connected to assembly `9222f51a-9bad-11eb-a8a2-19ed5c03f8d3` and account 1002. Order 103, ORD-2141, is an ORDER from 2022-05-06 with PO-2651, tied to assembly `8928501` and account 1003.

## Assembly-to-Cell Relationships

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

The junction table CustomBackAssemblyAirCellPlacement establishes which air cell placements belong to which assemblies. It contains two columns: assemblyId and placementId. Each row asserts that a specific placement is part of a specific assembly.

Assembly `lu_tax_code_template_b_VB-IC-0` contains placements 1 and 2. Assembly `bss` contains placements 2 and 3. Assembly `9222f51a-9bad-11eb-a8a2-19ed5c03f8d3` contains placements 3 and 4. Assembly `8928501` contains placements 4 and 1. This many-to-many structure allows any placement to be associated with multiple assemblies and any assembly to contain multiple placements.

## Assembly-to-Compartment Relationships

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

The CustomBackAssemblyAirCompartment table links assemblies to their air compartments. It uses assemblyId and compartmentId to record which compartments are part of which assemblies. This relationship mirrors the assembly-to-cell structure, enabling flexible composition of compartments within each assembly.

## Compartment-to-Cell Relationships

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

The AirCompartmentAirCellPlacement table connects air compartments to the air cell placements they contain. It uses compartmentId and placementId to define which cells reside within which compartments. Together with the assembly-to-compartment and assembly-to-cell junction tables, this creates a complete graph of how cells, compartments, and assemblies relate to one another.

## Provider-to-Assembly Relationships

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

The ProviderAccountCustomBackAssembly table records which provider accounts are associated with which custom back assemblies. It uses accountId and assemblyId to establish this link, enabling traceability from provider through order to the specific assembly produced.

## Assembly-Cell Detail View



This view joins the assembly, cell placement, and junction tables to produce a single record per assembly-cell relationship. It answers the question: which air cells are placed in which assemblies, and what are their dimensional and positional properties? A row from this view might show assembly `lu_tax_code_template_b_VB-IC-0` with its shell dimensions of 1.3 by 1.12 by 0.075, linked to air cell placement id 1, which has cellId 557, a 1_INCH profile, and grid position (46, 11). Another row could show assembly `bss` with dimensions 0.48 by 0.74 by 0.69, linked to placement id 3, carrying cellId 10445644 in a MID_PROFILE at grid position (64, 23).

## Assembly-Compartment Detail View



This view joins the assembly, compartment, and junction tables to reveal which compartments belong to which assemblies. It answers the question: what anatomical regions are defined within each assembly, and what are their adjustability and valve characteristics? A row might display assembly `lu_tax_code_template_b_VB-IC-0` alongside compartment `4543` (lumbar, non-adjustable, valve at bottom_left). Another row could show assembly `bss` with compartment `168558` (thoracic, adjustable, valve at bottom_right).

## Assembly-Provider View



This view joins the assembly and provider account tables to show which provider is associated with each assembly. It answers the question: which provider account ordered or is responsible for each custom back assembly? A row might show assembly `lu_tax_code_template_b_VB-IC-0` linked to provider account 1000 (ACC-2253, Primary Initiative A). Another row could show assembly `8928501` linked to provider account 1003 (ACC-2262, Legacy Review D).

## Cell-Assembly View



This view joins the air cell placement and assembly tables to present each cell alongside its parent assembly's dimensions and status. It answers the question: given an air cell placement, which assembly contains it, and what is the assembly's current state? A row might show placement id 1 (cellId 557, 1_INCH profile) within assembly `lu_tax_code_template_b_VB-IC-0`, which has status pending and order reference extended-order-93. Another row could show placement id 4 (cellId 1186089, HIGH_PROFILE) within assembly `8928501`, which has status shipped and order reference regional-order-96.

## Compartment-Cell Detail View



This view joins the compartment, cell placement, and junction tables to reveal which air cells are contained within each compartment. It answers the question: given a compartment, which air cell placements does it include, and what are their profile and grid properties? A row might display compartment `4543` (lumbar, non-adjustable) alongside placement id 1 (cellId 557, 1_INCH profile at grid position 46, 11). Another row could show compartment `168558` (thoracic, adjustable) with placement id 3 (cellId 10445644, MID_PROFILE at grid position 64, 23).

## Compartment-Assembly View



This view joins the compartment and assembly tables to show which compartments belong to which assemblies. It answers the question: given an assembly, what compartments are defined within it, and what are their names and adjustability settings? A row might show assembly `lu_tax_code_template_b_VB-IC-0` with compartment `4543` (lumbar, non-adjustable). Another row could show assembly `8928501` with compartment `727061` (general, adjustable, custom valve location).

## Provider-Assembly Detail View



This view joins the provider account and assembly tables to present a comprehensive record of each provider-assembly relationship. It answers the question: given a provider account, which assemblies are they associated with, and what are the assembly dimensions and statuses? A row might show provider account 1000 (ACC-2253, Primary Initiative A) linked to assembly `lu_tax_code_template_b_VB-IC-0` with dimensions 1.3 by 1.12 by 0.075 and status pending. Another row could show provider account 1003 (ACC-2262, Legacy Review D) linked to assembly `8928501` with dimensions 0.59 by 0.6 by 0.6 and status shipped.

## Manufacturing-Assembly View



This view joins the manufacturing order and assembly tables to show which orders correspond to which assemblies. It answers the question: given a manufacturing order, what assembly is being produced, and what are its dimensions and current status? A row might display order 100 (ORD-2138, QUOTE, PO-2630) for assembly `lu_tax_code_template_b_VB-IC-0` with shell dimensions 1.3 by 1.12 by 0.075. Another row could show order 103 (ORD-2141, ORDER, PO-2651) for assembly `8928501` with dimensions 0.59 by 0.6 by 0.6.

## Manufacturing-Provider View



This view joins the manufacturing order and provider account tables to reveal which provider account placed each manufacturing order. It answers the question: given a manufacturing order, which provider account is responsible, and what are their contact details? A row might show order 100 (ORD-2138) placed by provider account 1000 (ACC-2253, Primary Initiative A, located at adaptive-address-77 in integrated-city-34). Another row could show order 103 (ORD-2141) placed by provider account 1003 (ACC-2262, Legacy Review D, located at pilot-address-80 in legacy-city-37).

## Synthesis

The custom back assembly domain is defined by a hierarchy of relationships that connect providers to orders, orders to assemblies, and assemblies to their constituent air cells and compartments. The base tables capture the core entities—each with its own identifiers, attributes, and timestamps—while the junction tables express the many-to-many associations that allow flexible composition. The views synthesize these relationships into readable records that answer specific operational questions: which cells are in which assemblies, which compartments belong to which assemblies, which providers ordered which assemblies, and which manufacturing orders correspond to which assemblies and providers. Together, these tables and views form a complete record of the custom back assembly lifecycle, from provider registration through manufacturing to final shipment.

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
