---
chapter_id: ch_live_ebpfmap_with_max_entries_13aba7
topic_id: 20
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_with_max_entries', 'patient_insurance_record', 'metric_with_unit']
model: engine-refine
---

The foundational construct across these data models is the identifier, a stable, scoped reference that anchors every entity and relationship. Identifiers follow a domain-specific prefix paired with a sequential code—ENTR-0001 through ENTR-0004 for eBPF map entries, RECO-0001 through RECO-0004 for patient insurance records, and UNIT-0001 through UNIT-0004 for metric definitions—ensuring that each entity can be unambiguously referenced across the schema. The entity itself represents the principal object of interest: an eBPF map such as devmap or cgroup_storage, a patient insurance record like ENROLL-7742 or POL-8821-AX, or a metric such as megabytes per second and network bandwidth. Each entity carries intrinsic properties, but the model separates the definition of those properties from their instantiation, enabling a flexible, extensible structure.

**t_ebpfmap_with_max_entries**

| id | ebpfmap |
| --- | --- |
| ENTR-0001 | devmap |
| ENTR-0002 | cgroup_storage |
| ENTR-0003 | queue |
| ENTR-0004 | stack_trace |
| ENTR-0005 | sockhash |
| ENTR-0006 | queue |

**t_ebpfmap_with_max_entries_max_entries**

| id | max_entries |
| --- | --- |
| ENTR-0001 | 1048576 |
| ENTR-0002 | 262144 |
| ENTR-0003 | 16384 |
| ENTR-0004 | 16384 |
| ENTR-0005 | 32768 |
| ENTR-0006 | 1048576 |
| ENTR-0007 | 524288 |

**t_metric_with_unit**

| id | metric | metric_unit |
| --- | --- | --- |
| UNIT-0001 | megabytes per second | records per second |
| UNIT-0002 | network bandwidth | megabytes per second |
| UNIT-0003 | degrees Celsius | megabytes per second |
| UNIT-0004 | hertz | hertz |
| UNIT-0005 | temperature | pressure |
| UNIT-0006 | megabytes per second | latency |

Attributes and their types form the second layer of this architecture. The attribute definition table declares what properties an entity may possess, pairing an attr_name—such as checksum, created_date, identifier, or license—with an attr_type that constrains the value domain. Types include xsd:string for free-form text, xsd:date for temporal values, and cco:DesignativeICE for coded designators, reflecting a deliberate commitment to type safety and semantic precision. This separation of attribute schema from attribute values means that the model can accommodate heterogeneous data without schema migration: a metric entity's created_date value appears as 2023-09-28 in the date value table, while its license value—GPL-3.0—resides in the varchar value table, and numeric properties like 97 or 477 occupy the integer value table. The entity_id column in each value table binds the misc value back to its originating entity, and the attr_id column resolves which attribute definition governs the interpretation of that value.

**t_metric_with_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | checksum | xsd:string |
| UNIT-0002 | created_date | xsd:date |
| UNIT-0003 | identifier | cco:DesignativeICE |
| UNIT-0004 | license | xsd:string |
| UNIT-0005 | mime_type | xsd:string |
| UNIT-0006 | size_bytes | xsd:long |
| UNIT-0007 | uri | xsd:string |
| UNIT-0008 | version | xsd:integer |

**t_metric_with_unit_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | 2023-09-28 |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | 2024-02-22 |
| UNIT-0003 | UNIT-0003 | UNIT-0002 | 2023-12-02 |
| UNIT-0004 | UNIT-0004 | UNIT-0002 | 2024-09-28 |
| UNIT-0005 | UNIT-0005 | UNIT-0002 | 2024-02-26 |
| UNIT-0006 | UNIT-0006 | UNIT-0002 | 2024-12-06 |

**t_metric_with_unit_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0006 | 97 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | 2 |
| UNIT-0003 | UNIT-0002 | UNIT-0006 | 477 |
| UNIT-0004 | UNIT-0002 | UNIT-0008 | 11 |
| UNIT-0005 | UNIT-0003 | UNIT-0006 | 499 |
| UNIT-0006 | UNIT-0003 | UNIT-0008 | 7 |
| UNIT-0007 | UNIT-0004 | UNIT-0006 | 214 |
| UNIT-0008 | UNIT-0004 | UNIT-0008 | 1 |

**t_metric_with_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | c0ffee42 |
| UNIT-0002 | UNIT-0001 | UNIT-0003 | oid:1.3.6.1 |
| UNIT-0003 | UNIT-0001 | UNIT-0004 | GPL-3.0 |
| UNIT-0004 | UNIT-0001 | UNIT-0009 | eu-west-3 |
| UNIT-0005 | UNIT-0001 | UNIT-0005 | application/parquet |
| UNIT-0006 | UNIT-0001 | UNIT-0010 | Name 06 |
| UNIT-0007 | UNIT-0001 | UNIT-0011 | data-engineering |
| UNIT-0008 | UNIT-0001 | UNIT-0012 | Tags 08 |

