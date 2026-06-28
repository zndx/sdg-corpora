---
chapter_id: ch_live_artifact_subclass_two_parents_b4f57e
topic_id: 46
family: 01_foundation
cited_terms: ['artifact_subclass_two_parents', 'ice_subclass_with_part', 'belief_interval_subclass']
model: engine-refine
---

Identifiers serve as the foundational mechanism for unambiguous reference across distributed systems, taking forms that reflect their provenance and governance model. A digital object identifier such as `doi:10.1109/x` anchors a resource to a persistent registry, while an object identifier like `oid:1.3.6.1` situates it within an ASN.1 hierarchy, and a UUID-based uniform resource name (`urn:uuid:9f2a`) provides a locally generated, globally unique handle. These identifiers are not merely labels; they are the keys by which artifacts are tracked through their lifecycle. In the provenance model, a single artifact such as `streaming-window-5min` may carry multiple parent references—`ingestion-script-v2` and `metadata-registry-sync`—each linked through a distinct identifier record, enabling full lineage reconstruction. The internal surrogate key, such as `PARE-0001`, provides an opaque, system-managed primary key that remains stable even when external identifiers change.

Encoding and label text together define how information content elements are both structured and human-interpretable. An encoding specification such as `ascii` or `unicode` determines the byte-level representation of the content, which directly affects interoperability and storage characteristics. The label text provides the human-facing description: an `intake form` might be encoded as `ascii` for maximum compatibility with legacy systems, while a `calibration record` or `nightly summary` could carry `unicode` encoding to support multilingual content or special characters. The information content element itself—whether a `sensor_calibration_record`, `observatory_metadata`, `event_stream_format`, or `model_feature_catalog`—is the semantic unit being described, and its encoding and label are metadata properties that govern how it is consumed and displayed.

Tags provide a lightweight, flexible classification mechanism that operates orthogonally to the formal identifier and encoding schema. A tag such as `verified` signals that a record has undergone review or validation, while `pii` marks content subject to privacy regulations, and `internal` restricts distribution scope. These tags are applied at the artifact level and can be queried independently of the artifact's structural properties, enabling policy enforcement and filtering without altering the underlying data model. The same tag may appear across disparate artifact types, creating a cross-cutting classification layer that is both simple and powerful.

**t_artifact_subclass_two_parents**

| id | artifact | artifact_2 | identifier | tags |
| --- | --- | --- | --- | --- |
| PARE-0001 | streaming-window-5min | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0002 | streaming-window-5min | metadata-registry-sync | oid:1.3.6.1 | pii |
| PARE-0003 | telemetry-aggregate-q3 | encryption-key-rotation | ref-8842 | verified |
| PARE-0004 | model-checkpoint-epoch12 | master-schema-v1 | urn:uuid:9f2a | internal |
| PARE-0005 | telemetry-aggregate-q3 | master-schema-v1 | oid:1.3.6.1 | public |
| PARE-0006 | model-checkpoint-epoch12 | ingestion-script-v2 | doi:10.1109/x | verified |
| PARE-0007 | index-rebuild-prod | validation-ruleset-strict | urn:uuid:9f2a | verified |

**t_ice_subclass_with_part**

| id | ice | encoding | label_text |
| --- | --- | --- | --- |
| PART-0001 | sensor_calibration_record | ascii | intake form |
| PART-0002 | observatory_metadata | unicode | pre-release note |
| PART-0003 | event_stream_format | unicode | calibration record |
| PART-0004 | model_feature_catalog | ascii | nightly summary |
| PART-0005 | compliance_audit_report | utf8 | pre-release note |
| PART-0006 | customer_transaction_log | latin1 | audit excerpt |

Subject, target, and role form the relational backbone that connects discrete entities into a coherent graph of dependencies and responsibilities. In the belief interval framework, a belief such as `Sensor calibration drift` or `Model convergence state` is linked to a lower bound—expressed as `0.85 probability`, `Three sigma limit`, `ISO ninety eight`, or `95 percent threshold`—through a relationship record that specifies the role of each participant. The subject (the `belief_id`) and the target (the `belief_lower_bound_id`) are foreign keys pointing to their respective tables, while the role column—taking values like `contributor` or `owner`—describes the nature of the association. This ternary relationship pattern allows the same belief to be associated with multiple bounds under different roles, and the same bound to serve multiple beliefs, creating a flexible and expressive dependency model.

**t_belief_interval_subclass**

| id | belief |
| --- | --- |
| INTE-0001 | Sensor calibration drift |
| INTE-0002 | Model convergence state |
| INTE-0003 | Model convergence state |
| INTE-0004 | Sensor calibration drift |
| INTE-0005 | Data ingestion rate |
| INTE-0006 | Reagent shelf life |

**t_belief_interval_subclass_belief_lower_bound**

| id | belief_lower_bound |
| --- | --- |
| INTE-0001 | 0.85 probability |
| INTE-0002 | Three sigma limit |
| INTE-0003 | ISO ninety eight |
| INTE-0004 | 95 percent threshold |
| INTE-0005 | 99.9 percent uptime |
| INTE-0006 | 0.85 probability |
| INTE-0007 | 128 megabytes |
| INTE-0008 | 256 units |

**t_belief_interval_subclass__belief_lower_bound**

| id | belief_id | belief_lower_bound_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0008 | contributor |
| INTE-0002 | INTE-0005 | INTE-0006 | owner |
| INTE-0003 | INTE-0001 | INTE-0002 | contributor |
| INTE-0004 | INTE-0002 | INTE-0008 | owner |
| INTE-0005 | INTE-0006 | INTE-0001 | contributor |
| INTE-0006 | INTE-0002 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0001 | INTE-0006 | owner |
| INTE-0008 | INTE-0005 | INTE-0007 | contributor |