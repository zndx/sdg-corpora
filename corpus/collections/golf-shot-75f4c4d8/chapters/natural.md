## The Architecture of a Golf Shot

Every executed golf shot is a convergence of equipment, athlete, terrain, and procedure. The domain records capture this convergence at the moment of impact and the conditions surrounding it. A shot is defined by its type, distance, direction, and outcome; it is attributed to a specific golfer wielding a specific club on a specific target spot. The routine that preceded the shot — its grip, aim, and posture — is logged separately but linked through shared identifiers, allowing analysts to reconstruct the full chain of decisions from setup through result. The following sections describe each record type, the measurements they carry, and the relationships that bind them into a coherent picture of performance.

**Table `GolfShot`**

| shotId | shotType | distance | direction | decision | outcome | observedResult | clubId | golferId | spotId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | Putting | 0.08502511 | primary-directio-88 | compact-decision-26 | legacy-outcome-85 | regional-observed-84 | 1000 | 1 | 1 |
| 2 | Chipping | 5.0 | adaptive-directio-89 | composite-decision-27 | compact-outcome-86 | legacy-observed-85 | 1001 | 2 | 2 |
| 3 | Pitching | 208.24771 | distributed-directio-90 | primary-decision-28 | composite-outcome-87 | compact-observed-86 | 1002 | 3 | 3 |
| 4 | SandShot | 36.29999923706055 | baseline-directio-91 | adaptive-decision-29 | primary-outcome-88 | composite-observed-87 | 1003 | 4 | 4 |

The `GolfShot` table is the central event log. Each row captures a single shot with its type (`Putting`, `Chipping`, `Pitching`, `SandShot`), the distance traveled, the directional classification, and the decision and outcome codes that describe the golfer's intent and the result. The `observedResult` field records what was actually seen on the course. Foreign keys `clubId`, `golferId`, and `spotId` tie the shot to its equipment, athlete, and landing location. For example, shot 1 is a `Putting` event at a distance of 0.085 units, executed by golfer 1 with club 1000 on target spot 1, yielding a `legacy-outcome-85`. Shot 3, by contrast, is a `Pitching` shot covering 208.25 units, performed by golfer 3 with club 1002 on spot 3, producing a `composite-outcome-87`. The directional codes (`primary-directio-88`, `distributed-directio-90`, etc.) and decision codes (`compact-decision-26`, `primary-decision-28`) encode the golfer's strategic choices, while the outcome and observed result fields capture the actual performance.

**Table `GolfClub`**

| id | clubId | clubType | material | length | weight | loft |
|---|---|---|---|---|---|---|
| 1000 | 3001009030020 | seasonal-club-23 | primary-material-94 | 0.6000001 | 1.02669 | 17.45 |
| 1001 | 21642857 | regional-club-24 | adaptive-material-95 | 0.28 | 0.6 | 21.90 |
| 1002 | account_pymes_671 | legacy-club-25 | distributed-material-96 | 0.5 | 0.48410348 | 26.35 |
| 1003 | 611509 | compact-club-26 | baseline-material-97 | 0.93331 | 0.6000001 | 30.80 |

Equipment is catalogued in the `GolfClub` table, which stores the physical specifications of each club. The `clubType` field classifies the club (e.g., `seasonal-club-23`, `regional-club-24`), while `material` describes its construction (`primary-material-94`, `adaptive-material-95`). The numerical attributes — `length`, `weight`, and `loft` — are the measurable parameters that affect ball flight. Club 1000, a `seasonal-club-23` made of `primary-material-94`, has a length of 0.6, weighs 1.027 units, and carries a loft of 17.45 degrees. Club 1003, a `compact-club-26` of `baseline-material-97`, is longer at 0.933 units with a loft of 30.80 degrees. The loft values range from 17.45 to 30.80 degrees across the four clubs, reflecting the progression from shorter, lower-lofted clubs to longer, higher-lofted ones.

