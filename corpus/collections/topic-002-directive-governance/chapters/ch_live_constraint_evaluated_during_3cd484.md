---
chapter_id: ch_live_constraint_evaluated_during_3cd484
topic_id: 2
family: 03_directive_governance
cited_terms: ['constraint_evaluated_during', 'schemaorg_org_legalname', 'executive_leadership_role']
model: engine-refine
---

Governance and compliance programs depend on stable identifiers that survive reorganization, merger, and system migration without losing traceability. An identifier such as DURI-0001 or LEGA-0004 is not merely a database key; it is the durable handle by which auditors, policy engines, and integration layers refer to the same obligation, organization, or role across time and tooling. When a Field Length Constraint is evaluated during the regulatory posture associated with LEGA-0001, or when a Null Value Limit is assessed against LEGA-0006, the evaluated_during linkage records which legal or operational context triggered the assessment, not just which rule was checked. That distinction matters because the same constraint type may apply differently depending on whether the subject organization is NexusLabs, AeroSpaceX, or GlobalDataInc, and because downstream reporting must reconcile constraint outcomes to the correct entity without ambiguity.

**t_constraint_evaluated_during**

| id | constraint | evaluated_during |
| --- | --- | --- |
| DURI-0001 | Field Length Constraint | LEGA-0001 |
| DURI-0002 | Data Retention Policy | LEGA-0004 |
| DURI-0003 | Audit Log Requirement | LEGA-0007 |
| DURI-0004 | Null Value Limit | LEGA-0006 |
| DURI-0005 | Data Retention Policy | LEGA-0001 |
| DURI-0006 | Data Retention Policy | LEGA-0006 |

**t_schemaorg_org_legalname**

| id | schemaorg |
| --- | --- |
| LEGA-0001 | NexusLabs |
| LEGA-0002 | BioSynth |
| LEGA-0003 | GlobalDataInc |
| LEGA-0004 | AeroSpaceX |
| LEGA-0005 | QuantumEdge |
| LEGA-0006 | AcmeCorp |
| LEGA-0007 | GlobalDataInc |

Every entity in this model carries attributes whose semantics are declared separately from their values. An attr such as effective_date, enforcement, mandatory, or priority names what is being asserted about the entity; the attr_type—xsd:date, xsd:string, xsd:boolean, or xsd:integer—declares how that assertion must be interpreted, validated, and stored. Typed value stores exist precisely because misc fields cannot be treated as undifferentiated text: a mandatory flag recorded as false for DURI-0001 through DURI-0003 but true for DURI-0004 is a compliance signal, not a formatting choice, and effective dates ranging from 2023-03-04 through 2025-03-02 establish when respective controls became operative. Integer misc values such as priority 2 versus 590, or 52, further differentiate enforcement posture within the same attribute family, allowing policy tiers to be ranked without collapsing heterogeneous measures into a single column.

Organizational identity compounds this pattern because the entity presented to operational systems rarely coincides with the legal person subject to contract, filing, or audit. Schema-oriented labels—BioSynth, GlobalDataInc, Acme Corporation—function as the subject of day-to-day reference, while registered legal names including CloudNative Solutions LLC, Global Data Systems LLC, and TerraForma Holdings Ltd. may appear as distinct targets linked through explicit roles. Where LEGA-0004’s schemaorg record associates with legal_name_id LEGA-0004 under role reviewer, and LEGA-0002 links to LEGA-0005 as observer, the role term governs how the relationship may be used: reviewers bear evaluative authority, observers may witness without deciding, and contributors supply material without owning the outcome. Subject–target–role triples therefore encode directed governance facts that a flat name table cannot express, and they prevent mistaken substitution when two organizations share similar trade names or when a holding structure separates brand from obligor.

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

Executive accountability extends the same compositional logic from static attributes to reporting lines and collective membership. An executiveleadershiprole such as Chief Technology Officer or Chief Operating Officer identifies the function; the chiefexecutiveofficerrole field—Managing Director, Executive Office, or CEO Office—states the superior reporting anchor that defines escalation and attestation paths; and executiveteam membership in the C-Suite or Board Advisory Group situates the officer within deliberative bodies that approve policy, resource allocation, or risk acceptance. When two records both designate Chief Revenue Officer yet one reports to Managing Director and the other to CEO Office, the title alone is insufficient for org-chart integrity or segregation-of-duties analysis. Identifier-backed role records preserve those distinctions so that control ownership for Data Retention Policy enforcement, Audit Log Requirement attestation, or Null Value Limit exceptions can be routed to the correct executive chain.

**t_executive_leadership_role**

