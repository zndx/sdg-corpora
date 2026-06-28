---
chapter_id: ch_live_crop_parasitism_impact_b589a5
topic_id: 125
family: 08_derived
cited_terms: ['crop_parasitism_impact', 'attestation_signed_by', 'agent_with_role']
model: engine-refine
---

Within the agricultural parasitism impact domain, each impact event is anchored by a unique identifier such as IMPA-0001 through IMPA-0004, with each identifier carrying a human-readable label like Crop Parasitism Impact 01. These identifiers serve as the primary key for a set of relationship tables that model how parasitism impacts propagate through the agricultural ecosystem. An impact may affect a rice cultivation system—recorded as Affects Cultivation System 01 through 04—where the association is mediated by a junction table that assigns a role, typically owner, to the relationship. For instance, IMPA-0001 and IMPA-0002 both exercise an owner role over the cultivation system designated IMPA-0006, while IMPA-0002 additionally assumes ownership of IMPA-0002, illustrating that a single impact can bear multiple relationships to distinct cultivation systems.

**t_crop_parasitism_impact**

| id | crop_parasitism_impact |
| --- | --- |
| IMPA-0001 | Crop Parasitism Impact 01 |
| IMPA-0002 | Crop Parasitism Impact 02 |
| IMPA-0003 | Crop Parasitism Impact 03 |
| IMPA-0004 | Crop Parasitism Impact 04 |
| IMPA-0005 | Crop Parasitism Impact 05 |
| IMPA-0006 | Crop Parasitism Impact 06 |

**t_crop_parasitism_impact_affects_cultivation_system**

| id | affects_cultivation_system |
| --- | --- |
| IMPA-0001 | Affects Cultivation System 01 |
| IMPA-0002 | Affects Cultivation System 02 |
| IMPA-0003 | Affects Cultivation System 03 |
| IMPA-0004 | Affects Cultivation System 04 |
| IMPA-0005 | Affects Cultivation System 05 |
| IMPA-0006 | Affects Cultivation System 06 |
| IMPA-0007 | Affects Cultivation System 07 |
| IMPA-0008 | Affects Cultivation System 08 |

**t_crop_parasitism_impact__affects_cultivation_system**

| id | crop_id | affects_cultivation_system_id | role |
| --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0006 | owner |
| IMPA-0002 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0003 | IMPA-0002 | IMPA-0002 | owner |
| IMPA-0004 | IMPA-0001 | IMPA-0006 | owner |
| IMPA-0005 | IMPA-0001 | IMPA-0001 | reviewer |
| IMPA-0006 | IMPA-0004 | IMPA-0007 | contributor |
| IMPA-0007 | IMPA-0002 | IMPA-0003 | observer |
| IMPA-0008 | IMPA-0002 | IMPA-0003 | reviewer |

**t_crop_parasitism_impact_impacts_target**

| id | impacts_target |
| --- | --- |
| IMPA-0001 | Impacts Target 01 |
| IMPA-0002 | Impacts Target 02 |
| IMPA-0003 | Impacts Target 03 |
| IMPA-0004 | Impacts Target 04 |
| IMPA-0005 | Impacts Target 05 |
| IMPA-0006 | Impacts Target 06 |

The parasitism impact domain further models the biological relationship between an impact and its parasitic host. The table t_crop_parasitism_impact_parasitises_host enumerates host designations such as Parasitises Host 01 through 04, while the corresponding junction table t_crop_parasitism_impact__parasitises_host establishes the directed link between a subject impact and a target host, annotating each link with a role and a cardinality note. In practice, IMPA-0004 assumes the role of contributor to host IMPA-0003 under Cardinality Note 01, whereas IMPA-0001 acts as an observer of host IMPA-0007 under Cardinality Note 04. The role dimension—contributor versus observer—distinguishes whether the impact actively participates in the parasitism or merely monitors it, and the cardinality note provides supplementary constraint information for each directed edge.

**t_crop_parasitism_impact_parasitises_host**

| id | parasitises_host |
| --- | --- |
| IMPA-0001 | Parasitises Host 01 |
| IMPA-0002 | Parasitises Host 02 |
| IMPA-0003 | Parasitises Host 03 |
| IMPA-0004 | Parasitises Host 04 |
| IMPA-0005 | Parasitises Host 05 |
| IMPA-0006 | Parasitises Host 06 |
| IMPA-0007 | Parasitises Host 07 |

**t_crop_parasitism_impact__parasitises_host**

