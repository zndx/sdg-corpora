# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Mission Zone
- **genus**: `bfo:0000040`
- **definition**: A bounded, open area containing obstacles and parking spaces that an autonomous vehicle must traverse during a mission.
- **attributes**: zoneId, length, width, surfaceType, isCulDeSac
- **relations**: contains→Obstacle, contains→ParkingSpace, hasEntryPoint→Waypoint, hasExitPoint→Waypoint

## Environmental Obstacle
- **genus**: `bfo:0000040`
- **definition**: A physical object or marked boundary within a zone that the autonomous vehicle must avoid or navigate around.
- **attributes**: obstacleId, obstacleType, positionX, positionY, isStatic
- **relations**: locatedIn→Zone, hasTangentCircle→TangentCircle

## Parking Space
- **genus**: `bfo:0000040`
- **definition**: A designated area within a zone where the autonomous vehicle is required to pull in and park.
- **attributes**: spaceId, length, width, isOccupied
- **relations**: locatedIn→Zone, hasBoundaryLine→Obstacle

## Maximum Curvature Circle
- **genus**: `bfo:0000040`
- **definition**: A circle constructed adjacent to an obstacle, representing the maximum curvature the vehicle can achieve.
- **attributes**: circleId, radius, centerX, centerY
- **relations**: adjacentTo→Obstacle, connectedByStraightLine→StraightLineSegment

## Straight Line Path Segment
- **genus**: `bfo:0000015`
- **definition**: A straight-line path segment that connects tangent circles at tangent points, forming part of the planned route.
- **attributes**: segmentId, length, startTangentPointX, startTangentPointY, endTangentPointX, endTangentPointY
- **relations**: connects→TangentCircle, partOfRoute→PlannedRoute

## Autonomous Vehicle Route
- **genus**: `bfo:0000015`
- **definition**: A sequence of straight-line segments and arc sections that the autonomous vehicle follows to traverse a zone.
- **attributes**: routeId, startTime, endTime, isFeasible, minObstacleDistance
- **relations**: composedOf→StraightLineSegment, composedOf→ArcSection, traverses→Zone, startsAt→Waypoint, endsAt→Waypoint

## Curved Path Section
- **genus**: `bfo:0000015`
- **definition**: A curved section of the planned route that connects straight-line segments, adhering to the vehicle's minimum turning radius.
- **attributes**: arcId, radius, startAngle, endAngle
- **relations**: connects→StraightLineSegment, partOfRoute→PlannedRoute

## Navigation Waypoint
- **genus**: `bfo:0000040`
- **definition**: A specific geographic point used for navigation, such as an entry point, exit point, or destination checkpoint.
- **attributes**: waypointId, x, y, waypointType
- **relations**: locatedIn→Zone, isStartOf→PlannedRoute, isEndOf→PlannedRoute
