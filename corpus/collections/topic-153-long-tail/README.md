# Collection — topic 153 · 07_long_tail

FinePDFs-grounded topic (carried forward from the coverage audit). **19 chapters** · **3 ontology terms** · **3 underlying tables**.

> **Topic gist** (representative FinePDFs text): 2021. Volume 2. Issue 2 (June). Article CID e0204 DOI: 10.15275/sarmj.2021.0204 Original article Reprint Experimental method for burn skin wound modeling in pigs, Sergey B. Bogdanov 1, 2 , Anton V. Karakulev 1, 2 , Yuliya A. Bogdanova 2 , Alexander S. Sotnichenko 2 Irina V. Gilevich 1, 2 , Karina I. Melkonyan 2 , Valeriya A. Aladyina 1, 2 1 S.V. Ochapovsky Regional Clinical Hospital No.1 2 K... …

## Chapters

- [Chapter 4: Modeling Service Traces, Addresses and Ratings in Consultant Registries](chapters/1051547cc6c68047.md)
- [Chapter 7: Traceable Service Relations in Artifact Registries](chapters/1565b67b96e36700.md)
- [Chapter 4: Ontological Mapping of Infrastructure Compliance and Service Traces](chapters/16825d7602a59e0f.md)
- [Chapter 4: Ontology-Driven Compliance Auditing and Service Traceability](chapters/232bfc3fe5dc3a97.md)
- [Chapter 4: Ontological Mapping of Service Processes and Artifacts](chapters/388a689b65fc1a71.md)
- [Chapter 4: Service Traceability and Location Governance in Municipal Infrastructure](chapters/54ec05c61951b2b0.md)
- [Chapter 7: Ontological Structures for Service Traceability and Location Governance](chapters/57ed1a3ec86e542c.md)
- [Chapter 7: Semantic Relational Mapping for Service Governance](chapters/63287b81f41b5713.md)
- [Chapter 4: Ontological Constraints in Service Governance and Artifact Management](chapters/6ac16fa57378a3aa.md)
- [Chapter 7: Formal Ontology for Service Governance and Artifact Traceability](chapters/85bb091b4f8a3a78.md)
- [Chapter 7: Ontological Mapping of Service Traces and Artifacts](chapters/9b05487a6db8b2f5.md)
- [Chapter 7: Ontological Verification of Service Traces and Artifacts](chapters/9da7a86331c38bb0.md)
- [Chapter 7: Service Traceability and Location-Based Compliance Metrics](chapters/a4ec86a6bc9d9fc9.md)
- [Chapter 4: Operational Traceability and Artifact Compliance Frameworks](chapters/bea5c366dc7e7837.md)
- [Chapter 7: Service Traceability and Asset Verification Protocols](chapters/c333521d7454858a.md)
- [Chapter 4: Ontological Mapping of Service Traces and Spatial Artifacts in Compliance Frameworks](chapters/ddbb9e9786cd1e28.md)
- [Chapter 7: Relational Mapping of Service Traces and Spatial Compliance](chapters/e8e0652467f79814.md)
- [Modeling Service Traces, Addresses, and Ratings](chapters/f0273f5c533f894e.md)
- [Chapter 12: Ontological Mapping of Service Artifacts and Location Data](chapters/f99b7700d863f497.md)

## Ontology terms grounding this collection

- `schemaorg_place_address` — {X} is an artifact that has postal address {Y}
- `schemaorg_review_rating` — {X} is an artifact that has review rating {Y}
- `trace_in_service` — {X} is a process that in service {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_schemaorg_place_address`](tables/t_schemaorg_place_address.sql) — realizes `schemaorg_place_address`
- [`t_schemaorg_review_rating`](tables/t_schemaorg_review_rating.sql) — realizes `schemaorg_review_rating`
- [`t_trace_in_service`](tables/t_trace_in_service.sql) — realizes `trace_in_service`
