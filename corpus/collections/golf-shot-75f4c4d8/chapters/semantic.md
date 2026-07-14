The golf domain under study captures the anatomy of a single shot event alongside the procedural knowledge that governs how such shots are executed. A golfer, equipped with a specific club, strikes a ball toward a target spot on the course, and the outcome of that strike is recorded alongside the shot type, distance, direction, and decision metadata. Separately, the domain models the shot routine as a composite of three procedural sub-elements: a grip technique, an aim procedure, and a posture setup. The relational schema materializes these concepts through a set of normalized base tables linked by foreign keys, and a set of denormalized views that reconstruct the domain facts by joining the base tables back together.

**Table `GolfShot`**

| shotId | shotType | distance | direction | decision | outcome | observedResult | clubId | golferId | spotId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Putting | 0.08502511 | primary-directio-88 | compact-decision-26 | legacy-outcome-85 | regional-observed-84 | 1000 | 1 | 1 |
| 2 | Chipping | 5.0 | adaptive-directio-89 | composite-decision-27 | compact-outcome-86 | legacy-observed-85 | 1001 | 2 | 2 |
| 3 | Pitching | 208.24771 | distributed-directio-90 | primary-decision-28 | composite-outcome-87 | compact-observed-86 | 1002 | 3 | 3 |
| 4 | SandShot | 36.29999923706055 | baseline-directio-91 | adaptive-decision-29 | primary-outcome-88 | composite-observed-87 | 1003 | 4 | 4 |

The `GolfShot` table is the central event table in the domain. Each row represents one discrete shot event, identified by a surrogate `shotId` integer. The shot is classified by `shotType`, which takes values such as `Putting`, `Chipping`, `Pitching`, and `SandShot`. The physical extent of the shot is captured by `distance` (a `DOUBLE`), `direction` (a `VARCHAR`), and `decision` (a `VARCHAR`). The outcome is recorded in `outcome` and `observedResult`, both `VARCHAR` columns. The shot is linked to three other entities through foreign keys: `clubId` references `GolfClub`, `golferId` references `Golfer`, and `spotId` references `TargetSpot`. For example, shot `1` is a `Putting` event at distance `0.08502511`, executed by golfer `1` with club `1000` toward spot `1`, with direction `primary-directio-88`, decision `compact-decision-26`, outcome `legacy-outcome-85`, and observed result `regional-observed-84`. Shot `3` is a `Pitching` event at distance `208.24771`, executed by golfer `3` with club `1002` toward spot `3`.

**Table `GolfClub`**

| id | clubId | clubType | material | length | weight | loft |
|---|---|---|---|---|---|---|
| 1000 | 3001009030020 | seasonal-club-23 | primary-material-94 | 0.6000001 | 1.02669 | 17.45 |
| 1001 | 21642857 | regional-club-24 | adaptive-material-95 | 0.28 | 0.6 | 21.90 |
| 1002 | account_pymes_671 | legacy-club-25 | distributed-material-96 | 0.5 | 0.48410348 | 26.35 |
| 1003 | 611509 | compact-club-26 | baseline-material-97 | 0.93331 | 0.6000001 | 30.80 |

The `GolfClub` table stores the physical attributes of each club. The primary key is the surrogate `id` integer, while `clubId` is a secondary identifier (a `VARCHAR`) that carries domain-level meaning. The club's `clubType` is a `VARCHAR`, and its construction is described by `material` (e.g., `primary-material-94`, `adaptive-material-95`, `distributed-material-96`, `baseline-material-97`). Physical dimensions are captured by `length` (a `DOUBLE`), `weight` (a `DOUBLE`), and `loft` (a `DOUBLE`). Club `1000` has `clubType` `seasonal-club-23`, `material` `primary-material-94`, `length` `0.6000001`, `weight` `1.02669`, and `loft` `17.45`. Club `1003` has `clubType` `compact-club-26`, `material` `baseline-material-97`, `length` `0.93331`, `weight` `0.6000001`, and `loft` `30.80`.

**Table `Golfer`**

| golferId | name | handPreference | skillLevel | routine |
|---|---|---|---|---|
| 1 | Extended Review | Left | adaptive-skill-23 | pilot-routine-14 |
| 2 | Pilot Initiative A | Right | distributed-skill-24 | extended-routine-15 |
| 3 | Baseline Model | Left | baseline-skill-25 | integrated-routine-16 |
| 4 | Distributed Cluster | Right | pilot-skill-26 | seasonal-routine-17 |

