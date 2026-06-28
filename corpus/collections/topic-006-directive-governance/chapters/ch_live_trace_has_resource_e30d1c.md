---
chapter_id: ch_live_trace_has_resource_e30d1c
topic_id: 6
family: 02_observation_measurement
cited_terms: ['trace_has_resource', 'identifier_unique', 'attestation_with_supporting_evidence']
model: engine-refine
---

The integrity of any audit trail depends upon the disciplined separation of what is measured from how it is measured. An attribute—whether `duration_seconds`, `end_time`, `exit_code`, or `host_name`—captures a discrete dimension of a trace's interaction with a resource such as `s3-data-lake-warehouse`, `postgresql-primary-db`, or `network-bandwidth-10g`. The attribute type, expressed in XSD vocabulary (`xsd:decimal`, `xsd:dateTime`, `xsd:integer`, `xsd:string`), constrains the value domain and ensures that downstream consumers can interpret `6459.38` as a duration, `2024-06-04T06:37:56` as a timestamp, `866` as an exit code, and `node-b14` as a hostname without ambiguity. This type discipline is not decorative; it is the mechanism by which heterogeneous telemetry—batch ETL runs, laboratory assay protocols, governance audit cycles—is rendered queryable and comparable across environments.

**t_trace_has_resource**

| id | trace | resource |
| --- | --- | --- |
| RESO-0001 | batch-etl-nightly | s3-data-lake-warehouse |
| RESO-0002 | lab-assay-protocol-2b | postgresql-primary-db |
| RESO-0003 | governance-audit-cycle-9 | network-bandwidth-10g |
| RESO-0004 | lab-assay-protocol-2b | s3-data-lake-warehouse |
| RESO-0005 | ml-training-run-aurora | iot-sensor-bus-7 |
| RESO-0006 | governance-audit-cycle-9 | gpu-cluster-node-04 |
| RESO-0007 | lab-assay-protocol-2b | gpu-cluster-node-04 |
| RESO-0008 | api-gateway-chain-alpha | compute-node-vm-128 |

**t_trace_has_resource_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RESO-0001 | duration_seconds | xsd:decimal |
| RESO-0002 | end_time | xsd:dateTime |
| RESO-0003 | exit_code | xsd:integer |
| RESO-0004 | host_name | xsd:string |
| RESO-0005 | log_level | xsd:string |
| RESO-0006 | phase | xsd:string |
| RESO-0007 | retry_count | xsd:integer |
| RESO-0008 | scheduled_at | xsd:dateTime |

Identifiers serve as the stable anchors that bind attestations to the evidence they support. A single identifier such as `10.1038/s41586-023-06123` or `W3C-DOI:10.1002/anie.202112345` may point to the same underlying entity, `EVID-0004`, yet carry different checksum algorithms—`md5`, `sha1`, or `blake2b`—reflecting the provenance and trust assumptions of the registering authority. The presence of multiple checksum algorithms for the same evidence item is not redundancy but a deliberate strategy: legacy systems may still rely on `md5` hashes while newer pipelines demand `blake2b` strength, and the framework accommodates both without forcing migration. Language tags (`ja`, `en`, `es`) further qualify the identifier's scope, ensuring that a `PDB-7XYZ-A` record registered in Japanese (`ja`) is distinguishable from its English (`en`) or Spanish (`es`) counterparts, even when all reference the same entity.

**t_identifier_unique**

| id | identifier | identifies | checksum_algo | language |
| --- | --- | --- | --- | --- |
| UNIQ-0001 | 10.1038/s41586-023-06123 | EVID-0004 | md5 | ja |
| UNIQ-0002 | W3C-DOI:10.1002/anie.202112345 | EVID-0004 | sha1 | en |
| UNIQ-0003 | PDB-7XYZ-A | EVID-0004 | md5 | ja |
| UNIQ-0004 | W3C-DOI:10.1002/anie.202112345 | EVID-0004 | blake2b | es |
| UNIQ-0005 | PDB-7XYZ-A | EVID-0006 | blake2b | de |
| UNIQ-0006 | ORCID-0000-0002-1825-0097 | EVID-0006 | md5 | es |
| UNIQ-0007 | W3C-DOI:10.1002/anie.202112345 | EVID-0004 | blake2b | fr |
| UNIQ-0008 | SNOMED-123456008 | EVID-0001 | blake2b | ja |

The attestation layer formalizes the relationship between a claim and its supporting evidence. An attestation such as `SOC2 Compliance Review`, `Data Provenance Statement`, or `Patient Consent Declaration` is linked to one or more unique identifiers through the `with_supporting_evidence` column, creating a verifiable chain from assertion to artifact. This linkage is not static; it is governed by a phase—`initiation`, `execution`, `review`, or `closeout`—that records the lifecycle stage at which the attestation was established. A `Data Provenance Statement` may be created during `execution` and later re-evaluated during `review`, while a `Patient Consent Declaration` might only be finalized at `closeout`. The phase column thus provides temporal context, allowing auditors to reconstruct not just what was attested but when, and under what operational conditions.

