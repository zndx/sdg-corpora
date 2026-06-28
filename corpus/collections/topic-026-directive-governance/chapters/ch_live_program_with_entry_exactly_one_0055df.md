---
chapter_id: ch_live_program_with_entry_exactly_one_0055df
topic_id: 26
family: 01_foundation
cited_terms: ['program_with_entry_exactly_one', 'schemaorg_person_affiliation', 'account_authorization_record']
model: engine-refine
---

Account authorization records serve as the foundational audit artifacts for tracking which applications are registered under which administrative oversight. Each record captures a discrete authorization event, identified by a unique key such as REC-ACC-5591, PERM-ACC-6609, or AUTH-LOG-3381, and associates the authorization with a specific registered application and an assigned administrator. For instance, the record REC-ACC-5591 appears twice in the dataset, each time registering the application SnapchatV2 but under different administrative assignments—security_lee in one instance and admin_jchen in another—reflecting the need to track authorization state across personnel changes or reassignments. Other records cover a broader application landscape: BlueskyClient is registered under platform_mgr_wu, while LinkedInPro falls under sysadmin_klee, illustrating how a single governance framework can span diverse platforms and their respective custodians.

**t_account_authorization_record**

| id | account_authorization_record | registers_application | assigns_administrator |
| --- | --- | --- | --- |
| RECO-0001 | REC-ACC-5591 | SnapchatV2 | security_lee |
| RECO-0002 | PERM-ACC-6609 | SnapchatV2 | admin_jchen |
| RECO-0003 | REC-ACC-5591 | BlueskyClient | platform_mgr_wu |
| RECO-0004 | AUTH-LOG-3381 | LinkedInPro | sysadmin_klee |
| RECO-0005 | AUTH-LOG-1192 | DiscordMain | platform_mgr_wu |
| RECO-0006 | AUTH-REC-2215 | LinkedInPro | sysadmin_klee |

The attribute model for authorization records provides a flexible, extensible mechanism for attaching metadata to each authorization event. Rather than hardcoding fields into the authorization record itself, the system uses an entity-attribute-value pattern where attributes are defined separately with a name and type. The attribute definitions table declares attributes such as encoding, label_text, and language, all typed as xsd:string, establishing a schema-agnostic but type-constrained approach to metadata. The values table then materializes these attributes against specific authorization records: for example, authorization RECO-0001 carries the attribute values "Encoding 01" for its encoding attribute, "nightly summary" for its label_text, and "es" for its language attribute, while RECO-0002 carries "Encoding 04" for encoding. This design permits individual authorization records to carry arbitrary descriptive metadata without requiring schema migrations.

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

Affiliation records form a parallel governance dimension, linking entities to organizational or programmatic affiliations that carry their own categorical classification. The dimension table for affiliations assigns each affiliation a human-readable label—Affiliation Label 01 through Affiliation Label 04—and a category—Affiliation Category 01 through Affiliation Category 04—providing the metadata necessary for reporting and access control decisions. The fact table for schema.org data references these affiliations through an affiliation key, creating a many-to-one relationship where multiple fact records can share the same affiliation. The size_bytes column on these fact records captures the payload magnitude of each entity, ranging from approximately 114 megabytes (114,301,972 bytes for AFFI-0002) to nearly 1 gigabyte (998,785,819 bytes for AFFI-0003), information that is critical for capacity planning and data retention policies.

**fact_schemaorg**

| id | affiliation_key | size_bytes | version |
| --- | --- | --- | --- |
| AFFI-0001 | AFFI-0001 | 895265030 | 3 |
| AFFI-0002 | AFFI-0004 | 114301972 | 5 |
| AFFI-0003 | AFFI-0002 | 338701831 | 4 |
| AFFI-0004 | AFFI-0003 | 998785819 | 8 |

**dim_affiliation**

| id | affiliation_label | affiliation_category |
| --- | --- | --- |
| AFFI-0001 | Affiliation Label 01 | Affiliation Category 01 |
| AFFI-0002 | Affiliation Label 02 | Affiliation Category 02 |
| AFFI-0003 | Affiliation Label 03 | Affiliation Category 03 |
| AFFI-0004 | Affiliation Label 04 | Affiliation Category 04 |
| AFFI-0005 | Affiliation Label 05 | Affiliation Category 05 |
| AFFI-0006 | Affiliation Label 06 | Affiliation Category 06 |

Program execution records complete the governance picture by tying authorization and affiliation data to concrete operational workflows. The program table records discrete programs such as inventory_sync, nightly_etl, and health_check, each associated with an entry point like api_gateway, main.py, or cron_trigger, and each carrying a version number that tracks evolution over time. The identifier column on this table—values like ARN:res/41 and ref-8842—provides a stable reference that can be correlated across systems. Version numbers range from 3 to 12 across the four programs, indicating that different components evolve at different rates and that version tracking is essential for audit trails and rollback procedures. Together, these tables form a cohesive governance framework where authorization records, attribute metadata, affiliation classifications, and program versions are all cross-referenced through shared identifier keys, enabling comprehensive auditability and compliance reporting.

**t_program_with_entry_exactly_one**

| id | program | entry_point | identifier | version |
| --- | --- | --- | --- | --- |
| ONE-0001 | inventory_sync | api_gateway | ARN:res/41 | 12 |
| ONE-0002 | inventory_sync | main.py | ARN:res/41 | 3 |
| ONE-0003 | nightly_etl | api_gateway | ARN:res/41 | 8 |
| ONE-0004 | health_check | cron_trigger | ref-8842 | 11 |
| ONE-0005 | health_check | api_gateway | doi:10.1109/x | 9 |
| ONE-0006 | nightly_etl | command_line | urn:uuid:9f2a | 7 |
| ONE-0007 | health_check | start_service | urn:uuid:9f2a | 1 |