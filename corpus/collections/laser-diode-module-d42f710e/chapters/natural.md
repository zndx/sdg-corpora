## Optical Component Manufacturing and Test Records

The production and qualification of laser diode modules for telecommunications and sensing applications demands precise tracking of every optical, electrical, and mechanical attribute. Each module moves through assembly, characterization, and environmental qualification, generating a trail of measurements that engineers consult when diagnosing performance drift, selecting components for a system, or auditing a production lot. The records described here capture that trail: part identifiers, optical specifications, mechanical packaging choices, connector and fiber assignments, photodiode monitoring parameters, and the environmental conditions under which each module was tested.

**Table `LaserDiodeModule`**

| id | partNumber | centerWavelength | outputPower | monitorCurrent | thresholdCurrent | operatingCurrent | operatingVoltage | fiberLength | connectorId | fiberId | styleId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | PAR-2291 | 23.70 | 20.70 | 5.95 | 9.45 | 9.70 | 21.95 | 0.6000001 | 1 | 1 | 100 |
| 2 | PAR-2297 | 28.40 | 25.40 | 9.90 | 13.90 | 11.40 | 25.90 | 0.6 | 2 | 2 | 101 |
| 3 | PAR-2303 | 33.10 | 30.10 | 13.85 | 18.35 | 13.10 | 29.85 | 0.42195992 | 3 | 3 | 102 |
| 4 | PAR-2309 | 37.80 | 34.80 | 17.80 | 22.80 | 14.80 | 33.80 | 0.42195992 | 4 | 4 | 103 |

The LaserDiodeModule table is the central record for every assembled unit. Each row identifies a module by a part number such as PAR-2291 or PAR-2309 and records its optical and electrical operating parameters. The center wavelength spans from 23.70 nanometers for the first module up to 37.80 for the fourth, reflecting the range of optical bands these devices are designed to serve. Output power follows a similar progression, with values of 20.70, 25.40, 30.10, and 34.80 units respectively. The monitor current, threshold current, operating current, and operating voltage all increase in tandem across the four modules, indicating a correlated design where higher-power devices draw more current and dissipate more heat. The fiber length field records the length of the attached fiber lead, with values near 0.6 for the first two modules and approximately 0.422 for the latter two. Three foreign-key columns—connectorId, fiberId, and styleId—link each module to its connector, optical fiber, and package style, respectively.

**Table `FiberConnector`**

| connectorId | connectorType | fiberLength |
|---|---|---|
| 1 | compact-connecto-92 | 0.6000001 |
| 2 | composite-connecto-93 | 0.6 |
| 3 | primary-connecto-94 | 0.42195992 |
| 4 | adaptive-connecto-95 | 0.42195992 |

Fiber connectors define the mechanical interface through which light exits the module and couples into the downstream system. The FiberConnector table stores the connector type and a fiber length attribute. Connector types include compact-connecto-92, composite-connecto-93, primary-connecto-94, and adaptive-connecto-95. The fiber length recorded here mirrors the fiberLength field in the LaserDiodeModule table, confirming that the connector and the module share a consistent measurement of the attached fiber lead. For example, module PAR-2291 references connector 1, which is a compact-connecto-92 with a fiber length of 0.6000001, matching the module's own fiberLength value.

**Table `OpticalFiber`**

| fiberId | fiberType | fiberCore |
|---|---|---|
| 1 | pilot-fiber-80 | pilot-fiber-68 |
| 2 | extended-fiber-81 | extended-fiber-69 |
| 3 | integrated-fiber-82 | integrated-fiber-70 |
| 4 | seasonal-fiber-83 | seasonal-fiber-71 |

The optical fiber itself is cataloged separately in the OpticalFiber table, which records the fiber type and the fiber core specification. The four entries use descriptive identifiers such as pilot-fiber-80 paired with pilot-fiber-68 for the core, extended-fiber-81 with extended-fiber-69, integrated-fiber-82 with integrated-fiber-70, and seasonal-fiber-83 with seasonal-fiber-71. Each fiber is linked to a laser diode module through the fiberId foreign key in the LaserDiodeModule table. Module PAR-2303, for instance, uses fiber 3, which is an integrated-fiber-82 with an integrated-fiber-70 core.

**Table `PackageStyle`**

| styleId | packageStyle |
|---|---|
| 100 | composite-package-81 |
| 101 | primary-package-82 |
| 102 | adaptive-package-83 |
| 103 | distributed-package-84 |

Package style captures the mechanical housing and form factor of the module. The PackageStyle table lists composite-package-81, primary-package-82, adaptive-package-83, and distributed-package-84 for style identifiers 100 through 103. The styleId in LaserDiodeModule points to this table, so module PAR-2291 (styleId 100) is housed in a composite-package-81, while module PAR-2309 (styleId 103) uses a distributed-package-84. The progression of package styles across the four modules suggests a deliberate mapping between module power class and mechanical enclosure.

