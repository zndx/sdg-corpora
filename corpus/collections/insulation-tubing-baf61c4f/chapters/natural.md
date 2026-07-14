## Electrical Insulation Tubing and Switchgear Assembly Engineering

The design and qualification of electrical insulation systems for switchgear assemblies demand rigorous documentation of material properties, dimensional tolerances, and test methodologies. This reference describes the data structures used to track insulation tubing products, their integration with bus bar conductors, and their deployment within switchgear assemblies across operational lifecycles. Each record captures measurable engineering parameters—from shrink ratios and dielectric strength to voltage ratings and aging conditions—enabling traceability from raw material specification through final assembly validation.

**Table `InsulationTubing`**

| tubingId | productCode | shrinkRatio | operatingTemperatureMin | operatingTemperatureMax | minimumShrinkTemperature | halogenFree | rohsCompliant | continuousLength | specificationId | barId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | QBM | regional-shrink-90 | 0.77 | 12.45 | 0.075 | false | true | false | 1 | 1 |
| 1001 | QBT | legacy-shrink-91 | 0.74 | 16.90 | 0.6000001 | true | false | true | 2 | 2 |
| 1002 | QBT-200C | compact-shrink-92 | 0.48 | 21.35 | 0.68 | false | true | false | 3 | 3 |
| 1003 | QBM | composite-shrink-93 | 1.02669 | 25.80 | 0.9 | true | false | true | 4 | 4 |

Insulation tubing serves as the primary dielectric barrier between conductive elements and grounded enclosures. The tubing records identify individual product variants through codes such as QBM, QBT, and QBT-200C, each associated with a distinct shrink ratio designation. The shrink ratio, expressed as a dimensionless factor, governs how tightly the tubing conforms to the underlying conductor after thermal activation; values range from 0.48 for the compact-shrink-92 variant to 1.02669 for the composite-shrink-93 product. Operating temperature windows define the safe thermal envelope: the QBM tubing operates between 0.77°C and 12.45°C, while the QBT-200C variant extends to 21.35°C maximum. Regulatory compliance flags—halogenFree and rohsCompliant—indicate environmental and safety certifications, with the QBM and QBT-200C products both carrying RoHS compliance. The continuousLength field distinguishes between standard and extended-length offerings, and each tubing record links to a material specification and a bus bar assignment through specificationId and barId foreign keys.

**Table `BusBar`**

| id | barType | crossSectionWidth | crossSectionHeight | nominalDiameter | voltageRating | material | tubingId | assemblyId |
|---|---|---|---|---|---|---|---|---|
| 1 | rectangular | 0.6 | 0.52580792 | 12.95 | 6.70 | primary-material-94 | 1000 | 1 |
| 2 | round | 0.99 | 0.7 | 15.90 | 10.40 | adaptive-material-95 | 1001 | 2 |
| 3 | rectangular | 0.69 | 1.8 | 18.85 | 14.10 | distributed-material-96 | 1002 | 3 |
| 4 | round | 1.57 | 0.6000001 | 21.80 | 17.80 | baseline-material-97 | 1003 | 4 |

Bus bars function as the current-carrying conductors within switchgear assemblies, and their geometric and electrical characteristics directly influence the selection of compatible insulation tubing. The bus bar records classify conductors by cross-sectional geometry—rectangular or round—and specify dimensional parameters including crossSectionWidth, crossSectionHeight, and nominalDiameter. A rectangular bus bar with a width of 0.6 units and height of 0.52580792 units pairs with the QBM tubing, while a round conductor of nominal diameter 21.80 units pairs with the composite-shrink-93 variant. Voltage ratings span from 6.70 kV to 17.80 kV, and material designations such as primary-material-94 and adaptive-material-95 identify the conductor composition. Each bus bar record references an associated insulation tubing via tubingId and belongs to a switchgear assembly through assemblyId, establishing the physical integration chain.

**Table `SwitchgearAssembly`**

| assemblyId | voltageLevel | installationDate | manufacturer | status |
|---|---|---|---|---|
| 1 | 7.70 | 2022-01-10T00:12:00 | Standard Chartered | operational |
| 2 | 11.40 | 2023-06-21T07:29:00 | General Motors | maintenance |
| 3 | 15.10 | 2024-11-05T14:46:00 | Column Name cannot be empty | decommissioned |
| 4 | 18.80 | 2025-04-16T21:03:00 | Financial Information Service Co. Ltd. | operational |

