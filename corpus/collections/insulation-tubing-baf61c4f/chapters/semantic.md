## The Insulation Tubing and Switchgear Assembly Domain

The domain under examination models the engineering lifecycle of electrical insulation tubing and its integration into switchgear assemblies. At the centre of the model sit four core entity types: `InsulationTubing`, `BusBar`, `SwitchgearAssembly`, and `MaterialSpecification`, each capturing a distinct physical or procedural artefact. A sixth base table, `TestMethod`, records the laboratory procedures used to validate material properties, while `DimensionalProfile` stores the geometric tolerances that govern how tubing fits over conductors. The model employs a combination of direct foreign-key links and many-to-many junction tables to express the relationships between these entities, and a suite of materialised views reconstructs denormalised facts for reporting and analytical consumption.

**Table `InsulationTubing`**

| tubingId | productCode | shrinkRatio | operatingTemperatureMin | operatingTemperatureMax | minimumShrinkTemperature | halogenFree | rohsCompliant | continuousLength | specificationId | barId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | QBM | regional-shrink-90 | 0.77 | 12.45 | 0.075 | false | true | false | 1 | 1 |
| 1001 | QBT | legacy-shrink-91 | 0.74 | 16.90 | 0.6000001 | true | false | true | 2 | 2 |
| 1002 | QBT-200C | compact-shrink-92 | 0.48 | 21.35 | 0.68 | false | true | false | 3 | 3 |
| 1003 | QBM | composite-shrink-93 | 1.02669 | 25.80 | 0.9 | true | false | true | 4 | 4 |

The `InsulationTubing` table is the primary product entity. Each row is identified by a surrogate `tubingId` (1000 through 1003 in the sample data) and carries a human-readable `productCode` such as `QBM`, `QBT`, or `QBT-200C`. Physical performance is captured through numeric columns: `shrinkRatio` ranges from 0.48 to 1.02669, `operatingTemperatureMin` and `operatingTemperatureMax` define the thermal envelope (for example, tubing 1000 operates between 0.77 °C and 12.45 °C), and `minimumShrinkTemperature` records the activation threshold. Boolean flags `halogenFree` and `rohsCompliant` encode regulatory compliance, while `continuousLength` indicates whether the product is supplied in a continuous spool. Two foreign keys anchor the tubing to its material specification (`specificationId` → `MaterialSpecification.id`) and to a bus bar (`barId` → `BusBar.id`), establishing one-to-one associations in the current data model.

**Table `BusBar`**

| id | barType | crossSectionWidth | crossSectionHeight | nominalDiameter | voltageRating | material | tubingId | assemblyId |
|---|---|---|---|---|---|---|---|---|
| 1 | rectangular | 0.6 | 0.52580792 | 12.95 | 6.70 | primary-material-94 | 1000 | 1 |
| 2 | round | 0.99 | 0.7 | 15.90 | 10.40 | adaptive-material-95 | 1001 | 2 |
| 3 | rectangular | 0.69 | 1.8 | 18.85 | 14.10 | distributed-material-96 | 1002 | 3 |
| 4 | round | 1.57 | 0.6000001 | 21.80 | 17.80 | baseline-material-97 | 1003 | 4 |

`BusBar` describes the electrical conductor that the insulation tubing wraps around. The primary key `id` (1–4) pairs with `barType`, which takes the values `rectangular` or `round`. Cross-sectional geometry is stored in `crossSectionWidth` and `crossSectionHeight` (e.g., 0.6 × 0.52580792 for bar 1), while `nominalDiameter` and `voltageRating` capture the electrical characteristics. The `material` column holds coded identifiers such as `primary-material-94` or `adaptive-material-95`. Two foreign keys link the bus bar back to its associated `InsulationTubing` (`tubingId`) and forward to the `SwitchgearAssembly` (`assemblyId`) in which it is installed.

**Table `SwitchgearAssembly`**

| assemblyId | voltageLevel | installationDate | manufacturer | status |
|---|---|---|---|---|
| 1 | 7.70 | 2022-01-10T00:12:00 | Standard Chartered | operational |
| 2 | 11.40 | 2023-06-21T07:29:00 | General Motors | maintenance |
| 3 | 15.10 | 2024-11-05T14:46:00 | Column Name cannot be empty | decommissioned |
| 4 | 18.80 | 2025-04-16T21:03:00 | Financial Information Service Co. Ltd. | operational |