**Table `Photodiode`**

| id | pdReverseVoltage | monitorCurrent |
|---|---|---|
| 1000 | 16.70 | 5.95 |
| 1001 | 19.40 | 9.90 |
| 1002 | 22.10 | 13.85 |
| 1003 | 24.80 | 17.80 |

Photodiodes provide the internal monitoring capability that allows a laser diode module to report its own output level. The Photodiode table records the reverse voltage applied to the photodiode and the monitor current it produces. The four photodiodes have reverse voltages of 16.70, 19.40, 22.10, and 24.80, and monitor currents of 5.95, 9.90, 13.85, and 17.80. These monitor current values are identical to the monitorCurrent values in the LaserDiodeModule table, establishing a direct correspondence: the photodiode on module PAR-2291 produces a monitor current of 5.95 at a reverse voltage of 16.70, and so on through the series. This alignment means that the monitor current recorded on the module row can be traced back to a specific photodiode device.

**Table `OperatingCondition`**

| id | operatingTemperature | storageTemperature | solderingTemperature | reverseVoltage | moduleId |
|---|---|---|---|---|---|
| 1 | 0.48561337 | 0.625 | 13.45 | 19.45 | 1 |
| 2 | 0.2849275832422 | 0.6 | 16.90 | 23.90 | 2 |
| 3 | 0.74 | 0.07500005 | 20.35 | 28.35 | 3 |
| 4 | 0.46 | 0.331550802139037 | 23.80 | 32.80 | 4 |

Environmental qualification records are stored in the OperatingCondition table, which links each module to a set of test conditions. The table records operating temperature, storage temperature, soldering temperature, reverse voltage, and a moduleId foreign key that references the LaserDiodeModule. Module 1 was tested at an operating temperature of 0.48561337, a storage temperature of 0.625, a soldering temperature of 13.45, and a reverse voltage of 19.45. Module 2 saw operating temperature of 0.2849275832422, storage temperature of 0.6, soldering temperature of 16.90, and reverse voltage of 23.90. The soldering temperature increases from 13.45 to 23.80 across the four modules, while the reverse voltage rises from 19.45 to 32.80, reflecting the higher electrical stress applied to higher-power devices during qualification.

### Connector and Module Relationships

The view vw_laser_diode_module_fiber_connector joins the LaserDiodeModule table with the FiberConnector table on the connectorId field, producing a single row per module that displays both the module's part number and the connector type assigned to it. This join answers the question of which connector type is paired with each module, a detail that matters for system integrators selecting mating components. The first row shows PAR-2291 paired with compact-connecto-92, with a fiber length of 0.6000001 on both sides of the join. The fourth row pairs PAR-2309 with adaptive-connecto-95 and a fiber length of 0.42195992. The consistency of the fiber length across both tables confirms that the connector and module records describe the same physical lead.

**View `vw_laser_diode_module_fiber_connector`**

```sql
CREATE VIEW vw_laser_diode_module_fiber_connector AS
SELECT a.id, a.partNumber, a.centerWavelength, a.outputPower, b.connectorId AS connector_connectorId, b.connectorType AS connector_connectorType, b.fiberLength AS connector_fiberLength
FROM LaserDiodeModule a JOIN FiberConnector b ON a.connectorId = b.connectorId;
```

| id | partNumber | centerWavelength | outputPower | connector_connectorId | connector_connectorType | connector_fiberLength |
|---|---|---|---|---|---|---|
| 1 | PAR-2291 | 23.70 | 20.70 | 1 | compact-connecto-92 | 0.6000001 |
| 2 | PAR-2297 | 28.40 | 25.40 | 2 | composite-connecto-93 | 0.6 |
| 3 | PAR-2303 | 33.10 | 30.10 | 3 | primary-connecto-94 | 0.42195992 |
| 4 | PAR-2309 | 37.80 | 34.80 | 4 | adaptive-connecto-95 | 0.42195992 |

### Fiber and Module Relationships

The view vw_laser_diode_module_optical_fiber joins LaserDiodeModule with OpticalFiber on the fiberId field, revealing which optical fiber and fiber core are assigned to each module. This join is essential for understanding the optical path from the laser die through the fiber to the connector. The first row shows PAR-2291 using pilot-fiber-80 with a pilot-fiber-68 core. The third row shows PAR-2303 using integrated-fiber-82 with an integrated-fiber-70 core. The fiber length of 0.42195992 on the third and fourth rows matches the fiber length recorded on the corresponding modules, providing a cross-check that the fiber and module records are synchronized.

**View `vw_laser_diode_module_optical_fiber`**

