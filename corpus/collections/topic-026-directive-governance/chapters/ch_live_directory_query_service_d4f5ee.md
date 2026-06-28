---
chapter_id: ch_live_directory_query_service_d4f5ee
topic_id: 26
family: 08_derived
cited_terms: ['directory_query_service', 'span_with_attribute', 'syscall_basic']
model: engine-refine
---

Operational observability and compliance tracking depend on a disciplined schema of identifiers that anchor every record to a single, unambiguous entity. Each span, service, and system call is assigned a unique identifier—such as `SERV-0001` for a service directory entry, `ATTR-0002` for a span attribute, or `SYSC-0001` for a basic syscall—that serves as the primary key across the dimensional and fact tables. These identifiers are not arbitrary; they encode the object type and sequence, enabling reliable joins between the fact tables that capture operational metrics and the dimension tables that supply descriptive metadata. Without this consistent identification layer, audit trails fragment, and it becomes impossible to correlate an event count with the specific span attribute or target user that generated it.

The dimension tables enrich these identifiers with classification and descriptive metadata through three complementary column families: category, misc, and labeltext. The `category` column in each dimension—whether `targets_user_category`, `generates_response_category`, `span_attribute_category`, or the `code` column in `t_syscall_basic`—provides a coarse-grained grouping that supports aggregation and policy enforcement. For example, `t_syscall_basic` assigns syscall `stat` the code `E-21` across both `SYSC-0003` and `SYSC-0004`, signaling that these two distinct records share the same classification despite representing separate entries. The `misc` column, which holds human-readable labels such as `Targets User Label 01`, `Span Attribute Label 02`, or `pre-release note`, serves as the display name for dashboards and reports, while `labeltext` in `t_syscall_basic` carries contextual annotations like `calibration record` or `nightly summary` that explain the operational significance of a given syscall entry.

**dim_targets_user**

| id | targets_user_label | targets_user_category |
| --- | --- | --- |
| SERV-0001 | Targets User Label 01 | Targets User Category 01 |
| SERV-0002 | Targets User Label 02 | Targets User Category 02 |
| SERV-0003 | Targets User Label 03 | Targets User Category 03 |
| SERV-0004 | Targets User Label 04 | Targets User Category 04 |
| SERV-0005 | Targets User Label 05 | Targets User Category 05 |
| SERV-0006 | Targets User Label 06 | Targets User Category 06 |

**dim_generates_response**

| id | generates_response_label | generates_response_category |
| --- | --- | --- |
| SERV-0001 | Generates Response Label 01 | Generates Response Category 01 |
| SERV-0002 | Generates Response Label 02 | Generates Response Category 02 |
| SERV-0003 | Generates Response Label 03 | Generates Response Category 03 |
| SERV-0004 | Generates Response Label 04 | Generates Response Category 04 |
| SERV-0005 | Generates Response Label 05 | Generates Response Category 05 |
| SERV-0006 | Generates Response Label 06 | Generates Response Category 06 |
| SERV-0007 | Generates Response Label 07 | Generates Response Category 07 |
| SERV-0008 | Generates Response Label 08 | Generates Response Category 08 |

**dim_span_attribute**

| id | span_attribute_label | span_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Span Attribute Label 01 | Span Attribute Category 01 |
| ATTR-0002 | Span Attribute Label 02 | Span Attribute Category 02 |
| ATTR-0003 | Span Attribute Label 03 | Span Attribute Category 03 |
| ATTR-0004 | Span Attribute Label 04 | Span Attribute Category 04 |
| ATTR-0005 | Span Attribute Label 05 | Span Attribute Category 05 |
| ATTR-0006 | Span Attribute Label 06 | Span Attribute Category 06 |

**t_syscall_basic**

| id | syscall | code | label_text |
| --- | --- | --- | --- |
| SYSC-0001 | execve | D-33 | pre-release note |
| SYSC-0002 | mmap | B-12 | nightly summary |
| SYSC-0003 | stat | E-21 | calibration record |
| SYSC-0004 | stat | E-21 | pre-release note |
| SYSC-0005 | socket | B-12 | audit excerpt |
| SYSC-0006 | ioctl | C-07 | pre-release note |
| SYSC-0007 | stat | C-07 | audit excerpt |
| SYSC-0008 | unlink | B-12 | calibration record |

The fact tables translate these classified entities into measurable operational signals. The `fact_directory` table links each service to its `targets_user` and `generates_response` dimensions via foreign keys—`SERV-0001` targets user `SERV-0006` and generates response `SERV-0007`, while `SERV-0004` targets user `SERV-0002` and generates response `SERV-0005`. The `event_count` column quantifies the volume of activity associated with each service, ranging from 81 events for `SERV-0003` to 397 for `SERV-0004`, providing a direct measure of service utilization that compliance officers use to establish baselines and detect anomalies. A service with an event count of 397 against a baseline of 200 would trigger an investigation into whether the spike reflects legitimate growth or a potential policy violation.

**fact_directory**

| id | targets_user_key | generates_response_key | event_count |
| --- | --- | --- | --- |
| SERV-0001 | SERV-0006 | SERV-0007 | 315 |
| SERV-0002 | SERV-0002 | SERV-0002 | 259 |
| SERV-0003 | SERV-0001 | SERV-0006 | 81 |
| SERV-0004 | SERV-0002 | SERV-0005 | 397 |

Span-level telemetry is captured in `fact_span`, which records the `span_attribute_key` that ties each measurement to its corresponding dimension in `dim_span_attribute`. The operational health of a span is quantified through three numeric columns: `duration_seconds`, `exit_code`, and `retry_count`. Duration values vary significantly—`ATTR-0001` spans last 4,963.54 seconds while `ATTR-0002` spans complete in 410.92 seconds—reflecting the diverse nature of the underlying operations. Exit codes such as 767, 893, 599, and 91 indicate the terminal status of each span, with non-zero values typically signaling errors or exceptional conditions that require remediation. The `retry_count` column, with values ranging from 145 for `ATTR-0002` to 494 for `ATTR-0001`, captures the resilience of the system; a high retry count paired with a non-zero exit code suggests a persistent failure mode that may warrant architectural intervention or SLA review.

**fact_span**

| id | span_attribute_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| ATTR-0001 | ATTR-0002 | 4963.54 | 767 | 494 |
| ATTR-0002 | ATTR-0004 | 410.92 | 893 | 145 |
| ATTR-0003 | ATTR-0004 | 3549.11 | 599 | 428 |
| ATTR-0004 | ATTR-0004 | 1972.36 | 91 | 306 |
| ATTR-0005 | ATTR-0003 | 1000.45 | 966 | 278 |
| ATTR-0006 | ATTR-0004 | 2614.88 | 676 | 0 |