---
chapter_id: ch_live_column_version_subclass_20efab
topic_id: 62
family: 07_long_tail
cited_terms: ['column_version_subclass', 'verification_targets_artifact', 'policy_constrains_only_artifact']
model: engine-refine
---

In a rigorous governance framework, the integrity of an operational dataset begins with the precise instantiation of an *entity* through a unique *identifier*, which anchors a versioned schema to specific data columns. For instance, the identifier `VERS-0001` serves as the primary key for an entity representing a `timestamp_utc` column under the versioning scheme `ARTI-0005`, while `VERS-0004` similarly binds a `humidity_pct` column to version `ARTI-0004`. Once the entity is established, its semantic properties are formalized through *attributes* and their corresponding *attr type* definitions. The attribute `confidence` is strictly typed as `xsd:decimal`, ensuring numerical precision, whereas the attribute `dimension_kind` is constrained to `xsd:string`, and temporal metadata such as `recorded_at` is enforced as `xsd:dateTime`. This structural typing guarantees that every attribute—whether it be `method` or `confidence`—adheres to a predictable data contract before any values are committed.

**t_column_version_subclass**

| id | column | column_version |
| --- | --- | --- |
| VERS-0001 | timestamp_utc | ARTI-0005 |
| VERS-0002 | operator_code | ARTI-0002 |
| VERS-0003 | timestamp_utc | ARTI-0006 |
| VERS-0004 | humidity_pct | ARTI-0004 |
| VERS-0005 | sample_volume_ml | ARTI-0001 |
| VERS-0006 | ph_level | ARTI-0005 |

**t_column_version_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| VERS-0001 | confidence | xsd:decimal |
| VERS-0002 | dimension_kind | xsd:string |
| VERS-0003 | method | xsd:string |
| VERS-0004 | recorded_at | xsd:dateTime |
| VERS-0005 | uncertainty | xsd:decimal |
| VERS-0006 | unit | xsd:string |
| VERS-0007 | value | xsd:decimal |
| VERS-0008 | encoding | xsd:string |

**t_column_version_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0004 | 2024-04-09T04:38:55 |
| VERS-0002 | VERS-0002 | VERS-0004 | 2024-01-02T00:15:06 |
| VERS-0003 | VERS-0003 | VERS-0004 | 2023-01-13T23:21:50 |
| VERS-0004 | VERS-0004 | VERS-0004 | 2023-03-07T00:33:45 |
| VERS-0005 | VERS-0005 | VERS-0004 | 2023-12-29T06:33:45 |
| VERS-0006 | VERS-0006 | VERS-0004 | 2023-10-05T00:14:22 |

**t_column_version_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0001 | 0.648 |
| VERS-0002 | VERS-0001 | VERS-0005 | 428.43 |
| VERS-0003 | VERS-0001 | VERS-0007 | 933.19 |
| VERS-0004 | VERS-0002 | VERS-0001 | 0.532 |
| VERS-0005 | VERS-0002 | VERS-0005 | 783.47 |
| VERS-0006 | VERS-0002 | VERS-0007 | 645.78 |
| VERS-0007 | VERS-0003 | VERS-0001 | 0.438 |
| VERS-0008 | VERS-0003 | VERS-0005 | 787.07 |

**t_column_version_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| VERS-0001 | VERS-0001 | VERS-0002 | Dimension Kind 01 |
| VERS-0002 | VERS-0001 | VERS-0008 | Encoding 02 |
| VERS-0003 | VERS-0001 | VERS-0009 | intake form |
| VERS-0004 | VERS-0001 | VERS-0010 | de |
| VERS-0005 | VERS-0001 | VERS-0003 | hybrid |
| VERS-0006 | VERS-0001 | VERS-0006 | ms |
| VERS-0007 | VERS-0002 | VERS-0002 | Dimension Kind 07 |
| VERS-0008 | VERS-0002 | VERS-0008 | Encoding 08 |

