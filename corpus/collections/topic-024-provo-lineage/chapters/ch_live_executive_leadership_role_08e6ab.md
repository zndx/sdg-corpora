---
chapter_id: ch_live_executive_leadership_role_08e6ab
topic_id: 24
family: 08_derived
cited_terms: ['executive_leadership_role', 'dataset_was_attributed_to', 'aggregation_grouped_by']
model: engine-refine
---

Within the governance framework, executive leadership roles are formalized as discrete entities identified by codes such as ROLE-0001 through ROLE-0004, each encoding a specific position—Chief Technology Officer, Chief Operating Officer, and Chief Revenue Officer—alongside its reporting lineage and team affiliations. The reporting structure is captured through a self-referential relationship: the Chief Technology Officer reports to the Managing Director, the Chief Operating Officer to the Executive Office, and both the Chief Revenue Officer entries report to the Managing Director and CEO Office respectively, reflecting a matrixed organizational design. Membership in governing bodies is equally explicit, with roles assigned to the Board Advisory Group or the C-Suite, establishing clear lines of accountability and decision authority. This role taxonomy provides the organizational scaffolding against which data provenance and attribution are later assessed.

Dataset facts are tracked through identifiers such as ATTR-0001 through ATTR-0004, each carrying a measured size in bytes—ranging from 31,504,133 bytes for ATTR-0003 to 676,110,880 bytes for ATTR-0004—and a version number, with versions 2, 5, and 10 indicating iterative refinement of the underlying artifacts. The critical linkage in this table is the attribution key, which points to a dimension record: ATTR-0001 attributes to ATTR-0004, ATTR-0002 and ATTR-0004 both attribute to ATTR-0003, and ATTR-0003 attributes to ATTR-0006, forming a directed graph of provenance that traces each dataset back to its originating source or parent artifact. This attribution dimension, identified by the same ATTR- prefixed codes, carries human-readable labels such as Was Attributed To Label 01 through 04 and corresponding categories—Was Attributed To Category 01 through 04—that classify the nature of the attribution relationship, whether it denotes custodial transfer, derivative derivation, or archival handoff.

**fact_dataset**

| id | was_attributed_to_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0004 | 350697080 | 10 |
| ATTR-0002 | ATTR-0003 | 501391865 | 2 |
| ATTR-0003 | ATTR-0006 | 31504133 | 5 |
| ATTR-0004 | ATTR-0003 | 676110880 | 5 |
| ATTR-0005 | ATTR-0005 | 632357991 | 7 |
| ATTR-0006 | ATTR-0002 | 81640033 | 1 |
| ATTR-0007 | ATTR-0005 | 351254327 | 12 |
| ATTR-0008 | ATTR-0001 | 94866870 | 11 |

**dim_was_attributed_to**

| id | was_attributed_to_label | was_attributed_to_category |
| --- | --- | --- |
| ATTR-0001 | Was Attributed To Label 01 | Was Attributed To Category 01 |
| ATTR-0002 | Was Attributed To Label 02 | Was Attributed To Category 02 |
| ATTR-0003 | Was Attributed To Label 03 | Was Attributed To Category 03 |
| ATTR-0004 | Was Attributed To Label 04 | Was Attributed To Category 04 |
| ATTR-0005 | Was Attributed To Label 05 | Was Attributed To Category 05 |
| ATTR-0006 | Was Attributed To Label 06 | Was Attributed To Category 06 |
| ATTR-0007 | Was Attributed To Label 07 | Was Attributed To Category 07 |
| ATTR-0008 | Was Attributed To Label 08 | Was Attributed To Category 08 |

Aggregation groups, identified by codes GROU-0001 through GROU-0004, represent structured summaries of operational data, with descriptive names including cross_department_access_log, monthly_billing_snapshot, and daily_traffic_rollup. Each group is defined by a set of typed attributes—confidence as xsd:decimal, dimension_kind as xsd:string, method as xsd:string, and recorded_at as xsd:dateTime—establishing a schema that constrains the values permissible within the group. The type discipline is strict: decimal attributes hold values such as 0.676 and 770.46, string attributes carry labels like Dimension Kind 01 and Encoding 02, and datetime attributes record precise timestamps including 2025-01-14T14:41:10 and 2023-10-30T01:59:25, ensuring temporal auditability of when each aggregation was captured.

