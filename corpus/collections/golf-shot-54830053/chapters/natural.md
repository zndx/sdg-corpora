## The Architecture of a Practice Session

Golf instruction and player development rest on the systematic recording of discrete shots, the equipment used to execute them, and the mechanical conditions under which they occur. A practice session is not a single event but a structured collection of shots, each tied to a specific club, a landing zone on the course, and a set of grip mechanics. The data model captures this ecosystem through six base tables and nine derived views that join the tables into readable perspectives. The following chapter walks through each entity, the relationships that bind them, and the analytical lenses the views provide.

**Table `GolfShot`**

| shotId | shotIdentifier | shotType | targetDistance | targetDirection | executionStatus | practiceSessionId | clubId | spotId | routineId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | SHO-2468 | Putting | 1.09 | legacy-target-73 | Planned | 4463660 | 100 | 8843760 | 100 |
| 2 | SHO-2471 | Chipping | 0.04999995 | compact-target-74 | Executed | 3743996 | 101 | 3990184 | 101 |
| 3 | SHO-2474 | Pitching | 0.4 | composite-target-75 | Observed | c7445b72-8fcc-11eb-924d-9cd76263cbd0 | 102 | 4277010 | 102 |
| 4 | SHO-2477 | SandShot | 0.01999998 | primary-target-76 | Planned | organisational-alignment | 103 | Catatan | 103 |

The `GolfShot` table is the central record of player activity. Each row represents a single shot attempt, identified by a numeric `shotId` and a human-readable `shotIdentifier` such as `SHO-2468` or `SHO-2477`. The `shotType` column categorizes the attempt into one of four types: Putting, Chipping, Pitching, and SandShot. The `targetDistance` field stores a numeric value in meters — for example, a putting target of 1.09 meters versus a chipping target of 0.05 meters — while `targetDirection` assigns a named direction such as `legacy-target-73` or `primary-target-76`. The `executionStatus` column tracks the lifecycle stage of the shot, cycling through Planned, Executed, and Observed. A `GolfShot` is further contextualized by three foreign keys: `clubId` links the shot to a specific club configuration, `spotId` ties it to the landing zone on the course, and `routineId` associates the shot with a practice routine. The `practiceSessionId` column provides an additional session-level grouping, though its values range from numeric identifiers like `4463660` to UUIDs such as `c7445b72-8fcc-11eb-924d-9cd76263cbd0`.

**Table `GolfClub`**

| id | clubId | clubType | loftAngle | shaftLength | gripStyle | shotId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| 100 | 3001009030020 | Putter | 15.70 | 0.68 | FingerGrip | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 21642857 | Wedge | 18.40 | 1.33 | PalmarGrip | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | account_pymes_671 | Iron | 21.10 | 0.47 | FingerGrip | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 611509 | Wood | 23.80 | 0.76 | PalmarGrip | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Equipment selection is recorded in the `GolfClub` table, which stores one row per club configuration. The `id` column serves as the primary key, with values like `100`, `101`, `102`, and `103`. Each row also carries a `clubId` — a longer alphanumeric identifier such as `3001009030020` for a Putter or `21642857` for a Wedge — that may correspond to an external product catalog. The `clubType` column distinguishes between Putter, Wedge, Iron, and Wood. Technical specifications include `loftAngle` (measured in degrees, ranging from 15.70 for a Putter to 23.80 for a Wood) and `shaftLength` (in meters, from 0.47 for an Iron to 1.33 for a Wedge). The `gripStyle` column records whether the player used a FingerGrip or a PalmarGrip. The `shotId` column creates a direct link back to the `GolfShot` table, and the `createdAt` and `updatedAt` timestamps track when the club configuration was first recorded and last modified.

**Table `LandingSpot`**

| spotId | distanceFromBall | surfaceType | elevationChange | shotId |
|---|---|---|---|---|
| 8843760 | 97.01052631578943 | Fairway | 21.70 | 1 |
| 3990184 | 0.8 | Green | 25.40 | 2 |
| 4277010 | 38.53310265213535 | Rough | 29.10 | 3 |
| Catatan | 38.0000008477105 | Sand | 32.80 | 4 |

