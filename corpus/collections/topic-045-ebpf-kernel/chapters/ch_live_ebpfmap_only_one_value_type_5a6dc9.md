---
chapter_id: ch_live_ebpfmap_only_one_value_type_5a6dc9
topic_id: 45
family: 04_ebpf_kernel
cited_terms: ['ebpfmap_only_one_value_type', 'lineage_governed_by_directive', 'identifier_uniquely_identifies']
model: engine-refine
---

Governed information assets require a stable identifier that survives renaming, replication, and cross-system federation. Persistent schemes—`doi:10.1145/3641519` for scholarly provenance, `urn:isbn:9780131103627` for bibliographic binding, `orcid:0000-0002-1825-0097` for contributor attribution—establish referential integrity across registries whose internal surrogate keys (`IDEN-0001` through `IDEN-0004`, `TYPE-0001` through `TYPE-0004`) serve operational joins but do not themselves confer global uniqueness. The same identifier may legitimately identify distinct governed objects when scope differs: one DOI anchors a provenance node root while an identical DOI elsewhere identifies a data pipeline stage 3, demonstrating that resolution semantics depend on namespace context and governance lineage rather than lexical equality alone. Issuance date (`issued_date`) supplies temporal authority—records stamped 2024-09-07, 2024-01-30, 2023-03-13, and 2023-03-01 establish when an identifier entered the compliance perimeter, enabling retention schedules, audit replay, and precedence rules when superseding registrations collide.

**t_identifier_uniquely_identifies**

| id | identifier | identifies | format | issued_date |
| --- | --- | --- | --- | --- |
| IDEN-0001 | doi:10.1145/3641519 | provenance node root | JSON | 2024-09-07 |
| IDEN-0002 | urn:isbn:9780131103627 | data pipeline stage 3 | E.164 | 2023-03-13 |
| IDEN-0003 | doi:10.1145/3641519 | container image sha256 | CSV | 2024-01-30 |
| IDEN-0004 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | JSON | 2023-03-01 |
| IDEN-0005 | pmid:12345678 | metadata registry entry | E.164 | 2025-03-08 |
| IDEN-0006 | doi:10.1016/j.softx.2020.100312 | metadata registry entry | ISO-8601 | 2025-05-18 |
| IDEN-0007 | orcid:0000-0002-1825-0097 | data pipeline stage 3 | RFC-3339 | 2024-09-01 |

Format declares the syntactic and semantic contract under which an identified artifact may be interpreted, validated, or transformed. JSON governs structured interchange for pipeline-stage and container-image attestations; CSV constrains tabular exports subject to delimiter and header conventions; E.164 normalizes telephony-related identifiers to an internationally recognized digit grammar independent of locale presentation. Format is not decorative metadata: it determines which parsers, schema validators, and integrity checks apply at ingestion, and mismatches between declared format and payload constitute a first-class compliance failure rather than a recoverable warning. Where format intersects identifier registries, the pairing defines an auditable tuple—what was registered, in what encoding, and under which parsing rules downstream consumers must operate.

Category and its companion descriptive miscellany partition the metadata plane into human-navigable taxonomies without collapsing technical precision. Value type map categories (`Value Type Map Category 01` through `Value Type Map Category 04`) classify typing artifacts for policy routing—retention class, access tier, or validation profile—while parallel labels (`Value Type Map Label 01` through `Value Type Map Label 04`) furnish operator-facing nomenclature that may evolve without re-keying stable identifiers. Category thus mediates between machine-enforceable rules and organizational vocabulary; misc fields absorb label text, display aliases, and ancillary annotations that would otherwise pollute canonical keys. In eBPF map fact records, repeated association of distinct identifiers (`TYPE-0001`, `TYPE-0003`, `TYPE-0004`) with a shared type map key (`TYPE-0002`) illustrates how category-level typing propagates: several concrete assets inherit a common value-type contract, reducing schema drift while preserving per-asset identity.

**dim_value_type_map**

| id | value_type_map_label | value_type_map_category |
| --- | --- | --- |
| TYPE-0001 | Value Type Map Label 01 | Value Type Map Category 01 |
| TYPE-0002 | Value Type Map Label 02 | Value Type Map Category 02 |
| TYPE-0003 | Value Type Map Label 03 | Value Type Map Category 03 |
| TYPE-0004 | Value Type Map Label 04 | Value Type Map Category 04 |
| TYPE-0005 | Value Type Map Label 05 | Value Type Map Category 05 |
| TYPE-0006 | Value Type Map Label 06 | Value Type Map Category 06 |

Type map, version, and size_bytes jointly characterize the physical and evolutionary state of governed binary or structural artifacts. The type map key binds each fact row to a dimensional definition of permissible value shapes—three entries referencing `TYPE-0002` and one referencing `TYPE-0003` show deliberate concentration of typing semantics alongside deliberate divergence where `TYPE-0004` requires a distinct map. Version integers (3, 6, 12, 5) record generational change independent of byte length, permitting compliance officers to mandate minimum supported revisions without conflating content refresh with footprint growth. Size in bytes (208979093, 156714508, 31105012, 354373995) quantifies storage liability, transfer cost, and backup scope; thresholds derived from byte counts trigger archival tiering, replication approval, and capacity attestations within operational guides. Together, type map pins interpretability, version pins temporal compatibility, and size_bytes pins infrastructural obligation.

**fact_ebpfmap**

| id | value_type_map_key | size_bytes | version |
| --- | --- | --- | --- |
| TYPE-0001 | TYPE-0002 | 208979093 | 3 |
| TYPE-0002 | TYPE-0002 | 156714508 | 6 |
| TYPE-0003 | TYPE-0002 | 31105012 | 12 |
| TYPE-0004 | TYPE-0003 | 354373995 | 5 |
| TYPE-0005 | TYPE-0002 | 866267293 | 2 |

Lineage-directed governance extends these primitives into domain-specific measurement and localization semantics. Directives keyed `DIRE-0001` through `DIRE-0004` attach unit (`ms`, `m/s`, `count`) to lineage descriptors such as Model Training Registry, Patient Cohort Dataset, and Sensor Telemetry Stream, ensuring that aggregated metrics remain dimensionally lawful and that cross-dataset joins do not silently commingle milliseconds with meters per second. Language codes (`ja`, `de`, `en`) govern locale of record—Japanese and German entries alongside English cohort metadata signal that provenance documentation, consent artifacts, or field labels may be jurisdictionally localized even when underlying identifiers remain language-neutral. Where Patient Cohort Dataset appears twice under distinct directive keys, unit and language diverge (`m/s` with `en` versus `count` with `en`), evidencing that lineage is not a singleton label but a governed binding whose unit and language qualifiers disambiguate otherwise homonymous asset classes.

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

Operational practice treats these attributes as an interlocking evidence chain rather than isolated columns. Registration begins with identifier issuance and format declaration; classification via category and misc follows; structural conformance is asserted through type map and version; infrastructural impact is recorded in size_bytes; and lineage tables complete the chain with unit and language constraints that downstream analytics and compliance reporting must honor. Auditors reconstruct intent by traversing surrogate keys to persistent identifiers, confirming that issuance dates precede dependent processing, that version floors are met before promotion, and that dimensional units align with directive lineage. Failure at any link—duplicate DOI without scoped resolution, format misdeclaration, obsolete version, or unit mismatch—propagates as a governance defect whose remediation is traceable precisely because each attribute occupies a distinct role in the control framework.