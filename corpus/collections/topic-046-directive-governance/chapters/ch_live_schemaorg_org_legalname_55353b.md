---
chapter_id: ch_live_schemaorg_org_legalname_55353b
topic_id: 46
family: 07_long_tail
cited_terms: ['schemaorg_org_legalname', 'schemaorg_person_named', 'evidence_subclass']
model: engine-refine
---

In governed knowledge systems, the six primitives—identifier, language, role, subject, target, and uncertainty—form the minimum contract by which assertions about organizations, persons, and evidentiary artifacts can be stored, queried, and audited without collapsing distinct entities into ambiguous text. An identifier is a durable surrogate key that outlives lexical variation and schema drift: organization records carry stable tokens such as `LEGA-0001` through `LEGA-0004`, person-name records `NAME-0001` through `NAME-0004`, and evidence rows `EVID-0001` through `EVID-0004`, each decoupling the system's internal referent from the human-readable label or external vocabulary URI. That separation matters because the same surface string may denote different referents (`Grace Hopper` appears under both `NAME-0001` and `NAME-0004`), while distinct strings may denote related but non-identical concepts (`CloudNative` as a schema.org path versus `CloudNative Solutions LLC` as a registered legal name). Identifiers therefore anchor lineage: every downstream association, evidentiary link, and compliance check resolves through keys, not through string equality alone.

**t_evidence_subclass**

| id | evidence | supports_claim | uncertainty | language |
| --- | --- | --- | --- | --- |
| EVID-0001 | IoT sensor reading batch | LEGA-0005 | 777.57 | ja |
| EVID-0002 | Query execution plan | LEGA-0001 | 535.87 | es |
| EVID-0003 | Western blot film | LEGA-0004 | 239.52 | fr |
| EVID-0004 | Western blot film | LEGA-0007 | 418.27 | fr |
| EVID-0005 | IoT sensor reading batch | LEGA-0004 | 969.30 | es |
| EVID-0006 | ETL pipeline log | LEGA-0003 | 692.45 | fr |

Subject and target articulate the directed semantics of those keys. In affiliation and naming graphs, the subject is the entity whose description is being qualified—typically the schema.org-aligned principal referenced by `schemaorg_id`—and the target is the attribute or related record being attached, such as a `legal_name_id` for organizations or a `full_name_id` for persons. A single junction row thus states a typed edge: `LEGA-0002` binds the organization principal `LEGA-0004` to legal-name record `LEGA-0004` under role `reviewer`, while `NAME-0003` binds person principal `NAME-0003` to full-name record `NAME-0002` under role `reviewer`. The pattern generalizes to evidence: `supports_claim` acts as the evidentiary target, naming which claim identifier a particular artifact is asserted to substantiate—`EVID-0001` toward `LEGA-0005`, `EVID-0002` toward `LEGA-0001`, and paired Western blot entries `EVID-0003` and `EVID-0004` toward `LEGA-0004` and `LEGA-0007` respectively. Operational discipline requires that subject and target types remain consistent across layers; when a junction references principals absent from the canonical entity table (`LEGA-0006` for an organization edge, `NAME-0005` for a person edge), the graph remains formally traversable yet semantically incomplete, surfacing referential integrity as a governance control rather than a mere database constraint.

**t_schemaorg_org_legalname**

| id | schemaorg |
| --- | --- |
| LEGA-0001 | person/marvin_minsky |
| LEGA-0002 | CloudNative |
| LEGA-0003 | person/john_von_neumann |
| LEGA-0004 | QuantumEdge |
| LEGA-0005 | DataBridge |
| LEGA-0006 | AeroSpaceX |
| LEGA-0007 | person/john_von_neumann |

**t_schemaorg_org_legalname_legal_name**

| id | legal_name |
| --- | --- |
| LEGA-0001 | TerraForma Holdings Ltd. |
| LEGA-0002 | CloudNative Solutions LLC |
| LEGA-0003 | Global Data Systems LLC |
| LEGA-0004 | Acme Corporation |
| LEGA-0005 | CloudNative Solutions LLC |
| LEGA-0006 | DataBridge Analytics Corp. |
| LEGA-0007 | TerraForma Holdings Ltd. |
| LEGA-0008 | Nexus Laboratories Inc. |

**t_schemaorg_org_legalname__legal_name**

