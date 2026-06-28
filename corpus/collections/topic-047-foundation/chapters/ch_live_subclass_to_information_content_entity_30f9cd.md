---
chapter_id: ch_live_subclass_to_information_content_entity_30f9cd
topic_id: 47
family: 01_foundation
cited_terms: ['subclass_to_information_content_entity', 'profiling_with_method', 'existential_with_has_part']
model: engine-refine
---

Operational profiling in governed data environments rests on the disciplined coupling of stable identifiers to the methods that are applied, the categories those methods inhabit, and the measurable outcomes each invocation produces. An applies method is not merely a named procedure but a dimensioned artifact—METH-0001 through METH-0004 in the reference corpus carry both a human-facing label (Applies Method Label 01–04) and a categorical placement that may diverge from the literal category string stored on the method row itself, as when METH-0002 and METH-0004 both resolve their category_id to METH-0001 while retaining distinct applies_method_category descriptors. That split between display taxonomy and foreign-key lineage is characteristic of compliance-oriented registries: the identifier remains the join key across fact and dimension, while category_name values such as Category Name 01–04 supply the coarse stratification auditors use when aggregating runs by control family. Profiling facts then attach to methods through applies_method_key, and the recurrence of METH-0007 on two separate fact rows demonstrates that a single method definition may be exercised repeatedly under different runtime signatures—duration_seconds of 1113.38 versus 2546.61, exit codes 809 and 348, retry counts 186 and 303—without ambiguity because each observation retains its own fact identifier.

**fact_profiling**

| id | applies_method_key | duration_seconds | exit_code | retry_count |
| --- | --- | --- | --- | --- |
| METH-0001 | METH-0001 | 6716.87 | 725 | 209 |
| METH-0002 | METH-0007 | 1113.38 | 809 | 186 |
| METH-0003 | METH-0007 | 2546.61 | 348 | 303 |
| METH-0004 | METH-0004 | 2074.93 | 827 | 264 |

**dim_applies_method_category**

| id | category_name |
| --- | --- |
| METH-0001 | Category Name 01 |
| METH-0002 | Category Name 02 |
| METH-0003 | Category Name 03 |
| METH-0004 | Category Name 04 |
| METH-0005 | Category Name 05 |
| METH-0006 | Category Name 06 |

Duration_seconds and exit together constitute the primary evidentiary pair for method effectiveness review. Elapsed time quantifies resource commitment and scheduling risk: a run consuming 6716.87 seconds differs materially from one completing in roughly one-third that interval, and such spreads inform capacity planning for batch governance workloads. Exit, recorded as a numeric exit_code rather than a boolean success flag, preserves the full semantics returned by the underlying executor; values 725, 809, 348, and 827 in the sample set are not interchangeable ordinals but distinct terminal states whose interpretation depends on the applies_method context. Retry_count elevates a single invocation into a reliability narrative: counts of 209, 186, 303, and 264 indicate that profiling pipelines in this domain are designed to tolerate transient faults and that governance reviewers must treat high retry volume as a leading indicator of upstream instability even when the final exit_code might suggest nominal completion. Together, duration, exit, and retry_count enable post-hoc reconstruction of what happened during a controlled application of policy or instrumentation.

Identifiers anchor the entire graph. ENTI-0001 through ENTI-0004 denote information-content entities whose information field classifies the artifact type—schema_registry, telemetry_stream, compliance_audit, data_catalog_entry—while labeltext (label_text in storage) supplies the prose surface auditors and operators actually read: nightly summary, pre-release note, intake form, change rationale. Language further partitions that surface for jurisdictional and audience requirements; the coexistence of en, ja, and es on sibling entities shows that the same logical content class may be rendered for multiple locales without collapsing identifiers. On the method side, METH-prefixed keys interoperate with PART-prefixed composition keys and category keys so that existential assemblies—BatchIngestionPipeline comprising FirewallRule, GlobalMetadataCatalog comprising StorageVolume, AuditLogArchive comprising WorkerProcess, CoreControlSubsystem comprising TemperatureProbe—can be related to the methods that profile or validate them. Identifier stability is therefore the precondition for traceability: a compliance_audit entity labeled as intake form in Japanese and a profiling fact tied to METH-0007 must remain joinable across revisions of labeltext or misc metadata.