The `Golfer` table models the human actor. Its primary key is `golferId` (an integer). The `name` column stores a `VARCHAR` label for the golfer (e.g., `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`). The `handPreference` column is a `VARCHAR` taking values `Left` or `Right`. The `skillLevel` column is a `VARCHAR` encoding a skill tier (e.g., `adaptive-skill-23`, `distributed-skill-24`, `baseline-skill-25`, `pilot-skill-26`). The `routine` column is a `VARCHAR` referencing a routine label (e.g., `pilot-routine-14`, `extended-routine-15`, `integrated-routine-16`, `seasonal-routine-17`). Golfer `1` is named `Extended Review`, is `Left`-handed, has skill level `adaptive-skill-23`, and follows `pilot-routine-14`.

**Table `TargetSpot`**

| id | spotId | xCoordinate | yCoordinate | zCoordinate | surfaceType | distanceFromHole |
|---|---|---|---|---|---|---|
| 1 | 8843760 | 16.45 | 20.70 | 13.70 | Green | 0.04999995 |
| 2 | 3990184 | 20.90 | 25.40 | 17.40 | Fairway | 1.65 |
| 3 | 4277010 | 25.35 | 30.10 | 21.10 | Rough | 0.425 |
| 4 | Catatan | 29.80 | 34.80 | 24.80 | Sand | 32.0 |

The `TargetSpot` table encodes the landing zone on the course. Its primary key is `id` (an integer), with `spotId` as a secondary `VARCHAR` identifier. The spatial position is given by three `DOUBLE` coordinates: `xCoordinate`, `yCoordinate`, and `zCoordinate`. The `surfaceType` is a `VARCHAR` (e.g., `Green`, `Fairway`, `Rough`, `Sand`), and `distanceFromHole` is a `DOUBLE` measuring proximity to the hole. Spot `1` has `spotId` `8843760`, coordinates `(16.45, 20.70, 13.70)`, surface `Green`, and `distanceFromHole` `0.04999995`. Spot `4` has `spotId` `Catatan`, coordinates `(29.80, 34.80, 24.80)`, surface `Sand`, and `distanceFromHole` `32.0`.

**Table `ShotRoutine`**

| routineId | routineName | steps | duration | successRate | techniqueId | procedureId | setupId |
|---|---|---|---|---|---|---|---|
| 100 | Legacy Survey D | seasonal-steps-71 | 4.20 | 15.70 | 727049 | 790490 | 1 |
| 101 | Regional Corridor | regional-steps-72 | 8.40 | 17.40 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | 4060658 | 2 |
| 102 | Seasonal Series | legacy-steps-73 | 12.60 | 19.10 | 2839521 | L384 | 3 |
| 103 | Integrated Assessment A | compact-steps-74 | 16.80 | 20.80 | b10c552a-8fcd-11eb-924d-9cd76263cbd0 | 3012831 | 4 |

The `ShotRoutine` table is the hub of the procedural sub-model. Its primary key is `routineId` (an integer). The `routineName` is a `VARCHAR` label (e.g., `Legacy Survey D`, `Regional Corridor`, `Seasonal Series`, `Integrated Assessment A`). The `steps` column is a `VARCHAR` describing the procedural sequence, and `duration` and `successRate` are `DOUBLE` values. Three foreign keys link this table to the procedural detail tables: `techniqueId` references `GripTechnique`, `procedureId` references `AimProcedure`, and `setupId` references `PostureSetup`. Routine `100` is named `Legacy Survey D`, has `steps` `seasonal-steps-71`, `duration` `4.20`, `successRate` `15.70`, `techniqueId` `727049`, `procedureId` `790490`, and `setupId` `1`. Routine `103` is named `Integrated Assessment A`, has `steps` `compact-steps-74`, `duration` `16.80`, `successRate` `20.80`, `techniqueId` `b10c552a-8fcd-11eb-924d-9cd76263cbd0`, `procedureId` `3012831`, and `setupId` `4`.

**Table `GripTechnique`**

| techniqueId | techniqueName | handPlacement | pressure | applicableShotTypes |
|---|---|---|---|---|
| 727049 | Adaptive Model | pilot-hand-62 | primary-pressure-34 | pilot-applicab-44 |
| f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Primary Cluster | extended-hand-63 | adaptive-pressure-35 | extended-applicab-45 |
| 2839521 | Composite Review D | integrated-hand-64 | distributed-pressure-36 | integrated-applicab-46 |
| b10c552a-8fcd-11eb-924d-9cd76263cbd0 | Compact Initiative | seasonal-hand-65 | baseline-pressure-37 | seasonal-applicab-47 |