`SwitchgearAssembly` represents the top-level electrical enclosure. Its surrogate key `assemblyId` (1–4) is paired with a numeric `voltageLevel` (7.70 through 18.80), an `installationDate` (ranging from 2022-01-10 to 2025-04-16), a `manufacturer` name (e.g., `Standard Chartered`, `General Motors`, `Column Name cannot be empty`), and a `status` column with values `operational`, `maintenance`, or `decommissioned`. This table sits at the apex of the assembly hierarchy; bus bars reference it via `assemblyId`, and the junction table `SwitchgearAssemblyBusBar` (described below) supports many-to-many relationships between assemblies and bus bars.

**Table `MaterialSpecification`**

| id | specId | tensileStrength | elongationAtBreak | dielectricStrength | dielectricConstant | volumeResistance | oxygenIndex | copperCorrosionRate | coldBendTemperature | tubingId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 3717635 | 4.70 | 5.70 | 5.70 | 3.70 | 6.70 | 11.45 | 18.70 | 1.3 | 1000 |
| 2 | model_inheritance_0 | 9.40 | 10.40 | 7.40 | 6.40 | 8.40 | 13.90 | 21.40 | 1.8 | 1001 |
| 3 | 8350020 | 14.10 | 15.10 | 9.10 | 9.10 | 10.10 | 16.35 | 24.10 | 0.43012016 | 1002 |
| 4 | 5844257 | 18.80 | 19.80 | 10.80 | 11.80 | 11.80 | 18.80 | 26.80 | 0.6000001 | 1003 |

`MaterialSpecification` stores the mechanical and electrical property profile of the insulation material itself. The primary key `id` (1–4) is distinct from the human-readable `specId` (e.g., `3717635`, `model_inheritance_0`, `8350020`). Property columns include `tensileStrength` (4.70–18.80), `elongationAtBreak` (5.70–19.80), `dielectricStrength` (5.70–10.80), `dielectricConstant` (3.70–11.80), `volumeResistance` (6.70–11.80), `oxygenIndex` (11.45–18.80), `copperCorrosionRate` (18.70–26.80), and `coldBendTemperature` (0.43012016–1.8). A foreign key `tubingId` links each specification to exactly one `InsulationTubing` row, while `specificationId` (a separate column) is used by `TestMethod` to associate tests with material specs.

**Table `TestMethod`**

| methodId | methodCode | testType | standardBody | agingCondition | specificationId | tubingId |
|---|---|---|---|---|---|---|
| 100 | ASTM D 2671 | mechanical | ASTM | 120°C, 168 hrs. | 1 | 1000 |
| 101 | IEC 243 | electrical | IEC | -40°C, 4 hrs. | 2 | 1001 |
| 102 | IEC 250 | thermal | ASTM | none | 3 | 1002 |
| 103 | IEC 93 | flammability | IEC | 120°C, 168 hrs. | 4 | 1003 |

`TestMethod` records the laboratory procedures applied to validate material properties. Each row has a `methodId` (100–103), a `methodCode` such as `ASTM D 2671` or `IEC 243`, a `testType` (mechanical, electrical, thermal, flammability), a `standardBody` (ASTM or IEC), an `agingCondition` (e.g., `120°C, 168 hrs.` or `-40°C, 4 hrs.`), and two foreign keys: `specificationId` pointing to `MaterialSpecification.id` and `tubingId` pointing to `InsulationTubing.tubingId`.

**Table `DimensionalProfile`**

| profileId | insideDiameterMin | insideDiameterMax | wallThicknessMin | rectangularBusBarWidth | rectangularBusBarHeight | roundBusBarDiameter | shrinkRatio | barId | tubingId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 20.45 | 21.70 | 10.45 | 1.33 | 1.09 | 14.20 | regional-shrink-90 | 1 | 1000 |
| 2 | 23.90 | 26.40 | 13.90 | 0.32 | 0.46 | 18.40 | legacy-shrink-91 | 2 | 1001 |
| 3 | 27.35 | 31.10 | 17.35 | 0.6 | 0.42195992 | 22.60 | compact-shrink-92 | 3 | 1002 |
| 4 | 30.80 | 35.80 | 20.80 | 0.40846378 | 0.47 | 26.80 | composite-shrink-93 | 4 | 1003 |

