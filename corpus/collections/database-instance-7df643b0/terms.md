# Grounding terms

The ontology universals this collection's chapters are written around (each an sdg: class, grounded in a BFO/CCO genus).

## Database Instance
- **genus**: `bfo:0000040`
- **definition**: A specific operational deployment of an relational database software environment, including its memory structures and background processes.
- **attributes**: instanceId, version, operatingSystem, status, environmentType, createdDate
- **relations**: runsOn→ServerHost, managedBy→DBA, usesStorage→StorageStructure

## Server Host
- **genus**: `bfo:0000040`
- **definition**: The physical or virtual machine hardware and operating system environment where the database instance resides.
- **attributes**: hostId, osType, osVersion, cpuCount, ramGB, sanAllocationGB
- **relations**: hostsInstance→DatabaseInstance

## Storage Structure
- **genus**: `bfo:0000040`
- **definition**: The logical and physical data storage components of the database, including tablespaces, datafiles, and blocks.
- **attributes**: structureId, structureType, sizeGB, storageLocation
- **relations**: partOfInstance→DatabaseInstance

## Database Administrator
- **genus**: `bfo:0000002`
- **definition**: A person or role responsible for the installation, configuration, maintenance, and performance tuning of the database system.
- **attributes**: dbaId, name, yearsExperience, specialization, employer
- **relations**: managesInstance→DatabaseInstance, performsTask→MaintenanceTask

## Maintenance Task
- **genus**: `bfo:0000015`
- **definition**: A specific operational activity performed on the database, such as backup, recovery, tuning, or patching.
- **attributes**: taskId, taskType, startDate, endDate, status, toolUsed
- **relations**: executedBy→DBA, targetsInstance→DatabaseInstance

## Performance Report
- **genus**: `cco:ont00000995`
- **definition**: A generated document or dataset containing metrics and analysis of database performance, such as STATSPACK or AWR reports.
- **attributes**: reportId, reportType, generatedDate, durationHours, topWaitEvent
- **relations**: generatedForInstance→DatabaseInstance, createdBy→DBA
