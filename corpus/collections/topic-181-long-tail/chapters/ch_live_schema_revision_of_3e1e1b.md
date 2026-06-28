---
chapter_id: ch_live_schema_revision_of_3e1e1b
topic_id: 181
family: 07_long_tail
cited_terms: ['schema_revision_of', 'ganglion_cyst_imaging_finding', 'gdpr_article_subclass']
model: engine-refine
---

In regulated data ecosystems, every artifact requires a stable identifier to anchor its lifecycle from creation through revision and eventual retirement. Identifiers such as REVI-0001, FIND-0001, and ARTI-0001 serve as the immutable keys that distinguish one record from another across the entire schema revision registry, the clinical imaging findings repository, and the GDPR article classification system. These identifiers are not merely labels; they are the referential backbone that enables cross-table relationships, audit trails, and compliance reporting. When a schema revision like REVI-0001 is created to migrate a legacy compliance log into a new network flow record format, the identifier ensures that downstream consumers can unambiguously trace which legacy artifact was superseded and by what.

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | network_flow_record |
| REVI-0002 | product_inventory_catalog |
| REVI-0003 | network_flow_record |
| REVI-0004 | clinical_trial_protocol |
| REVI-0005 | financial_ledger_format |
| REVI-0006 | network_flow_record |
| REVI-0007 | api_gateway_routing |
| REVI-0008 | compliance_audit_log |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

Schema revision management operates through a three-table pattern that separates the revision itself from its predecessor and the role-based relationship between them. The revision table records what the new schema is—REVI-0001 defines a network flow record, REVI-0003 also defines a network flow record, while REVI-0004 defines a clinical trial protocol—each pointing back to a predecessor in the revision-of table, which identifies the legacy system being replaced, such as legacy_compliance_log or legacy_network_record. The junction table then binds these two entities together through a subject-target relationship enriched by a role attribute: REVI-0001 acts as the subject referencing REVI-0006 as the target with the role of reviewer, while the same subject also references REVI-0001 as the target with the role of contributor, and REVI-0007 appears as a subject with the role of owner. This tripartite structure allows a single schema revision to participate in multiple relationships simultaneously, each with a distinct governance posture.

**t_schema_revision_of__schema_revision_of**

| id | schema_id | schema_revision_of_id | role |
| --- | --- | --- | --- |
| REVI-0001 | REVI-0001 | REVI-0006 | reviewer |
| REVI-0002 | REVI-0001 | REVI-0001 | contributor |
| REVI-0003 | REVI-0001 | REVI-0003 | reviewer |
| REVI-0004 | REVI-0007 | REVI-0003 | owner |
| REVI-0005 | REVI-0006 | REVI-0001 | contributor |
| REVI-0006 | REVI-0005 | REVI-0001 | observer |
| REVI-0007 | REVI-0006 | REVI-0004 | owner |
| REVI-0008 | REVI-0007 | REVI-0004 | reviewer |

Clinical imaging findings follow an analogous structural pattern but are grounded in medical semantics rather than schema evolution. Each finding record carries an identifier like FIND-0001 through FIND-0004 and describes a specific anatomical observation—Dorsal right ankle, Left medial malleolus, Bilateral distal radius, Right dorsal metatarsal—alongside the magnetic resonance imaging modality used to visualize it, including MIP reconstruction, Sagittal PD FS, Gadolinium enhanced T1, and T2 weighted fat sat. The encoding column captures the character encoding of the finding text (ascii, latin1, unicode), while the language column records the locale of the entry (ja for Japanese, en for English). This combination of anatomical location, imaging modality, encoding, and language ensures that imaging findings are both clinically interpretable and technically portable across systems that may use different character sets and linguistic conventions.

**t_ganglion_cyst_imaging_finding**

| id | ganglion_cyst_imaging_finding | visualizes | encoding | language |
| --- | --- | --- | --- | --- |
| FIND-0001 | Dorsal right ankle | MIP reconstruction | ascii | ja |
| FIND-0002 | Left medial malleolus | Sagittal PD FS | ascii | ja |
| FIND-0003 | Bilateral distal radius | Gadolinium enhanced T1 | latin1 | en |
| FIND-0004 | Right dorsal metatarsal | T2 weighted fat sat | unicode | ja |
| FIND-0005 | Palmar left thumb | Sagittal PD FS | unicode | de |
| FIND-0006 | Left scapholunate ligament | STIR sequence | unicode | en |
| FIND-0007 | Palmar left thumb | PD weighted fat sat | unicode | en |

Regulatory classification mirrors this same relational discipline. The GDPR article subclass table maps classification identifiers like ARTI-0001 through ARTI-0004 to broader privacy frameworks such as Brazilian LGPD and Canadian PIPEDA, while the subclass-to-article junction table establishes which specific articles each subclass references. Here again, the subject-target-role pattern appears: ARTI-0005 serves as a subject referencing ARTI-0005 as the target with the role of observer, ARTI-0007 references ARTI-0005 as the target with the role of contributor, and ARTI-0004 references ARTI-0006 as the target with the role of owner. The roles—reviewer, contributor, owner, observer—form a consistent vocabulary of governance posture across all three domains, signaling whether an entity passively observes a relationship, actively contributes to it, or holds authoritative ownership.

**t_gdpr_article_subclass**

| id | gdpr |
| --- | --- |
| ARTI-0001 | Brazilian LGPD |
| ARTI-0002 | Canadian PIPEDA |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Canadian PIPEDA |
| ARTI-0005 | Canadian PIPEDA |
| ARTI-0006 | General Data Protection Regulation |
| ARTI-0007 | Article 6 |
| ARTI-0008 | Swiss FADP |

**t_gdpr_article_subclass_gdpr_article**

| id | gdpr_article |
| --- | --- |
| ARTI-0001 | Australian Privacy Act |
| ARTI-0002 | Japanese APPI |
| ARTI-0003 | Brazilian LGPD |
| ARTI-0004 | Article 9 |
| ARTI-0005 | ePrivacy Directive |
| ARTI-0006 | Canadian PIPEDA |

**t_gdpr_article_subclass__gdpr_article**

| id | gdpr_id | gdpr_article_id | role |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0005 | ARTI-0005 | observer |
| ARTI-0002 | ARTI-0007 | ARTI-0005 | contributor |
| ARTI-0003 | ARTI-0007 | ARTI-0005 | observer |
| ARTI-0004 | ARTI-0004 | ARTI-0006 | owner |
| ARTI-0005 | ARTI-0001 | ARTI-0002 | owner |
| ARTI-0006 | ARTI-0004 | ARTI-0003 | reviewer |
| ARTI-0007 | ARTI-0006 | ARTI-0002 | observer |
| ARTI-0008 | ARTI-0005 | ARTI-0006 | contributor |

The practical significance of this unified structure lies in its ability to support compliance auditing across heterogeneous data domains. When a regulator asks which schema revisions affected a clinical trial protocol, or which imaging findings were encoded in a particular character set and language, or which GDPR articles fall under Brazilian LGPD, the answer is always found by traversing the same subject-target relationship pattern enriched by role metadata. The encoding and language attributes on imaging findings ensure that medical data can be correctly rendered and interpreted regardless of the receiving system's locale, while the role attribute on junction tables ensures that every cross-referential relationship carries an explicit governance context. This is not schema design for its own sake; it is the scaffolding that makes compliance verifiable, traceable, and defensible.