The `GripTechnique` table stores the hand-grip configuration for a shot routine. Its primary key is `techniqueId` (a `VARCHAR` that may be a UUID or integer). The `techniqueName` is a `VARCHAR` (e.g., `Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`). The `handPlacement` column is a `VARCHAR` (e.g., `pilot-hand-62`, `extended-hand-63`, `integrated-hand-64`, `seasonal-hand-65`), `pressure` is a `VARCHAR` (e.g., `primary-pressure-34`, `adaptive-pressure-35`, `distributed-pressure-36`, `baseline-pressure-37`), and `applicableShotTypes` is a `VARCHAR` (e.g., `pilot-applicab-44`, `extended-applicab-45`, `integrated-applicab-46`, `seasonal-applicab-47`). Technique `727049` is named `Adaptive Model` with `handPlacement` `pilot-hand-62`, `pressure` `primary-pressure-34`, and `applicableShotTypes` `pilot-applicab-44`.

**Table `AimProcedure`**

| procedureId | procedureName | targetLine | alignmentMethod | visualCue |
|---|---|---|---|---|
| 790490 | Integrated Protocol A | integrated-target-52 | seasonal-alignmen-89 | extended-visual-45 |
| 4060658 | Extended Programme | seasonal-target-53 | regional-alignmen-90 | integrated-visual-46 |
| L384 | Pilot Standard | regional-target-54 | legacy-alignmen-91 | seasonal-visual-47 |
| 3012831 | Baseline Framework D | legacy-target-55 | compact-alignmen-92 | regional-visual-48 |

The `AimProcedure` table captures the aiming configuration for a shot routine. Its primary key is `procedureId` (a `VARCHAR`). The `procedureName` is a `VARCHAR` (e.g., `Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`). The `aimDirection` column is a `VARCHAR` (e.g., `pilot-direction-66`, `extended-direction-67`, `integrated-direction-68`, `seasonal-direction-69`), `alignment` is a `VARCHAR` (e.g., `primary-alignment-38`, `adaptive-alignment-39`, `distributed-alignment-40`, `baseline-alignment-41`), and `targetFocus` is a `VARCHAR` (e.g., `pilot-target-48`, `extended-target-49`, `integrated-target-50`, `seasonal-target-51`). Procedure `790490` is named `Adaptive Model` with `aimDirection` `pilot-direction-66`, `alignment` `primary-alignment-38`, and `targetFocus` `pilot-target-48`.

**Table `PostureSetup`**

| id | setupId | setupName | hipAngle | armPosition | weightDistribution | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|
| 1 | 5f901eb6-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Assessment | 17.70 | pilot-arm-62 | regional-weight-66 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 9736893 | Integrated Survey | 19.40 | extended-arm-63 | legacy-weight-67 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Extended Corridor D | 21.10 | integrated-arm-64 | compact-weight-68 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 9085248 | Pilot Series | 22.80 | seasonal-arm-65 | composite-weight-69 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `PostureSetup` table encodes the body posture configuration for a shot routine. Its primary key is `setupId` (an integer). The `setupName` is a `VARCHAR` (e.g., `Adaptive Model`, `Primary Cluster`, `Composite Review D`, `Compact Initiative`). The `stance` column is a `VARCHAR` (e.g., `pilot-stance-75`, `extended-stance-76`, `integrated-stance-77`, `seasonal-stance-78`), `balance` is a `VARCHAR` (e.g., `primary-balance-42`, `adaptive-balance-43`, `distributed-balance-44`, `baseline-balance-45`), and `weightDistribution` is a `VARCHAR` (e.g., `pilot-weight-52`, `extended-weight-53`, `integrated-weight-54`, `seasonal-weight-55`). Setup `1` is named `Adaptive Model` with `stance` `pilot-stance-75`, `balance` `primary-balance-42`, and `weightDistribution` `pilot-weight-52`.

The foreign-key topology of the schema is straightforward. `GolfShot.clubId` → `GolfClub.id`, `GolfShot.golferId` → `Golfer.golferId`, and `GolfShot.spotId` → `TargetSpot.id` form three one-to-many relationships: each club, golfer, and target spot can be associated with multiple shots, but each shot references exactly one of each. `ShotRoutine.techniqueId` → `GripTechnique.techniqueId`, `ShotRoutine.procedureId` → `AimProcedure.procedureId`, and `ShotRoutine.setupId` → `PostureSetup.setupId` form three analogous one-to-many relationships: each grip technique, aim procedure, and posture setup can be referenced by multiple shot routines, but each routine references exactly one of each. The two sub-graphs (the shot-event graph and the procedural graph) are independent; no foreign key connects `GolfShot` to `ShotRoutine` or any of its children.

