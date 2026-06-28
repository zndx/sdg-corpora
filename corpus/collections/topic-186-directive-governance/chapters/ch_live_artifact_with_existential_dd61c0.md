---
chapter_id: ch_live_artifact_with_existential_dd61c0
topic_id: 186
family: 01_foundation
cited_terms: ['artifact_with_existential', 'transformation_starts_at', 'flood_defence_condition_characterisation']
model: engine-refine
---

In a robust governance framework, every operational asset must be anchored by a unique `identifier` to establish its existential baseline. For instance, critical infrastructure components such as an `edge-gateway` or a `provenance-cert` are assigned distinct identifiers (e.g., `EXIS-0002`, `EXIS-0001`) to ensure unambiguous tracking. These identifiers do not merely label isolated objects; they map the `entity`'s relational topology by documenting its dependencies. An `edge-gateway` might be linked to an `environmental-monitor`, while a `provenance-cert` is tied to a `backup-storage-array`, creating a verifiable chain of custody and dependency that is essential for system integrity.

**t_artifact_with_existential**

| id | artifact | related |
| --- | --- | --- |
| EXIS-0001 | provenance-cert | backup-storage-array |
| EXIS-0002 | edge-gateway | environmental-monitor |
| EXIS-0003 | edge-gateway | network-traffic-capture |
| EXIS-0004 | audit-log-2023 | field-site-alpha |
| EXIS-0005 | edge-gateway | ingestion-pipeline |
| EXIS-0006 | audit-log-2023 | data-retention-policy |

**t_transformation_starts_at**

| id | transformation |
| --- | --- |
| STAR-0001 | schema migration step |
| STAR-0002 | calibration procedure |
| STAR-0003 | schema migration step |
| STAR-0004 | telemetry sync process |
| STAR-0005 | telemetry sync process |
| STAR-0006 | ETL pipeline run |

The semantic definition of an `entity` is further refined through its associated `attr`ibutes, which are strictly governed by their respective `attr_type`s to maintain data fidelity. Whether an attribute is defined as an `xsd:string`, an `xsd:date`, or a specialized `cco:DesignativeICE`, the system enforces type safety when recording values. These attribute values—categorized broadly as `misc`ellaneous data—span diverse formats, from cryptographic hashes like `5e8f3c91` and URNs such as `urn:uuid:9f2a`, to precise temporal markers like `2024-03-17` or integer metrics like `401`. By decoupling the attribute definition from its concrete value, the framework allows an `entity` to accumulate a rich, type-safe profile without compromising the structural rigidity of the underlying schema.

**t_artifact_with_existential_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EXIS-0001 | checksum | xsd:string |
| EXIS-0002 | created_date | xsd:date |
| EXIS-0003 | identifier | cco:DesignativeICE |
| EXIS-0004 | license | xsd:string |
| EXIS-0005 | mime_type | xsd:string |
| EXIS-0006 | size_bytes | xsd:long |
| EXIS-0007 | uri | xsd:string |
| EXIS-0008 | version | xsd:integer |

**t_artifact_with_existential_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0002 | 2024-03-17 |
| EXIS-0002 | EXIS-0002 | EXIS-0002 | 2024-10-14 |
| EXIS-0003 | EXIS-0003 | EXIS-0002 | 2023-12-18 |
| EXIS-0004 | EXIS-0004 | EXIS-0002 | 2023-02-05 |
| EXIS-0005 | EXIS-0005 | EXIS-0002 | 2024-03-19 |
| EXIS-0006 | EXIS-0006 | EXIS-0002 | 2025-01-11 |

**t_artifact_with_existential_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0006 | 401 |
| EXIS-0002 | EXIS-0001 | EXIS-0008 | 10 |
| EXIS-0003 | EXIS-0002 | EXIS-0006 | 361 |
| EXIS-0004 | EXIS-0002 | EXIS-0008 | 7 |
| EXIS-0005 | EXIS-0003 | EXIS-0006 | 386 |
| EXIS-0006 | EXIS-0003 | EXIS-0008 | 10 |
| EXIS-0007 | EXIS-0004 | EXIS-0006 | 351 |
| EXIS-0008 | EXIS-0004 | EXIS-0008 | 8 |

