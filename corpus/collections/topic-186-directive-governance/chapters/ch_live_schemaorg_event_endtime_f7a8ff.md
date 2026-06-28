---
chapter_id: ch_live_schemaorg_event_endtime_f7a8ff
topic_id: 186
family: 07_long_tail
cited_terms: ['schemaorg_event_endtime', 'schemaorg_event_organizer', 'profile_basic']
model: engine-refine
---

In governed data environments, every record that must be auditable, reconciled, or joined across systems begins with a stable identifier. Identifiers such as `ENDT-0004` or `ORGA-0001` are not display labels; they are durable keys that survive relabeling, reclassification, and schema evolution. When a fact row references `event_end_time_key` `ENDT-0007` while its own `id` remains `ENDT-0004`, the distinction matters operationally: the fact’s identity and the temporal dimension it points to are separate concerns, and conflating them breaks lineage. The same principle applies to organizer records (`ORGA-0001` through `ORGA-0004`), where each identifier anchors a distinct schema.org event—Edge Compute Fest, Telemetry Conference, Stream Processing Conclave, Governance Workshop—regardless of how organizer names or attribute values change over time.

**t_schemaorg_event_organizer**

| id | schemaorg | organizer |
| --- | --- | --- |
| ORGA-0001 | Edge Compute Fest | MongoDB Events |
| ORGA-0002 | Telemetry Conference | Linux Foundation |
| ORGA-0003 | Stream Processing Conclave | Open Source Alliance |
| ORGA-0004 | Governance Workshop | MongoDB Events |
| ORGA-0005 | Stream Processing Conclave | IEEE Computer Society |
| ORGA-0006 | Edge Compute Fest | IEEE Computer Society |
| ORGA-0007 | Cloud Observability Meetup | DataBricks Inc |

Entities sit one conceptual layer above raw identifiers: they are the business objects to which attributes attach. In practice, an entity is the subject of assertion—here, an event organizer node identified by `entity_id` values such as `ORGA-0001`. Attribute values are never stored as opaque blobs on the entity row itself; they are mediated through named attributes (`attr`) and enforced types (`attr_type`). A `created_date` attribute typed as `xsd:date` lands in a date-valued store and yields values like `2024-07-16` for one organizer and `2023-04-02` for others, while string attributes such as `checksum` (`7b14de08`), `identifier` (`gid://svc/77`), `license` (`CC-BY-4.0`), and region codes (`ap-south-2`) resolve through varchar storage. Typing is governance infrastructure: `cco:DesignativeICE` on an `identifier` attribute signals a controlled vocabulary semantics distinct from free `xsd:string`, and routing values to `val_date`, `val_int`, or `val_varchar` tables is how the platform prevents silent coercion—dates parsed as strings, integers stored as text—that undermines compliance queries and cross-source reconciliation.

**t_schemaorg_event_organizer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ORGA-0001 | checksum | xsd:string |
| ORGA-0002 | created_date | xsd:date |
| ORGA-0003 | identifier | cco:DesignativeICE |
| ORGA-0004 | license | xsd:string |
| ORGA-0005 | mime_type | xsd:string |
| ORGA-0006 | size_bytes | xsd:long |
| ORGA-0007 | uri | xsd:string |
| ORGA-0008 | version | xsd:integer |

**t_schemaorg_event_organizer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0001 | 7b14de08 |
| ORGA-0002 | ORGA-0001 | ORGA-0003 | gid://svc/77 |
| ORGA-0003 | ORGA-0001 | ORGA-0004 | CC-BY-4.0 |
| ORGA-0004 | ORGA-0001 | ORGA-0009 | ap-south-2 |
| ORGA-0005 | ORGA-0001 | ORGA-0005 | application/xml |
| ORGA-0006 | ORGA-0001 | ORGA-0010 | Name 06 |
| ORGA-0007 | ORGA-0001 | ORGA-0011 | platform-team |
| ORGA-0008 | ORGA-0001 | ORGA-0012 | Tags 08 |

Category and profile dimensions supply the interpretive frame within which facts become actionable. Categories such as Event End Time Category 03 or Profile Category 04 do not replace identifiers; they classify records for policy application, reporting rollups, and access control. Event end time, expressed through labels like Event End Time Label 02 and bound to fact rows carrying `size_bytes` from roughly 114 million to nearly 999 million and `version` numbers ranging from 3 to 8, marks when a governed dataset’s temporal scope closes. That closure timestamp is essential for retention schedules, point-in-time audits, and proving which schema generation (`version` 8 versus `version` 3) was authoritative when a downstream consumer materialized a snapshot. Size in bytes makes the compliance cost tangible: a single fact at 895,265,030 bytes is not merely large—it triggers storage classification, transfer logging, and possibly jurisdictional handling rules tied to event-end boundaries.

**fact_schemaorg**