**View `golf_shot_golf_club_view`**

```sql
CREATE VIEW golf_shot_golf_club_view AS
SELECT a.shotId, a.shotType, a.distance, a.direction, b.id AS club_id, b.clubId AS club_clubId, b.clubType AS club_clubType
FROM GolfShot a JOIN GolfClub b ON a.clubId = b.id;
```

| shotId | shotType | distance | direction | club_id | club_clubId | club_clubType |
|---|---|---|---|---|---|---|
| 1 | Putting | 0.08502511 | primary-directio-88 | 1000 | 3001009030020 | seasonal-club-23 |
| 2 | Chipping | 5.0 | adaptive-directio-89 | 1001 | 21642857 | regional-club-24 |
| 3 | Pitching | 208.24771 | distributed-directio-90 | 1002 | account_pymes_671 | legacy-club-25 |
| 4 | SandShot | 36.29999923706055 | baseline-directio-91 | 1003 | 611509 | compact-club-26 |

The view `golf_shot_golf_club_view` joins `GolfShot` to `GolfClub` on `GolfShot.clubId = GolfClub.id`, producing a denormalized row per shot that embeds the club's physical attributes directly alongside the shot event. This view answers the question: "What club was used for each shot, and what are that club's specifications?" For instance, the row corresponding to shot `1` shows `shotId` `1`, `shotType` `Putting`, `distance` `0.08502511`, `clubId` `1000`, `clubType` `seasonal-club-23`, `material` `primary-material-94`, `length` `0.6000001`, `weight` `1.02669`, and `loft` `17.45`. The row for shot `3` shows `shotId` `3`, `shotType` `Pitching`, `distance` `208.24771`, `clubId` `1002`, `clubType` `account_pymes_671`, `material` `distributed-material-96`, `length` `0.5`, `weight` `0.48410348`, and `loft` `26.35`.

**View `golf_shot_golfer_view`**

```sql
CREATE VIEW golf_shot_golfer_view AS
SELECT a.shotId, a.shotType, a.distance, a.direction, b.golferId AS golfer_golferId, b.name AS golfer_name, b.handPreference AS golfer_handPreference
FROM GolfShot a JOIN Golfer b ON a.golferId = b.golferId;
```

| shotId | shotType | distance | direction | golfer_golferId | golfer_name | golfer_handPreference |
|---|---|---|---|---|---|---|
| 1 | Putting | 0.08502511 | primary-directio-88 | 1 | Extended Review | Left |
| 2 | Chipping | 5.0 | adaptive-directio-89 | 2 | Pilot Initiative A | Right |
| 3 | Pitching | 208.24771 | distributed-directio-90 | 3 | Baseline Model | Left |
| 4 | SandShot | 36.29999923706055 | baseline-directio-91 | 4 | Distributed Cluster | Right |

The view `golf_shot_golfer_view` joins `GolfShot` to `Golfer` on `GolfShot.golferId = Golfer.golferId`, producing a denormalized row per shot that embeds the golfer's profile directly alongside the shot event. This view answers the question: "Which golfer executed each shot, and what are their characteristics?" The row for shot `2` shows `shotId` `2`, `shotType` `Chipping`, `distance` `5.0`, `golferId` `2`, `name` `Pilot Initiative A`, `handPreference` `Right`, `skillLevel` `distributed-skill-24`, and `routine` `extended-routine-15`. The row for shot `4` shows `shotId` `4`, `shotType` `SandShot`, `distance` `36.29999923706055`, `golferId` `4`, `name` `Distributed Cluster`, `handPreference` `Right`, `skillLevel` `pilot-skill-26`, and `routine` `seasonal-routine-17`.

**View `golf_shot_target_spot_view`**

```sql
CREATE VIEW golf_shot_target_spot_view AS
SELECT a.shotId, a.shotType, a.distance, a.direction, b.id AS spot_id, b.spotId AS spot_spotId, b.xCoordinate AS spot_xCoordinate
FROM GolfShot a JOIN TargetSpot b ON a.spotId = b.id;
```

