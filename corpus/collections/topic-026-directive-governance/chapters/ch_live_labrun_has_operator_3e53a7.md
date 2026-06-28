---
chapter_id: ch_live_labrun_has_operator_3e53a7
topic_id: 26
family: 02_observation_measurement
cited_terms: ['labrun_has_operator', 'directive_not_obsolete', 'host_connection_process']
model: engine-refine
---

Operational execution is captured through run records that track each operator invocation with a unique identifier such as OPER-0001 or OPER-0004, linking back to a dimension table where operators are classified by category and labeled for human readability. Each run record stores the elapsed duration in seconds—values like 4856.18 and 5155.73 reflect the wall-clock time consumed—and an exit code that signals the outcome, whether a non-zero status like 122 or 691 indicating failure, or a clean termination at 3. When a run does not succeed on the first attempt, the retry count records how many times the system retried, with figures ranging from 12 to 265 across the observed runs, providing a direct measure of transient instability that operators and their categories can be evaluated against.

**fact_labrun**

| id | operator_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| OPER-0001 | OPER-0007 | 4856.18 | 122 | 265 |
| OPER-0002 | OPER-0005 | 4308.22 | 691 | 244 |
| OPER-0003 | OPER-0002 | 4764.89 | 566 | 106 |
| OPER-0004 | OPER-0007 | 5155.73 | 3 | 12 |
| OPER-0005 | OPER-0001 | 385.91 | 81 | 197 |

**dim_operator**

| id | operator_label | operator_category |
| --- | --- | --- |
| OPER-0001 | Operator Label 01 | Operator Category 01 |
| OPER-0002 | Operator Label 02 | Operator Category 02 |
| OPER-0003 | Operator Label 03 | Operator Category 03 |
| OPER-0004 | Operator Label 04 | Operator Category 04 |
| OPER-0005 | Operator Label 05 | Operator Category 05 |
| OPER-0006 | Operator Label 06 | Operator Category 06 |
| OPER-0007 | Operator Label 07 | Operator Category 07 |

**t_directive_not_obsolete**

| id | directive | directive_2 |
| --- | --- | --- |
| OBSO-0001 | CIS Critical Security Controls | IHE Patient Identity Cross |
| OBSO-0002 | OGC API Features Standard | HL7 FHIR Implementation Guide |
| OBSO-0003 | IEEE 802.11ax Standard | HIPAA Security Rule |
| OBSO-0004 | CIS Benchmark Distribution 8 | OWASP Testing Guide v4 |
| OBSO-0005 | OWASP Application Security Guide | NIST CSF v2 Profile |
| OBSO-0006 | OWASP Application Security Guide | CIS Critical Security Controls |
| OBSO-0007 | MITRE ATT&CK Framework | OWASP Testing Guide v4 |

Directive compliance is modeled through a set of active standards—CIS Critical Security Controls, OGC API Features Standard, IEEE 802.11ax Standard, and CIS Benchmark Distribution 8—each of which carries a set of typed attributes that define how the directive must be applied. Attribute metadata specifies the name and the data type, such as effective_date as xsd:date, enforcement as xsd:string, mandatory as xsd:boolean, and priority as xsd:integer, ensuring that downstream value storage is type-safe and queryable. The attribute type constraint is not merely declarative; it governs which value table a given attribute's data must inhabit, so that boolean attributes like mandatory resolve to true or false entries, date attributes like effective_date store values such as 2024-10-21 or 2024-03-22, integer attributes like priority hold numeric levels such as 5 or 703, and string attributes capture free-form text like Encoding 01 or intake form.

**t_directive_not_obsolete_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| OBSO-0001 | effective_date | xsd:date |
| OBSO-0002 | enforcement | xsd:string |
| OBSO-0003 | mandatory | xsd:boolean |
| OBSO-0004 | priority | xsd:integer |
| OBSO-0005 | review_cycle_days | xsd:integer |
| OBSO-0006 | scope | xsd:string |
| OBSO-0007 | encoding | xsd:string |
| OBSO-0008 | label_text | xsd:string |

