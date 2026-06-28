---
chapter_id: ch_live_schemaorg_creativework_publisher_9d3db3
topic_id: 181
family: 07_long_tail
cited_terms: ['schemaorg_creativework_publisher', 'nist80053_low_impact', 'artifact_with_role']
model: engine-refine
---

In governed information systems, an entity is any recordable thing whose properties must be tracked, compared, and audited over time: a published creative work, a NIST control baseline, or a data artifact moving through a pipeline. Each entity is distinguished by an identifier—a durable key that survives renaming, reclassification, and cross-system exchange. Identifiers such as PUBL-0001 or IMPA-0001 are not merely database convenience; they are the anchors that let compliance officers, integrators, and automated validators refer to the same object across attribute stores, relationship tables, and downstream evidence chains. When an attribute named identifier carries a value like ARN:res/41 under a designative type (cco:DesignativeICE), the system is asserting an externally meaningful name—often the one auditors and procurement systems will cite—while the internal key continues to bind all related facts together.

**t_schemaorg_creativework_publisher**

| id | schemaorg | publisher |
| --- | --- | --- |
| PUBL-0001 | API Gateway Config | NIST Cybersecurity Office |
| PUBL-0002 | API Gateway Config | AWS Documentation Team |
| PUBL-0003 | Cloud Migration Playbook | AWS Documentation Team |
| PUBL-0004 | Cloud Migration Playbook | NIST Cybersecurity Office |
| PUBL-0005 | Incident Postmortem | ISO Technical Committee |
| PUBL-0006 | Telemetry Schema Draft | AWS Documentation Team |
| PUBL-0007 | Firmware Release Notes | Elastic Search Team |
| PUBL-0008 | Cloud Migration Playbook | Apache Software Foundation |

**t_schemaorg_creativework_publisher_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| PUBL-0001 | checksum | xsd:string |
| PUBL-0002 | created_date | xsd:date |
| PUBL-0003 | identifier | cco:DesignativeICE |
| PUBL-0004 | license | xsd:string |
| PUBL-0005 | mime_type | xsd:string |
| PUBL-0006 | size_bytes | xsd:long |
| PUBL-0007 | uri | xsd:string |
| PUBL-0008 | version | xsd:integer |

Attributes (attr) name the facets an entity may possess: creation date, license terms, integrity digest, or zone placement. Each attribute is governed by an attr type that fixes its semantics and validation rules before any value is accepted. A type of xsd:date constrains created_date to calendar instants such as 2023-06-28 or 2025-04-12; xsd:string accommodates free text like proprietary or zone-b; specialized types such as cco:DesignativeICE signal that the value participates in identity or designation logic rather than casual description. Separating attribute definition from storage is what allows one publisher record to accumulate heterogeneous facts—checksum as string, counts as integers, dates in a date-typed store—without collapsing type safety. The operational value stored for a given entity–attribute pair is the misc field: the concrete datum that answers “what is true about this thing right now?” Misc is intentionally generic at the column level because the attr type and the chosen physical store jointly determine interpretation; governance depends on that discipline, not on encoding every possible datatype in a single column name.

**t_schemaorg_creativework_publisher_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0002 | 2023-06-28 |
| PUBL-0002 | PUBL-0002 | PUBL-0002 | 2024-12-26 |
| PUBL-0003 | PUBL-0003 | PUBL-0002 | 2025-04-12 |
| PUBL-0004 | PUBL-0004 | PUBL-0002 | 2023-05-08 |
| PUBL-0005 | PUBL-0005 | PUBL-0002 | 2023-02-08 |
| PUBL-0006 | PUBL-0006 | PUBL-0002 | 2023-06-27 |
| PUBL-0007 | PUBL-0007 | PUBL-0002 | 2024-12-14 |
| PUBL-0008 | PUBL-0008 | PUBL-0002 | 2024-06-20 |

