# Collection — topic 195 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **6 chapters** · **5 topics** (target + style) · **14 ontology terms** · **14 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 195: topic 0, topic 67, topic 105, topic 147.

> **Topic gist** (representative FinePDFs text): Global Simulation of Noble Gases and Their Binary Mixtures Inaugural-Dissertation zur Erlangung des Doktorgrades der Mathematisch-Naturwissenschaftlichen Fakultät der Universität zu Köln Afshin Eskandari Nasrabad aus Mashad-Iran April 3, 2003 To my mother and to Rozita, for the love and encouragement that you have given me while I was doing my PhD. Berichterstatter: Prof. Dr. U. K. Deiters I... …

## Chapters

- [ch_live_appointment_scheduling_process_b78ca6](chapters/ch_live_appointment_scheduling_process_b78ca6.md)
- [ch_live_artifact_either_active_or_archived_de422f](chapters/ch_live_artifact_either_active_or_archived_de422f.md)
- [ch_live_directive_not_superseded_cd604a](chapters/ch_live_directive_not_superseded_cd604a.md)
- [ch_live_ebpf_event_basic_d20ab5](chapters/ch_live_ebpf_event_basic_d20ab5.md)
- [ch_live_profile_over_time_window_200f0d](chapters/ch_live_profile_over_time_window_200f0d.md)
- [ch_live_sysblock_subclass_09cf61](chapters/ch_live_sysblock_subclass_09cf61.md)

## Ontology terms grounding this collection

- `appointment_scheduling_process` — AppointmentSchedulingProcess is a process operated by a ReceptionistAgent that targets a PatientAppointmentSchedule.
- `artifact_either_active_or_archived` — {X} is equivalent to artifact and {Y} or {Z}
- `artifact_min_one_owner` — {X} is an artifact
- `constraint_only_constrains` — {X} is a directive information content entity that constrains {Y}
- `directive_not_superseded` — {X} is not {Y}
- `ebpf_event_basic` — {X} is a process
- `labrun_has_operator` — {X} is a process that has operator {Y}
- `profile_over_time_window` — {X} is a descriptive information content entity that over time window {Y}
- `profiling_basic` — {X} is a process
- `profiling_only_targets_datasets` — {X} is a process that targets artifact
- `program_subclass` — {X} is an artifact that has input {Y}
- `sysblock_subclass` — {X} is an artifact that has part {Y}
- `transformation_associated_with_agent` — {X} is a process that was associated with {Y}
- `uretprobe_subclass` — {X} is an artifact that attaches to return hook {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_appointment_scheduling_process`](tables/t_appointment_scheduling_process.sql) — realizes `appointment_scheduling_process` · _shared with 7 other collection(s)_
- [`t_artifact_either_active_or_archived`](tables/t_artifact_either_active_or_archived.sql) — realizes `artifact_either_active_or_archived` · _shared with 7 other collection(s)_
- [`t_artifact_min_one_owner`](tables/t_artifact_min_one_owner.sql) — realizes `artifact_min_one_owner` · _shared with 8 other collection(s)_
- [`t_constraint_only_constrains`](tables/t_constraint_only_constrains.sql) — realizes `constraint_only_constrains` · _shared with 9 other collection(s)_
- [`t_directive_not_superseded`](tables/t_directive_not_superseded.sql) — realizes `directive_not_superseded` · _shared with 4 other collection(s)_
- [`t_ebpf_event_basic`](tables/t_ebpf_event_basic.sql) — realizes `ebpf_event_basic` · _shared with 3 other collection(s)_
- [`t_labrun_has_operator`](tables/t_labrun_has_operator.sql) — realizes `labrun_has_operator` · _shared with 9 other collection(s)_
- [`t_profile_over_time_window`](tables/t_profile_over_time_window.sql) — realizes `profile_over_time_window` · _shared with 4 other collection(s)_
- [`t_profiling_basic`](tables/t_profiling_basic.sql) — realizes `profiling_basic` · _shared with 7 other collection(s)_
- [`t_profiling_only_targets_datasets`](tables/t_profiling_only_targets_datasets.sql) — realizes `profiling_only_targets_datasets` · _shared with 2 other collection(s)_
- [`t_program_subclass`](tables/t_program_subclass.sql) — realizes `program_subclass` · _shared with 6 other collection(s)_
- [`t_sysblock_subclass`](tables/t_sysblock_subclass.sql) — realizes `sysblock_subclass` · _shared with 6 other collection(s)_
- [`t_transformation_associated_with_agent`](tables/t_transformation_associated_with_agent.sql) — realizes `transformation_associated_with_agent` · _shared with 8 other collection(s)_
- [`t_uretprobe_subclass`](tables/t_uretprobe_subclass.sql) — realizes `uretprobe_subclass` · _shared with 5 other collection(s)_
