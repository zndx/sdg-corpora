# Collection — topic 52 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **12 chapters** · **20 topics** (target + style) · **5 ontology terms** · **5 underlying tables**.

**Topics (many-to-many).** The documents draw on, beyond the anchor topic 52: topic 4, topic 6, topic 13, topic 26, topic 31, topic 37, topic 47, topic 66, topic 82, topic 83, topic 91, topic 92, topic 93, topic 101, topic 112, topic 144, topic 150, topic 166, topic 197.

> **Topic gist** (representative FinePDFs text): COMPARISON OF SEISMIC SLOPE STABILITY ASSESSMENT METHODS FOR REINFORCED GEOSTRUCTURES I. Tzavara ¹, Y. Tsompanakis ², V. Zania ³, P. N. Psarropoulos ⁴ ¹ PhD Candidate, School of Environmental Engineering, Technical University of Crete, Chania, Greece ² Associate Professor, School of Environmental Engineering, Technical University of Crete, Chania, Greece ³ Assistant Professor, Department of Civi.. …

## Chapters

- [Chapter 7: Governance Frameworks for Digital Asset Compliance and Fiscal Identification](chapters/1420e21e5e16c58d.md)
- [Chapter 4: Regulatory Identification and Compliance Mapping in Supply Chain Artifacts](chapters/2904b38a06dc93cf.md)
- [Ontological Foundations of Compliance Artifacts](chapters/34022b96de660499.md)
- [Chapter 4: Entity Identification and Attribute Verification Protocols](chapters/48b7adf27d3dcb47.md)
- [Chapter 4: Ontological Structures for Compliance and Asset Management](chapters/49e26650ac53eb7f.md)
- [Chapter 4: Ontological Mapping in Compliance Auditing: Artifact and Directive Correlation](chapters/4d2486e08b64ef62.md)
- [Chapter 4: Ontological Frameworks for Regulatory Compliance and Entity Verification](chapters/4e01ee31173426cd.md)
- [Compliance Modeling for Artifacts and Directives](chapters/cd2f8cc0d73305ed.md)
- [Modeling Compliance Artifacts and Descriptive Claims](chapters/d5b80018d8c45647.md)
- [Chapter 7: Artifact Taxonomies and Descriptive Compliance Claims](chapters/d712b924ce83bb55.md)
- [Chapter 4. Relational Embodiments of Compliance Ontologies](chapters/f069e550d0a8637a.md)
- [Chapter 7: Relational Mapping of Compliance Artifacts and Information Content Entities](chapters/f6d5a522bfa027fb.md)

## Ontology terms grounding this collection

- `attribute_set_min_one` — {X} is a descriptive information content entity
- `iso27001_clause_subclass` — {X} is a directive information content entity that iso27001 clause {Y}
- `outlier_claim_min_one_attribute` — {X} is a descriptive information content entity
- `schemaorg_org_taxid` — {X} is an artifact that has tax id {Y}
- `schemaorg_product_price` — {X} is an artifact that has price {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_attribute_set_min_one`](tables/t_attribute_set_min_one.sql) — realizes `attribute_set_min_one`
- [`t_iso27001_clause_subclass`](tables/t_iso27001_clause_subclass.sql) — realizes `iso27001_clause_subclass` · _shared with 5 other collection(s)_
- [`t_outlier_claim_min_one_attribute`](tables/t_outlier_claim_min_one_attribute.sql) — realizes `outlier_claim_min_one_attribute` · _shared with 5 other collection(s)_
- [`t_schemaorg_org_taxid`](tables/t_schemaorg_org_taxid.sql) — realizes `schemaorg_org_taxid` · _shared with 3 other collection(s)_
- [`t_schemaorg_product_price`](tables/t_schemaorg_product_price.sql) — realizes `schemaorg_product_price` · _shared with 4 other collection(s)_
