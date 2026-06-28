---
chapter_id: ch_live_carbon_credit_transaction_375a13
topic_id: 61
family: 08_derived
cited_terms: ['carbon_credit_transaction', 'trace_with_root_span', 'subclass_disjoint_from_artifact']
model: engine-refine
---

Carbon credit transactions are uniquely identified by internal sequence codes such as TRAN-0001 through TRAN-0004, each of which maps to an externally recognized credit identifier drawn from distinct certification schemes: CAR-2023-6677 under the Carbon Action Registry, VCS-TRX-8812 under Verified Carbon Standard, GS-TRX-8814 under Gold Standard, and ACR-CC-7721 under American Carbon Registry. These identifiers anchor the transaction in a verifiable chain of custody, ensuring that every credit can be traced back to the project that generated it and forward to the entity that acquired it. The derivation relationship is captured through a project linkage table that associates each transaction with its originating carbon credit project—transactions TRAN-0001 and TRAN-0004 both derive from Nepal-Afforestation, TRAN-0002 from Iceland-Geothermal, and TRAN-0003 from Brazil-Biochar—establishing a many-to-many provenance graph where a single project may underwrite multiple transactions and a single transaction may draw from multiple project sources.

**t_carbon_credit_transaction**

| id | carbon_credit_transaction |
| --- | --- |
| TRAN-0001 | CAR-2023-6677 |
| TRAN-0002 | VCS-TRX-8812 |
| TRAN-0003 | GS-TRX-8814 |
| TRAN-0004 | ACR-CC-7721 |
| TRAN-0005 | CARB-2024-3305 |
| TRAN-0006 | CARB-2024-3305 |

**t_carbon_credit_transaction_derives_from_project**

| id | derives_from_project |
| --- | --- |
| TRAN-0001 | Iceland-Geothermal |
| TRAN-0002 | Nepal-Afforestation |
| TRAN-0003 | Brazil-Biochar |
| TRAN-0004 | Nepal-Afforestation |
| TRAN-0005 | Amazonia-REDD |
| TRAN-0006 | Kerala-Mangrove |

**t_carbon_credit_transaction_transferred_to**

| id | transferred_to |
| --- | --- |
| TRAN-0001 | Norway-Wealth |
| TRAN-0002 | AFK-Environmental |
| TRAN-0003 | Orsted-NetZero |
| TRAN-0004 | Maersk-Offsetting |
| TRAN-0005 | Orsted-NetZero |
| TRAN-0006 | AFK-Environmental |

The provenance graph is materialized through a junction table that encodes the derives-from relationship with explicit role semantics: each row carries a subject identifier (carbon_id), a target project identifier (derives_from_project_id), and a role attribute that distinguishes between owner and contributor designations. For instance, transaction TRAN-0002 holds the owner role with respect to project TRAN-0005, while TRAN-0006, TRAN-0003, and TRAN-0001 appear as contributors to the same project, reflecting a hierarchy of claim and participation that is essential for audit trails and benefit-sharing calculations. This same relational pattern recurs in the transfer dimension, where transactions are linked to purchasing entities—Norway-Wealth, AFK-Environmental, Orsted-NetZero, and Maersk-Offsetting—through a separate junction table that additionally carries cardinality notes (Cardinality Note 01 through Cardinality Note 04) and role assignments (owner, contributor, observer) to constrain and qualify the transfer relationship. The cardinality notes serve as operational annotations, documenting constraints such as one-to-one exclusivity or many-to-one aggregation that govern how a given transaction may be assigned to a purchasing entity.

**t_carbon_credit_transaction__derives_from_project**

| id | carbon_id | derives_from_project_id | role |
| --- | --- | --- | --- |
| TRAN-0001 | TRAN-0002 | TRAN-0005 | owner |
| TRAN-0002 | TRAN-0006 | TRAN-0003 | contributor |
| TRAN-0003 | TRAN-0003 | TRAN-0005 | contributor |
| TRAN-0004 | TRAN-0001 | TRAN-0005 | contributor |
| TRAN-0005 | TRAN-0002 | TRAN-0002 | contributor |
| TRAN-0006 | TRAN-0004 | TRAN-0003 | contributor |
| TRAN-0007 | TRAN-0003 | TRAN-0003 | owner |
| TRAN-0008 | TRAN-0006 | TRAN-0006 | reviewer |

