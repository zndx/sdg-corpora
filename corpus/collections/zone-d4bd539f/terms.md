# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Mission Zone
- **genus**: `bfo:0000040`
- **definition**: A bounded, open spatial region containing obstacles and parking spaces that an autonomous vehicle must traverse during a mission.
- **attributes**: zoneIdentifier, zoneLength, zoneWidth, zoneElevation, zoneStatus
- **relations**: contains→Obstacle, contains→ParkingSpace, hasEntryPoint→Checkpoint, hasExitPoint→Checkpoint

## Environmental Obstacle
- **genus**: `bfo:0000040`
- **definition**: A physical object or marked area within a zone that the vehicle must avoid, such as an island, a parking space line, or a cul-de-sac.
- **attributes**: obstacleId, obstacleType, obstacleX, obstacleY, obstacleRadius, obstacleStatus
- **relations**: locatedIn→Zone, hasTangentCircle→TangentCircle

## Maximum Curvature Circle
- **genus**: `bfo:0000141`
- **definition**: A geometric construct representing the maximum curvature limit of the vehicle, placed adjacent to a sensed obstacle to define the turning envelope.
- **attributes**: circleId, circleRadius, circleCenterX, circleCenterY, circleCurvature
- **relations**: adjacentTo→Obstacle, connectedBy→PathSegment

## Straight-Line Tangent
- **genus**: `bfo:0000040`
- **definition**: A straight-line geometric segment that connects two tangent circles at tangent points, forming part of the planned route.
- **attributes**: segmentId, segmentLength, segmentStartX, segmentStartY, segmentEndX, segmentEndY, segmentStatus
- **relations**: connectsStart→TangentCircle, connectsEnd→TangentCircle, partOf→Route

## Mission Route
- **genus**: `bfo:0000002`
- **definition**: A complete sequence of path segments and turns that guides the vehicle from an entry checkpoint to an exit checkpoint while avoiding obstacles.
- **attributes**: routeId, routeStatus, totalLength, generationTime, steeringCompliant
- **relations**: composedOf→PathSegment, traverses→Zone, startsAt→Checkpoint, endsAt→Checkpoint

## Mission Checkpoint
- **genus**: `bfo:0000040`
- **definition**: A defined geographic point marking a critical location in the mission, such as a zone entry, exit, or parking space.
- **attributes**: checkpointId, checkpointType, checkpointX, checkpointY, checkpointStatus
- **relations**: locatedIn→Zone, servesAsStartFor→Route, servesAsEndFor→Route

## Autonomous Vehicle
- **genus**: `bfo:0000040`
- **definition**: The physical autonomous vehicle platform executing the route planning and navigation tasks.
- **attributes**: vehicleId, vehicleModel, minTurningRadius, currentX, currentY, currentHeading, vehicleStatus
- **relations**: executes→Route, senses→Obstacle, occupies→Zone