**t_schemaorg_creativework_publisher_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0006 | 72 |
| PUBL-0002 | PUBL-0001 | PUBL-0008 | 1 |
| PUBL-0003 | PUBL-0002 | PUBL-0006 | 54 |
| PUBL-0004 | PUBL-0002 | PUBL-0008 | 3 |
| PUBL-0005 | PUBL-0003 | PUBL-0006 | 456 |
| PUBL-0006 | PUBL-0003 | PUBL-0008 | 6 |
| PUBL-0007 | PUBL-0004 | PUBL-0006 | 341 |
| PUBL-0008 | PUBL-0004 | PUBL-0008 | 9 |

**t_schemaorg_creativework_publisher_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| PUBL-0001 | PUBL-0001 | PUBL-0001 | 9d2b7a16 |
| PUBL-0002 | PUBL-0001 | PUBL-0003 | ARN:res/41 |
| PUBL-0003 | PUBL-0001 | PUBL-0004 | proprietary |
| PUBL-0004 | PUBL-0001 | PUBL-0009 | zone-b |
| PUBL-0005 | PUBL-0001 | PUBL-0005 | application/xml |
| PUBL-0006 | PUBL-0001 | PUBL-0010 | Name 06 |
| PUBL-0007 | PUBL-0001 | PUBL-0011 | sre |
| PUBL-0008 | PUBL-0001 | PUBL-0012 | Tags 08 |

Checksum and sizebytes address complementary dimensions of artifact trust and operability. A checksum is a compact fingerprint—9d2b7a16, 5e8f3c91, a3f9c21e—computed over content so that any subsequent change produces a detectable mismatch. In a lineage context where the same logical artifact name (patient-cohorts-2023) appears at multiple stages, distinct checksums prove that each stage’s bytes differ even when human-readable labels repeat: the transform-stage copy (7b14de08) is not interchangeable with the archival-copy (9d2b7a16), and neither should be treated as the source-dataset (5e8f3c91) without explicit reconciliation. Sizebytes complements integrity with scale: values on the order of 666903238 versus 29914871 inform retention policy, transfer windows, and cost controls. Together, checksum and byte size turn opaque blobs into governable objects whose provenance and fitness for purpose can be demonstrated during assessments.

Role, subject, and target model directed relationships among entities when flat attributes are insufficient. A role names the capacity in which one party or object participates relative to another: in impact-mapping practice, SP 800-171 Rev 2 may be linked to category 1 with role contributor while another pairing assigns reviewer or observer—encoding who may attest, who may only witness, and who bears operational responsibility without conflating those duties into a single undifferentiated association. Subject and target orient that participation: the subject (nist_id) is the entity whose posture or classification is being described; the target (at_n_i_s_t_impact_level_id) is the framework element or level against which that posture is measured. The same pattern appears in pipeline governance, where roles such as source-dataset, transform-stage, output-sink, and archival-copy situate identical artifact identifiers within a ordered processing graph rather than as interchangeable duplicates.

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

Taken together, identifier, entity, attr, attr type, misc, checksum, sizebytes, role, subject, and target form a layered vocabulary for evidence-backed operations. Identifiers and typed attributes establish what exists and what is true about it; checksums and byte measures establish whether content remains authentic and manageable; roles with subject–target bindings establish how entities relate within control frameworks and data lifecycles. Systems that honor this separation can answer audit questions—who published Cloud Migration Playbook, when it was created, under what license, with what integrity proof, and in what capacity a given NIST publication maps to an impact level—without ad hoc joins or ambiguous prose. That is why these constructs matter in practice: they convert policy language into inspectable structure, so compliance claims rest on reconcilable facts rather than narrative assertion alone.

**t_artifact_with_role**

| id | artifact | role | checksum | size_bytes |
| --- | --- | --- | --- | --- |
| ROLE-0001 | patient-cohorts-2023 | source-dataset | 5e8f3c91 | 666903238 |
| ROLE-0002 | patient-cohorts-2023 | transform-stage | 7b14de08 | 309925726 |
| ROLE-0003 | feature-store-cache | output-sink | a3f9c21e | 29914871 |
| ROLE-0004 | feature-store-cache | archival-copy | 9d2b7a16 | 347040623 |