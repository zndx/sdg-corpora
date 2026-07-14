# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Shock Absorber
- **genus**: `cco:ont00000995`
- **definition**: A mechanical device designed to absorb and dampen shock energy in delicate structures.
- **attributes**: identifier, model, maxForce, maxVoltage, maxPower, status, installationDate
- **relations**: installedIn→Structure, measuredBy→TemperatureReading, usedWith→PowerSystem

## Structure
- **genus**: `cco:ont00000995`
- **definition**: A physical construction or building component subject to shock and environmental stress.
- **attributes**: identifier, name, location, area, volume, status, constructionDate
- **relations**: hasShockAbsorber→ShockAbsorber, experiences→ShockEvent, locatedIn→Environment

## Shock Event
- **genus**: `bfo:0000015`
- **definition**: A transient physical event involving the propagation of a shock wave through a medium.
- **attributes**: identifier, startTime, endTime, intensity, depth, force, status, duration
- **relations**: affects→Structure, causes→TemperatureReading, measuredBy→Sensor

## Temperature Reading
- **genus**: `cco:ont00000995`
- **definition**: A recorded measurement of temperature at a specific point in time and space.
- **attributes**: identifier, value, unit, timestamp, location, status, sensorId
- **relations**: recordedAt→Structure, causedBy→ShockEvent, measuredBy→Sensor

## Power System
- **genus**: `cco:ont00000995`
- **definition**: An electrical system providing power to shock-absorbing or wave-generating equipment.
- **attributes**: identifier, voltage, current, power, status, installationDate, cableType
- **relations**: powers→ShockAbsorber, locatedIn→Structure, monitoredBy→Sensor

## Sensor
- **genus**: `cco:ont00000995`
- **definition**: A device used to measure physical properties such as temperature, force, or pressure.
- **attributes**: identifier, type, accuracy, status, installationDate, calibrationDate
- **relations**: measures→TemperatureReading, monitors→PowerSystem, installedIn→Structure