The `LandingSpot` table captures where each shot landed on the course. The `spotId` column identifies the landing zone, with values ranging from numeric identifiers like `8843760` to text-based identifiers such as `Catatan`. The `distanceFromBall` field records the distance in meters from the ball's starting position to the landing point — a Fairway landing at 97.01 meters versus a Green landing at just 0.8 meters. The `surfaceType` column classifies the landing surface as Fairway, Green, Rough, or Sand, and `elevationChange` records the vertical displacement in meters, ranging from 21.70 to 32.80 across the dataset. The `shotId` column links each landing spot back to its originating shot.

**Table `GripMechanics`**

| id | mechanicId | handPlacement | pressureLevel | musclePadContact | clubId | shotId |
|---|---|---|---|---|---|---|
| 1 | 17565595 | Fingers | Light | Sean Green | 100 | 1 |
| 2 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Palms | Medium | James Patel | 101 | 2 |
| 3 | 89102 | Fingers | Firm | Brian Davis | 102 | 3 |
| 4 | 103172 | Palms | Light | Darrell Rodriguez | 103 | 4 |

Grip mechanics form the biomechanical layer of the data model. The `GripMechanics` table stores one row per shot's grip configuration, identified by a numeric `id` and a `mechanicId` that may be numeric (such as `17565595`) or alphanumeric (such as `ChIJAaQOcwdu5kcRArYphCv0bl0`). The `handPlacement` column distinguishes between Fingers and Palms grip styles, while `pressureLevel` records the applied pressure as Light, Medium, or Firm. The `musclePadContact` column names the person associated with the grip measurement — Sean Green, James Patel, Brian Davis, and Darrell Rodriguez appear in the dataset. The `clubId` and `shotId` columns create foreign-key links to the `GolfClub` and `GolfShot` tables respectively, anchoring each mechanical record to both the equipment and the shot.

**Table `PracticeRoutine`**

| id | routineId | routineName | focusArea | isQualityFocused | mechanicsId |
|---|---|---|---|---|---|
| 100 | f2096e32-8fcd-11eb-924d-9cd76263cbd0 | GAP | Direction | true | 1 |
| 101 | 611512 | 3Ds | Distance | false | 2 |
| 102 | 4447010 | RailroadTrack | Decision | true | 3 |
| 103 | 6564380 | GAP | Posture | false | 4 |

Practice routines provide the organizational framework for shot collections. The `PracticeRoutine` table stores one row per routine, identified by a numeric `id` and a `routineId` that may be a UUID (such as `f2096e32-8fcd-11eb-924d-9cd76263cbd0`) or a numeric identifier (such as `611512`). The `routineName` column assigns a label like GAP, 3Ds, or RailroadTrack, while the `focusArea` column specifies the instructional emphasis — Direction, Distance, Decision, or Posture. The `isQualityFocused` boolean flag indicates whether the routine prioritizes quality over volume. The `mechanicsId` column links the routine to a specific `GripMechanics` record, establishing a direct connection between the practice framework and the biomechanical data.

**Table `PracticeRoutineGolfShot`**

| routineId | shotId |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `PracticeRoutineGolfShot` table is a many-to-many junction that maps which shots belong to which routines. Each row pairs a `routineId` with a `shotId`. For example, routine `100` contains shots `1` and `2`, while routine `103` contains shots `4` and `1`. This table enables the construction of practice-session summaries by aggregating all shots assigned to a given routine.

The views that follow join these base tables into analytical perspectives. Each view answers a specific question about the relationships between shots, clubs, landing zones, grip mechanics, and practice routines.

**View `v_golf_shot_golf_club`**

```sql
CREATE VIEW v_golf_shot_golf_club AS
SELECT a.shotId, a.shotIdentifier, a.shotType, a.targetDistance, b.id AS club_id, b.clubId AS club_clubId, b.clubType AS club_clubType
FROM GolfShot a JOIN GolfClub b ON a.clubId = b.id;
```