Relationships between entities are mediated through a subject-target-role triad, which replaces rigid foreign-key constraints with a more expressive, role-based association pattern. In the eBPF map domain, the relationship table links an ebpfmap_id (the subject) to a max_entries_id (the target) through a role such as reviewer, owner, or observer—so ENTR-0004 (the stack_trace map) assumes the reviewer role with respect to ENTR-0002, while ENTR-0001 (the devmap) serves as the owner of ENTR-0001's max_entries configuration. The same pattern appears in the patient insurance domain, where a patient_id subject relates to a contains_data_element_id target through roles like contributor or observer; RECO-0005 contributes to the coverage_start_date element (RECO-0003), and RECO-0007 observes the premium_amount element (RECO-0002). This tripartite structure captures not merely that two entities are connected, but the nature of that connection, enabling audit trails, access control decisions, and provenance tracking without hardcoding relationship semantics into the schema.

**t_ebpfmap_with_max_entries__max_entries**

| id | ebpfmap_id | max_entries_id | role |
| --- | --- | --- | --- |
| ENTR-0001 | ENTR-0004 | ENTR-0002 | reviewer |
| ENTR-0002 | ENTR-0001 | ENTR-0001 | owner |
| ENTR-0003 | ENTR-0004 | ENTR-0006 | reviewer |
| ENTR-0004 | ENTR-0002 | ENTR-0004 | observer |
| ENTR-0005 | ENTR-0006 | ENTR-0002 | observer |
| ENTR-0006 | ENTR-0006 | ENTR-0006 | owner |
| ENTR-0007 | ENTR-0004 | ENTR-0005 | owner |
| ENTR-0008 | ENTR-0006 | ENTR-0004 | observer |

The insuranceinformationitem concept represents the granular data elements that compose a patientinsurancerecord. A single record—RECO-0001, for instance—contains structured data elements such as coverage_start_date, provider_npi, deductible_limit, and premium_amount, each of which is itself an entity with its own identifier and can participate in relationships. The contains_data_element table enumerates these elements, and the relationship table t_patient_insurance_record__contains_data_element binds a patient record subject to its constituent data element targets through a role that indicates the nature of the association. RECO-0003 and RECO-0005 both act as contributors to data elements, while RECO-0008 and RECO-0007 assume the observer role, suggesting a distinction between entities that actively populate data elements and those that consume or reference them. This separation of the record from its constituent elements allows individual data elements to be versioned, validated, and related to other entities independently of the parent record.

**t_patient_insurance_record**

| id | patient_insurance_record |
| --- | --- |
| RECO-0001 | ENROLL-7742 |
| RECO-0002 | POL-8821-AX |
| RECO-0003 | SSN-4821 |
| RECO-0004 | DOB-19850312 |
| RECO-0005 | MRN-4829103 |
| RECO-0006 | SSN-4821 |
| RECO-0007 | POL-8821-AX |
| RECO-0008 | ENROLL-7742 |

**t_patient_insurance_record_contains_data_element**

| id | contains_data_element |
| --- | --- |
| RECO-0001 | coverage_start_date |
| RECO-0002 | provider_npi |
| RECO-0003 | deductible_limit |
| RECO-0004 | premium_amount |
| RECO-0005 | copay_rate |
| RECO-0006 | coverage_start_date |

**t_patient_insurance_record__contains_data_element**

| id | patient_id | contains_data_element_id | role |
| --- | --- | --- | --- |
| RECO-0001 | RECO-0005 | RECO-0003 | contributor |
| RECO-0002 | RECO-0003 | RECO-0006 | contributor |
| RECO-0003 | RECO-0008 | RECO-0006 | owner |
| RECO-0004 | RECO-0007 | RECO-0002 | observer |
| RECO-0005 | RECO-0001 | RECO-0002 | owner |
| RECO-0006 | RECO-0005 | RECO-0002 | observer |
| RECO-0007 | RECO-0003 | RECO-0002 | contributor |
| RECO-0008 | RECO-0008 | RECO-0001 | owner |

The misc value column, appearing across the three value tables (val_date, val_int, val_varchar), serves as the universal carrier for attribute values regardless of their semantic type. Values range from cryptographic checksums like c0ffee42 and OID identifiers such as oid:1.3.6.1, to geographic region codes like eu-west-3, to temporal stamps spanning from 2023-09-28 through 2024-09-28. The type-specific table routing—date values in one table, integers in another, variable-length strings in a third—provides both type enforcement and query performance, while the shared entity_id and attr_id columns maintain referential integrity to the attribute definition schema. This design reflects a mature information governance approach: entities are first-class citizens with stable identifiers, attributes are declared with typed constraints, values are stored in type-appropriate containers, and relationships are expressed through role-mediated associations that capture the full semantics of how entities interact.