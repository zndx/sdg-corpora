---
chapter_id: ch_live_policy_supersedes_8f2286
topic_id: 90
family: 03_directive_governance
cited_terms: ['policy_supersedes', 'schemaorg_event_organizer', 'syscall_traceable']
model: engine-refine
---

IDENTIFIER

The identifier serves as the primary key anchoring every record across the governance schema, whether denoting a supersession chain such as SUPE-0001 through SUPE-0004, an event organizer like ORGA-0001 through ORGA-0004, or a traceability dimension entry ranging from TRAC-0001 to TRAC-0004. Each identifier is unique within its scope and functions as the referential fulcrum upon which foreign-key relationships pivot. The policy supersession table, for instance, records that the Privacy Impact Assessment (SUPE-0001) supersedes ORGA-0003, while the Incident Response Protocol (SUPE-0004) supersedes ORGA-0004, establishing a lineage of policy evolution. Similarly, the schemaorg event organizer mapping assigns the Edge Compute Fest (ORGA-0001) to the organizer SUPE-0001, and the Telemetry Conference (ORGA-0002) to the same organizer, demonstrating how identifiers bridge distinct conceptual domains.

**t_policy_supersedes**

| id | policy | supersedes | review_cycle_days | language |
| --- | --- | --- | --- | --- |
| SUPE-0001 | Privacy Impact Assessment | ORGA-0003 | 262 | es |
| SUPE-0002 | Incident Response Protocol | ORGA-0003 | 131 | es |
| SUPE-0003 | Data Residency Rule | ORGA-0002 | 716 | es |
| SUPE-0004 | Incident Response Protocol | ORGA-0004 | 336 | es |
| SUPE-0005 | Incident Response Protocol | ORGA-0007 | 151 | de |
| SUPE-0006 | Audit Logging Requirement | ORGA-0002 | 866 | en |

**t_schemaorg_event_organizer**

| id | schemaorg | organizer |
| --- | --- | --- |
| ORGA-0001 | Edge Compute Fest | SUPE-0001 |
| ORGA-0002 | Telemetry Conference | SUPE-0001 |
| ORGA-0003 | Stream Processing Conclave | SUPE-0002 |
| ORGA-0004 | Governance Workshop | SUPE-0001 |
| ORGA-0005 | Stream Processing Conclave | SUPE-0002 |
| ORGA-0006 | Edge Compute Fest | SUPE-0006 |
| ORGA-0007 | Cloud Observability Meetup | SUPE-0005 |

ATTR and ATTR TYPE

The attribute system decomposes entity properties into discrete, typed dimensions. The attribute name column—attr_name—captures semantic labels such as checksum, created_date, identifier, and license, each paired with an attr_type that enforces schema conformance through standardized datatypes. The type xsd:string accommodates free-form values like the license identifier CC-BY-4.0 and the region code ap-south-2, while xsd:date constrains temporal attributes to ISO-formatted dates such as 2024-07-16 and 2023-04-02. The type cco:DesignativeICE designates a specific class of identifier attribute, reflecting the ontology's commitment to machine-readable type discipline. This separation of attribute identity from attribute value permits a single entity—ORGA-0001, for example—to carry multiple attributes simultaneously: a checksum value of 7b14de08, a license of CC-BY-4.0, and a geographic region of ap-south-2, each stored in its dedicated value table (t_schemaorg_event_organizer_val_varchar, t_schemaorg_event_organizer_val_date, or t_schemaorg_event_organizer_val_int) according to the declared attr_type.

**t_schemaorg_event_organizer_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ORGA-0001 | checksum | xsd:string |
| ORGA-0002 | created_date | xsd:date |
| ORGA-0003 | identifier | cco:DesignativeICE |
| ORGA-0004 | license | xsd:string |
| ORGA-0005 | mime_type | xsd:string |
| ORGA-0006 | size_bytes | xsd:long |
| ORGA-0007 | uri | xsd:string |
| ORGA-0008 | version | xsd:integer |

**t_schemaorg_event_organizer_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0002 | 2024-07-16 |
| ORGA-0002 | ORGA-0002 | ORGA-0002 | 2023-04-02 |
| ORGA-0003 | ORGA-0003 | ORGA-0002 | 2023-04-02 |
| ORGA-0004 | ORGA-0004 | ORGA-0002 | 2023-04-08 |
| ORGA-0005 | ORGA-0005 | ORGA-0002 | 2023-03-07 |
| ORGA-0006 | ORGA-0006 | ORGA-0002 | 2023-12-15 |
| ORGA-0007 | ORGA-0007 | ORGA-0002 | 2023-05-20 |