**t_subclass_to_information_content_entity**

| id | information | label_text | language |
| --- | --- | --- | --- |
| ENTI-0001 | schema_registry | nightly summary | en |
| ENTI-0002 | telemetry_stream | pre-release note | ja |
| ENTI-0003 | compliance_audit | intake form | ja |
| ENTI-0004 | data_catalog_entry | change rationale | es |
| ENTI-0005 | model_weights | nightly summary | en |
| ENTI-0006 | deployment_manifest | pre-release note | en |

**t_existential_with_has_part**

| id | existential | has_part |
| --- | --- | --- |
| PART-0001 | BatchIngestionPipeline | FirewallRule |
| PART-0002 | GlobalMetadataCatalog | StorageVolume |
| PART-0003 | AuditLogArchive | WorkerProcess |
| PART-0004 | CoreControlSubsystem | TemperatureProbe |
| PART-0005 | ComputeNodePool | BackupSnapshot |
| PART-0006 | GlobalMetadataCatalog | ChecksumAlgorithm |

The misc dimension, realized in practice as applies_method_label and related descriptive fields not fully normalized into category tables, carries semantics that category alone cannot encode. Applies Method Label 03 may share Category Name 03 with other artifacts yet denote a distinct operational posture; misc fields absorb vendor-specific nomenclature, version notes, and procedural qualifiers that would overburden a rigid category_name column. In mature frameworks, misc is deliberately subordinate to identifier and category—informative for human review, never authoritative for aggregation—so that renaming Applies Method Label 02 does not fracture historical fact_profiling rows keyed by METH-0002. Reviewers treat misc as annotation layered atop the dimensional spine.

**dim_applies_method**

| id | applies_method_label | applies_method_category | category_id |
| --- | --- | --- | --- |
| METH-0001 | Applies Method Label 01 | Applies Method Category 01 | METH-0006 |
| METH-0002 | Applies Method Label 02 | Applies Method Category 02 | METH-0001 |
| METH-0003 | Applies Method Label 03 | Applies Method Category 03 | METH-0003 |
| METH-0004 | Applies Method Label 04 | Applies Method Category 04 | METH-0001 |
| METH-0005 | Applies Method Label 05 | Applies Method Category 05 | METH-0002 |
| METH-0006 | Applies Method Label 06 | Applies Method Category 06 | METH-0001 |
| METH-0007 | Applies Method Label 07 | Applies Method Category 07 | METH-0001 |

Category and applies_method interact to define the scope of what is being measured. Category Name 01–04 provide the outward-facing taxonomy aligned to control domains or pipeline stages, while applies_method_category strings offer a parallel, sometimes redundant, labeling path suited to integration with legacy catalogs. When two methods share a category_id pointer to METH-0001, rollup reports at the category grain merge their profiling statistics even though their exit_code distributions and retry_count profiles may diverge sharply. That many-to-one relationship is intentional: governance metrics are often evaluated at the control-category level for executive reporting, then decomposed to individual applies_method keys for root-cause analysis. A spike in exit_code 827 associated with METH-0004 thus triggers inspection of Applies Method Category 04 and its Category Name 04 membership before engineers descend to duration_seconds and per-run retry behavior.

In operational practice, these elements form a closed evidentiary loop from content declaration through method application to measured outcome. Information-content entities declare what is being governed and in which language and labeltext form stakeholders encounter it; existential-has_part relations specify which infrastructural constituents participate in BatchIngestionPipeline-class workloads; applies_method and category dimensions specify which validated procedures apply; and fact_profiling rows capture duration_seconds, exit, and retry_count as the immutable record of execution. An auditor reconciling a pre-release note in Spanish against a long-running profile with elevated retries does not read columns—they read a chain: ENTI-0004’s change rationale, the method key invoked, the category under which that method is registered, and the terminal exit and timing evidence that either substantiates or undermines the release control. That is why identifier integrity, categorical discipline, localized labeltext, misc annotation, and quantitative profiling fields are maintained as separate concerns within a single framework: each answers a different question, and only their joint retention satisfies the burden of proof that compliance-oriented operations impose.