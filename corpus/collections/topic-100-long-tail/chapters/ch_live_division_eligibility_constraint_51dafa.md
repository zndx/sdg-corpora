---
chapter_id: ch_live_division_eligibility_constraint_51dafa
topic_id: 100
family: 08_derived
cited_terms: ['division_eligibility_constraint', 'schema_revision_of', 'schemaorg_place_address']
model: engine-refine
---

Division eligibility constraints operate as the primary governance records, each identified by a stable code such as CONS-0001 through CONS-0004, and each encoding a composite policy decision that binds three dimensions of athletic eligibility into a single enforceable unit. The constraint itself—EasternLeagueNovice, MountainWestOpen, SouthernTierPro—defines the competitive tier to which an athlete must conform, while the qualified_athlete_status column (AccreditedVeteran, EndorsedFreshman, LicensedElite) specifies the credentialing pathway that grants standing within that tier. The cross_division_transfer field (CircuitReroute, ZoneRedistribution, SectorTransfer, LeagueBoundaryShift) captures the mechanism by which an athlete may move between tiers, whether through circuit reallocation, geographic zone adjustment, sector-level reassignment, or formal league boundary modification. Together these three policy columns form a tripartite eligibility matrix that can be queried to determine whether a given athlete satisfies the structural requirements of a division, holds the requisite credential, and possesses a valid transfer mechanism should inter-division movement become necessary.

**t_division_eligibility_constraint**

| id | division_eligibility_constraint | qualified_athlete_status | cross_division_transfer |
| --- | --- | --- | --- |
| CONS-0001 | EasternLeagueNovice | AccreditedVeteran | CircuitReroute |
| CONS-0002 | MountainWestOpen | AccreditedVeteran | ZoneRedistribution |
| CONS-0003 | MountainWestOpen | EndorsedFreshman | SectorTransfer |
| CONS-0004 | SouthernTierPro | LicensedElite | LeagueBoundaryShift |
| CONS-0005 | CentralStateSenior | ClearedAllStar | TierDowngrade |
| CONS-0006 | AtlanticZoneJunior | SanctionedContender | ConferenceSwitch |
| CONS-0007 | GreatLakesAmateur | CertifiedPro | ZoneRedistribution |

The attribute-value layer decouples metadata from the constraint records themselves, implementing an entity-attribute-value pattern that preserves schema flexibility without sacrificing referential integrity. The t_division_eligibility_constraint_attr table declares the available attribute dimensions—encoding, label_text, language—each typed as xsd:string, establishing a controlled vocabulary for supplementary constraint metadata. The t_division_eligibility_constraint_val_varchar table materializes these declarations by linking an entity_id (the constraint record) to an attr_id (the attribute definition) and assigning a concrete value such as Encoding 01, pre-release note, or fr. This three-table arrangement—constraint, attribute definition, attribute value—allows the system to attach arbitrary descriptive metadata to any constraint without altering the core schema. A single constraint like CONS-0001 may carry multiple attribute values simultaneously, each referencing a different attr_id, enabling rich annotation of eligibility policies with encoding specifications, human-readable labels, and localization metadata.

**t_division_eligibility_constraint_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | encoding | xsd:string |
| CONS-0002 | label_text | xsd:string |
| CONS-0003 | language | xsd:string |

**t_division_eligibility_constraint_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | pre-release note |
| CONS-0003 | CONS-0001 | CONS-0003 | fr |
| CONS-0004 | CONS-0002 | CONS-0001 | Encoding 04 |
| CONS-0005 | CONS-0002 | CONS-0002 | intake form |
| CONS-0006 | CONS-0002 | CONS-0003 | es |
| CONS-0007 | CONS-0003 | CONS-0001 | Encoding 07 |
| CONS-0008 | CONS-0003 | CONS-0002 | audit excerpt |

