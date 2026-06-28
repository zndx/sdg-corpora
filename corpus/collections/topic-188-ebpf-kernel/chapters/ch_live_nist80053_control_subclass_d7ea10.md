---
chapter_id: ch_live_nist80053_control_subclass_d7ea10
topic_id: 188
family: 07_long_tail
cited_terms: ['nist80053_control_subclass', 'host_connection_process', 'claim_with_belief_interval']
model: engine-refine
---

In regulated information governance, every assertion that must be audited, compared across frameworks, or bound to operational evidence requires a durable identifier that survives schema evolution and crosswalks between standards. Identifiers such as CONT-0001 through CONT-0004 denote distinct control-subclass records anchored respectively to NIST SP 800-53 Rev 5, NIST SP 800-171, NIST CSF 2.0, and NIST SP 800-207, each further linked to an integration claim (INTE-0002, INTE-0006, INTE-0005, INTE-0004) whose propositional content ranges from “Network bandwidth saturated” to “Compliance audit passed.” The identifier is not merely a surrogate key: it is the join surface on which attribute definitions, typed value stores, belief intervals, and participant roles cohere into a single inspectable object. Without that stability, a mandatory flag recorded for CONT-0003 could not be reconciled against the same logical entity’s effective_date on 2024-03-23, nor against the priority integer 4 assigned under CONT-0002.

**t_nist80053_control_subclass**

| id | nist | nist80053_control |
| --- | --- | --- |
| CONT-0001 | NIST SP 800-53 Rev 5 | INTE-0002 |
| CONT-0002 | NIST SP 800-171 | INTE-0006 |
| CONT-0003 | NIST CSF 2.0 | INTE-0005 |
| CONT-0004 | NIST SP 800-207 | INTE-0004 |
| CONT-0005 | FIPS 140-3 | INTE-0006 |
| CONT-0006 | NIST SP 800-171 | INTE-0006 |

**t_nist80053_control_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| CONT-0001 | effective_date | xsd:date |
| CONT-0002 | enforcement | xsd:string |
| CONT-0003 | mandatory | xsd:boolean |
| CONT-0004 | priority | xsd:integer |
| CONT-0005 | review_cycle_days | xsd:integer |
| CONT-0006 | scope | xsd:string |
| CONT-0007 | encoding | xsd:string |
| CONT-0008 | label_text | xsd:string |

**t_nist80053_control_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0001 | 2023-01-02 |
| CONT-0002 | CONT-0002 | CONT-0001 | 2024-11-29 |
| CONT-0003 | CONT-0003 | CONT-0001 | 2024-03-23 |
| CONT-0004 | CONT-0004 | CONT-0001 | 2025-03-12 |
| CONT-0005 | CONT-0005 | CONT-0001 | 2024-03-19 |
| CONT-0006 | CONT-0006 | CONT-0001 | 2023-10-15 |

**t_claim_with_belief_interval**

| id | claim |
| --- | --- |
| INTE-0001 | Network bandwidth saturated |
| INTE-0002 | Network bandwidth saturated |
| INTE-0003 | API response time degraded |
| INTE-0004 | Compliance audit passed |
| INTE-0005 | Compliance audit passed |
| INTE-0006 | Server CPU exceeds threshold |

**t_claim_with_belief_interval_belief_interval**

| id | belief_interval |
| --- | --- |
| INTE-0001 | low medium high tier |
| INTE-0002 | 0.75 to 0.88 interval |
| INTE-0003 | 0.75 to 0.88 interval |
| INTE-0004 | plus minus two units |
| INTE-0005 | 70 to 85 percent range |
| INTE-0006 | medium certainty window |
| INTE-0007 | 0.75 to 0.88 interval |
| INTE-0008 | 0.8 to 0.95 certainty |