The relational architecture binds these components through explicit foreign keys. The executive leadership role table references itself through the reports_to column, which points to chiefexecutiveofficerrole entries, and through member_of, which links to executiveteam designations. The fact_dataset table anchors its provenance through was_attributed_to_key, which resolves to the primary key of the dim_was_attributed_to dimension, creating a clean separation between factual dataset measurements and their descriptive metadata. The aggregation group tables follow a star-schema pattern: t_aggregation_grouped_by_attr defines the attribute vocabulary, while the three value tables—t_aggregation_grouped_by_val_datetime, t_aggregation_grouped_by_val_decimal, and t_aggregation_grouped_by_val_varchar—each hold entity_id and attr_id foreign keys that tie specific values back to both the aggregation group and the attribute definition, enabling type-safe storage without sacrificing query flexibility.

**t_executive_leadership_role**

| id | executive_leadership_role | reports_to | member_of |
| --- | --- | --- | --- |
| ROLE-0001 | Chief Technology Officer | Managing Director | Board Advisory Group |
| ROLE-0002 | Chief Operating Officer | Executive Office | C-Suite |
| ROLE-0003 | Chief Revenue Officer | Managing Director | Board Advisory Group |
| ROLE-0004 | Chief Revenue Officer | CEO Office | Board Advisory Group |
| ROLE-0005 | Chief Revenue Officer | Executive Office | Corporate Governance Board |
| ROLE-0006 | Chief Human Resources Officer | Chief Executive | C-Suite |
| ROLE-0007 | Chief Human Resources Officer | Executive Office | Executive Operations Group |

**t_aggregation_grouped_by**

| id | aggregation |
| --- | --- |
| GROU-0001 | cross_department_access_log |
| GROU-0002 | monthly_billing_snapshot |
| GROU-0003 | daily_traffic_rollup |
| GROU-0004 | monthly_billing_snapshot |
| GROU-0005 | monthly_billing_snapshot |
| GROU-0006 | regional_temperature_average |

**t_aggregation_grouped_by_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| GROU-0001 | confidence | xsd:decimal |
| GROU-0002 | dimension_kind | xsd:string |
| GROU-0003 | method | xsd:string |
| GROU-0004 | recorded_at | xsd:dateTime |
| GROU-0005 | uncertainty | xsd:decimal |
| GROU-0006 | unit | xsd:string |
| GROU-0007 | value | xsd:decimal |
| GROU-0008 | encoding | xsd:string |

**t_aggregation_grouped_by_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0004 | 2025-01-14T14:41:10 |
| GROU-0002 | GROU-0002 | GROU-0004 | 2023-10-30T01:59:25 |
| GROU-0003 | GROU-0003 | GROU-0004 | 2023-04-12T02:41:30 |
| GROU-0004 | GROU-0004 | GROU-0004 | 2023-12-16T14:56:57 |
| GROU-0005 | GROU-0005 | GROU-0004 | 2023-04-07T15:52:42 |
| GROU-0006 | GROU-0006 | GROU-0004 | 2023-09-07T01:41:33 |

**t_aggregation_grouped_by_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0001 | 0.676 |
| GROU-0002 | GROU-0001 | GROU-0005 | 770.46 |
| GROU-0003 | GROU-0001 | GROU-0007 | 107.12 |
| GROU-0004 | GROU-0002 | GROU-0001 | 0.437 |
| GROU-0005 | GROU-0002 | GROU-0005 | 595.38 |
| GROU-0006 | GROU-0002 | GROU-0007 | 23.10 |
| GROU-0007 | GROU-0003 | GROU-0001 | 0.551 |
| GROU-0008 | GROU-0003 | GROU-0005 | 567.02 |

**t_aggregation_grouped_by_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| GROU-0001 | GROU-0001 | GROU-0002 | Dimension Kind 01 |
| GROU-0002 | GROU-0001 | GROU-0008 | Encoding 02 |
| GROU-0003 | GROU-0001 | GROU-0009 | calibration record |
| GROU-0004 | GROU-0001 | GROU-0010 | en |
| GROU-0005 | GROU-0001 | GROU-0003 | manual |
| GROU-0006 | GROU-0001 | GROU-0006 | ms |
| GROU-0007 | GROU-0002 | GROU-0002 | Dimension Kind 07 |
| GROU-0008 | GROU-0002 | GROU-0008 | Encoding 08 |