---
chapter_id: ch_live_schemaorg_place_latitude_08c40a
topic_id: 0
family: 07_long_tail
cited_terms: ['schemaorg_place_latitude', 'subclass_to_independent_continuant', 'pdsa_improvement_model']
model: engine-refine
---

The ontology of attribute-value binding rests on a tripartite decomposition that separates the definition of an attribute from its type and its concrete instantiation. Within the attribute registry, each attribute carries a name—such as `location`, `name`, `owner`, or `tags`—and a type drawn from a schema-aware namespace: `xsd:string` for free-form text, `cco:Person` for entity references, and analogous type codes for other domains. These type declarations are not merely documentation; they constrain the shape of values that downstream tables may accept. The instantiation layer, `t_subclass_to_independent_continuant_val_varchar`, binds a specific entity—identified by a surrogate key such as `CONT-0001`—to an attribute key and supplies a string value like `on-prem-dc1` or `sre`. The entity itself is catalogued in `t_subclass_to_independent_continuant`, where identifiers such as `CONT-0001` through `CONT-0004` map to physical or logical resources: `Audit Log Stream 5`, `Firewall Appliance 7`, `Server Rack 14A`. This separation of type, entity, and value permits a single attribute definition to be reused across heterogeneous resources without schema migration.

**t_subclass_to_independent_continuant**

| id | independent |
| --- | --- |
| CONT-0001 | Audit Log Stream 5 |
| CONT-0002 | Audit Log Stream 5 |
| CONT-0003 | Firewall Appliance 7 |
| CONT-0004 | Server Rack 14A |
| CONT-0005 | Sensor Node 7B |
| CONT-0006 | Server Rack 14A |

**t_subclass_to_independent_continuant_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | location | xsd:string |
| CONT-0002 | name | xsd:string |
| CONT-0003 | owner | cco:Person |
| CONT-0004 | tags | xsd:string |

**t_subclass_to_independent_continuant_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | on-prem-dc1 |
| CONT-0002 | CONT-0001 | CONT-0002 | Name 02 |
| CONT-0003 | CONT-0001 | CONT-0003 | sre |
| CONT-0004 | CONT-0001 | CONT-0004 | Tags 04 |
| CONT-0005 | CONT-0002 | CONT-0001 | us-east-1 |
| CONT-0006 | CONT-0002 | CONT-0002 | Name 06 |
| CONT-0007 | CONT-0002 | CONT-0003 | sre |
| CONT-0008 | CONT-0002 | CONT-0004 | Tags 08 |

Metadata about schema artifacts is tracked through a fact table that records version, size, and a latitude key linking to a dimension table of latitude labels and categories. The `fact_schemaorg` table stores identifiers such as `LATI-0001` through `LATI-0004`, each associated with a `latitude_key` that resolves to a label like `Latitude Label 01` and a category such as `Latitude Category 01`. File sizes range from approximately 114 MB to nearly 1 GB, and versions span from 3 to 8, reflecting iterative refinement of the underlying schema definitions. The dimension table `dim_latitude` provides the human-readable label and categorical classification for each latitude key, enabling queries that group or filter schema facts by their categorical assignment. This latitude mechanism functions as a classification axis, orthogonal to the attribute-value domain, allowing schema artifacts to be organized along an independent taxonomy.

**fact_schemaorg**

| id | latitude_key | size_bytes | version |
| --- | --- | --- | --- |
| LATI-0001 | LATI-0002 | 895265030 | 3 |
| LATI-0002 | LATI-0003 | 114301972 | 5 |
| LATI-0003 | LATI-0002 | 338701831 | 4 |
| LATI-0004 | LATI-0005 | 998785819 | 8 |

**dim_latitude**

| id | latitude_label | latitude_category |
| --- | --- | --- |
| LATI-0001 | Latitude Label 01 | Latitude Category 01 |
| LATI-0002 | Latitude Label 02 | Latitude Category 02 |
| LATI-0003 | Latitude Label 03 | Latitude Category 03 |
| LATI-0004 | Latitude Label 04 | Latitude Category 04 |
| LATI-0005 | Latitude Label 05 | Latitude Category 05 |
| LATI-0006 | Latitude Label 06 | Latitude Category 06 |
| LATI-0007 | Latitude Label 07 | Latitude Category 07 |
| LATI-0008 | Latitude Label 08 | Latitude Category 08 |

