---
chapter_id: ch_live_tc_classifier_subclass_fb8abc
topic_id: 20
family: 07_long_tail
cited_terms: ['tc_classifier_subclass', 'metric_with_unit', 'subclass_to_information_content_entity']
model: engine-refine
---

In governed information systems, an **entity** denotes the durable object of record—the metric definition, classifier artifact, or information-content subclass whose lifecycle must be auditable across ingestion, publication, and retention. Each entity is bound to a stable **identifier** that survives renaming, reclassification, and version promotion; identifiers such as `UNIT-0001` for a throughput metric, `CLAS-0002` for a classifier fact, or `ENTI-0003` for a compliance-audit information subclass function as designative keys rather than display strings, permitting joins across attribute registries, value stores, and dimensional lookups without ambiguity when labels or locales change. The separation of identifier from human-facing text is not cosmetic: it underpins traceability when the same logical object is referenced from fact tables, EAV value partitions, and multilingual content mappings.

**t_metric_with_unit**

| id | metric | metric_unit |
| --- | --- | --- |
| UNIT-0001 | megabytes per second | records per second |
| UNIT-0002 | network bandwidth | megabytes per second |
| UNIT-0003 | degrees Celsius | megabytes per second |
| UNIT-0004 | hertz | hertz |
| UNIT-0005 | temperature | pressure |
| UNIT-0006 | megabytes per second | latency |

**Attr** names the governed property attached to an entity, while **attr type** constrains how that property may be asserted, validated, and serialized at the boundary between operational stores and semantic registries. A metric-with-unit entity may carry `checksum` and `license` as `xsd:string`, `created_date` as `xsd:date`, and `identifier` under `cco:DesignativeICE`—a class of designative identifier suited to ontological alignment—so that ingestion pipelines reject mistyped literals before they enter authoritative tables. Typed attribute definitions are the contract layer: they determine whether values land in date, integer, or varchar partitions and whether downstream compliance tooling can reason uniformly over checksums (`c0ffee42`), license terms (`GPL-3.0`), OID-style designators (`oid:1.3.6.1`), or regional deployment markers (`eu-west-3`). Where **misc** appears as a value column designation, it signals payload fields whose semantics are carried by the paired attr and attr type rather than by the column name alone—creation stamps such as `2023-09-28` and `2024-09-28` for `created_date`, or integer counters `97` and `477` bound to distinct attr keys, illustrate how heterogeneous observables share a uniform storage pattern without collapsing type discipline.

**dim_t_c_direction**

| id | t_c_direction_label | t_c_direction_category |
| --- | --- | --- |
| CLAS-0001 | T C Direction Label 01 | T C Direction Category 01 |
| CLAS-0002 | T C Direction Label 02 | T C Direction Category 02 |
| CLAS-0003 | T C Direction Label 03 | T C Direction Category 03 |
| CLAS-0004 | T C Direction Label 04 | T C Direction Category 04 |
| CLAS-0005 | T C Direction Label 05 | T C Direction Category 05 |
| CLAS-0006 | T C Direction Label 06 | T C Direction Category 06 |
| CLAS-0007 | T C Direction Label 07 | T C Direction Category 07 |

**t_metric_with_unit_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| UNIT-0001 | checksum | xsd:string |
| UNIT-0002 | created_date | xsd:date |
| UNIT-0003 | identifier | cco:DesignativeICE |
| UNIT-0004 | license | xsd:string |
| UNIT-0005 | mime_type | xsd:string |
| UNIT-0006 | size_bytes | xsd:long |
| UNIT-0007 | uri | xsd:string |
| UNIT-0008 | version | xsd:integer |

**t_metric_with_unit_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0002 | 2023-09-28 |
| UNIT-0002 | UNIT-0002 | UNIT-0002 | 2024-02-22 |
| UNIT-0003 | UNIT-0003 | UNIT-0002 | 2023-12-02 |
| UNIT-0004 | UNIT-0004 | UNIT-0002 | 2024-09-28 |
| UNIT-0005 | UNIT-0005 | UNIT-0002 | 2024-02-26 |
| UNIT-0006 | UNIT-0006 | UNIT-0002 | 2024-12-06 |

**t_metric_with_unit_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0006 | 97 |
| UNIT-0002 | UNIT-0001 | UNIT-0008 | 2 |
| UNIT-0003 | UNIT-0002 | UNIT-0006 | 477 |
| UNIT-0004 | UNIT-0002 | UNIT-0008 | 11 |
| UNIT-0005 | UNIT-0003 | UNIT-0006 | 499 |
| UNIT-0006 | UNIT-0003 | UNIT-0008 | 7 |
| UNIT-0007 | UNIT-0004 | UNIT-0006 | 214 |
| UNIT-0008 | UNIT-0004 | UNIT-0008 | 1 |

