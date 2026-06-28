---
chapter_id: ch_live_kernelhook_observes_event_class_50d7f0
topic_id: 155
family: 04_ebpf_kernel
cited_terms: ['kernelhook_observes_event_class', 'material_density_specification', 'lineage_governed_by_directive']
model: engine-refine
---

In governed technical systems, stable identifiers anchor every assertion that must survive audit, reconciliation, and cross-domain linkage. An identifier is not merely a surrogate key but a durable handle that permits the same real-world object to be referenced consistently across observation registries, specification catalogs, and lineage directives without collapsing distinct records into one another. Event-class registrations such as EVEN-0001 through EVEN-0004, material-density records keyed as SPEC-0001 through SPEC-0004, and directive bindings labeled DIRE-0001 through DIRE-0004 exemplify this practice: each code names a distinct governed artifact whose meaning persists even when descriptive text, deployment context, or measured values change over time.

The entity is the subject to which attributes attach; it is the ontological center of a fact. In material-density governance, the entity is the specification itself—Monocrystalline Silicon, 316 Stainless Steel, High-Density Polyethylene, Aerogel Composite—while attribute definitions declare what may legally be said about that entity and in what form. Separating entity identity from attribute identity is what allows one specification to accumulate heterogeneous measurements, metadata, and provenance without denormalizing the catalog into a wide, brittle table. Confidence scores, dimensional classifications, measurement methods, and temporal stamps are not interchangeable fields; they are distinct claims whose validity depends on knowing precisely which entity they describe and which attribute slot they occupy.

Attribute name and attribute type jointly constitute the contract under which values may enter the system. The attr dimension names the semantic role—confidence, dimension_kind, method, recorded_at—while attr_type fixes the interpretive grammar, here expressed through XSD-aligned types such as xsd:decimal, xsd:string, and xsd:dateTime. That pairing matters because compliance is enforced at the boundary of ingestion: a decimal confidence of 0.346 or 0.826 is not admissible in a string-typed slot, and a recorded_at value such as 2023-09-01T16:18:03 or 2025-05-04T17:35:25 must remain machine-comparable across revisions. Typed value stores partitioned by representation—decimal magnitudes including 525.66 and 299.45, varchar literals such as Dimension Kind 01 and change rationale, datetime instants stamped at acquisition—implement this contract in practice rather than in policy alone.

Materialdensityspecification names the governed material record whose density-related assertions the framework is designed to curate. It is the canonical entity label in this domain: the specification row identifies what substance or composite is being characterized, while satellite attribute rows and typed value rows supply the evidentiary payload. The architecture treats the specification as a long-lived identity and treats individual measurements, encodings, rationales, and locale markers as versionable claims bound to that identity through entity_id and attr_id references. This separation is why a single entity such as SPEC-0001 can simultaneously carry a confidence reading, a dimensional kind, an encoding label, a change rationale, and a language tag without conflating measurement with metadata or conflating metadata with provenance.

Location, unit, and language situate otherwise abstract identifiers inside operational and interpretive frames that auditors and downstream consumers cannot ignore. Location records where observation or enforcement occurs—ap-south-2, us-east-1, zone-b—so that identically named event feeds or kernel hooks are not mistaken for fungible deployments when residency, latency, or jurisdictional scope differ. Unit declares the dimensional semantics under which a lineage is governed: milliseconds for model-training registries, meters per second for patient cohort datasets and sensor telemetry streams, or dimensionless count for event cardinality. Language—ja, de, en—signals the linguistic jurisdiction of a directive or annotation, ensuring that strings such as the ja value attached to a specification or the de-governed patient cohort lineage are interpreted under the correct lexical and regulatory context rather than as opaque text.

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | Model Training Registry | ms | ja |
| DIRE-0002 | Patient Cohort Dataset | m/s | de |
| DIRE-0003 | Sensor Telemetry Stream | count | en |
| DIRE-0004 | Patient Cohort Dataset | m/s | en |
| DIRE-0005 | API Request Trace | ratio | es |
| DIRE-0006 | Laboratory Batch Records | nm | de |
| DIRE-0007 | Patient Cohort Dataset | kg | en |
| DIRE-0008 | Inventory Sync Job | nm | ja |

