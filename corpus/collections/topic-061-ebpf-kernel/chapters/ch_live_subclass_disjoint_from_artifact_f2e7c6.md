---
chapter_id: ch_live_subclass_disjoint_from_artifact_f2e7c6
topic_id: 61
family: 01_foundation
cited_terms: ['subclass_disjoint_from_artifact', 'ringbuf_map_subclass', 'labrun_observed_at_site']
model: engine-refine
---

In governed operational systems, every durable fact must be addressable without ambiguity, which is why identifiers serve as the non-negotiable spine of traceability. An identifier is not merely a surrogate key for storage convenience; it is the stable handle by which auditors, integrators, and downstream services refer to the same object across time, schema evolution, and organizational boundaries. When a subclass-disjointness rule is recorded against ARTI-0001 through ARTI-0004, or when a ring-buffer mapping is keyed as MAP-0001 through MAP-0004, those tokens are doing governance work: they let a reviewer confirm that lab-assay-protocol is explicitly declared disjoint from sensor-telemetry-stream without conflating artifact classes, and they let an operator retrieve the metrics capture ring or audit log ring configuration that corresponds to a particular MAP row without re-deriving identity from descriptive text alone. Identifiers therefore matter because compliance depends on referential integrity—on being able to say, with evidence, which rule, which buffer, which site observation, and which attribute definition was in force when a decision was made.

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

Entities are the things that identifiers name in the operational world: the lab runs, site observations, buffer mappings, and configuration objects whose state must be recorded, compared, and retained. A lab-run observation anchored at SITE-0001 is an entity in this sense—not an abstract table row, but a concrete occurrence (PCR-ALPHA) situated within a particular mapping context (occurs_in MAP-0003). Entities matter because governance frameworks rarely regulate columns; they regulate objects and events. Duration, completion time, exit status, and host provenance attach to entities, not to free-floating strings, which is why typed value stores consistently carry an entity_id pointer back to SITE-0001 or SITE-0002 when persisting 3858.44 seconds of runtime or an end_time of 2024-11-18T14:57:47. Without entity discipline, attribute values become orphaned telemetry; with it, each measurement remains legible as a property of a specific run observed at a specific site under a specific operational map.

**t_labrun_observed_at_site**

| id | labrun | occurs_in |
| --- | --- | --- |
| SITE-0001 | PCR-ALPHA | MAP-0003 |
| SITE-0002 | RUN-2023-A4 | MAP-0003 |
| SITE-0003 | WET-LAB-44 | MAP-0004 |
| SITE-0004 | PLATE-A12 | MAP-0003 |
| SITE-0005 | BATCH-8812 | MAP-0002 |
| SITE-0006 | NEXTRA-GEN-03 | MAP-0003 |
| SITE-0007 | BATCH-8812 | MAP-0003 |

**t_labrun_observed_at_site_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SITE-0001 | duration_seconds | xsd:decimal |
| SITE-0002 | end_time | xsd:dateTime |
| SITE-0003 | exit_code | xsd:integer |
| SITE-0004 | host_name | xsd:string |
| SITE-0005 | log_level | xsd:string |
| SITE-0006 | phase | xsd:string |
| SITE-0007 | retry_count | xsd:integer |
| SITE-0008 | scheduled_at | xsd:dateTime |

Attributes and attribute types form the controlled vocabulary through which entities expose inspectable properties. An attr names what is being asserted—duration_seconds, end_time, exit_code, host_name—while attr_type declares the interpretive contract under which that assertion must be validated, displayed, and aggregated. Declaring end_time as xsd:dateTime and duration_seconds as xsd:decimal is not cosmetic typing; it is how the system prevents category errors that would invalidate audit conclusions, such as summing timestamps or comparing exit_code integers to host_name strings. In practice, attribute registries are maintained separately from values so that the meaning of SITE-0003 as exit_code remains stable even as individual runs record 263, 199, or 302, and so that a later schema addition (SITE-0010 for a new host_name facet) does not retroactively redefine older attributes. Attribute typing also drives physical representation: datetime, decimal, integer, and varchar value partitions exist because misc—the literal stored value—must be carried in a representation faithful to its declared type, whether that misc is ingest-21, Log Level 02, closeout, or failed.

The misc designation marks the payload that completes an attribute assertion once entity and attr have fixed the subject of the statement and attr_type has fixed its grammar. Misc is where operational reality becomes machine-checkable evidence: a decimal misc of 5434.21 attached to SITE-0003 under duration_seconds is a quantified claim about elapsed work; a varchar misc of failed on SITE-0001 is a categorical outcome that may trigger escalation paths independent of numeric duration. Because misc values are typed, reviewers can apply consistent predicates—threshold checks on decimals, ordering on dateTimes, enumeration constraints on strings—without hand-tuning per row. This separation of attr definition from misc instantiation is what allows the same attribute identity (SITE-0001 for duration_seconds) to accumulate multiple decimal readings across SITE-0001 through SITE-0004 while preserving a single authoritative definition of what “duration_seconds” means for compliance reporting.

Associations among governed objects frequently require more than pairwise identity; they require directed semantics and accountable participation, which is where subject, target, and role complete the model. In a ring-buffer-to-configuration linkage, the ringbuf_id acts as subject—the operational buffer identity whose behavior is being constrained—while ring_buffer_config_id acts as target—the specification artifact (sync mode spec, compression profile, buffer depth spec) that supplies parameters. A mapping such as MAP-0001 tied to MAP-0006 with role owner is materially different from MAP-0003 tied to MAP-0004 with role contributor: the subject-target pair states what is linked to what, and the role states how that link may be exercised within workflow and authorization policy. Roles such as observer, reviewer, contributor, and owner therefore matter in practice because they translate structural relationships into duties: who may attest, who may amend configuration, who may write into the diagnostic trace buffer versus merely read from the audit log ring. Subject-target-role triples make implicit dependencies explicit—MAP-0005 as a subject paired to MAP-0004 as target under contributor is auditable in a way that an undirected “related_to” edge would not be.

