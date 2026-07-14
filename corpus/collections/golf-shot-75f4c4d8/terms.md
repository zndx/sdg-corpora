# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Golf Shot
- **genus**: `bfo:0000015`
- **definition**: A discrete physical activity in which a golfer strikes a ball with a club to achieve a specific trajectory and distance.
- **attributes**: shotId, shotType, distance, direction, decision, outcome, observedResult
- **relations**: uses→GolfClub, executedBy→Golfer, targets→TargetSpot

## Golf Club
- **genus**: `cco:ont00000995`
- **definition**: A manufactured instrument used to strike a golf ball, characterized by its specific design and intended use.
- **attributes**: clubId, clubType, material, length, weight, loft

## Golfer
- **genus**: `bfo:0000002`
- **definition**: A human participant engaged in the sport of golf, possessing specific physical and cognitive attributes relevant to shot execution.
- **attributes**: golferId, name, handPreference, skillLevel, routine

## Target Spot
- **genus**: `bfo:0000002`
- **definition**: A specific spatial location on the golf course intended as the landing point or final destination for a golf ball.
- **attributes**: spotId, xCoordinate, yCoordinate, zCoordinate, surfaceType, distanceFromHole

## Shot Routine
- **genus**: `bfo:0000015`
- **definition**: A standardized sequence of physical and cognitive actions performed by a golfer before and during a shot to ensure consistency.
- **attributes**: routineId, routineName, steps, duration, successRate
- **relations**: includes→GripTechnique, includes→AimProcedure, includes→PostureSetup

## Grip Technique
- **genus**: `bfo:0000015`
- **definition**: The specific method of holding a golf club, involving hand placement and pressure, critical for shot control.
- **attributes**: techniqueId, techniqueName, handPlacement, pressure, applicableShotTypes

## Aim Procedure
- **genus**: `bfo:0000015`
- **definition**: The process of aligning the golfer's body and clubface with the intended target line to ensure accurate direction.
- **attributes**: procedureId, procedureName, targetLine, alignmentMethod, visualCue

## Posture Setup
- **genus**: `bfo:0000015`
- **definition**: The physical positioning of the golfer's body, including hip flexion and arm relaxation, prior to initiating the swing.
- **attributes**: setupId, setupName, hipAngle, armPosition, weightDistribution
