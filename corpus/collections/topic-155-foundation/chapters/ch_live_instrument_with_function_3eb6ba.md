---
chapter_id: ch_live_instrument_with_function_3eb6ba
topic_id: 155
family: 01_foundation
cited_terms: ['instrument_with_function', 'conceptual_construction_process', 'policy_authored_by']
model: engine-refine
---

An identifier anchors every governed object in a compliance-oriented knowledge graph so that assertions, lineage, and policy bindings remain unambiguous across systems that otherwise describe the same real-world artifact under different names. In instrument–function registries, stable keys such as FUNC-0001 through FUNC-0004 denote distinct capability records—signal amplification realized by a Keysight DSOX3024T, temperature measurement by a Thermo Q Exactive, concentration quantification by a Zygo NewView, and gas composition by an Agilent 5975C—without conflating the instrument label with the functional role it performs. The identifier is therefore not merely a surrogate primary key; it is the durable handle through which downstream attribute tables, validation rules, and audit trails refer to the same entity regardless of renaming, vendor migration, or schema revision.

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | Signal Amplification |
| FUNC-0002 | Thermo Q Exactive | Temperature Measurement |
| FUNC-0003 | Zygo NewView | Concentration Quantification |
| FUNC-0004 | Agilent 5975C | Gas Composition |
| FUNC-0005 | Agilent 5975C | Gas Composition |
| FUNC-0006 | Agilent 5975C | Pressure Monitoring |

**t_instrument_with_function_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| FUNC-0001 | checksum | xsd:string |
| FUNC-0002 | created_date | xsd:date |
| FUNC-0003 | identifier | cco:DesignativeICE |
| FUNC-0004 | license | xsd:string |
| FUNC-0005 | mime_type | xsd:string |
| FUNC-0006 | size_bytes | xsd:long |
| FUNC-0007 | uri | xsd:string |
| FUNC-0008 | version | xsd:integer |

**t_instrument_with_function_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0002 | 2024-09-19 |
| FUNC-0002 | FUNC-0002 | FUNC-0002 | 2023-09-07 |
| FUNC-0003 | FUNC-0003 | FUNC-0002 | 2024-09-12 |
| FUNC-0004 | FUNC-0004 | FUNC-0002 | 2024-08-15 |
| FUNC-0005 | FUNC-0005 | FUNC-0002 | 2025-05-20 |
| FUNC-0006 | FUNC-0006 | FUNC-0002 | 2023-09-16 |

**t_instrument_with_function_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0006 | 359 |
| FUNC-0002 | FUNC-0001 | FUNC-0008 | 4 |
| FUNC-0003 | FUNC-0002 | FUNC-0006 | 439 |
| FUNC-0004 | FUNC-0002 | FUNC-0008 | 6 |
| FUNC-0005 | FUNC-0003 | FUNC-0006 | 255 |
| FUNC-0006 | FUNC-0003 | FUNC-0008 | 10 |
| FUNC-0007 | FUNC-0004 | FUNC-0006 | 467 |
| FUNC-0008 | FUNC-0004 | FUNC-0008 | 3 |

**t_instrument_with_function_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| FUNC-0001 | FUNC-0001 | FUNC-0001 | a3f9c21e |
| FUNC-0002 | FUNC-0001 | FUNC-0003 | ref-8842 |
| FUNC-0003 | FUNC-0001 | FUNC-0004 | MPL-2.0 |
| FUNC-0004 | FUNC-0001 | FUNC-0009 | us-east-1 |
| FUNC-0005 | FUNC-0001 | FUNC-0005 | text/plain |
| FUNC-0006 | FUNC-0001 | FUNC-0010 | Name 06 |
| FUNC-0007 | FUNC-0001 | FUNC-0011 | sre |
| FUNC-0008 | FUNC-0001 | FUNC-0012 | Tags 08 |

