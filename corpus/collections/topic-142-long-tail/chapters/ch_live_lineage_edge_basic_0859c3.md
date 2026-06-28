---
chapter_id: ch_live_lineage_edge_basic_0859c3
topic_id: 142
family: 05_provo_lineage
cited_terms: ['lineage_edge_basic', 'equiv_union_ice_branches', 'policy_only_governs_artifacts']
model: engine-refine
---

Data lineage systems anchor their provenance claims in structured attribute definitions that bind semantic meaning to typed values. Within the lineage edge framework, each edge—identified by a code such as EDGE-0001 through EDGE-0004 and classified under descriptive categories like Financial Reconciliation Trace, Compliance Verification Path, Data Lake Ingestion Chain, and Supply Chain Audit Trail—carries a set of named attributes whose types govern how values are stored and validated. The attribute registry records names such as confidence, dimension_kind, method, and recorded_at, each paired with an XSD type constraint: xsd:decimal for numeric precision, xsd:string for free-form text, and xsd:dateTime for temporal stamps. This type discipline ensures that downstream consumers can interpret values without ambiguity, a requirement when audit trails must withstand regulatory scrutiny or when confidence scores in the range of 0.497 to 0.947 are compared across disparate data sources.

The value tables materialize these attribute definitions by associating typed literals with specific entities and attributes through a three-column structure of identifier, entity reference, and attribute reference. Temporal metadata, for instance, is stored in the datetime value table where entity EDGE-0001 is linked to attribute EDGE-0004 with a recorded timestamp of 2023-06-18T00:21:12, while related edges record their own timestamps—2023-11-20T00:15:50, 2023-03-09T06:34:54, and 2023-04-04T09:21:45—enabling chronological reconstruction of lineage events. Decimal values populate a parallel table, where entity EDGE-0001 carries multiple attribute associations yielding numeric values such as 0.947, 637.72, and 513.28, and entity EDGE-0002 contributes a confidence reading of 0.497. String-valued attributes reside in a third value table, attaching labels like Dimension Kind 01, Encoding 02, and de to entity EDGE-0001 across distinct attribute references, thereby supporting the full spectrum of metadata types required for comprehensive data governance.

**t_lineage_edge_basic**

| id | lineage |
| --- | --- |
| EDGE-0001 | Financial Reconciliation Trace |
| EDGE-0002 | Compliance Verification Path |
| EDGE-0003 | Data Lake Ingestion Chain |
| EDGE-0004 | Supply Chain Audit Trail |
| EDGE-0005 | Sensor Calibration Pipeline |
| EDGE-0006 | Supply Chain Audit Trail |
| EDGE-0007 | Document Revision History |
| EDGE-0008 | Genomic Variant Processing |

**t_lineage_edge_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| EDGE-0001 | confidence | xsd:decimal |
| EDGE-0002 | dimension_kind | xsd:string |
| EDGE-0003 | method | xsd:string |
| EDGE-0004 | recorded_at | xsd:dateTime |
| EDGE-0005 | uncertainty | xsd:decimal |
| EDGE-0006 | unit | xsd:string |
| EDGE-0007 | value | xsd:decimal |
| EDGE-0008 | encoding | xsd:string |

**t_lineage_edge_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0004 | 2023-06-18T00:21:12 |
| EDGE-0002 | EDGE-0002 | EDGE-0004 | 2023-11-20T00:15:50 |
| EDGE-0003 | EDGE-0003 | EDGE-0004 | 2023-03-09T06:34:54 |
| EDGE-0004 | EDGE-0004 | EDGE-0004 | 2023-04-04T09:21:45 |
| EDGE-0005 | EDGE-0005 | EDGE-0004 | 2025-02-06T04:35:19 |
| EDGE-0006 | EDGE-0006 | EDGE-0004 | 2023-09-20T23:51:28 |
| EDGE-0007 | EDGE-0007 | EDGE-0004 | 2023-03-25T22:49:39 |
| EDGE-0008 | EDGE-0008 | EDGE-0004 | 2025-02-12T13:04:31 |