**t_attestation_with_supporting_evidence**

| id | attestation | with_supporting_evidence | phase | triggered_by |
| --- | --- | --- | --- | --- |
| EVID-0001 | SOC2 Compliance Review | UNIQ-0007 | initiation | event |
| EVID-0002 | Data Provenance Statement | UNIQ-0006 | execution | event |
| EVID-0003 | Patient Consent Declaration | UNIQ-0007 | review | api |
| EVID-0004 | Data Provenance Statement | UNIQ-0008 | closeout | api |
| EVID-0005 | Sensor Calibration Record | UNIQ-0001 | initiation | manual |
| EVID-0006 | Sensor Calibration Record | UNIQ-0003 | execution | schedule |

The trigger mechanism—`event` or `api`—completes the picture by recording how an attestation came into being. An `event`-triggered attestation arises from an external stimulus, such as the completion of a `batch-etl-nightly` job or the detection of a compliance anomaly, while an `api`-triggered attestation is the result of an explicit programmatic request, perhaps initiated by a governance tool or a user-facing dashboard. This distinction matters for accountability: event-triggered attestations carry the implicit authority of the system's automated controls, whereas API-triggered attestations reflect deliberate human or system-of-record intervention. Together, phase and triggered_by form a two-dimensional provenance matrix that answers both the when and the how of every attestation in the record.

At the operational level, the value tables—datetime, decimal, integer, and varchar—materialize the abstract attribute definitions into concrete measurements. Each value row ties an entity, identified by a resource-level key such as `RESO-0001` or `RESO-0002`, to a specific attribute and its typed value. The entity itself is the resource being traced: `s3-data-lake-warehouse` appears under `RESO-0001` and `RESO-0004`, `postgresql-primary-db` under `RESO-0002`, and `network-bandwidth-10g` under `RESO-0003`, with the same resource potentially appearing multiple times across different traces. The value tables do not merely store numbers and strings; they encode the temporal, quantitative, and categorical dimensions of system behavior, enabling downstream analytics to answer questions about duration distributions, exit code frequencies, host availability, and log severity patterns across the full spectrum of traced operations.

**t_trace_has_resource_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0002 | 2024-06-04T06:37:56 |
| RESO-0002 | RESO-0001 | RESO-0008 | 2024-12-02T12:01:14 |
| RESO-0003 | RESO-0001 | RESO-0009 | 2023-01-28T15:18:51 |
| RESO-0004 | RESO-0002 | RESO-0002 | 2024-10-26T21:48:09 |
| RESO-0005 | RESO-0002 | RESO-0008 | 2023-05-28T23:57:13 |
| RESO-0006 | RESO-0002 | RESO-0009 | 2024-11-25T19:57:56 |
| RESO-0007 | RESO-0003 | RESO-0002 | 2025-04-19T16:24:22 |
| RESO-0008 | RESO-0003 | RESO-0008 | 2023-04-30T19:04:21 |

**t_trace_has_resource_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0001 | 6459.38 |
| RESO-0002 | RESO-0002 | RESO-0001 | 3107.88 |
| RESO-0003 | RESO-0003 | RESO-0001 | 4594.49 |
| RESO-0004 | RESO-0004 | RESO-0001 | 2602.26 |
| RESO-0005 | RESO-0005 | RESO-0001 | 5003.83 |
| RESO-0006 | RESO-0006 | RESO-0001 | 252.98 |
| RESO-0007 | RESO-0007 | RESO-0001 | 239.70 |
| RESO-0008 | RESO-0008 | RESO-0001 | 3334.43 |

**t_trace_has_resource_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0003 | 866 |
| RESO-0002 | RESO-0001 | RESO-0007 | 141 |
| RESO-0003 | RESO-0002 | RESO-0003 | 185 |
| RESO-0004 | RESO-0002 | RESO-0007 | 294 |
| RESO-0005 | RESO-0003 | RESO-0003 | 284 |
| RESO-0006 | RESO-0003 | RESO-0007 | 200 |
| RESO-0007 | RESO-0004 | RESO-0003 | 838 |
| RESO-0008 | RESO-0004 | RESO-0007 | 136 |

**t_trace_has_resource_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RESO-0001 | RESO-0001 | RESO-0004 | node-b14 |
| RESO-0002 | RESO-0001 | RESO-0005 | Log Level 02 |
| RESO-0003 | RESO-0001 | RESO-0006 | closeout |
| RESO-0004 | RESO-0001 | RESO-0010 | running |
| RESO-0005 | RESO-0001 | RESO-0011 | Triggered By 05 |
| RESO-0006 | RESO-0002 | RESO-0004 | worker-07 |
| RESO-0007 | RESO-0002 | RESO-0005 | Log Level 07 |
| RESO-0008 | RESO-0002 | RESO-0006 | review |