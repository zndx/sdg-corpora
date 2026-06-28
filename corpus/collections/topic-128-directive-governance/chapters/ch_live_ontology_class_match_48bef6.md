---
chapter_id: ch_live_ontology_class_match_48bef6
topic_id: 128
family: 07_long_tail
cited_terms: ['ontology_class_match', 'artifact_not_revoked', 'policy_equiv_jurisdiction_and_scope']
model: engine-refine
---

Ontology matching operates as a confidence-weighted alignment mechanism, where each fact record carries an identifier—MATC-0001 through MATC-0004—and a reference to a matched ontology class, scored by a confidence value ranging from 0.272 to 0.829 and an uncertainty measure spanning 27.88 to 688.77. The matched class itself is resolved through a dimension table that supplies a human-readable label, such as Matches Ontology Class Label 01, and a category designation like Matches Ontology Class Category 01, enabling downstream systems to classify and filter matches by semantic group. The value column stores the raw observation—237.27, 381.96, 882.98, 768.24—while the confidence and uncertainty fields together quantify the reliability of the alignment, allowing governance workflows to apply threshold-based filtering or manual review for low-confidence associations.

**fact_ontology**

| id | matches_ontology_class_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MATC-0001 | MATC-0008 | 0.796 | 236.57 | 237.27 |
| MATC-0002 | MATC-0002 | 0.272 | 112.66 | 381.96 |
| MATC-0003 | MATC-0008 | 0.829 | 27.88 | 882.98 |
| MATC-0004 | MATC-0008 | 0.584 | 688.77 | 768.24 |
| MATC-0005 | MATC-0003 | 0.900 | 848.34 | 62.60 |
| MATC-0006 | MATC-0005 | 0.038 | 1.40 | 737.81 |
| MATC-0007 | MATC-0001 | 0.986 | 660.49 | 169.21 |
| MATC-0008 | MATC-0004 | 0.900 | 507.89 | 697.45 |

**dim_matches_ontology_class**

| id | matches_ontology_class_label | matches_ontology_class_category |
| --- | --- | --- |
| MATC-0001 | Matches Ontology Class Label 01 | Matches Ontology Class Category 01 |
| MATC-0002 | Matches Ontology Class Label 02 | Matches Ontology Class Category 02 |
| MATC-0003 | Matches Ontology Class Label 03 | Matches Ontology Class Category 03 |
| MATC-0004 | Matches Ontology Class Label 04 | Matches Ontology Class Category 04 |
| MATC-0005 | Matches Ontology Class Label 05 | Matches Ontology Class Category 05 |
| MATC-0006 | Matches Ontology Class Label 06 | Matches Ontology Class Category 06 |
| MATC-0007 | Matches Ontology Class Label 07 | Matches Ontology Class Category 07 |
| MATC-0008 | Matches Ontology Class Label 08 | Matches Ontology Class Category 08 |

Artifact provenance is modeled through a three-tier attribute-value architecture that separates entity definitions, attribute schemas, and typed value stores. Each artifact—identified by a key such as REVO-0001 and named audit-log-sept, compliance-report-x, schema-def-current, or dataset-sanitized—carries attributes defined in a schema table where attr_name specifies the property (checksum, created_date, identifier, license) and attr_type declares its semantic type (xsd:string, xsd:date, cco:DesignativeICE). Values are partitioned by type into dedicated tables: varchar values like c0ffee42, ref-8842, Apache-2.0, and rack-7; integer values such as 140, 2, 115, and 2; and date values including 2024-01-18, 2023-09-26, 2023-01-26, and 2024-08-03. The entity_id column in each value table serves as the foreign key linking back to the artifact, while attr_id references the attribute definition, creating a normalized star schema that supports type-safe querying without sacrificing extensibility.

**t_artifact_not_revoked**

| id | artifact | artifact_2 |
| --- | --- | --- |
| REVO-0001 | audit-log-sept | backup-manifest-9 |
| REVO-0002 | compliance-report-x | inference-pipeline-3 |
| REVO-0003 | schema-def-current | backup-manifest-9 |
| REVO-0004 | dataset-sanitized | runtime-env-prod |
| REVO-0005 | audit-log-sept | backup-manifest-9 |
| REVO-0006 | compliance-report-x | staging-logs-v2 |

**t_artifact_not_revoked_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| REVO-0001 | checksum | xsd:string |
| REVO-0002 | created_date | xsd:date |
| REVO-0003 | identifier | cco:DesignativeICE |
| REVO-0004 | license | xsd:string |
| REVO-0005 | mime_type | xsd:string |
| REVO-0006 | size_bytes | xsd:long |
| REVO-0007 | uri | xsd:string |
| REVO-0008 | version | xsd:integer |

**t_artifact_not_revoked_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0002 | 2024-01-18 |
| REVO-0002 | REVO-0002 | REVO-0002 | 2023-09-26 |
| REVO-0003 | REVO-0003 | REVO-0002 | 2023-01-26 |
| REVO-0004 | REVO-0004 | REVO-0002 | 2024-08-03 |
| REVO-0005 | REVO-0005 | REVO-0002 | 2024-04-14 |
| REVO-0006 | REVO-0006 | REVO-0002 | 2023-07-20 |