| shotId | shotIdentifier | shotType | targetDistance | club_id | club_clubId | club_clubType |
|---|---|---|---|---|---|---|
| 1 | SHO-2468 | Putting | 1.09 | 100 | 3001009030020 | Putter |
| 2 | SHO-2471 | Chipping | 0.04999995 | 101 | 21642857 | Wedge |
| 3 | SHO-2474 | Pitching | 0.4 | 102 | account_pymes_671 | Iron |
| 4 | SHO-2477 | SandShot | 0.01999998 | 103 | 611509 | Wood |

The `v_golf_shot_golf_club` view joins `GolfShot` to `GolfClub` on the shared `shotId`/`id` relationship, producing a single row per shot that includes both the shot's metadata and the club's technical specifications. This view answers the question: "What club configuration was used for each shot?" Reading row 1, we see shot `SHO-2468` (a Putting attempt with a target distance of 1.09 meters) was executed with a Putter (`clubType`) having a loft angle of 15.70 degrees, a shaft length of 0.68 meters, and a FingerGrip. Row 2 shows shot `SHO-2471` (a Chipping attempt at 0.05 meters) used a Wedge with 18.40 degrees of loft, a 1.33-meter shaft, and a PalmarGrip. This view is essential for analyzing how club selection correlates with shot type and target distance.

**View `v_golf_shot_landing_spot`**

```sql
CREATE VIEW v_golf_shot_landing_spot AS
SELECT a.shotId, a.shotIdentifier, a.shotType, a.targetDistance, b.spotId AS spot_spotId, b.distanceFromBall AS spot_distanceFromBall, b.surfaceType AS spot_surfaceType
FROM GolfShot a JOIN LandingSpot b ON a.spotId = b.spotId;
```

| shotId | shotIdentifier | shotType | targetDistance | spot_spotId | spot_distanceFromBall | spot_surfaceType |
|---|---|---|---|---|---|---|
| 1 | SHO-2468 | Putting | 1.09 | 8843760 | 97.01052631578943 | Fairway |
| 2 | SHO-2471 | Chipping | 0.04999995 | 3990184 | 0.8 | Green |
| 3 | SHO-2474 | Pitching | 0.4 | 4277010 | 38.53310265213535 | Rough |
| 4 | SHO-2477 | SandShot | 0.01999998 | Catatan | 38.0000008477105 | Sand |

The `v_golf_shot_landing_spot` view joins `GolfShot` to `LandingSpot` on `shotId`, producing one row per shot that includes the landing zone's distance, surface type, and elevation change. This view answers: "Where did each shot land, and under what terrain conditions?" Row 1 reveals that shot `SHO-2468` (a Putting attempt) landed on the Fairway at a distance of 97.01 meters with an elevation change of 21.70 meters — an unusual result for a putt, suggesting the target distance of 1.09 meters may represent a different measurement convention. Row 3 shows shot `SHO-2474` (a Pitching attempt) landed in the Rough at 38.53 meters with an elevation change of 29.10 meters. This view enables analysis of shot accuracy relative to surface conditions and terrain.

**View `v_golf_shot_practice_routine`**

```sql
CREATE VIEW v_golf_shot_practice_routine AS
SELECT a.shotId, a.shotIdentifier, a.shotType, a.targetDistance, b.id AS routine_id, b.routineId AS routine_routineId, b.routineName AS routine_routineName
FROM GolfShot a JOIN PracticeRoutine b ON a.routineId = b.id;
```

| shotId | shotIdentifier | shotType | targetDistance | routine_id | routine_routineId | routine_routineName |
|---|---|---|---|---|---|---|
| 1 | SHO-2468 | Putting | 1.09 | 100 | f2096e32-8fcd-11eb-924d-9cd76263cbd0 | GAP |
| 2 | SHO-2471 | Chipping | 0.04999995 | 101 | 611512 | 3Ds |
| 3 | SHO-2474 | Pitching | 0.4 | 102 | 4447010 | RailroadTrack |
| 4 | SHO-2477 | SandShot | 0.01999998 | 103 | 6564380 | GAP |

