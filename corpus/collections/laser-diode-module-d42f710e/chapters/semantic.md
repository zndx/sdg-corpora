In the domain of optoelectronic component engineering, a laser diode module is the central artifact: a packaged semiconductor device that converts electrical signals into coherent light at a precisely specified wavelength, with performance bounded by thermal and electrical operating conditions. The relational model captures this artifact through six base tables that separate the module's intrinsic electrical parameters from its physical interconnects, its packaging, and its environmental envelope. Four materialized views then reassemble these normalized pieces into domain-level facts — each view answering a specific engineering question by joining the module to one of its associated components or conditions.

## Entity Types and Their Attributes

The model's primary entity is the laser diode module itself, stored in `LaserDiodeModule`. Each row represents a distinct module identified by a surrogate integer `id` and a human-readable `partNumber` such as `PAR-2291`, `PAR-2297`, `PAR-2303`, or `PAR-2309`. The module's optical and electrical characteristics are recorded as numeric columns: `centerWavelength` (measured in nanometers, ranging from 23.70 to 37.80 across the sample), `outputPower` (from 20.70 to 34.80), `monitorCurrent` (5.95 to 17.80), `thresholdCurrent` (9.45 to 22.80), `operatingCurrent` (9.70 to 14.80), and `operatingVoltage` (21.95 to 33.80). The column `fiberLength` (approximately 0.42 to 0.60) records the length of the fiber spliced to the module. Three foreign-key columns — `connectorId`, `fiberId`, and `styleId` — bind each module to its physical accessories and packaging, discussed below.

**Table `LaserDiodeModule`**

| id | partNumber | centerWavelength | outputPower | monitorCurrent | thresholdCurrent | operatingCurrent | operatingVoltage | fiberLength | connectorId | fiberId | styleId |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | PAR-2291 | 23.70 | 20.70 | 5.95 | 9.45 | 9.70 | 21.95 | 0.6000001 | 1 | 1 | 100 |
| 2 | PAR-2297 | 28.40 | 25.40 | 9.90 | 13.90 | 11.40 | 25.90 | 0.6 | 2 | 2 | 101 |
| 3 | PAR-2303 | 33.10 | 30.10 | 13.85 | 18.35 | 13.10 | 29.85 | 0.42195992 | 3 | 3 | 102 |
| 4 | PAR-2309 | 37.80 | 34.80 | 17.80 | 22.80 | 14.80 | 33.80 | 0.42195992 | 4 | 4 | 103 |

The `FiberConnector` table holds the connector that terminates the module's fiber. Its primary key is `connectorId`, and it carries two descriptive columns: `connectorType`, which encodes the connector family (for example, `compact-connecto-92`, `composite-connecto-93`, `primary-connecto-94`, or `adaptive-connecto-95`), and `fiberLength`, which mirrors the spliced fiber length at the connector interface. The four rows in this table correspond one-to-one with the four modules, establishing a 1:1 relationship between module and connector.

**Table `FiberConnector`**

| connectorId | connectorType | fiberLength |
|---|---|---|
| 1 | compact-connecto-92 | 0.6000001 |
| 2 | composite-connecto-93 | 0.6 |
| 3 | primary-connecto-94 | 0.42195992 |
| 4 | adaptive-connecto-95 | 0.42195992 |

The `OpticalFiber` table describes the fiber strand itself. Its primary key is `fiberId`, and it carries `fiberType` (such as `pilot-fiber-80`, `extended-fiber-81`, `integrated-fiber-82`, or `seasonal-fiber-83`) and `fiberCore`, which identifies the core variant (e.g., `pilot-fiber-68`, `extended-fiber-69`, `integrated-fiber-70`, `seasonal-fiber-71`). Again, four rows exist, each linked to a single module through the `fiberId` foreign key in `LaserDiodeModule`.

**Table `OpticalFiber`**

| fiberId | fiberType | fiberCore |
|---|---|---|
| 1 | pilot-fiber-80 | pilot-fiber-68 |
| 2 | extended-fiber-81 | extended-fiber-69 |
| 3 | integrated-fiber-82 | integrated-fiber-70 |
| 4 | seasonal-fiber-83 | seasonal-fiber-71 |

The `PackageStyle` table captures the mechanical housing or package in which the module is mounted. Its primary key is `styleId`, and the column `packageStyle` holds values like `composite-package-81`, `primary-package-82`, `adaptive-package-83`, and `distributed-package-84`. The `styleId` values (100 through 103) are referenced by `LaserDiodeModule.styleId`, forming another 1:1 association.

**Table `PackageStyle`**

| styleId | packageStyle |
|---|---|
| 100 | composite-package-81 |
| 101 | primary-package-82 |
| 102 | adaptive-package-83 |
| 103 | distributed-package-84 |

The `Photodiode` table models the monitor photodiode integrated within the module for optical power feedback. Its primary key is `id`, with columns `pdReverseVoltage` (ranging from 16.70 to 24.80) and `monitorCurrent` (5.95 to 17.80). The `monitorCurrent` values in this table are numerically identical to the `monitorCurrent` values in `LaserDiodeModule`, suggesting that the photodiode's monitor current is either a derived specification or a redundant recording of the module-level parameter. The four photodiode rows (ids 1000–1003) correspond to the four modules, though no explicit foreign key from `LaserDiodeModule` to `Photodiode` is present in the schema; the correspondence is established through matching `monitorCurrent` values.

