---
chapter_id: ch_live_artifact_max_one_owner_c5969e
topic_id: 186
family: 07_long_tail
cited_terms: ['artifact_max_one_owner', 'artifact_min_one_id', 'artifact_min_one_owner']
model: engine-refine
---

Artifact governance in data-intensive environments rests on a structured metadata model that binds each software or data artifact to its responsible party, its technical attributes, and its compliance posture. An artifact such as `telemetry-archive-2023` or `etl-transform-stable` is assigned a single owner through the `t_artifact_max_one_owner` table, which records the owner group—`analytics-division`, `cloud-infrastructure`, or `platform-engineering`—alongside a unique identifier like `OWNE-0001`. This one-to-one ownership constraint ensures clear accountability: every artifact maps to exactly one owning team, and that ownership is itself a first-class entity with its own label and category in the `dim_owner` dimension table, where entries such as `Owner Label 01` and `Owner Category 01` provide human-readable classification for reporting and access control.

**t_artifact_max_one_owner**

| id | artifact | owner |
| --- | --- | --- |
| OWNE-0001 | telemetry-archive-2023 | analytics-division |
| OWNE-0002 | etl-transform-stable | cloud-infrastructure |
| OWNE-0003 | etl-transform-stable | platform-engineering |
| OWNE-0004 | ml-inference-v2.1 | cloud-infrastructure |
| OWNE-0005 | ml-inference-v2.1 | backend-architecture |
| OWNE-0006 | etl-transform-stable | ml-ops-team |

**t_artifact_max_one_owner_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0006 | 427 |
| OWNE-0002 | OWNE-0001 | OWNE-0008 | 2 |
| OWNE-0003 | OWNE-0002 | OWNE-0006 | 401 |
| OWNE-0004 | OWNE-0002 | OWNE-0008 | 12 |
| OWNE-0005 | OWNE-0003 | OWNE-0006 | 38 |
| OWNE-0006 | OWNE-0003 | OWNE-0008 | 7 |
| OWNE-0007 | OWNE-0004 | OWNE-0006 | 393 |
| OWNE-0008 | OWNE-0004 | OWNE-0008 | 7 |

**dim_owner**

| id | owner_label | owner_category |
| --- | --- | --- |
| OWNE-0001 | Owner Label 01 | Owner Category 01 |
| OWNE-0002 | Owner Label 02 | Owner Category 02 |
| OWNE-0003 | Owner Label 03 | Owner Category 03 |
| OWNE-0004 | Owner Label 04 | Owner Category 04 |
| OWNE-0005 | Owner Label 05 | Owner Category 05 |
| OWNE-0006 | Owner Label 06 | Owner Category 06 |

The attribute system decouples what an artifact *is* from how its properties are stored. The `t_artifact_max_one_owner_attr` table defines the schema of permissible attributes—each with a name like `checksum`, `created_date`, `identifier`, or `license` and a typed definition such as `xsd:string`, `xsd:date`, or `cco:DesignativeICE`. Values for these attributes are materialized in separate typed value tables, a design that avoids null columns and enforces type safety at query time. A checksum value like `c0ffee42` is stored in `t_artifact_max_one_owner_val_varchar`, a creation date such as `2023-04-04` in `t_artifact_max_one_owner_val_date`, and a numeric property like `427` in `t_artifact_max_one_owner_val_int`. Each value row references both the entity (the owning record) and the attribute definition, creating a normalized entity-attribute-value structure that scales to hundreds of attribute types without schema migration.

**t_artifact_max_one_owner_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OWNE-0001 | checksum | xsd:string |
| OWNE-0002 | created_date | xsd:date |
| OWNE-0003 | identifier | cco:DesignativeICE |
| OWNE-0004 | license | xsd:string |
| OWNE-0005 | mime_type | xsd:string |
| OWNE-0006 | size_bytes | xsd:long |
| OWNE-0007 | uri | xsd:string |
| OWNE-0008 | version | xsd:integer |

**t_artifact_max_one_owner_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0002 | 2023-04-04 |
| OWNE-0002 | OWNE-0002 | OWNE-0002 | 2025-04-14 |
| OWNE-0003 | OWNE-0003 | OWNE-0002 | 2024-04-27 |
| OWNE-0004 | OWNE-0004 | OWNE-0002 | 2025-03-27 |
| OWNE-0005 | OWNE-0005 | OWNE-0002 | 2025-06-10 |
| OWNE-0006 | OWNE-0006 | OWNE-0002 | 2023-03-24 |

**t_artifact_max_one_owner_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0001 | OWNE-0001 | c0ffee42 |
| OWNE-0002 | OWNE-0001 | OWNE-0003 | ARN:res/41 |
| OWNE-0003 | OWNE-0001 | OWNE-0004 | MIT |
| OWNE-0004 | OWNE-0001 | OWNE-0009 | rack-7 |
| OWNE-0005 | OWNE-0001 | OWNE-0005 | application/octet-stream |
| OWNE-0006 | OWNE-0001 | OWNE-0010 | Name 06 |
| OWNE-0007 | OWNE-0001 | OWNE-0011 | sre |
| OWNE-0008 | OWNE-0001 | OWNE-0012 | Tags 08 |

**t_artifact_min_one_id**

| id | artifact | license | location |
| --- | --- | --- | --- |
| ONE-0001 | sensor-log-2023-10 | CC-BY-4.0 | us-east-1 |
| ONE-0002 | manifest-v1 | proprietary | eu-west-3 |
| ONE-0003 | manifest-v1 | CC-BY-4.0 | rack-7 |
| ONE-0004 | manifest-v1 | MIT | ap-south-2 |

Licensing and location metadata form the compliance backbone of the model. The `t_artifact_min_one_id` table captures open-source and proprietary license designations—`CC-BY-4.0`, `MIT`, and `proprietary`—alongside geographic or infrastructural placement such as `us-east-1`, `eu-west-3`, `rack-7`, and `ap-south-2`. This separation of license and location from the owner-centric attribute model reflects a practical distinction: licensing is a fixed, artifact-level property that does not vary by owner, whereas attributes like checksums and creation dates are owner-specific metadata that may be updated independently. An artifact like `manifest-v1` might carry a `proprietary` license in `eu-west-3` while being owned by `platform-engineering`, and the model supports all such combinations without constraint.

At the analytical layer, the `fact_artifact` table aggregates operational metrics—`size_bytes` and `version`—into a star schema with `dim_owner` as the primary dimension. A record with identifier `OWNE-0001` might show an artifact of `123155790` bytes at version `6`, owned by the entity referenced as `OWNE-0003`. This fact table enables capacity planning, version distribution analysis, and ownership-based rollups across the portfolio. The `owner_key` column in the fact table links back to the ownership entity, allowing the same owner to be associated with multiple artifacts of varying sizes and versions, while the dimension table provides the stable label and category for each owner group. Together, the fact and dimension tables support OLAP queries on artifact size distributions by owner category or version trends across the organization.

**fact_artifact**

| id | owner_key | size_bytes | version |
| --- | --- | --- | --- |
| OWNE-0001 | OWNE-0003 | 123155790 | 6 |
| OWNE-0002 | OWNE-0003 | 42978804 | 5 |
| OWNE-0003 | OWNE-0003 | 996080316 | 5 |
| OWNE-0004 | OWNE-0005 | 597369362 | 10 |
| OWNE-0005 | OWNE-0006 | 12061913 | 9 |
| OWNE-0006 | OWNE-0004 | 792675668 | 5 |