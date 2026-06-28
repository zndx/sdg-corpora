---
chapter_id: ch_live_agent_identified_by_uri_0f8950
topic_id: 0
family: 05_provo_lineage
cited_terms: ['agent_identified_by_uri', 'breaking_change_subclass', 'instrument_emits_signal']
model: engine-refine
---

The governance of distributed data assets rests on a disciplined separation between the identity of a resource, the properties that describe it, and the provenance that records its evolution. An identifier serves as the immutable handle by which any entity is referenced across systems—whether the reference takes the form of a resource name such as ARN:res/41, a UUID like urn:uuid:9f2a, or a bibliographic marker such as urn:isbn:978316148. These identifiers are not arbitrary; they are bound to an owner, a team or service responsible for the asset's lifecycle. The data-engineering group claims ref-8842, while the ml-infra team assumes stewardship over ARN:res/41 and urn:uuid:9f2a, establishing a clear accountability chain that survives organizational churn. An agent—be it weather-station-alpha, compliance-audit-bot, genomics-lab-director, or edge-device-gateway—acts as the originating or consuming entity, and its relationship to a resource is mediated through a uniform resource identifier that locates the asset in a storage tier or registry.

**t_instrument_emits_signal**

| id | instrument | emits_signal | size_bytes | uri |
| --- | --- | --- | --- | --- |
| SIGN-0001 | LiDAR array | Optical pulse | 193789751 | s3://lake/raw |
| SIGN-0002 | Seismometer | Ultrasonic wave | 556171171 | abfss://prod/silver |
| SIGN-0003 | Mass spectrometer | Ultrasonic wave | 279461908 | s3://lake/curated |
| SIGN-0004 | Radiometer | Heartbeat ping | 579891201 | gs://warehouse/gold |
| SIGN-0005 | Mass spectrometer | Data packet | 371526447 | abfss://prod/silver |

The uri field anchors every asset to a concrete location within the data fabric, encoding both protocol and tier in a single string. Raw telemetry from a LiDAR array flows to s3://lake/raw, silver-layer aggregations reside at abfss://prod/silver, curated datasets are served from s3://lake/curated, and gold-standard material is deposited in gs://warehouse/gold. This tiered addressing scheme is not merely cosmetic; it signals the maturity and governance posture of the data at rest. A Radiometer emitting a Heartbeat ping at 579,891,201 bytes occupies a different trust boundary than a Seismometer's Ultrasonic wave at 556,171,171 bytes, and the uri makes that distinction machine-readable. The size_bytes attribute quantifies the payload, enabling capacity planning and cost attribution at the signal level.

When a schema evolves, the system must capture not only what changed but how the change propagates through dependent consumers. A breaking change record—CHAN-0001 through CHAN-0004—encodes the nature of the disruption: Telemetry schema evolution, Provenance graph migration, OAuth2 token rotation. Each record identifies the affected consumer, whether a device telemetry collector, an inventory management API, a legacy mobile app, or a real-time event stream. The attr and attr_type columns describe the metadata properties that were altered. The confidence attribute carries an xsd:decimal type, the dimension_kind and method attributes are xsd:string, and recorded_at is typed as xsd:dateTime. This type discipline ensures that downstream validators can enforce constraints without inspecting the payload.

**t_breaking_change_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CHAN-0001 | confidence | xsd:decimal |
| CHAN-0002 | dimension_kind | xsd:string |
| CHAN-0003 | method | xsd:string |
| CHAN-0004 | recorded_at | xsd:dateTime |
| CHAN-0005 | uncertainty | xsd:decimal |
| CHAN-0006 | unit | xsd:string |
| CHAN-0007 | value | xsd:decimal |
| CHAN-0008 | encoding | xsd:string |

**t_breaking_change_subclass_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0004 | 2023-07-26T14:07:49 |
| CHAN-0002 | CHAN-0002 | CHAN-0004 | 2025-01-03T20:08:42 |
| CHAN-0003 | CHAN-0003 | CHAN-0004 | 2024-04-10T03:15:13 |
| CHAN-0004 | CHAN-0004 | CHAN-0004 | 2023-07-21T06:41:40 |
| CHAN-0005 | CHAN-0005 | CHAN-0004 | 2023-07-01T02:58:50 |
| CHAN-0006 | CHAN-0006 | CHAN-0004 | 2024-07-07T11:26:39 |
| CHAN-0007 | CHAN-0007 | CHAN-0004 | 2024-07-12T18:30:29 |
| CHAN-0008 | CHAN-0008 | CHAN-0004 | 2024-11-14T05:00:21 |

