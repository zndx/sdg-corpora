## Ontology-Grounded Relational Modelling of the Golf Practice Domain

The golf practice domain captures the anatomy of a single shot event — the club selected, the mechanics employed, the intended target, the actual landing, and the practice routine that frames the attempt. At the ontology level, five entity types (`GolfShot`, `GolfClub`, `LandingSpot`, `GripMechanics`, `PracticeRoutine`) and one associative entity (`PracticeRoutineGolfShot`) materialise as six base tables. Each table stores a single entity type's attributes as columns, while foreign keys encode the cardinality-bounded relationships that the ontology declares. Views then re-join these normalised tables so that a data consumer can ask domain-level questions — "which club was used for shot `SHO-2468`?" or "what grip mechanics belong to routine `GAP`?" — without writing joins manually.

### Base Tables and Their Ontological Roles

The central entity is the shot. Every practice attempt is recorded as a row in `GolfShot`, which carries a surrogate primary key `shotId`, a human-readable `shotIdentifier` such as `SHO-2468`, a categorical `shotType` (e.g. `Putting`, `Chipping`, `Pitching`, `SandShot`), a numeric `targetDistance` measured in metres, a `targetDirection` string like `legacy-target-73`, and an `executionStatus` (`Planned`, `Executed`, or `Observed`). The shot also stores three foreign keys — `clubId`, `spotId`, and `routineId` — that point to the club, landing spot, and practice routine associated with the attempt, plus an optional `practiceSessionId` for grouping shots into sessions.

**Table `GolfShot`**

| shotId | shotIdentifier | shotType | targetDistance | targetDirection | executionStatus | practiceSessionId | clubId | spotId | routineId |
|---|---|---|---|---|---|---|---|---|---|
| 1 | SHO-2468 | Putting | 1.09 | legacy-target-73 | Planned | 4463660 | 100 | 8843760 | 100 |
| 2 | SHO-2471 | Chipping | 0.04999995 | compact-target-74 | Executed | 3743996 | 101 | 3990184 | 101 |
| 3 | SHO-2474 | Pitching | 0.4 | composite-target-75 | Observed | c7445b72-8fcc-11eb-924d-9cd76263cbd0 | 102 | 4277010 | 102 |
| 4 | SHO-2477 | SandShot | 0.01999998 | primary-target-76 | Planned | organisational-alignment | 103 | Catatan | 103 |

The `GolfClub` table models the equipment entity. Its surrogate key `id` (values `100` through `103`) is the primary key, while `clubId` holds a business identifier such as `3001009030020` or `account_pymes_671`. The attributes `clubType` (`Putter`, `Wedge`, `Iron`, `Wood`), `loftAngle` (ranging from `15.70` to `23.80` degrees), `shaftLength` (from `0.47` to `1.33` metres), and `gripStyle` (`FingerGrip` or `PalmarGrip`) describe the physical properties of the club. A `shotId` foreign key links the club back to the shot that used it, and `createdAt` / `updatedAt` timestamps record the lifecycle of the club record.

**Table `GolfClub`**

| id | clubId | clubType | loftAngle | shaftLength | gripStyle | shotId | createdAt | updatedAt |
|---|---|---|---|---|---|---|---|---|
| 100 | 3001009030020 | Putter | 15.70 | 0.68 | FingerGrip | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 21642857 | Wedge | 18.40 | 1.33 | PalmarGrip | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | account_pymes_671 | Iron | 21.10 | 0.47 | FingerGrip | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 611509 | Wood | 23.80 | 0.76 | PalmarGrip | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `LandingSpot` table captures where the ball came to rest. Its primary key `spotId` takes values like `8843760`, `3990184`, `4277010`, and `Catatan`. The columns `distanceFromBall` (e.g. `97.01` metres for the fairway landing, `0.8` metres for the green), `surfaceType` (`Fairway`, `Green`, `Rough`, `Sand`), and `elevationChange` (from `21.70` to `32.80`) describe the landing geometry, while `shotId` is the foreign key back to `GolfShot`.

**Table `LandingSpot`**

| spotId | distanceFromBall | surfaceType | elevationChange | shotId |
|---|---|---|---|---|
| 8843760 | 97.01052631578943 | Fairway | 21.70 | 1 |
| 3990184 | 0.8 | Green | 25.40 | 2 |
| 4277010 | 38.53310265213535 | Rough | 29.10 | 3 |
| Catatan | 38.0000008477105 | Sand | 32.80 | 4 |