`DimensionalProfile` captures the geometric tolerances for tubing-to-conductor fit. The surrogate key `profileId` (1–4) is paired with `insideDiameterMin` and `insideDiameterMax` (e.g., 20.45 and 21.70 for profile 1), `wallThicknessMin` (10.45–20.80), and conductor-specific fields: `rectangularBusBarWidth` and `rectangularBusBarHeight` for rectangular conductors, and `roundBusBarDiameter` for round ones (14.20–26.80). A `shrinkRatio` column (repeating values like `regional-shrink-90`) and foreign keys `barId` and `tubingId` tie the profile to a specific bus bar and tubing product.

The model uses three junction tables to resolve many-to-many relationships that cannot be expressed through simple foreign keys.

**Table `InsulationTubingTestMethod`**

| tubingId | methodId |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

`InsulationTubingTestMethod` is a bridge table linking `InsulationTubing` to `TestMethod`. In the current data, each tubing row is associated with exactly one test method, but the junction structure permits multiple tests per tubing and multiple tubing references per test. The table's composite key consists of `tubingId` and `methodId`, both of which are foreign keys referencing their respective base tables.

**Table `SwitchgearAssemblyBusBar`**

| assemblyId | barId |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

`SwitchgearAssemblyBusBar` resolves the many-to-many relationship between `SwitchgearAssembly` and `BusBar`. Its composite key comprises `assemblyId` and `barId`, each a foreign key to the corresponding base table. This allows a single switchgear assembly to contain multiple bus bars and a bus bar to be deployed across multiple assemblies.

**Table `MaterialSpecificationTestMethod`**

| specificationId | methodId |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

`MaterialSpecificationTestMethod` bridges `MaterialSpecification` and `TestMethod`. Its composite key of `specificationId` and `methodId` enables a material specification to be validated against multiple test methods and a single test method to be applied to multiple specifications.

The following views materialise the relationships between base tables into denormalised result sets suitable for reporting.

**View `vw_insulation_tubing_material_specification`**

```sql
CREATE VIEW vw_insulation_tubing_material_specification AS
SELECT a.tubingId, a.productCode, a.shrinkRatio, a.operatingTemperatureMin, b.id AS specification_id, b.specId AS specification_specId, b.tensileStrength AS specification_tensileStrength
FROM InsulationTubing a JOIN MaterialSpecification b ON a.specificationId = b.id;
```

| tubingId | productCode | shrinkRatio | operatingTemperatureMin | specification_id | specification_specId | specification_tensileStrength |
|---|---|---|---|---|---|---|
| 1000 | QBM | regional-shrink-90 | 0.77 | 1 | 3717635 | 4.70 |
| 1001 | QBT | legacy-shrink-91 | 0.74 | 2 | model_inheritance_0 | 9.40 |
| 1002 | QBT-200C | compact-shrink-92 | 0.48 | 3 | 8350020 | 14.10 |
| 1003 | QBM | composite-shrink-93 | 1.02669 | 4 | 5844257 | 18.80 |

This view joins `InsulationTubing` with `MaterialSpecification` on the `specificationId` / `id` relationship, producing a single row per tubing that combines product-level attributes (e.g., `productCode = QBM`, `shrinkRatio = 0.77`) with material-property attributes (e.g., `tensileStrength = 4.70`, `dielectricStrength = 5.70`). It answers the question: "What are the mechanical and electrical properties of the material used in this specific tubing?"

**View `vw_insulation_tubing_bus_bar`**

```sql
CREATE VIEW vw_insulation_tubing_bus_bar AS
SELECT a.tubingId, a.productCode, a.shrinkRatio, a.operatingTemperatureMin, b.id AS bar_id, b.barType AS bar_barType, b.crossSectionWidth AS bar_crossSectionWidth
FROM InsulationTubing a JOIN BusBar b ON a.barId = b.id;
```

