---
chapter_id: ch_live_log_with_resource_attribute_ab1e5b
topic_id: 61
family: 07_long_tail
cited_terms: ['log_with_resource_attribute', 'kernelhook_basic', 'account_authorization_record']
model: engine-refine
---

Authorization records serve as the foundational ledger for access governance, each identified by a unique key such as RECO-0001 through RECO-0004 and carrying an account authorization record designation like REC-ACC-5591, PERM-ACC-6609, or AUTH-LOG-3381. These records bind a social networking application—SnapchatV2, BlueskyClient, or LinkedInPro—to a designated staff administrator, whether security_lee, admin_jchen, platform_mgr_wu, or sysadmin_klee, thereby establishing a clear chain of accountability. The record structure is extensible through an attribute framework: each authorization record may carry typed attributes such as encoding, label_text, or language, all defined with the xsd:string type in the current schema, and their values are stored separately in a value table keyed by entity and attribute identifiers, as seen with entries like Encoding 01, nightly summary, and es mapped to entity RECO-0001 and its associated attributes.

**t_kernelhook_basic**

| id | kernelhook |
| --- | --- |
| KERN-0001 | Tracepoint-block-io |
| KERN-0002 | BPF-co-re-syscall |
| KERN-0003 | Kprobes-schedule |
| KERN-0004 | Fentry-kernel-init |
| KERN-0005 | Kprobes-schedule |
| KERN-0006 | Kretprobe-exit |

**t_kernelhook_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| KERN-0001 | checksum | xsd:string |
| KERN-0002 | created_date | xsd:date |
| KERN-0003 | identifier | cco:DesignativeICE |
| KERN-0004 | license | xsd:string |
| KERN-0005 | mime_type | xsd:string |
| KERN-0006 | size_bytes | xsd:long |
| KERN-0007 | uri | xsd:string |
| KERN-0008 | version | xsd:integer |

**t_kernelhook_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0006 | 323 |
| KERN-0002 | KERN-0001 | KERN-0008 | 12 |
| KERN-0003 | KERN-0002 | KERN-0006 | 186 |
| KERN-0004 | KERN-0002 | KERN-0008 | 2 |
| KERN-0005 | KERN-0003 | KERN-0006 | 276 |
| KERN-0006 | KERN-0003 | KERN-0008 | 4 |
| KERN-0007 | KERN-0004 | KERN-0006 | 346 |
| KERN-0008 | KERN-0004 | KERN-0008 | 11 |

**t_kernelhook_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0001 | a3f9c21e |
| KERN-0002 | KERN-0001 | KERN-0003 | gid://svc/77 |
| KERN-0003 | KERN-0001 | KERN-0004 | Apache-2.0 |
| KERN-0004 | KERN-0001 | KERN-0009 | eu-west-3 |
| KERN-0005 | KERN-0001 | KERN-0005 | text/plain |
| KERN-0006 | KERN-0001 | KERN-0010 | Name 06 |
| KERN-0007 | KERN-0001 | KERN-0011 | governance |
| KERN-0008 | KERN-0001 | KERN-0012 | Tags 08 |

**t_account_authorization_record**

| id | account_authorization_record | registers_application | assigns_administrator |
| --- | --- | --- | --- |
| RECO-0001 | REC-ACC-5591 | SnapchatV2 | security_lee |
| RECO-0002 | PERM-ACC-6609 | SnapchatV2 | admin_jchen |
| RECO-0003 | REC-ACC-5591 | BlueskyClient | platform_mgr_wu |
| RECO-0004 | AUTH-LOG-3381 | LinkedInPro | sysadmin_klee |
| RECO-0005 | AUTH-LOG-1192 | DiscordMain | platform_mgr_wu |
| RECO-0006 | AUTH-REC-2215 | LinkedInPro | sysadmin_klee |

**t_account_authorization_record_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| RECO-0001 | encoding | xsd:string |
| RECO-0002 | label_text | xsd:string |
| RECO-0003 | language | xsd:string |

**t_account_authorization_record_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0001 | RECO-0001 | Encoding 01 |
| RECO-0002 | RECO-0001 | RECO-0002 | nightly summary |
| RECO-0003 | RECO-0001 | RECO-0003 | es |
| RECO-0004 | RECO-0002 | RECO-0001 | Encoding 04 |
| RECO-0005 | RECO-0002 | RECO-0002 | audit excerpt |
| RECO-0006 | RECO-0002 | RECO-0003 | fr |
| RECO-0007 | RECO-0003 | RECO-0001 | Encoding 07 |
| RECO-0008 | RECO-0003 | RECO-0002 | audit excerpt |