**t_carbon_credit_transaction__transferred_to**

| id | carbon_id | transferred_to_id | role | cardinality_note |
| --- | --- | --- | --- | --- |
| TRAN-0001 | TRAN-0002 | TRAN-0001 | contributor | Cardinality Note 01 |
| TRAN-0002 | TRAN-0005 | TRAN-0003 | owner | Cardinality Note 02 |
| TRAN-0003 | TRAN-0001 | TRAN-0002 | owner | Cardinality Note 03 |
| TRAN-0004 | TRAN-0006 | TRAN-0003 | observer | Cardinality Note 04 |
| TRAN-0005 | TRAN-0004 | TRAN-0001 | reviewer | Cardinality Note 05 |
| TRAN-0006 | TRAN-0001 | TRAN-0004 | observer | Cardinality Note 06 |
| TRAN-0007 | TRAN-0002 | TRAN-0005 | owner | Cardinality Note 07 |
| TRAN-0008 | TRAN-0002 | TRAN-0006 | observer | Cardinality Note 08 |

Beyond the carbon credit domain, the data model incorporates a trace infrastructure organized around root spans, which function as the top-level identifiers in a distributed tracing hierarchy. The fact_trace table records each trace instance with a root_span_key that points to a parent span, a size_bytes metric that quantifies the payload (values range from 70,626,790 bytes for SPAN-0003 to 941,223,628 bytes for SPAN-0002), and a version number (ranging from 4 to 12) that tracks schema or protocol evolution. These trace records are dimensioned by a dim_root_span table that assigns each span a human-readable label (Root Span Label 01 through Root Span Label 04) and a categorical classification (Root Span Category 01 through Root Span Category 04), enabling aggregation and filtering by functional domain. The separation of trace facts from span dimensions follows a star-schema convention that supports analytical queries on trace volume, size distribution, and version adoption without denormalizing the categorical metadata.

**fact_trace**

| id | root_span_key | size_bytes | version |
| --- | --- | --- | --- |
| SPAN-0001 | SPAN-0002 | 475324433 | 12 |
| SPAN-0002 | SPAN-0004 | 941223628 | 8 |
| SPAN-0003 | SPAN-0005 | 70626790 | 12 |
| SPAN-0004 | SPAN-0005 | 953122943 | 4 |

**dim_root_span**

| id | root_span_label | root_span_category |
| --- | --- | --- |
| SPAN-0001 | Root Span Label 01 | Root Span Category 01 |
| SPAN-0002 | Root Span Label 02 | Root Span Category 02 |
| SPAN-0003 | Root Span Label 03 | Root Span Category 03 |
| SPAN-0004 | Root Span Label 04 | Root Span Category 04 |
| SPAN-0005 | Root Span Label 05 | Root Span Category 05 |
| SPAN-0006 | Root Span Label 06 | Root Span Category 06 |

The model also includes a disjointness constraint table that enforces type exclusivity across artifact subclasses. Entries such as lab-assay-protocol, sensor-telemetry-stream, and telemetry-metadata-index are declared as mutually exclusive with the artifact super-type, meaning that any instance classified under one of these subclasses cannot simultaneously belong to another. This constraint is critical for maintaining data integrity in systems where artifacts are polymorphically referenced, as it prevents ambiguous classification and ensures that downstream processing logic can rely on a single, unambiguous type assignment. Together, the transaction provenance chains, the purchasing entity transfer relationships with cardinality annotations, the trace infrastructure with its dimensional taxonomy, and the disjointness constraints form a coherent data model that supports end-to-end traceability, auditability, and analytical rigor across carbon credit lifecycle management.

**t_subclass_disjoint_from_artifact**

| id | disjoint |
| --- | --- |
| ARTI-0001 | lab-assay-protocol |
| ARTI-0002 | sensor-telemetry-stream |
| ARTI-0003 | telemetry-metadata-index |
| ARTI-0004 | telemetry-metadata-index |
| ARTI-0005 | artifact-manifest-record |
| ARTI-0006 | feature-vector-cache |
| ARTI-0007 | provenance-chain-hash |