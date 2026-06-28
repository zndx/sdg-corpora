---
chapter_id: ch_live_ebpfprogram_equiv_typed_with_hook_e9d146
topic_id: 79
family: 04_ebpf_kernel
cited_terms: ['ebpfprogram_equiv_typed_with_hook', 'column_lineage_for_compliance_claim', 'young_adult_speaker_role']
model: engine-refine
---

The governance of eBPF program artifacts rests upon a structured taxonomy that distinguishes between the program's functional classification and its attachment semantics. Each program instance is identified by a unique key such as HOOK-0001 or HOOK-0003 and is classified according to a program type drawn from a controlled vocabulary—values including HOOK-0007, HOOK-0006, HOOK-0005, and HOOK-0001 map to descriptive labels like Program Type Label 01 through Program Type Label 04, each further organized into categorical groupings such as Program Type Category 01 through Program Type Category 04. The attachment behavior of a program is independently classified: programs attach to hooks identified by keys such as HOOK-0006 or HOOK-0001, which resolve to labels including Attaches To Hook Label 01 through Attaches To Hook Label 04 and their corresponding categories. This separation of concerns ensures that the program's identity, its functional type, and its hook attachment point are each independently governed and auditable. The physical footprint of these programs varies substantially—recorded sizes range from 113,209,263 bytes for program HOOK-0003 to 784,335,640 bytes for program HOOK-0001—while version assignments cluster around 9, 11, and 12, indicating a managed release cadence across the artifact population.

**fact_ebpfprogram**

| id | program_type_key | attaches_to_hook_key | size_bytes | version |
| --- | --- | --- | --- | --- |
| HOOK-0001 | HOOK-0007 | HOOK-0006 | 784335640 | 12 |
| HOOK-0002 | HOOK-0006 | HOOK-0006 | 641704069 | 9 |
| HOOK-0003 | HOOK-0005 | HOOK-0001 | 113209263 | 11 |
| HOOK-0004 | HOOK-0001 | HOOK-0002 | 161013093 | 12 |
| HOOK-0005 | HOOK-0003 | HOOK-0002 | 352203820 | 12 |
| HOOK-0006 | HOOK-0007 | HOOK-0006 | 167519051 | 1 |

**dim_program_type**

| id | program_type_label | program_type_category |
| --- | --- | --- |
| HOOK-0001 | Program Type Label 01 | Program Type Category 01 |
| HOOK-0002 | Program Type Label 02 | Program Type Category 02 |
| HOOK-0003 | Program Type Label 03 | Program Type Category 03 |
| HOOK-0004 | Program Type Label 04 | Program Type Category 04 |
| HOOK-0005 | Program Type Label 05 | Program Type Category 05 |
| HOOK-0006 | Program Type Label 06 | Program Type Category 06 |
| HOOK-0007 | Program Type Label 07 | Program Type Category 07 |
| HOOK-0008 | Program Type Label 08 | Program Type Category 08 |

**dim_attaches_to_hook**

| id | attaches_to_hook_label | attaches_to_hook_category |
| --- | --- | --- |
| HOOK-0001 | Attaches To Hook Label 01 | Attaches To Hook Category 01 |
| HOOK-0002 | Attaches To Hook Label 02 | Attaches To Hook Category 02 |
| HOOK-0003 | Attaches To Hook Label 03 | Attaches To Hook Category 03 |
| HOOK-0004 | Attaches To Hook Label 04 | Attaches To Hook Category 04 |
| HOOK-0005 | Attaches To Hook Label 05 | Attaches To Hook Category 05 |
| HOOK-0006 | Attaches To Hook Label 06 | Attaches To Hook Category 06 |

