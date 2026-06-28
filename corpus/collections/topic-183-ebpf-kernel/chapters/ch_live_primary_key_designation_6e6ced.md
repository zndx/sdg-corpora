---
chapter_id: ch_live_primary_key_designation_6e6ced
topic_id: 183
family: 07_long_tail
cited_terms: ['primary_key_designation', 'verification_with_method', 'transformation_starts_at']
model: engine-refine
---

In formal data governance architectures, the distinction between an entity and its identifier constitutes the foundational act of reference: an identifier such as DESI-0001 or METH-0005 serves as the stable, machine-readable handle by which a domain object is addressed, while the entity itself—the concrete thing being described—may be a hardware serial number, a laboratory specimen record, a manufacturing batch, or an asset inventory entry. The table t_primary_key_designation establishes this mapping explicitly, binding identifiers like DESI-0001 through DESI-0004 to their corresponding primary key names (hardware_sn, lab_specimens, manufacturing_batches, asset_inventory) and associating each with a method identifier such as METH-0005 or METH-0006, thereby anchoring abstract identifiers to operational procedures. This separation of identity from identity-bearing content is not merely organizational; it permits the same identifier to participate in multiple relationship contexts without ambiguity, a property that becomes essential when the data model must express that a single entity carries heterogeneous attributes or participates in multiple verification workflows.

**t_primary_key_designation**

| id | primary | primary_key_of |
| --- | --- | --- |
| DESI-0001 | hardware_sn | METH-0005 |
| DESI-0002 | lab_specimens | METH-0005 |
| DESI-0003 | manufacturing_batches | METH-0006 |
| DESI-0004 | asset_inventory | METH-0004 |
| DESI-0005 | network_traffic_db | METH-0001 |
| DESI-0006 | manufacturing_batches | METH-0005 |

**t_primary_key_designation_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DESI-0001 | confidence | xsd:decimal |
| DESI-0002 | dimension_kind | xsd:string |
| DESI-0003 | method | xsd:string |
| DESI-0004 | recorded_at | xsd:dateTime |
| DESI-0005 | uncertainty | xsd:decimal |
| DESI-0006 | unit | xsd:string |
| DESI-0007 | value | xsd:decimal |
| DESI-0008 | encoding | xsd:string |

**t_verification_with_method**

| id | verification |
| --- | --- |
| METH-0001 | Certificate chain verification |
| METH-0002 | Model accuracy assessment |
| METH-0003 | Test suite execution |
| METH-0004 | Static code analysis |
| METH-0005 | Data quality audit |
| METH-0006 | Certificate chain verification |

**t_verification_with_method_via_verification_method**

| id | via_verification_method |
| --- | --- |
| METH-0001 | SHA-256 hashing |
| METH-0002 | ISO 27001 audit |
| METH-0003 | PCI DSS compliance scan |
| METH-0004 | Kubernetes liveness probe |
| METH-0005 | SHA-256 hashing |
| METH-0006 | JSON Schema validation |

Attributes and their types form the second pillar of this reference discipline. The attribute definition layer—exemplified by the attr_name and attr_type columns—declares that a property such as confidence carries the type xsd:decimal, that dimension_kind and method are xsd:string, and that recorded_at is xsd:dateTime. This type discipline is not decorative; it governs how values are stored, validated, and compared across the system. The value tables enforce this discipline through physical separation: decimal values such as 0.354, 612.82, 317.84, and 0.186 reside in t_primary_key_designation_val_decimal, datetime values like 2024-07-25T13:27:19 and 2024-03-16T21:31:41 in t_primary_key_designation_val_datetime, and string values including Dimension Kind 01, Encoding 02, audit excerpt, and de in t_primary_key_designation_val_varchar. Each value row carries an entity_id that points back to the entity it describes and an attr_id that resolves to the attribute definition, creating a three-way join that reconstructs the full attribute–value–entity relationship. The misc designation for the value column reflects this heterogeneity: the column's content is polymorphic by virtue of the type-gated table partitioning, not by any single column's capacity to hold arbitrary data.

**t_primary_key_designation_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0004 | 2024-07-25T13:27:19 |
| DESI-0002 | DESI-0002 | DESI-0004 | 2024-03-16T21:31:41 |
| DESI-0003 | DESI-0003 | DESI-0004 | 2023-06-18T02:34:37 |
| DESI-0004 | DESI-0004 | DESI-0004 | 2023-02-27T13:30:12 |
| DESI-0005 | DESI-0005 | DESI-0004 | 2024-09-26T23:46:39 |
| DESI-0006 | DESI-0006 | DESI-0004 | 2024-08-10T21:30:38 |

**t_primary_key_designation_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0001 | 0.354 |
| DESI-0002 | DESI-0001 | DESI-0005 | 612.82 |
| DESI-0003 | DESI-0001 | DESI-0007 | 317.84 |
| DESI-0004 | DESI-0002 | DESI-0001 | 0.186 |
| DESI-0005 | DESI-0002 | DESI-0005 | 917.05 |
| DESI-0006 | DESI-0002 | DESI-0007 | 468.15 |
| DESI-0007 | DESI-0003 | DESI-0001 | 0.339 |
| DESI-0008 | DESI-0003 | DESI-0005 | 505.24 |