| shotId | shotType | distance | direction | spot_id | spot_spotId | spot_xCoordinate |
|---|---|---|---|---|---|---|
| 1 | Putting | 0.08502511 | primary-directio-88 | 1 | 8843760 | 16.45 |
| 2 | Chipping | 5.0 | adaptive-directio-89 | 2 | 3990184 | 20.90 |
| 3 | Pitching | 208.24771 | distributed-directio-90 | 3 | 4277010 | 25.35 |
| 4 | SandShot | 36.29999923706055 | baseline-directio-91 | 4 | Catatan | 29.80 |

The view `golf_shot_target_spot_view` joins `GolfShot` to `TargetSpot` on `GolfShot.spotId = TargetSpot.id`, producing a denormalized row per shot that embeds the target spot's spatial and surface attributes directly alongside the shot event. This view answers the question: "Where did each shot land, and what are the coordinates and surface type of that landing zone?" The row for shot `1` shows `shotId` `1`, `shotType` `Putting`, `distance` `0.08502511`, `spotId` `1`, `xCoordinate` `16.45`, `yCoordinate` `20.70`, `zCoordinate` `13.70`, `surfaceType` `Green`, and `distanceFromHole` `0.04999995`. The row for shot `4` shows `shotId` `4`, `shotType` `SandShot`, `distance` `36.29999923706055`, `spotId` `4`, `xCoordinate` `29.80`, `yCoordinate` `34.80`, `zCoordinate` `24.80`, `surfaceType` `Sand`, and `distanceFromHole` `32.0`.

**View `shot_routine_grip_technique_view`**

```sql
CREATE VIEW shot_routine_grip_technique_view AS
SELECT a.routineId, a.routineName, a.steps, a.duration, b.techniqueId AS technique_techniqueId, b.techniqueName AS technique_techniqueName, b.handPlacement AS technique_handPlacement
FROM ShotRoutine a JOIN GripTechnique b ON a.techniqueId = b.techniqueId;
```

| routineId | routineName | steps | duration | technique_techniqueId | technique_techniqueName | technique_handPlacement |
|---|---|---|---|---|---|---|
| 100 | Legacy Survey D | seasonal-steps-71 | 4.20 | 727049 | Adaptive Model | pilot-hand-62 |
| 101 | Regional Corridor | regional-steps-72 | 8.40 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Primary Cluster | extended-hand-63 |
| 102 | Seasonal Series | legacy-steps-73 | 12.60 | 2839521 | Composite Review D | integrated-hand-64 |
| 103 | Integrated Assessment A | compact-steps-74 | 16.80 | b10c552a-8fcd-11eb-924d-9cd76263cbd0 | Compact Initiative | seasonal-hand-65 |

The view `shot_routine_grip_technique_view` joins `ShotRoutine` to `GripTechnique` on `ShotRoutine.techniqueId = GripTechnique.techniqueId`, producing a denormalized row per routine that embeds the grip technique's configuration directly alongside the routine metadata. This view answers the question: "What grip technique is associated with each shot routine, and what are its hand placement, pressure, and applicable shot types?" The row for routine `100` shows `routineId` `100`, `routineName` `Legacy Survey D`, `steps` `seasonal-steps-71`, `duration` `4.20`, `successRate` `15.70`, `techniqueId` `727049`, `techniqueName` `Adaptive Model`, `handPlacement` `pilot-hand-62`, `pressure` `primary-pressure-34`, and `applicableShotTypes` `pilot-applicab-44`. The row for routine `101` shows `routineId` `101`, `routineName` `Regional Corridor`, `steps` `regional-steps-72`, `duration` `8.40`, `successRate` `17.40`, `techniqueId` `f852e24c-9bac-11eb-a8a2-19ed5c03f8d3`, `techniqueName` `Primary Cluster`, `handPlacement` `extended-hand-63`, `pressure` `adaptive-pressure-35`, and `applicableShotTypes` `extended-applicab-45`.

**View `shot_routine_aim_procedure_view`**

```sql
CREATE VIEW shot_routine_aim_procedure_view AS
SELECT a.routineId, a.routineName, a.steps, a.duration, b.procedureId AS procedure_procedureId, b.procedureName AS procedure_procedureName, b.targetLine AS procedure_targetLine
FROM ShotRoutine a JOIN AimProcedure b ON a.procedureId = b.procedureId;
```

