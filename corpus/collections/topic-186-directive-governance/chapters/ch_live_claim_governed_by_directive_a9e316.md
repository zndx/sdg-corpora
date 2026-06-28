---
chapter_id: ch_live_claim_governed_by_directive_a9e316
topic_id: 186
family: 06_belief_structure
cited_terms: ['claim_governed_by_directive', 'soc2_security_subclass', 'annotation_classifies_artifact']
model: engine-refine
---

In compliance and governance systems, governed facts are rarely flat records. They are structured objects whose meaning depends on stable identity, declared property definitions, and typed values that can be audited, compared, and enforced over time. Five conceptual roles—identifier, entity, attr, attr type, and the stored value itself (often treated as miscellaneous payload until interpreted)—form the backbone of that structure. Together they let an organization attach extensible metadata to claims, control subclasses, and artifact classifications without redesigning the core schema every time a new regulatory dimension appears.

**t_claim_governed_by_directive_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DIRE-0001 | confidence | xsd:decimal |
| DIRE-0002 | dimension_kind | xsd:string |
| DIRE-0003 | method | xsd:string |
| DIRE-0004 | recorded_at | xsd:dateTime |
| DIRE-0005 | uncertainty | xsd:decimal |
| DIRE-0006 | unit | xsd:string |
| DIRE-0007 | value | xsd:decimal |
| DIRE-0008 | encoding | xsd:string |

**t_claim_governed_by_directive_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0004 | 2025-05-26T03:20:10 |
| DIRE-0002 | DIRE-0002 | DIRE-0004 | 2024-09-09T11:00:31 |
| DIRE-0003 | DIRE-0003 | DIRE-0004 | 2023-10-05T17:19:44 |
| DIRE-0004 | DIRE-0004 | DIRE-0004 | 2023-08-28T07:17:18 |
| DIRE-0005 | DIRE-0005 | DIRE-0004 | 2023-09-24T23:34:03 |
| DIRE-0006 | DIRE-0006 | DIRE-0004 | 2025-02-15T08:57:16 |
| DIRE-0007 | DIRE-0007 | DIRE-0004 | 2025-03-19T03:02:46 |
| DIRE-0008 | DIRE-0008 | DIRE-0004 | 2023-07-28T10:43:49 |

**t_claim_governed_by_directive_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0001 | 0.133 |
| DIRE-0002 | DIRE-0001 | DIRE-0005 | 628.22 |
| DIRE-0003 | DIRE-0001 | DIRE-0007 | 405.89 |
| DIRE-0004 | DIRE-0002 | DIRE-0001 | 0.222 |
| DIRE-0005 | DIRE-0002 | DIRE-0005 | 369.68 |
| DIRE-0006 | DIRE-0002 | DIRE-0007 | 150.76 |
| DIRE-0007 | DIRE-0003 | DIRE-0001 | 0.686 |
| DIRE-0008 | DIRE-0003 | DIRE-0005 | 548.91 |

**t_claim_governed_by_directive_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DIRE-0001 | DIRE-0001 | DIRE-0002 | Dimension Kind 01 |
| DIRE-0002 | DIRE-0001 | DIRE-0008 | Encoding 02 |
| DIRE-0003 | DIRE-0001 | DIRE-0009 | audit excerpt |
| DIRE-0004 | DIRE-0001 | DIRE-0010 | en |
| DIRE-0005 | DIRE-0001 | DIRE-0003 | manual |
| DIRE-0006 | DIRE-0001 | DIRE-0006 | mg/L |
| DIRE-0007 | DIRE-0002 | DIRE-0002 | Dimension Kind 07 |
| DIRE-0008 | DIRE-0002 | DIRE-0008 | Encoding 08 |

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

An identifier is the durable handle by which every record is referenced, joined, and cited in evidence chains. Prefix conventions such as DIRE-0001 for directive-governed claims, SECU-0001 for SOC 2 security subclasses, and ARTI-0001 for artifact annotations signal the record’s domain while preserving a single addressing scheme across the repository. Identifiers appear both as the primary key of a governed object and as foreign keys in value stores, so that a confidence reading, an effective date, or a mandatory flag can always be traced back to exactly one definitional attribute and exactly one entity instance. When two distinct claims—DIRE-0001 and DIRE-0004—both assert “Mercury threshold exceeded,” their shared textual assertion does not collapse their identity; auditors rely on the identifier to distinguish separate events, separate evidentiary contexts, and separate attribute histories.