Switchgear assemblies represent the highest level of equipment aggregation, encapsulating bus bars and their insulation systems within a single deployable unit. The assembly records track operational metadata including voltageLevel, installationDate, manufacturer, and current status. Assembly 1, manufactured by Standard Chartered and installed on 2022-01-10, operates at 7.70 kV with an operational status. Assembly 2, from General Motors at 11.40 kV, is currently in maintenance status as of its 2023-06-21 installation. Assembly 3, installed under the name Column Name cannot be empty on 2024-11-05 at 15.10 kV, carries a decommissioned status. Assembly 4, from Financial Information Service Co. Ltd. at 18.80 kV, remains operational following its 2025-04-16 installation. The voltage levels increase progressively across the four assemblies, reflecting the scalability of the insulation system design to different grid voltage classes.

**Table `MaterialSpecification`**

| id | specId | tensileStrength | elongationAtBreak | dielectricStrength | dielectricConstant | volumeResistance | oxygenIndex | copperCorrosionRate | coldBendTemperature | tubingId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 3717635 | 4.70 | 5.70 | 5.70 | 3.70 | 6.70 | 11.45 | 18.70 | 1.3 | 1000 |
| 2 | model_inheritance_0 | 9.40 | 10.40 | 7.40 | 6.40 | 8.40 | 13.90 | 21.40 | 1.8 | 1001 |
| 3 | 8350020 | 14.10 | 15.10 | 9.10 | 9.10 | 10.10 | 16.35 | 24.10 | 0.43012016 | 1002 |
| 4 | 5844257 | 18.80 | 19.80 | 10.80 | 11.80 | 11.80 | 18.80 | 26.80 | 0.6000001 | 1003 |

Material specifications define the intrinsic physical and electrical properties of the insulation tubing compound, independent of its dimensional form. Each specification record carries a unique specId—such as 3717635 or model_inheritance_0—and quantifies mechanical and dielectric performance through tensileStrength, elongationAtBreak, dielectricStrength, dielectricConstant, volumeResistance, oxygenIndex, copperCorrosionRate, and coldBendTemperature. Tensile strength values range from 4.70 to 18.80, while elongation at break spans 5.70 to 19.80, indicating the material's capacity to stretch before failure. Dielectric strength, a critical parameter for insulation integrity, increases from 5.70 to 10.80 across the four specifications. The oxygenIndex, measuring resistance to combustion, ranges from 11.45 to 18.80. Each material specification links to its corresponding insulation tubing through tubingId, ensuring that every installed tube can be traced back to its certified compound properties.

**Table `TestMethod`**

| methodId | methodCode | testType | standardBody | agingCondition | specificationId | tubingId |
|---|---|---|---|---|---|---|
| 100 | ASTM D 2671 | mechanical | ASTM | 120°C, 168 hrs. | 1 | 1000 |
| 101 | IEC 243 | electrical | IEC | -40°C, 4 hrs. | 2 | 1001 |
| 102 | IEC 250 | thermal | ASTM | none | 3 | 1002 |
| 103 | IEC 93 | flammability | IEC | 120°C, 168 hrs. | 4 | 1003 |

Test methods document the standardized procedures used to validate insulation tubing performance under defined conditions. Each method record identifies a specific test through methodCode—such as ASTM D 2671 or IEC 243—and categorizes it by testType, which includes mechanical, electrical, thermal, and flammability classifications. The standardBody field indicates the issuing organization, with ASTM and IEC being the two standard-setting bodies represented. Aging conditions describe the pre-conditioning environment applied before testing: the ASTM D 2671 mechanical test subjects specimens to 120°C for 168 hours, while the IEC 243 electrical test uses a -40°C, 4-hour conditioning cycle. Each test method references both a material specification and an insulation tubing, creating a complete audit trail from test procedure through material to installed product.

**Table `DimensionalProfile`**

| profileId | insideDiameterMin | insideDiameterMax | wallThicknessMin | rectangularBusBarWidth | rectangularBusBarHeight | roundBusBarDiameter | shrinkRatio | barId | tubingId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 20.45 | 21.70 | 10.45 | 1.33 | 1.09 | 14.20 | regional-shrink-90 | 1 | 1000 |
| 2 | 23.90 | 26.40 | 13.90 | 0.32 | 0.46 | 18.40 | legacy-shrink-91 | 2 | 1001 |
| 3 | 27.35 | 31.10 | 17.35 | 0.6 | 0.42195992 | 22.60 | compact-shrink-92 | 3 | 1002 |
| 4 | 30.80 | 35.80 | 20.80 | 0.40846378 | 0.47 | 26.80 | composite-shrink-93 | 4 | 1003 |

