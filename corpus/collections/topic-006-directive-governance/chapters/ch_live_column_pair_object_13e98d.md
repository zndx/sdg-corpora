---
chapter_id: ch_live_column_pair_object_13e98d
topic_id: 6
family: 07_long_tail
cited_terms: ['column_pair_object', 'audit_targets_data_artifact', 'attestation_with_supporting_evidence']
model: engine-refine
---

In audit and attestation frameworks, the integrity of evidence hinges on a disciplined taxonomy of attributes, their typed values, and the confidence with which those values are recorded. Each audit artifact—identified by a unique key such as ARTI-0001 or ARTI-0002—carries a set of named attributes whose semantics are captured in a dimension table: duration_seconds, end_time, exit_code, and host_name, each bound to a precise XML Schema Definition type. The attr_type column enforces type discipline across heterogeneous value stores, routing decimal measures like 4704.44 or 2823.51 into the decimal value table, integer codes such as 102 or 803 into the integer store, timestamped events like 2024-12-01T01:08:20 into the datetime repository, and free-form descriptors such as node-a01 or execution into the varchar table. This type-aware partitioning ensures that downstream analytics and compliance checks operate on values of known structure, eliminating ambiguity at the point of ingestion.

The entity column serves as the relational glue binding typed values back to their originating audit artifact. An entity identifier such as ARTI-0001 may appear across multiple value tables, each time paired with a distinct attr_id that references the attribute definition in the artifact-attribute dimension. This many-to-many arrangement—where a single entity accumulates heterogeneous attribute values and a single attribute type may be instantiated across many entities—models the reality that audit artifacts are composite objects: a single assessment like Cloud-Bucket-Encryption or SOC2-Q3-2023 carries duration, timestamps, exit codes, and host identifiers simultaneously. The attr_id foreign key, appearing in every value table, anchors each measured value to its semantic definition, while the entity_id anchors it to the artifact under evaluation.

Beyond the attribute-value layer, the object column dimension introduces a parallel taxonomy for categorizing measured quantities. Each object column is assigned a label—Object Column Label 01 through Object Column Label 04—and a category—Object Column Category 01 through Object Column Category 04—that groups columns by functional domain. The fact_column table then links individual identifiers (OBJE-0001, OBJE-0002, and so forth) to their parent object columns, while recording a confidence score and an uncertainty magnitude for each association. Confidence values such as 0.354 or 0.068 quantify the degree of belief in the measured value, while uncertainty figures—ranging from 404.01 to 984.09—express the dispersion or error bound around the recorded measure. Together, these two metrics enable risk-weighted aggregation: a value of 257.80 with confidence 0.164 and uncertainty 560.21 carries substantially less evidentiary weight than a value of 131.27 with confidence 0.354 and uncertainty 404.01, even though the latter is numerically smaller.

**fact_column**

| id | object_column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| OBJE-0001 | OBJE-0006 | 0.164 | 560.21 | 257.80 |
| OBJE-0002 | OBJE-0001 | 0.068 | 744.10 | 571.55 |
| OBJE-0003 | OBJE-0004 | 0.107 | 984.09 | 140.18 |
| OBJE-0004 | OBJE-0002 | 0.354 | 404.01 | 131.27 |
| OBJE-0005 | OBJE-0006 | 0.790 | 109.97 | 235.19 |
| OBJE-0006 | OBJE-0003 | 0.934 | 653.09 | 813.74 |
| OBJE-0007 | OBJE-0004 | 0.938 | 827.04 | 409.13 |
| OBJE-0008 | OBJE-0006 | 0.734 | 419.22 | 492.32 |

**dim_object_column**

| id | object_column_label | object_column_category |
| --- | --- | --- |
| OBJE-0001 | Object Column Label 01 | Object Column Category 01 |
| OBJE-0002 | Object Column Label 02 | Object Column Category 02 |
| OBJE-0003 | Object Column Label 03 | Object Column Category 03 |
| OBJE-0004 | Object Column Label 04 | Object Column Category 04 |
| OBJE-0005 | Object Column Label 05 | Object Column Category 05 |
| OBJE-0006 | Object Column Label 06 | Object Column Category 06 |

The attestation lifecycle is governed by two orthogonal control dimensions: phase and triggered_by. The phase column enumerates the four stages of the attestation workflow—initiation, execution, review, and closeout—providing a temporal scaffold against which evidence is collected and validated. The triggered_by column distinguishes between event-driven and API-driven evidence collection, with values such as event and api indicating whether the attestation was activated by an external occurrence or by a programmatic invocation. An attestation record like EVID-0001, which links the SOC2 Compliance Review to the Encryption Key Manifest during the initiation phase and is triggered by an event, represents a fundamentally different evidentiary posture than EVID-0003, which binds the Patient Consent Declaration to a Digital Signature Block during the review phase and is triggered by an API call. These dimensions ensure that every piece of supporting evidence can be traced to its procedural context and activation mechanism.

