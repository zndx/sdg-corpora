# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Golf Shot
- **genus**: `bfo:0000015`
- **definition**: A discrete physical activity in which a golfer strikes a ball to achieve a specific trajectory and distance.
- **attributes**: shotIdentifier, shotType, targetDistance, targetDirection, executionStatus, practiceSessionId
- **relations**: executedUsing→GolfClub, targets→LandingSpot, partOf→PracticeRoutine

## Golf Club
- **genus**: `cco:ont00000995`
- **definition**: A manufactured implement used to strike a golf ball, characterized by specific grip and swing mechanics.
- **attributes**: clubId, clubType, loftAngle, shaftLength, gripStyle
- **relations**: usedIn→GolfShot

## Landing Spot
- **genus**: `bfo:0000002`
- **definition**: A specific spatial coordinate on the course where a golf ball is intended to land before rolling to the target.
- **attributes**: spotId, distanceFromBall, surfaceType, elevationChange
- **relations**: targetedBy→GolfShot

## Grip Mechanics
- **genus**: `bfo:0000015`
- **definition**: The specific hand placement and pressure applied to a golf club during the setup and execution of a shot.
- **attributes**: mechanicId, handPlacement, pressureLevel, musclePadContact
- **relations**: appliedTo→GolfClub, usedIn→GolfShot

## Practice Routine
- **genus**: `bfo:0000015`
- **definition**: A structured sequence of pre-shot and execution steps designed to improve golf performance through quality repetition.
- **attributes**: routineId, routineName, focusArea, isQualityFocused
- **relations**: includes→GolfShot, defines→GripMechanics
