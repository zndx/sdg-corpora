---
chapter_id: ch_live_evidence_at_quality_tier_e5e1ad
topic_id: 51
family: 06_belief_structure
cited_terms: ['evidence_at_quality_tier', 'kernelhook_subclass', 'transformation_informed_by']
model: engine-refine
---

At kernel function denotes the instrumented execution point within the evidence-processing stack where quality-tier assessment is bound to a versioned hook artifact and a categorical placement in the operational taxonomy. Each kernel function carries a stable identifier—KERN-0001 through KERN-0004 in the reference corpus—and resolves through dimension records to a human-readable label and an at_kernel_function_category value that partitions the hook population into At Kernel Function Category 01 through Category 04. The hook itself is materialized as a fact record pairing that identifier with size_bytes, a footprint measure that ranges from 27,282,2846 bytes on the lightest deployment to 560,962,979 bytes on the heaviest, and with version, which may diverge sharply across siblings (version 10 on one hook against version 1 on another) even when categories remain nominally comparable. Governance treats at kernel function as the anchor: without a keyed hook, downstream transformations cannot assert which code path mediated evidence intake, and auditors cannot reconcile artifact bulk against declared capability.

**t_evidence_at_quality_tier**

| id | evidence | at_quality_tier |
| --- | --- | --- |
| TIER-0001 | network packets | qualified |
| TIER-0002 | audit trails | silver-tier |
| TIER-0003 | network packets | gold-tier |
| TIER-0004 | inspection photos | accredited |
| TIER-0005 | telemetry streams | platinum-tier |
| TIER-0006 | field measurements | certified |
| TIER-0007 | device firmware | archival |
| TIER-0008 | audit trails | validated |

**fact_kernelhook**

| id | at_kernel_function_key | size_bytes | version |
| --- | --- | --- | --- |
| KERN-0001 | KERN-0002 | 36342735 | 3 |
| KERN-0002 | KERN-0003 | 560962979 | 1 |
| KERN-0003 | KERN-0001 | 456299832 | 10 |
| KERN-0004 | KERN-0008 | 272822846 | 1 |

Identifier discipline threads every join in the model. Tier records use TIER-0001–TIER-0004; transformation facts use INFO-0001–INFO-0004; kernel hooks use KERN-prefixed keys. The identifier is not decorative metadata—it is the foreign-key substrate that lets attr bindings, entity-scoped values, and informed_by lineage survive schema refactors and cross-environment replay. Where informed_by_key on a transformation row points to INFO-0006 while sibling rows self-reference INFO-0001 or INFO-0002, the pattern encodes explicit provenance: the run was informed by a record outside the local fact batch, not merely by its own primary key. Operators who collapse or regenerate identifiers without remapping value tables break the entity–attr graph and silently orphan typed literals.

Attr and attr_type separate what may be said about an evidence quality tier from how it must be stored and validated. Attribute names—confidence, dimension_kind, method, recorded_at—are declared once per tier identifier with a corresponding attr_type drawn from XSD primitives: xsd:decimal for confidence, xsd:string for dimension_kind and method, xsd:dateTime for recorded_at. This split matters because compliance queries are type-safe by construction: confidence comparisons execute in the decimal value store (0.731 on TIER-0001 versus 0.358 on TIER-0002), while recorded_at instants such as 2024-11-19T18:15:43 and 2023-02-10T23:54:33 live only in the datetime store, all four rows bound to attr_id TIER-0004 and thus to the same temporal attribute definition. String-valued misc fields—Dimension Kind 01, Encoding 02, change rationale, ja—occupy the varchar store under distinct attr_ids on entity TIER-0001, illustrating how one entity may simultaneously hold multiple orthogonal descriptors without type coercion.

**t_evidence_at_quality_tier_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TIER-0001 | confidence | xsd:decimal |
| TIER-0002 | dimension_kind | xsd:string |
| TIER-0003 | method | xsd:string |
| TIER-0004 | recorded_at | xsd:dateTime |
| TIER-0005 | uncertainty | xsd:decimal |
| TIER-0006 | unit | xsd:string |
| TIER-0007 | value | xsd:decimal |
| TIER-0008 | encoding | xsd:string |

**t_evidence_at_quality_tier_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0004 | 2024-11-19T18:15:43 |
| TIER-0002 | TIER-0002 | TIER-0004 | 2023-02-10T23:54:33 |
| TIER-0003 | TIER-0003 | TIER-0004 | 2023-06-07T05:45:43 |
| TIER-0004 | TIER-0004 | TIER-0004 | 2024-08-05T11:37:21 |
| TIER-0005 | TIER-0005 | TIER-0004 | 2025-03-30T21:54:34 |
| TIER-0006 | TIER-0006 | TIER-0004 | 2023-10-26T18:53:01 |
| TIER-0007 | TIER-0007 | TIER-0004 | 2023-09-26T03:30:22 |
| TIER-0008 | TIER-0008 | TIER-0004 | 2023-04-10T10:08:00 |

**t_evidence_at_quality_tier_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0001 | 0.731 |
| TIER-0002 | TIER-0001 | TIER-0005 | 574.79 |
| TIER-0003 | TIER-0001 | TIER-0007 | 563.53 |
| TIER-0004 | TIER-0002 | TIER-0001 | 0.358 |
| TIER-0005 | TIER-0002 | TIER-0005 | 139.04 |
| TIER-0006 | TIER-0002 | TIER-0007 | 944.94 |
| TIER-0007 | TIER-0003 | TIER-0001 | 0.228 |
| TIER-0008 | TIER-0003 | TIER-0005 | 33.93 |

