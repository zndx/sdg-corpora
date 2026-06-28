---
chapter_id: ch_live_attestation_basic_778b47
topic_id: 7
family: 03_directive_governance
cited_terms: ['attestation_basic', 'subclass_to_directive_ice', 'subclass_to_designative_ice']
model: engine-refine
---

Attributes constitute the extensible metadata layer that decouples domain-specific properties from the core entities they describe, enabling a single attestation record to carry heterogeneous measurements without schema modification. In the attestation domain, an entity such as the vendor risk assessment identified as ATTE-0001 acquires its dimensional character through a set of named properties—duration_seconds, end_time, exit_code, and host_name—each declared with a precise XML Schema type in the attribute definition table: xsd:decimal for temporal durations, xsd:dateTime for timestamps, xsd:integer for discrete codes, and xsd:string for host identifiers. This separation of attribute schema from attribute value is the structural mechanism that permits the same entity to accumulate values of fundamentally different kinds—7132.97 seconds elapsed, 2024-11-18T12:26:52 as the recorded end time, 898 as an exit code—without requiring any alteration to the base attestation record itself. The type discipline enforced at the attr_type level ensures that downstream consumers can parse and validate values against their declared schema, a requirement that becomes non-negotiable when compliance artifacts such as HIPAA compliance reviews or ML model fairness audits must survive audit trails with their metadata intact.

The encoding dimension introduces a parallel layer of specification that governs how textual content is serialized and interpreted across systems. In the ICE subclass framework, each directive—whether ProvenanceTraceRequirement, EncryptionStandard, or CalibrationInstruction—carries an explicit encoding declaration, with values such as ascii and unicode anchoring the character representation of associated label_text fields like intake form, calibration record, and nightly summary. This encoding attribute is itself modeled as a first-class property: the designative attribute definition table declares encoding as an xsd:string attribute, and its runtime values appear in the varchar valuation table as Encoding 01 and Encoding 04, demonstrating that encoding can be both a fixed directive-level constraint and a dynamically assigned property on individual designative instances such as CryoStream-Link or CryoVault-Label. The dual treatment of encoding—as both a schema-level annotation and a runtime-valued attribute—reflects the operational reality that some systems require encoding to be declared once at the directive level while others permit per-instance override, a flexibility that must be documented and enforced through the attribute type system.

**t_subclass_to_directive_ice**

| id | directive | encoding | label_text |
| --- | --- | --- | --- |
| ICE-0001 | ProvenanceTraceRequirement | ascii | intake form |
| ICE-0002 | EncryptionStandard | ascii | calibration record |
| ICE-0003 | CalibrationInstruction | unicode | nightly summary |
| ICE-0004 | CalibrationInstruction | unicode | intake form |
| ICE-0005 | BatchIngestionRule | ascii | nightly summary |

**t_subclass_to_designative_ice**

| id | designative |
| --- | --- |
| ICE-0001 | CryoStream-Link |
| ICE-0002 | CryoVault-Label |
| ICE-0003 | AeroFrost-ID |
| ICE-0004 | IceSheet-Ref |
| ICE-0005 | CryoStream-Link |
| ICE-0006 | IceSheet-Ref |

**t_subclass_to_designative_ice_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ICE-0001 | encoding | xsd:string |
| ICE-0002 | label_text | xsd:string |
| ICE-0003 | language | xsd:string |

Entity identifiers serve as the stable anchors that bind attribute definitions to their concrete values across the normalized valuation tables. The entity_id foreign key in each type-specific valuation table—t_attestation_basic_val_datetime, t_attestation_basic_val_decimal, t_attestation_basic_val_int, and t_attestation_basic_val_varchar—creates a many-to-one relationship between a single attestation entity and its heterogeneous value set, with the attr_id column disambiguating which declared attribute each value corresponds to. For the entity ATTE-0001, this mechanism yields a coherent profile: the decimal valuation table records 7132.97 against attr_id ATTE-0001 (duration_seconds), the datetime table records 2024-11-18T12:26:52 against attr_id ATTE-0002 (end_time), the integer table records 898 against attr_id ATTE-0003 (exit_code), and the varchar table records ingest-21 against attr_id ATTE-0004 (host_name). The same pattern holds for designative entities such as ICE-0001, where entity_id ICE-0001 links to attribute values Encoding 01, change rationale, and es across the designative varchar valuation table, with attr_id values ICE-0001, ICE-0002, and ICE-0003 mapping back to the attributes encoding, label_text, and language declared in the designative attribute definition table.

**t_attestation_basic**

| id | attestation |
| --- | --- |
| ATTE-0001 | Vendor risk assessment |
| ATTE-0002 | HIPAA compliance review |
| ATTE-0003 | ML model fairness audit |
| ATTE-0004 | HIPAA compliance review |
| ATTE-0005 | SOC 2 Type II audit |
| ATTE-0006 | Vendor risk assessment |

**t_attestation_basic_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ATTE-0001 | duration_seconds | xsd:decimal |
| ATTE-0002 | end_time | xsd:dateTime |
| ATTE-0003 | exit_code | xsd:integer |
| ATTE-0004 | host_name | xsd:string |
| ATTE-0005 | log_level | xsd:string |
| ATTE-0006 | phase | xsd:string |
| ATTE-0007 | retry_count | xsd:integer |
| ATTE-0008 | scheduled_at | xsd:dateTime |

