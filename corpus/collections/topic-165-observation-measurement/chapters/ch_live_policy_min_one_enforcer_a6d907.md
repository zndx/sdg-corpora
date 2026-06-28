---
chapter_id: ch_live_policy_min_one_enforcer_a6d907
topic_id: 165
family: 03_directive_governance
cited_terms: ['policy_min_one_enforcer', 'directive_supersedes_directive', 'evidence_independent_or_correlated']
model: engine-refine
---

The identifier serves as the immutable anchor of every record, a stable handle that survives attribute mutation, entity reclassification, and cross-referencing across tables. In the enforcement registry, identifiers such as ENFO-0001 through ENFO-0004 uniquely tag policy records whose content ranges from ISO 27001 Data Handling to NIST SP 800-53; in the directive lineage, DIRE-0001 through DIRE-0004 anchor entries whose directive column carries values like HIPAA Safe Harbor and ISO 9001:2015; and in the evidence ledger, CORR-0001 through CORR-0004 identify records whose evidence columns enumerate provenance-chain hashes, telemetry streams, and audit trails. The identifier is never reused, never null, and never derived from business content — it is the surrogate key that permits every other column to reference a single, unambiguous row.

An entity is the conceptual object that the identifier names and that the attribute-value machinery describes. The entity table (t_directive_supersedes_directive, t_evidence_independent_or_correlated) holds the core business columns — directive names, evidence types — while the entity's mutable characteristics are pushed out into a family of value tables. The entity_id column in each value table is a foreign key back to the entity's identifier, ensuring that every stored value can be traced to exactly one entity. For example, the boolean value true in t_directive_supersedes_directive_val_boolean belongs to entity DIRE-0001, and the datetime 2024-06-09T05:47:42 in t_evidence_independent_or_correlated_val_datetime belongs to entity CORR-0001. The entity is the pivot around which the entire attribute-value schema rotates.

**t_directive_supersedes_directive**

| id | directive |
| --- | --- |
| DIRE-0001 | HIPAA Safe Harbor |
| DIRE-0002 | HIPAA Safe Harbor |
| DIRE-0003 | ISO 27001:2022 |
| DIRE-0004 | ISO 9001:2015 |
| DIRE-0005 | SOC 2 Type II Controls |
| DIRE-0006 | ISO 27001:2022 |
| DIRE-0007 | HIPAA Privacy Rule |
| DIRE-0008 | ISO 27001:2022 |

**t_directive_supersedes_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | effective_date | xsd:date |
| DIRE-0002 | enforcement | xsd:string |
| DIRE-0003 | mandatory | xsd:boolean |
| DIRE-0004 | priority | xsd:integer |
| DIRE-0005 | review_cycle_days | xsd:integer |
| DIRE-0006 | scope | xsd:string |
| DIRE-0007 | encoding | xsd:string |
| DIRE-0008 | label_text | xsd:string |

**t_directive_supersedes_directive_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0003 | true |
| DIRE-0002 | DIRE-0002 | DIRE-0003 | false |
| DIRE-0003 | DIRE-0003 | DIRE-0003 | true |
| DIRE-0004 | DIRE-0004 | DIRE-0003 | false |
| DIRE-0005 | DIRE-0005 | DIRE-0003 | false |
| DIRE-0006 | DIRE-0006 | DIRE-0003 | false |
| DIRE-0007 | DIRE-0007 | DIRE-0003 | false |
| DIRE-0008 | DIRE-0008 | DIRE-0003 | true |

**t_directive_supersedes_directive_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 2024-04-11 |
| DIRE-0002 | DIRE-0002 | DIRE-0001 | 2024-01-18 |
| DIRE-0003 | DIRE-0003 | DIRE-0001 | 2023-05-24 |
| DIRE-0004 | DIRE-0004 | DIRE-0001 | 2023-10-24 |
| DIRE-0005 | DIRE-0005 | DIRE-0001 | 2024-12-26 |
| DIRE-0006 | DIRE-0006 | DIRE-0001 | 2025-05-10 |
| DIRE-0007 | DIRE-0007 | DIRE-0001 | 2025-05-06 |
| DIRE-0008 | DIRE-0008 | DIRE-0001 | 2024-01-25 |