Column-level measurement facts are anchored to a parallel dimensional structure that provides semantic context for each observed value. A column fact carries an identifier such as CLAI-0001 or CLAI-0004 and references a column through a foreign key—CLAI-0005, CLAI-0006, CLAI-0004, or CLAI-0001—that resolves to a column label (Column Label 01 through Column Label 04) and a column category (Column Category 01 through Column Category 04). The factual record captures three quantitative attributes: the measured value, which spans from 131.27 to 571.55; a confidence metric, ranging from 0.068 to 0.354; and an uncertainty estimate, which extends from 404.01 to 984.09. The inverse relationship between confidence and uncertainty is evident in the data—CLAI-0004 exhibits the highest confidence at 0.354 alongside the lowest uncertainty at 404.01, whereas CLAI-0002 records the lowest confidence at 0.068 paired with an uncertainty of 744.10. This pairing of confidence and uncertainty enables downstream consumers to weight observations appropriately and to flag measurements that fall below acceptable reliability thresholds.

**fact_column**

| id | column_key | confidence | uncertainty | value |
| --- | --- | --- | --- | --- |
| CLAI-0001 | CLAI-0005 | 0.164 | 560.21 | 257.80 |
| CLAI-0002 | CLAI-0006 | 0.068 | 744.10 | 571.55 |
| CLAI-0003 | CLAI-0004 | 0.107 | 984.09 | 140.18 |
| CLAI-0004 | CLAI-0001 | 0.354 | 404.01 | 131.27 |
| CLAI-0005 | CLAI-0006 | 0.790 | 109.97 | 235.19 |
| CLAI-0006 | CLAI-0003 | 0.934 | 653.09 | 813.74 |
| CLAI-0007 | CLAI-0005 | 0.938 | 827.04 | 409.13 |
| CLAI-0008 | CLAI-0002 | 0.734 | 419.22 | 492.32 |

**dim_column**

| id | column_label | column_category |
| --- | --- | --- |
| CLAI-0001 | Column Label 01 | Column Category 01 |
| CLAI-0002 | Column Label 02 | Column Category 02 |
| CLAI-0003 | Column Label 03 | Column Category 03 |
| CLAI-0004 | Column Label 04 | Column Category 04 |
| CLAI-0005 | Column Label 05 | Column Category 05 |
| CLAI-0006 | Column Label 06 | Column Category 06 |

The young adult speaker role table introduces a distinct domain of governance focused on educational presentation delivery and the individuals authorized to conduct it. Each record is keyed by an identifier such as ROLE-0001 or ROLE-0003 and associates a speaker role—Morales PolicyYouth, Ruiz OpenEdLead, Chen TEDx2023, or Tanaka YouthTech—with a qualifying individual, including Chloe Tan, Lucas Fernandez, Elena Rossi, and Zara Okonkwo. The presentation topic is captured as a free-text field, with Ethical AI Governance appearing in three of four records and Open Source Licensing appearing once. This table operates independently of the eBPF and column fact structures, serving as a separate governance namespace for tracking who is authorized to deliver which educational content.

**t_young_adult_speaker_role**

| id | young_adult_speaker_role | qualifying_individual | delivers_presentation |
| --- | --- | --- | --- |
| ROLE-0001 | Morales PolicyYouth | Chloe Tan | Ethical AI Governance |
| ROLE-0002 | Ruiz OpenEdLead | Lucas Fernandez | Ethical AI Governance |
| ROLE-0003 | Chen TEDx2023 | Elena Rossi | Open Source Licensing |
| ROLE-0004 | Tanaka YouthTech | Zara Okonkwo | Ethical AI Governance |
| ROLE-0005 | Tanaka YouthTech | Zara Okonkwo | Cloud Cost Optimization |
| ROLE-0006 | Patel AIWorkshop | Zara Okonkwo | Neuroplasticity Learning |

The relational architecture across these tables follows a star-schema pattern in which fact tables reference dimension tables through foreign keys, enabling consistent classification and aggregation. The eBPF program fact table joins to dim_program_type on program_type_key and to dim_attaches_to_hook on attaches_to_hook_key, ensuring that every program instance carries both its functional classification and its hook attachment semantics without data duplication. Similarly, the column fact table references dim_column through column_key, allowing measured values to be grouped and analyzed by their semantic category. This design supports both granular audit trails at the fact level and aggregated reporting at the dimension level, a pattern that is essential for compliance frameworks requiring traceability from individual observations to their governing taxonomies.