**t_metric_with_unit_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| UNIT-0001 | UNIT-0001 | UNIT-0001 | c0ffee42 |
| UNIT-0002 | UNIT-0001 | UNIT-0003 | oid:1.3.6.1 |
| UNIT-0003 | UNIT-0001 | UNIT-0004 | GPL-3.0 |
| UNIT-0004 | UNIT-0001 | UNIT-0009 | eu-west-3 |
| UNIT-0005 | UNIT-0001 | UNIT-0005 | application/parquet |
| UNIT-0006 | UNIT-0001 | UNIT-0010 | Name 06 |
| UNIT-0007 | UNIT-0001 | UNIT-0011 | data-engineering |
| UNIT-0008 | UNIT-0001 | UNIT-0012 | Tags 08 |

**Category** supplies the coarse stratification within a controlled vocabulary, distinct from free-form **labeltext** and from locale-specific presentation. In the T/C direction dimension, categories `T C Direction Category 01` through `T C Direction Category 04` sit alongside parallel labels `T C Direction Label 01`–`04`, allowing policy engines to route or filter on category while interfaces render the label. Classifier facts reference this dimension through **t_c_direction** keys: `CLAS-0001` and `CLAS-0004` both point to `CLAS-0001` in the direction dimension, whereas `CLAS-0002` resolves to `CLAS-0004` and `CLAS-0003` to `CLAS-0006`—a pattern that exposes orphan or drifted foreign keys when the dimension is curated independently of the fact load. Operators therefore treat t_c_direction not as decorative metadata but as a governance axis that classifies how classifier artifacts relate to transmission or transformation semantics, with mismatched keys surfacing as data-quality exceptions before versioned payloads are promoted.

**Size_bytes** quantifies the material footprint of a classifier record in the fact store—here on the order of six hundred to eight hundred megabytes per row (`643947353`, `883422563`, `772730446`, `623892633`)—and therefore anchors capacity planning, transfer-window scheduling, and integrity checks that correlate byte counts with checksum attributes on related entities. **Version**, recorded alongside those footprints as `2`, `1`, `1`, and `9` for the four classifier facts, denotes the revision generation of the stored artifact or its governing schema, not the human label; divergent versions under the same direction key compel explicit compatibility review because downstream consumers must know whether a classifier at version `9` supersedes or coexists with version `1` peers referenced from the same t_c_direction. Version and size_bytes together form the evidentiary pair auditors expect when demonstrating that a published classifier bundle matches the declared binary extent and revision lineage.

**Labeltext** and **language** govern how information-content subclasses are disclosed to people without altering the underlying information key. Subclass mappings pair machine-oriented information tokens—`schema_registry`, `telemetry_stream`, `compliance_audit`, `data_catalog_entry`—with labeltext such as `nightly summary`, `pre-release note`, `intake form`, and `change rationale`, each tagged `en`, `ja`, or `es` so that the same entity (`ENTI-0002`, `ENTI-0003`) may present distinct labeltext per locale while the identifier remains constant. This arrangement supports regulatory and operational documentation where the authoritative concept is language-neutral but the rendered caption must satisfy local readability requirements; missing language rows or labeltext collisions are detectable because entity identifiers do not absorb locale variance. In practice, identifier stability, typed attrs, categorical t_c_direction, byte-scaled facts, versioned classifiers, and localized labeltext interlock: entities are the subjects of policy, identifiers and attr types are the means of unambiguous reference, categories and t_c_direction supply controlled grouping, size_bytes and version supply measurable provenance, and labeltext with language supply accountable human interface—all of which must remain aligned for the corpus to function as a defensible compliance and operations reference rather than an ad hoc collection of strings.

**fact_classifier**

| id | t_c_direction_key | size_bytes | version |
| --- | --- | --- | --- |
| CLAS-0001 | CLAS-0001 | 643947353 | 2 |
| CLAS-0002 | CLAS-0004 | 883422563 | 1 |
| CLAS-0003 | CLAS-0001 | 772730446 | 1 |
| CLAS-0004 | CLAS-0006 | 623892633 | 9 |
| CLAS-0005 | CLAS-0002 | 61512113 | 4 |
| CLAS-0006 | CLAS-0007 | 798328963 | 5 |
| CLAS-0007 | CLAS-0002 | 968248258 | 9 |

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |