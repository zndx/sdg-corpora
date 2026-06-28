---
chapter_id: ch_live_schemaorg_creativework_author_40a868
topic_id: 181
family: 07_long_tail
cited_terms: ['schemaorg_creativework_author', 'nist80053_low_impact', 'ice_subclass_with_part']
model: engine-refine
---

In governed information systems, an entity is the durable thing you must be able to name, relate, and audit across time—not a transient field on a form, but a first-class record that other statements can point to. Author attribution for creative works, NIST low-impact control families, and ICE subclass parts all exist as entities because compliance and operations depend on stable referents: the pairing of API_Reference_Guide with WorkflowEngineer, the registration of SP 800-171 Rev 2, or the part typed as sensor_calibration_record must remain the same object whether it is queried today, reconciled tomorrow, or cited in an evidence package next quarter. An identifier is what makes that stability operational. System keys such as AUTH-0001 or IMPA-0001 are internal handles; domain identifiers such as gid://svc/77 are outward-facing designations that survive integration. When an attribute is declared with type cco:DesignativeICE, the intent is explicit: the misc value is not merely text but a designation that other components can resolve, which is why license terms (GPL-3.0) and service global IDs belong in the same conceptual family even though one reads as a legal string and the other as an infrastructure locator.

**t_schemaorg_creativework_author**

| id | schemaorg | author |
| --- | --- | --- |
| AUTH-0001 | API_Reference_Guide | WorkflowEngineer |
| AUTH-0002 | Provenance_Trace_Report | APIMaintainer |
| AUTH-0003 | API_Reference_Guide | SensorArchitect |
| AUTH-0004 | Provenance_Trace_Report | ModelReviewer |
| AUTH-0005 | Sensor_Network_Spec | ModelReviewer |
| AUTH-0006 | Catalog_Metadata_Index | ModelReviewer |
| AUTH-0007 | Telemetry_Config_Spec | CatalogAdmin |
| AUTH-0008 | Catalog_Metadata_Index | CatalogAdmin |

**t_schemaorg_creativework_author_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| AUTH-0001 | checksum | xsd:string |
| AUTH-0002 | created_date | xsd:date |
| AUTH-0003 | identifier | cco:DesignativeICE |
| AUTH-0004 | license | xsd:string |
| AUTH-0005 | mime_type | xsd:string |
| AUTH-0006 | size_bytes | xsd:long |
| AUTH-0007 | uri | xsd:string |
| AUTH-0008 | version | xsd:integer |

**t_schemaorg_creativework_author_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0006 | 363 |
| AUTH-0002 | AUTH-0001 | AUTH-0008 | 12 |
| AUTH-0003 | AUTH-0002 | AUTH-0006 | 393 |
| AUTH-0004 | AUTH-0002 | AUTH-0008 | 3 |
| AUTH-0005 | AUTH-0003 | AUTH-0006 | 58 |
| AUTH-0006 | AUTH-0003 | AUTH-0008 | 9 |
| AUTH-0007 | AUTH-0004 | AUTH-0006 | 306 |
| AUTH-0008 | AUTH-0004 | AUTH-0008 | 8 |

**t_nist80053_low_impact**

| id | nist |
| --- | --- |
| IMPA-0001 | SP 800-171 Rev 2 |
| IMPA-0002 | SP 800-37 Rev 2 |
| IMPA-0003 | CSF 1.1 |
| IMPA-0004 | RMF Guide |
| IMPA-0005 | CSF 1.1 |
| IMPA-0006 | SP 800-218 |
| IMPA-0007 | SP 800-37 Rev 2 |
| IMPA-0008 | CSF 1.1 |

Attributes are the governed properties through which entities acquire inspectable state. Each attr is a named claim—checksum, created_date, identifier, license—and its attr_type is the contract that tells validators, storage engines, and reviewers what shape of evidence is admissible. Typing is not decorative; it routes values into the correct representation and enforcement path. Dates bound to xsd:date land in date-valued stores and can be compared for freshness; integers support counts and magnitudes such as 363 or 12; varchar-backed strings hold opaque tokens, legal text, and deployment markers like on-prem-dc1. The misc column in those typed value relations is where assertion meets fact: it is the literal payload attached to an entity through a specific attr, and its integrity depends on the attr_type having been honored at ingest. A created_date of 2023-12-01 for one author record and 2024-12-04 for another is only meaningful because both values were admitted under the same xsd:date constraint; without that typing, chronological controls devolve into unparsed text.

**t_schemaorg_creativework_author_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0002 | 2023-12-01 |
| AUTH-0002 | AUTH-0002 | AUTH-0002 | 2024-12-04 |
| AUTH-0003 | AUTH-0003 | AUTH-0002 | 2023-05-29 |
| AUTH-0004 | AUTH-0004 | AUTH-0002 | 2023-07-08 |
| AUTH-0005 | AUTH-0005 | AUTH-0002 | 2025-04-18 |
| AUTH-0006 | AUTH-0006 | AUTH-0002 | 2023-08-09 |
| AUTH-0007 | AUTH-0007 | AUTH-0002 | 2024-11-19 |
| AUTH-0008 | AUTH-0008 | AUTH-0002 | 2024-04-19 |

