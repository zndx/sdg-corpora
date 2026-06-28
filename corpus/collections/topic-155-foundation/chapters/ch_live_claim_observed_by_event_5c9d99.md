---
chapter_id: ch_live_claim_observed_by_event_5c9d99
topic_id: 155
family: 07_long_tail
cited_terms: ['claim_observed_by_event', 'board_membership', 'instrument_with_function']
model: engine-refine
---

In governed operational and compliance systems, assertions about what occurred, who was involved, and which instruments performed which functions are rarely stored as undifferentiated text. They are decomposed into typed records whose fields encode distinct semantic roles: an identifier supplies durable reference across fact and dimension layers; a claim names the proposition under evaluation; confidence and uncertainty quantify complementary aspects of epistemic status; category situates records within a controlled vocabulary; and miscellaneous value slots hold payload data whose interpretation depends on surrounding type declarations. This separation is not administrative ornament. It is what permits downstream reconciliation, audit, and automated validation to treat each datum according to its intended meaning rather than according to surface string similarity.

**fact_claim**

| id | claim_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| EVEN-0001 | EVEN-0002 | 0.621 | 571.46 | 164.54 |
| EVEN-0002 | EVEN-0002 | 0.596 | 43.01 | 173.58 |
| EVEN-0003 | EVEN-0006 | 0.338 | 142.53 | 166.95 |
| EVEN-0004 | EVEN-0002 | 0.364 | 296.86 | 152.06 |
| EVEN-0005 | EVEN-0001 | 0.316 | 715.93 | 997.16 |
| EVEN-0006 | EVEN-0006 | 0.410 | 701.36 | 614.41 |
| EVEN-0007 | EVEN-0003 | 0.162 | 133.33 | 142.05 |

**dim_claim**

| id | claim_label | claim_category |
| --- | --- | --- |
| EVEN-0001 | Claim Label 01 | Claim Category 01 |
| EVEN-0002 | Claim Label 02 | Claim Category 02 |
| EVEN-0003 | Claim Label 03 | Claim Category 03 |
| EVEN-0004 | Claim Label 04 | Claim Category 04 |
| EVEN-0005 | Claim Label 05 | Claim Category 05 |
| EVEN-0006 | Claim Label 06 | Claim Category 06 |

**t_instrument_with_function**

| id | instrument | realizes_function |
| --- | --- | --- |
| FUNC-0001 | Keysight DSOX3024T | Signal Amplification |
| FUNC-0002 | Thermo Q Exactive | Temperature Measurement |
| FUNC-0003 | Zygo NewView | Concentration Quantification |
| FUNC-0004 | Agilent 5975C | Gas Composition |
| FUNC-0005 | Agilent 5975C | Gas Composition |
| FUNC-0006 | Agilent 5975C | Pressure Monitoring |

The claim subsystem illustrates how identifiers, categories, and quantitative belief metrics cohere in practice. Dimension records assign each claim a stable key—EVEN-0001 through EVEN-0004—and pair it with a human-readable label and a claim category drawn from a four-class taxonomy (Claim Category 01 through Claim Category 04). Fact records then attach evidentiary measurements to those keys: a single claim identifier such as EVEN-0002 may appear on multiple fact rows, each carrying its own confidence score (0.596, 0.364) and uncertainty magnitude (43.01, 296.86), together with a numeric value field (173.58, 152.06) whose role is contextual rather than self-describing. High confidence does not imply low uncertainty in this design; the pair is reported independently, as when EVEN-0001 registers confidence 0.621 alongside uncertainty 571.46 and value 164.54, whereas EVEN-0003 exhibits the weakest confidence in the sample set (0.338) with intermediate uncertainty 142.53. Governance workflows therefore treat category as the primary routing signal for policy application, identifier as the join key for lineage, and the confidence–uncertainty pair as the quantitative basis for escalation thresholds.