**t_directive_supersedes_directive_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 436 |
| DIRE-0003 | DIRE-0002 | DIRE-0004 | 3 |
| DIRE-0004 | DIRE-0002 | DIRE-0005 | 990 |
| DIRE-0005 | DIRE-0003 | DIRE-0004 | 2 |
| DIRE-0006 | DIRE-0003 | DIRE-0005 | 360 |
| DIRE-0007 | DIRE-0004 | DIRE-0004 | 4 |
| DIRE-0008 | DIRE-0004 | DIRE-0005 | 588 |

**t_directive_supersedes_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0007 | Encoding 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0002 | Enforcement 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0008 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0009 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0006 | Scope 05 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | Encoding 06 |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Enforcement 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | nightly summary |

**t_evidence_independent_or_correlated**

| id | evidence | evidence_2 | evidence_3 |
| --- | --- | --- | --- |
| CORR-0001 | Provenance-Chain-Hash | Metrics-Pool-Index | Provenance-Node-Hash |
| CORR-0002 | Metrics-Cache-Ref | Provenance-Chain-Hash | Telemetry-Stream-Alpha |
| CORR-0003 | Provenance-Leaf-Node | Telemetry-Stream-Alpha | Telemetry-Stream-Alpha |
| CORR-0004 | Independent-Array-Trace | Quarterly-Audit-Trail | Governance-Verification-File |
| CORR-0005 | Independent-Sensor-Trace | Observation-Grid-Fourteen | Governance-Compliance-Report |
| CORR-0006 | Quarterly-Audit-Trail | Metrics-Bucket-Index | Correlation-Stream-Gamma |

**t_evidence_independent_or_correlated_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CORR-0001 | confidence | xsd:decimal |
| CORR-0002 | dimension_kind | xsd:string |
| CORR-0003 | method | xsd:string |
| CORR-0004 | recorded_at | xsd:dateTime |
| CORR-0005 | uncertainty | xsd:decimal |
| CORR-0006 | unit | xsd:string |
| CORR-0007 | value | xsd:decimal |
| CORR-0008 | encoding | xsd:string |

**t_evidence_independent_or_correlated_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0004 | 2024-06-09T05:47:42 |
| CORR-0002 | CORR-0002 | CORR-0004 | 2023-11-11T17:14:05 |
| CORR-0003 | CORR-0003 | CORR-0004 | 2023-01-17T16:04:18 |
| CORR-0004 | CORR-0004 | CORR-0004 | 2024-01-18T01:21:21 |
| CORR-0005 | CORR-0005 | CORR-0004 | 2025-02-19T18:21:28 |
| CORR-0006 | CORR-0006 | CORR-0004 | 2023-04-21T22:33:15 |

**t_evidence_independent_or_correlated_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0002 | Dimension Kind 01 |
| CORR-0002 | CORR-0001 | CORR-0008 | Encoding 02 |
| CORR-0003 | CORR-0001 | CORR-0009 | intake form |
| CORR-0004 | CORR-0001 | CORR-0010 | en |
| CORR-0005 | CORR-0001 | CORR-0003 | hybrid |
| CORR-0006 | CORR-0001 | CORR-0006 | kg |
| CORR-0007 | CORR-0002 | CORR-0002 | Dimension Kind 07 |
| CORR-0008 | CORR-0002 | CORR-0008 | Encoding 08 |

The attribute — stored as attr_name in the attribute definition tables — is the semantic label applied to a characteristic of the entity. The attribute definition table (t_directive_supersedes_directive_attr, t_evidence_independent_or_correlated_attr) pairs each attr_name with an attr_type, establishing the schema for all values that will flow through the system. In the directive domain, attr_name values include effective_date, enforcement, mandatory, and priority; in the evidence domain, they include confidence, dimension_kind, method, and recorded_at. The attr_type column constrains the domain of permissible values to XSD types — xsd:date, xsd:string, xsd:boolean, xsd:integer, xsd:decimal, xsd:dateTime — and the value tables are partitioned by type so that each table stores only one kind of misc column content. The attr_id column in each value table is a foreign key into the attribute definition table, linking a concrete value back to its semantic label and type constraint.