**t_evidence_at_quality_tier_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TIER-0001 | TIER-0001 | TIER-0002 | Dimension Kind 01 |
| TIER-0002 | TIER-0001 | TIER-0008 | Encoding 02 |
| TIER-0003 | TIER-0001 | TIER-0009 | change rationale |
| TIER-0004 | TIER-0001 | TIER-0010 | ja |
| TIER-0005 | TIER-0001 | TIER-0003 | hybrid |
| TIER-0006 | TIER-0001 | TIER-0006 | kg |
| TIER-0007 | TIER-0002 | TIER-0002 | Dimension Kind 07 |
| TIER-0008 | TIER-0002 | TIER-0008 | Encoding 08 |

Entity, in this domain, is the evidence quality tier instance to which attribute values attach; entity_id on each value row is the tier key, not the value row’s own id. A single entity may therefore fan out across typed stores: TIER-0001 carries decimal confidence and additional decimal measures at attr_ids TIER-0005 and TIER-0007 (574.79 and 563.53), string miscellany at four attr_ids, and shares the recorded_at attribute with peer tiers. Category, applied at the dimension layer rather than on raw facts, groups kernel functions and informed_by sources into parallel taxonomies—Informed By Category 01 through Category 04 alongside kernel categories—so that duration_seconds, exit, and retry_count aggregates can be reported by lineage class without overloading the fact grain. The evidence column on the tier dimension (network packets, audit trails, inspection photos) intersects at_quality_tier labels (qualified, silver-tier, gold-tier, accredited) to express both source modality and assurance band; accredited inspection photos and qualified network packets are not interchangeable evidentiary postures even when they share attribute shapes.

Transformation facts close the operational loop: each row records duration_seconds (from 150.01 to 5,474.59 in the sample), exit as exit_code (220, 302, 354, 471—non-zero codes that demand explicit handling policy), and retry_count as a resilience counter spanning 25 through 357 attempts before settlement. Informed_by links each transformation to a dimension row whose informed_by_label and informed_by_category misc fields document the originating authority or method declaration. Long duration paired with high retry_count—for example 5,474.59 seconds and 357 retries—informs capacity planning and incident review; a short 150.01-second run with exit 471 and 150 retries signals a different failure mode than a 5,248.45-second success path exiting 302 with 85 retries. Size_bytes on the kernel hook side and duration_seconds on the transformation side jointly support right-sizing: an accredited-tier photo pipeline referencing a 456,299,832-byte hook version 10 should not be compared naively to a 36,342,735-byte version-3 hook serving qualified packet capture without normalizing for version skew and category intent.

**fact_transformation**

| id | informed_by_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| INFO-0001 | INFO-0001 | 2399.22 | 354 | 25 |
| INFO-0002 | INFO-0002 | 5474.59 | 220 | 357 |
| INFO-0003 | INFO-0006 | 150.01 | 471 | 150 |
| INFO-0004 | INFO-0004 | 5248.45 | 302 | 85 |
| INFO-0005 | INFO-0004 | 6668.88 | 184 | 484 |
| INFO-0006 | INFO-0001 | 777.01 | 996 | 445 |
| INFO-0007 | INFO-0005 | 6572.74 | 634 | 341 |

In practice, reviewers traverse identifier → entity → attr/attr_type → typed misc value, then outward through at_kernel_function category and hook size_bytes to the transformation grain informed_by, exit, duration_seconds, and retry_count. The model rewards strict typing and stable keys: misc holds the literal payload but only within the attr_type contract; category and at kernel function supply interpretive frames; exit and retry_count supply run outcome evidence; duration_seconds and size_bytes supply scale evidence. Taken together, these elements define an auditable chain from what evidence was judged (tier and attributes), through where it was processed (kernel function and hook footprint), to how the processing run behaved (informed provenance, elapsed time, termination code, and retry discipline)—the minimum structure required for tier-based assurance to be operational rather than nominal.

**dim_at_kernel_function**

| id | at_kernel_function_label | at_kernel_function_category |
| --- | --- | --- |
| KERN-0001 | At Kernel Function Label 01 | At Kernel Function Category 01 |
| KERN-0002 | At Kernel Function Label 02 | At Kernel Function Category 02 |
| KERN-0003 | At Kernel Function Label 03 | At Kernel Function Category 03 |
| KERN-0004 | At Kernel Function Label 04 | At Kernel Function Category 04 |
| KERN-0005 | At Kernel Function Label 05 | At Kernel Function Category 05 |
| KERN-0006 | At Kernel Function Label 06 | At Kernel Function Category 06 |
| KERN-0007 | At Kernel Function Label 07 | At Kernel Function Category 07 |
| KERN-0008 | At Kernel Function Label 08 | At Kernel Function Category 08 |

**dim_informed_by**

| id | informed_by_label | informed_by_category |
| --- | --- | --- |
| INFO-0001 | Informed By Label 01 | Informed By Category 01 |
| INFO-0002 | Informed By Label 02 | Informed By Category 02 |
| INFO-0003 | Informed By Label 03 | Informed By Category 03 |
| INFO-0004 | Informed By Label 04 | Informed By Category 04 |
| INFO-0005 | Informed By Label 05 | Informed By Category 05 |
| INFO-0006 | Informed By Label 06 | Informed By Category 06 |