**t_claim_governed_by_directive**

| id | claim |
| --- | --- |
| DIRE-0001 | Mercury threshold exceeded |
| DIRE-0002 | Access policy enforced |
| DIRE-0003 | Latency within bounds |
| DIRE-0004 | Mercury threshold exceeded |
| DIRE-0005 | Emission limits met |
| DIRE-0006 | Certificate chain valid |
| DIRE-0007 | Sampling frequency adequate |
| DIRE-0008 | Sensor calibration valid |

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | ARTI-0001 |
| SECU-0002 | SOC3-Public | ARTI-0004 |
| SECU-0003 | SOC2-Fintech | ARTI-0004 |
| SECU-0004 | SOC2-IdentityProvider | ARTI-0001 |
| SECU-0005 | SOC2-SaaS | ARTI-0004 |
| SECU-0006 | SOC2-TypeII | ARTI-0006 |
| SECU-0007 | SOC2-SaaS | ARTI-0001 |

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

**t_annotation_classifies_artifact**

| id | annotation |
| --- | --- |
| ARTI-0001 | Source Verified |
| ARTI-0002 | PII Redacted |
| ARTI-0003 | PII Sensitive |
| ARTI-0004 | Deprecated |
| ARTI-0005 | GDPR Compliant |
| ARTI-0006 | GDPR Compliant |

The entity is the thing being described: a claim subject to directive governance, a SOC 2 security subclass scoped to a compliance domain, or an annotation that classifies an artifact. Entity identity is what value rows bind to through entity_id, anchoring every measurement or label to a specific governed object rather than to a global pool of facts. A SOC 2 subclass such as SECU-0001 (SOC2-CloudInfra) and SECU-0004 (SOC2-IdentityProvider) are distinct entities even when they share structural similarities; likewise, ARTI-0001 (“Source Verified”) and ARTI-0003 (“PII Sensitive”) represent different classification postures applied to artifacts. Cross-entity relationships—such as SECU-0001 and SECU-0004 both referencing ARTI-0001 as their SOC 2 domain—show that entities participate in governance graphs, not merely in isolated attribute bags.

An attr is a named, reusable property definition: confidence, dimension_kind, method, recorded_at, effective_date, enforcement, mandatory, priority, and analogous fields across domains. Attributes are defined once per entity family and referenced by attr_id when values are stored, which separates the question “what kind of fact is this?” from “what is the fact for this particular entity?” Defining confidence as an attr allows the same semantic slot to appear on directive-governed claims and on artifact annotations without conflating the two governance contexts. Attributes also accumulate over the life of a compliance program; new attrs can be introduced—priority as xsd:integer, mandatory as xsd:boolean—while existing entities retain their historical values under prior definitions.

Attr type declares the interpretive and storage contract for each attr, typically expressed as XSD-aligned types such as xsd:decimal, xsd:string, xsd:dateTime, xsd:date, xsd:boolean, and xsd:integer. Type is not decorative: it governs validation, comparison semantics, and which value store receives the data. Decimal attrs hold measurements and scores—confidence of 0.133 on DIRE-0001, 0.727 on ARTI-0001—while string attrs carry enumerations, encodings, or human-readable enforcement labels such as “Enforcement 02.” Temporal attrs like recorded_at (xsd:dateTime) and effective_date (xsd:date) establish evidentiary timelines: DIRE-0001’s recorded_at of 2025-05-26T03:20:10 situates a claim in audit sequence, and SECU-0001’s effective_date of 2023-08-15 marks when a control subclass became operative. Boolean and integer attrs express policy posture and ordering—mandatory true for SECU-0001 and SECU-0003, false for SECU-0002 and SECU-0004; priority values of 5 versus 926 on SECU-0001 illustrating that integers may encode rank, weight, or internal sequencing depending on operational convention.

