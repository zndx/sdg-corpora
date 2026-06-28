---
chapter_id: ch_live_student_privacy_expectation_55a1ea
topic_id: 0
family: 08_derived
cited_terms: ['student_privacy_expectation', 'instrument_only_emits_type', 'soc2_security_subclass']
model: engine-refine
---

The governance of sensitive data rests on a foundation of typed attributes that bind policy definitions to concrete enforcement targets. Each security subclass—whether SOC2-CloudInfra, SOC2-Fintech, SOC3-Public, or SOC2-IdentityProvider—carries a suite of configurable attributes whose semantics are declared through a schema registry. Attribute names such as effective_date, enforcement, mandatory, and priority are paired with their corresponding XML Schema types: xsd:date, xsd:string, xsd:boolean, and xsd:integer. This type declaration is not merely documentary; it governs how values are stored, validated, and queried across the system. The attribute registry thus serves as the contract between policy intent and data representation, ensuring that a boolean flag like mandatory is never conflated with a temporal bound or a numeric threshold.

Value storage follows a polymorphic pattern that mirrors this type discipline. Boolean attributes resolve to discrete true/false assignments, as seen when entity SECU-0001 is marked mandatory as true while SECU-0002 carries the value false. Temporal attributes such as effective_date anchor policies to specific calendar dates—2023-08-15, 2024-04-12, 2024-01-26, 2025-05-01—providing an audit trail of when controls became operative or expired. Integer attributes capture quantitative thresholds, with values ranging from 1 to 926, while varchar attributes hold free-form strings like "Encoding 01," "Enforcement 02," "audit excerpt," and "de." Each value row is keyed by an identifier, an entity reference that points back to the security subclass, and an attribute reference that resolves to the schema definition. This tripartite key structure—identifier, entity, attr—ensures that every value is traceable to both its semantic definition and its policy context.

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | Virtual Networks |
| SECU-0002 | SOC3-Public | Microservice Mesh |
| SECU-0003 | SOC2-Fintech | Database Clusters |
| SECU-0004 | SOC2-IdentityProvider | Microservice Mesh |
| SECU-0005 | SOC2-SaaS | Data Warehouses |
| SECU-0006 | SOC2-TypeII | Database Clusters |
| SECU-0007 | SOC2-SaaS | Database Clusters |

**t_soc2_security_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECU-0001 | effective_date | xsd:date |
| SECU-0002 | enforcement | xsd:string |
| SECU-0003 | mandatory | xsd:boolean |
| SECU-0004 | priority | xsd:integer |
| SECU-0005 | review_cycle_days | xsd:integer |
| SECU-0006 | scope | xsd:string |
| SECU-0007 | encoding | xsd:string |
| SECU-0008 | label_text | xsd:string |

**t_soc2_security_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0003 | true |
| SECU-0002 | SECU-0002 | SECU-0003 | false |
| SECU-0003 | SECU-0003 | SECU-0003 | true |
| SECU-0004 | SECU-0004 | SECU-0003 | false |
| SECU-0005 | SECU-0005 | SECU-0003 | false |
| SECU-0006 | SECU-0006 | SECU-0003 | false |
| SECU-0007 | SECU-0007 | SECU-0003 | false |

**t_soc2_security_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0001 | 2023-08-15 |
| SECU-0002 | SECU-0002 | SECU-0001 | 2024-04-12 |
| SECU-0003 | SECU-0003 | SECU-0001 | 2024-01-26 |
| SECU-0004 | SECU-0004 | SECU-0001 | 2025-05-01 |
| SECU-0005 | SECU-0005 | SECU-0001 | 2023-05-03 |
| SECU-0006 | SECU-0006 | SECU-0001 | 2025-05-11 |
| SECU-0007 | SECU-0007 | SECU-0001 | 2024-10-21 |

**t_soc2_security_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0004 | 5 |
| SECU-0002 | SECU-0001 | SECU-0005 | 926 |
| SECU-0003 | SECU-0002 | SECU-0004 | 1 |
| SECU-0004 | SECU-0002 | SECU-0005 | 849 |
| SECU-0005 | SECU-0003 | SECU-0004 | 2 |
| SECU-0006 | SECU-0003 | SECU-0005 | 409 |
| SECU-0007 | SECU-0004 | SECU-0004 | 5 |
| SECU-0008 | SECU-0004 | SECU-0005 | 551 |

**t_soc2_security_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0007 | Encoding 01 |
| SECU-0002 | SECU-0001 | SECU-0002 | Enforcement 02 |
| SECU-0003 | SECU-0001 | SECU-0008 | audit excerpt |
| SECU-0004 | SECU-0001 | SECU-0009 | de |
| SECU-0005 | SECU-0001 | SECU-0006 | Scope 05 |
| SECU-0006 | SECU-0002 | SECU-0007 | Encoding 06 |
| SECU-0007 | SECU-0002 | SECU-0002 | Enforcement 07 |
| SECU-0008 | SECU-0002 | SECU-0008 | audit excerpt |

