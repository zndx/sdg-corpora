---
chapter_id: ch_live_regional_quality_benchmark_3cfbf4
topic_id: 183
family: 08_derived
cited_terms: ['regional_quality_benchmark', 'control_basic', 'verification_with_method']
model: engine-refine
---

The architecture of a compliance registry rests upon a disciplined nomenclature of identifiers that anchor every assertion to a reproducible lineage. Control definitions bear identifiers such as CONT-0001 through CONT-0004, regional observations carry BENC-0001 through BENC-0004, and verification procedures are indexed as METH-0001 through METH-0004. These identifiers function as the immutable keys that permit cross-referencing across the dimensional and fact structures of the registry, ensuring that a control obligation, a regional measurement, and a verification method can be traced to their originating records without ambiguity. The identifier column, universally designated as the primary key, provides the structural backbone upon which all foreign-key relationships are constructed.

**t_control_basic**

| id | control | effective_date | mandatory |
| --- | --- | --- | --- |
| CONT-0001 | Anomaly detection limit | 2025-01-22 | false |
| CONT-0002 | Audit logging standard | 2025-04-27 | false |
| CONT-0003 | Data retention mandate | 2024-12-05 | true |
| CONT-0004 | Anomaly detection limit | 2025-05-27 | true |
| CONT-0005 | PII masking policy | 2025-02-05 | false |
| CONT-0006 | Rate limiting rule | 2023-06-05 | false |
| CONT-0007 | Checksum verification rule | 2024-10-11 | false |

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

Embedded within the regional fact table are two complementary measures of epistemic quality: confidence and uncertainty. Confidence values range from a negligible 0.036 to a robust 0.818, reflecting the degree of assurance that a given regional observation warrants in downstream compliance decisions. Paired with this, uncertainty quantifies the dispersion or error bound associated with each measurement, with values spanning from 253.71 to 762.47. A regional observation with identifier BENC-0002, for instance, carries a confidence of 0.601 and an uncertainty of 253.71, while BENC-0004 presents a confidence of 0.286 alongside a substantially higher uncertainty of 762.47. These paired metrics enable governance bodies to weight regional evidence appropriately when assessing regulatory posture, distinguishing well-substantiated findings from those that demand further investigation.

**fact_regional**

| id | regional_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| BENC-0001 | BENC-0001 | 0.036 | 509.32 | 915.44 |
| BENC-0002 | BENC-0001 | 0.601 | 253.71 | 567.07 |
| BENC-0003 | BENC-0004 | 0.818 | 510.50 | 179.17 |
| BENC-0004 | BENC-0006 | 0.286 | 762.47 | 261.10 |
| BENC-0005 | BENC-0004 | 0.995 | 619.46 | 410.15 |
| BENC-0006 | BENC-0005 | 0.995 | 647.39 | 276.26 |

Regional observations are classified through a dimension table that assigns each identifier a categorical label and a broader category designation. The regional_label column provides human-readable descriptors such as Regional Label 01 through Regional Label 04, while the regional_category column groups these into higher-level classifications like Regional Category 01 through Regional Category 04. The fact_regional table links to this dimension through the regional_key column, which references the identifier of the corresponding dimension record. This separation of measured values from categorical metadata follows a star-schema convention that permits independent evolution of classification taxonomies without perturbing the fact data itself.

**dim_regional**

| id | regional_label | regional_category |
| --- | --- | --- |
| BENC-0001 | Regional Label 01 | Regional Category 01 |
| BENC-0002 | Regional Label 02 | Regional Category 02 |
| BENC-0003 | Regional Label 03 | Regional Category 03 |
| BENC-0004 | Regional Label 04 | Regional Category 04 |
| BENC-0005 | Regional Label 05 | Regional Category 05 |
| BENC-0006 | Regional Label 06 | Regional Category 06 |

Control obligations are governed by two additional attributes that determine their operational force: the effective_date and the ismandatory flag. The effective_date establishes the temporal point from which a control becomes enforceable, with values such as 2024-12-05 for the Data retention mandate (CONT-0003) and 2025-05-27 for the Anomaly detection limit (CONT-0004). The ismandatory column distinguishes between compulsory and discretionary controls, with entries like CONT-0003 and CONT-0004 marked as true, while CONT-0001 (Anomaly detection limit) and CONT-0002 (Audit logging standard) are marked as false. This binary distinction, combined with temporal scoping, enables automated compliance engines to evaluate which controls are both active and binding at any given point in time.

The verification apparatus introduces a relational layer in which verification methods assume distinct roles within cross-referencing relationships. A junction table maps verification identifiers to method identifiers through a role column that assigns each pairing one of four positional designations: reviewer, contributor, owner, or observer. For example, the verification METH-0001 is linked to the method METH-0004 in a reviewer capacity, while METH-0003 connects to METH-0002 as an owner. The subject column (verification_id) and the target column (via_verification_method_id) define the directionality of these relationships, establishing a directed graph of verification dependencies. This role-based relationship model permits fine-grained accountability, distinguishing between entities that author verification procedures, those that audit them, and those that merely observe their execution.

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