The actual payload of these governed entities is stored as discrete *misc* values, which are assigned to specific attributes within a given entity context. An entity such as `VERS-0001` may simultaneously hold a decimal value of `0.648` against attribute `VERS-0001`, a string value of `Dimension Kind 01` against attribute `VERS-0002`, and a temporal value of `2024-04-09T04:38:55` against attribute `VERS-0004`. Similarly, entity `VERS-0002` captures a decimal reading of `428.43` and a recorded timestamp of `2024-01-02T00:15:06`. These heterogeneous values—ranging from `Encoding 02` to `intake form`—demonstrate how a single entity can aggregate diverse data points, provided they are correctly mapped to their respective attribute identifiers, thereby preserving the semantic fidelity of the underlying dataset.

Beyond data structuring, the framework imposes *policy* constraints to regulate access and operational behavior across defined organizational boundaries. Policies such as `CCPA` and `SOX` are applied with varying degrees of *enforcement* rigor, ranging from `mandatory` compliance to strict `blocking` mechanisms that prevent non-conforming actions. The applicability of these policies is delineated by their *scope*, which may be restricted to a specific `team` or `local` environment, or extended to a `global` organizational level. For example, a `SOX` policy might be enforced as `mandatory` within a `local` scope, while another `SOX` constraint operates under `mandatory` enforcement at a `global` scale, ensuring that regulatory requirements are uniformly applied regardless of the deployment tier.

**t_policy_constrains_only_artifact**

| id | policy | enforcement | scope |
| --- | --- | --- | --- |
| ARTI-0001 | CCPA | mandatory | team |
| ARTI-0002 | SOX | blocking | global |
| ARTI-0003 | SOX | mandatory | local |
| ARTI-0004 | CCPA | mandatory | global |
| ARTI-0005 | Basel-III | deprecated | team |
| ARTI-0006 | NIST-800-53 | deprecated | regional |
| ARTI-0007 | NIST-800-53 | advisory | regional |

The operational execution of these policies relies on a structured verification workflow that links a *subject*—such as a `Compliance review cycle` or a `Data lineage audit`—to a specific *target* artifact, such as a `Sensor calibration matrix` or a `Source code branch`. This relationship is mediated by a defined *role*, which assigns accountability to the participants in the verification process. A subject identified as `ARTI-0002` may target artifact `ARTI-0003` with the *role* of `owner`, while another verification subject targets the same artifact under the *role* of `reviewer`. By explicitly mapping subjects to targets through roles like `contributor` or `reviewer`, the system ensures that every compliance check, from `ARTI-0001` to `ARTI-0005`, is executed by the appropriate personnel against the correct operational artifacts.

**t_verification_targets_artifact**

| id | verification |
| --- | --- |
| ARTI-0001 | Compliance review cycle |
| ARTI-0002 | Compliance review cycle |
| ARTI-0003 | Data lineage audit |
| ARTI-0004 | Compliance review cycle |
| ARTI-0005 | Test suite execution |
| ARTI-0006 | Governance policy scan |

**t_verification_targets_artifact_targets_artifact**

| id | targets_artifact |
| --- | --- |
| ARTI-0001 | Sensor calibration matrix |
| ARTI-0002 | Source code branch |
| ARTI-0003 | Sensor calibration matrix |
| ARTI-0004 | Sensor calibration matrix |
| ARTI-0005 | Ingestion manifest |
| ARTI-0006 | Ingestion manifest |

**t_verification_targets_artifact__targets_artifact**

| id | verification_id | targets_artifact_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0002 | ARTI-0002 | reviewer |
| ARTI-0002 | ARTI-0004 | ARTI-0003 | owner |
| ARTI-0003 | ARTI-0005 | ARTI-0001 | reviewer |
| ARTI-0004 | ARTI-0005 | ARTI-0001 | contributor |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | reviewer |
| ARTI-0006 | ARTI-0005 | ARTI-0006 | owner |
| ARTI-0007 | ARTI-0006 | ARTI-0004 | owner |
| ARTI-0008 | ARTI-0006 | ARTI-0002 | reviewer |