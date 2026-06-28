---
chapter_id: ch_live_intermediate_floor_assembly_a0a0a8
topic_id: 168
family: 08_derived
cited_terms: ['intermediate_floor_assembly', 'program_with_entry_exactly_one', 'syscall_subclass']
model: engine-refine
---

In operational governance frameworks, the tracking of physical assembly structures relies on unique identifiers to maintain traceability across the supply chain. The intermediate floor assembly records capture discrete structural components, each assigned a distinct identifier such as ASSE-0001 through ASSE-0004. These assemblies encompass functional units like the Gearbox Intermediate Shelf, Motor Mount Deck, and Wing Spar Floor, with each entry documenting the specific lateral restraint strap or component it contains—ranging from Retaining Clip and Locking Clevis to Shear Pin Assembly and Damping Mount. This granular linkage between assembly and contained component ensures that maintenance logs, inspection reports, and compliance audits can reference a single identifier and immediately resolve both the parent structure and its constituent hardware.

**t_intermediate_floor_assembly**

| id | intermediate_floor_assembly | contains_component |
| --- | --- | --- |
| ASSE-0001 | Gearbox Intermediate Shelf | Retaining Clip |
| ASSE-0002 | Motor Mount Deck | Locking Clevis |
| ASSE-0003 | Wing Spar Floor | Shear Pin Assembly |
| ASSE-0004 | Motor Mount Deck | Damping Mount |

The syscall subsystem dimension provides categorical classification for system-level event tracking, organizing each subsystem identifier under a category and a human-readable label. Subsystems are assigned identifiers such as SYSC-0001 through SYSC-0004, each mapped to a category like In Syscall Subsystem Category 01 through Category 04 and a corresponding label such as In Syscall Subsystem Label 01 through Label 04. This categorical taxonomy enables governance teams to aggregate events by functional domain rather than by individual subsystem, supporting risk assessments that operate at the category level while retaining the ability to drill down to the specific subsystem when anomalies arise.

**dim_in_syscall_subsystem**

| id | in_syscall_subsystem_label | in_syscall_subsystem_category |
| --- | --- | --- |
| SYSC-0001 | In Syscall Subsystem Label 01 | In Syscall Subsystem Category 01 |
| SYSC-0002 | In Syscall Subsystem Label 02 | In Syscall Subsystem Category 02 |
| SYSC-0003 | In Syscall Subsystem Label 03 | In Syscall Subsystem Category 03 |
| SYSC-0004 | In Syscall Subsystem Label 04 | In Syscall Subsystem Category 04 |
| SYSC-0005 | In Syscall Subsystem Label 05 | In Syscall Subsystem Category 05 |
| SYSC-0006 | In Syscall Subsystem Label 06 | In Syscall Subsystem Category 06 |

Event count data forms the factual core of syscall monitoring, with each record tied to a subsystem identifier through a foreign key relationship. The fact table captures event counts ranging from 52 to 382 across the observed subsystems—SYSC-0001 recorded 238 events, SYSC-0002 logged 52, SYSC-0003 captured 198, and SYSC-0004 reached 382. Notably, the subsystem key referenced in the fact record does not always match the fact record's own identifier; for instance, the fact record SYSC-0001 points to subsystem SYSC-0004, indicating that the fact table's primary key serves as a unique event record identifier while the foreign key resolves the actual subsystem under which the events occurred. This separation allows the same subsystem to accumulate events across multiple fact records without ambiguity.

**fact_syscall**

| id | in_syscall_subsystem_key | event_count |
| --- | --- | --- |
| SYSC-0001 | SYSC-0004 | 238 |
| SYSC-0002 | SYSC-0002 | 52 |
| SYSC-0003 | SYSC-0003 | 198 |
| SYSC-0004 | SYSC-0005 | 382 |
| SYSC-0005 | SYSC-0002 | 283 |
| SYSC-0006 | SYSC-0001 | 288 |

Program entries with exactly one entry point are tracked through a composite structure that ties a program name to its entry point, a resource identifier, and a version number. Programs such as inventory_sync and nightly_etl and health_check are each associated with a specific entry mechanism—api_gateway, main.py, or cron_trigger—and carry a resource identifier like ARN:res/41 or ref-8842. The version field, holding integer values such as 12, 3, 8, and 11, enables version control over program deployments, ensuring that compliance audits can verify which version of a given program was active at any point in time. The resource identifier provides an additional layer of traceability, linking the program to its deployed resource within the infrastructure.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | api_gateway | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | main.py | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | api_gateway | ARN:res/41 | 8 |
| ONE-0004 | health_check | cron_trigger | ref-8842 | 11 |
| ONE-0005 | health_check | api_gateway | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | command_line | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | start_service | urn:uuid:9f2a | 1 |