| id | executive_leadership_role | reports_to | member_of |
| --- | --- | --- | --- |
| ROLE-0001 | Chief Technology Officer | Managing Director | Board Advisory Group |
| ROLE-0002 | Chief Operating Officer | Executive Office | C-Suite |
| ROLE-0003 | Chief Revenue Officer | Managing Director | Board Advisory Group |
| ROLE-0004 | Chief Revenue Officer | CEO Office | Board Advisory Group |
| ROLE-0005 | Chief Revenue Officer | Executive Office | Corporate Governance Board |
| ROLE-0006 | Chief Human Resources Officer | Chief Executive | C-Suite |
| ROLE-0007 | Chief Human Resources Officer | Executive Office | Executive Operations Group |

In practice, these constructs interlock during constraint evaluation cycles tied to legal entities. A Data Retention Policy assessed during LEGA-0004’s context inherits that organization’s linked legal identity and any reviewer or contributor relationships already established between subject and target; mandatory and effective_date attributes on the same DURI entity determine whether the policy is presently binding and from which calendar date; varchar misc such as Enforcement 02 or pre-release note captures operational qualifiers that boolean and date types cannot carry alone. Field Length Constraint and Audit Log Requirement entries evaluated against LEGA-0001 and LEGA-0007 respectively demonstrate that evaluation timing is entity-specific even when attribute names repeat across rows. Compliance officers therefore read identifiers as anchors, entities as the objects of obligation, attrs and attr_types as the typed vocabulary of control metadata, misc as evidenced fact, and subject–target–role links plus executive role decomposition as the authority graph through which findings become assignable, appealable, and auditable.

**t_constraint_evaluated_during_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| DURI-0001 | effective_date | xsd:date |
| DURI-0002 | enforcement | xsd:string |
| DURI-0003 | mandatory | xsd:boolean |
| DURI-0004 | priority | xsd:integer |
| DURI-0005 | review_cycle_days | xsd:integer |
| DURI-0006 | scope | xsd:string |
| DURI-0007 | encoding | xsd:string |
| DURI-0008 | label_text | xsd:string |

**t_constraint_evaluated_during_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0003 | false |
| DURI-0002 | DURI-0002 | DURI-0003 | false |
| DURI-0003 | DURI-0003 | DURI-0003 | false |
| DURI-0004 | DURI-0004 | DURI-0003 | true |
| DURI-0005 | DURI-0005 | DURI-0003 | true |
| DURI-0006 | DURI-0006 | DURI-0003 | true |

**t_constraint_evaluated_during_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0001 | 2024-01-04 |
| DURI-0002 | DURI-0002 | DURI-0001 | 2025-03-02 |
| DURI-0003 | DURI-0003 | DURI-0001 | 2023-10-02 |
| DURI-0004 | DURI-0004 | DURI-0001 | 2023-03-04 |
| DURI-0005 | DURI-0005 | DURI-0001 | 2023-08-27 |
| DURI-0006 | DURI-0006 | DURI-0001 | 2023-09-26 |

**t_constraint_evaluated_during_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0004 | 2 |
| DURI-0002 | DURI-0001 | DURI-0005 | 590 |
| DURI-0003 | DURI-0002 | DURI-0004 | 2 |
| DURI-0004 | DURI-0002 | DURI-0005 | 52 |
| DURI-0005 | DURI-0003 | DURI-0004 | 1 |
| DURI-0006 | DURI-0003 | DURI-0005 | 88 |
| DURI-0007 | DURI-0004 | DURI-0004 | 5 |
| DURI-0008 | DURI-0004 | DURI-0005 | 829 |

**t_constraint_evaluated_during_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| DURI-0001 | DURI-0001 | DURI-0007 | Encoding 01 |
| DURI-0002 | DURI-0001 | DURI-0002 | Enforcement 02 |
| DURI-0003 | DURI-0001 | DURI-0008 | pre-release note |
| DURI-0004 | DURI-0001 | DURI-0009 | en |
| DURI-0005 | DURI-0001 | DURI-0006 | Scope 05 |
| DURI-0006 | DURI-0002 | DURI-0007 | Encoding 06 |
| DURI-0007 | DURI-0002 | DURI-0002 | Enforcement 07 |
| DURI-0008 | DURI-0002 | DURI-0008 | audit excerpt |

The architectural payoff is evidentiary coherence: nothing in the handbook reduces to a single wide table because governance data is inherently multi-typed, multi-party, and temporally qualified. Preserving attr_type discipline prevents a priority integer from being compared to an enforcement string; preserving subject and target separation prevents AeroSpaceX from being conflated with Acme Corporation in filing contexts where only the legal_name target is authoritative; preserving chiefexecutiveofficerrole and executiveteam fields prevents nominal title collisions from obscuring who must sign off when mandatory flips to true or when an effective_date advances a control into force. Taken together, these elements form the operational grammar by which constraints evaluated during specific legal contexts are documented, attributed, and escalated with the density and precision expected of a defensible compliance record.