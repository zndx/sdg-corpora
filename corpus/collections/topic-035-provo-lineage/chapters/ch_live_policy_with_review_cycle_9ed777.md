---
chapter_id: ch_live_policy_with_review_cycle_9ed777
topic_id: 35
family: 03_directive_governance
cited_terms: ['policy_with_review_cycle', 'log_within_span_context', 'schemaorg_place_geocoord']
model: engine-refine
---

Geographic coordinates serve as the spatial anchor for distributed data assets, each entry classified by a categorical label and a supplementary descriptor that together enable precise inventory and retrieval. In the reference schema, the dimension table for geographic coordinates pairs an identifier such as GEOC-0001 through GEOC-0004 with a human-readable label—Geo Coordinates Label 01, for instance—and a category designation like Geo Coordinates Category 01. These categorical groupings are not merely taxonomic; they determine downstream filtering and aggregation logic across analytical pipelines. The fact table for schema.org entities references this dimension through a foreign key, geo_coordinates_key, thereby binding each asset to its spatial classification. A single category, such as GEOC-0004, may be referenced by multiple fact records—versions 3, 4, and 8 of schema.org data all resolve to the same geographic anchor—while a single identifier can appear across disparate versions, ensuring that spatial metadata remains consistent even as the underlying data evolves.

**fact_schemaorg**

| id | geo_coordinates_key | size_bytes | version |
| --- | --- | --- | --- |
| GEOC-0001 | GEOC-0004 | 895265030 | 3 |
| GEOC-0002 | GEOC-0006 | 114301972 | 5 |
| GEOC-0003 | GEOC-0004 | 338701831 | 4 |
| GEOC-0004 | GEOC-0004 | 998785819 | 8 |

**dim_geo_coordinates**

| id | geo_coordinates_label | geo_coordinates_category |
| --- | --- | --- |
| GEOC-0001 | Geo Coordinates Label 01 | Geo Coordinates Category 01 |
| GEOC-0002 | Geo Coordinates Label 02 | Geo Coordinates Category 02 |
| GEOC-0003 | Geo Coordinates Label 03 | Geo Coordinates Category 03 |
| GEOC-0004 | Geo Coordinates Label 04 | Geo Coordinates Category 04 |
| GEOC-0005 | Geo Coordinates Label 05 | Geo Coordinates Category 05 |
| GEOC-0006 | Geo Coordinates Label 06 | Geo Coordinates Category 06 |

The size of each asset, recorded in bytes, provides a quantitative measure of storage footprint and processing demand. Values in the fact table range from approximately 114 megabytes (114,301,972 bytes for GEOC-0002) to nearly 900 megabytes (895,265,030 bytes for GEOC-0001), reflecting the heterogeneous nature of the data landscape. These figures are not static; they are tied to a version number—3, 4, 5, or 8—that tracks the evolution of each asset over time. Versioning ensures that historical queries can be resolved against the correct iteration of the data, while the size metric allows capacity planners to forecast storage requirements and compute budgets. The interplay between version and size is particularly salient when the same geographic category hosts multiple versions: GEOC-0004, for example, is associated with versions 3, 4, and 8, each carrying a distinct byte count, which implies that the data within that category has been expanded, refined, or restructured across releases.

Policy governance introduces a parallel layer of control, where compliance frameworks such as FedRAMP, NIST SP 800-53, CCPA, and SOC 2 Type II are each assigned a unique identifier—CYCL-0001 through CYCL-0004—and linked to a review cycle via a foreign key. The review cycles themselves, identified as CONT-0002, CONT-0004, and CONT-0005, are not abstract; they correspond to concrete operational artifacts. CONT-0002 maps to a cache-eviction log, CONT-0004 to a disk I/O trace, and CONT-0005 to a batch scheduler log, each of which is further contextualized within a span such as user-session-4492, us-east-1-cluster, ml-inference-run, or warehouse-replication. This chain of references—from policy to review cycle to log file to operational span—creates an auditable trail that connects regulatory requirements to the systems they govern.

**t_policy_with_review_cycle**

