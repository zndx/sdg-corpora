---
chapter_id: ch_live_third_party_data_sharing_8e6300
topic_id: 26
family: 08_derived
cited_terms: ['third_party_data_sharing', 'existential_with_part_of', 'policy_subclass']
model: engine-refine
---

Third-party data sharing is a governed exchange in which an organization permits an external business partner to receive, process, or derive value from specified datasets under contractual and policy constraints. Each sharing arrangement names the mechanism or program under which disclosure occurs—such as PartnerAnalyticsBridge for analytics federation or GeospatialInfoExchange for location-derived intelligence—and binds that arrangement to exactly one counterparty. RegionalHealthNetwork, AcmeAnalyticsCorp, FinServDataHub, and GlobalLogisticsInc illustrate the partner dimension: they are not internal roles or anonymous recipients but identifiable external business partners whose participation must be recorded, audited, and reconciled against consent, purpose limitation, and subprocessors registers. When the same sharing program appears more than once with different partners, as GeospatialInfoExchange does across three distinct arrangements, the model preserves separate accountability per counterparty rather than collapsing diverse legal relationships into a single undifferentiated export.

Identifiers supply the durable handles that make such relationships machine-checkable and human-auditable across systems that otherwise describe the same facts in incompatible vocabularies. Prefix-stable keys—SHAR-0001 through SHAR-0004 for sharing events, PART-0001 through PART-0004 for compositional facts, POLI-0001 through POLI-0004 for policy subclasses—function as correlation anchors: they survive renames of display labels, survive interface changes, and allow evidence chains to cite the same object in access logs, contract clauses, and control assessments. In operational practice, an identifier is not merely a surrogate primary key; it is the join surface on which compliance tooling asserts that a given disclosure trace (who received what, under which policy revision) refers to the same governed object referenced in architecture inventories and incident response playbooks.

**t_policy_subclass**

| id | policy | governs |
| --- | --- | --- |
| POLI-0001 | Telemetry Privacy Standard | Data Lakes |
| POLI-0002 | Provenance Directive | Research Archives |
| POLI-0003 | Data Retention Policy | Sensor Networks |
| POLI-0004 | Metadata Governance | API Gateways |
| POLI-0005 | Telemetry Privacy Standard | Telemetry Streams |
| POLI-0006 | Provenance Directive | Sensor Networks |

An entity, in this governance frame, is any definable object that carries attributable properties and can be the subject of policy evaluation. Policy subclasses such as Telemetry Privacy Standard, Provenance Directive, Data Retention Policy, and Metadata Governance are entities because they are the units to which obligations attach and from which scope statements propagate—each governs a concrete asset class (Data Lakes, Research Archives, Sensor Networks, API Gateways) and therefore must be addressable when determining whether a proposed third-party share is in or out of bounds. Compositional entities likewise matter for impact analysis: knowing that regional_telemetry_gateway and alpha_compute_cluster are part_of geo_redundant_backup, or that alpha_query_engine and primary_stream_processor participate in realtime_analytics_platform, tells reviewers which downstream consumers and resilience paths are implicated when partner access touches upstream telemetry or stream processing. Entity identity separates the thing from what is said about it; without that separation, boolean mandates, effective dates, and enforcement text would be inseparable from the policy record itself and could not be versioned or compared across environments.

Attributes are the named dimensions along which entities are described for compliance automation, and attribute type is the contract that governs how each name may be populated and validated. effective_date is typed as xsd:date because temporal applicability must be compared and scheduled; enforcement and similar narrative controls use xsd:string because they encode human-readable modalities rather than scalars; mandatory is xsd:boolean because auditors require unambiguous yes/no determinations; priority is xsd:integer because conflict resolution among overlapping policies needs ordered precedence. Attribute typing is not cosmetic schema hygiene—it routes each assertion to the correct representation and prevents category errors that undermine controls: a date cannot silently masquerade as free text, and a mandatory flag cannot be inferred from ambiguous wording. In the evidence set, every policy entity carries an effective_date (for example 2023-01-31 for the telemetry standard and 2024-06-17 for the provenance directive), while mandatory resolves variably—true for Provenance Directive and Data Retention Policy, false for Telemetry Privacy Standard and Metadata Governance—demonstrating that identical attribute names across entities denote comparable slots whose values differ by deliberate governance choice rather than by accident of storage.

The misc dimension—despite its generic label—holds the typed payload once entity, attribute, and attribute type have fixed the semantic slot. Values are persisted in type-aligned stores so that queries and validators encounter native forms: booleans for mandatory, calendar dates for effective_date, integers for priority (including sharply different precedence such as 1 versus 740 on the same policy record, and 3 versus 958 across related directives), and variable-length strings for enforcement and operational qualifiers (Enforcement 02, nightly summary, locale tag fr, Encoding 01). Treating the value field as miscellaneous is a modeling convenience at the physical layer; at the governance layer it is always interpreted through its attr and attr_type binding. A reviewer who sees mandatory=true on POLI-0002 does not read an anonymous flag—they read a provenance obligation that is compulsory relative to the partner share under review, with effective_date 2024-06-17 establishing when that compulsion began to bind operational behavior.

