---
chapter_id: ch_live_apolitical_islam_9e0387
topic_id: 12
family: 08_derived
cited_terms: ['apolitical_islam', 'classification_under_taxonomy', 'ebpfprogram_basic']
model: engine-refine
---

The governance of religious doctrine within state apparatuses demands precise ontological separation between theological posture and political orientation. Records such as ISLA-0001 through ISLA-0004 capture this distinction by pairing an apolitical model—Turkish Diyanet model or Iranian Hawza quietism—with its corresponding doctrinal narrative, whether Hadith preservation focus, Ascetic withdrawal practice, or Worldly detachment concept, and then contrasting these against a political Islam stance, ranging from Theocratic state proposal and Militant jihadism to Political enjoinment doctrine and Islamist governance theory. This tripartite structure ensures that each entity carries both its normative theological position and the political ideology it explicitly opposes or transcends. Attributes attached to these records, identified by identifiers such as ISLA-0001 through ISLA-0003, carry typed metadata—encoding, label_text, and language—each declared as xsd:string, with concrete values like Encoding 01, change rationale, and fr anchoring the abstract classification in operational detail. The entity-attribute-value pattern, where entity_id ISLA-0001 references attr_id ISLA-0001 through ISLA-0003, enforces referential integrity across the attribute store while permitting heterogeneous value types to be stored in dedicated type-specific tables.

**t_apolitical_islam**

| id | apolitical_islam | doctrinal_narrative | political_islam_stance |
| --- | --- | --- | --- |
| ISLA-0001 | Turkish Diyanet model | Hadith preservation focus | Theocratic state proposal |
| ISLA-0002 | Turkish Diyanet model | Ascetic withdrawal practice | Militant jihadism |
| ISLA-0003 | Turkish Diyanet model | Hadith preservation focus | Political enjoinment doctrine |
| ISLA-0004 | Iranian Hawza quietism | Worldly detachment concept | Islamist governance theory |
| ISLA-0005 | Sunni quietism | Hadith preservation focus | Theocratic state proposal |
| ISLA-0006 | Ahl-e Hadith | Community stability tenet | Islamist constitutionalism |
| ISLA-0007 | Deobandi quietism | Taqlid adherence tradition | Revolutionary vanguard model |

**t_apolitical_islam_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| ISLA-0001 | encoding | xsd:string |
| ISLA-0002 | label_text | xsd:string |
| ISLA-0003 | language | xsd:string |

**t_apolitical_islam_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| ISLA-0001 | ISLA-0001 | ISLA-0001 | Encoding 01 |
| ISLA-0002 | ISLA-0001 | ISLA-0002 | change rationale |
| ISLA-0003 | ISLA-0001 | ISLA-0003 | fr |
| ISLA-0004 | ISLA-0002 | ISLA-0001 | Encoding 04 |
| ISLA-0005 | ISLA-0002 | ISLA-0002 | audit excerpt |
| ISLA-0006 | ISLA-0002 | ISLA-0003 | fr |
| ISLA-0007 | ISLA-0003 | ISLA-0001 | Encoding 07 |
| ISLA-0008 | ISLA-0003 | ISLA-0002 | pre-release note |

Taxonomy-based classification operates under an analogous but distinct architecture, where each classification entry—Lab Sample Category, Anomaly Detection Model, Experiment Phase Code, Telemetry Stream Type—is anchored to an external standard such as the EDAM Ontology, DQO Framework, LOINC Code Set, or SAREK Pipeline. The classification identifiers TAXO-0001 through TAXO-0004 serve as the primary key, while the under_taxonomy column records the governing standard, establishing a lineage of authority that traces every local classification back to its canonical source. Attributes defined for these classifications—duration_seconds, end_time, exit_code, host_name—carry heterogeneous XSD types including xsd:decimal, xsd:dateTime, xsd:integer, and xsd:string, and their values are distributed across five type-specific value tables. A single entity such as TAXO-0001 may simultaneously carry a decimal value of 4845.29 on attribute TAXO-0001, a datetime value of 2024-03-16T10:40:44 on attribute TAXO-0002, an integer value of 123 on attribute TAXO-0003, and a varchar value of worker-07 on attribute TAXO-0004, demonstrating how the schema accommodates multi-typed metadata without sacrificing type safety.