The value tables implement a vertical partitioning strategy where each attribute type is stored in its own table, linked back to the directive entity through an entity foreign key and to the attribute definition through an attr foreign key. This design means that a single directive entity—identified by a value such as OBSO-0001—can carry multiple typed attributes simultaneously: a mandatory flag set to true, an effective_date of 2024-10-21, a priority level of 5, and an enforcement descriptor of Encoding 01, each residing in its appropriate value table. The misc column in these value tables holds the actual typed payload, while the entity and attr columns together form a composite foreign key that ties the value to both the directive and the attribute definition, enabling precise retrieval of any attribute's value for any directive without nullable columns or type ambiguity.

**t_directive_not_obsolete_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0003 | true |
| OBSO-0002 | OBSO-0002 | OBSO-0003 | false |
| OBSO-0003 | OBSO-0003 | OBSO-0003 | false |
| OBSO-0004 | OBSO-0004 | OBSO-0003 | false |
| OBSO-0005 | OBSO-0005 | OBSO-0003 | true |
| OBSO-0006 | OBSO-0006 | OBSO-0003 | true |
| OBSO-0007 | OBSO-0007 | OBSO-0003 | true |

**t_directive_not_obsolete_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0001 | 2024-10-21 |
| OBSO-0002 | OBSO-0002 | OBSO-0001 | 2024-03-22 |
| OBSO-0003 | OBSO-0003 | OBSO-0001 | 2024-07-16 |
| OBSO-0004 | OBSO-0004 | OBSO-0001 | 2024-10-21 |
| OBSO-0005 | OBSO-0005 | OBSO-0001 | 2023-05-26 |
| OBSO-0006 | OBSO-0006 | OBSO-0001 | 2023-06-12 |
| OBSO-0007 | OBSO-0007 | OBSO-0001 | 2025-06-10 |

**t_directive_not_obsolete_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0004 | 5 |
| OBSO-0002 | OBSO-0001 | OBSO-0005 | 703 |
| OBSO-0003 | OBSO-0002 | OBSO-0004 | 4 |
| OBSO-0004 | OBSO-0002 | OBSO-0005 | 418 |
| OBSO-0005 | OBSO-0003 | OBSO-0004 | 2 |
| OBSO-0006 | OBSO-0003 | OBSO-0005 | 865 |
| OBSO-0007 | OBSO-0004 | OBSO-0004 | 5 |
| OBSO-0008 | OBSO-0004 | OBSO-0005 | 415 |

**t_directive_not_obsolete_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| OBSO-0001 | OBSO-0001 | OBSO-0007 | Encoding 01 |
| OBSO-0002 | OBSO-0001 | OBSO-0002 | Enforcement 02 |
| OBSO-0003 | OBSO-0001 | OBSO-0008 | intake form |
| OBSO-0004 | OBSO-0001 | OBSO-0009 | en |
| OBSO-0005 | OBSO-0001 | OBSO-0006 | Scope 05 |
| OBSO-0006 | OBSO-0002 | OBSO-0007 | Encoding 06 |
| OBSO-0007 | OBSO-0002 | OBSO-0002 | Enforcement 07 |
| OBSO-0008 | OBSO-0002 | OBSO-0008 | nightly summary |

Host connection processes represent a separate but structurally parallel domain, where biological interactions are recorded as processes identified by codes such as PROC-0001 through PROC-0004, each associated with a host entity like Zea mays B73, Helianthus annuus, Hordeum vulgum, or Quercus robur. The participants in these connections— Haustorium or Cortical cells—are tracked in a dedicated participant table, and the many-to-many relationship between hosts and participants is mediated by a junction table that assigns a role to each pairing, such as observer, owner, or reviewer. This role column captures the functional relationship between the host and the parasitic plant participant, allowing the same biological entity to appear in multiple contexts with different responsibilities, and enabling queries that distinguish, for example, which processes treat Haustorium as an observer versus an owner.

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