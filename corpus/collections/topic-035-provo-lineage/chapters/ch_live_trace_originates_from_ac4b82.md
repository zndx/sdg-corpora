---
chapter_id: ch_live_trace_originates_from_ac4b82
topic_id: 35
family: 02_observation_measurement
cited_terms: ['trace_originates_from', 'agent_basic', 'board_membership']
model: engine-refine
---

Execution traces are the foundational telemetry objects in the operational observability framework, each uniquely identified by an identifier such as FROM-0001 or FROM-0002 and linked to its source through the originates_from foreign key. The fact_trace table records three quantitative performance indicators for every trace: duration_seconds, which captures the elapsed wall-clock time of the execution and ranges from 1874.27 seconds for trace FROM-0001 to 3940.66 seconds for FROM-0003; exit_code, a non-negative integer signaling the termination state, with observed values including 491, 900, 420, and 60; and retry_count, which tallies the number of re-attempts before final resolution, reaching as high as 459 for trace FROM-0004 and as low as 179 for FROM-0002. These metrics collectively enable capacity planning, failure-mode analysis, and service-level agreement validation. The originates_from key in fact_trace references the primary key of the dim_originates_from dimension table, where each origin is further classified by an originates_from_category—such as Originates From Category 01 or Originates From Category 04—and annotated with a human-readable originates_from_label like Originates From Label 01. This dimension-level categorization permits aggregation of trace performance by origin type, supporting root-cause attribution across heterogeneous data sources.

**fact_trace**

| id | originates_from_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| FROM-0001 | FROM-0002 | 1874.27 | 491 | 399 |
| FROM-0002 | FROM-0001 | 2092.44 | 900 | 179 |
| FROM-0003 | FROM-0005 | 3940.66 | 420 | 396 |
| FROM-0004 | FROM-0004 | 3336.66 | 60 | 459 |

Agent executions are tracked through a parallel fact table, fact_agent, which associates each agent instance with a version number and a size_bytes measurement. The version field is an integer ranging from 1 to 12 across the observed records, with agent AGEN-0001 running version 7 and AGEN-0004 running version 12, reflecting the diversity of deployed agent revisions. The size_bytes column quantifies the resource footprint of each agent, spanning from 20883723 bytes for AGEN-0004 to 548859900 bytes for AGEN-0003, a range of nearly 26:1 that underscores the importance of size-aware scheduling and quota enforcement. The agent_key column in fact_agent serves as the foreign key pointing to dim_agent, where each agent is described by an agent_label—Agent Label 01 through Agent Label 04—and classified under an agent_category such as Agent Category 01 or Agent Category 03. This separation of quantitative telemetry from qualitative classification mirrors the pattern established by the origin dimension and ensures that agent performance can be analyzed both absolutely and relative to its categorical grouping.

**fact_agent**

| id | agent_key | size_bytes | version |
| --- | --- | --- | --- |
| AGEN-0001 | AGEN-0005 | 211345771 | 7 |
| AGEN-0002 | AGEN-0003 | 458577289 | 1 |
| AGEN-0003 | AGEN-0004 | 548859900 | 1 |
| AGEN-0004 | AGEN-0004 | 20883723 | 12 |
| AGEN-0005 | AGEN-0006 | 490849751 | 11 |

Board-level activity is captured in the fact_board table, which records the number of events associated with each board instance through the event_count measure. Observed event counts vary substantially, from a single-board instance MEMB-0004 with only 26 events to MEMB-0002 with 403 events, indicating highly variable engagement levels that may correlate with board purpose, membership composition, or operational phase. The has_participant_key column in fact_board links each board record to its corresponding entry in dim_has_participant, where the participant is described by a has_participant_label—Has Participant Label 01 through Has Participant Label 04—and categorized under a has_participant_category such as Has Participant Category 01 or Has Participant Category 04. This dimensional linkage enables the analysis of board activity patterns by participant type, supporting governance reviews and resource allocation decisions.

**fact_board**

| id | has_participant_key | event_count |
| --- | --- | --- |
| MEMB-0001 | MEMB-0005 | 236 |
| MEMB-0002 | MEMB-0004 | 403 |
| MEMB-0003 | MEMB-0002 | 359 |
| MEMB-0004 | MEMB-0005 | 26 |
| MEMB-0005 | MEMB-0004 | 209 |
| MEMB-0006 | MEMB-0005 | 369 |
| MEMB-0007 | MEMB-0004 | 133 |

The three fact tables—fact_trace, fact_agent, and fact_board—share a common structural pattern: each carries a surrogate identifier as its primary key, one or more quantitative measures, and a single foreign key that resolves to a corresponding dimension table. The dimension tables—dim_originates_from, dim_agent, and dim_has_participant—each provide two descriptive attributes: a misc column containing a human-readable label and a category column containing a classification code. This star-schema design ensures that all analytical queries can join fact records to their descriptive context through a single hop, minimizing query complexity while preserving the ability to slice performance data by origin, agent, or participant category. The consistent use of identifier keys across fact and dimension tables, such as FROM-0001 appearing in both fact_trace and dim_originates_from, guarantees referential integrity and enables cross-domain correlation when a single entity participates in multiple operational roles.

**dim_originates_from**

| id | originates_from_label | originates_from_category |
| --- | --- | --- |
| FROM-0001 | Originates From Label 01 | Originates From Category 01 |
| FROM-0002 | Originates From Label 02 | Originates From Category 02 |
| FROM-0003 | Originates From Label 03 | Originates From Category 03 |
| FROM-0004 | Originates From Label 04 | Originates From Category 04 |
| FROM-0005 | Originates From Label 05 | Originates From Category 05 |
| FROM-0006 | Originates From Label 06 | Originates From Category 06 |
| FROM-0007 | Originates From Label 07 | Originates From Category 07 |

**dim_agent**

| id | agent_label | agent_category |
| --- | --- | --- |
| AGEN-0001 | Agent Label 01 | Agent Category 01 |
| AGEN-0002 | Agent Label 02 | Agent Category 02 |
| AGEN-0003 | Agent Label 03 | Agent Category 03 |
| AGEN-0004 | Agent Label 04 | Agent Category 04 |
| AGEN-0005 | Agent Label 05 | Agent Category 05 |
| AGEN-0006 | Agent Label 06 | Agent Category 06 |

**dim_has_participant**

| id | has_participant_label | has_participant_category |
| --- | --- | --- |
| MEMB-0001 | Has Participant Label 01 | Has Participant Category 01 |
| MEMB-0002 | Has Participant Label 02 | Has Participant Category 02 |
| MEMB-0003 | Has Participant Label 03 | Has Participant Category 03 |
| MEMB-0004 | Has Participant Label 04 | Has Participant Category 04 |
| MEMB-0005 | Has Participant Label 05 | Has Participant Category 05 |
| MEMB-0006 | Has Participant Label 06 | Has Participant Category 06 |