**t_artifact_with_existential_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EXIS-0001 | EXIS-0001 | EXIS-0001 | 5e8f3c91 |
| EXIS-0002 | EXIS-0001 | EXIS-0003 | urn:uuid:9f2a |
| EXIS-0003 | EXIS-0001 | EXIS-0004 | proprietary |
| EXIS-0004 | EXIS-0001 | EXIS-0009 | on-prem-dc1 |
| EXIS-0005 | EXIS-0001 | EXIS-0005 | application/json |
| EXIS-0006 | EXIS-0001 | EXIS-0010 | Name 06 |
| EXIS-0007 | EXIS-0001 | EXIS-0011 | platform-team |
| EXIS-0008 | EXIS-0001 | EXIS-0012 | Tags 08 |

Operational compliance demands rigorous temporal tracking, particularly when managing complex workflows like a `schema migration step` or a `calibration procedure`. The governance model captures these events by linking a `subject`—representing the initiating process—to a `target`, which denotes the specific `started_at_time` (e.g., `2024-03-15T09:15:22Z`). Crucially, this linkage is mediated by a `role`, which assigns accountability to the participants. A single transformation event may involve multiple stakeholders simultaneously, designating one party as the `owner`, another as the `reviewer`, and additional parties as `observers`, thereby establishing a clear audit trail of responsibility for every executed action.

**t_transformation_starts_at_started_at_time**

| id | started_at_time |
| --- | --- |
| STAR-0001 | 2024-03-15T09:15:22Z |
| STAR-0002 | 2024-03-15T11:45:10Z |
| STAR-0003 | 2024-03-15T16:30:00Z |
| STAR-0004 | 2024-03-15T10:00:00Z |
| STAR-0005 | 2024-03-15T15:55:42Z |
| STAR-0006 | 2024-03-15T11:45:10Z |

**t_transformation_starts_at__started_at_time**

| id | transformation_id | started_at_time_id | role |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0006 | STAR-0005 | owner |
| STAR-0002 | STAR-0002 | STAR-0001 | reviewer |
| STAR-0003 | STAR-0002 | STAR-0005 | observer |
| STAR-0004 | STAR-0002 | STAR-0004 | observer |
| STAR-0005 | STAR-0001 | STAR-0003 | contributor |
| STAR-0006 | STAR-0001 | STAR-0006 | observer |
| STAR-0007 | STAR-0006 | STAR-0003 | reviewer |
| STAR-0008 | STAR-0002 | STAR-0005 | reviewer |

In specialized domains such as environmental monitoring, these abstract governance structures are instantiated to manage high-stakes assessments. A `flooddefenceconditioncharacterisation` serves as the primary mechanism for evaluating infrastructure resilience, relying heavily on external `earthobservationdata` sources. For example, an `ExpertReviewPanel` or a `GroundTruthSampling` initiative might ingest satellite imagery from `CopernicusDEM` or radar data from `Sentinel1GRD` to assess physical conditions. To ensure the reliability of these assessments, the framework mandates the use of a `validationprocess`. Whether employing a `HistoricalBaselineMatch` or referencing a specific event like `SeineBreach2016`, the validation process provides the evidentiary basis required to certify the accuracy of the earth observation data and the resulting condition characterizations.

**t_flood_defence_condition_characterisation**

| id | flood_defence_condition_characterisation | involves_earth_observation_data | employs_validation_process |
| --- | --- | --- | --- |
| CHAR-0001 | ExpertReviewPanel | CopernicusDEM | HistoricalBaselineMatch |
| CHAR-0002 | GroundTruthSampling | Sentinel1GRD | GroundTruthSampling |
| CHAR-0003 | CrossSensorCalibration | LiDARBathymetry | SeineBreach2016 |
| CHAR-0004 | UncertaintyPropagated | LiDARBathymetry | SeineBreach2016 |
| CHAR-0005 | VeniceTide2019 | RADARSAT2 | CrossSensorCalibration |