**t_schemaorg_creativework_author_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| AUTH-0001 | AUTH-0001 | AUTH-0001 | 7b14de08 |
| AUTH-0002 | AUTH-0001 | AUTH-0003 | gid://svc/77 |
| AUTH-0003 | AUTH-0001 | AUTH-0004 | GPL-3.0 |
| AUTH-0004 | AUTH-0001 | AUTH-0009 | on-prem-dc1 |
| AUTH-0005 | AUTH-0001 | AUTH-0005 | text/plain |
| AUTH-0006 | AUTH-0001 | AUTH-0010 | Name 06 |
| AUTH-0007 | AUTH-0001 | AUTH-0011 | ml-infra |
| AUTH-0008 | AUTH-0001 | AUTH-0012 | Tags 08 |

Encoding and labeltext address the human and machine boundary of textual artifacts. Encoding declares how octets become characters when an ICE subclass part is materialized: ascii suffices for compact, Latin-script operational labels such as nightly summary, while unicode is required when observatory_metadata or event_stream_format must carry a broader character repertoire without silent corruption. Labeltext supplies the readable surface form—intake form, pre-release note, calibration record—that operators use to recognize parts in workflows, even when the underlying ice code (sensor_calibration_record, model_feature_catalog) is normalized for automation. In practice, encoding mismatches produce subtle governance failures: valid-looking labels that truncate symbols, break cross-system search, or fail signature checks. Treating encoding as a first-class property alongside labeltext prevents those failures from being discovered only during audit reconstruction.

**t_ice_subclass_with_part**

| id | ice | encoding | label_text |
| --- | --- | --- | --- |
| PART-0001 | sensor_calibration_record | ascii | intake form |
| PART-0002 | observatory_metadata | unicode | pre-release note |
| PART-0003 | event_stream_format | unicode | calibration record |
| PART-0004 | model_feature_catalog | ascii | nightly summary |
| PART-0005 | compliance_audit_report | utf8 | pre-release note |
| PART-0006 | customer_transaction_log | latin1 | audit excerpt |

Relational governance also requires verbs, not just nouns. Subject and target orient associations so that meaning is directional: a NIST publication as subject is classified against an impact-level entity as target, rather than leaving reviewers to infer which side of the link carries authority. Role completes the triplet by stating how the subject participates in that directed relationship—reviewer, observer, or contributor—so access reviews, separation-of-duties matrices, and accountability charts can be generated without reinterpretation. The same pattern appears wherever creative works are linked to authors and wherever parts are composed into larger ICE structures: identifiers anchor the nodes, attrs describe their state, and subject–target–role edges describe how controlled objects interact within a policy envelope.

**t_nist80053_low_impact_at_n_i_s_t_impact_level**

| id | at_n_i_s_t_impact_level |
| --- | --- |
| IMPA-0001 | baseline |
| IMPA-0002 | category 1 |
| IMPA-0003 | minimal |
| IMPA-0004 | category 1 |
| IMPA-0005 | minimal |
| IMPA-0006 | minimal |
| IMPA-0007 | baseline |
| IMPA-0008 | low impact |

**t_nist80053_low_impact__at_n_i_s_t_impact_level**

| id | nist_id | at_n_i_s_t_impact_level_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0001 | IMPA-0004 | reviewer |
| IMPA-0002 | IMPA-0003 | IMPA-0008 | observer |
| IMPA-0003 | IMPA-0002 | IMPA-0006 | observer |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | contributor |
| IMPA-0005 | IMPA-0007 | IMPA-0003 | owner |
| IMPA-0006 | IMPA-0001 | IMPA-0002 | reviewer |
| IMPA-0007 | IMPA-0007 | IMPA-0001 | contributor |
| IMPA-0008 | IMPA-0008 | IMPA-0008 | reviewer |

Taken together, these elements form an evidence-anchored reference model rather than a flat property bag. Identifiers make entities durable; attrs and attr_types make claims typed and testable; misc values make those claims auditable; encoding and labeltext make textual artifacts interoperable and intelligible; subject, target, and role make relationships explicit for compliance tracing. When an assessor asks whether SP 800-171 Rev 2 at category 1 was reviewed by the right party, or whether an API reference guide’s checksum, license, and creation date cohere with its author assignment, the answer is found by traversing identifiers to entities, validating attrs by type, reading misc as typed evidence, and interpreting directed roles—not by treating the dataset as a single undifferentiated table of strings. That separation of concerns is why the domain matters: it is the scaffold on which traceable, low-impact control implementations remain defensible under scrutiny.