Schema revision tracking introduces a second, parallel governance domain that manages the lifecycle and provenance of data schemas themselves. The t_schema_revision_of table records individual revision events identified by codes such as REVI-0001 through REVI-0004, each associated with a named schema artifact—Royal Society, patient_vitals_schema, CERN Main Campus—representing the domain or system to which the revision pertains. The t_schema_revision_of_schema_revision_of table captures the lineage of each revision by referencing its predecessor, with values like legacy_compliance_log and legacy_network_record indicating the source systems from which schema definitions were migrated or inherited. This creates a versioned history that can be traversed to understand how a current schema definition evolved from earlier iterations, supporting audit requirements and change management workflows.

**t_schema_revision_of**

| id | schema |
| --- | --- |
| REVI-0001 | Royal Society |
| REVI-0002 | patient_vitals_schema |
| REVI-0003 | Royal Society |
| REVI-0004 | CERN Main Campus |
| REVI-0005 | api_gateway_routing |
| REVI-0006 | Federal Reserve Bank |
| REVI-0007 | compliance_audit_log |
| REVI-0008 | supply_chain_manifest |

**t_schema_revision_of_schema_revision_of**

| id | schema_revision_of |
| --- | --- |
| REVI-0001 | legacy_compliance_log |
| REVI-0002 | legacy_compliance_log |
| REVI-0003 | legacy_compliance_log |
| REVI-0004 | legacy_network_record |
| REVI-0005 | legacy_api_gateway |
| REVI-0006 | legacy_api_gateway |

The relationship tables between schema revisions and between schema.org addresses and postal addresses implement a role-labeled edge model that distinguishes not merely which entities are connected but in what capacity the connection exists. The t_schema_revision_of__schema_revision_of table links a schema_id to a schema_revision_of_id through a role column that takes values such as reviewer, contributor, or owner, thereby encoding the governance structure of the revision process itself. A single schema revision like REVI-0001 may have multiple outgoing relationships with different roles, indicating that one revision was reviewed by multiple parties, contributed to by others, and owned by a designated authority. Similarly, the t_schemaorg_place_address__postal_address table connects schema.org address records (financial_ledger_format, telemetry_stream_config, warehouse_event_log, ml_feature_registry) to postal addresses (700 1st Ave, 350 Fifth Ave, 2875 Broadway, 1000 Independence Ave) through role-labeled edges where the role column distinguishes between contributor and reviewer relationships. This role-labeled edge pattern ensures that the semantic meaning of each relationship is preserved as a first-class data element rather than being inferred from table structure alone.

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

**t_schemaorg_place_address**

| id | schemaorg |
| --- | --- |
| ADDR-0001 | financial_ledger_format |
| ADDR-0002 | telemetry_stream_config |
| ADDR-0003 | warehouse_event_log |
| ADDR-0004 | ml_feature_registry |
| ADDR-0005 | supply_chain_manifest |
| ADDR-0006 | Federal Reserve Bank |
| ADDR-0007 | Brookings Institution |

**t_schemaorg_place_address_postal_address**

| id | postal_address |
| --- | --- |
| ADDR-0001 | 700 1st Ave |
| ADDR-0002 | 350 Fifth Ave |
| ADDR-0003 | 2875 Broadway |
| ADDR-0004 | 1000 Independence Ave |
| ADDR-0005 | 1 Infinite Loop |
| ADDR-0006 | 1000 Independence Ave |

**t_schemaorg_place_address__postal_address**

| id | schemaorg_id | postal_address_id | role |
| --- | --- | --- | --- |
| ADDR-0001 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0002 | ADDR-0004 | ADDR-0001 | contributor |
| ADDR-0003 | ADDR-0001 | ADDR-0006 | reviewer |
| ADDR-0004 | ADDR-0001 | ADDR-0003 | contributor |
| ADDR-0005 | ADDR-0002 | ADDR-0005 | observer |
| ADDR-0006 | ADDR-0004 | ADDR-0005 | contributor |
| ADDR-0007 | ADDR-0004 | ADDR-0003 | owner |
| ADDR-0008 | ADDR-0003 | ADDR-0001 | observer |