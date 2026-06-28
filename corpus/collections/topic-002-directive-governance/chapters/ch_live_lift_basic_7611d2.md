---
chapter_id: ch_live_lift_basic_7611d2
topic_id: 2
family: 02_observation_measurement
cited_terms: ['lift_basic', 'young_adult_speaker_role', 'account_authorization_record']
model: engine-refine
---

Operational registries anchor every tracked asset and credential to a deterministic identifier, which resolves to a discrete entity within the governance fabric. These identifiers—such as LIFT-0001 or RECO-0001—serve as the primary keys for cross-referencing administrative records, whether they document physical infrastructure like an Observatory Lift or a compliance ledger logging platform access. An accountauthorizationrecord functions as the authoritative source for this linkage, explicitly binding a socialnetworkingapplication such as SnapchatV2 or BlueskyClient to a designated staffadministrator like security_lee or platform_mgr_wu. The structural integrity of this mapping ensures that access control matrices remain auditable, preventing ambiguous privilege assignments during routine compliance reviews.

**t_lift_basic**

| id | lift |
| --- | --- |
| LIFT-0001 | Observatory Lift |
| LIFT-0002 | Freight Service Lift |
| LIFT-0003 | Freight Service Lift |
| LIFT-0004 | Observatory Lift |
| LIFT-0005 | Observatory Lift |
| LIFT-0006 | Cargo Bay Lift |
| LIFT-0007 | Cargo Bay Lift |

**t_lift_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0004 | 2024-06-13T06:43:09 |
| LIFT-0002 | LIFT-0002 | LIFT-0004 | 2024-12-03T09:28:05 |
| LIFT-0003 | LIFT-0003 | LIFT-0004 | 2024-01-28T22:31:03 |
| LIFT-0004 | LIFT-0004 | LIFT-0004 | 2024-06-11T06:27:27 |
| LIFT-0005 | LIFT-0005 | LIFT-0004 | 2023-05-13T18:59:00 |
| LIFT-0006 | LIFT-0006 | LIFT-0004 | 2023-02-07T19:19:23 |
| LIFT-0007 | LIFT-0007 | LIFT-0004 | 2023-12-22T04:56:51 |

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

Attribute definitions and their corresponding attr type declarations enforce schema discipline across heterogeneous valuation stores. Attrs such as confidence, dimension_kind, encoding, and language are formally declared with strict data types—including xsd:decimal, xsd:string, and xsd:dateTime—to guarantee predictable processing by downstream validation pipelines. This typed attribute framework allows a single entity to carry multiple metadata facets without structural collision. For example, the governance record PERM-ACC-6609 may simultaneously track a language designation, a label_text descriptor, and an encoding scheme, each constrained by its declared type. The attr type system thus acts as a gatekeeper, ensuring that heterogeneous metadata remains machine-readable and compliant with enterprise data standards.

Instance valuation is managed through entity-resolved tables that separate schema definition from data storage. The entity column operates as the foreign key linking back to the base registry, while the misc value column accommodates diverse data types across dedicated valuation tables. Decimal measurements like 93.24 or 541.29 reside alongside temporal stamps such as 2024-06-13T06:43:09 and textual descriptors like Dimension Kind 01 or change rationale. This architectural separation enables scalable storage while preserving referential integrity. A decimal confidence score of 0.624 attached to entity LIFT-0001 is structurally isolated from the varchar encoding value Encoding 01, yet both remain traceable to the same governing record, facilitating precise audit queries without schema migration overhead.

**t_lift_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0001 | 0.624 |
| LIFT-0002 | LIFT-0001 | LIFT-0005 | 93.24 |
| LIFT-0003 | LIFT-0001 | LIFT-0007 | 541.29 |
| LIFT-0004 | LIFT-0002 | LIFT-0001 | 0.175 |
| LIFT-0005 | LIFT-0002 | LIFT-0005 | 180.41 |
| LIFT-0006 | LIFT-0002 | LIFT-0007 | 256.73 |
| LIFT-0007 | LIFT-0003 | LIFT-0001 | 0.866 |
| LIFT-0008 | LIFT-0003 | LIFT-0005 | 594.06 |

**t_lift_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| LIFT-0001 | LIFT-0001 | LIFT-0002 | Dimension Kind 01 |
| LIFT-0002 | LIFT-0001 | LIFT-0008 | Encoding 02 |
| LIFT-0003 | LIFT-0001 | LIFT-0009 | change rationale |
| LIFT-0004 | LIFT-0001 | LIFT-0010 | de |
| LIFT-0005 | LIFT-0001 | LIFT-0003 | manual |
| LIFT-0006 | LIFT-0001 | LIFT-0006 | m/s |
| LIFT-0007 | LIFT-0002 | LIFT-0002 | Dimension Kind 07 |
| LIFT-0008 | LIFT-0002 | LIFT-0008 | Encoding 08 |

Credential and presentation tracking operates on an analogous relational model, mapping individuals to specific roles and public-facing deliverables. Youngadultindividuals such as Chloe Tan, Lucas Fernandez, and Zara Okonkwo are formally linked to youngadultspeakerrole assignments—including Morales PolicyYouth, Ruiz OpenEdLead, Chen TEDx2023, and Tanaka YouthTech—which in turn dictate the educationalpresentation they are authorized to deliver. Presentations such as Ethical AI Governance or Open Source Licensing are explicitly tied to these role assignments, creating a verifiable chain of custody for public credentials. This dual-track tracking ensures that both system privileges and educational credentials are assignable, revocable, and fully documented within the operational ledger.

**t_young_adult_speaker_role**

| id | young_adult_speaker_role | qualifying_individual | delivers_presentation |
| --- | --- | --- | --- |
| ROLE-0001 | Morales PolicyYouth | Chloe Tan | Ethical AI Governance |
| ROLE-0002 | Ruiz OpenEdLead | Lucas Fernandez | Ethical AI Governance |
| ROLE-0003 | Chen TEDx2023 | Elena Rossi | Open Source Licensing |
| ROLE-0004 | Tanaka YouthTech | Zara Okonkwo | Ethical AI Governance |
| ROLE-0005 | Tanaka YouthTech | Zara Okonkwo | Cloud Cost Optimization |
| ROLE-0006 | Patel AIWorkshop | Zara Okonkwo | Neuroplasticity Learning |

The interplay between identifiers, typed attributes, and entity-valued records establishes a unified compliance architecture. When an administrator like admin_jchen or sysadmin_klee modifies a record tagged with metadata such as nightly summary or Encoding 04, the system logs the change against the underlying entity while preserving the original attribute type constraints. Similarly, when a speaker role is updated, the linkage to the qualifying individual and the delivered presentation remains intact across audit cycles. This design supports continuous access reviews, credential lifecycle management, and regulatory reporting without requiring ad-hoc data wrangling or fragile schema extensions.

**t_lift_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| LIFT-0001 | confidence | xsd:decimal |
| LIFT-0002 | dimension_kind | xsd:string |
| LIFT-0003 | method | xsd:string |
| LIFT-0004 | recorded_at | xsd:dateTime |
| LIFT-0005 | uncertainty | xsd:decimal |
| LIFT-0006 | unit | xsd:string |
| LIFT-0007 | value | xsd:decimal |
| LIFT-0008 | encoding | xsd:string |