---
chapter_id: ch_live_schemaorg_place_geocoord_e001af
topic_id: 35
family: 07_long_tail
cited_terms: ['schemaorg_place_geocoord', 'constraint_only_constrains', 'policy_authored_by']
model: engine-refine
---

In governed data environments, identifier, entity, and attr form the minimal triad through which compliance obligations are bound to operational artifacts without collapsing distinct concerns into a single denormalized record. An identifier such as CONS-0003 or GEOC-0004 functions as a durable surrogate key: it remains stable across revisions, joins, and audit trails even when human-readable labels change. The entity dimension names what is being constrained or described—here, constraint records CONS-0001 through CONS-0004 each carry their own identity while simultaneously serving as the entity_id anchor in typed value stores—whereas attr names the governed property itself (effective_date, enforcement, mandatory, priority). Separating entity from attr permits a single constraint definition to publish multiple orthogonal properties and, critically, to route each property to a storage layer matched to its semantics rather than forcing heterogeneous literals into one untyped column.

Attr type is the contract that makes such routing enforceable at ingest and query time. Declaring effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer establishes both validation rules and join eligibility: dates land in t_constraint_only_constrains_val_date (2023-09-12 through 2025-06-06), booleans in val_boolean (true/false on mandatory for CONS-0003), integers in val_int (priorities 4, 996, 1, 40), and strings in val_varchar (Encoding 01, Enforcement 02, intake form, ja). This pattern—metadata table plus type-specialized value tables keyed by entity_id and attr_id—is how encoding at the character-set layer (latin1 versus ascii on authored policy records) remains distinct from encoding as a governed string attribute (Encoding 01 on CONS-0001). Conflating the two produces silent corruption in internationalized text and breaks downstream parsers that assume XSD-aligned typing.

**t_constraint_only_constrains**

| id | constraint | constrains |
| --- | --- | --- |
| CONS-0001 | log_level_filter | query_engine |
| CONS-0002 | checksum_algorithm | network_interface |
| CONS-0003 | data_retention_policy | telemetry_streams |
| CONS-0004 | data_retention_policy | telemetry_streams |
| CONS-0005 | data_retention_policy | sensor_reading |
| CONS-0006 | access_control_matrix | api_gateway |

**t_constraint_only_constrains_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONS-0001 | effective_date | xsd:date |
| CONS-0002 | enforcement | xsd:string |
| CONS-0003 | mandatory | xsd:boolean |
| CONS-0004 | priority | xsd:integer |
| CONS-0005 | review_cycle_days | xsd:integer |
| CONS-0006 | scope | xsd:string |
| CONS-0007 | encoding | xsd:string |
| CONS-0008 | label_text | xsd:string |

**t_constraint_only_constrains_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0003 | true |
| CONS-0002 | CONS-0002 | CONS-0003 | false |
| CONS-0003 | CONS-0003 | CONS-0003 | true |
| CONS-0004 | CONS-0004 | CONS-0003 | true |
| CONS-0005 | CONS-0005 | CONS-0003 | false |
| CONS-0006 | CONS-0006 | CONS-0003 | false |

**t_constraint_only_constrains_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0001 | 2023-09-12 |
| CONS-0002 | CONS-0002 | CONS-0001 | 2025-06-06 |
| CONS-0003 | CONS-0003 | CONS-0001 | 2023-06-09 |
| CONS-0004 | CONS-0004 | CONS-0001 | 2024-12-03 |
| CONS-0005 | CONS-0005 | CONS-0001 | 2024-06-17 |
| CONS-0006 | CONS-0006 | CONS-0001 | 2025-05-30 |

**t_constraint_only_constrains_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0004 | 4 |
| CONS-0002 | CONS-0001 | CONS-0005 | 996 |
| CONS-0003 | CONS-0002 | CONS-0004 | 1 |
| CONS-0004 | CONS-0002 | CONS-0005 | 40 |
| CONS-0005 | CONS-0003 | CONS-0004 | 3 |
| CONS-0006 | CONS-0003 | CONS-0005 | 497 |
| CONS-0007 | CONS-0004 | CONS-0004 | 2 |
| CONS-0008 | CONS-0004 | CONS-0005 | 719 |