**t_classification_under_taxonomy**

| id | classification | under_taxonomy |
| --- | --- | --- |
| TAXO-0001 | Lab Sample Category | EDAM Ontology |
| TAXO-0002 | Anomaly Detection Model | DQO Framework |
| TAXO-0003 | Experiment Phase Code | LOINC Code Set |
| TAXO-0004 | Telemetry Stream Type | SAREK Pipeline |
| TAXO-0005 | Compliance Framework Set | ENVO Biological |
| TAXO-0006 | Experiment Phase Code | PROMISE Metrics |
| TAXO-0007 | Metadata Schema Version | SAREK Pipeline |
| TAXO-0008 | Experiment Phase Code | OMOP CDM |

**t_classification_under_taxonomy_attr**

| id | attr_name | attr_type |
| --- | --- | --- |
| TAXO-0001 | duration_seconds | xsd:decimal |
| TAXO-0002 | end_time | xsd:dateTime |
| TAXO-0003 | exit_code | xsd:integer |
| TAXO-0004 | host_name | xsd:string |
| TAXO-0005 | log_level | xsd:string |
| TAXO-0006 | phase | xsd:string |
| TAXO-0007 | retry_count | xsd:integer |
| TAXO-0008 | scheduled_at | xsd:dateTime |

**t_classification_under_taxonomy_val_datetime**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0002 | 2024-03-16T10:40:44 |
| TAXO-0002 | TAXO-0001 | TAXO-0008 | 2023-03-15T13:57:05 |
| TAXO-0003 | TAXO-0001 | TAXO-0009 | 2024-10-13T12:06:31 |
| TAXO-0004 | TAXO-0002 | TAXO-0002 | 2023-01-11T10:30:50 |
| TAXO-0005 | TAXO-0002 | TAXO-0008 | 2025-05-19T08:08:31 |
| TAXO-0006 | TAXO-0002 | TAXO-0009 | 2025-04-05T18:33:08 |
| TAXO-0007 | TAXO-0003 | TAXO-0002 | 2024-01-05T08:57:44 |
| TAXO-0008 | TAXO-0003 | TAXO-0008 | 2024-10-15T05:44:13 |

**t_classification_under_taxonomy_val_decimal**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0001 | 4845.29 |
| TAXO-0002 | TAXO-0002 | TAXO-0001 | 4012.23 |
| TAXO-0003 | TAXO-0003 | TAXO-0001 | 5805.70 |
| TAXO-0004 | TAXO-0004 | TAXO-0001 | 852.80 |
| TAXO-0005 | TAXO-0005 | TAXO-0001 | 5949.40 |
| TAXO-0006 | TAXO-0006 | TAXO-0001 | 1054.63 |
| TAXO-0007 | TAXO-0007 | TAXO-0001 | 5765.70 |
| TAXO-0008 | TAXO-0008 | TAXO-0001 | 2142.87 |

**t_classification_under_taxonomy_val_int**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0003 | 123 |
| TAXO-0002 | TAXO-0001 | TAXO-0007 | 306 |
| TAXO-0003 | TAXO-0002 | TAXO-0003 | 682 |
| TAXO-0004 | TAXO-0002 | TAXO-0007 | 349 |
| TAXO-0005 | TAXO-0003 | TAXO-0003 | 409 |
| TAXO-0006 | TAXO-0003 | TAXO-0007 | 189 |
| TAXO-0007 | TAXO-0004 | TAXO-0003 | 329 |
| TAXO-0008 | TAXO-0004 | TAXO-0007 | 345 |

