# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Vehicle Model
- **genus**: `cco:ont00000995`
- **definition**: A specific commercial vehicle model defined by its manufacturer specifications and market designation.
- **attributes**: modelIdentifier, modelDisplayName, manufacturerCode, colorVariant, trimLevel
- **relations**: hasEngine→Powertrain, hasFrame→ChassisFrame, hasSuspension→SuspensionSystem, hasBrakeSystem→BrakeSystem, hasWheelAssembly→WheelAssembly, hasCapacity→CapacitySpecification

## Powertrain
- **genus**: `cco:ont00000995`
- **definition**: The complete system of components responsible for generating and transmitting motive power to the vehicle.
- **attributes**: engineType, displacement, horsepower, coolingMethod, fuelDeliverySystem, transmissionType, gearPositions, driveMode
- **relations**: usesFuel→FuelCapacity, drivesWheels→WheelAssembly, powersSteering→SteeringSystem

## Chassis Frame
- **genus**: `cco:ont00000995`
- **definition**: The rigid structural framework that supports the vehicle body and connects the suspension and powertrain components.
- **attributes**: frameDesignation, technologyName, geometryControl, wheelbase, groundClearance
- **relations**: supportsSuspension→SuspensionSystem, mountsBrakes→BrakeSystem, supportsRack→CapacitySpecification

## Suspension System
- **genus**: `cco:ont00000995`
- **definition**: The assembly of mechanical components that connects the vehicle to its wheels and absorbs road shocks.
- **attributes**: frontType, rearType, seatHeight, diveControl
- **relations**: connectsToFrame→ChassisFrame, mountsWheel→WheelAssembly

## Brake System
- **genus**: `cco:ont00000995`
- **definition**: The mechanical assembly used to slow or stop the vehicle's motion through friction.
- **attributes**: frontDiscDiameter, rearDiscDiameter, caliperType, ventilation
- **relations**: mountedOn→ChassisFrame, actsOn→WheelAssembly

## Wheel Assembly
- **genus**: `cco:ont00000995`
- **definition**: The complete rotating unit comprising the tire, rim, and hub, responsible for vehicle traction and support.
- **attributes**: position, tireWidth, tireHeight, rimDiameter, rimMaterial, tireModel
- **relations**: attachedTo→SuspensionSystem, rotatesOn→BrakeSystem

## Capacity Specification
- **genus**: `cco:ont00000995`
- **definition**: A defined limit or volume for carrying loads, towing, or storing fluids within the vehicle.
- **attributes**: capacityType, value, unit, location
- **relations**: appliesTo→ChassisFrame, limits→Powertrain