**Table `Golfer`**

| golferId | name | handPreference | skillLevel | routine |
|---|---|---|---|---|
| 1 | Extended Review | Left | adaptive-skill-23 | pilot-routine-14 |
| 2 | Pilot Initiative A | Right | distributed-skill-24 | extended-routine-15 |
| 3 | Baseline Model | Left | baseline-skill-25 | integrated-routine-16 |
| 4 | Distributed Cluster | Right | pilot-skill-26 | seasonal-routine-17 |

The `Golfer` table profiles the athletes. Each record includes the golfer's `name`, `handPreference` (`Left` or `Right`), `skillLevel`, and the `routine` they typically follow. Golfer 1, named "Extended Review," is a left-handed player at the `adaptive-skill-23` level who follows a `pilot-routine-14`. Golfer 4, "Distributed Cluster," is right-handed at the `pilot-skill-26` level and uses a `seasonal-routine-17`. The skill levels (`adaptive-skill-23` through `pilot-skill-26`) and routine identifiers (`pilot-routine-14` through `seasonal-routine-17`) provide categorical context for performance analysis, while the hand preference is a critical factor in shot direction and grip selection.

**Table `TargetSpot`**

| id | spotId | xCoordinate | yCoordinate | zCoordinate | surfaceType | distanceFromHole |
|---|---|---|---|---|---|---|
| 1 | 8843760 | 16.45 | 20.70 | 13.70 | Green | 0.04999995 |
| 2 | 3990184 | 20.90 | 25.40 | 17.40 | Fairway | 1.65 |
| 3 | 4277010 | 25.35 | 30.10 | 21.10 | Rough | 0.425 |
| 4 | Catatan | 29.80 | 34.80 | 24.80 | Sand | 32.0 |

Target spots define the landing or playing locations on the course. Each spot has three-dimensional coordinates (`xCoordinate`, `yCoordinate`, `zCoordinate`), a `surfaceType` (`Green`, `Fairway`, `Rough`, `Sand`), and a `distanceFromHole` measurement. Spot 1, with identifier `8843760`, sits at coordinates (16.45, 20.70, 13.70) on a `Green` surface, just 0.05 units from the hole. Spot 4, identified as `Catatan`, is located at (29.80, 34.80, 24.80) on a `Sand` surface, 32 units from the hole. The surface types correspond to the shot types in `GolfShot`: putting shots land on greens, chipping shots on fairways, pitching shots on rough, and sand shots on sand. The distance from hole ranges from near-zero for putting positions to 32 units for bunker shots.

**Table `ShotRoutine`**

| routineId | routineName | steps | duration | successRate | techniqueId | procedureId | setupId |
|---|---|---|---|---|---|---|---|
| 100 | Legacy Survey D | seasonal-steps-71 | 4.20 | 15.70 | 727049 | 790490 | 1 |
| 101 | Regional Corridor | regional-steps-72 | 8.40 | 17.40 | f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | 4060658 | 2 |
| 102 | Seasonal Series | legacy-steps-73 | 12.60 | 19.10 | 2839521 | L384 | 3 |
| 103 | Integrated Assessment A | compact-steps-74 | 16.80 | 20.80 | b10c552a-8fcd-11eb-924d-9cd76263cbd0 | 3012831 | 4 |

The `ShotRoutine` table records the procedural framework that precedes each shot. Each routine has a `routineName`, a set of `steps`, a `duration` in seconds, a `successRate` percentage, and foreign keys linking to the `GripTechnique`, `AimProcedure`, and `PostureSetup` tables. Routine 100, "Legacy Survey D," has a duration of 4.20 seconds and a success rate of 15.70 percent. Routine 103, "Integrated Assessment A," takes 16.80 seconds and achieves a 20.80 percent success rate. The `steps` field encodes the procedural sequence (e.g., `seasonal-steps-71`, `compact-steps-74`), while the technique, procedure, and setup identifiers connect the routine to its component techniques.