| id | policy | review_cycle | scope | language |
| --- | --- | --- | --- | --- |
| CYCL-0001 | FedRAMP | CONT-0002 | local | ja |
| CYCL-0002 | NIST SP 800-53 | CONT-0005 | team | ja |
| CYCL-0003 | CCPA | CONT-0004 | regional | fr |
| CYCL-0004 | SOC 2 Type II | CONT-0005 | regional | ja |
| CYCL-0005 | GDPR | CONT-0002 | global | ja |
| CYCL-0006 | FedRAMP | CONT-0005 | global | fr |
| CYCL-0007 | SOC 2 Type II | CONT-0001 | global | ja |
| CYCL-0008 | CCPA | CONT-0004 | local | ja |

**t_log_within_span_context**

| id | log |
| --- | --- |
| CONT-0001 | cache-eviction.out |
| CONT-0002 | batch-scheduler.log |
| CONT-0003 | disk-io.trace |
| CONT-0004 | disk-io.trace |
| CONT-0005 | disk-io.trace |
| CONT-0006 | auth-service.warn |

**t_log_within_span_context_within_span_context**

| id | within_span_context |
| --- | --- |
| CONT-0001 | user-session-4492 |
| CONT-0002 | us-east-1-cluster |
| CONT-0003 | ml-inference-run |
| CONT-0004 | warehouse-replication |
| CONT-0005 | warehouse-replication |
| CONT-0006 | us-east-1-cluster |
| CONT-0007 | warehouse-replication |

The scope of each policy, whether local, team, or regional, determines the breadth of its applicability, while the language field—ja or fr—specifies the linguistic register in which the policy documentation is authored. FedRAMP and NIST SP 800-53 both carry the identifier CYCL-0001 and CYCL-0002 respectively, yet they diverge in scope: the former is scoped to local operations, the latter to team-level oversight, even though both are documented in Japanese (ja). SOC 2 Type II, by contrast, is scoped to regional operations and also uses Japanese, while CCPA is the sole policy documented in French (fr), scoped to regional operations. These distinctions matter in multinational organizations where regulatory compliance must be communicated in the appropriate language and enforced at the correct organizational tier.

Within the operational span, the role field assigns a functional designation—reviewer, observer, or contributor—to each log-context pairing, establishing a matrix of accountability. The join table that links logs to spans uses a role column to indicate whether the entity associated with a given log ID is acting as a reviewer, observer, or contributor within the target span. For instance, CONT-0004 appears as both a log ID and a within-span-context ID, and when it appears in the join table, it is consistently associated with the contributor role across multiple rows. This role-based assignment ensures that every log entry can be traced to a responsible party within the operational context, supporting both incident response and continuous compliance monitoring.

**t_log_within_span_context__within_span_context**

| id | log_id | within_span_context_id | role |
| --- | --- | --- | --- |
| CONT-0001 | CONT-0006 | CONT-0003 | reviewer |
| CONT-0002 | CONT-0005 | CONT-0004 | observer |
| CONT-0003 | CONT-0004 | CONT-0004 | contributor |
| CONT-0004 | CONT-0004 | CONT-0004 | contributor |
| CONT-0005 | CONT-0005 | CONT-0003 | observer |
| CONT-0006 | CONT-0004 | CONT-0006 | contributor |
| CONT-0007 | CONT-0004 | CONT-0005 | observer |
| CONT-0008 | CONT-0002 | CONT-0005 | reviewer |

The architecture of identifiers—CONT- prefixed for operational logs and spans, CYCL- prefixed for policy review cycles, and GEOC- prefixed for geographic coordinates—creates a namespace discipline that prevents collisions across domains. Each identifier serves as a stable reference point that can be resolved across tables, enabling joins that would otherwise be ambiguous. The foreign-key relationships between tables are not incidental; they are the structural glue that allows a policy like FedRAMP to be traced through its review cycle, into the corresponding log file, within its operational span, and ultimately to the geographic category of the asset it governs. This interconnectedness is what transforms a collection of discrete records into a coherent governance framework.