| id | crop_id | parasitises_host_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0004 | IMPA-0003 | contributor | Cardinality Note 01 |
| IMPA-0002 | IMPA-0006 | IMPA-0001 | observer | Cardinality Note 02 |
| IMPA-0003 | IMPA-0005 | IMPA-0004 | contributor | Cardinality Note 03 |
| IMPA-0004 | IMPA-0001 | IMPA-0007 | observer | Cardinality Note 04 |
| IMPA-0005 | IMPA-0001 | IMPA-0003 | reviewer | Cardinality Note 05 |
| IMPA-0006 | IMPA-0006 | IMPA-0002 | contributor | Cardinality Note 06 |
| IMPA-0007 | IMPA-0004 | IMPA-0005 | observer | Cardinality Note 07 |
| IMPA-0008 | IMPA-0004 | IMPA-0002 | reviewer | Cardinality Note 08 |

Agricultural households constitute the third major target of parasitism impacts. The table t_crop_parasitism_impact_impacts_target records designations such as Impacts Target 01 through 04, and the junction table t_crop_parasitism_impact__impacts_target binds a subject impact to a target household with a role, a cardinality note, and a temporal since attribute. IMPA-0002 and IMPA-0003 both affect household IMPA-0004, with IMPA-0002 acting as observer since 2024-06-04 and IMPA-0003 acting as owner since 2023-10-26. IMPA-0003 also affects household IMPA-0002 as an observer since 2023-09-02. The since attribute anchors each relationship to a point in time, enabling temporal queries about when a particular impact began affecting a given household, while the role and cardinality note continue to classify the nature of the association.

**t_crop_parasitism_impact__impacts_target**

| id | crop_id | impacts_target_id | role | cardinality_note | since |
| --- | --- | --- | --- | --- | --- |
| IMPA-0001 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 01 | 2024-06-04 |
| IMPA-0002 | IMPA-0006 | IMPA-0004 | reviewer | Cardinality Note 02 | 2023-03-28 |
| IMPA-0003 | IMPA-0003 | IMPA-0002 | observer | Cardinality Note 03 | 2023-09-02 |
| IMPA-0004 | IMPA-0003 | IMPA-0002 | owner | Cardinality Note 04 | 2023-10-26 |
| IMPA-0005 | IMPA-0002 | IMPA-0004 | observer | Cardinality Note 05 | 2023-11-01 |
| IMPA-0006 | IMPA-0002 | IMPA-0001 | observer | Cardinality Note 06 | 2023-08-27 |
| IMPA-0007 | IMPA-0001 | IMPA-0005 | contributor | Cardinality Note 07 | 2025-05-05 |
| IMPA-0008 | IMPA-0003 | IMPA-0001 | contributor | Cardinality Note 08 | 2024-10-30 |

Beyond the parasitism impact domain, the schema supports an attestation framework for recording signed certifications. The table t_attestation_signed_by enumerates attestation types including System Access Certification, Data Lineage Certification, and Privacy Impact Assessment, each identified by a SIGN- prefixed key. Attribute definitions for these attestations are stored in t_attestation_signed_by_attr, which specifies attribute names such as duration_seconds, end_time, exit_code, and host_name alongside their XML Schema types—xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string respectively. Values are distributed across four type-specific tables: t_attestation_signed_by_val_decimal stores numeric values like 2368.11 and 5757.34; t_attestation_signed_by_val_datetime stores timestamps such as 2023-11-18T17:18:55 and 2025-06-04T16:32:01; t_attestation_signed_by_val_int stores integers including 407 and 633; and t_attestation_signed_by_val_varchar stores string values like gw-12, closeout, and pending. Each value row references its entity and attribute through foreign keys, enabling a normalized, type-safe representation of heterogeneous attestation metadata.

**t_attestation_signed_by**

| id | attestation |
| --- | --- |
| SIGN-0001 | System Access Certification |
| SIGN-0002 | Data Lineage Certification |
| SIGN-0003 | Privacy Impact Assessment |
| SIGN-0004 | System Access Certification |
| SIGN-0005 | Data Lineage Certification |
| SIGN-0006 | Model Performance Signoff |

**t_attestation_signed_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SIGN-0001 | duration_seconds | xsd:decimal |
| SIGN-0002 | end_time | xsd:dateTime |
| SIGN-0003 | exit_code | xsd:integer |
| SIGN-0004 | host_name | xsd:string |
| SIGN-0005 | log_level | xsd:string |
| SIGN-0006 | phase | xsd:string |
| SIGN-0007 | retry_count | xsd:integer |
| SIGN-0008 | scheduled_at | xsd:dateTime |