| tubingId | productCode | shrinkRatio | operatingTemperatureMin | bar_id | bar_barType | bar_crossSectionWidth |
|---|---|---|---|---|---|---|
| 1000 | QBM | regional-shrink-90 | 0.77 | 1 | rectangular | 0.6 |
| 1001 | QBT | legacy-shrink-91 | 0.74 | 2 | round | 0.99 |
| 1002 | QBT-200C | compact-shrink-92 | 0.48 | 3 | rectangular | 0.69 |
| 1003 | QBM | composite-shrink-93 | 1.02669 | 4 | round | 1.57 |

By joining `InsulationTubing` to `BusBar` via `barId`, this view pairs tubing characteristics with conductor geometry. A representative row shows tubing `QBM` (tubingId 1000) paired with a `rectangular` bus bar (id 1) having cross-section 0.6 × 0.52580792 and voltage rating 6.70. The view answers: "Which bus bar is this tubing designed to insulate, and what are the conductor's dimensions?"

**View `vw_insulation_tubing_test_method_detail`**

```sql
CREATE VIEW vw_insulation_tubing_test_method_detail AS
SELECT a.tubingId, a.productCode, a.shrinkRatio, b.methodId AS method_methodId, b.methodCode AS method_methodCode, b.testType AS method_testType
FROM InsulationTubing a
  JOIN InsulationTubingTestMethod j ON j.tubingId = a.tubingId
  JOIN TestMethod b ON b.methodId = j.methodId;
```

| tubingId | productCode | shrinkRatio | method_methodId | method_methodCode | method_testType |
|---|---|---|---|---|---|
| 1000 | QBM | regional-shrink-90 | 100 | ASTM D 2671 | mechanical |
| 1000 | QBM | regional-shrink-90 | 101 | IEC 243 | electrical |
| 1001 | QBT | legacy-shrink-91 | 101 | IEC 243 | electrical |
| 1001 | QBT | legacy-shrink-91 | 102 | IEC 250 | thermal |
| 1002 | QBT-200C | compact-shrink-92 | 102 | IEC 250 | thermal |
| 1002 | QBT-200C | compact-shrink-92 | 103 | IEC 93 | flammability |
| 1003 | QBM | composite-shrink-93 | 103 | IEC 93 | flammability |
| 1003 | QBM | composite-shrink-93 | 100 | ASTM D 2671 | mechanical |

This view links `InsulationTubing` to `TestMethod` through the junction table `InsulationTubingTestMethod`, producing rows that pair tubing identifiers with test metadata. For example, tubing 1000 (`QBM`) is associated with test method `ASTM D 2671` (mechanical, ASTM standard, aged at 120°C for 168 hours). The view answers: "Which test procedures have been applied to validate this tubing?"

**View `vw_bus_bar_insulation_tubing`**

```sql
CREATE VIEW vw_bus_bar_insulation_tubing AS
SELECT a.id, a.barType, a.crossSectionWidth, a.crossSectionHeight, b.tubingId AS tubing_tubingId, b.productCode AS tubing_productCode, b.shrinkRatio AS tubing_shrinkRatio
FROM BusBar a JOIN InsulationTubing b ON a.tubingId = b.tubingId;
```

| id | barType | crossSectionWidth | crossSectionHeight | tubing_tubingId | tubing_productCode | tubing_shrinkRatio |
|---|---|---|---|---|---|---|
| 1 | rectangular | 0.6 | 0.52580792 | 1000 | QBM | regional-shrink-90 |
| 2 | round | 0.99 | 0.7 | 1001 | QBT | legacy-shrink-91 |
| 3 | rectangular | 0.69 | 1.8 | 1002 | QBT-200C | compact-shrink-92 |
| 4 | round | 1.57 | 0.6000001 | 1003 | QBM | composite-shrink-93 |

The inverse of `vw_insulation_tubing_bus_bar`, this view starts from `BusBar` and joins to `InsulationTubing`. A row shows bus bar 1 (`rectangular`, voltage 6.70) paired with tubing `QBM` (tubingId 1000). It answers the conductor-centric question: "What insulation tubing is specified for this bus bar?"

**View `vw_bus_bar_switchgear_assembly`**