The attribute model generalizes beyond authorization records to encompass any tracked resource. A dimension table maps resource attribute identifiers—ATTR-0001 through ATTR-0004—to human-readable labels such as Resource Attribute Label 01 and to categories like Resource Attribute Category 01, providing a classification layer that supports filtering and reporting. Each attribute definition specifies a type, whether xsd:string for textual data, xsd:date for temporal values, or cco:DesignativeICE for designative identifiers, and the type governs how values are stored and validated. For instance, the created_date attribute on a kernel hook entity expects an xsd:date value, and the corresponding value table stores dates such as 2023-02-05, 2024-05-21, 2024-01-08, and 2025-01-30, while the identifier attribute uses the cco:DesignativeICE type and holds values like gid://svc/77.

**dim_resource_attribute**

| id | resource_attribute_label | resource_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Resource Attribute Label 01 | Resource Attribute Category 01 |
| ATTR-0002 | Resource Attribute Label 02 | Resource Attribute Category 02 |
| ATTR-0003 | Resource Attribute Label 03 | Resource Attribute Category 03 |
| ATTR-0004 | Resource Attribute Label 04 | Resource Attribute Category 04 |
| ATTR-0005 | Resource Attribute Label 05 | Resource Attribute Category 05 |
| ATTR-0006 | Resource Attribute Label 06 | Resource Attribute Category 06 |

**t_kernelhook_basic_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0001 | KERN-0002 | 2023-02-05 |
| KERN-0002 | KERN-0002 | KERN-0002 | 2024-05-21 |
| KERN-0003 | KERN-0003 | KERN-0002 | 2024-01-08 |
| KERN-0004 | KERN-0004 | KERN-0002 | 2025-01-30 |
| KERN-0005 | KERN-0005 | KERN-0002 | 2023-03-23 |
| KERN-0006 | KERN-0006 | KERN-0002 | 2024-01-11 |

Entity-level attribute values are partitioned by data type into dedicated value tables, a design that enforces type safety and enables efficient querying. String-valued attributes reside in a varchar value table, where entity RECO-0001 is associated with attribute RECO-0001 holding the value a3f9c21e, with additional entries such as Apache-2.0 and eu-west-3 capturing license and region metadata. Integer-valued attributes are stored in a separate integer value table, recording figures like 323, 12, 186, and 2 against entity-attribute pairs such as KERN-0001 linked to attributes KERN-0006 and KERN-0008. This separation ensures that date, string, and numeric data are each handled with appropriate parsing and validation logic, reducing the risk of type coercion errors in compliance audits.

Resource attribute tracking extends to quantitative measurements, notably storage consumption. The fact_log table records size_bytes values—913386183, 303816232, 758542341, and 442933768—against resource attribute keys, providing a granular view of how much data each attribute consumes over time. Each fact entry is itself identified by a unique key such as ATTR-0001 and carries a version number, ranging from 2 to 7, which supports change tracking and historical reconstruction. The version field is critical for compliance: it allows auditors to determine which version of a resource attribute was in effect at a given point in time, and to reconstruct the state of the authorization landscape as it existed when a particular social networking application was registered or a staff administrator was assigned.

**fact_log**

| id | resource_attribute_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0005 | 913386183 | 6 |
| ATTR-0002 | ATTR-0006 | 303816232 | 7 |
| ATTR-0003 | ATTR-0001 | 758542341 | 7 |
| ATTR-0004 | ATTR-0001 | 442933768 | 2 |

The interplay between identifiers, entities, and attributes forms a normalized graph that supports both breadth and depth in governance reporting. An identifier such as KERN-0001 anchors a kernel hook entity, which in turn is linked to attributes like checksum and license through the attribute definition table, and those attributes receive values from the appropriate value table based on their declared type. Similarly, an authorization record identifier like RECO-0001 ties together a social networking application, a staff administrator, and a set of typed attributes with their corresponding values. This structure ensures that every compliance-relevant datum—whether a date, a string, an integer, a size in bytes, or a version number—is traceable to a single authoritative source and can be reconstructed with precision for audit, incident response, or regulatory reporting.