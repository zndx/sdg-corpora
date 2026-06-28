---
chapter_id: ch_live_subclass_to_directive_ice_f89263
topic_id: 47
family: 01_foundation
cited_terms: ['subclass_to_directive_ice', 'lineage_edge_with_provenance', 'functional_dependency_lhs']
model: engine-refine
---

In governance and lineage systems, stable identifiers anchor every assertion that must survive audit, reconciliation, and cross-system exchange. An identifier such as ICE-0001 or PROV-0003 is not merely a surrogate key: it binds a policy subclass, a lineage edge, or a functional-dependency fact to a single durable referent so that downstream consumers can resolve the same object across directive registries, provenance graphs, and analytic fact tables without ambiguity. Where identifiers proliferate across namespaces—ICE-0004 alongside LHS-0004, for example—their prefix and numbering convention signal entity class and lifecycle stage, while the numeric suffix preserves ordering and traceability within that class. Operational practice therefore treats identifier assignment as a first-class control: once issued, an identifier must not be recycled, and every foreign reference (as when fact_functional cites LHS-0006 as an f_d_left_hand_side key) must resolve to a row in the governing dimension or registry or be rejected as a referential integrity violation.

Label text supplies the human-facing surface form that identifiers deliberately abstract away. In directive and lineage contexts, label_text values such as intake form, calibration record, and nightly summary denote artifact types or document roles rather than opaque codes, enabling stewards and auditors to recognize what is being governed without decoding internal keys. The same label may appear on multiple identifiers—nightly summary attaches to ICE-0003, PROV-0001, PROV-0002, and PROV-0003—because label text describes a semantic role shared across distinct policy and lineage records, not a one-to-one synonym for any single identifier. Encoding, recorded alongside these labels and directives, specifies the character representation under which that text and its associated payloads are stored and transmitted: ascii for ICE-0001 and ICE-0002, unicode for ICE-0003 and ICE-0004, utf8 on provenance edges PROV-0001 and PROV-0003, and mixed ascii/unicode elsewhere in the lineage set. Mismatches between declared encoding and actual byte sequences are a common source of validation failure at gateway boundaries; hence encoding is treated as a compliance attribute, not an implementation detail, particularly where EncryptionStandard directives (ICE-0002) or Regulatory-Reporting-API endpoints (PROV-0004) impose charset and interchange constraints.

The f_d_left_hand_side—functional dependency left-hand side—names the determinant side of a declared dependency in the analytic layer: the set of attributes whose values functionally determine some right-hand outcome captured elsewhere in the model. Each determinant is keyed (LHS-0001 through LHS-0006 in the observed facts) and described in dimension table dim_f_d_left_hand_side by f_d_left_hand_side_label entries such as F D Left Hand Side Label 01 and by f_d_left_hand_side_category values that partition determinants into F D Left Hand Side Category 01 through Category 04. Category thus performs taxonomic work that labels alone cannot: it groups determinants for policy application, sampling, and escalation rules, while the label remains the display string for lineage reports and steward consoles. Fact rows in fact_functional then attach quantitative evidence to specific dependency assertions: the f_d_left_hand_side_key column points from an asserting fact (LHS-0001, LHS-0002, etc.) to the determinant under test—often another LHS key, as when LHS-0001 and LHS-0003 both reference LHS-0006, or when LHS-0004 references LHS-0001—encoding a directed structure of dependency hypotheses or measured relationships within the graph.

Confidence and uncertainty quantify complementary aspects of that evidence and must be read jointly. Confidence, expressed on a bounded scale (0.117 through 0.950 in the sample), states the assessed probability or strength that the declared functional dependency holds under the observation model used to produce the fact; a value of 0.950 on LHS-0004 signals a near-certain dependency between its f_d_left_hand_side_key and the implied right-hand side, whereas 0.130 on LHS-0002 and 0.117 on LHS-0003 mark weak or contested assertions that should not drive automated enforcement without human review. Uncertainty, given in the same fact records as magnitudes such as 249.67, 197.20, 994.01, and 187.13, characterizes dispersion or error bounds around the estimated relationship—large uncertainty on LHS-0003 (994.01) co-occurring with very low confidence (0.117) is a canonical pattern for deferring commitment and retaining the dependency in a monitoring state rather than promoting it to a hard constraint. Governance workflows typically threshold on both dimensions so that high-confidence, low-uncertainty facts become binding rules, and the remainder feed exception queues.