```sql
CREATE VIEW vw_bus_bar_switchgear_assembly AS
SELECT a.id, a.barType, a.crossSectionWidth, a.crossSectionHeight, b.assemblyId AS assembly_assemblyId, b.voltageLevel AS assembly_voltageLevel, b.installationDate AS assembly_installationDate
FROM BusBar a JOIN SwitchgearAssembly b ON a.assemblyId = b.assemblyId;
```

| id | barType | crossSectionWidth | crossSectionHeight | assembly_assemblyId | assembly_voltageLevel | assembly_installationDate |
|---|---|---|---|---|---|---|
| 1 | rectangular | 0.6 | 0.52580792 | 1 | 7.70 | 2022-01-10T00:12:00 |
| 2 | round | 0.99 | 0.7 | 2 | 11.40 | 2023-06-21T07:29:00 |
| 3 | rectangular | 0.69 | 1.8 | 3 | 15.10 | 2024-11-05T14:46:00 |
| 4 | round | 1.57 | 0.6000001 | 4 | 18.80 | 2025-04-16T21:03:00 |

This view joins `BusBar` to `SwitchgearAssembly` via `assemblyId`, producing rows that combine conductor details with assembly metadata. For instance, bus bar 2 (`round`, voltage 10.40) is shown as part of assembly 2 (`General Motors`, installed 2023-06-21, status `maintenance`). The view answers: "In which switchgear assembly is this bus bar installed, and what is the assembly's operational status?"

**View `vw_switchgear_assembly_bus_bar_detail`**

```sql
CREATE VIEW vw_switchgear_assembly_bus_bar_detail AS
SELECT a.assemblyId, a.voltageLevel, a.installationDate, b.id AS bar_id, b.barType AS bar_barType, b.crossSectionWidth AS bar_crossSectionWidth
FROM SwitchgearAssembly a
  JOIN SwitchgearAssemblyBusBar j ON j.assemblyId = a.assemblyId
  JOIN BusBar b ON b.id = j.barId;
```

| assemblyId | voltageLevel | installationDate | bar_id | bar_barType | bar_crossSectionWidth |
|---|---|---|---|---|---|
| 1 | 7.70 | 2022-01-10T00:12:00 | 1 | rectangular | 0.6 |
| 1 | 7.70 | 2022-01-10T00:12:00 | 2 | round | 0.99 |
| 2 | 11.40 | 2023-06-21T07:29:00 | 2 | round | 0.99 |
| 2 | 11.40 | 2023-06-21T07:29:00 | 3 | rectangular | 0.69 |
| 3 | 15.10 | 2024-11-05T14:46:00 | 3 | rectangular | 0.69 |
| 3 | 15.10 | 2024-11-05T14:46:00 | 4 | round | 1.57 |
| 4 | 18.80 | 2025-04-16T21:03:00 | 4 | round | 1.57 |
| 4 | 18.80 | 2025-04-16T21:03:00 | 1 | rectangular | 0.6 |

Starting from `SwitchgearAssembly`, this view joins to `BusBar` to present the full complement of conductors within each assembly. Assembly 3 (`Column Name cannot be empty`, status `decommissioned`, voltage level 15.10) is paired with bus bar 3 (`rectangular`, voltage 14.10). The view answers: "What bus bars are contained within each switchgear assembly?"

**View `vw_material_specification_test_method_detail`**

```sql
CREATE VIEW vw_material_specification_test_method_detail AS
SELECT a.id, a.specId, a.tensileStrength, b.methodId AS method_methodId, b.methodCode AS method_methodCode, b.testType AS method_testType
FROM MaterialSpecification a
  JOIN MaterialSpecificationTestMethod j ON j.specificationId = a.id
  JOIN TestMethod b ON b.methodId = j.methodId;
```

| id | specId | tensileStrength | method_methodId | method_methodCode | method_testType |
|---|---|---|---|---|---|
| 1 | 3717635 | 4.70 | 100 | ASTM D 2671 | mechanical |
| 1 | 3717635 | 4.70 | 101 | IEC 243 | electrical |
| 2 | model_inheritance_0 | 9.40 | 101 | IEC 243 | electrical |
| 2 | model_inheritance_0 | 9.40 | 102 | IEC 250 | thermal |
| 3 | 8350020 | 14.10 | 102 | IEC 250 | thermal |
| 3 | 8350020 | 14.10 | 103 | IEC 93 | flammability |
| 4 | 5844257 | 18.80 | 103 | IEC 93 | flammability |
| 4 | 5844257 | 18.80 | 100 | ASTM D 2671 | mechanical |