An entity is the governed object to which facts attach; in practice it is the referent carried by entity_id in typed value relations and by subject or target endpoints in associative tables. For control subclasses, CONT-0001 simultaneously carries a boolean mandatory=true (via attr_id CONT-0003), an effective_date of 2023-01-02 (attr_id CONT-0001), string-valued enforcement metadata such as “Encoding 01” and “Enforcement 02,” and integer priorities including 3 and 776—demonstrating that one entity may hold multiple attributes of different attr_types without collapsing them into a single untyped bag. Entity granularity therefore determines audit scope: changing mandatory from true to false for CONT-0004 alters compliance posture for the NIST SP 800-207 mapping only, leaving sibling entities’ posture intact. Operators treat entity as the unit of authorization, retention, and evidentiary export.

Attributes (attr) name the dimensions along which an entity is characterized, while attr_type constrains how values may be represented, validated, and queried. Declarations pairing attr_name with attr_type—effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, priority as xsd:integer—establish a contract that downstream stores must honor by routing each assignment to the appropriate typed table rather than coercing heterogeneous literals into one column. The attr_type governs comparability: effective_dates order chronologically (2023-01-02 preceding 2024-11-29 and 2025-03-12), booleans support set logic over mandatory=true populations, and integers such as 776 and 46 admit ranking and threshold policies. attr thus encodes semantic intent; attr_type encodes syntactic and operational discipline; together they prevent category errors that would otherwise corrupt control dashboards and cross-framework mappings.

The misc field—or, more precisely, the typed value payload materialized in boolean, date, integer, and varchar stores—holds the instantiated fact once attr and attr_type have fixed its meaning. misc is deliberately generic at the storage layer because the interpretive burden rests on the triple (entity_id, attr_id, value): the same attr_id CONT-0003 always denotes mandatory, so true versus false for CONT-0004 is unambiguous policy state, not an opaque string. VARCHAR misc further shows lexical heterogeneity within a single entity: CONT-0001 accumulates “Encoding 01,” “Enforcement 02,” “calibration record,” and “es,” each tied to distinct attr_ids and therefore to distinct compliance facets rather than duplicate noise. Retrieval pipelines must resolve misc through attr metadata; presentation layers must never render raw misc without attr_name and attr_type context, lest “es” be mistaken for locale when it encodes a controlled vocabulary term.

Relational governance extends beyond scalar decoration through subject–target associations qualified by role, a pattern that generalizes from integration claims to biological process modeling. In claim–belief_interval linkages, subject and target orient the edge: claim_id INTE-0004 as subject paired with belief_interval_id INTE-0002 as target attaches the “Compliance audit passed” assertion to the “0.75 to 0.88 interval” epistemic band, while alternate pairings route “Network bandwidth saturated” through low–medium–high tier or numeric interval encodings. role then specifies how each endpoint participates—owner versus reviewer—so the same belief_interval identifier may appear in multiple edges without collapsing provenance; INTE-0001 and INTE-0004 both associate as reviewer in sample rows, preserving separation of evidential duty from evidential content. This tripartite model (subject, target, role) is the operational mechanism for many-to-many assertions that scalar attrs cannot express.

**t_claim_with_belief_interval__belief_interval**

| id | claim_id | belief_interval_id | role |
| --- | --- | --- | --- |
| INTE-0001 | INTE-0004 | INTE-0005 | reviewer |
| INTE-0002 | INTE-0001 | INTE-0002 | owner |
| INTE-0003 | INTE-0001 | INTE-0004 | reviewer |
| INTE-0004 | INTE-0004 | INTE-0002 | reviewer |
| INTE-0005 | INTE-0006 | INTE-0003 | reviewer |
| INTE-0006 | INTE-0006 | INTE-0008 | reviewer |
| INTE-0007 | INTE-0002 | INTE-0001 | contributor |
| INTE-0008 | INTE-0001 | INTE-0007 | reviewer |

