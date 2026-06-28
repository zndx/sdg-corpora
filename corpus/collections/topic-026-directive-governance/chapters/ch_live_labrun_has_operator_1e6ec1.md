---
chapter_id: ch_live_labrun_has_operator_1e6ec1
topic_id: 26
family: 02_observation_measurement
cited_terms: ['labrun_has_operator', 'dengue_transmission_process', 'schemaorg_person_affiliation']
model: engine-refine
---

In operational governance, every execution event must be anchored by a unique identifier to ensure full auditability and traceability. For instance, a laboratory run might be assigned an identifier such as OPER-0001, linking it directly to the specific operator responsible for its execution, like OPER-0007. The performance and reliability of these operators are quantified through precise duration metrics; a single run might consume 4856.18 seconds, while another extends to 5155.73 seconds. Furthermore, the operational lifecycle is defined by its conclusion and resilience: an exit code of 122 or 691 signals a specific termination state, while a retry count of 265 indicates significant instability requiring repeated intervention.

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |

To contextualize these execution metrics, operators are classified within a structured metadata framework using categorical and miscellaneous attributes. An operator is not merely a technical key but is assigned a descriptive label, such as Operator Label 01, and grouped into a functional category like Operator Category 01. This categorization allows governance bodies to aggregate performance data across similar operational profiles, ensuring that anomalies—such as high retry counts or prolonged durations—are evaluated against the appropriate baseline for that specific category.

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |

Beyond operator execution, the framework extends to tracking complex events and their biological or systemic dependencies. Each event is uniquely identified and quantified by an event count, which might register 251 occurrences in one instance and 444 in another. Crucially, these events are mapped to their environmental dependencies through "involves host" and "involves vector" relationships. An event might be linked to a specific host identifier, such as PROC-0002, and simultaneously trace back to a transmission vector like PROC-0004. This relational mapping is essential for understanding the scope and transmission pathways of incidents.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

Similar to operators, hosts and vectors are governed by descriptive metadata that provides necessary context for risk assessment. A host is defined by its miscellaneous label, such as Involves Host Label 01, and its overarching category, like Involves Host Category 01. Vectors follow the same classification logic, utilizing labels such as Involves Vector Label 01 and categories like Involves Vector Category 01. By standardizing these attributes, the governance framework ensures that every event's associated hosts and vectors are consistently categorized, enabling precise impact analysis and targeted mitigation strategies.

**dim_involves_host**

| id | involves_host_label | involves_host_category |
| --- | --- | --- |
| PROC-0001 | Involves Host Label 01 | Involves Host Category 01 |
| PROC-0002 | Involves Host Label 02 | Involves Host Category 02 |
| PROC-0003 | Involves Host Label 03 | Involves Host Category 03 |
| PROC-0004 | Involves Host Label 04 | Involves Host Category 04 |
| PROC-0005 | Involves Host Label 05 | Involves Host Category 05 |
| PROC-0006 | Involves Host Label 06 | Involves Host Category 06 |

**dim_involves_vector**

| id | involves_vector_label | involves_vector_category |
| --- | --- | --- |
| PROC-0001 | Involves Vector Label 01 | Involves Vector Category 01 |
| PROC-0002 | Involves Vector Label 02 | Involves Vector Category 02 |
| PROC-0003 | Involves Vector Label 03 | Involves Vector Category 03 |
| PROC-0004 | Involves Vector Label 04 | Involves Vector Category 04 |
| PROC-0005 | Involves Vector Label 05 | Involves Vector Category 05 |
| PROC-0006 | Involves Vector Label 06 | Involves Vector Category 06 |
| PROC-0007 | Involves Vector Label 07 | Involves Vector Category 07 |
| PROC-0008 | Involves Vector Label 08 | Involves Vector Category 08 |

Finally, the governance model accounts for structural relationships and resource consumption through affiliation tracking and size metrics. Entities are bound to a specific affiliation—identified by keys such as AFFI-0001—which dictates their organizational or structural alignment. This affiliation is further detailed by miscellaneous labels (e.g., Affiliation Label 01) and categorical groupings (e.g., Affiliation Category 01). Concurrently, the framework monitors the physical footprint of these entities through size bytes; a single record might consume 895,265,030 bytes, while another requires 998,785,819 bytes. Monitoring these size metrics alongside affiliations ensures that storage resources are allocated efficiently and remain within compliance thresholds.

**fact_schemaorg**

| id | affiliation_key | size_bytes | version |
| --- | --- | --- | --- |
| AFFI-0001 | AFFI-0001 | 895265030 | 3 |
| AFFI-0002 | AFFI-0004 | 114301972 | 5 |
| AFFI-0003 | AFFI-0002 | 338701831 | 4 |
| AFFI-0004 | AFFI-0003 | 998785819 | 8 |

**dim_affiliation**

| id | affiliation_label | affiliation_category |
| --- | --- | --- |
| AFFI-0001 | Affiliation Label 01 | Affiliation Category 01 |
| AFFI-0002 | Affiliation Label 02 | Affiliation Category 02 |
| AFFI-0003 | Affiliation Label 03 | Affiliation Category 03 |
| AFFI-0004 | Affiliation Label 04 | Affiliation Category 04 |
| AFFI-0005 | Affiliation Label 05 | Affiliation Category 05 |
| AFFI-0006 | Affiliation Label 06 | Affiliation Category 06 |