This view joins `MaterialSpecification` to `TestMethod` via `specificationId`, combining material-property data with test metadata. A representative row shows specification 1 (`tensileStrength = 4.70`, `specId = 3717635`) linked to test method `ASTM D 2671` (mechanical, ASTM). The view answers: "Which test methods have been applied to validate each material specification?"

**View `vw_material_specification_insulation_tubing`**

```sql
CREATE VIEW vw_material_specification_insulation_tubing AS
SELECT a.id, a.specId, a.tensileStrength, a.elongationAtBreak, b.tubingId AS tubing_tubingId, b.productCode AS tubing_productCode, b.shrinkRatio AS tubing_shrinkRatio
FROM MaterialSpecification a JOIN InsulationTubing b ON a.tubingId = b.tubingId;
```

| id | specId | tensileStrength | elongationAtBreak | tubing_tubingId | tubing_productCode | tubing_shrinkRatio |
|---|---|---|---|---|---|---|
| 1 | 3717635 | 4.70 | 5.70 | 1000 | QBM | regional-shrink-90 |
| 2 | model_inheritance_0 | 9.40 | 10.40 | 1001 | QBT | legacy-shrink-91 |
| 3 | 8350020 | 14.10 | 15.10 | 1002 | QBT-200C | compact-shrink-92 |
| 4 | 5844257 | 18.80 | 19.80 | 1003 | QBM | composite-shrink-93 |

Joining `MaterialSpecification` to `InsulationTubing` on `tubingId`, this view pairs material properties with product identifiers. Specification 2 (`tensileStrength = 9.40`, `specId = model_inheritance_0`) is linked to tubing `QBT` (tubingId 1001). The view answers: "Which tubing product uses this material specification?"

**View `vw_test_method_material_specification`**

```sql
CREATE VIEW vw_test_method_material_specification AS
SELECT a.methodId, a.methodCode, a.testType, a.standardBody, b.id AS specification_id, b.specId AS specification_specId, b.tensileStrength AS specification_tensileStrength
FROM TestMethod a JOIN MaterialSpecification b ON a.specificationId = b.id;
```

| methodId | methodCode | testType | standardBody | specification_id | specification_specId | specification_tensileStrength |
|---|---|---|---|---|---|---|
| 100 | ASTM D 2671 | mechanical | ASTM | 1 | 3717635 | 4.70 |
| 101 | IEC 243 | electrical | IEC | 2 | model_inheritance_0 | 9.40 |
| 102 | IEC 250 | thermal | ASTM | 3 | 8350020 | 14.10 |
| 103 | IEC 93 | flammability | IEC | 4 | 5844257 | 18.80 |

The inverse of `vw_material_specification_test_method_detail`, this view starts from `TestMethod` and joins to `MaterialSpecification`. Test method `IEC 243` (electrical, IEC, aged at -40°C for 4 hours) is paired with specification 2 (`tensileStrength = 9.40`). The view answers: "Which material specifications are validated by each test method?"

**View `vw_test_method_insulation_tubing`**

```sql
CREATE VIEW vw_test_method_insulation_tubing AS
SELECT a.methodId, a.methodCode, a.testType, a.standardBody, b.tubingId AS tubing_tubingId, b.productCode AS tubing_productCode, b.shrinkRatio AS tubing_shrinkRatio
FROM TestMethod a JOIN InsulationTubing b ON a.tubingId = b.tubingId;
```

| methodId | methodCode | testType | standardBody | tubing_tubingId | tubing_productCode | tubing_shrinkRatio |
|---|---|---|---|---|---|---|
| 100 | ASTM D 2671 | mechanical | ASTM | 1000 | QBM | regional-shrink-90 |
| 101 | IEC 243 | electrical | IEC | 1001 | QBT | legacy-shrink-91 |
| 102 | IEC 250 | thermal | ASTM | 1002 | QBT-200C | compact-shrink-92 |
| 103 | IEC 93 | flammability | IEC | 1003 | QBM | composite-shrink-93 |