**t_lineage_edge_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0001 | 0.947 |
| EDGE-0002 | EDGE-0001 | EDGE-0005 | 637.72 |
| EDGE-0003 | EDGE-0001 | EDGE-0007 | 513.28 |
| EDGE-0004 | EDGE-0002 | EDGE-0001 | 0.497 |
| EDGE-0005 | EDGE-0002 | EDGE-0005 | 852.97 |
| EDGE-0006 | EDGE-0002 | EDGE-0007 | 198.62 |
| EDGE-0007 | EDGE-0003 | EDGE-0001 | 0.290 |
| EDGE-0008 | EDGE-0003 | EDGE-0005 | 468.80 |

**t_lineage_edge_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| EDGE-0001 | EDGE-0001 | EDGE-0002 | Dimension Kind 01 |
| EDGE-0002 | EDGE-0001 | EDGE-0008 | Encoding 02 |
| EDGE-0003 | EDGE-0001 | EDGE-0009 | change rationale |
| EDGE-0004 | EDGE-0001 | EDGE-0010 | de |
| EDGE-0005 | EDGE-0001 | EDGE-0003 | manual |
| EDGE-0006 | EDGE-0001 | EDGE-0006 | count |
| EDGE-0007 | EDGE-0002 | EDGE-0002 | Dimension Kind 07 |
| EDGE-0008 | EDGE-0002 | EDGE-0008 | Encoding 08 |

Equivalence branch tables extend this provenance model beyond single-language contexts by maintaining parallel label texts alongside language codes, enabling multilingual governance documentation. The branch registry assigns identifiers such as BRAN-0001 through BRAN-0004 to equivalence classes named Calibration_Offset, Equipment_Model, Data_Retention_Policy, and Quality_Score, each paired with a human-readable label—calibration record, change rationale, intake form—and a language indicator drawn from the ISO two-letter set: fr, es, de. This structure permits a single governance concept to carry localized descriptions without fragmenting the underlying equivalence relationship, a capability essential for multinational organizations where policy artifacts must be understood across linguistic boundaries.

**t_equiv_union_ice_branches**

| id | equiv | label_text | language |
| --- | --- | --- | --- |
| BRAN-0001 | Calibration_Offset | calibration record | fr |
| BRAN-0002 | Equipment_Model | change rationale | es |
| BRAN-0003 | Data_Retention_Policy | calibration record | es |
| BRAN-0004 | Quality_Score | intake form | de |
| BRAN-0005 | Quality_Score | change rationale | de |
| BRAN-0006 | Observation_Code | nightly summary | es |
| BRAN-0007 | Safety_Protocol | nightly summary | es |
| BRAN-0008 | Quality_Score | pre-release note | fr |

**t_policy_only_governs_artifacts**

| id | policy | enforcement | priority |
| --- | --- | --- | --- |
| ARTI-0001 | Data Retention Policy | blocking | 2 |
| ARTI-0002 | Access Control Policy | advisory | 4 |
| ARTI-0003 | Privacy Compliance Policy | deprecated | 1 |
| ARTI-0004 | Immutable Audit Policy | advisory | 5 |
| ARTI-0005 | Provenance Tracking Policy | deprecated | 5 |
| ARTI-0006 | Access Control Policy | mandatory | 1 |

Policy governance is enforced through a dedicated artifact table that maps policies to enforcement mechanisms and numerical priority levels. Four policies—Data Retention Policy, Access Control Policy, Privacy Compliance Policy, and Immutable Audit Policy—are each assigned an enforcement posture of blocking, advisory, or deprecated, and a priority integer ranging from 1 to 5. The Privacy Compliance Policy, for example, carries the highest enforcement priority at level 1 with an advisory stance, while Immutable Audit Policy sits at the lowest priority of 5, also advisory; Data Retention Policy holds priority 2 under blocking enforcement, and Access Control Policy occupies priority 4 in advisory mode. This priority ordering resolves conflicts when multiple policies apply to the same artifact, ensuring that the most critical controls take precedence during automated enforcement decisions.