**t_classification_under_taxonomy_val_varchar**

| id | entity_id | attr_id | value |
| --- | --- | --- | --- |
| TAXO-0001 | TAXO-0001 | TAXO-0004 | worker-07 |
| TAXO-0002 | TAXO-0001 | TAXO-0005 | Log Level 02 |
| TAXO-0003 | TAXO-0001 | TAXO-0006 | initiation |
| TAXO-0004 | TAXO-0001 | TAXO-0010 | superseded |
| TAXO-0005 | TAXO-0001 | TAXO-0011 | Triggered By 05 |
| TAXO-0006 | TAXO-0002 | TAXO-0004 | ingest-21 |
| TAXO-0007 | TAXO-0002 | TAXO-0005 | Log Level 07 |
| TAXO-0008 | TAXO-0002 | TAXO-0006 | review |

**dim_ebpfprogram**

| id | ebpfprogram_label | ebpfprogram_category |
| --- | --- | --- |
| EBPF-0001 | Ebpfprogram Label 01 | Ebpfprogram Category 01 |
| EBPF-0002 | Ebpfprogram Label 02 | Ebpfprogram Category 02 |
| EBPF-0003 | Ebpfprogram Label 03 | Ebpfprogram Category 03 |
| EBPF-0004 | Ebpfprogram Label 04 | Ebpfprogram Category 04 |
| EBPF-0005 | Ebpfprogram Label 05 | Ebpfprogram Category 05 |
| EBPF-0006 | Ebpfprogram Label 06 | Ebpfprogram Category 06 |
| EBPF-0007 | Ebpfprogram Label 07 | Ebpfprogram Category 07 |
| EBPF-0008 | Ebpfprogram Label 08 | Ebpfprogram Category 08 |

The eBPF program registry employs a star-schema design that separates dimensional metadata from quantitative facts. The dimension table dim_ebpfprogram assigns each program a human-readable label—Ebpfprogram Label 01 through Ebpfprogram Label 04—and a categorical classification—Ebpfprogram Category 01 through Ebpfprogram Category 04—while the fact table fact_ebpfprogram records the program's binary size in bytes, ranging from 113,209,263 for EBPF-0003 to 784,335,640 for EBPF-0001, alongside its version number, which spans versions 9 through 12. The ebpfprogram_key column in the fact table, taking values such as EBPF-0001, EBPF-0003, and EBPF-0005, provides the foreign-key linkage to the dimension table's primary key, enabling aggregation of size and version data by category or label. This separation permits the dimension to evolve independently—labels may be localized, categories restructured—while the fact table preserves immutable measurements suitable for time-series analysis and capacity planning.

**fact_ebpfprogram**

| id | ebpfprogram_key | size_bytes | version |
| --- | --- | --- | --- |
| EBPF-0001 | EBPF-0001 | 784335640 | 12 |
| EBPF-0002 | EBPF-0003 | 641704069 | 9 |
| EBPF-0003 | EBPF-0003 | 113209263 | 11 |
| EBPF-0004 | EBPF-0005 | 161013093 | 12 |
| EBPF-0005 | EBPF-0004 | 352203820 | 12 |
| EBPF-0006 | EBPF-0003 | 167519051 | 1 |

Across all three domains, the schema enforces a consistent pattern: a primary entity table carries the core descriptive attributes, an attribute definition table declares the names and types of supplementary metadata, and type-specific value tables store the actual values with entity_id and attr_id columns providing the dual foreign-key reference that binds values to both their entity and their attribute definition. This design avoids the pitfalls of wide tables with nullable columns while preserving the ability to query heterogeneous metadata through UNION ALL operations or application-level type dispatch. The use of ISO-compliant XSD types in the attribute definition tables ensures that validation can occur at the schema level, and the separation of value storage by type—varchar, datetime, decimal, integer—eliminates the need for runtime type coercion during query execution.