The entity column functions as the foreign key that binds attribute values to their governing security subclass. When entity_id reads SECU-0001, it references the SOC2-CloudInfra classification mapped to the Virtual Networks domain; when it reads SECU-0002, it points to SOC3-Public within the Microservice Mesh domain. This linkage is critical for compliance auditing, as it allows an auditor to reconstruct the complete attribute profile of any security subclass by joining value tables on entity_id. The same entity may appear across multiple value tables, carrying a boolean, a date, an integer, and a string simultaneously, each governed by its own attr_id. The result is a denormalized but query-efficient model where all attributes of a given entity are retrievable through a single join key.

Beyond SOC2 classifications, the system extends attribute-based governance to student privacy expectations, where the same structural principles apply under a different domain. The table t_student_privacy_expectation assigns each expectation—Casey Nguyen, Sam Rivera, Emma Wilson, David Kim—to a protected location such as Disciplinary Archive, Counseling Records, or Biometric Scanner. A confidence score quantifies the system's certainty in the classification: 0.655 for Casey Nguyen, 0.908 for Sam Rivera, 0.047 for Emma Wilson, and 0.667 for David Kim. These scores are not arbitrary; they reflect the output of a classification engine that weighs contextual signals before committing a privacy expectation to the registry. The dimension_kind column—mass, time, length, pressure—adds a further layer of semantic categorization, though its application to privacy expectations suggests a cross-domain taxonomy that may be inherited from a broader data classification framework.

**t_student_privacy_expectation**

| id | student_privacy_expectation | applies_to | confidence | dimension_kind |
| --- | --- | --- | --- | --- |
| EXPE-0001 | Casey Nguyen | Disciplinary Archive | 0.655 | mass |
| EXPE-0002 | Sam Rivera | Counseling Records | 0.908 | time |
| EXPE-0003 | Emma Wilson | Biometric Scanner | 0.047 | length |
| EXPE-0004 | David Kim | Biometric Scanner | 0.667 | pressure |
| EXPE-0005 | Emma Wilson | Athletics Roster | 0.940 | temperature |
| EXPE-0006 | Maria Gonzalez | Research Lab Server | 0.441 | temperature |
| EXPE-0007 | Alex Chen | Student Health Portal | 0.209 | time |
| EXPE-0008 | Priya Patel | Cafeteria POS | 0.835 | temperature |

Instrument metadata follows a parallel but distinct pattern, where the attributes of interest are operational rather than policy-driven. The table t_instrument_only_emits_type records that a Seismograph emits an Acoustic echo, an Ion chamber produces an Ultrasound pulse, an Acoustic transducer generates Infrared radiation, and a second Ion chamber delivers a Telemetry stream. Each instrument is assigned a created_date—2024-12-01, 2023-12-08, 2023-01-25, 2024-07-30—and a size_bytes value that ranges from 370,347,470 to 631,989,835 bytes. These fields serve as provenance and capacity markers, enabling operators to track when instruments were registered and how much storage their associated data artifacts consume. The identifier column—TYPE-0001 through TYPE-0004—provides the stable key for downstream joins, though this table does not participate in the polymorphic attribute-value model that governs the SOC2 and privacy tables.

**t_instrument_only_emits_type**

| id | instrument | emits_signal | created_date | size_bytes |
| --- | --- | --- | --- | --- |
| TYPE-0001 | Seismograph | Acoustic echo | 2024-12-01 | 370347470 |
| TYPE-0002 | Ion chamber | Ultrasound pulse | 2023-12-08 | 631989835 |
| TYPE-0003 | Acoustic transducer | Infrared radiation | 2023-01-25 | 565520223 |
| TYPE-0004 | Ion chamber | Telemetry stream | 2024-07-30 | 541950157 |
| TYPE-0005 | Spectrometer | RF pulse | 2024-06-22 | 83957422 |
| TYPE-0006 | Magnetometer | Acoustic echo | 2024-05-04 | 105995168 |
| TYPE-0007 | Particle detector | Ultrasound pulse | 2024-10-26 | 587447986 |

The interplay between these tables reveals a design philosophy that separates schema from instance, type from value, and policy from enforcement target. The attr and attr_type columns define the vocabulary; the value tables instantiate it; the entity column anchors each instantiation to a specific security subclass or privacy expectation; and the identifier columns provide the stable keys that make relational joins possible. Confidence scores and dimension kinds add probabilistic and categorical metadata where deterministic classification is insufficient. Created dates and size bytes serve operational concerns of provenance and capacity planning. Together, these columns form a coherent data model that supports compliance auditing, privacy governance, and instrument lifecycle management within a single unified architecture.