hostconnectionprocess and parasiticplant instantiate the same associative machinery in a domain where the governed entity is a host-connection process rather than a security control subclass. Processes identified as PROC-0001 through PROC-0004 name concrete biological hosts—Zea mays B73, Helianthus annuus, Hordeum vulgare, Quercus robur—while has_participant entries (Haustorium, Cortical cells) denote parasiticplant participants that enter the process as structural or physiological actors, not as free-floating labels. The bridging relation again deploys subject and target: host_id PROC-0007 linked to has_participant_id PROC-0003 or PROC-0004, with role distinguishing observer from owner and reviewer, mirrors the claim–belief pattern and confirms that role is orthogonal to identity. Whether the subject matter is haustorial penetration or NIST control enforcement, the workflow is invariant—register participants, bind them to a host entity through typed edges, and attach scalar attrs where measurement and policy require typed misc values—so that cross-domain audits can trace from identifier through entity and attr to the evidentiary subgraph that justified a control mapping or a process observation.

**t_nist80053_control_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0003 | true |
| CONT-0002 | CONT-0002 | CONT-0003 | true |
| CONT-0003 | CONT-0003 | CONT-0003 | true |
| CONT-0004 | CONT-0004 | CONT-0003 | false |
| CONT-0005 | CONT-0005 | CONT-0003 | true |
| CONT-0006 | CONT-0006 | CONT-0003 | true |

**t_nist80053_control_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0004 | 3 |
| CONT-0002 | CONT-0001 | CONT-0005 | 776 |
| CONT-0003 | CONT-0002 | CONT-0004 | 4 |
| CONT-0004 | CONT-0002 | CONT-0005 | 46 |
| CONT-0005 | CONT-0003 | CONT-0004 | 1 |
| CONT-0006 | CONT-0003 | CONT-0005 | 151 |
| CONT-0007 | CONT-0004 | CONT-0004 | 4 |
| CONT-0008 | CONT-0004 | CONT-0005 | 507 |

**t_nist80053_control_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0001 | CONT-0007 | Encoding 01 |
| CONT-0002 | CONT-0001 | CONT-0002 | Enforcement 02 |
| CONT-0003 | CONT-0001 | CONT-0008 | calibration record |
| CONT-0004 | CONT-0001 | CONT-0009 | es |
| CONT-0005 | CONT-0001 | CONT-0006 | Scope 05 |
| CONT-0006 | CONT-0002 | CONT-0007 | Encoding 06 |
| CONT-0007 | CONT-0002 | CONT-0002 | Enforcement 07 |
| CONT-0008 | CONT-0002 | CONT-0008 | audit excerpt |

**t_host_connection_process**

| id | host_connection_process |
| --- | --- |
| PROC-0001 | Zea mays B73 |
| PROC-0002 | Helianthus annuus |
| PROC-0003 | Hordeum vulgare |
| PROC-0004 | Quercus robur |
| PROC-0005 | Helianthus annuus |
| PROC-0006 | Populus trichocarpa |
| PROC-0007 | Gossypium hirsutum |

**t_host_connection_process_has_participant**

| id | has_participant |
| --- | --- |
| PROC-0001 | Haustorium |
| PROC-0002 | Cortical cells |
| PROC-0003 | Haustorium |
| PROC-0004 | Cortical cells |
| PROC-0005 | Parasite root tip |
| PROC-0006 | Sieve tube element |
| PROC-0007 | Vascular cambium |
| PROC-0008 | Root xylem |

**t_host_connection_process__has_participant**

| id | host_id | has_participant_id | role |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0007 | PROC-0003 | observer |
| PROC-0002 | PROC-0007 | PROC-0007 | observer |
| PROC-0003 | PROC-0007 | PROC-0004 | owner |
| PROC-0004 | PROC-0007 | PROC-0003 | reviewer |
| PROC-0005 | PROC-0005 | PROC-0005 | contributor |
| PROC-0006 | PROC-0001 | PROC-0008 | contributor |
| PROC-0007 | PROC-0003 | PROC-0002 | contributor |
| PROC-0008 | PROC-0004 | PROC-0004 | owner |