The entity is the semantic unit those identifiers denote: a function assignment, a policy artifact, or a construction episode whose properties are asserted elsewhere. Attribute definitions decouple *what may be said* from *what was said*: attr names such as checksum, created_date, identifier, and license declare the permitted slots, while attr_type constrains admissible literals—xsd:string for opaque text, xsd:date for temporal stamps, and ontology-typed classes such as cco:DesignativeICE where the value must be interpreted as a designative information content entity rather than a free-form string. Typed value stores then materialize entity–attribute pairs: varchar payloads carry checksums (a3f9c21e), cross-system references (ref-8842), license tokens (MPL-2.0), and deployment regions (us-east-1); integer tables record cardinalities or counts (359, 4, 439, 6); date tables bind creation or observation instants (2024-09-19 through 2024-08-15). The misc column in each value relation holds the literal itself—the evidentiary residue—while entity_id and attr_id jointly specify which object and which declared slot the literal satisfies, enabling validators to reject mistyped or orphan assertions before they enter authoritative catalogs.

Conceptual construction processes explain how raw conceptual inputs become machine-usable predicates without pretending that metadata arrives fully formed. Each conceptualconstructionprocess—HierarchicalEdge, Semantic Enrichment, or CausalDependency—operates on a subjectconcept such as a Raw Data Dictionary, Unstructured Log Streams, a Raw Metadata Catalog, or Raw Sensor Readings, and emits a constructedpredicate: CrossReferenceLink, Provenance Tracing, Data Model Refinement, or Schema Derivation respectively. The pairing is directional: the subjectconcept names the pre-structured material domain, the process names the interpretive operation applied to it, and the constructedpredicate names the relational artifact the operation is expected to leave behind. Governance frameworks treat these triples as auditable transformation claims—evidence that a cross-reference was derived by edge induction rather than asserted by fiat, or that a schema was derived from causal dependencies among sensor streams rather than copied from a template. When the same process label recurs across distinct subjects (HierarchicalEdge applied both to dictionaries and log streams), reviewers infer a reusable construction pattern whose outputs nonetheless differ in predicate type, preserving traceability without forcing a one-to-one map between process name and semantic product.

**t_conceptual_construction_process**

| id | conceptual_construction_process | transforms_subject | generates_predicate |
| --- | --- | --- | --- |
| PROC-0001 | HierarchicalEdge | Raw Data Dictionary | CrossReferenceLink |
| PROC-0002 | HierarchicalEdge | Unstructured Log Streams | Provenance Tracing |
| PROC-0003 | Semantic Enrichment | Raw Metadata Catalog | Data Model Refinement |
| PROC-0004 | CausalDependency | Raw Sensor Readings | Schema Derivation |
| PROC-0005 | HierarchicalEdge | Unaligned Concept Lists | Schema Derivation |

Encoding and ismandatory sit at the boundary between representational fidelity and normative force. Encoding declares the character repertoire and byte-level contract under which a policy text is stored and exchanged—latin1 for several NIST- and Commission-authored instruments, ascii where the ISO 27001 Controls corpus demands strict seven-bit interchange—so that parsers, digital signatures, and diff engines do not silently corrupt normative language during ingestion or republication. ismandatory distinguishes obligations from guidance: AWS IAM Permission Boundary and PCI DSS Access Standards remain non-mandatory in the captured registry (false), whereas ISO 27001 Controls and the EU AI Risk Framework are marked true, signaling that absence of conforming controls constitutes a compliance gap rather than a discretionary improvement. Together, identifier-linked policy rows (AUTH-0001 through AUTH-0004), authorship attribution (European Commission, NIST Computer Security, Federal Trade Commission), and these two metadata fields allow entitlement systems to filter enforceable baselines, route attestations to the correct authority, and preserve textual integrity from authoring through enforcement.

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

In operational practice, the constructs interlock. Identifiers thread from core entity tables into typed value partitions so that a single FUNC-0002 record can simultaneously carry a created_date in a date store, integer metrics keyed to FUNC-0006 or FUNC-0008, and varchar license metadata without collapsing heterogeneous literals into one untyped bag. attr_type enforcement prevents category errors—dates cannot masquerade as designative identifiers, licenses cannot be parsed as integers—while conceptual construction processes document the epistemic path from raw subject matter to derived predicates that those attributes later describe. Policy metadata then overlays the same identifier discipline: mandatory frameworks demand evidentiary attributes (checksums, creation dates, authoritative identifiers) whose types are known in advance, encoded under declared character sets, and bound to entities that construction processes have already lifted from raw catalogs into cross-referenced, provenance-aware models. The domain’s value lies precisely in this separation of concerns—identity, declaration, literal, transformation, and obligation—each densely evidenced yet independently governable, so that an auditor can reconstruct not only what was recorded, but under which type, for which entity, through which construction claim, and with what normative weight.