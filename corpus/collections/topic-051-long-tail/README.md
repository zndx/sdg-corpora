# Collection — topic 51 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **9 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): Teaching guide IDENTIFICATION DETAILS Degree: Gastronomy Field of Knowledge: Science Faculty/School: Legal and Business Science Course: BRAND AND PRODUCT POLICIES Type: Basic Training ECTS credits: 6 Year: 2 Code: 1429 Teaching period: Third semester Area: Business Module: Basic training Teaching type: Classroom-based Language: English Total number of student study hour... …

## Chapters

- [Chapter 4: Ontological Mapping in Regulatory Compliance Reporting](chapters/17beb290cee0f1e8.md)
- [Chapter 4: Structured Attribution and Lineage in Commercial Artifact Management](chapters/2cf28f3b7dbb6f1b.md)
- [Chapter 7: Governance of Digital and Physical Artifacts in Compliance Frameworks](chapters/57234d9651517734.md)
- [Chapter 4: Semantic Annotation and Provenance Tracking in Multi-Domain Asset Governance](chapters/7aebdd77dbda31cd.md)
- [Chapter 7: Relational Mapping of Descriptive Artifacts and Commercial Entities](chapters/7d37c862d30e0b07.md)
- [Chapter 4: Ontological Structuring of Supply Chain Evidence and Documentation Metadata](chapters/7fa6f55ebea0ee57.md)
- [Product Metadata Modeling for Design Artifact Catalogs](chapters/7fd880e11864ac8a.md)
- [Modeling Menu Artifacts with Descriptive Ontologies](chapters/84ef3a4e6e62887d.md)
- [Chapter 4: Relational Projection of Descriptive Entities and Artifacts](chapters/8504eb0ab03fa814.md)

## Ontology terms grounding this collection

- `schemaorg_place_address` — {X} is an artifact that has postal address {Y}
- `schemaorg_product_brand` — {X} is an artifact that has brand {Y}
- `schemaorg_product_price` — {X} is an artifact that has price {Y}
- `table_provenance_source` — {X} is a descriptive information content entity that sourced from table {Y}
- `table_topic_tag` — {X} is a descriptive information content entity that has table topic {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_schemaorg_place_address`](tables/t_schemaorg_place_address.sql) — realizes `schemaorg_place_address`
- [`t_schemaorg_product_brand`](tables/t_schemaorg_product_brand.sql) — realizes `schemaorg_product_brand`
- [`t_schemaorg_product_price`](tables/t_schemaorg_product_price.sql) — realizes `schemaorg_product_price`
- [`t_table_provenance_source`](tables/t_table_provenance_source.sql) — realizes `table_provenance_source`
- [`t_table_topic_tag`](tables/t_table_topic_tag.sql) — realizes `table_topic_tag`