`GripMechanics` stores the biomechanical details of the grip used during a shot. The surrogate key `id` (values `1` through `4`) identifies the record, while `mechanicId` carries a business identifier such as `17565595` or `ChIJAaQOcwdu5kcRArYphCv0bl0`. The columns `handPlacement` (`Fingers` or `Palms`), `pressureLevel` (`Light`, `Medium`, `Firm`), and `musclePadContact` (a person name like `Sean Green` or `James Patel`) describe the grip technique. Foreign keys `clubId` and `shotId` link the mechanics to the specific club and shot, respectively.

**Table `GripMechanics`**

| id | mechanicId | handPlacement | pressureLevel | musclePadContact | clubId | shotId |
|---|---|---|---|---|---|---|
| 1 | 17565595 | Fingers | Light | Sean Green | 100 | 1 |
| 2 | ChIJAaQOcwdu5kcRArYphCv0bl0 | Palms | Medium | James Patel | 101 | 2 |
| 3 | 89102 | Fingers | Firm | Brian Davis | 102 | 3 |
| 4 | 103172 | Palms | Light | Darrell Rodriguez | 103 | 4 |

The `PracticeRoutine` table models the structured practice session that frames one or more shots. Its surrogate key `id` (values `100` through `103`) is the primary key, while `routineId` holds a business identifier such as `f2096e32-8fcd-11eb-924d-9cd76263cbd0` or `611512`. The columns `routineName` (`GAP`, `3Ds`, `RailroadTrack`), `focusArea` (`Direction`, `Distance`, `Decision`, `Posture`), and `isQualityFocused` (a boolean) describe the routine's intent. A `mechanicsId` foreign key points to the `GripMechanics` record that defines the grip technique for the routine.

**Table `PracticeRoutine`**

| id | routineId | routineName | focusArea | isQualityFocused | mechanicsId |
|---|---|---|---|---|---|
| 100 | f2096e32-8fcd-11eb-924d-9cd76263cbd0 | GAP | Direction | true | 1 |
| 101 | 611512 | 3Ds | Distance | false | 2 |
| 102 | 4447010 | RailroadTrack | Decision | true | 3 |
| 103 | 6564380 | GAP | Posture | false | 4 |

Finally, `PracticeRoutineGolfShot` is the associative (junction) table that resolves the many-to-many relationship between routines and shots. It contains two columns, `routineId` and `shotId`, with composite primary key semantics. Each row asserts that a particular shot was executed within a particular routine. For example, routine `100` contains shots `1` and `2`, while routine `103` contains shots `4` and `1`. This table is the only place where the many-to-many cardinality is materialised as a physical row.

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

### Views: Reconstructing Domain Facts from Normalised Tables

Views in this schema are read-only joins that reassemble the normalised facts into domain-level projections. Each view answers a specific question by joining the relevant base tables and presenting the result as a single flat table.

The view `v_golf_shot_golf_club` joins `GolfShot` to `GolfClub` on `shotId = id`, producing a row per shot that includes the club's type, loft angle, shaft length, and grip style alongside the shot's identifier, type, and status. Reading two concrete rows: shot `SHO-2468` (a `Putting` with status `Planned`) was executed with club `3001009030020`, a `Putter` at `15.70` degrees loft with `FingerGrip`; shot `SHO-2471` (a `Chipping` with status `Executed`) used club `21642857`, a `Wedge` at `18.40` degrees with `PalmarGrip`. This view answers the question "what equipment was used for each shot?"

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

The view `v_golf_shot_landing_spot` joins `GolfShot` to `LandingSpot` on `shotId`, producing a row per shot that includes the landing surface, distance from the ball, and elevation change. For example, shot `SHO-2468` landed on the `Fairway` at `97.01` metres with an elevation change of `21.70`; shot `SHO-2471` landed on the `Green` at just `0.8` metres with an elevation change of `25.40`. This view answers "where did each shot land and under what conditions?"

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

The view `v_golf_shot_practice_routine` joins `GolfShot` to `PracticeRoutine` on `routineId`, producing a row per shot that includes the routine's name, focus area, and quality flag. Shot `SHO-2468` was part of routine `GAP` with focus `Direction` and `isQualityFocused = true`; shot `SHO-2471` was part of routine `3Ds` with focus `Distance` and `isQualityFocused = false`. This view answers "which practice routine framed each shot?"

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