**t_schemaorg_event_organizer_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0006 | 440 |
| ORGA-0002 | ORGA-0001 | ORGA-0008 | 7 |
| ORGA-0003 | ORGA-0002 | ORGA-0006 | 450 |
| ORGA-0004 | ORGA-0002 | ORGA-0008 | 6 |
| ORGA-0005 | ORGA-0003 | ORGA-0006 | 147 |
| ORGA-0006 | ORGA-0003 | ORGA-0008 | 6 |
| ORGA-0007 | ORGA-0004 | ORGA-0006 | 298 |
| ORGA-0008 | ORGA-0004 | ORGA-0008 | 7 |

**t_schemaorg_event_organizer_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ORGA-0001 | ORGA-0001 | ORGA-0001 | 7b14de08 |
| ORGA-0002 | ORGA-0001 | ORGA-0003 | gid://svc/77 |
| ORGA-0003 | ORGA-0001 | ORGA-0004 | CC-BY-4.0 |
| ORGA-0004 | ORGA-0001 | ORGA-0009 | ap-south-2 |
| ORGA-0005 | ORGA-0001 | ORGA-0005 | application/xml |
| ORGA-0006 | ORGA-0001 | ORGA-0010 | Name 06 |
| ORGA-0007 | ORGA-0001 | ORGA-0011 | platform-team |
| ORGA-0008 | ORGA-0001 | ORGA-0012 | Tags 08 |

CATEGORY and ENTITY

The category dimension classifies traceability entries along organizational or functional lines, as evidenced by labels such as Traceable By Category 01 through Traceable By Category 04, each associated with a corresponding traceable_by_label. The entity column in the value tables references the entity_id to which a particular attribute value belongs, creating a many-to-many relationship between entities and their attribute instances. An entity such as ORGA-0001 may appear across multiple value tables, accumulating heterogeneous attribute values, while the integer value table reveals that ORGA-0001 carries numeric attributes with values 440 and 7, stored under attribute identifiers ORGA-0006 and ORGA-0008 respectively. This entity-attribute-value triad provides a flexible, extensible model for capturing metadata without requiring schema modifications as new attribute types emerge.

**dim_traceable_by**

| id | traceable_by_label | traceable_by_category |
| --- | --- | --- |
| TRAC-0001 | Traceable By Label 01 | Traceable By Category 01 |
| TRAC-0002 | Traceable By Label 02 | Traceable By Category 02 |
| TRAC-0003 | Traceable By Label 03 | Traceable By Category 03 |
| TRAC-0004 | Traceable By Label 04 | Traceable By Category 04 |
| TRAC-0005 | Traceable By Label 05 | Traceable By Category 05 |
| TRAC-0006 | Traceable By Label 06 | Traceable By Category 06 |

TRACEABLE BY and EVENT COUNT

The traceability framework links operational events to their governing or supervisory entities through the traceable_by relationship. The fact_syscall table records event_count values—238, 52, 198, and 382—each associated with a traceable_by_key that references a dimension entry in dim_traceable_by. The key TRAC-0003, for instance, appears as the traceable_by reference for two separate fact rows (TRAC-0001 and TRAC-0002), indicating that a single traceability dimension can aggregate multiple event records. This design enables roll-up analysis: the event counts under a common traceable_by_key can be summed to produce aggregate metrics per category, supporting audit and compliance reporting.

**fact_syscall**

| id | traceable_by_key | event_count |
| --- | --- | --- |
| TRAC-0001 | TRAC-0003 | 238 |
| TRAC-0002 | TRAC-0003 | 52 |
| TRAC-0003 | TRAC-0001 | 198 |
| TRAC-0004 | TRAC-0004 | 382 |
| TRAC-0005 | TRAC-0004 | 283 |
| TRAC-0006 | TRAC-0005 | 288 |

LANGUAGE and REVIEWCYCLEDAYS

The policy supersession table incorporates two operational metadata columns that govern the lifecycle of policy documents. The language column uniformly records es across all four entries, indicating Spanish-language governance documentation. The review_cycle_days column—reviewcycledays—specifies the interval between mandatory policy reviews, with values ranging from 131 days for the Incident Response Protocol (SUPE-0002) to 716 days for the Data Residency Rule (SUPE-0003). These intervals reflect the risk profile and regulatory sensitivity of each policy: shorter review cycles for incident response (131 days) versus longer cycles for data residency (716 days). The supersession relationships, combined with review cycle parameters, form a complete governance lineage that tracks not only which policy replaced which, but also the cadence at which each policy must be re-evaluated.