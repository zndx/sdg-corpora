---
chapter_id: ch_live_directive_only_governs_f826aa
topic_id: 12
family: 01_foundation
cited_terms: ['directive_only_governs', 'audit_produces_evidence', 'belief_interval_equiv_bel_and_pl']
model: engine-refine
---

Governance architectures depend upon a rigorous identification discipline to bind regulatory obligations, audit artifacts, and uncertainty models into a single traceable fabric. Each record is anchored by a stable identifier—such as GOVE-0001 for a data privacy directive, EVID-0001 for an audit evidence package, or BEL-0001 for a belief interval—ensuring that cross-domain references remain unambiguous. These identifiers do not merely label isolated entries; they function as foreign keys that link directives to their corresponding belief bounds, audit scopes to their supporting evidence, and temporal markers to their originating entities. When an entity such as EVID-0001 is referenced across multiple valuation tables, the identifier guarantees that every attribute assignment, whether numeric, textual, or temporal, resolves to the correct compliance artifact without ambiguity.

**t_audit_produces_evidence**

| id | audit |
| --- | --- |
| EVID-0001 | Data Retention Policy Audit |
| EVID-0002 | ISO27001 Certification |
| EVID-0003 | Cloud Infrastructure Scan |
| EVID-0004 | Cloud Infrastructure Scan |
| EVID-0005 | Data Retention Policy Audit |
| EVID-0006 | Data Retention Policy Audit |

**t_belief_interval_equiv_bel_and_pl**

| id | belief | belief_lower_bound | plausibility_upper_bound |
| --- | --- | --- | --- |
| BEL-0001 | signal_attenuation | EVID-0005 | ground_truth_marker |
| BEL-0002 | thermal_runaway | EVID-0004 | non_contradictory_set |
| BEL-0003 | latency_spike | EVID-0002 | direct_observation_7 |
| BEL-0004 | sensor_drift | EVID-0001 | secondary_sensor_read |
| BEL-0005 | thermal_runaway | EVID-0001 | ground_truth_marker |
| BEL-0006 | calibration_failure | EVID-0001 | extended_telemetry |
| BEL-0007 | data_corruption | EVID-0006 | secondary_sensor_read |
| BEL-0008 | packet_loss | EVID-0006 | tentative_marker |

The structural integrity of this framework relies on a strict attribute typing regime that governs how evidence and belief intervals are characterized. Each attr is declared with a precise name—confidence, dimension_kind, method, or recorded_at—and bound to a canonical attr type such as xsd:decimal, xsd:string, or xsd:dateTime. This typed declaration prevents semantic drift during evidence collection and ensures that downstream validation engines can parse, compare, and aggregate metrics consistently. A confidence metric is constrained to decimal precision, while a method descriptor or dimension kind remains a string, and a recorded_at timestamp adheres to ISO 8601 formatting. By enforcing these type contracts at the schema level, the system eliminates ambiguous casting and guarantees that every attribute assignment aligns with its declared semantic domain.

Heterogeneous evidence values are routed through specialized storage partitions that preserve type fidelity while supporting rapid retrieval. Numeric scores such as 0.658 or 291.89 are persisted in decimal partitions, textual descriptors like calibration record or Dimension Kind 01 reside in varchar stores, and temporal markers such as 2025-03-28T10:19:21 or 2023-02-07T18:23:26 are isolated in datetime buckets. This misc storage strategy allows the framework to handle diverse evidence formats without compromising query performance or type safety. When an entity like BEL-0001 requires a confidence score of 0.034 alongside a recorded_at timestamp of 2025-01-05T17:59:26, the system retrieves each value from its appropriate partition, reconstructs the complete attribute profile, and presents it as a unified evidence snapshot.

Temporal governance and regulatory posture are managed through effectivedate and enforcement fields that dictate when obligations activate and how strictly they must be observed. Directives such as CCPA Section 1798.100, ICH Q10, FDA 21 CFR Part 11, and PCI DSS v4.0 are each assigned a precise effective_date—ranging from 2023-04-09 to 2024-03-28—ensuring that compliance tracking aligns with legislative or industry rollout schedules. Regardless of the domain, the enforcement posture is uniformly classified as mandatory, signaling that adherence is non-negotiable and subject to audit verification. This temporal-enforcement pairing allows compliance officers to filter active obligations by date, map them to relevant audit scopes like Data Retention Policy Audit or ISO27001 Certification, and verify that evidence collection meets the required regulatory threshold.

**t_directive_only_governs**

| id | directive | related | effective_date | enforcement |
| --- | --- | --- | --- | --- |
| GOVE-0001 | CCPA Section 1798.100 | BEL-0002 | 2023-05-14 | mandatory |
| GOVE-0002 | ICH Q10 | BEL-0008 | 2023-04-09 | mandatory |
| GOVE-0003 | FDA 21 CFR Part 11 | BEL-0002 | 2024-03-28 | mandatory |
| GOVE-0004 | PCI DSS v4.0 | BEL-0005 | 2023-10-25 | mandatory |
| GOVE-0005 | HIPAA Privacy Rule | BEL-0004 | 2023-11-19 | advisory |
| GOVE-0006 | PCI DSS v4.0 | BEL-0001 | 2023-08-29 | advisory |
| GOVE-0007 | HIPAA Privacy Rule | BEL-0003 | 2025-01-19 | advisory |
| GOVE-0008 | HIPAA Privacy Rule | BEL-0008 | 2024-12-25 | advisory |