The misc field—materialized here as numeric value on fact_functional and as f_d_left_hand_side_label or f_d_left_hand_side_category on the dimension—carries the residual payload that the named governance columns do not subsume. On facts, value (163.64, 234.79, 139.46, 896.76) may represent a measured statistic, a cost or lag metric, or another scalar summary tied to the dependency test; it is typed as miscellaneous in the handbook because its domain semantics are context-specific, resolved only through the category and label of the associated f_d_left_hand_side and through the lineage or directive path that produced the observation. On the dimension, the parallel misc columns hold descriptive strings rather than numerics, illustrating that misc is a structural bucket for attribute values whose interpretive contract is defined by the enclosing entity, not by the column name alone. Readers should therefore never treat misc as semantically void: in audit, the identifier links to category and label for meaning, while confidence, uncertainty, and value supply the quantitative record of why a given dependency was accepted, rejected, or left provisional.

**fact_functional**

| id | f_d_left_hand_side_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| LHS-0001 | LHS-0006 | 0.516 | 249.67 | 163.64 |
| LHS-0002 | LHS-0002 | 0.130 | 197.20 | 234.79 |
| LHS-0003 | LHS-0006 | 0.117 | 994.01 | 139.46 |
| LHS-0004 | LHS-0001 | 0.950 | 187.13 | 896.76 |
| LHS-0005 | LHS-0003 | 0.902 | 938.45 | 27.14 |
| LHS-0006 | LHS-0002 | 0.388 | 256.27 | 476.93 |
| LHS-0007 | LHS-0001 | 0.665 | 479.74 | 169.53 |

**dim_f_d_left_hand_side**

| id | f_d_left_hand_side_label | f_d_left_hand_side_category |
| --- | --- | --- |
| LHS-0001 | F D Left Hand Side Label 01 | F D Left Hand Side Category 01 |
| LHS-0002 | F D Left Hand Side Label 02 | F D Left Hand Side Category 02 |
| LHS-0003 | F D Left Hand Side Label 03 | F D Left Hand Side Category 03 |
| LHS-0004 | F D Left Hand Side Label 04 | F D Left Hand Side Category 04 |
| LHS-0005 | F D Left Hand Side Label 05 | F D Left Hand Side Category 05 |
| LHS-0006 | F D Left Hand Side Label 06 | F D Left Hand Side Category 06 |

In operational practice, these elements compose a closed evidentiary chain from policy to lineage to measured dependency. Directive identifiers (ICE-0001’s ProvenanceTraceRequirement, ICE-0003’s CalibrationInstruction) establish what must be true; lineage identifiers (PROV-0002’s climate-model-updates through Edge-Gateway-Router, PROV-0004’s financial-reconciliation-run through Regulatory-Reporting-API) record where transformations occurred and under which encoding and label_text artifacts were handled; f_d_left_hand_side keys and categories classify which determinants are in scope; and fact_functional rows attach confidence, uncertainty, and value to specific key references. A steward verifying nightly summary artifacts traces label_text across ICE and PROV records, confirms utf8 or unicode encoding at the edge, then inspects whether functional facts referencing shared determinants like LHS-0006 meet organizational thresholds. Failure at any layer—unresolved identifier, mislabeled artifact, charset drift, or a low-confidence/high-uncertainty fact—breaks the chain without invalidating the framework: it localizes remediation to the deficient control point, which is precisely why identifier, labeltext, encoding, category, f_d_left_hand_side, confidence, uncertainty, and misc are maintained as explicit, evidence-bearing fields rather than inferred metadata.

**t_subclass_to_directive_ice**

| id | directive | encoding | label_text |
| --- | --- | --- | --- |
| ICE-0001 | ProvenanceTraceRequirement | ascii | intake form |
| ICE-0002 | EncryptionStandard | ascii | calibration record |
| ICE-0003 | CalibrationInstruction | unicode | nightly summary |
| ICE-0004 | CalibrationInstruction | unicode | intake form |
| ICE-0005 | BatchIngestionRule | ascii | nightly summary |

**t_lineage_edge_with_provenance**

| id | lineage | with_provenance | encoding | label_text |
| --- | --- | --- | --- | --- |
| PROV-0001 | log-rotation-archival | Audit-Trail-Service | utf8 | nightly summary |
| PROV-0002 | climate-model-updates | Edge-Gateway-Router | unicode | nightly summary |
| PROV-0003 | sensor-calibration-pipeline | Edge-Gateway-Router | utf8 | nightly summary |
| PROV-0004 | financial-reconciliation-run | Regulatory-Reporting-API | ascii | calibration record |
| PROV-0005 | batch-ingestion-v4 | Regulatory-Reporting-API | ascii | audit excerpt |
| PROV-0006 | telemetry-aggregation-flow | Field-Sensor-Array | unicode | audit excerpt |
| PROV-0007 | climate-model-updates | Primary-Database-Cluster | ascii | change rationale |
| PROV-0008 | log-rotation-archival | AWS-S3-source-bucket | latin1 | change rationale |