**Table `Photodiode`**

| id | pdReverseVoltage | monitorCurrent |
|---|---|---|
| 1000 | 16.70 | 5.95 |
| 1001 | 19.40 | 9.90 |
| 1002 | 22.10 | 13.85 |
| 1003 | 24.80 | 17.80 |

The `OperatingCondition` table records the environmental and electrical limits under which each module is rated. Its primary key is `id`, and it carries `operatingTemperature`, `storageTemperature`, `solderingTemperature`, and `reverseVoltage` — all numeric. The column `moduleId` is a foreign key pointing to `LaserDiodeModule.id`, establishing a 1:1 relationship between a module and its operating envelope. The four rows (ids 1–4) correspond to modules 1–4, with operating temperatures ranging from 0.28 to 0.74, storage temperatures from 0.075 to 0.625, soldering temperatures from 13.45 to 23.80, and reverse voltages from 19.45 to 32.80.

**Table `OperatingCondition`**

| id | operatingTemperature | storageTemperature | solderingTemperature | reverseVoltage | moduleId |
|---|---|---|---|---|---|
| 1 | 0.48561337 | 0.625 | 13.45 | 19.45 | 1 |
| 2 | 0.2849275832422 | 0.6 | 16.90 | 23.90 | 2 |
| 3 | 0.74 | 0.07500005 | 20.35 | 28.35 | 3 |
| 4 | 0.46 | 0.331550802139037 | 23.80 | 32.80 | 4 |

## Cardinality and Normalization

The schema follows a star-like normalization pattern. `LaserDiodeModule` is the fact table, and each of the five remaining tables is a dimension table. Every dimension table has exactly four rows, and every foreign key in `LaserDiodeModule` (`connectorId`, `fiberId`, `styleId`) and the foreign key in `OperatingCondition` (`moduleId`) point to a unique row in the corresponding dimension. This 1:1 cardinality means that no junction table is required; each relationship is represented by a single integer column in the referencing table. The `Photodiode` table is the only dimension without a direct foreign key from `LaserDiodeModule`; its association is implicit, inferred through the matching `monitorCurrent` column.

The normalization eliminates redundancy in connector types, fiber specifications, and package styles. For example, the connector type `compact-connecto-92` is stored once in `FiberConnector` and referenced by `LaserDiodeModule.connectorId = 1`, rather than being repeated as a free-text field in every module row. Similarly, the package style `distributed-package-84` appears only in `PackageStyle.styleId = 103` and is reached through `LaserDiodeModule.styleId = 103`.

## Materialized Views and Domain Facts

Four views materialize the normalized schema into domain-level queries. Each view joins `LaserDiodeModule` to one dimension table, producing a denormalized result that answers a specific engineering question.

### Module–Connector Association

The view `vw_laser_diode_module_fiber_connector` joins `LaserDiodeModule` to `FiberConnector` on `connectorId`. It reconstructs the complete picture of a module and its terminating connector in a single row. For module `PAR-2291` (id 1), the view yields the connector type `compact-connecto-92` and fiber length `0.6000001`; for module `PAR-2309` (id 4), it yields `adaptive-connecto-95` and the same fiber length `0.42195992`. This view answers the question: "Given a module part number, what connector terminates its fiber and at what length?"

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

### Module–Fiber Association

The view `vw_laser_diode_module_optical_fiber` joins `LaserDiodeModule` to `OpticalFiber` on `fiberId`. It pairs each module with its fiber type and core specification. Module `PAR-2291` is associated with `pilot-fiber-80` and core `pilot-fiber-68`; module `PAR-2303` with `integrated-fiber-82` and core `integrated-fiber-70`. This view answers: "What optical fiber and core variant are spliced to a given module?"

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

### Module–Package Association

The view `vw_laser_diode_module_package_style` joins `LaserDiodeModule` to `PackageStyle` on `styleId`. It reveals the mechanical housing for each module. Module `PAR-2291` uses `composite-package-81` (style 100), while module `PAR-2309` uses `distributed-package-84` (style 103). This view answers: "Which package style houses a given laser diode module?"

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

### Module–Operating Condition Association

The view `vw_operating_condition_laser_diode_module` joins `LaserDiodeModule` to `OperatingCondition` on `moduleId`. It combines the module's electrical parameters with its environmental ratings. For module `PAR-2291`, the view shows an operating temperature of `0.48561337`, a storage temperature of `0.625`, a soldering temperature of `13.45`, and a reverse voltage of `19.45`. For module `PAR-2303`, the operating temperature rises to `0.74`, the storage temperature drops to `0.07500005`, and the reverse voltage increases to `28.35`. This view answers: "Under what thermal and electrical conditions is a given module rated to operate?"

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

## Synthesis

The relational model separates concerns cleanly: the `LaserDiodeModule` table owns the module's intrinsic electrical and optical specifications, while four dimension tables (`FiberConnector`, `OpticalFiber`, `PackageStyle`, `OperatingCondition`) own the module's physical and environmental attributes. A fifth dimension (`Photodiode`) captures the integrated monitor photodiode, linked implicitly through a shared `monitorCurrent` value. The four materialized views reassemble these pieces into domain-level facts, each answering a single engineering question by joining the module to one dimension. The 1:1 cardinality of every relationship means the schema is fully normalized without requiring junction tables, and the denormalized views provide a convenient query surface for engineers who need to reason about a module and its associated components or conditions in a single result set.