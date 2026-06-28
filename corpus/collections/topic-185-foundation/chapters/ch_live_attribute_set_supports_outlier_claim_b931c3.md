---
chapter_id: ch_live_attribute_set_supports_outlier_claim_b931c3
topic_id: 185
family: 02_observation_measurement
cited_terms: ['attribute_set_supports_outlier_claim', 'attrkey_subclass', 'attrkey_with_value_type']
model: engine-refine
---

In data governance frameworks, the integrity of attribute definitions rests on a layered architecture of identifiers, formats, and cryptographic checksums that together ensure traceability from raw telemetry to auditable records. Each attribute key—whether `lot_number`, `batch_id`, `operator_code`, or `voltage_read`—is anchored by a unique identifier such as `ATTR-0001` through `ATTR-0004`, and classified within a namespace that delineates its operational domain: `governance` for production and compliance metadata, `telemetry` for equipment and sensor readings. The format specification further constrains how values are serialized and exchanged; a `lot_number` may conform to `CSV` encoding, while `batch_id` and `operator_code` are expressed as `UUID`s, and `voltage_read` adheres to the `E.164` international telephone numbering format, a deliberate choice reflecting the structured nature of equipment calibration identifiers. This triad of namespace, format, and identifier establishes a deterministic vocabulary that prevents ambiguity across heterogeneous systems.

**t_attrkey_subclass**

| id | attrkey | describes_property | format | namespace |
| --- | --- | --- | --- | --- |
| ATTR-0001 | lot_number | ambient_temperature | CSV | governance |
| ATTR-0002 | batch_id | ambient_temperature | UUID | governance |
| ATTR-0003 | operator_code | production_batch | UUID | telemetry |
| ATTR-0004 | voltage_read | equipment_calibration | E.164 | telemetry |
| ATTR-0005 | flow_rate | equipment_calibration | E.164 | governance |
| ATTR-0006 | lot_number | data_integrity_status | CSV | governance |
| ATTR-0007 | ambient_temp | electrical_voltage | JSON | catalog |

**t_attrkey_with_value_type**

| id | attrkey | value_type | checksum_algo | code |
| --- | --- | --- | --- | --- |
| TYPE-0001 | config_hash | datetime_utc | md5 | C-07 |
| TYPE-0002 | data_quality_flag | url_string | sha256 | A-01 |
| TYPE-0003 | event_type | temperature_c | sha256 | A-01 |
| TYPE-0004 | timestamp_utc | binary_blob | md5 | E-21 |
| TYPE-0005 | batch_number | datetime_utc | md5 | E-21 |
| TYPE-0006 | timestamp_utc | decimal_number | sha1 | E-21 |
| TYPE-0007 | device_mac | json_object | md5 | C-07 |
| TYPE-0008 | firmware_version | json_object | blake2b | B-12 |

Checksum algorithms provide the cryptographic backbone for value integrity, particularly where attribute keys carry sensitive or compliance-critical data. The `config_hash` attribute, for instance, employs `md5` as its checksum algorithm, suitable for non-security-critical hash verification, while `data_quality_flag` and `event_type` leverage `sha256`, offering stronger collision resistance appropriate for binary blobs and temperature readings that must withstand adversarial tampering. The `timestamp_utc` field reverts to `md5`, reflecting a pragmatic trade-off where temporal precision matters more than cryptographic strength. Each of these attributes is further classified by a value type—`datetime_utc`, `url_string`, `temperature_c`, or `binary_blob`—and tagged with a classification code such as `C-07`, `A-01`, or `E-21`, which maps to internal categorization schemes for audit routing and retention policy assignment.

The relationship between outlier claims and their supporting infrastructure is mediated through a junction structure that captures not merely connectivity but the nature of that connection. An outlier claim identified as `CLAI-0001` may designate `source system ID` as its governing attribute, while `CLAI-0005` references `sensor calibration`—each claim supported by one or more systems including the `API gateway`, `PostgreSQL instance`, and `Ontology registry`. The role column disambiguates the capacity in which each support system participates: `contributor` indicates a system that supplies data or validation logic without asserting ownership, whereas `owner` denotes the system with authoritative control over the claim's lifecycle. For example, `CLAI-0003` designates the `Ontology registry` as `owner`, while `CLAI-0001` and `CLAI-0002` assign `contributor` roles to the `API gateway` and `PostgreSQL instance` respectively, establishing a clear hierarchy of responsibility.

**t_attribute_set_supports_outlier_claim**

| id | attribute |
| --- | --- |
| CLAI-0001 | source system ID |
| CLAI-0002 | validation rule |
| CLAI-0003 | geolocation accuracy |
| CLAI-0004 | sensor calibration |
| CLAI-0005 | source system ID |
| CLAI-0006 | validation rule |

**t_attribute_set_supports_outlier_claim_supports**

| id | supports |
| --- | --- |
| CLAI-0001 | API gateway |
| CLAI-0002 | PostgreSQL instance |
| CLAI-0003 | Ontology registry |
| CLAI-0004 | Ontology registry |
| CLAI-0005 | Storage volume |
| CLAI-0006 | Storage volume |

Subject and target identifiers in the relationship table formalize the directional semantics of support: the subject column (`attribute_id`) points to the attribute under scrutiny, while the target column (`supports_id`) identifies the infrastructure component providing evidence. This distinction is critical when a single attribute draws support from multiple systems—`CLAI-0005` appears as a subject in two separate relationship rows, each linking to a different support target (`CLAI-0002` and `CLAI-0005`), thereby capturing the multiplicity of evidence sources without conflating their roles. The identifier column in this junction table (`CLAI-0001` through `CLAI-0004`) serves as the primary key for each relationship instance, ensuring that the same subject-target pair can be distinguished by their associated role and contextual metadata.

**t_attribute_set_supports_outlier_claim__supports**

| id | attribute_id | supports_id | role |
| --- | --- | --- | --- |
| CLAI-0001 | CLAI-0001 | CLAI-0001 | contributor |
| CLAI-0002 | CLAI-0005 | CLAI-0002 | contributor |
| CLAI-0003 | CLAI-0003 | CLAI-0005 | owner |
| CLAI-0004 | CLAI-0005 | CLAI-0005 | contributor |
| CLAI-0005 | CLAI-0006 | CLAI-0001 | owner |
| CLAI-0006 | CLAI-0004 | CLAI-0002 | contributor |
| CLAI-0007 | CLAI-0001 | CLAI-0004 | reviewer |
| CLAI-0008 | CLAI-0001 | CLAI-0002 | contributor |

Together, these constructs—checksum algorithms, format specifications, namespace classifications, role designations, and the subject-target relationship model—form a self-describing data fabric. They enable any downstream consumer, whether an automated compliance engine or a human auditor, to reconstruct the provenance of a claim, verify the integrity of its supporting attributes, and trace each value back to its originating system through a chain of identifiers that are both machine-parseable and human interpretable. The classification codes (`A-01`, `C-07`, `E-21`) and namespace boundaries (`governance`, `telemetry`) further ensure that this fabric scales across organizational silos without requiring centralized coordination.