The `v_golf_shot_practice_routine` view joins `GolfShot` to `PracticeRoutine` on `routineId`, producing one row per shot that includes the routine's name, focus area, and quality flag. This view answers: "Which practice routine is each shot associated with, and what was the routine's instructional focus?" Row 1 shows shot `SHO-2468` was part of routine `GAP` with a Direction focus and quality-focused flag set to true. Row 2 shows shot `SHO-2471` was part of routine `3Ds` with a Distance focus and quality-focused flag set to false. This view is the primary lens for evaluating whether quality-focused routines produce different shot outcomes than non-quality-focused routines.

**View `v_golf_club_golf_shot`**

```sql
CREATE VIEW v_golf_club_golf_shot AS
SELECT a.id, a.clubId, a.clubType, a.loftAngle, b.shotId AS shot_shotId, b.shotIdentifier AS shot_shotIdentifier, b.shotType AS shot_shotType
FROM GolfClub a JOIN GolfShot b ON a.shotId = b.shotId;
```

| id | clubId | clubType | loftAngle | shot_shotId | shot_shotIdentifier | shot_shotType |
|---|---|---|---|---|---|---|
| 100 | 3001009030020 | Putter | 15.70 | 1 | SHO-2468 | Putting |
| 101 | 21642857 | Wedge | 18.40 | 2 | SHO-2471 | Chipping |
| 102 | account_pymes_671 | Iron | 21.10 | 3 | SHO-2474 | Pitching |
| 103 | 611509 | Wood | 23.80 | 4 | SHO-2477 | SandShot |

The `v_golf_club_golf_shot` view performs the inverse join of `v_golf_shot_golf_club`, starting from `GolfClub` and joining to `GolfShot`. This perspective answers: "For each club configuration, what shots were executed with it?" Since each club row in the base data references exactly one shot, this view produces the same cardinality as the forward join but reorganizes the data to emphasize the club as the starting point. Row 100 shows the Putter (loft 15.70, shaft 0.68, FingerGrip) was used for shot `SHO-2468`, a Putting attempt with a target distance of 1.09 meters and execution status Planned. This view is useful when analyzing club inventory or when the club configuration is the primary query dimension.

**View `v_landing_spot_golf_shot`**

```sql
CREATE VIEW v_landing_spot_golf_shot AS
SELECT a.spotId, a.distanceFromBall, a.surfaceType, a.elevationChange, b.shotId AS shot_shotId, b.shotIdentifier AS shot_shotIdentifier, b.shotType AS shot_shotType
FROM LandingSpot a JOIN GolfShot b ON a.shotId = b.shotId;
```

| spotId | distanceFromBall | surfaceType | elevationChange | shot_shotId | shot_shotIdentifier | shot_shotType |
|---|---|---|---|---|---|---|
| 8843760 | 97.01052631578943 | Fairway | 21.70 | 1 | SHO-2468 | Putting |
| 3990184 | 0.8 | Green | 25.40 | 2 | SHO-2471 | Chipping |
| 4277010 | 38.53310265213535 | Rough | 29.10 | 3 | SHO-2474 | Pitching |
| Catatan | 38.0000008477105 | Sand | 32.80 | 4 | SHO-2477 | SandShot |

The `v_landing_spot_golf_shot` view performs the inverse join of `v_golf_shot_landing_spot`, starting from `LandingSpot` and joining to `GolfShot`. This perspective answers: "For each landing zone, what shot produced it?" Row 8843760 shows the Fairway landing at 97.01 meters with elevation change 21.70 was the result of shot `SHO-2468`, a Putting attempt. Row Catatan shows the Sand landing at 38.00 meters with elevation change 32.80 was the result of shot `SHO-2477`, a SandShot with target distance 0.02 meters. This view is valuable for terrain-based analysis, such as comparing shot performance across Fairway, Green, Rough, and Sand surfaces.