Taken together, identifiers, entities, attrs, attr_types, misc, and subject-target-role associations define how a heterogeneous instrumentation and laboratory-operations environment remains explainable under scrutiny. Disjointness declarations prevent incompatible subclasses from collapsing into a single compliance class; ring-buffer mappings connect runtime capture surfaces to configuration profiles; site observations bind lab runs to the maps under which they were seen; typed attribute values record durations, timestamps, exit codes, and host names as verifiable claims rather than narrative footnotes. Operators who understand these constructs can reconstruct lineage—why PCR-ALPHA observed under MAP-0003 carries both decimal duration and datetime boundaries, why duplicate telemetry-metadata-index disjoint entries signal intentional non-overlap rather than duplication error, and why the same MAP-0001 identifier can appear as a configuration key, a ringbuf subject, and an occurs_in anchor without contradiction because each appearance is typed by its relational role. That reconstructability is the practical payoff: governance is enforced not by naming conventions alone, but by a disciplined separation of identity, entity, property definition, typed value, and directed, role-bearing relationships that remain stable enough to support audit, remediation, and continuous operation.

**t_ringbuf_map_subclass**

| id | ringbuf |
| --- | --- |
| MAP-0001 | metrics capture ring |
| MAP-0002 | diagnostic trace buffer |
| MAP-0003 | audit log ring |
| MAP-0004 | sensor stream buffer |
| MAP-0005 | diagnostic trace buffer |
| MAP-0006 | event queue ring |
| MAP-0007 | telemetry fifo ring |

**t_ringbuf_map_subclass_ring_buffer_config**

| id | ring_buffer_config |
| --- | --- |
| MAP-0001 | sync mode spec |
| MAP-0002 | sync mode spec |
| MAP-0003 | compression profile |
| MAP-0004 | buffer depth spec |
| MAP-0005 | compression profile |
| MAP-0006 | sample rate config |
| MAP-0007 | overflow handling spec |
| MAP-0008 | compression profile |

**t_ringbuf_map_subclass__ring_buffer_config**

| id | ringbuf_id | ring_buffer_config_id | role |
| --- | --- | --- | --- |
| MAP-0001 | MAP-0001 | MAP-0006 | observer |
| MAP-0002 | MAP-0003 | MAP-0004 | reviewer |
| MAP-0003 | MAP-0005 | MAP-0004 | contributor |
| MAP-0004 | MAP-0001 | MAP-0007 | owner |
| MAP-0005 | MAP-0002 | MAP-0006 | contributor |
| MAP-0006 | MAP-0006 | MAP-0003 | contributor |
| MAP-0007 | MAP-0005 | MAP-0002 | owner |
| MAP-0008 | MAP-0002 | MAP-0003 | owner |

**t_labrun_observed_at_site_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0002 | 2024-11-18T14:57:47 |
| SITE-0002 | SITE-0001 | SITE-0008 | 2025-06-11T00:43:59 |
| SITE-0003 | SITE-0001 | SITE-0009 | 2024-11-24T23:41:09 |
| SITE-0004 | SITE-0002 | SITE-0002 | 2024-09-03T12:28:15 |
| SITE-0005 | SITE-0002 | SITE-0008 | 2024-01-21T14:36:33 |
| SITE-0006 | SITE-0002 | SITE-0009 | 2024-08-02T20:19:39 |
| SITE-0007 | SITE-0003 | SITE-0002 | 2023-08-18T18:21:00 |
| SITE-0008 | SITE-0003 | SITE-0008 | 2023-03-15T08:25:39 |

**t_labrun_observed_at_site_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0001 | 3858.44 |
| SITE-0002 | SITE-0002 | SITE-0001 | 2622.63 |
| SITE-0003 | SITE-0003 | SITE-0001 | 5434.21 |
| SITE-0004 | SITE-0004 | SITE-0001 | 3308.67 |
| SITE-0005 | SITE-0005 | SITE-0001 | 138.03 |
| SITE-0006 | SITE-0006 | SITE-0001 | 5237.38 |
| SITE-0007 | SITE-0007 | SITE-0001 | 3257.93 |

**t_labrun_observed_at_site_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0003 | 263 |
| SITE-0002 | SITE-0001 | SITE-0007 | 199 |
| SITE-0003 | SITE-0002 | SITE-0003 | 302 |
| SITE-0004 | SITE-0002 | SITE-0007 | 29 |
| SITE-0005 | SITE-0003 | SITE-0003 | 93 |
| SITE-0006 | SITE-0003 | SITE-0007 | 209 |
| SITE-0007 | SITE-0004 | SITE-0003 | 703 |
| SITE-0008 | SITE-0004 | SITE-0007 | 313 |

**t_labrun_observed_at_site_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SITE-0001 | SITE-0001 | SITE-0004 | ingest-21 |
| SITE-0002 | SITE-0001 | SITE-0005 | Log Level 02 |
| SITE-0003 | SITE-0001 | SITE-0006 | closeout |
| SITE-0004 | SITE-0001 | SITE-0010 | failed |
| SITE-0005 | SITE-0001 | SITE-0011 | Triggered By 05 |
| SITE-0006 | SITE-0002 | SITE-0004 | gw-12 |
| SITE-0007 | SITE-0002 | SITE-0005 | Log Level 07 |
| SITE-0008 | SITE-0002 | SITE-0006 | initiation |