**Table `GripTechnique`**

| techniqueId | techniqueName | handPlacement | pressure | applicableShotTypes |
|---|---|---|---|---|
| 727049 | Adaptive Model | pilot-hand-62 | primary-pressure-34 | pilot-applicab-44 |
| f852e24c-9bac-11eb-a8a2-19ed5c03f8d3 | Primary Cluster | extended-hand-63 | adaptive-pressure-35 | extended-applicab-45 |
| 2839521 | Composite Review D | integrated-hand-64 | distributed-pressure-36 | integrated-applicab-46 |
| b10c552a-8fcd-11eb-924d-9cd76263cbd0 | Compact Initiative | seasonal-hand-65 | baseline-pressure-37 | seasonal-applicab-47 |

Grip techniques define how the golfer holds the club. The `techniqueName` (e.g., "Adaptive Model," "Primary Cluster") describes the grip style, `handPlacement` specifies the hand positioning code, `pressure` encodes the grip pressure level, and `applicableShotTypes` lists the shot types for which the grip is recommended. Technique 727049, "Adaptive Model," uses `pilot-hand-62` placement with `primary-pressure-34` and is applicable to `pilot-applicab-44` shot types. Technique `b10c552a-8fcd-11eb-924d-9cd76263cbd0`, "Compact Initiative," uses `seasonal-hand-65` placement with `baseline-pressure-37` and applies to `seasonal-applicab-47` shot types.

**Table `AimProcedure`**

| procedureId | procedureName | targetLine | alignmentMethod | visualCue |
|---|---|---|---|---|
| 790490 | Integrated Protocol A | integrated-target-52 | seasonal-alignmen-89 | extended-visual-45 |
| 4060658 | Extended Programme | seasonal-target-53 | regional-alignmen-90 | integrated-visual-46 |
| L384 | Pilot Standard | regional-target-54 | legacy-alignmen-91 | seasonal-visual-47 |
| 3012831 | Baseline Framework D | legacy-target-55 | compact-alignmen-92 | regional-visual-48 |

Aim procedures govern the alignment and targeting process before the swing. The table stores the procedure identifier, name, alignment method, target selection logic, and wind adjustment strategy. The specific procedure records (identified by codes such as `790490`, `4060658`, `L384`, and `3012831`) define the aiming protocol that each routine incorporates. These procedures determine how the golfer aligns the clubface, selects the target line, and compensates for environmental factors.

**Table `PostureSetup`**

| id | setupId | setupName | hipAngle | armPosition | weightDistribution | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|
| 1 | 5f901eb6-8fcd-11eb-924d-9cd76263cbd0 | Seasonal Assessment | 17.70 | pilot-arm-62 | regional-weight-66 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 9736893 | Integrated Survey | 19.40 | extended-arm-63 | legacy-weight-67 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 5f8f9bda-8fcd-11eb-924d-9cd76263cbd0 | Extended Corridor D | 21.10 | integrated-arm-64 | compact-weight-68 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | 9085248 | Pilot Series | 22.80 | seasonal-arm-65 | composite-weight-69 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Posture setup records capture the body positioning and stance parameters that precede the swing. Each record defines the stance width, weight distribution, spine angle, and head position for a given routine. The posture records (identified by numeric codes 1 through 4) are linked to routines and provide the physical foundation for the swing mechanics. Proper posture setup ensures consistent ball striking and directional control.

## Joined Perspectives

The base tables capture individual dimensions of the shot domain, but the analytical power emerges when they are joined. The following views combine related records to answer specific operational questions.

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

