# Collection — topic 31 · 03_directive_governance

FinePDFs-grounded topic (carried forward from the coverage audit). **3 chapters** · **5 topics** (target + style) · **9 ontology terms** · **9 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 31: topic 87, topic 122, topic 145, topic 156.

> **Topic gist** (representative FinePDFs text): JOINT OPERATING COMMITTEE MEETING September 4, 2024 6:30 P.M. MINUTES This meeting was called to order by Ingrid Parker, JOC Chairperson, at 6:30p.m. The Pledge of Allegiance was recited. PRESENT: Troy Chiddick Chris Epstein Xaras Collins Ingrid Parker Beth Patruno Maggie Philips, Esq. William Winchester ALSO PRESENT: Chris Dormer, Superintendent of Record Beth Shore, Solicitor Dr. Angela King... …

## Chapters

- [ch_live_audit_basic_386210](chapters/ch_live_audit_basic_386210.md)
- [ch_live_subclass_not_basic_df6a64](chapters/ch_live_subclass_not_basic_df6a64.md)
- [ch_live_syscall_invoked_by_event_e0bbaf](chapters/ch_live_syscall_invoked_by_event_e0bbaf.md)

## Ontology terms grounding this collection

- `audit_basic` — {X} is a process
- `audit_conducted_by` — {X} is a process that conducted by person
- `audit_for_period` — {X} is a process that for audit period {Y}
- `campus_event_participation` — A CampusEvent is an occurrent that has participant some ParticipantGroup.
- `ebpf_event_observed_pid` — {X} is a process that observes pid {Y}
- `internal_communication_requirement` — InternalCommunicationRequirement is a directive ICE that specifies an EnterpriseSocialMedia and targets an Organizationa
- `subclass_not_basic` — {X} is not {Y}
- `syscall_invoked_by_event` — {X} is a designative information content entity that invoked by event {Y}
- `transformation_starts_at` — {X} is a process that started at time {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_audit_basic`](tables/t_audit_basic.sql) — realizes `audit_basic` · _shared with 8 other collection(s)_
- [`t_audit_conducted_by`](tables/t_audit_conducted_by.sql) — realizes `audit_conducted_by` · _shared with 2 other collection(s)_
- [`t_audit_for_period`](tables/t_audit_for_period.sql) — realizes `audit_for_period` · _shared with 2 other collection(s)_
- [`t_campus_event_participation`](tables/t_campus_event_participation.sql) — realizes `campus_event_participation` · _shared with 8 other collection(s)_
- [`t_ebpf_event_observed_pid`](tables/t_ebpf_event_observed_pid.sql) — realizes `ebpf_event_observed_pid` · _shared with 9 other collection(s)_
- [`t_internal_communication_requirement`](tables/t_internal_communication_requirement.sql) — realizes `internal_communication_requirement` · _shared with 9 other collection(s)_
- [`t_subclass_not_basic`](tables/t_subclass_not_basic.sql) — realizes `subclass_not_basic` · _shared with 11 other collection(s)_
- [`t_syscall_invoked_by_event`](tables/t_syscall_invoked_by_event.sql) — realizes `syscall_invoked_by_event` · _shared with 7 other collection(s)_
- [`t_transformation_starts_at`](tables/t_transformation_starts_at.sql) — realizes `transformation_starts_at` · _shared with 3 other collection(s)_