Dimensional profiles specify the geometric tolerances that the insulation tubing must satisfy to ensure proper fit over the bus bar conductor. The profile records define minimum and maximum bounds for insideDiameter and wallThickness, as well as conductor-specific dimensions: rectangularBusBarWidth, rectangularBusBarHeight, and roundBusBarDiameter. For the rectangular bus bar configuration, the profile specifies a rectangularBusBarWidth of 1.33 and rectangularBusBarHeight of 1.09, while the round conductor profile specifies a roundBusBarDiameter of 14.20. The shrinkRatio field in the profile cross-references the tubing's thermal contraction characteristic. Each dimensional profile links to both a bus bar and an insulation tubing, ensuring that the selected tubing can physically accommodate the conductor geometry within acceptable tolerance bands.

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

The InsulationTubingTestMethod table establishes the many-to-many relationship between insulation tubing products and the test methods applied to them. A single tubing variant may undergo multiple test types—mechanical, electrical, thermal, and flammability—while each test method may be applied across multiple tubing products. This junction table captures the specific pairing of tubingId and methodId, enabling the generation of test matrices that show which validations have been performed for each product.

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

The SwitchgearAssemblyBusBar table records the assembly-level containment of bus bars. Each bus bar belongs to exactly one switchgear assembly, and this junction table formalizes that assignment through assemblyId and barId pairs. This relationship supports inventory tracking, maintenance scheduling, and failure analysis by linking individual conductor components to their parent equipment units.

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

The MaterialSpecificationTestMethod table links material specifications to the test methods used to qualify them. A given compound specification may be validated against multiple test standards, and each test method may apply to multiple specifications. This junction table captures the specific specificationId and methodId pairings, supporting the generation of compliance reports that show which tests have been performed for each material formulation.

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

The insulation tubing to material specification view joins the tubing records with their corresponding material specifications, answering the question of which compound properties apply to each installed tubing product. The joined result reveals that tubing QBM (tubingId 1000) is governed by material specification 3717635, which specifies a tensile strength of 4.70 and a dielectric strength of 5.70. Tubing QBT (tubingId 1001) links to specification model_inheritance_0 with a tensile strength of 9.40 and dielectric strength of 7.40. This view enables engineers to quickly assess whether a given tubing product meets the mechanical and electrical requirements of a specific application by consulting the underlying material data.

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

This view joins insulation tubing with their associated bus bars, revealing the physical pairing of dielectric barrier and conductor. The result shows that tubing QBM (tubingId 1000) is paired with a rectangular bus bar (barId 1) rated at 6.70 kV, while tubing QBT (tubingId 1001) pairs with a round bus bar (barId 2) at 10.40 kV. The crossSectionWidth and crossSectionHeight values from the bus bar record inform the required inside diameter tolerances for the tubing, ensuring a proper interference fit. This pairing view is essential for verifying that the selected tubing can adequately cover the conductor geometry while maintaining the required dielectric clearance.

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

The insulation tubing test method detail view combines tubing product information with the test methods applied to it, producing a complete test matrix for each product variant. For tubing QBM (tubingId 1000), the ASTM D 2671 mechanical test under ASTM standards with 120°C, 168 hrs. aging condition appears in the result. Tubing QBT (tubingId 1001) is associated with the IEC 243 electrical test under IEC standards at -40°C, 4 hrs. This view supports quality assurance audits by presenting all tests performed on each tubing product in a single consolidated record.

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

Reversing the perspective, this view presents bus bars alongside their assigned insulation tubing, answering the question of which dielectric barrier is specified for each conductor. The rectangular bus bar (barId 1) with crossSectionWidth 0.6 and crossSectionHeight 0.52580792 is paired with tubing QBM (tubingId 1000), while the round bus bar (barId 4) with nominalDiameter 21.80 is paired with tubing QBM (tubingId 1003). This bidirectional view is useful for manufacturing planning, as it allows the production team to determine the required tubing inventory for a given bus bar order.

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

This view joins bus bars with their parent switchgear assemblies, providing a clear picture of conductor deployment across the equipment fleet. Bus bar 1 (rectangular, 6.70 kV) belongs to assembly 1 (Standard Chartered, operational, 7.70 kV), while bus bar 2 (round, 10.40 kV) belongs to assembly 2 (General Motors, maintenance, 11.40 kV). The voltage ratings of individual bus bars align with the overall assembly voltage level, confirming proper system design. This view supports maintenance planning by identifying which conductors require attention within each assembly.

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