The actual values of these attributes are stored in a value-normalized layer that separates the property definition from its instantiation. A decimal attribute such as confidence may hold 0.203 or 0.645, while a string attribute like dimension_kind carries "Dimension Kind 01" or "Encoding 02". The method attribute records procedural context—"calibration record" or "en"—and the recorded_at attribute timestamps the event, as in 2023-07-26T14:07:49 or 2025-01-03T20:08:42. The entity column ties each value back to the breaking change record that triggered it, and the attr column references the attribute definition. This three-table decomposition—definition, type, and value—allows the system to evolve its schema vocabulary without rewriting historical records.

**t_breaking_change_subclass_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0001 | 0.203 |
| CHAN-0002 | CHAN-0001 | CHAN-0005 | 700.59 |
| CHAN-0003 | CHAN-0001 | CHAN-0007 | 64.61 |
| CHAN-0004 | CHAN-0002 | CHAN-0001 | 0.645 |
| CHAN-0005 | CHAN-0002 | CHAN-0005 | 584.78 |
| CHAN-0006 | CHAN-0002 | CHAN-0007 | 672.81 |
| CHAN-0007 | CHAN-0003 | CHAN-0001 | 0.769 |
| CHAN-0008 | CHAN-0003 | CHAN-0005 | 136.48 |

**t_breaking_change_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CHAN-0001 | CHAN-0001 | CHAN-0002 | Dimension Kind 01 |
| CHAN-0002 | CHAN-0001 | CHAN-0008 | Encoding 02 |
| CHAN-0003 | CHAN-0001 | CHAN-0009 | calibration record |
| CHAN-0004 | CHAN-0001 | CHAN-0010 | en |
| CHAN-0005 | CHAN-0001 | CHAN-0003 | hybrid |
| CHAN-0006 | CHAN-0001 | CHAN-0006 | deg_C |
| CHAN-0007 | CHAN-0002 | CHAN-0002 | Dimension Kind 07 |
| CHAN-0008 | CHAN-0002 | CHAN-0008 | Encoding 08 |

Ownership and identification intersect at the point of ingestion. An agent identified by a URI such as ark:/13030/n8yy3r is itself assigned an identifier and an owner, creating a chain of custody that spans from the originating sensor to the consuming application. The t_agent_identified_by_uri table materializes this chain: weather-station-alpha and compliance-audit-bot both resolve to ark:/13030/n8yy3r under the identifier ref-8842, owned by data-engineering, while genomics-lab-director and edge-device-gateway share urn:isbn:978316148 under ARN:res/41, owned by ml-infra. This structure supports audit queries that answer not only where data lives but who produced it, who claims it, and what breaking changes have touched it since ingestion.

**t_agent_identified_by_uri**

| id | agent | identified_by_u_r_i | identifier | owner |
| --- | --- | --- | --- | --- |
| URI-0001 | weather-station-alpha | ark:/13030/n8yy3r | ref-8842 | data-engineering |
| URI-0002 | compliance-audit-bot | ark:/13030/n8yy3r | ARN:res/41 | ml-infra |
| URI-0003 | genomics-lab-director | urn:isbn:978316148 | urn:uuid:9f2a | ml-infra |
| URI-0004 | edge-device-gateway | urn:isbn:978316148 | ARN:res/41 | ml-infra |
| URI-0005 | genomics-lab-director | doi:10.5281/zenodo | urn:uuid:9f2a | analytics |
| URI-0006 | edge-device-gateway | doi:10.5281/zenodo | doi:10.1109/x | sre |
| URI-0007 | cern-alice-analysis | urn:isbn:978316148 | urn:uuid:9f2a | sre |

**t_breaking_change_subclass**

| id | breaking | breaking_change_for |
| --- | --- | --- |
| CHAN-0001 | Telemetry schema evolution | device telemetry collector |
| CHAN-0002 | Telemetry schema evolution | inventory management API |
| CHAN-0003 | Provenance graph migration | legacy mobile app |
| CHAN-0004 | OAuth2 token rotation | real-time event stream |
| CHAN-0005 | Schema field removal | internal microservice mesh |
| CHAN-0006 | Sensor sampling rate drop | customer dashboard frontend |
| CHAN-0007 | Provenance graph migration | compliance audit logger |
| CHAN-0008 | TLS 1.3 enforcement | third-party analytics SDK |