---
chapter_id: ch_live_attribute_set_max_attrs_279c18
topic_id: 7
family: 02_observation_measurement
cited_terms: ['attribute_set_max_attrs', 'identifier_unique', 'artifact_with_existential']
model: engine-refine
---

The management of attribute metadata and their associated values constitutes a foundational concern in systems that must track heterogeneous data types across distributed entities. Physical measurements such as `voltage_dc`, `flow_rate_lpm`, `humidity_percent`, and `particulate_um` are not stored as monolithic records but are decomposed into typed attribute definitions—each attribute carrying a precise schema annotation like `xsd:decimal`, `xsd:string`, or `xsd:dateTime`—and then materialized as discrete value rows. This separation of attribute definition from value storage enables a single entity, identified by a handle such as `ATTR-0001`, to carry an arbitrary set of properties without schema rigidity: the same entity may hold a decimal reading of `0.687` alongside a categorical label like `Dimension Kind 01` and a timestamp of `2024-07-05T18:39:47`, each drawn from its appropriate typed value table. The `attr` column in the value tables serves as the foreign key binding each measurement back to its definition, while `entity_id` anchors the observation to the subject of measurement, and the `value` column—labeled `misc` in the schema to reflect its polymorphic nature—carries the actual datum in its native representation.

**t_attribute_set_max_attrs_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0004 | 2024-07-05T18:39:47 |
| ATTR-0002 | ATTR-0002 | ATTR-0004 | 2024-04-21T13:05:05 |
| ATTR-0003 | ATTR-0003 | ATTR-0004 | 2023-05-25T09:01:45 |
| ATTR-0004 | ATTR-0004 | ATTR-0004 | 2025-03-29T09:43:13 |
| ATTR-0005 | ATTR-0005 | ATTR-0004 | 2024-03-07T20:41:06 |
| ATTR-0006 | ATTR-0006 | ATTR-0004 | 2024-01-09T06:52:17 |

**t_attribute_set_max_attrs_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0001 | 0.687 |
| ATTR-0002 | ATTR-0001 | ATTR-0005 | 125.69 |
| ATTR-0003 | ATTR-0001 | ATTR-0007 | 391.05 |
| ATTR-0004 | ATTR-0002 | ATTR-0001 | 0.041 |
| ATTR-0005 | ATTR-0002 | ATTR-0005 | 165.49 |
| ATTR-0006 | ATTR-0002 | ATTR-0007 | 169.37 |
| ATTR-0007 | ATTR-0003 | ATTR-0001 | 0.232 |
| ATTR-0008 | ATTR-0003 | ATTR-0005 | 309.64 |

Identifier resolution and provenance integrity operate through a parallel mechanism, where each `identifier` is not merely a string but a structured reference that names a target resource, declares the algorithm by which its authenticity can be verified, and records the language context in which it was assigned. A DOI such as `10.1038/s41586-023-06123` identifies the FDA 510(k) Database and is protected by an `md5` checksum in `ja` language context, whereas the same W3C-DOI prefix `W3C-DOI:10.1002/anie.202112345` appears in two distinct records—one pointing to the OSMnx Graph Library with `sha1` integrity in `en`, the other to the CERN Telemetry Stream with `blake2b` protection in `es`. The `checksum_algo` column thus functions as a policy declaration: it tells any consumer which cryptographic primitive to apply when validating the identifier's binding to its target, and the `language` column signals the linguistic register of the associated metadata, a detail that matters for multilingual registries and cross-border data exchanges.

The artifact-with-existential model extends this pattern from abstract identifiers to concrete system components, where an artifact such as `edge-gateway` or `provenance-cert` is understood to exist in relation to other artifacts—`environmental-monitor`, `network-traffic-capture`, `backup-storage-array`—forming a dependency graph that captures the topology of a deployed system. Each artifact carries its own attribute set, defined with types like `cco:DesignativeICE` for identifiers and `xsd:date` for creation timestamps, and populated with values ranging from the checksum hash `5e8f3c91` to the URN `urn:uuid:9f2a` and the deployment location `on-prem-dc1`. The existential relationship is itself typed: the `related` column encodes the nature of the dependency, and the `artifact` column names the subject, creating a directed edge that can be traversed to reconstruct the provenance chain of any component.

