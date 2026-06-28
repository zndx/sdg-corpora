---
chapter_id: ch_live_subclass_not_basic_df6a64
topic_id: 31
family: 01_foundation
cited_terms: ['subclass_not_basic', 'campus_event_participation', 'ebpf_event_observed_pid']
model: engine-refine
---

In event management systems, a campus event serves as the central organizing entity around which participation and responsibility are structured. Events such as the Winter Poetry Slam, Fall Welcome Week, and Astronomy Night each function as distinct occasions that attract involvement from multiple stakeholder groups. The system tracks participation through a dedicated record for each event, assigning a unique identifier—PART-0001, PART-0002, and so on—to every participation record. This identifier becomes the anchor point for all downstream relationships, ensuring that every connection between an event and its participants can be traced back to a single, unambiguous reference. The identifier pattern extends across the entire data model: subclass records carry IDs like NOT-0001 through NOT-0004, while ebpf observation records use PID-0001 through PID-0004, establishing a consistent naming convention that supports referential integrity across disparate entity types.

**t_subclass_not_basic**

| id | not | not_2 |
| --- | --- | --- |
| NOT-0001 | Not 01 | Not 2 01 |
| NOT-0002 | Not 02 | Not 2 02 |
| NOT-0003 | Not 03 | Not 2 03 |
| NOT-0004 | Not 04 | Not 2 04 |
| NOT-0005 | Not 05 | Not 2 05 |
| NOT-0006 | Not 06 | Not 2 06 |

**t_campus_event_participation**

| id | campus_event |
| --- | --- |
| PART-0001 | Winter Poetry Slam |
| PART-0002 | Fall Welcome Week |
| PART-0003 | Astronomy Night |
| PART-0004 | Winter Poetry Slam |
| PART-0005 | Student Government Election |
| PART-0006 | Summer Internship Fair |

**t_campus_event_participation_has_participant**

| id | has_participant |
| --- | --- |
| PART-0001 | Alumni Network Chapter |
| PART-0002 | Undergraduate STEM Majors |
| PART-0003 | Graduate Student Association |
| PART-0004 | Undergraduate STEM Majors |
| PART-0005 | Campus Sustainability Volunteers |
| PART-0006 | Campus Sustainability Volunteers |
| PART-0007 | First-Year Resident Advisors |

**t_ebpf_event_observed_pid**

| id | ebpf |
| --- | --- |
| PID-0001 | syscall_trace |
| PID-0002 | disk_io_tracker |
| PID-0003 | tcp_connect_probe |
| PID-0004 | disk_io_tracker |
| PID-0005 | cpu_profile_sampler |
| PID-0006 | disk_io_tracker |

**t_ebpf_event_observed_pid_observes_pid**

| id | observes_pid |
| --- | --- |
| PID-0001 | 11024 |
| PID-0002 | 11024 |
| PID-0003 | 7743 |
| PID-0004 | 11024 |
| PID-0005 | 8891 |
| PID-0006 | 11024 |

Participant groups represent the organizational units or communities that engage with campus events. These groups—such as the Alumni Network Chapter, Undergraduate STEM Majors, and Graduate Student Association—are cataloged as distinct entities, each with its own identifier. The relationship between a campus event and a participant group is not implicit; it must be explicitly declared through a junction record that captures the nature of the association. This design prevents ambiguity about which groups are involved in which events and, crucially, allows the same group to participate in multiple events with different levels of engagement. For instance, Undergraduate STEM Majors appears as a participant in multiple participation records, indicating their involvement extends across more than one campus event.

The role field is the mechanism by which the system distinguishes between types of participation. Rather than treating all involvement as equivalent, the model assigns each participant group a specific role within the context of a given event. The role values observed in the data—contributor, observer, and owner—represent distinct categories of engagement. A contributor actively shapes the event, an observer monitors or attends without direct responsibility, and an owner bears primary accountability. This role-based differentiation is critical for governance: it enables the system to answer questions about who is responsible for what, who has decision-making authority, and who should be consulted. The same structural pattern appears in the ebpf observation domain, where roles such as reviewer supplement the core set, demonstrating that the role taxonomy is extensible across different subject areas while maintaining a consistent semantic framework.

The subject and target columns formalize the directionality of relationships within the model. In the campus event participation junction table, the subject column (campus_id) identifies the event-side entity, while the target column (has_participant_id) identifies the participant group. This subject-to-target orientation is not merely a database implementation detail; it reflects a deliberate design choice that makes relationships directional and queryable. A record with campus_id pointing to PART-0003 and has_participant_id pointing to PART-0004, with role set to contributor, unambiguously states that the participant group represented by PART-0004 is a contributor to the event represented by PART-0003. The same subject-target-role pattern governs the ebpf observation relationships, where ebpf_id serves as the subject and observes_pid_id as the target, enabling the system to model process observation hierarchies with the same rigor applied to event participation.

**t_ebpf_event_observed_pid__observes_pid**

| id | ebpf_id | observes_pid_id | role |
| --- | --- | --- | --- |
| PID-0001 | PID-0002 | PID-0006 | contributor |
| PID-0002 | PID-0004 | PID-0004 | observer |
| PID-0003 | PID-0003 | PID-0002 | owner |
| PID-0004 | PID-0002 | PID-0002 | reviewer |
| PID-0005 | PID-0005 | PID-0004 | contributor |
| PID-0006 | PID-0005 | PID-0001 | contributor |
| PID-0007 | PID-0006 | PID-0005 | owner |
| PID-0008 | PID-0006 | PID-0002 | contributor |

This relational architecture—where entities are identified by unique keys, linked through junction tables that encode both direction (subject to target) and nature (role) of the connection—provides a foundation for auditability and accountability. When a campus event requires compliance verification, the system can trace from the event identifier through the participation junction to the responsible participant group and its assigned role. The same traceability applies to system-level observability: an ebpf event identified by PID-0002 can be traced through its observation relationships to the processes it monitors, with roles clarifying the nature of each observation. By separating the what (the entity), the who (the participant), and the how (the role) into distinct, joinable structures, the model supports flexible querying without sacrificing the structural guarantees needed for governance and compliance reporting.

**t_campus_event_participation__has_participant**

| id | campus_id | has_participant_id | role |
| --- | --- | --- | --- |
| PART-0001 | PART-0003 | PART-0004 | contributor |
| PART-0002 | PART-0005 | PART-0003 | observer |
| PART-0003 | PART-0002 | PART-0006 | observer |
| PART-0004 | PART-0006 | PART-0001 | owner |
| PART-0005 | PART-0003 | PART-0004 | observer |
| PART-0006 | PART-0004 | PART-0005 | reviewer |
| PART-0007 | PART-0002 | PART-0003 | owner |
| PART-0008 | PART-0004 | PART-0002 | observer |