In practice, these components operate as an integrated verification loop: identifiers link directives to belief intervals and audit evidence, typed attributes structure the metadata, misc partitions preserve heterogeneous values, and effective dates with mandatory enforcement ensure temporal accuracy and regulatory rigor. When a Cloud Infrastructure Scan generates evidence, the system assigns it an identifier, attaches typed attributes such as method and recorded_at, stores the resulting values in their respective partitions, and cross-references the governing directive’s effective date to confirm compliance windows. This architecture transforms fragmented audit data into a deterministic compliance graph, where every attribute, timestamp, and numeric score can be traced back to its originating entity, validated against its declared type, and evaluated against the active regulatory mandate.

**t_audit_produces_evidence_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EVID-0001 | confidence | xsd:decimal |
| EVID-0002 | dimension_kind | xsd:string |
| EVID-0003 | method | xsd:string |
| EVID-0004 | recorded_at | xsd:dateTime |
| EVID-0005 | uncertainty | xsd:decimal |
| EVID-0006 | unit | xsd:string |
| EVID-0007 | value | xsd:decimal |
| EVID-0008 | encoding | xsd:string |

**t_audit_produces_evidence_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0004 | 2025-03-28T10:19:21 |
| EVID-0002 | EVID-0002 | EVID-0004 | 2023-02-07T18:23:26 |
| EVID-0003 | EVID-0003 | EVID-0004 | 2025-03-19T12:10:16 |
| EVID-0004 | EVID-0004 | EVID-0004 | 2023-11-17T00:14:22 |
| EVID-0005 | EVID-0005 | EVID-0004 | 2023-04-23T17:18:39 |
| EVID-0006 | EVID-0006 | EVID-0004 | 2024-01-14T13:39:09 |

**t_audit_produces_evidence_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0001 | 0.658 |
| EVID-0002 | EVID-0001 | EVID-0005 | 291.89 |
| EVID-0003 | EVID-0001 | EVID-0007 | 838.98 |
| EVID-0004 | EVID-0002 | EVID-0001 | 0.814 |
| EVID-0005 | EVID-0002 | EVID-0005 | 409.44 |
| EVID-0006 | EVID-0002 | EVID-0007 | 534.69 |
| EVID-0007 | EVID-0003 | EVID-0001 | 0.935 |
| EVID-0008 | EVID-0003 | EVID-0005 | 954.22 |

**t_audit_produces_evidence_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EVID-0001 | EVID-0001 | EVID-0002 | Dimension Kind 01 |
| EVID-0002 | EVID-0001 | EVID-0008 | Encoding 02 |
| EVID-0003 | EVID-0001 | EVID-0009 | calibration record |
| EVID-0004 | EVID-0001 | EVID-0010 | en |
| EVID-0005 | EVID-0001 | EVID-0003 | manual |
| EVID-0006 | EVID-0001 | EVID-0006 | deg_C |
| EVID-0007 | EVID-0002 | EVID-0002 | Dimension Kind 07 |
| EVID-0008 | EVID-0002 | EVID-0008 | Encoding 08 |

**t_belief_interval_equiv_bel_and_pl_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| BEL-0001 | confidence | xsd:decimal |
| BEL-0002 | dimension_kind | xsd:string |
| BEL-0003 | method | xsd:string |
| BEL-0004 | recorded_at | xsd:dateTime |
| BEL-0005 | uncertainty | xsd:decimal |
| BEL-0006 | unit | xsd:string |
| BEL-0007 | value | xsd:decimal |
| BEL-0008 | encoding | xsd:string |

**t_belief_interval_equiv_bel_and_pl_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0004 | 2025-01-05T17:59:26 |
| BEL-0002 | BEL-0002 | BEL-0004 | 2024-10-14T22:53:55 |
| BEL-0003 | BEL-0003 | BEL-0004 | 2023-07-18T12:12:54 |
| BEL-0004 | BEL-0004 | BEL-0004 | 2023-03-22T01:52:23 |
| BEL-0005 | BEL-0005 | BEL-0004 | 2025-03-12T03:35:20 |
| BEL-0006 | BEL-0006 | BEL-0004 | 2025-06-14T01:50:46 |
| BEL-0007 | BEL-0007 | BEL-0004 | 2023-03-18T15:47:07 |
| BEL-0008 | BEL-0008 | BEL-0004 | 2023-02-26T17:53:54 |

**t_belief_interval_equiv_bel_and_pl_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0001 | 0.034 |
| BEL-0002 | BEL-0001 | BEL-0005 | 388.43 |
| BEL-0003 | BEL-0001 | BEL-0007 | 756.27 |
| BEL-0004 | BEL-0002 | BEL-0001 | 0.503 |
| BEL-0005 | BEL-0002 | BEL-0005 | 930.65 |
| BEL-0006 | BEL-0002 | BEL-0007 | 513.67 |
| BEL-0007 | BEL-0003 | BEL-0001 | 0.478 |
| BEL-0008 | BEL-0003 | BEL-0005 | 619.21 |

**t_belief_interval_equiv_bel_and_pl_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| BEL-0001 | BEL-0001 | BEL-0002 | Dimension Kind 01 |
| BEL-0002 | BEL-0001 | BEL-0008 | Encoding 02 |
| BEL-0003 | BEL-0001 | BEL-0009 | intake form |
| BEL-0004 | BEL-0001 | BEL-0010 | es |
| BEL-0005 | BEL-0001 | BEL-0003 | hybrid |
| BEL-0006 | BEL-0001 | BEL-0006 | deg_C |
| BEL-0007 | BEL-0002 | BEL-0002 | Dimension Kind 07 |
| BEL-0008 | BEL-0002 | BEL-0008 | Encoding 08 |