The view `v_golf_club_golf_shot` reverses the perspective of `v_golf_shot_golf_club`: it joins `GolfClub` to `GolfShot` on `id = shotId`, producing a row per club that includes the shot's identifier, type, target distance, and status. For example, club `3001009030020` (a `Putter` at `15.70` degrees) was used for shot `SHO-2468` (a `Putting` at `1.09` metres); club `611509` (a `Wood` at `23.80` degrees) was used for shot `SHO-2477` (a `SandShot` at `0.02` metres). This view answers "which shots were executed with each club?"

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

The view `v_landing_spot_golf_shot` reverses the perspective of `v_golf_shot_landing_spot`: it joins `LandingSpot` to `GolfShot` on `spotId`, producing a row per landing spot that includes the shot's identifier, type, and target direction. For example, the landing spot at `97.01` metres on the `Fairway` corresponds to shot `SHO-2468` targeting `legacy-target-73`; the landing spot at `38.00` metres on `Sand` corresponds to shot `SHO-2477` targeting `primary-target-76`. This view answers "which shot landed at each spot?"

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

The view `v_grip_mechanics_golf_club` joins `GripMechanics` to `GolfClub` on `clubId`, producing a row per grip mechanics record that includes the club's type, loft angle, and grip style. For example, mechanics record `17565595` (hand placement `Fingers`, pressure `Light`, contact by `Sean Green`) was used with club `3001009030020`, a `Putter` at `15.70` degrees; mechanics record `ChIJAaQOcwdu5kcRArYphCv0bl0` (hand placement `Palms`, pressure `Medium`, contact by `James Patel`) was used with club `21642857`, a `Wedge` at `18.40` degrees. This view answers "what grip mechanics were employed with each club?"

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

The view `v_grip_mechanics_golf_shot` joins `GripMechanics` to `GolfShot` on `shotId`, producing a row per grip mechanics record that includes the shot's identifier, type, target distance, and status. For example, mechanics record `17565595` (hand placement `Fingers`, pressure `Light`) was used for shot `SHO-2468` (a `Putting` at `1.09` metres, status `Planned`); mechanics record `89102` (hand placement `Fingers`, pressure `Firm`) was used for shot `SHO-2474` (a `Pitching` at `0.4` metres, status `Observed`). This view answers "what grip mechanics were used for each shot?"

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

The view `v_practice_routine_golf_shot_detail` joins `PracticeRoutine` to `PracticeRoutineGolfShot` and then to `GolfShot` on `routineId` and `shotId`, producing a row per routine-shot pair that includes the routine's name, focus area, quality flag, and the shot's identifier, type, target distance, and status. For example, routine `GAP` (focus `Direction`, quality-focused) contains shot `SHO-2468` (a `Putting` at `1.09` metres) and shot `SHO-2471` (a `Chipping` at `0.05` metres); routine `3Ds` (focus `Distance`, not quality-focused) contains shot `SHO-2471` and shot `SHO-2474`. This view answers "which shots belong to each routine, and what were their details?"

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

The view `v_practice_routine_grip_mechanics` joins `PracticeRoutine` to `GripMechanics` on `mechanicsId`, producing a row per routine that includes the grip mechanics' hand placement, pressure level, and contact person. For example, routine `GAP` (focus `Direction`) is associated with mechanics record `17565595` (hand placement `Fingers`, pressure `Light`, contact by `Sean Green`); routine `3Ds` (focus `Distance`) is associated with mechanics record `ChIJAaQOcwdu5kcRArYphCv0bl0` (hand placement `Palms`, pressure `Medium`, contact by `James Patel`). This view answers "what grip mechanics define each practice routine?"

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

### Synthesis

The golf practice schema demonstrates a clean separation between entity storage and fact reconstruction. Each base table stores exactly one entity type with its intrinsic attributes as columns and foreign keys as relationships. The junction table `PracticeRoutineGolfShot` is the sole place where a many-to-many cardinality is materialised. Views then reassemble these normalised facts through simple equi-joins, each view answering a specific domain question by presenting the relevant attributes in a single flat row. This architecture ensures that the ontology's entity types, attributes, and relationships are faithfully preserved in the relational layer while remaining accessible through intuitive, question-oriented views.