The core operational domain concerns the PDSA (Plan-Do-Study-Act) improvement model, which serves as the central entity through which clinical care standards and patient outcomes are linked. Each improvement model—identified by keys such as `MODE-0001` through `MODE-0004`—is named descriptively: `Opioid-Taper-Init`, `Insulin-Protocol-Opt`, `Sepsis-Protocol-V2`, `Bedside-Handoff-Rev`. These models are associated with clinical care targets through a direct mapping table, where a single model may improve multiple standards. For instance, `MODE-0001` and `MODE-0002` both target `Wound-Care-Standard`, while `MODE-0003` targets `Hand-Hygiene-Protocol`. The clinical care entities themselves are named as procedural standards, suggesting that the system tracks not just what is improved but the specific protocol or standard that serves as the improvement target.

The relationship between improvement models and patient outcomes is mediated through a junction table that introduces both a role and a cardinality note, adding semantic richness to what would otherwise be a simple many-to-many association. The `t_pdsa_improvement_model__optimizes` table records which models optimize which outcomes—such as `Pain-Management-Score`, `Complication-Rate`, `Adverse-Event-Frequency`, or `Functional-Recovery-Time`—and assigns each association a role (`reviewer`, `contributor`, or `owner`) and a cardinality note (`Cardinality Note 01` through `Cardinality Note 04`). The role field encodes the nature of the model's relationship to the outcome: an `owner` model bears primary responsibility for driving improvement in that outcome, a `contributor` model supports the outcome as part of a broader effort, and a `reviewer` model evaluates or audits the outcome's trajectory. Cardinality notes provide additional structural information about the multiplicity or constraints of the relationship, though their specific semantics are captured in the coded labels rather than in free text. A parallel junction table, `t_pdsa_improvement_model__improves`, applies the same role taxonomy to the clinical care improvement relationships, with identifiers such as `MODE-0001` appearing with both `reviewer` and `contributor` roles for different improvement targets, indicating that a single model can play multiple distinct roles across its portfolio of targets.

**t_pdsa_improvement_model**

| id | p_d_s_a_improvement_model |
| --- | --- |
| MODE-0001 | Opioid-Taper-Init |
| MODE-0002 | Insulin-Protocol-Opt |
| MODE-0003 | Sepsis-Protocol-V2 |
| MODE-0004 | Bedside-Handoff-Rev |
| MODE-0005 | Fall-Prevention-Q4 |
| MODE-0006 | Bedside-Handoff-Rev |

**t_pdsa_improvement_model_improves**

| id | improves |
| --- | --- |
| MODE-0001 | Wound-Care-Standard |
| MODE-0002 | Wound-Care-Standard |
| MODE-0003 | Hand-Hygiene-Protocol |
| MODE-0004 | Wound-Care-Standard |
| MODE-0005 | Medication-Reconciliation |
| MODE-0006 | Ventilator-Management |
| MODE-0007 | Ventilator-Management |
| MODE-0008 | Wound-Care-Standard |

**t_pdsa_improvement_model__improves**

| id | pdsa_id | improves_id | role |
| --- | --- | --- | --- |
| MODE-0001 | MODE-0001 | MODE-0005 | reviewer |
| MODE-0002 | MODE-0001 | MODE-0006 | contributor |
| MODE-0003 | MODE-0004 | MODE-0003 | contributor |
| MODE-0004 | MODE-0005 | MODE-0004 | owner |
| MODE-0005 | MODE-0003 | MODE-0005 | contributor |
| MODE-0006 | MODE-0003 | MODE-0002 | owner |
| MODE-0007 | MODE-0001 | MODE-0008 | owner |
| MODE-0008 | MODE-0001 | MODE-0008 | observer |

**t_pdsa_improvement_model_optimizes**

| id | optimizes |
| --- | --- |
| MODE-0001 | Pain-Management-Score |
| MODE-0002 | Complication-Rate |
| MODE-0003 | Adverse-Event-Frequency |
| MODE-0004 | Functional-Recovery-Time |
| MODE-0005 | LOS-Reduction |
| MODE-0006 | Complication-Rate |

**t_pdsa_improvement_model__optimizes**

| id | pdsa_id | optimizes_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| MODE-0001 | MODE-0005 | MODE-0005 | reviewer | Cardinality Note 01 |
| MODE-0002 | MODE-0001 | MODE-0004 | owner | Cardinality Note 02 |
| MODE-0003 | MODE-0003 | MODE-0001 | contributor | Cardinality Note 03 |
| MODE-0004 | MODE-0005 | MODE-0004 | owner | Cardinality Note 04 |
| MODE-0005 | MODE-0005 | MODE-0003 | contributor | Cardinality Note 05 |
| MODE-0006 | MODE-0005 | MODE-0004 | observer | Cardinality Note 06 |
| MODE-0007 | MODE-0005 | MODE-0006 | owner | Cardinality Note 07 |
| MODE-0008 | MODE-0006 | MODE-0004 | reviewer | Cardinality Note 08 |