Participation and event aggregation address a parallel question: not what is claimed, but how activity distributes across actors linked to a board or ledger. The has_participant relation binds fact rows to participant dimension entries through foreign keys such as MEMB-0005 and MEMB-0004, while participant labels and has_participant categories (Has Participant Category 01 through Has Participant Category 04) supply the interpretive frame within which those keys acquire operational meaning. Event count furnishes the cardinal summary: MEMB-0002 records 403 events against participant MEMB-0004, MEMB-0003 records 359 against MEMB-0002, and MEMB-0004 records only 26 against MEMB-0005—a dispersion that would be invisible if participation were flattened into unstructured prose. Identifier stability again governs traceability: board facts keyed MEMB-0001 through MEMB-0004 remain joinable to dimension metadata without ambiguity even when participant assignments cycle across the MEMB-000x namespace.

**fact_board**

| id | has_participant_key | event_count |
| --- | --- | --- |
| MEMB-0001 | MEMB-0005 | 236 |
| MEMB-0002 | MEMB-0004 | 403 |
| MEMB-0003 | MEMB-0002 | 359 |
| MEMB-0004 | MEMB-0005 | 26 |
| MEMB-0005 | MEMB-0004 | 209 |
| MEMB-0006 | MEMB-0005 | 369 |
| MEMB-0007 | MEMB-0004 | 133 |

Instrument–function modeling extends the same architectural discipline to laboratory and industrial assets. An entity—instances FUNC-0001 through FUNC-0004—denotes a concrete instrument paired with the function it realizes: a Keysight DSOX3024T associated with Signal Amplification, a Thermo Q Exactive with Temperature Measurement, a Zygo NewView with Concentration Quantification, and an Agilent 5975C with Gas Composition. Attributes (attr) name the metadata slots attached to each entity, and attr type declares the governing datatype or ontology class so that values are stored and validated in the correct representation layer. In the reference population, checksum and license carry xsd:string, created_date carries xsd:date, and identifier carries cco:DesignativeICE—a designative information content entity type suited to referential metadata rather than free text. Typed value relations then materialize those declarations: created_date values (2024-09-19, 2023-09-07, 2024-09-12, 2024-08-15) populate the date-valued store keyed to attr_id FUNC-0002; integer-valued attributes FUNC-0006 and FUNC-0008 hold counts such as 359, 4, 439, and 6; varchar-valued attributes FUNC-0001, FUNC-0003, FUNC-0004, and FUNC-0009 hold checksum hashes (a3f9c21e), cross-references (ref-8842), license tokens (MPL-2.0), and region codes (us-east-1). The entity–attr pairing on each row ensures that a value misc field never floats without type context.

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

Taken together, these constructs define a compliance-oriented information architecture in which category governs taxonomy, identifier governs identity and join integrity, claim and has_participant govern relational semantics over facts, confidence and uncertainty govern graded belief reporting, event count governs volumetric accountability, and attr with attr_type govern extensible, schema-checked metadata on entities. Miscellaneous value columns are deliberately generic at the storage boundary because their semantics are resolved upstream by dimension labels, downstream by attr_type, or laterally by the fact–dimension key that binds a row into a larger evidentiary graph. Operational maturity in such systems is measured less by the volume of recorded strings than by the consistency with which each field role is respected: claims remain claims, participants remain participants, instrument metadata remains typed, and quantitative fields remain paired with the uncertainty disclosures that prevent over-interpretation of point estimates. That discipline is what converts a collection of tables into an auditable domain model capable of supporting retrieval, policy enforcement, and defensible reporting under scrutiny.

**dim_has_participant**

| id | has_participant_label | has_participant_category |
| --- | --- | --- |
| MEMB-0001 | Has Participant Label 01 | Has Participant Category 01 |
| MEMB-0002 | Has Participant Label 02 | Has Participant Category 02 |
| MEMB-0003 | Has Participant Label 03 | Has Participant Category 03 |
| MEMB-0004 | Has Participant Label 04 | Has Participant Category 04 |
| MEMB-0005 | Has Participant Label 05 | Has Participant Category 05 |
| MEMB-0006 | Has Participant Label 06 | Has Participant Category 06 |