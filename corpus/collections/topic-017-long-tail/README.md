# Collection — topic 17 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **2 chapters** · **6 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 17: topic 36, topic 50, topic 62, topic 105, topic 124.

> **Topic gist** (representative FinePDFs text): The miR526b-5p-Related Single Nucleotide Polymorphisms, rs72618599, Located in 3'-UTR of TCF3 Gene, is Associated with the Risk of Breast and Gastric Cancers Maryam Mohammadi 1 , Ali Salehzadeh 1* , Soheila Talesh Sasani 2 and Alireza Tarang 3 1 Department of Biology, Rasht Branch, Islamic Azad University, Rasht, Iran; 2 Department of Biology, Faculty of Science, University of Guilan, Rasht, Ira.. …

## Chapters

- [ch_live_dataset_snapshot_subclass_af7bbc](chapters/ch_live_dataset_snapshot_subclass_af7bbc.md)
- [ch_live_gdpr_article_subclass_86f338](chapters/ch_live_gdpr_article_subclass_86f338.md)

## Ontology terms grounding this collection

- `dataset_snapshot_subclass` — {X} is an artifact that snapshot of {Y}
- `dataset_subclass` — {X} is an artifact that has column {Y}
- `dataset_under_audit` — {X} is an artifact that under audit process
- `ebpfprogram_loaded_in_kernel` — {X} is an artifact that loaded in {Y}
- `gdpr_article_subclass` — {X} is a directive information content entity that gdpr article {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_dataset_snapshot_subclass`](tables/t_dataset_snapshot_subclass.sql) — realizes `dataset_snapshot_subclass` · _shared with 10 other collection(s)_
- [`t_dataset_subclass`](tables/t_dataset_subclass.sql) — realizes `dataset_subclass` · _shared with 1 other collection(s)_
- [`t_dataset_under_audit`](tables/t_dataset_under_audit.sql) — realizes `dataset_under_audit` · _shared with 1 other collection(s)_
- [`t_ebpfprogram_loaded_in_kernel`](tables/t_ebpfprogram_loaded_in_kernel.sql) — realizes `ebpfprogram_loaded_in_kernel` · _shared with 7 other collection(s)_
- [`t_gdpr_article_subclass`](tables/t_gdpr_article_subclass.sql) — realizes `gdpr_article_subclass` · _shared with 9 other collection(s)_