Together, thirdpartydatasharing, externalbusinesspartner, identifier, entity, attr, attr_type, and the typed value carried as misc form a closed evidentiary loop suitable for handbook-grade control design. A sharing arrangement identifier ties a program name to a named partner; policy entity identifiers tie scope statements to typed attributes; compositional identifiers tie infrastructure parts to platforms that may source or sink shared data. Attribute typing ensures that effective dates gate retrospectives, mandatory flags drive blocking workflows, integer priorities resolve overlaps when Metadata Governance and Data Retention Policy both touch API Gateways, and string enforcement fields preserve audit-readable nuance that boolean summaries cannot replace. Organizations that implement this pattern can answer, with cited keys and typed facts rather than narrative guesswork, which external partner participated in which sharing construct, which policy subclass applied on which effective date, whether compliance was mandatory at the moment of transfer, and which subsystem composition placed the disclosed data in scope—precisely the evidentiary granularity expected in third-party risk management, data protection impact assessment, and continuous control monitoring.

**t_third_party_data_sharing**

| id | third_party_data_sharing | has_participant |
| --- | --- | --- |
| SHAR-0001 | PartnerAnalyticsBridge | RegionalHealthNetwork |
| SHAR-0002 | GeospatialInfoExchange | AcmeAnalyticsCorp |
| SHAR-0003 | GeospatialInfoExchange | FinServDataHub |
| SHAR-0004 | GeospatialInfoExchange | GlobalLogisticsInc |
| SHAR-0005 | IoTSensorDataBridge | AutoOEMDataTeam |
| SHAR-0006 | ResearchCollabDataFlow | TelecomPartnerOps |

**t_existential_with_part_of**

| id | existential | part_of |
| --- | --- | --- |
| PART-0001 | regional_telemetry_gateway | geo_redundant_backup |
| PART-0002 | alpha_compute_cluster | audit_logging_system |
| PART-0003 | alpha_query_engine | geo_redundant_backup |
| PART-0004 | primary_stream_processor | realtime_analytics_platform |

**t_policy_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| POLI-0001 | effective_date | xsd:date |
| POLI-0002 | enforcement | xsd:string |
| POLI-0003 | mandatory | xsd:boolean |
| POLI-0004 | priority | xsd:integer |
| POLI-0005 | review_cycle_days | xsd:integer |
| POLI-0006 | scope | xsd:string |
| POLI-0007 | encoding | xsd:string |
| POLI-0008 | label_text | xsd:string |

**t_policy_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0003 | false |
| POLI-0002 | POLI-0002 | POLI-0003 | true |
| POLI-0003 | POLI-0003 | POLI-0003 | true |
| POLI-0004 | POLI-0004 | POLI-0003 | false |
| POLI-0005 | POLI-0005 | POLI-0003 | true |
| POLI-0006 | POLI-0006 | POLI-0003 | false |

**t_policy_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0001 | 2023-01-31 |
| POLI-0002 | POLI-0002 | POLI-0001 | 2024-06-17 |
| POLI-0003 | POLI-0003 | POLI-0001 | 2023-06-01 |
| POLI-0004 | POLI-0004 | POLI-0001 | 2024-01-12 |
| POLI-0005 | POLI-0005 | POLI-0001 | 2024-07-01 |
| POLI-0006 | POLI-0006 | POLI-0001 | 2023-07-28 |

**t_policy_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0004 | 1 |
| POLI-0002 | POLI-0001 | POLI-0005 | 740 |
| POLI-0003 | POLI-0002 | POLI-0004 | 3 |
| POLI-0004 | POLI-0002 | POLI-0005 | 958 |
| POLI-0005 | POLI-0003 | POLI-0004 | 5 |
| POLI-0006 | POLI-0003 | POLI-0005 | 462 |
| POLI-0007 | POLI-0004 | POLI-0004 | 5 |
| POLI-0008 | POLI-0004 | POLI-0005 | 496 |

**t_policy_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| POLI-0001 | POLI-0001 | POLI-0007 | Encoding 01 |
| POLI-0002 | POLI-0001 | POLI-0002 | Enforcement 02 |
| POLI-0003 | POLI-0001 | POLI-0008 | nightly summary |
| POLI-0004 | POLI-0001 | POLI-0009 | fr |
| POLI-0005 | POLI-0001 | POLI-0006 | Scope 05 |
| POLI-0006 | POLI-0002 | POLI-0007 | Encoding 06 |
| POLI-0007 | POLI-0002 | POLI-0002 | Enforcement 07 |
| POLI-0008 | POLI-0002 | POLI-0008 | audit excerpt |