The misc designation absorbs values that are necessary to operations yet resist a single global type or role assignment within the schema vocabulary. Stream names like probe_capture_main and event_feed_prod, free-text rationales, encoding labels, and raw measured literals all appear as misc because their compliance significance is contextual: a name disambiguates production from audit pathways, a rationale documents why a value changed, and a varchar payload may denote an encoding scheme rather than a physical constant. In aggregate, identifier, entity, attr, attr_type, materialdensityspecification, location, unit, language, and misc form a layered governance grammar—identity first, typed assertion second, situational binding third—through which heterogeneous evidence can be stored, validated, and traced without sacrificing the precision that audit and cross-system integration require.

**t_kernelhook_observes_event_class**

| id | kernelhook | observes_event | location | name |
| --- | --- | --- | --- | --- |
| EVEN-0001 | perf-monitor | disk-io | ap-south-2 | probe_capture_main |
| EVEN-0002 | syscall-hook | net-packet-capture | us-east-1 | audit_log_stream |
| EVEN-0003 | kernel-watcher | net-packet-capture | zone-b | net_watch_stream |
| EVEN-0004 | telemetry-daemon | thread-schedule | us-east-1 | event_feed_prod |
| EVEN-0005 | ebpf-probe | thread-schedule | on-prem-dc1 | probe_capture_main |

**t_material_density_specification**

| id | material_density_specification |
| --- | --- |
| SPEC-0001 | Monocrystalline Silicon |
| SPEC-0002 | 316 Stainless Steel |
| SPEC-0003 | High-Density Polyethylene |
| SPEC-0004 | Aerogel Composite |
| SPEC-0005 | Titanium Grade 5 |
| SPEC-0006 | Polyethylene Terephthalate |
| SPEC-0007 | CFRP |
| SPEC-0008 | Aerospace Grade Aluminum |

**t_material_density_specification_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SPEC-0001 | confidence | xsd:decimal |
| SPEC-0002 | dimension_kind | xsd:string |
| SPEC-0003 | method | xsd:string |
| SPEC-0004 | recorded_at | xsd:dateTime |
| SPEC-0005 | uncertainty | xsd:decimal |
| SPEC-0006 | unit | xsd:string |
| SPEC-0007 | value | xsd:decimal |
| SPEC-0008 | encoding | xsd:string |

**t_material_density_specification_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0004 | 2023-09-01T16:18:03 |
| SPEC-0002 | SPEC-0002 | SPEC-0004 | 2024-08-02T02:03:27 |
| SPEC-0003 | SPEC-0003 | SPEC-0004 | 2024-12-26T11:45:06 |
| SPEC-0004 | SPEC-0004 | SPEC-0004 | 2025-05-04T17:35:25 |
| SPEC-0005 | SPEC-0005 | SPEC-0004 | 2024-11-11T19:06:53 |
| SPEC-0006 | SPEC-0006 | SPEC-0004 | 2024-02-29T08:13:20 |
| SPEC-0007 | SPEC-0007 | SPEC-0004 | 2023-02-28T18:42:10 |
| SPEC-0008 | SPEC-0008 | SPEC-0004 | 2023-07-14T09:35:28 |

**t_material_density_specification_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0001 | 0.346 |
| SPEC-0002 | SPEC-0001 | SPEC-0005 | 525.66 |
| SPEC-0003 | SPEC-0001 | SPEC-0007 | 299.45 |
| SPEC-0004 | SPEC-0002 | SPEC-0001 | 0.826 |
| SPEC-0005 | SPEC-0002 | SPEC-0005 | 839.98 |
| SPEC-0006 | SPEC-0002 | SPEC-0007 | 704.76 |
| SPEC-0007 | SPEC-0003 | SPEC-0001 | 0.814 |
| SPEC-0008 | SPEC-0003 | SPEC-0005 | 216.55 |

**t_material_density_specification_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SPEC-0001 | SPEC-0001 | SPEC-0002 | Dimension Kind 01 |
| SPEC-0002 | SPEC-0001 | SPEC-0008 | Encoding 02 |
| SPEC-0003 | SPEC-0001 | SPEC-0009 | change rationale |
| SPEC-0004 | SPEC-0001 | SPEC-0010 | ja |
| SPEC-0005 | SPEC-0001 | SPEC-0003 | automated |
| SPEC-0006 | SPEC-0001 | SPEC-0006 | m/s |
| SPEC-0007 | SPEC-0002 | SPEC-0002 | Dimension Kind 07 |
| SPEC-0008 | SPEC-0002 | SPEC-0008 | Encoding 08 |