**t_constraint_only_constrains_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONS-0001 | CONS-0001 | CONS-0007 | Encoding 01 |
| CONS-0002 | CONS-0001 | CONS-0002 | Enforcement 02 |
| CONS-0003 | CONS-0001 | CONS-0008 | intake form |
| CONS-0004 | CONS-0001 | CONS-0009 | ja |
| CONS-0005 | CONS-0001 | CONS-0006 | Scope 05 |
| CONS-0006 | CONS-0002 | CONS-0007 | Encoding 06 |
| CONS-0007 | CONS-0002 | CONS-0002 | Enforcement 07 |
| CONS-0008 | CONS-0002 | CONS-0008 | pre-release note |

**t_policy_authored_by**

| id | policy | authored_by | mandatory | encoding |
| --- | --- | --- | --- | --- |
| AUTH-0001 | AWS IAM Permission Boundary | European Commission | false | latin1 |
| AUTH-0002 | PCI DSS Access Standards | NIST Computer Security | false | latin1 |
| AUTH-0003 | ISO 27001 Controls | NIST Computer Security | true | ascii |
| AUTH-0004 | EU AI Risk Framework | Federal Trade Commission | true | latin1 |
| AUTH-0005 | PCI DSS Access Standards | Federal Trade Commission | false | latin1 |
| AUTH-0006 | AWS IAM Permission Boundary | AWS Compliance Office | false | ascii |
| AUTH-0007 | PCI DSS Access Standards | SOC 2 Audit Board | true | unicode |
| AUTH-0008 | CCPA Consumer Rights | Federal Trade Commission | false | unicode |

Category supplies the controlled vocabulary that situates otherwise opaque keys within operational taxonomy. Geo Coordinates Category 01 through Geo Coordinates Category 04 classify coordinate reference frames or collection contexts so that GEOC-0004 can be referenced consistently whether it appears as a dimension key or as geo_coordinates_key on multiple fact rows; the repetition of GEOC-0004 across facts alongside version integers 3, 5, 4, and 8 signals that lineage and spatial context evolve on independent axes. Misc fields—labels such as Geo Coordinates Label 04, or unconstrained string payloads—carry human legibility and edge-case literals that resist premature normalization; they matter because auditors and operators reason in prose and locale-specific tokens (ja) long before they reason in surrogate keys.

**dim_geo_coordinates**

| id | geo_coordinates_label | geo_coordinates_category |
| --- | --- | --- |
| GEOC-0001 | Geo Coordinates Label 01 | Geo Coordinates Category 01 |
| GEOC-0002 | Geo Coordinates Label 02 | Geo Coordinates Category 02 |
| GEOC-0003 | Geo Coordinates Label 03 | Geo Coordinates Category 03 |
| GEOC-0004 | Geo Coordinates Label 04 | Geo Coordinates Category 04 |
| GEOC-0005 | Geo Coordinates Label 05 | Geo Coordinates Category 05 |
| GEOC-0006 | Geo Coordinates Label 06 | Geo Coordinates Category 06 |

Ismandatory translates policy posture into machine-checkable obligation. Where AWS IAM Permission Boundary and PCI DSS Access Standards carry mandatory=false, ISO 27001 Controls and EU AI Risk Framework assert mandatory=true, encoding a bifurcation between advisory guidance and binding control frameworks whose absence constitutes a compliance gap rather than a stylistic deviation. That boolean aligns with attr-level mandatory typing (xsd:boolean) and with per-entity enforcement values recorded on CONS-0003, illustrating how the same semantic axis propagates from authorship metadata through constraint graphs to telemetry_streams and query_engine targets named in constrains relationships—log_level_filter, checksum_algorithm, data_retention_policy—without duplicating the policy text itself.

Size_bytes and version close the loop between governance metadata and the material footprint of published datasets. Fact rows reporting 895265030, 114301972, 338701831, and 998785819 bytes quantify storage and transfer risk for schema.org-aligned publications tied to coordinate keys; version monotonicity (3→5→4→8 across GEOC-0001–GEOC-0004) documents editorial or structural change independent of byte growth, so retention, checksum, and query-engine constraints can be evaluated against both the current artifact weight and the revision history implied by the version column. In practice, identifier stability, typed attrs, categorical placement, mandatory flags, character encodings, and volumetric/version stamps jointly determine whether a catalog entry is discoverable, validatable, enforceable, and auditable—a chain in which each metadata role is small in isolation but load-bearing in aggregate.

**fact_schemaorg**

| id | geo_coordinates_key | size_bytes | version |
| --- | --- | --- | --- |
| GEOC-0001 | GEOC-0004 | 895265030 | 3 |
| GEOC-0002 | GEOC-0006 | 114301972 | 5 |
| GEOC-0003 | GEOC-0004 | 338701831 | 4 |
| GEOC-0004 | GEOC-0004 | 998785819 | 8 |