**t_attribute_set_max_attrs**

| id | attribute |
| --- | --- |
| ATTR-0001 | voltage_dc |
| ATTR-0002 | flow_rate_lpm |
| ATTR-0003 | humidity_percent |
| ATTR-0004 | particulate_um |
| ATTR-0005 | particulate_um |
| ATTR-0006 | humidity_percent |

**t_attribute_set_max_attrs_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTR-0001 | confidence | xsd:decimal |
| ATTR-0002 | dimension_kind | xsd:string |
| ATTR-0003 | method | xsd:string |
| ATTR-0004 | recorded_at | xsd:dateTime |
| ATTR-0005 | uncertainty | xsd:decimal |
| ATTR-0006 | unit | xsd:string |
| ATTR-0007 | value | xsd:decimal |
| ATTR-0008 | encoding | xsd:string |

**t_artifact_with_existential**

| id | artifact | related |
| --- | --- | --- |
| EXIS-0001 | provenance-cert | backup-storage-array |
| EXIS-0002 | edge-gateway | environmental-monitor |
| EXIS-0003 | edge-gateway | network-traffic-capture |
| EXIS-0004 | audit-log-2023 | field-site-alpha |
| EXIS-0005 | edge-gateway | ingestion-pipeline |
| EXIS-0006 | audit-log-2023 | data-retention-policy |

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

Taken together, these structures implement a unified approach to metadata management in which `attr` definitions, `identifier` bindings, and `entity` relationships are all expressed through the same relational primitives: a key, a foreign key, a typed value, and a semantic label. The `checksumalgo` field ensures that identifier-to-target mappings are tamper-evident, the `language` field ensures that multilingual registries remain disambiguated, and the `misc` value columns ensure that heterogeneous data—whether a floating-point sensor reading, an ISO 8601 timestamp, or a free-text audit excerpt—can be stored without schema migration. This design is not merely a matter of normalization; it is a governance mechanism. By making every attribute, every identifier, and every relationship an explicit, queryable row, the system provides the auditability that compliance frameworks demand and the flexibility that distributed telemetry systems require.

**t_attribute_set_max_attrs_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0001 | ATTR-0002 | Dimension Kind 01 |
| ATTR-0002 | ATTR-0001 | ATTR-0008 | Encoding 02 |
| ATTR-0003 | ATTR-0001 | ATTR-0009 | audit excerpt |
| ATTR-0004 | ATTR-0001 | ATTR-0010 | de |
| ATTR-0005 | ATTR-0001 | ATTR-0003 | hybrid |
| ATTR-0006 | ATTR-0001 | ATTR-0006 | kg |
| ATTR-0007 | ATTR-0002 | ATTR-0002 | Dimension Kind 07 |
| ATTR-0008 | ATTR-0002 | ATTR-0008 | Encoding 08 |

**t_identifier_unique**

| id | identifier | identifies | checksum_algo | language |
| --- | --- | --- | --- | --- |
| UNIQ-0001 | 10.1038/s41586-023-06123 | FDA 510(k) Database | md5 | ja |
| UNIQ-0002 | W3C-DOI:10.1002/anie.202112345 | OSMnx Graph Library | sha1 | en |
| UNIQ-0003 | PDB-7XYZ-A | RefSeq Genome Assembly | md5 | ja |
| UNIQ-0004 | W3C-DOI:10.1002/anie.202112345 | CERN Telemetry Stream | blake2b | es |
| UNIQ-0005 | PDB-7XYZ-A | RefSeq Genome Assembly | blake2b | de |
| UNIQ-0006 | ORCID-0000-0002-1825-0097 | CERN Telemetry Stream | md5 | es |
| UNIQ-0007 | W3C-DOI:10.1002/anie.202112345 | WHO ICD-11 Code | blake2b | fr |
| UNIQ-0008 | SNOMED-123456008 | CERN Telemetry Stream | blake2b | ja |