**t_artifact_not_revoked_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0006 | 140 |
| REVO-0002 | REVO-0001 | REVO-0008 | 2 |
| REVO-0003 | REVO-0002 | REVO-0006 | 115 |
| REVO-0004 | REVO-0002 | REVO-0008 | 2 |
| REVO-0005 | REVO-0003 | REVO-0006 | 293 |
| REVO-0006 | REVO-0003 | REVO-0008 | 12 |
| REVO-0007 | REVO-0004 | REVO-0006 | 361 |
| REVO-0008 | REVO-0004 | REVO-0008 | 1 |

**t_artifact_not_revoked_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| REVO-0001 | REVO-0001 | REVO-0001 | c0ffee42 |
| REVO-0002 | REVO-0001 | REVO-0003 | ref-8842 |
| REVO-0003 | REVO-0001 | REVO-0004 | Apache-2.0 |
| REVO-0004 | REVO-0001 | REVO-0009 | rack-7 |
| REVO-0005 | REVO-0001 | REVO-0005 | text/plain |
| REVO-0006 | REVO-0001 | REVO-0010 | Name 06 |
| REVO-0007 | REVO-0001 | REVO-0011 | analytics |
| REVO-0008 | REVO-0001 | REVO-0012 | Tags 08 |

Policy equivalence and jurisdictional scope are expressed through bipartite relationship tables that encode subject-target associations with an explicit role and, in the case of scope governance, a cardinality note. A policy such as AI Model Training, Personal Data Processing, Supply Chain Logistics, or Third Party Vendors is linked to a jurisdiction—FDA 21 CFR 11, UK Information Commissioner, Industrial Control Systems, CCPA—through a junction table where the role field designates the nature of the relationship, taking values like contributor or observer. The same pattern applies to scope governance: policies are connected to governing scopes such as Basel III, CCPA, Massachusetts Privacy Board, and NIST 800-53 via a relationship table that carries both a role (contributor, observer, reviewer) and a cardinality note (Cardinality Note 01 through Cardinality Note 04), which constrains or describes the multiplicity of the association. The subject column (policy_id) and target column (jurisdiction_id or governs_scope_id) together form the directional edge of the relationship, while the role and cardinality_note columns enrich the edge with semantic and structural metadata, enabling precise reasoning about which policies are governed by which frameworks and under what conditions.

**t_policy_equiv_jurisdiction_and_scope**

| id | policy |
| --- | --- |
| SCOP-0001 | AI Model Training |
| SCOP-0002 | Personal Data Processing |
| SCOP-0003 | Supply Chain Logistics |
| SCOP-0004 | Third Party Vendors |
| SCOP-0005 | Cross Border Transfers |
| SCOP-0006 | European Commission |

**t_policy_equiv_jurisdiction_and_scope_jurisdiction**

| id | jurisdiction |
| --- | --- |
| SCOP-0001 | FDA 21 CFR 11 |
| SCOP-0002 | UK Information Commissioner |
| SCOP-0003 | Industrial Control Systems |
| SCOP-0004 | CCPA |
| SCOP-0005 | UK Information Commissioner |
| SCOP-0006 | National Institute of Standards |

**t_policy_equiv_jurisdiction_and_scope__jurisdiction**

| id | policy_id | jurisdiction_id | role |
| --- | --- | --- | --- |
| SCOP-0001 | SCOP-0001 | SCOP-0002 | contributor |
| SCOP-0002 | SCOP-0001 | SCOP-0001 | observer |
| SCOP-0003 | SCOP-0001 | SCOP-0002 | observer |
| SCOP-0004 | SCOP-0002 | SCOP-0006 | owner |
| SCOP-0005 | SCOP-0003 | SCOP-0005 | contributor |
| SCOP-0006 | SCOP-0004 | SCOP-0002 | owner |
| SCOP-0007 | SCOP-0006 | SCOP-0001 | reviewer |
| SCOP-0008 | SCOP-0001 | SCOP-0006 | reviewer |

**t_policy_equiv_jurisdiction_and_scope_governs_scope**

| id | governs_scope |
| --- | --- |
| SCOP-0001 | Basel III |
| SCOP-0002 | CCPA |
| SCOP-0003 | Massachusetts Privacy Board |
| SCOP-0004 | NIST 800-53 |
| SCOP-0005 | EU AI Act |
| SCOP-0006 | EU AI Act |
| SCOP-0007 | Securities Exchange Commission |

**t_policy_equiv_jurisdiction_and_scope__governs_scope**

| id | policy_id | governs_scope_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| SCOP-0001 | SCOP-0003 | SCOP-0003 | contributor | Cardinality Note 01 |
| SCOP-0002 | SCOP-0004 | SCOP-0007 | contributor | Cardinality Note 02 |
| SCOP-0003 | SCOP-0005 | SCOP-0002 | observer | Cardinality Note 03 |
| SCOP-0004 | SCOP-0002 | SCOP-0002 | reviewer | Cardinality Note 04 |
| SCOP-0005 | SCOP-0002 | SCOP-0002 | owner | Cardinality Note 05 |
| SCOP-0006 | SCOP-0005 | SCOP-0001 | observer | Cardinality Note 06 |
| SCOP-0007 | SCOP-0003 | SCOP-0007 | observer | Cardinality Note 07 |
| SCOP-0008 | SCOP-0006 | SCOP-0006 | contributor | Cardinality Note 08 |