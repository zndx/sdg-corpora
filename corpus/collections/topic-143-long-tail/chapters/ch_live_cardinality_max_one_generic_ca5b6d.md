---
chapter_id: ch_live_cardinality_max_one_generic_ca5b6d
topic_id: 143
family: 01_foundation
cited_terms: ['cardinality_max_one_generic', 'cardinality_max_three_generic', 'cardinality_min_one_generic']
model: engine-refine
---

Identifiers serve as the immutable anchors of data integrity, providing stable keys that bind disparate entities across a system's architecture. An identifier such as GENE-0001 does not merely label a record; it establishes a contract for how that record participates in relationships with other entities. The power of an identifier lies not in its format—whether alphanumeric like GENE-0001, GENE-0002, GENE-0003, or GENE-0004—but in the cardinality constraints that govern its associations. These constraints define the multiplicity of relationships, ensuring that every reference from an identifier to a related entity is both predictable and enforceable. Without such constraints, identifiers become ambiguous pointers, and data integrity degrades into guesswork.

**t_cardinality_max_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | mandatory_one | device_metrics |
| GENE-0002 | strict_unique | asset_registry |
| GENE-0003 | singular_ref | audit_logs |
| GENE-0004 | first_match | config_params |

**t_cardinality_min_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | exactlyOne | tenantId |
| GENE-0002 | minOne | batchId |
| GENE-0003 | minOne | assetId |
| GENE-0004 | required | batchId |
| GENE-0005 | minOne | deviceId |
| GENE-0006 | many | tenantId |

The most restrictive class of cardinality enforces a maximum of one relationship per identifier, guaranteeing that each identifier maps to exactly a single target. Under a mandatory_one constraint, GENE-0001 must always resolve to device_metrics, leaving no room for null or missing associations. A strict_unique constraint on GENE-0002 ensures that asset_registry references remain singular and unambiguous, preventing duplicate mappings that could corrupt downstream lookups. The singular_ref pattern applied to GENE-0003 and audit_logs, along with the first_match rule for GENE-0004 and config_params, represent practical variants of this one-to-one discipline—each ensuring that an identifier resolves to precisely one related record, whether through hard enforcement or deterministic selection from a single valid result.

When an identifier must relate to multiple targets, cardinality constraints impose upper bounds to prevent unbounded proliferation. The capped-pair constraint on GENE-0001 limits its association with telemetry-stream to at most two references, while bounded-triplet on GENE-0002 permits up to three. GENE-0003 under single-bound reverts to a maximum of one, and GENE-0004 under max-three allows up to three telemetry-stream associations. These bounded-many relationships are critical in streaming or telemetry architectures where a single source identifier may generate multiple data streams, yet the system must prevent runaway fan-out that could overwhelm consumers or inflate storage costs.

**t_cardinality_max_three_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | capped-pair | telemetry-stream |
| GENE-0002 | bounded-triplet | telemetry-stream |
| GENE-0003 | single-bound | telemetry-stream |
| GENE-0004 | max-three | telemetry-stream |
| GENE-0005 | limited-association | batch-job |
| GENE-0006 | triple-cap | telemetry-stream |
| GENE-0007 | fixed-triple | batch-job |
| GENE-0008 | capped-pair | stream-processor |

At the opposite end of the spectrum, minimum cardinality constraints ensure that every identifier maintains at least one required association, eliminating orphaned records and guaranteeing referential completeness. The exactlyOne constraint on GENE-0001 mandates a single tenantId, anchoring the record to a specific tenant context with no ambiguity. The minOne constraint on both GENE-0002 and GENE-0003 requires at least one batchId, ensuring that every record belongs to a processing batch even if additional batch associations are permissible. GENE-0004 under the required constraint must always resolve to an assetId, making the association non-optional and enforcing a baseline of data completeness. Together, these minimum constraints form the floor of referential integrity, ensuring that no identifier exists in a vacuum.