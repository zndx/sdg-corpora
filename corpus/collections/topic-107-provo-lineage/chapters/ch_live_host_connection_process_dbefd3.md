---
chapter_id: ch_live_host_connection_process_dbefd3
topic_id: 107
family: 08_derived
cited_terms: ['host_connection_process', 'trace_with_service_name', 'log_with_resource_attribute']
model: engine-refine
---

Host connection processes describe how a parasitic organism establishes vascular contact with a host plant—a biological event that must be named, bounded, and auditable if it is to support comparative research, regulatory reporting, or operational monitoring. Each process receives a durable identifier such as PROC-0001 or PROC-0004 so that observations, specimens, and downstream analyses can be correlated without ambiguity. The process itself is characterized by its hostconnectionprocess value, which in practice encodes the host taxon and often a cultivar or accession: Zea mays B73, Helianthus annuus, Hordeum vulgare, and Quercus robur represent distinct experimental or field contexts in which connection morphology, timing, and outcome may differ materially. Treating the process as a first-class governed object—not merely a row in a ledger—ensures that evidence about parasitic attachment can be retrieved, challenged, and reconciled across studies and jurisdictions.

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

Parasiticplant participation names the anatomical or cellular actors that materially participate in connection. Haustorium and Cortical cells are not decorative labels; they denote structures whose presence, development stage, and spatial relationship to host tissue determine whether a reported connection is biologically plausible and methodologically consistent. Where a single process involves multiple participants, governance requires explicit subject–target linkage rather than implicit co-occurrence. In the junction pattern illustrated by PROC-0001 through PROC-0004, host_id PROC-0007 acts as the subject anchor while has_participant_id values such as PROC-0003 or PROC-0007 identify targets; the role column then assigns observer, owner, or reviewer responsibility to each edge. Two edges may share the same subject and target identifiers yet differ in role—PROC-0003 is linked as observer in one record and as owner in another—demonstrating that accountability attaches to the relationship, not to the entity alone. This separation matters for compliance: owners attest to data quality and lineage, reviewers certify methodological adequacy, and observers contribute evidence without assuming custodial liability.

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

The same relational grammar appears in distributed operations, where trace identifiers (notif-send-8876, inventory-sync-2290, payment-proc-4451, api-gateway-991) denote bounded units of work whose cross-service behavior must be reconstructible for incident response, capacity planning, and contractual service-level review. Service names—inventory-db, order-processor, metrics-collector, search-engine—function as governed targets in the dependency graph. When trace_id NAME-0001 is associated with service_name_id NAME-0005 under role observer, the record documents observational participation in a span without implying ownership of the underlying datastore or processor. Conversely, assigning role owner to NAME-0004 paired with NAME-0007 elevates custodial duty for that service within the trace context. Reviewer assignments complete the control triangle: they create an auditable checkpoint between raw telemetry and accepted operational fact. Operators who conflate trace identity with service identity—or who omit role on reified edges—lose the ability to enforce least-privilege access, attribute incidents correctly, or demonstrate due diligence during audits.

**t_trace_with_service_name**

| id | trace |
| --- | --- |
| NAME-0001 | notif-send-8876 |
| NAME-0002 | inventory-sync-2290 |
| NAME-0003 | payment-proc-4451 |
| NAME-0004 | api-gateway-991 |
| NAME-0005 | cache-warm-5502 |
| NAME-0006 | payment-proc-4451 |

**t_trace_with_service_name_service_name**

| id | service_name |
| --- | --- |
| NAME-0001 | inventory-db |
| NAME-0002 | order-processor |
| NAME-0003 | metrics-collector |
| NAME-0004 | search-engine |
| NAME-0005 | logging-agent |
| NAME-0006 | logging-agent |
| NAME-0007 | config-server |
| NAME-0008 | inventory-db |