**t_attestation_signed_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0002 | 2023-11-18T17:18:55 |
| SIGN-0002 | SIGN-0001 | SIGN-0008 | 2024-04-18T06:27:25 |
| SIGN-0003 | SIGN-0001 | SIGN-0009 | 2023-01-19T17:50:39 |
| SIGN-0004 | SIGN-0002 | SIGN-0002 | 2025-06-04T16:32:01 |
| SIGN-0005 | SIGN-0002 | SIGN-0008 | 2025-04-02T11:15:56 |
| SIGN-0006 | SIGN-0002 | SIGN-0009 | 2023-07-13T05:58:46 |
| SIGN-0007 | SIGN-0003 | SIGN-0002 | 2023-10-19T08:02:32 |
| SIGN-0008 | SIGN-0003 | SIGN-0008 | 2025-01-01T00:25:23 |

**t_attestation_signed_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0001 | 2368.11 |
| SIGN-0002 | SIGN-0002 | SIGN-0001 | 5757.34 |
| SIGN-0003 | SIGN-0003 | SIGN-0001 | 785.50 |
| SIGN-0004 | SIGN-0004 | SIGN-0001 | 5676.02 |
| SIGN-0005 | SIGN-0005 | SIGN-0001 | 992.24 |
| SIGN-0006 | SIGN-0006 | SIGN-0001 | 815.51 |

**t_attestation_signed_by_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0003 | 407 |
| SIGN-0002 | SIGN-0001 | SIGN-0007 | 30 |
| SIGN-0003 | SIGN-0002 | SIGN-0003 | 633 |
| SIGN-0004 | SIGN-0002 | SIGN-0007 | 373 |
| SIGN-0005 | SIGN-0003 | SIGN-0003 | 166 |
| SIGN-0006 | SIGN-0003 | SIGN-0007 | 260 |
| SIGN-0007 | SIGN-0004 | SIGN-0003 | 596 |
| SIGN-0008 | SIGN-0004 | SIGN-0007 | 36 |

**t_attestation_signed_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SIGN-0001 | SIGN-0001 | SIGN-0004 | gw-12 |
| SIGN-0002 | SIGN-0001 | SIGN-0005 | Log Level 02 |
| SIGN-0003 | SIGN-0001 | SIGN-0006 | closeout |
| SIGN-0004 | SIGN-0001 | SIGN-0010 | pending |
| SIGN-0005 | SIGN-0001 | SIGN-0011 | Triggered By 05 |
| SIGN-0006 | SIGN-0002 | SIGN-0004 | worker-07 |
| SIGN-0007 | SIGN-0002 | SIGN-0005 | Log Level 07 |
| SIGN-0008 | SIGN-0002 | SIGN-0006 | review |

The agent dimension is captured through a star-schema pattern comprising fact_agent and dim_agent_role. The fact table records individual agent instances identified by ROLE- prefixed keys, each associated with an agent_role_key that references the dimension table. Agent instances vary substantially in size_bytes—from 20883723 to 548859900—and carry version numbers ranging from 1 to 12. The dimension table dim_agent_role provides the semantic labels and categories for agent roles, with entries such as Agent Role Label 01 classified under Agent Role Category 01. The fact table's agent_role_key column may reference the same dimension entry across multiple facts, as evidenced by ROLE-0006 appearing for both ROLE-0002 and ROLE-0003, indicating that distinct agent instances can share an identical role classification.

**fact_agent**

| id | agent_role_key | size_bytes | version |
| --- | --- | --- | --- |
| ROLE-0001 | ROLE-0005 | 211345771 | 7 |
| ROLE-0002 | ROLE-0006 | 458577289 | 1 |
| ROLE-0003 | ROLE-0006 | 548859900 | 1 |
| ROLE-0004 | ROLE-0005 | 20883723 | 12 |
| ROLE-0005 | ROLE-0003 | 490849751 | 11 |

**dim_agent_role**

| id | agent_role_label | agent_role_category |
| --- | --- | --- |
| ROLE-0001 | Agent Role Label 01 | Agent Role Category 01 |
| ROLE-0002 | Agent Role Label 02 | Agent Role Category 02 |
| ROLE-0003 | Agent Role Label 03 | Agent Role Category 03 |
| ROLE-0004 | Agent Role Label 04 | Agent Role Category 04 |
| ROLE-0005 | Agent Role Label 05 | Agent Role Category 05 |
| ROLE-0006 | Agent Role Label 06 | Agent Role Category 06 |
| ROLE-0007 | Agent Role Label 07 | Agent Role Category 07 |