**View `v_grip_mechanics_golf_club`**

```sql
CREATE VIEW v_grip_mechanics_golf_club AS
SELECT a.id, a.mechanicId, a.handPlacement, a.pressureLevel, b.id AS club_id, b.clubId AS club_clubId, b.clubType AS club_clubType
FROM GripMechanics a JOIN GolfClub b ON a.clubId = b.id;
```

| id | mechanicId | handPlacement | pressureLevel | club_id | club_clubId | club_clubType |
|---|---|---|---|---|---|---|
| 1 | 17565595 | Fingers | Light | 100 | 3001009030020 | Putter |
| 2 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Palms | Medium | 101 | 21642857 | Wedge |
| 3 | 89102 | Fingers | Firm | 102 | account_pymes_671 | Iron |
| 4 | 103172 | Palms | Light | 103 | 611509 | Wood |

The `v_grip_mechanics_golf_club` view joins `GripMechanics` to `GolfClub` on `clubId`, producing one row per grip-mechanics record that includes the club's type, loft angle, shaft length, and grip style. This view answers: "What club configuration was paired with each grip-mechanics measurement?" Row 1 shows that mechanic record `17565595` (hand placement: Fingers, pressure: Light, muscle pad contact: Sean Green) was recorded with a Putter (loft 15.70, shaft 0.68, FingerGrip). Row 3 shows mechanic record `89102` (hand placement: Fingers, pressure: Firm, muscle pad contact: Brian Davis) was recorded with an Iron (loft 21.10, shaft 0.47, FingerGrip). This view enables analysis of how grip mechanics vary across club types and whether specific grip styles correlate with particular club specifications.

**View `v_grip_mechanics_golf_shot`**

```sql
CREATE VIEW v_grip_mechanics_golf_shot AS
SELECT a.id, a.mechanicId, a.handPlacement, a.pressureLevel, b.shotId AS shot_shotId, b.shotIdentifier AS shot_shotIdentifier, b.shotType AS shot_shotType
FROM GripMechanics a JOIN GolfShot b ON a.shotId = b.shotId;
```

| id | mechanicId | handPlacement | pressureLevel | shot_shotId | shot_shotIdentifier | shot_shotType |
|---|---|---|---|---|---|---|
| 1 | 17565595 | Fingers | Light | 1 | SHO-2468 | Putting |
| 2 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Palms | Medium | 2 | SHO-2471 | Chipping |
| 3 | 89102 | Fingers | Firm | 3 | SHO-2474 | Pitching |
| 4 | 103172 | Palms | Light | 4 | SHO-2477 | SandShot |

The `v_grip_mechanics_golf_shot` view joins `GripMechanics` to `GolfShot` on `shotId`, producing one row per grip-mechanics record that includes the shot's type, target distance, target direction, and execution status. This view answers: "What shot conditions were present when each grip-mechanics measurement was taken?" Row 1 shows that mechanic record `17565595` (hand placement: Fingers, pressure: Light, muscle pad contact: Sean Green) was recorded during shot `SHO-2468`, a Putting attempt with target distance 1.09 meters, target direction `legacy-target-73`, and status Planned. Row 4 shows mechanic record `103172` (hand placement: Palms, pressure: Light, muscle pad contact: Darrell Rodriguez) was recorded during shot `SHO-2477`, a SandShot with target distance 0.02 meters and status Planned. This view is the primary lens for correlating grip mechanics with shot outcomes and execution status.

**View `v_practice_routine_golf_shot_detail`**

```sql
CREATE VIEW v_practice_routine_golf_shot_detail AS
SELECT a.id, a.routineId, a.routineName, b.shotId AS shot_shotId, b.shotIdentifier AS shot_shotIdentifier, b.shotType AS shot_shotType
FROM PracticeRoutine a
  JOIN PracticeRoutineGolfShot j ON j.routineId = a.id
  JOIN GolfShot b ON b.shotId = j.shotId;
```