The value—the misc element in storage—is the instantiated fact for a given entity–attr pair, meaningless until resolved through its attr type and entity context. Partitioning values into type-specific stores (decimal, varchar, datetime, boolean, date, integer) preserves integrity at scale: a query for mandatory enforcement does not sift through unrelated strings, and a datetime filter on recorded_at does not coerce ambiguous text. In practice, compliance analysts traverse from identifier to entity to attr definition to typed value. They might confirm that DIRE-0002’s “Access policy enforced” claim carries confidence 0.222, that its recorded_at predates DIRE-0001’s 2025 timestamp, or that SECU-0003’s mandatory=true aligns with SOC2-Fintech’s stricter posture while SECU-0002’s mandatory=false reflects SOC3-Public’s differing obligations. Artifact annotations complete the picture: ARTI-0002’s “PII Redacted” with confidence 0.091 and language tag “ja” in a varchar slot shows how the same attr machinery supports data-governance labeling alongside security-control metadata.

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

**t_annotation_classifies_artifact_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ARTI-0001 | confidence | xsd:decimal |
| ARTI-0002 | dimension_kind | xsd:string |
| ARTI-0003 | method | xsd:string |
| ARTI-0004 | recorded_at | xsd:dateTime |
| ARTI-0005 | uncertainty | xsd:decimal |
| ARTI-0006 | unit | xsd:string |
| ARTI-0007 | value | xsd:decimal |
| ARTI-0008 | encoding | xsd:string |

**t_annotation_classifies_artifact_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0004 | 2024-11-28T13:33:59 |
| ARTI-0002 | ARTI-0002 | ARTI-0004 | 2024-06-29T04:58:51 |
| ARTI-0003 | ARTI-0003 | ARTI-0004 | 2023-01-05T00:51:32 |
| ARTI-0004 | ARTI-0004 | ARTI-0004 | 2024-11-30T14:24:01 |
| ARTI-0005 | ARTI-0005 | ARTI-0004 | 2023-01-14T09:06:44 |
| ARTI-0006 | ARTI-0006 | ARTI-0004 | 2023-02-15T12:01:42 |

**t_annotation_classifies_artifact_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0001 | 0.727 |
| ARTI-0002 | ARTI-0001 | ARTI-0005 | 765.80 |
| ARTI-0003 | ARTI-0001 | ARTI-0007 | 266.33 |
| ARTI-0004 | ARTI-0002 | ARTI-0001 | 0.091 |
| ARTI-0005 | ARTI-0002 | ARTI-0005 | 761.16 |
| ARTI-0006 | ARTI-0002 | ARTI-0007 | 564.24 |
| ARTI-0007 | ARTI-0003 | ARTI-0001 | 0.118 |
| ARTI-0008 | ARTI-0003 | ARTI-0005 | 599.96 |

**t_annotation_classifies_artifact_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ARTI-0001 | ARTI-0001 | ARTI-0002 | Dimension Kind 01 |
| ARTI-0002 | ARTI-0001 | ARTI-0008 | Encoding 02 |
| ARTI-0003 | ARTI-0001 | ARTI-0009 | pre-release note |
| ARTI-0004 | ARTI-0001 | ARTI-0010 | ja |
| ARTI-0005 | ARTI-0001 | ARTI-0003 | automated |
| ARTI-0006 | ARTI-0001 | ARTI-0006 | ratio |
| ARTI-0007 | ARTI-0002 | ARTI-0002 | Dimension Kind 07 |
| ARTI-0008 | ARTI-0002 | ARTI-0008 | Encoding 08 |

Operational maturity depends on treating these five roles as a contract, not as incidental columns. Identifiers must remain immutable once cited in audit logs; attrs should be versioned or namespace-stable so that a change to meaning does not silently rewrite history; attr types must be enforced at ingest so misc values cannot drift across type boundaries. When that contract holds, governance frameworks can express heterogeneous compliance state—threshold exceedances, access-policy enforcement, latency bounds, SOC 2 subclass mandates, artifact sensitivity—in one coherent model. Reviewers gain comparability across domains, automation gains reliable predicates, and regulators gain traceable chains from asserted claim or control, through defined attribute, to typed, timestamped evidence.