**t_evidence_independent_or_correlated_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CORR-0001 | CORR-0001 | CORR-0001 | 0.175 |
| CORR-0002 | CORR-0001 | CORR-0005 | 667.59 |
| CORR-0003 | CORR-0001 | CORR-0007 | 420.06 |
| CORR-0004 | CORR-0002 | CORR-0001 | 0.415 |
| CORR-0005 | CORR-0002 | CORR-0005 | 386.38 |
| CORR-0006 | CORR-0002 | CORR-0007 | 519.11 |
| CORR-0007 | CORR-0003 | CORR-0001 | 0.685 |
| CORR-0008 | CORR-0003 | CORR-0005 | 275.29 |

The misc column is the generic value carrier in every value table, typed by the table itself rather than by a column-level declaration. In t_directive_supersedes_directive_val_boolean, misc holds true and false; in t_directive_supersedes_directive_val_date, it holds dates such as 2024-04-11 and 2023-05-24; in t_directive_supersedes_directive_val_int, it holds integers like 436 and 990; in t_directive_supersedes_directive_val_varchar, it holds strings such as Encoding 01 and audit excerpt. Similarly, the evidence value tables store decimals (0.175, 667.59), datetimes (2023-11-11T17:14:05), and varchars (intake form, en) in their respective misc columns. This type-partitioned design eliminates the need for nullable columns and type-checking at query time, at the cost of a wider but shallower schema.

The junction table t_policy_min_one_enforcer__enforced_by introduces the role, subject, and target triad that governs many-to-many relationships between policies and enforcers. The policy_id column is the subject — the entity on the left side of the relationship — and the enforced_by_id column is the target — the entity on the right side. The role column disambiguates the relationship, taking values such as contributor, observer, and owner to indicate the capacity in which the target participates with respect to the subject. For instance, the record with id ENFO-0003 links policy ENFO-0005 to enforcer ENFO-0004 with role owner, while the record with id ENFO-0001 links policy ENFO-0005 to enforcer ENFO-0002 with role contributor. The identifier column on the junction table itself provides a stable handle for the relationship instance, independent of the subject-target pair.

**t_policy_min_one_enforcer**

| id | policy |
| --- | --- |
| ENFO-0001 | ISO 27001 Data Handling |
| ENFO-0002 | ISO 27001:2022 |
| ENFO-0003 | ISO 13485 QMS |
| ENFO-0004 | NIST SP 800-53 |
| ENFO-0005 | ISO 27001:2022 |
| ENFO-0006 | EU AI Act Risk Management |

**t_policy_min_one_enforcer_enforced_by**

| id | enforced_by |
| --- | --- |
| ENFO-0001 | Regulatory Affairs Division |
| ENFO-0002 | Compliance Audit Board |
| ENFO-0003 | Privacy Officer |
| ENFO-0004 | Data Stewardship Council |
| ENFO-0005 | Automated Policy Engine |
| ENFO-0006 | Risk Management Committee |

**t_policy_min_one_enforcer__enforced_by**

| id | policy_id | enforced_by_id | role |
| --- | --- | --- | --- |
| ENFO-0001 | ENFO-0005 | ENFO-0002 | contributor |
| ENFO-0002 | ENFO-0004 | ENFO-0002 | observer |
| ENFO-0003 | ENFO-0005 | ENFO-0004 | owner |
| ENFO-0004 | ENFO-0005 | ENFO-0003 | contributor |
| ENFO-0005 | ENFO-0003 | ENFO-0001 | contributor |
| ENFO-0006 | ENFO-0002 | ENFO-0004 | reviewer |
| ENFO-0007 | ENFO-0004 | ENFO-0003 | owner |
| ENFO-0008 | ENFO-0001 | ENFO-0002 | reviewer |