**t_attestation_with_supporting_evidence**

| id | attestation | with_supporting_evidence | phase | triggered_by |
| --- | --- | --- | --- | --- |
| EVID-0001 | SOC2 Compliance Review | Encryption Key Manifest | initiation | event |
| EVID-0002 | Data Provenance Statement | TLS Certificate Bundle | execution | event |
| EVID-0003 | Patient Consent Declaration | Digital Signature Block | review | api |
| EVID-0004 | Data Provenance Statement | SHA256 Checksum Hash | closeout | api |

At the intersection of these layers lies the identifier—a unique key that propagates across every table, from audit artifacts through attribute definitions, typed values, object columns, and attestation records. Identifiers such as OBJE-0001, ARTI-0001, and EVID-0001 are not merely labels; they are the join keys that reconstruct a complete evidentiary chain. When an analyst queries for all attributes of artifact ARTI-0001, the system resolves the artifact-attribute dimension to discover that duration_seconds is typed as xsd:decimal, end_time as xsd:dateTime, exit_code as xsd:integer, and host_name as xsd:string, then queries each value table for rows where entity_id equals ARTI-0001 and attr_id matches the corresponding attribute definition. The resulting composite—4704.44 seconds, 2024-12-01T01:08:20, exit code 102, host node-a01—constitutes a single, type-safe observation. The confidence and uncertainty metadata attached to related object column associations then allow the system to weight this observation appropriately in any downstream compliance calculation.

**t_audit_targets_data_artifact**

| id | audit |
| --- | --- |
| ARTI-0001 | Cloud-Bucket-Encryption |
| ARTI-0002 | SOC2-Q3-2023 |
| ARTI-0003 | API-Auth-Token-Rotation |
| ARTI-0004 | Vendor-Access-Assessment |
| ARTI-0005 | Cloud-Bucket-Encryption |
| ARTI-0006 | Model-Pipeline-Validation |

**t_audit_targets_data_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | duration_seconds | xsd:decimal |
| ARTI-0002 | end_time | xsd:dateTime |
| ARTI-0003 | exit_code | xsd:integer |
| ARTI-0004 | host_name | xsd:string |
| ARTI-0005 | log_level | xsd:string |
| ARTI-0006 | phase | xsd:string |
| ARTI-0007 | retry_count | xsd:integer |
| ARTI-0008 | scheduled_at | xsd:dateTime |

**t_audit_targets_data_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | 2024-12-01T01:08:20 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | 2025-04-11T08:34:59 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | 2024-01-10T01:48:17 |
| ARTI-0004 | ARTI-0002 | ARTI-0002 | 2023-12-13T07:58:05 |
| ARTI-0005 | ARTI-0002 | ARTI-0008 | 2024-04-04T16:02:49 |
| ARTI-0006 | ARTI-0002 | ARTI-0009 | 2023-03-02T22:50:55 |
| ARTI-0007 | ARTI-0003 | ARTI-0002 | 2025-03-24T22:59:49 |
| ARTI-0008 | ARTI-0003 | ARTI-0008 | 2024-12-31T14:33:38 |

**t_audit_targets_data_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 4704.44 |
| ARTI-0002 | ARTI-0002 | ARTI-0001 | 2823.51 |
| ARTI-0003 | ARTI-0003 | ARTI-0001 | 460.93 |
| ARTI-0004 | ARTI-0004 | ARTI-0001 | 4764.85 |
| ARTI-0005 | ARTI-0005 | ARTI-0001 | 3458.42 |
| ARTI-0006 | ARTI-0006 | ARTI-0001 | 1214.20 |

**t_audit_targets_data_artifact_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0003 | 102 |
| ARTI-0002 | ARTI-0001 | ARTI-0007 | 288 |
| ARTI-0003 | ARTI-0002 | ARTI-0003 | 803 |
| ARTI-0004 | ARTI-0002 | ARTI-0007 | 1 |
| ARTI-0005 | ARTI-0003 | ARTI-0003 | 425 |
| ARTI-0006 | ARTI-0003 | ARTI-0007 | 187 |
| ARTI-0007 | ARTI-0004 | ARTI-0003 | 75 |
| ARTI-0008 | ARTI-0004 | ARTI-0007 | 345 |

**t_audit_targets_data_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | node-a01 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | Log Level 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0006 | execution |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | running |
| ARTI-0005 | ARTI-0001 | ARTI-0011 | Triggered By 05 |
| ARTI-0006 | ARTI-0002 | ARTI-0004 | node-a01 |
| ARTI-0007 | ARTI-0002 | ARTI-0005 | Log Level 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0006 | closeout |