**t_attestation_basic_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0002 | 2024-11-18T12:26:52 |
| ATTE-0002 | ATTE-0001 | ATTE-0008 | 2023-12-15T15:31:35 |
| ATTE-0003 | ATTE-0001 | ATTE-0009 | 2023-03-05T20:41:52 |
| ATTE-0004 | ATTE-0002 | ATTE-0002 | 2023-09-08T13:00:56 |
| ATTE-0005 | ATTE-0002 | ATTE-0008 | 2024-07-29T18:29:50 |
| ATTE-0006 | ATTE-0002 | ATTE-0009 | 2024-08-01T11:14:05 |
| ATTE-0007 | ATTE-0003 | ATTE-0002 | 2023-01-08T06:41:42 |
| ATTE-0008 | ATTE-0003 | ATTE-0008 | 2025-06-10T02:28:19 |

**t_attestation_basic_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0001 | 7132.97 |
| ATTE-0002 | ATTE-0002 | ATTE-0001 | 6429.54 |
| ATTE-0003 | ATTE-0003 | ATTE-0001 | 3894.03 |
| ATTE-0004 | ATTE-0004 | ATTE-0001 | 6507.32 |
| ATTE-0005 | ATTE-0005 | ATTE-0001 | 5722.64 |
| ATTE-0006 | ATTE-0006 | ATTE-0001 | 4627.41 |

**t_attestation_basic_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0003 | 898 |
| ATTE-0002 | ATTE-0001 | ATTE-0007 | 487 |
| ATTE-0003 | ATTE-0002 | ATTE-0003 | 71 |
| ATTE-0004 | ATTE-0002 | ATTE-0007 | 180 |
| ATTE-0005 | ATTE-0003 | ATTE-0003 | 107 |
| ATTE-0006 | ATTE-0003 | ATTE-0007 | 326 |
| ATTE-0007 | ATTE-0004 | ATTE-0003 | 620 |
| ATTE-0008 | ATTE-0004 | ATTE-0007 | 392 |

**t_attestation_basic_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ATTE-0001 | ATTE-0001 | ATTE-0004 | ingest-21 |
| ATTE-0002 | ATTE-0001 | ATTE-0005 | Log Level 02 |
| ATTE-0003 | ATTE-0001 | ATTE-0006 | initiation |
| ATTE-0004 | ATTE-0001 | ATTE-0010 | superseded |
| ATTE-0005 | ATTE-0001 | ATTE-0011 | Triggered By 05 |
| ATTE-0006 | ATTE-0002 | ATTE-0004 | gw-12 |
| ATTE-0007 | ATTE-0002 | ATTE-0005 | Log Level 07 |
| ATTE-0008 | ATTE-0002 | ATTE-0006 | execution |

**t_subclass_to_designative_ice_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ICE-0001 | ICE-0001 | ICE-0001 | Encoding 01 |
| ICE-0002 | ICE-0001 | ICE-0002 | change rationale |
| ICE-0003 | ICE-0001 | ICE-0003 | es |
| ICE-0004 | ICE-0002 | ICE-0001 | Encoding 04 |
| ICE-0005 | ICE-0002 | ICE-0002 | nightly summary |
| ICE-0006 | ICE-0002 | ICE-0003 | fr |
| ICE-0007 | ICE-0003 | ICE-0001 | Encoding 07 |
| ICE-0008 | ICE-0003 | ICE-0002 | change rationale |

Label text functions as the human-readable gloss on machine-identifiable directives and designatives, providing an operational bridge between technical identifiers and the procedural artifacts they govern. The label_text column in the directive table carries values such as intake form and calibration record that correspond directly to the directives ProvenanceTraceRequirement and CalibrationInstruction, while the designative attribute definition table elevates label_text to the status of an extensible attribute (attr_name: label_text, attr_type: xsd:string), allowing individual designative instances to carry their own descriptive labels through the varchar valuation table. This dual presence of label_text—as both a direct column on the directive entity and as a runtime-valued attribute on designatives—illustrates a common pattern in governance frameworks where human-readable descriptions are needed at multiple abstraction levels: at the directive level for policy documentation and at the instance level for operational artifacts like the CryoStream-Link or IceSheet-Ref designatives.

The misc designation across the valuation tables reflects the practical necessity of type-dispatch in a schema that must accommodate heterogeneous data without sacrificing the type safety that compliance auditing demands. Rather than storing all attribute values as strings, the architecture distributes values across four specialized tables keyed by their XML Schema type—decimal, dateTime, integer, and varchar—each carrying the same triad of entity_id, attr_id, and value columns but enforcing type correctness at the storage layer. This design ensures that a value like 3894.03 in the decimal table cannot be confused with 71 in the integer table or 2023-12-15T15:31:35 in the datetime table, even though all three are attribute values belonging to attestation entities. The identifier columns (id and entity_id) maintain referential integrity across this type-dispatched structure, while the attr_id column provides the semantic link back to the attribute definition table where the expected type is declared, creating a closed loop of declaration, assignment, and validation that is essential for audit-grade data integrity.