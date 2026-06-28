---
chapter_id: ch_live_ebpfprogram_union_kprobe_or_xdp_13cc57
topic_id: 183
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_union_kprobe_or_xdp', 'ontology_class_match', 'soc2_security_subclass']
model: engine-refine
---

Within enterprise metadata and compliance frameworks, every asset is anchored by a unique identifier that serves as the primary key for cross-referencing, auditing, and lineage tracking. Identifiers such as XDP-0001 through XDP-0004 for eBPF programs or SECU-0001 through SECU-0004 for SOC2 security subclass definitions provide deterministic handles that remain stable across schema evolution and system migrations. These identifiers are not merely labels; they form the connective tissue between disparate data domains—linking security posture records to their underlying technical implementations, binding ontology alignment assertions to the entities they describe, and enabling attribute-value pairs to be resolved unambiguously regardless of the storage backend. An identifier like MATC-0001, for instance, anchors a specific ontology matching assertion that can be traced back to its source entity, its confidence score, and its associated uncertainty metric, creating an auditable chain of evidence.

**fact_ontology**

| id | matches_ontology_class_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| MATC-0001 | MATC-0008 | 0.796 | 236.57 | 237.27 |
| MATC-0002 | MATC-0002 | 0.272 | 112.66 | 381.96 |
| MATC-0003 | MATC-0008 | 0.829 | 27.88 | 882.98 |
| MATC-0004 | MATC-0008 | 0.584 | 688.77 | 768.24 |
| MATC-0005 | MATC-0003 | 0.900 | 848.34 | 62.60 |
| MATC-0006 | MATC-0005 | 0.038 | 1.40 | 737.81 |
| MATC-0007 | MATC-0001 | 0.986 | 660.49 | 169.21 |
| MATC-0008 | MATC-0004 | 0.900 | 507.89 | 697.45 |

**t_soc2_security_subclass**

| id | soc | for_s_o_c2_domain |
| --- | --- | --- |
| SECU-0001 | SOC2-CloudInfra | Virtual Networks |
| SECU-0002 | SOC3-Public | Microservice Mesh |
| SECU-0003 | SOC2-Fintech | Database Clusters |
| SECU-0004 | SOC2-IdentityProvider | Microservice Mesh |
| SECU-0005 | SOC2-SaaS | Data Warehouses |
| SECU-0006 | SOC2-TypeII | Database Clusters |
| SECU-0007 | SOC2-SaaS | Database Clusters |

**t_soc2_security_subclass_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0004 | 5 |
| SECU-0002 | SECU-0001 | SECU-0005 | 926 |
| SECU-0003 | SECU-0002 | SECU-0004 | 1 |
| SECU-0004 | SECU-0002 | SECU-0005 | 849 |
| SECU-0005 | SECU-0003 | SECU-0004 | 2 |
| SECU-0006 | SECU-0003 | SECU-0005 | 409 |
| SECU-0007 | SECU-0004 | SECU-0004 | 5 |
| SECU-0008 | SECU-0004 | SECU-0005 | 551 |

Ontology matching introduces a layer of semantic governance where system artifacts are classified against known classes with quantified certainty. Each matching assertion carries a confidence score—ranging from 0.272 for a low-certainty alignment to 0.829 for a high-confidence match—that reflects the degree of algorithmic or manual assurance in the classification. This confidence is paired with an uncertainty value measured in absolute terms, such as 27.88 for a tightly constrained match or 688.77 for a highly ambiguous one, providing a complementary view of the match quality. Together, confidence and uncertainty form a dual-axis quality signal: a match with confidence 0.796 and uncertainty 236.57 suggests a reasonably reliable classification with moderate variance, while a match at confidence 0.272 and uncertainty 112.66 signals a weak alignment that warrants manual review. These metrics are essential for compliance workflows where the provenance of a classification determines downstream risk assessments and audit outcomes.

The classification of ontology matches is further structured through categories and labels that provide human-readable context for machine-generated assertions. Each ontology class carries a category designation—such as Matches Ontology Class Category 01 through 04—that groups related classifications into coherent domains, while corresponding labels like Matches Ontology Class Label 01 through 04 offer descriptive identifiers for reporting and dashboarding. This categorical layer enables aggregation and filtering at scale, allowing governance teams to query all matches within a given category, compare confidence distributions across categories, or enforce category-specific validation rules. The separation of category from label ensures that structural grouping and human-readable naming remain independently manageable, supporting both automated processing and stakeholder communication.

**dim_matches_ontology_class**

| id | matches_ontology_class_label | matches_ontology_class_category |
| --- | --- | --- |
| MATC-0001 | Matches Ontology Class Label 01 | Matches Ontology Class Category 01 |
| MATC-0002 | Matches Ontology Class Label 02 | Matches Ontology Class Category 02 |
| MATC-0003 | Matches Ontology Class Label 03 | Matches Ontology Class Category 03 |
| MATC-0004 | Matches Ontology Class Label 04 | Matches Ontology Class Category 04 |
| MATC-0005 | Matches Ontology Class Label 05 | Matches Ontology Class Category 05 |
| MATC-0006 | Matches Ontology Class Label 06 | Matches Ontology Class Category 06 |
| MATC-0007 | Matches Ontology Class Label 07 | Matches Ontology Class Category 07 |
| MATC-0008 | Matches Ontology Class Label 08 | Matches Ontology Class Category 08 |