The switchgear assembly to bus bar detail view expands the assembly-conductor relationship with full bus bar specifications, enabling comprehensive equipment profiling. Assembly 1 (Standard Chartered, operational) contains bus bar 1 with rectangular geometry, crossSectionWidth 0.6, and voltageRating 6.70. Assembly 4 (Financial Information Service Co. Ltd., operational) contains bus bar 4 with round geometry, nominalDiameter 21.80, and voltageRating 17.80. This detailed view is particularly valuable for failure analysis, as it allows engineers to correlate assembly-level incidents with specific conductor characteristics and their associated insulation tubing.

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

This view joins material specifications with their associated test methods, producing a compliance matrix that shows which tests validate each compound formulation. Specification 3717635 is linked to test method 100 (ASTM D 2671, mechanical test), while specification model_inheritance_0 is linked to test method 101 (IEC 243, electrical test). The aging conditions—ranging from 120°C, 168 hrs. to -40°C, 4 hrs.—are carried through from the test method records, providing context for the environmental stresses under which each material was evaluated. This view supports regulatory compliance reporting by documenting the full test history for each material specification.

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

The material specification to insulation tubing view presents the compound properties alongside the tubing product that embodies them, answering the question of which material properties apply to each installed tube. Specification 3717635 (tensileStrength 4.70, dielectricStrength 5.70) corresponds to tubing QBM (tubingId 1000), while specification 5844257 (tensileStrength 18.80, dielectricStrength 10.80) corresponds to tubing QBM (tubingId 1003). The coldBendTemperature values—ranging from 0.43012016 to 1.8—indicate the lowest temperature at which the tubing can be bent without cracking, a critical parameter for cold-climate installations. This view enables material selection based on both mechanical performance and environmental suitability.

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

Reversing the material-test relationship, this view presents test methods alongside the material specifications they validate. Test method 100 (ASTM D 2671, mechanical, ASTM) validates specification 3717635, while test method 103 (IEC 93, flammability, IEC) validates specification 5844257. The testType field—mechanical, electrical, thermal, flammability—categorizes the nature of the validation, and the standardBody field identifies the governing standards organization. This view supports test planning by showing which specifications still require validation against specific test types.

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

This view joins test methods with the insulation tubing products they are applied to, producing a product-level test coverage report. Test method 100 (ASTM D 2671, mechanical) is applied to tubing QBM (tubingId 1000), while test method 103 (IEC 93, flammability) is applied to tubing QBM (tubingId 1003). The agingCondition field—such as 120°C, 168 hrs. or -40°C, 4 hrs.—provides the environmental context for each test. This view is essential for quality assurance, as it reveals gaps in test coverage and ensures that each tubing product has been validated against the required test types.

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

The dimensional profile to bus bar view links geometric tolerances with the conductor geometry they are designed to accommodate. Profile 1 (insideDiameterMin 20.45, insideDiameterMax 21.70, wallThicknessMin 10.45) corresponds to bus bar 1 (rectangular, crossSectionWidth 0.6, crossSectionHeight 0.52580792), with rectangularBusBarWidth 1.33 and rectangularBusBarHeight 1.09 specified in the profile. Profile 4 (insideDiameterMin 30.80, insideDiameterMax 35.80, wallThicknessMin 20.80) corresponds to bus bar 4 (round, nominalDiameter 21.80), with roundBusBarDiameter 26.80 in the profile. This view ensures that the selected tubing's internal dimensions are compatible with the conductor's external dimensions, maintaining proper fit and dielectric clearance.

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

This view joins dimensional profiles with their associated insulation tubing, presenting the tolerance specifications alongside the product they govern. Profile 1 (shrinkRatio regional-shrink-90) corresponds to tubing QBM (tubingId 1000), while profile 2 (shrinkRatio legacy-shrink-91) corresponds to tubing QBT (tubingId 1001). The insideDiameterMin and insideDiameterMax values define the acceptable range for the tubing's internal diameter after shrinking, while the wallThicknessMin specifies the minimum wall thickness to maintain dielectric integrity. This view supports manufacturing quality control by providing the dimensional acceptance criteria for each tubing product.

## Synthesis

The data structures described in this chapter form a cohesive framework for managing insulation tubing products, their integration with bus bar conductors, and their deployment within switchgear assemblies. The six base tables capture product specifications, material properties, dimensional tolerances, and test methodologies, while the three junction tables establish the relational links between tubing, bus bars, assemblies, and test records. The twelve view definitions provide multiple analytical perspectives—product-to-material, conductor-to-insulation, assembly-to-conductor, and test-to-product—enabling engineers to answer operational questions about compliance, fit, and deployment status. Together, these records support the full lifecycle of insulation system engineering, from compound formulation and dimensional design through assembly integration and field deployment.