This view joins `TestMethod` to `InsulationTubing` via `tubingId`, producing rows that pair test metadata with product identifiers. Test method `IEC 93` (flammability, IEC, aged at 120°C for 168 hours) is linked to tubing `QBM` (tubingId 1003). The view answers: "Which tubing products have been subjected to each test method?"

**View `vw_dimensional_profile_bus_bar`**

```sql
CREATE VIEW vw_dimensional_profile_bus_bar AS
SELECT a.profileId, a.insideDiameterMin, a.insideDiameterMax, a.wallThicknessMin, b.id AS bar_id, b.barType AS bar_barType, b.crossSectionWidth AS bar_crossSectionWidth
FROM DimensionalProfile a JOIN BusBar b ON a.barId = b.id;
```

| profileId | insideDiameterMin | insideDiameterMax | wallThicknessMin | bar_id | bar_barType | bar_crossSectionWidth |
|---|---|---|---|---|---|---|
| 1 | 20.45 | 21.70 | 10.45 | 1 | rectangular | 0.6 |
| 2 | 23.90 | 26.40 | 13.90 | 2 | round | 0.99 |
| 3 | 27.35 | 31.10 | 17.35 | 3 | rectangular | 0.69 |
| 4 | 30.80 | 35.80 | 20.80 | 4 | round | 1.57 |

Joining `DimensionalProfile` to `BusBar` on `barId`, this view combines conductor geometry with tubing fit tolerances. Profile 1 (inside diameter 20.45–21.70, wall thickness 10.45) is paired with bus bar 1 (`rectangular`, cross-section 0.6 × 0.52580792). The view answers: "What dimensional tolerances apply to the tubing for each bus bar?"

**View `vw_dimensional_profile_insulation_tubing`**

```sql
CREATE VIEW vw_dimensional_profile_insulation_tubing AS
SELECT a.profileId, a.insideDiameterMin, a.insideDiameterMax, a.wallThicknessMin, b.tubingId AS tubing_tubingId, b.productCode AS tubing_productCode, b.shrinkRatio AS tubing_shrinkRatio
FROM DimensionalProfile a JOIN InsulationTubing b ON a.tubingId = b.tubingId;
```

| profileId | insideDiameterMin | insideDiameterMax | wallThicknessMin | tubing_tubingId | tubing_productCode | tubing_shrinkRatio |
|---|---|---|---|---|---|---|
| 1 | 20.45 | 21.70 | 10.45 | 1000 | QBM | regional-shrink-90 |
| 2 | 23.90 | 26.40 | 13.90 | 1001 | QBT | legacy-shrink-91 |
| 3 | 27.35 | 31.10 | 17.35 | 1002 | QBT-200C | compact-shrink-92 |
| 4 | 30.80 | 35.80 | 20.80 | 1003 | QBM | composite-shrink-93 |

This view joins `DimensionalProfile` to `InsulationTubing` on `tubingId`, pairing tubing product identifiers with their fit tolerances. Profile 2 (inside diameter 23.90–26.40, shrink ratio `legacy-shrink-91`) is linked to tubing `QBT` (tubingId 1001). The view answers: "What are the dimensional specifications for each tubing product?"

The relational schema presented here follows a normalised design pattern in which each physical or procedural entity is captured in its own table, with foreign keys expressing the directed associations and junction tables resolving many-to-many relationships. The materialised views serve as denormalised lenses that reconstruct domain facts by joining the appropriate tables, allowing downstream consumers to query complex relationships without writing explicit join logic. For example, the view `vw_insulation_tubing_test_method_detail` answers the question "which test methods validate tubing QBM?" by joining `InsulationTubing`, `InsulationTubingTestMethod`, and `TestMethod` in a single step. This separation of concerns—normalised storage for data integrity and denormalised views for query convenience—is a well-established pattern in enterprise data modelling and is particularly well-suited to the insulation tubing and switchgear assembly domain, where the same tubing, bus bar, or material specification may participate in multiple assemblies, tests, and dimensional configurations.