Attribute modeling within the framework follows a typed entity-attribute-value paradigm that supports heterogeneous data without sacrificing type safety. Attributes such as effective_date, enforcement, mandatory, and priority are declared with explicit types—xsd:date, xsd:string, xsd:boolean, and xsd(integer)—ensuring that values are validated at ingestion and remain consistent across queries. Boolean attributes store truth values like true and false for enforcement flags, date attributes capture temporal boundaries such as 2023-08-15 or 2025-05-01 for policy effective dates, integer attributes hold numeric measures like 5 or 926 for priority scores, and varchar attributes accommodate free-form text including audit excerpts and encoding identifiers. This typed attribute system allows a single entity—say, a SOC2 security subclass record—to carry a rich set of properties across multiple value tables, each respecting its declared type while remaining addressable through the shared entity and attribute identifiers.

**t_soc2_security_subclass_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| SECU-0001 | effective_date | xsd:date |
| SECU-0002 | enforcement | xsd:string |
| SECU-0003 | mandatory | xsd:boolean |
| SECU-0004 | priority | xsd:integer |
| SECU-0005 | review_cycle_days | xsd:integer |
| SECU-0006 | scope | xsd:string |
| SECU-0007 | encoding | xsd:string |
| SECU-0008 | label_text | xsd:string |

**t_soc2_security_subclass_val_boolean**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0003 | true |
| SECU-0002 | SECU-0002 | SECU-0003 | false |
| SECU-0003 | SECU-0003 | SECU-0003 | true |
| SECU-0004 | SECU-0004 | SECU-0003 | false |
| SECU-0005 | SECU-0005 | SECU-0003 | false |
| SECU-0006 | SECU-0006 | SECU-0003 | false |
| SECU-0007 | SECU-0007 | SECU-0003 | false |

**t_soc2_security_subclass_val_date**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0001 | 2023-08-15 |
| SECU-0002 | SECU-0002 | SECU-0001 | 2024-04-12 |
| SECU-0003 | SECU-0003 | SECU-0001 | 2024-01-26 |
| SECU-0004 | SECU-0004 | SECU-0001 | 2025-05-01 |
| SECU-0005 | SECU-0005 | SECU-0001 | 2023-05-03 |
| SECU-0006 | SECU-0006 | SECU-0001 | 2025-05-11 |
| SECU-0007 | SECU-0007 | SECU-0001 | 2024-10-21 |

**t_soc2_security_subclass_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| SECU-0001 | SECU-0001 | SECU-0007 | Encoding 01 |
| SECU-0002 | SECU-0001 | SECU-0002 | Enforcement 02 |
| SECU-0003 | SECU-0001 | SECU-0008 | audit excerpt |
| SECU-0004 | SECU-0001 | SECU-0009 | de |
| SECU-0005 | SECU-0001 | SECU-0006 | Scope 05 |
| SECU-0006 | SECU-0002 | SECU-0007 | Encoding 06 |
| SECU-0007 | SECU-0002 | SECU-0002 | Enforcement 07 |
| SECU-0008 | SECU-0002 | SECU-0008 | audit excerpt |

Resource metadata complements the semantic and compliance layers with technical characteristics that inform storage, transfer, and processing decisions. The mimetype field distinguishes between serialization formats such as application/xml, application/parquet, application/octet-stream, and text/csv, enabling downstream systems to select appropriate parsers and validation pipelines. Size in bytes—ranging from 79,215,808 for a compact credential validation probe to over 757 million bytes for a network policy enforcer—provides capacity planning signals and cost estimation inputs for storage and compute resources. These technical attributes, combined with the semantic identifiers and ontology classifications, create a comprehensive metadata profile that supports both operational management and regulatory reporting within a unified data model.

**t_ebpfprogram_union_kprobe_or_xdp**

| id | ebpfprogram | ebpfprogram_2 | ebpfprogram_3 | mime_type | size_bytes |
| --- | --- | --- | --- | --- | --- |
| XDP-0001 | seccomp_profile_loader | ptrace_attach_monitor | tcp_state_monitor | application/xml | 613043965 |
| XDP-0002 | network_policy_enforcer | network_interface_stat | network_interface_stat | application/parquet | 757467115 |
| XDP-0003 | xdp_packet_dropper | memory_pressure_observer | perf_cpu_clock_sampler | application/octet-stream | 333629998 |
| XDP-0004 | credential_validation_probe | security_file_open_hook | tcp_state_monitor | text/csv | 79215808 |
| XDP-0005 | syscall_audit_filter | capability_change_hook | memory_pressure_observer | text/plain | 893084779 |