Resource attributes extend the framework from relational topology to measurable state. A resource attribute is a governed key—ATTR-0001 through ATTR-0006 in the evidence set—that identifies what is being measured or classified, while category and misc (expressed here as resource_attribute_category and resource_attribute_label) supply the taxonomic and human-readable scaffolding needed for policy application. Resource Attribute Category 01 through Resource Attribute Category 04 partition the attribute space so retention rules, encryption requirements, and access tiers can be applied by class rather than by ad hoc string matching; labels such as Resource Attribute Label 01 provide operational clarity without collapsing distinct keys that may share similar wording. Fact_log entries bind each resource_attribute_key to quantitative evidence: size_bytes values on the order of 913386183, 303816232, 758542341, and 442933768 bytes make storage exposure legible for capacity governance, cost allocation, and breach-impact estimation. Version numbers—6, 7, and 2 across the sample—record evolutionary state so that comparisons across time use like-with-like semantics; a size measurement at version 7 is not automatically commensurate with one at version 2 unless migration and reconciliation rules explicitly bridge them.

**dim_resource_attribute**

| id | resource_attribute_label | resource_attribute_category |
| --- | --- | --- |
| ATTR-0001 | Resource Attribute Label 01 | Resource Attribute Category 01 |
| ATTR-0002 | Resource Attribute Label 02 | Resource Attribute Category 02 |
| ATTR-0003 | Resource Attribute Label 03 | Resource Attribute Category 03 |
| ATTR-0004 | Resource Attribute Label 04 | Resource Attribute Category 04 |
| ATTR-0005 | Resource Attribute Label 05 | Resource Attribute Category 05 |
| ATTR-0006 | Resource Attribute Label 06 | Resource Attribute Category 06 |

Identifiers thread these domains into a single compliance posture. PROC-, NAME-, and ATTR- prefixes are not cosmetic; they signal entity class, expected referential integrity, and the audit vocabulary reviewers should expect in change logs and access requests. Subject and target fields enforce directionality: the subject is the anchoring context (a host process, a trace, a parent assertion), and the target is the participating or attributed entity whose relationship must be justified. Role, category, version, and size_bytes then layer orthogonal controls—accountability, classification, temporal fidelity, and magnitude—so that a single identifier can support multiple governed views without contradiction. When resource_attribute_key ATTR-0001 appears in both dimension and fact contexts, analysts can roll up byte totals by category while still drilling to the precise attribute lineage that produced each measurement.

**fact_log**

| id | resource_attribute_key | size_bytes | version |
| --- | --- | --- | --- |
| ATTR-0001 | ATTR-0005 | 913386183 | 6 |
| ATTR-0002 | ATTR-0006 | 303816232 | 7 |
| ATTR-0003 | ATTR-0001 | 758542341 | 7 |
| ATTR-0004 | ATTR-0001 | 442933768 | 2 |

In practice, operational guides should require that every new host connection process, trace span, or resource attribute be minted with a stable identifier, classified under an approved category, linked through explicit subject–target edges with assigned roles, and versioned whenever semantics or measurement methodology change. Parasiticplant structure names, service names, and attribute labels belong in controlled vocabularies; size_bytes and similar metrics should be captured at known versions to preserve evidentiary weight. The botanical and systems examples differ in domain vocabulary but share one governance invariant: entities are identified, relationships are directional and role-bearing, attributes are categorized and measurable, and change is versioned. Organizations that internalize this invariant can audit across silos—field biology, platform telemetry, and data estate management—using a common evidentiary grammar rather than reconciling incompatible narratives after the fact.

**t_trace_with_service_name__service_name**

| id | trace_id | service_name_id | role |
| --- | --- | --- | --- |
| NAME-0001 | NAME-0001 | NAME-0005 | observer |
| NAME-0002 | NAME-0005 | NAME-0007 | observer |
| NAME-0003 | NAME-0004 | NAME-0007 | owner |
| NAME-0004 | NAME-0001 | NAME-0006 | reviewer |
| NAME-0005 | NAME-0002 | NAME-0004 | observer |
| NAME-0006 | NAME-0003 | NAME-0008 | observer |
| NAME-0007 | NAME-0006 | NAME-0002 | contributor |
| NAME-0008 | NAME-0003 | NAME-0008 | reviewer |