| id | schemaorg_id | legal_name_id | role |
| --- | --- | --- | --- |
| LEGA-0001 | LEGA-0002 | LEGA-0005 | reviewer |
| LEGA-0002 | LEGA-0004 | LEGA-0007 | observer |
| LEGA-0003 | LEGA-0004 | LEGA-0004 | reviewer |
| LEGA-0004 | LEGA-0006 | LEGA-0008 | contributor |
| LEGA-0005 | LEGA-0003 | LEGA-0001 | reviewer |
| LEGA-0006 | LEGA-0007 | LEGA-0007 | reviewer |
| LEGA-0007 | LEGA-0005 | LEGA-0006 | owner |
| LEGA-0008 | LEGA-0003 | LEGA-0001 | contributor |

**t_schemaorg_person_named**

| id | schemaorg |
| --- | --- |
| NAME-0001 | person/rosalind_franklin |
| NAME-0002 | NexusLabs |
| NAME-0003 | GlobalDataInc |
| NAME-0004 | person/alan_kay |
| NAME-0005 | person/alan_turing |
| NAME-0006 | AcmeCorp |
| NAME-0007 | QuantumEdge |

**t_schemaorg_person_named_full_name**

| id | full_name |
| --- | --- |
| NAME-0001 | Grace Hopper |
| NAME-0002 | Donald Knuth |
| NAME-0003 | John von Neumann |
| NAME-0004 | Grace Hopper |
| NAME-0005 | Ada Lovelace |
| NAME-0006 | Alan Kay |

**t_schemaorg_person_named__full_name**

| id | schemaorg_id | full_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0003 | NAME-0002 | owner |
| NAME-0002 | NAME-0004 | NAME-0003 | observer |
| NAME-0003 | NAME-0003 | NAME-0002 | reviewer |
| NAME-0004 | NAME-0005 | NAME-0002 | owner |
| NAME-0005 | NAME-0003 | NAME-0001 | contributor |
| NAME-0006 | NAME-0007 | NAME-0005 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | observer |
| NAME-0008 | NAME-0006 | NAME-0005 | owner |

Role supplies the interpretive qualifier without which subject–target pairs would be reversible and legally meaningless. Roles such as `reviewer`, `observer`, `contributor`, and `owner` do not rename entities; they specify how the subject stands in relation to the target within a policy context. Two rows may share an identical target yet differ in obligation: both `NAME-0001` and `NAME-0004` associate principals with full-name record `NAME-0002`, but one asserts `owner` while the other asserts `owner` from a distinct principal, a distinction material to authority, attribution, and duty-of-care registers. Likewise, `LEGA-0001` records `observer` where `LEGA-0003` records `reviewer` against different legal-name targets, encoding participation gradations that downstream access-control and audit workflows must honor. In evidence management, role analogues appear indirectly through the evidential subclass and claim linkage: the evidentiary object (`IoT sensor reading batch`, `Query execution plan`, `Western blot film`) is not itself a role, but its attachment to a claim presupposes an evidential stance—proffered support whose probative weight must be evaluated under declared conditions.

Language and uncertainty govern how asserted support may be read and how far it may be relied upon. Language tags (`ja`, `es`, `fr`) record the linguistic frame in which an artifact is presented or from which it was sourced, not the technical format of the evidence itself; a Japanese-tagged IoT batch, a Spanish-tagged query execution plan, and French-tagged Western blot films each signal that extraction, human review, and cross-jurisdictional harmonization must route through appropriate localization and terminology controls before claims are merged into authoritative registers. Uncertainty, expressed here as scalar magnitudes (`777.57`, `535.87`, `239.52`, `418.27`), quantifies residual doubt about the evidential link or measurement: lower values invite stronger reliance, higher values compel corroboration or explicit qualification in disclosures. The duplicate Western blot film class with divergent uncertainty against distinct claim targets illustrates why uncertainty must be evaluated per assertion edge rather than per artifact type alone—identical instrumentation does not imply identical epistemic standing once subject, target, and measurement context differ.

Taken together, these primitives implement a separable compliance grammar. Identifiers stabilize referents across schema.org vocabularies (`person/marvin_minsky`, `CloudNative`, `person/john_von_neumann`, `QuantumEdge` on the organization side; `person/rosalind_franklin`, `NexusLabs`, `GlobalDataInc`, `person/alan_kay` on the person side) and their respective legal or full names (`TerraForma Holdings Ltd.`, `Donald Knuth`, `Acme Corporation`). Subjects and targets wire principals to those labels and to supported claims; roles encode governance-bearing relationship types; language and uncertainty annotate whether and how far each wired assertion may be propagated into decision records. Mature operations treat violations—duplicate human-readable names, dangling principal keys, mismatched evidentiary targets—as detectable states in the same framework, because the handbook's objective is not merely to catalog entities but to make every edge in the graph accountable: who is linked to what, in what capacity, in which linguistic context, and with what measured doubt.