| id | routineId | routineName | shot_shotId | shot_shotIdentifier | shot_shotType |
|---|---|---|---|---|---|
| 100 | f2096e32-8fcd-11eb-924d-9cd76263cbd0 | GAP | 1 | SHO-2468 | Putting |
| 100 | f2096e32-8fcd-11eb-924d-9cd76263cbd0 | GAP | 2 | SHO-2471 | Chipping |
| 101 | 611512 | 3Ds | 2 | SHO-2471 | Chipping |
| 101 | 611512 | 3Ds | 3 | SHO-2474 | Pitching |
| 102 | 4447010 | RailroadTrack | 3 | SHO-2474 | Pitching |
| 102 | 4447010 | RailroadTrack | 4 | SHO-2477 | SandShot |
| 103 | 6564380 | GAP | 4 | SHO-2477 | SandShot |
| 103 | 6564380 | GAP | 1 | SHO-2468 | Putting |

The `v_practice_routine_golf_shot_detail` view joins `PracticeRoutine` to `PracticeRoutineGolfShot` and then to `GolfShot` through the junction table, producing one row per routine-shot pairing that includes the full shot detail alongside the routine metadata. This view answers: "For each routine, what are the detailed characteristics of every shot it contains?" Row 1 shows routine `GAP` (focus: Direction, quality-focused: true) contains shot `SHO-2468` (Putting, target distance 1.09, status Planned). Row 2 shows the same routine `GAP` also contains shot `SHO-2471` (Chipping, target distance 0.05, status Executed). This view is essential for routine-level analysis, enabling aggregation of shot statistics by routine name, focus area, and quality flag.

**View `v_practice_routine_grip_mechanics`**

```sql
CREATE VIEW v_practice_routine_grip_mechanics AS
SELECT a.id, a.routineId, a.routineName, a.focusArea, b.id AS mechanics_id, b.mechanicId AS mechanics_mechanicId, b.handPlacement AS mechanics_handPlacement
FROM PracticeRoutine a JOIN GripMechanics b ON a.mechanicsId = b.id;
```

| id | routineId | routineName | focusArea | mechanics_id | mechanics_mechanicId | mechanics_handPlacement |
|---|---|---|---|---|---|---|
| 100 | f2096e32-8fcd-11eb-924d-9cd76263cbd0 | GAP | Direction | 1 | 17565595 | Fingers |
| 101 | 611512 | 3Ds | Distance | 2 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Palms |
| 102 | 4447010 | RailroadTrack | Decision | 3 | 89102 | Fingers |
| 103 | 6564380 | GAP | Posture | 4 | 103172 | Palms |

The `v_practice_routine_grip_mechanics` view joins `PracticeRoutine` to `GripMechanics` on `mechanicsId`, producing one row per routine that includes the grip-mechanics details alongside the routine metadata. This view answers: "For each practice routine, what grip-mechanics profile is associated with it?" Row 1 shows routine `GAP` (focus: Direction, quality-focused: true) is associated with mechanic record `17565595` (hand placement: Fingers, pressure: Light, muscle pad contact: Sean Green). Row 2 shows routine `3Ds` (focus: Distance, quality-focused: false) is associated with mechanic record `ChIJAaQOcwdu5kcRArYphCv0bl0` (hand placement: Palms, pressure: Medium, muscle pad contact: James Patel). This view enables analysis of whether specific grip-mechanics profiles are systematically associated with particular practice routines or focus areas.

## Synthesis

The data model for golf practice sessions captures a tightly coupled ecosystem: every shot is linked to a club, a landing zone, a grip-mechanics record, and a practice routine. The six base tables store the raw records, while the nine views provide analytical lenses that reorganize the same data around different starting points — shots, clubs, landing spots, grip mechanics, or routines. The junction table `PracticeRoutineGolfShot` introduces a many-to-many relationship that allows routines to contain multiple shots and shots to appear in multiple routines, enabling flexible practice-session design. Together, these tables and views support analysis of how club selection, grip mechanics, terrain conditions, and routine structure interact to shape shot outcomes.