| id | event_end_time_key | size_bytes | version |
| --- | --- | --- | --- |
| ENDT-0001 | ENDT-0004 | 895265030 | 3 |
| ENDT-0002 | ENDT-0002 | 114301972 | 5 |
| ENDT-0003 | ENDT-0007 | 338701831 | 4 |
| ENDT-0004 | ENDT-0007 | 998785819 | 8 |

Profiles introduce measured judgment atop raw facts. A profile key such as `PROF-0005` can surface multiple fact rows with sharply different confidence scores—0.994 beside 0.299—demonstrating that profiling is rarely monolithic. Confidence quantifies how strongly the system trusts a derived assessment; uncertainty (values in the hundreds, e.g., 557.92 versus 284.36) expresses the residual dispersion or error budget around that assessment. Together they govern whether an automated decision may proceed, whether human review is mandatory, or whether a record should be quarantined. The misc values attached to profile facts (728.94, 380.57, and similar) are the concrete measurements or scores those confidence/uncertainty pairs annotate; without them, confidence and uncertainty are abstract ratios with nothing to ground enforcement thresholds.

**fact_profile**

| id | profile_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| PROF-0001 | PROF-0005 | 0.299 | 284.36 | 728.94 |
| PROF-0002 | PROF-0005 | 0.994 | 557.92 | 380.57 |
| PROF-0003 | PROF-0003 | 0.773 | 622.09 | 607.36 |
| PROF-0004 | PROF-0006 | 0.226 | 488.10 | 448.09 |

Operationally, these elements interlock in a repeatable pattern: identify the entity, assert typed attributes, classify through category, bound the dataset temporally with event end time, version the schema generation, measure footprint in size bytes, and score trust through profile confidence and uncertainty. A governance workshop record sharing an organizer with Edge Compute Fest (`MongoDB Events` on both `ORGA-0001` and `ORGA-0004`) still remains distinguishable by identifier and by its attribute graph—license strings, creation dates, integer counters (440, 450, 6, 7)—so policy cannot misfire on name collision alone. Misc fields throughout—labels, literal values, profile measurements—carry the human-readable and machine-verifiable payload, but they derive authority from the surrounding keys and types. Mature operations treat identifier stability, attr typing, categorical placement, temporal closure, versioning, volumetrics, and probabilistic profile metadata as a single control plane: omit any one element, and an otherwise complete dataset becomes non-auditable, non-comparable across releases, or unsafe to automate against.

**dim_event_end_time**

| id | event_end_time_label | event_end_time_category |
| --- | --- | --- |
| ENDT-0001 | Event End Time Label 01 | Event End Time Category 01 |
| ENDT-0002 | Event End Time Label 02 | Event End Time Category 02 |
| ENDT-0003 | Event End Time Label 03 | Event End Time Category 03 |
| ENDT-0004 | Event End Time Label 04 | Event End Time Category 04 |
| ENDT-0005 | Event End Time Label 05 | Event End Time Category 05 |
| ENDT-0006 | Event End Time Label 06 | Event End Time Category 06 |
| ENDT-0007 | Event End Time Label 07 | Event End Time Category 07 |

**t_schemaorg_event_organizer_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0002 | 2024-07-16 |
| ORGA-0002 | ORGA-0002 | ORGA-0002 | 2023-04-02 |
| ORGA-0003 | ORGA-0003 | ORGA-0002 | 2023-04-02 |
| ORGA-0004 | ORGA-0004 | ORGA-0002 | 2023-04-08 |
| ORGA-0005 | ORGA-0005 | ORGA-0002 | 2023-03-07 |
| ORGA-0006 | ORGA-0006 | ORGA-0002 | 2023-12-15 |
| ORGA-0007 | ORGA-0007 | ORGA-0002 | 2023-05-20 |

**t_schemaorg_event_organizer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0006 | 440 |
| ORGA-0002 | ORGA-0001 | ORGA-0008 | 7 |
| ORGA-0003 | ORGA-0002 | ORGA-0006 | 450 |
| ORGA-0004 | ORGA-0002 | ORGA-0008 | 6 |
| ORGA-0005 | ORGA-0003 | ORGA-0006 | 147 |
| ORGA-0006 | ORGA-0003 | ORGA-0008 | 6 |
| ORGA-0007 | ORGA-0004 | ORGA-0006 | 298 |
| ORGA-0008 | ORGA-0004 | ORGA-0008 | 7 |

**dim_profile**

| id | profile_label | profile_category |
| --- | --- | --- |
| PROF-0001 | Profile Label 01 | Profile Category 01 |
| PROF-0002 | Profile Label 02 | Profile Category 02 |
| PROF-0003 | Profile Label 03 | Profile Category 03 |
| PROF-0004 | Profile Label 04 | Profile Category 04 |
| PROF-0005 | Profile Label 05 | Profile Category 05 |
| PROF-0006 | Profile Label 06 | Profile Category 06 |
| PROF-0007 | Profile Label 07 | Profile Category 07 |