```sql
CREATE VIEW vw_laser_diode_module_optical_fiber AS
SELECT a.id, a.partNumber, a.centerWavelength, a.outputPower, b.fiberId AS fiber_fiberId, b.fiberType AS fiber_fiberType, b.fiberCore AS fiber_fiberCore
FROM LaserDiodeModule a JOIN OpticalFiber b ON a.fiberId = b.fiberId;
```

| id | partNumber | centerWavelength | outputPower | fiber_fiberId | fiber_fiberType | fiber_fiberCore |
|---|---|---|---|---|---|---|
| 1 | PAR-2291 | 23.70 | 20.70 | 1 | pilot-fiber-80 | pilot-fiber-68 |
| 2 | PAR-2297 | 28.40 | 25.40 | 2 | extended-fiber-81 | extended-fiber-69 |
| 3 | PAR-2303 | 33.10 | 30.10 | 3 | integrated-fiber-82 | integrated-fiber-70 |
| 4 | PAR-2309 | 37.80 | 34.80 | 4 | seasonal-fiber-83 | seasonal-fiber-71 |

### Package Style and Module Relationships

The view vw_laser_diode_module_package_style joins LaserDiodeModule with PackageStyle on the styleId field, mapping each module to its mechanical housing. This relationship is critical for thermal management and mechanical integration, as the package style determines the heat dissipation characteristics and mounting footprint. The first row shows PAR-2291 in composite-package-81, while the fourth row shows PAR-2309 in distributed-package-84. The package style identifiers (100 through 103) are distinct from the module identifiers (1 through 4), and the join makes the mapping explicit: each module has exactly one package style, and each style can serve multiple modules.

**View `vw_laser_diode_module_package_style`**

```sql
CREATE VIEW vw_laser_diode_module_package_style AS
SELECT a.id, a.partNumber, a.centerWavelength, a.outputPower, b.styleId AS style_styleId, b.packageStyle AS style_packageStyle
FROM LaserDiodeModule a JOIN PackageStyle b ON a.styleId = b.styleId;
```

| id | partNumber | centerWavelength | outputPower | style_styleId | style_packageStyle |
|---|---|---|---|---|---|
| 1 | PAR-2291 | 23.70 | 20.70 | 100 | composite-package-81 |
| 2 | PAR-2297 | 28.40 | 25.40 | 101 | primary-package-82 |
| 3 | PAR-2303 | 33.10 | 30.10 | 102 | adaptive-package-83 |
| 4 | PAR-2309 | 37.80 | 34.80 | 103 | distributed-package-84 |

### Operating Conditions and Module Relationships

The view vw_operating_condition_laser_diode_module joins OperatingCondition with LaserDiodeModule on the moduleId field, attaching the environmental test parameters to the module's part number and optical specifications. This join answers the question of what conditions each module was subjected to during qualification, enabling engineers to correlate performance with test severity. The first row shows PAR-2291 tested at an operating temperature of 0.48561337, storage temperature of 0.625, soldering temperature of 13.45, and reverse voltage of 19.45. The fourth row shows PAR-2309 tested at an operating temperature of 0.46, storage temperature of 0.331550802139037, soldering temperature of 23.80, and reverse voltage of 32.80. The soldering temperature and reverse voltage both increase with module power class, indicating that higher-power modules undergo more aggressive qualification profiles.

**View `vw_operating_condition_laser_diode_module`**

```sql
CREATE VIEW vw_operating_condition_laser_diode_module AS
SELECT a.id, a.operatingTemperature, a.storageTemperature, a.solderingTemperature, b.id AS module_id, b.partNumber AS module_partNumber, b.centerWavelength AS module_centerWavelength
FROM OperatingCondition a JOIN LaserDiodeModule b ON a.moduleId = b.id;
```

| id | operatingTemperature | storageTemperature | solderingTemperature | module_id | module_partNumber | module_centerWavelength |
|---|---|---|---|---|---|---|
| 1 | 0.48561337 | 0.625 | 13.45 | 1 | PAR-2291 | 23.70 |
| 2 | 0.2849275832422 | 0.6 | 16.90 | 2 | PAR-2297 | 28.40 |
| 3 | 0.74 | 0.07500005 | 20.35 | 3 | PAR-2303 | 33.10 |
| 4 | 0.46 | 0.331550802139037 | 23.80 | 4 | PAR-2309 | 37.80 |

### Synthesis

The records described in this chapter form a coherent picture of laser diode module manufacturing and qualification. Each module is identified by a part number and characterized by its optical and electrical parameters. It is fitted with a specific connector, optical fiber, and package style, each tracked in its own reference table and linked through foreign keys. A photodiode provides monitoring capability, with its reverse voltage and monitor current recorded in a separate table that aligns with the module's own monitor current value. Finally, each module is associated with a set of environmental test conditions that document the stress levels it survived during qualification. Together, these tables and their joined views provide a complete audit trail from component selection through final test, enabling engineers to trace any performance characteristic back to its source and to compare modules across different design choices and test profiles.