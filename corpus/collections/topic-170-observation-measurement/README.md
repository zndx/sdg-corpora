# Collection — topic 170 · 02_observation_measurement

FinePDFs-grounded topic (carried forward from the coverage audit). **14 chapters** · **5 ontology terms** · **5 underlying tables**.

> **Topic gist** (representative FinePDFs text): 1 ECGlib: Library for Processing Electrocardiograms Lars Johannesen 1 , 2 , Jose Vicente 3 , Loriano Galeotti 3 , David G Strauss 3 Division of Pharmacometrics, Ofﬁce of Clinical Pharmacology, Ofﬁce of Translational Sciences, Center for Drug Evaluation and Research, US Food and Drug Administration, USA 3 Division of Physics, Ofﬁce of Science and Engineering Laboratories, Center for Devices an... …

## Chapters

- [Chapter 4: Geospatial Attribution and Fiscal Identity in Physical Asset Governance](chapters/038e8c9b7b3954d4.md)
- [Chapter 4: Spatial and Fiscal Identification of Physical Artifacts](chapters/06284d5d390bee48.md)
- [Civic Asset Registry Schema](chapters/3b2be5ad576d7961.md)
- [Chapter 4: Spatial and Fiscal Entity Resolution in Compliance Ontologies](chapters/447b70960cbd9ccc.md)
- [Chapter 8: Spatial and Fiscal Attribution in Artifact Governance](chapters/50f8f085bad7b98e.md)
- [Chapter 4: Geospatial and Administrative Attribute Governance in Enterprise Ontologies](chapters/631d0fe569ed299c.md)
- [Chapter 4: Ontological Mapping of Physical and Legal Entity Attributes](chapters/813611906c0bf523.md)
- [Artifact Location and Identification Schema](chapters/893c297479c693ad.md)
- [Ontological Modeling of Artifact Locations and Identifiers](chapters/bb95bc50bafa428d.md)
- [Chapter 7: Physical Asset Verification and Site Governance Protocols](chapters/bb9f5b34b528d28e.md)
- [Modeling Artifact Locations and Organizational Identifiers](chapters/c102f0f45eb27c8f.md)
- [Chapter 7: Geospatial Attribution and Fiscal Identification in Asset Governance](chapters/c336b54885a0370f.md)
- [Chapter 4: Geospatial and Fiscal Entity Verification Protocols](chapters/c357dcc6dc7f7e9d.md)
- [Chapter 4: Geospatial and Fiscal Registry for Physical Artifacts](chapters/d1d6095c178fa802.md)

## Ontology terms grounding this collection

- `schemaorg_org_taxid` — {X} is an artifact that has tax id {Y}
- `schemaorg_place_address` — {X} is an artifact that has postal address {Y}
- `schemaorg_place_geocoord` — {X} is an artifact that has geo coordinates {Y}
- `schemaorg_place_latitude` — {X} is an artifact that has latitude {Y}
- `schemaorg_place_longitude` — {X} is an artifact that has longitude {Y}

## Underlying relational tables (semantic columns)

_The tables the chapters' embedded views project from — the current semantic-column DDL spine. (Embedded views in the chapter prose reflect the generation-time schema.)_

- [`t_schemaorg_org_taxid`](tables/t_schemaorg_org_taxid.sql) — realizes `schemaorg_org_taxid`
- [`t_schemaorg_place_address`](tables/t_schemaorg_place_address.sql) — realizes `schemaorg_place_address`
- [`t_schemaorg_place_geocoord`](tables/t_schemaorg_place_geocoord.sql) — realizes `schemaorg_place_geocoord`
- [`t_schemaorg_place_latitude`](tables/t_schemaorg_place_latitude.sql) — realizes `schemaorg_place_latitude`
- [`t_schemaorg_place_longitude`](tables/t_schemaorg_place_longitude.sql) — realizes `schemaorg_place_longitude`