This view joins `GolfShot` with `GolfClub` to answer: *What equipment was used for each shot, and how do the club specifications relate to the shot outcome?* The join produces rows that pair each shot with its club's type, material, length, weight, and loft. Shot 1, a `Putting` event, was executed with club 1000 — a `seasonal-club-23` of `primary-material-94` with 17.45 degrees of loft. Shot 3, a `Pitching` shot covering 208.25 units, used club 1002, a `legacy-club-25` of `distributed-material-96` with 26.35 degrees of loft. The view reveals that longer-distance shots tend to use clubs with higher loft values, consistent with the physics of ball flight.

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

This view joins `GolfShot` with `Golfer` to answer: *Which golfer executed each shot, and how do their skill level and hand preference correlate with the shot outcome?* The join pairs each shot with the golfer's name, hand preference, skill level, and routine. Shot 2, a `Chipping` event at 5 units, was performed by "Pilot Initiative A," a right-handed golfer at the `distributed-skill-24` level using `extended-routine-15`. Shot 4, a `SandShot` at 36.3 units, was executed by "Distributed Cluster," a right-handed golfer at the `pilot-skill-26` level using `seasonal-routine-17`. The view enables analysis of whether certain skill levels or hand preferences produce more favorable outcomes.

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

This view joins `GolfShot` with `TargetSpot` to answer: *Where did each shot land, and how does the landing surface and distance from hole relate to the shot type?* The join produces rows that pair each shot with the spot's coordinates, surface type, and distance from hole. Shot 1, a `Putting` event, landed on spot 1 (`8843760`), a `Green` surface at distance 0.05 from the hole. Shot 4, a `SandShot`, landed on spot 4 (`Catatan`), a `Sand` surface at distance 32 from the hole. The view confirms the expected mapping: putting shots target greens near the hole, while sand shots originate from or land on sand surfaces at greater distances.

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

This view joins `ShotRoutine` with `GripTechnique` to answer: *Which grip technique is associated with each routine, and how do the hand placement and pressure settings vary across routines?* The join pairs each routine with its grip technique's name, hand placement, pressure, and applicable shot types. Routine 100 ("Legacy Survey D") uses technique 727049 ("Adaptive Model") with `pilot-hand-62` placement and `primary-pressure-34`. Routine 103 ("Integrated Assessment A") uses technique `b10c552a-8fcd-11eb-924d-9cd76263cbd0` ("Compact Initiative") with `seasonal-hand-65` placement and `baseline-pressure-37`. The view reveals that routines with longer durations tend to incorporate more complex grip configurations.

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

This view joins `ShotRoutine` with `AimProcedure` to answer: *What aiming protocol does each routine follow, and how do the alignment and targeting methods differ?* The join pairs each routine with its aim procedure's alignment method, target selection logic, and wind adjustment strategy. Routine 100 follows procedure `790490`, while Routine 101 follows procedure `4060658`. The view allows analysts to determine whether certain aiming procedures correlate with higher success rates. For instance, Routine 103, which has the highest success rate at 20.80 percent, uses procedure `3012831`.

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

This view joins `ShotRoutine` with `PostureSetup` to answer: *What body positioning does each routine prescribe, and how do stance and alignment parameters vary?* The join pairs each routine with its posture setup's stance width, weight distribution, spine angle, and head position. Routine 100 uses setup 1, Routine 101 uses setup 2, and so on through Routine 103 with setup 4. The view enables comparison of how different posture configurations affect routine effectiveness. Routines with more extended durations (such as Routine 103 at 16.80 seconds) may incorporate more deliberate posture adjustments.

## Synthesis

The golf shot domain is structured around a central event — the shot — that is attributed to a golfer, a club, and a target spot, and preceded by a routine composed of grip, aim, and posture components. The base tables capture the discrete elements: shot measurements, club specifications, golfer profiles, spot coordinates, routine parameters, and technique details. The views combine these elements to answer operational questions about equipment selection, golfer performance, landing conditions, and procedural effectiveness. Together, the tables and views provide a complete record of the shot lifecycle, from the golfer's setup through the club's impact to the ball's final resting position. This structure supports both retrospective analysis of past performance and prospective planning for future shots.