| routineId | routineName | steps | duration | procedure_procedureId | procedure_procedureName | procedure_targetLine |
|---|---|---|---|---|---|---|
| 100 | Legacy Survey D | seasonal-steps-71 | 4.20 | 790490 | Integrated Protocol A | integrated-target-52 |
| 101 | Regional Corridor | regional-steps-72 | 8.40 | 4060658 | Extended Programme | seasonal-target-53 |
| 102 | Seasonal Series | legacy-steps-73 | 12.60 | L384 | Pilot Standard | regional-target-54 |
| 103 | Integrated Assessment A | compact-steps-74 | 16.80 | 3012831 | Baseline Framework D | legacy-target-55 |

The view `shot_routine_aim_procedure_view` joins `ShotRoutine` to `AimProcedure` on `ShotRoutine.procedureId = AimProcedure.procedureId`, producing a denormalized row per routine that embeds the aim procedure's configuration directly alongside the routine metadata. This view answers the question: "What aim procedure is associated with each shot routine, and what are its direction, alignment, and target focus?" The row for routine `100` shows `routineId` `100`, `routineName` `Legacy Survey D`, `steps` `seasonal-steps-71`, `duration` `4.20`, `successRate` `15.70`, `procedureId` `790490`, `procedureName` `Adaptive Model`, `aimDirection` `pilot-direction-66`, `alignment` `primary-alignment-38`, and `targetFocus` `pilot-target-48`. The row for routine `102` shows `routineId` `102`, `routineName` `Seasonal Series`, `steps` `legacy-steps-73`, `duration` `12.60`, `successRate` `19.10`, `procedureId` `L384`, `procedureName` `Composite Review D`, `aimDirection` `integrated-direction-68`, `alignment` `distributed-alignment-40`, and `targetFocus` `integrated-target-50`.

**View `shot_routine_posture_setup_view`**

```sql
CREATE VIEW shot_routine_posture_setup_view AS
SELECT a.routineId, a.routineName, a.steps, a.duration, b.id AS setup_id, b.setupId AS setup_setupId, b.setupName AS setup_setupName
FROM ShotRoutine a JOIN PostureSetup b ON a.setupId = b.id;
```

| routineId | routineName | steps | duration | setup_id | setup_setupId | setup_setupName |
|---|---|---|---|---|---|---|
| 100 | Legacy Survey D | seasonal-steps-71 | 4.20 | 1 | 5f901eb6-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Assessment |
| 101 | Regional Corridor | regional-steps-72 | 8.40 | 2 | 9736893 | Integrated Survey |
| 102 | Seasonal Series | legacy-steps-73 | 12.60 | 3 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Extended Corridor D |
| 103 | Integrated Assessment A | compact-steps-74 | 16.80 | 4 | 9085248 | Pilot Series |

The view `shot_routine_posture_setup_view` joins `ShotRoutine` to `PostureSetup` on `ShotRoutine.setupId = PostureSetup.setupId`, producing a denormalized row per routine that embeds the posture setup's configuration directly alongside the routine metadata. This view answers the question: "What posture setup is associated with each shot routine, and what are its stance, balance, and weight distribution?" The row for routine `100` shows `routineId` `100`, `routineName` `Legacy Survey D`, `steps` `seasonal-steps-71`, `duration` `4.20`, `successRate` `15.70`, `setupId` `1`, `setupName` `Adaptive Model`, `stance` `pilot-stance-75`, `balance` `primary-balance-42`, and `weightDistribution` `pilot-weight-52`. The row for routine `103` shows `routineId` `103`, `routineName` `Integrated Assessment A`, `steps` `compact-steps-74`, `duration` `16.80`, `successRate` `20.80`, `setupId` `4`, `setupName` `Compact Initiative`, `stance` `seasonal-stance-78`, `balance` `baseline-balance-45`, and `weightDistribution` `seasonal-weight-55`.

The schema design follows a clean normalization pattern: the shot-event subgraph (`GolfShot` → `GolfClub`, `Golfer`, `TargetSpot`) and the procedural subgraph (`ShotRoutine` → `GripTechnique`, `AimProcedure`, `PostureSetup`) are each fully normalized, with foreign keys enforcing referential integrity at the base-table level. The six views serve as denormalized materializations that reconstruct domain facts by joining the base tables back together, enabling efficient read patterns for queries that need the full context of a shot event or a shot routine without requiring the application layer to issue multi-table joins. The absence of a direct link between the shot-event and procedural subgraphs reflects a deliberate design choice: shot outcomes are recorded independently of the routine that produced them, allowing the same routine to be evaluated across different shots, and the same shot to be analyzed under different routine hypotheses.