**t_primary_key_designation_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DESI-0001 | DESI-0001 | DESI-0002 | Dimension Kind 01 |
| DESI-0002 | DESI-0001 | DESI-0008 | Encoding 02 |
| DESI-0003 | DESI-0001 | DESI-0009 | audit excerpt |
| DESI-0004 | DESI-0001 | DESI-0010 | de |
| DESI-0005 | DESI-0001 | DESI-0003 | hybrid |
| DESI-0006 | DESI-0001 | DESI-0006 | mg/L |
| DESI-0007 | DESI-0002 | DESI-0002 | Dimension Kind 07 |
| DESI-0008 | DESI-0002 | DESI-0008 | Encoding 08 |

The subject–target–role triad provides the relational glue that connects entities, attributes, and procedures into a coherent graph. In the verification domain, t_verification_with_method enumerates verification activities—Certificate chain verification, Model accuracy assessment, Test suite execution, Static code analysis—while t_verification_with_method_via_verification_method enumerates the mechanisms by which those activities are carried out: SHA-256 hashing, ISO 27001 audit, PCI DSS compliance scan, Kubernetes liveness probe. The join table t_verification_with_method__via_verification_method binds a verification_id (the subject) to a via_verification_method_id (the target) and assigns a role—reviewer, contributor, owner, or observer—that specifies the nature of the subject's relationship to the target. This role is not metadata appended to a relationship; it is the relationship itself, carrying semantic weight that determines permissions, audit trails, and accountability. The same pattern recurs in the transformation domain, where t_transformation_starts_at links transformations such as schema migration step, calibration procedure, and telemetry sync process to their initiation timestamps, and the join table t_transformation_starts_at__started_at_time assigns roles of owner, reviewer, and observer to the relationship between a transformation_id and a started_at_time_id.

**t_verification_with_method__via_verification_method**

| id | verification_id | via_verification_method_id | role |
| --- | --- | --- | --- |
| METH-0001 | METH-0005 | METH-0004 | reviewer |
| METH-0002 | METH-0004 | METH-0006 | contributor |
| METH-0003 | METH-0003 | METH-0002 | owner |
| METH-0004 | METH-0006 | METH-0006 | observer |
| METH-0005 | METH-0004 | METH-0004 | contributor |
| METH-0006 | METH-0002 | METH-0002 | owner |
| METH-0007 | METH-0001 | METH-0003 | contributor |
| METH-0008 | METH-0003 | METH-0005 | observer |

**t_transformation_starts_at**

| id | transformation |
| --- | --- |
| STAR-0001 | schema migration step |
| STAR-0002 | calibration procedure |
| STAR-0003 | schema migration step |
| STAR-0004 | telemetry sync process |
| STAR-0005 | telemetry sync process |
| STAR-0006 | ETL pipeline run |

**t_transformation_starts_at_started_at_time**

| id | started_at_time |
| --- | --- |
| STAR-0001 | 2024-03-15T09:15:22Z |
| STAR-0002 | 2024-03-15T11:45:10Z |
| STAR-0003 | 2024-03-15T16:30:00Z |
| STAR-0004 | 2024-03-15T10:00:00Z |
| STAR-0005 | 2024-03-15T15:55:42Z |
| STAR-0006 | 2024-03-15T11:45:10Z |

**t_transformation_starts_at__started_at_time**

| id | transformation_id | started_at_time_id | role |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0006 | STAR-0005 | owner |
| STAR-0002 | STAR-0002 | STAR-0001 | reviewer |
| STAR-0003 | STAR-0002 | STAR-0005 | observer |
| STAR-0004 | STAR-0002 | STAR-0004 | observer |
| STAR-0005 | STAR-0001 | STAR-0003 | contributor |
| STAR-0006 | STAR-0001 | STAR-0006 | observer |
| STAR-0007 | STAR-0006 | STAR-0003 | reviewer |
| STAR-0008 | STAR-0002 | STAR-0005 | reviewer |

The practical consequence of this architecture is that every fact in the system is expressed as a typed, role-bearing edge between two identified nodes. An identifier alone is inert; it gains meaning only through the relationships it participates in. DESI-0001 is not merely a key—it is the entity that carries a confidence value of 0.354, a recorded_at timestamp of 2024-07-25T13:27:19, and a dimension_kind of Dimension Kind 01, and it is the primary key of method METH-0005. METH-0005, in turn, is a method whose verification activity is Static code analysis, executed via the mechanism Kubernetes liveness probe, with the relationship role assigned as observer. This dense web of references ensures that no value exists in isolation, no entity is addressable without its attribute context, and no relationship is unqualified by its role. The system thereby achieves what simpler designs cannot: full traceability from a leaf value back through its attribute definition, through its entity, through its method, to the verification mechanism that substantiates it, with every hop mediated by an explicit identifier and every connection qualified by a role.