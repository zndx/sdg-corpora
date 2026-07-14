## The Archaeology of Gaulish Toponymy and Epigraphy

The study of ancient Gaulish settlement patterns relies on a network of interlocking records: tribal identities, place names, inscribed monuments, linguistic reconstructions, territorial boundaries, and the scholarly documents that bind them together. Practitioners in this field navigate a corpus where each artifact, from a weathered stone inscription to a modern cartographic survey, carries metadata that situates it within a broader cultural and geographical framework. The records below capture this complexity, linking ethnonymic designations to specific regions, tying deciphered texts to analytical methodologies, and anchoring everything to the historical documents through which scholars interpret the past.

### Core Records of Tribal Identity and Settlement

The foundational layer of the corpus consists of records documenting Gaulish tribal groups and their territorial associations. Each entry captures an ethnonym alongside occupational specializations, settlement typologies, and etymological assessments.

**Table `gaulish_tribes`**

| id | ethnonym | primary_occupation | settlement_area | is_celtic_origin | slavic_etymology | epigraphic_inscription_id | historical_region_id | created_at |
|---|---|---|---|---|---|---|---|---|
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | baseline-settleme-37 | true | regional-slavic-36 | 100 | 1 | 2025-01-01 00:14:00 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | pilot-settleme-38 | false | legacy-slavic-37 | 101 | 2 | 2025-02-06 03:14:00 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | extended-settleme-39 | true | compact-slavic-38 | 102 | 3 | 2025-03-11 06:14:00 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | integrated-settleme-40 | false | composite-slavic-39 | 103 | 4 | 2025-04-16 09:14:00 |

The first recorded group, identified by the ethnonym `seasonal-ethnonym-17`, practices a composite primary occupation and maintains a `baseline-settleme-37` settlement area. Its cultural lineage is traced to Celtic origins, while its Slavic etymology is classified as `regional-slavic-36`. This tribe is associated with epigraphic record `100` and falls within historical region `1`. The second entry, `regional-ethnonym-18`, diverges in origin (marked `false` for Celtic derivation) and carries a `legacy-slavic-37` etymology, linked to epigraphic record `101` and region `2`. The third and fourth entries, `legacy-ethnonym-19` and `compact-ethnonym-20`, restore the Celtic origin flag and present `compact-slavic-38` and `composite-slavic-39` etymologies respectively, anchoring the tribal sequence across regions `3` and `4`.

Place names form the second pillar of the corpus, each entry carrying a toponymic label, its regional classification, and a Slavic root designation.

**Table `toponyms`**

| id | name | region | slavic_root | source_map | confidence_level | historical_region_id | gaulish_tribe_id | historical_document_id |
|---|---|---|---|---|---|---|---|---|
| 100 | Extended Review | distributed-region-12 | primary-slavic-10 | adaptive-source-89 | baseline-confiden-91 | 1 | 1000 | 1 |
| 101 | Pilot Initiative A | baseline-region-13 | adaptive-slavic-11 | distributed-source-90 | pilot-confiden-92 | 2 | 1001 | 2 |
| 102 | Baseline Model | pilot-region-14 | distributed-slavic-12 | baseline-source-91 | extended-confiden-93 | 3 | 1002 | 3 |
| 103 | Distributed Cluster | extended-region-15 | baseline-slavic-13 | pilot-source-92 | integrated-confiden-94 | 4 | 1003 | 4 |

The toponym `Extended Review` resides in `distributed-region-12`, derives from the `primary-slavic-10` root, and is sourced from `adaptive-source-89` with a `baseline-confiden-91` confidence level. It connects to historical region `1`, tribe `1000`, and historical document `1`. The toponym `Pilot Initiative A` in `baseline-region-13` carries the `adaptive-slavic-11` root and `distributed-source-90` provenance, achieving a `pilot-confiden-92` confidence rating while linking to region `2`, tribe `1001`, and document `2`. The remaining toponyms, `Baseline Model` and `Distributed Cluster`, follow the same structural pattern, each establishing a unique coordinate across the regional, tribal, and documentary dimensions.

### Epigraphic Records and Their Linguistic Interpretations

Inscribed monuments provide the most direct material evidence for Gaulish linguistic practice. Each epigraphic record preserves the inscription text, the script type employed, the discovery location, and a deciphered meaning.

**Table `epigraphic_inscriptions`**

| epigraphic_inscription_id | inscription_text | script_type | discovery_location | deciphered_meaning | source_reference | historical_region_id | linguistic_analysis_id | gaulish_tribe_id |
|---|---|---|---|---|---|---|---|---|
| 100 | distributed-inscript-78 | regional-script-18 | baseline-discover-43 | baseline-decipher-85 | integrated-source-58 | 1 | 1000 | 1000 |
| 101 | baseline-inscript-79 | legacy-script-19 | pilot-discover-44 | pilot-decipher-86 | seasonal-source-59 | 2 | 1001 | 1001 |
| 102 | pilot-inscript-80 | compact-script-20 | extended-discover-45 | extended-decipher-87 | regional-source-60 | 3 | 1002 | 1002 |
| 103 | extended-inscript-81 | composite-script-21 | integrated-discover-46 | integrated-decipher-88 | legacy-source-61 | 4 | 1003 | 1003 |

The inscription `distributed-inscript-78`, written in `regional-script-18`, was uncovered at `baseline-discover-43` and yields the deciphered meaning `baseline-decipher-85`. Its source reference is `integrated-source-58`, and it originates from historical region `1`. This record is tied to linguistic analysis `1000` and tribal record `1000`. The second inscription, `baseline-inscript-79`, employs `legacy-script-19`, was found at `pilot-discover-44`, and deciphers to `pilot-decipher-86`. Sourced from `seasonal-source-59`, it belongs to region `2`, analysis `1001`, and tribe `1001`. The third and fourth inscriptions, `pilot-inscript-80` and `extended-inscript-81`, complete the sequence with `compact-script-20` and `composite-script-21` respectively, each anchored to their own region, analysis, and tribal record.

Linguistic analyses provide the methodological framework through which inscriptions are interpreted. Each analysis specifies its methodology, the Slavic language basis, the interpretation result, and the authoring scholar.

**Table `linguistic_analysises`**

| id | methodology | slavic_language_basis | interpretation_result | author | publication_year | epigraphic_inscription_id | toponym_id | historical_document_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | compact-methodol-68 | legacy-slavic-73 | baseline-interpre-91 | Norma Fisher | 25 | 100 | 100 | 1 |
| 1001 | composite-methodol-69 | compact-slavic-74 | pilot-interpre-92 | Daniel Abbott | 33 | 101 | 101 | 2 |
| 1002 | primary-methodol-70 | composite-slavic-75 | extended-interpre-93 | Chris Bennett | 41 | 102 | 102 | 3 |
| 1003 | adaptive-methodol-71 | primary-slavic-76 | integrated-interpre-94 | Ernest Hemingway | 49 | 103 | 103 | 4 |

Analysis `1000` applies the `compact-methodol-68` methodology grounded in `legacy-slavic-73`, producing the interpretation `baseline-interpre-91`. Authored by Norma Fisher and dated to year `25`, it references epigraphic inscription `100`, toponym `100`, and historical document `1`. Analysis `1001` shifts to `composite-methodol-69` with a `compact-slavic-74` basis, yielding `pilot-interpre-92`. Daniel Abbott authored this entry in year `33`, connecting it to inscription `101`, toponym `101`, and document `2`. The remaining analyses, `1002` and `1003`, are attributed to Chris Bennett and Ernest Hemingway respectively, with publication years `41` and `49`, and they complete the analytical chain across the full set of inscriptions, toponyms, and documents.

### Historical Regions and Documentary Sources

Territorial boundaries are recorded in the historical regions table, each entry specifying a region name, its geographical bounds, the dominant culture, the level of Slavic influence, and the historical period.

**Table `historical_regions`**

| id | region_name | geographical_bounds | dominant_culture | slavic_influence_level | historical_period | epigraphic_inscription_id |
|---|---|---|---|---|---|---|
| 1 | Distributed Assessment | seasonal-geograph-59 | pilot-dominant-68 | distributed-slavic-60 | compact-historic-26 | 100 |
| 2 | Adaptive Survey D | regional-geograph-60 | extended-dominant-69 | baseline-slavic-61 | composite-historic-27 | 101 |
| 3 | Primary Corridor | legacy-geograph-61 | integrated-dominant-70 | pilot-slavic-62 | primary-historic-28 | 102 |
| 4 | Composite Series | compact-geograph-62 | seasonal-dominant-71 | extended-slavic-63 | adaptive-historic-29 | 103 |

Region `1`, named `Distributed Assessment`, spans `seasonal-geograph-59` geographical bounds, exhibits a `pilot-dominant-68` culture, carries a `distributed-slavic-60` influence level, and belongs to the `compact-historic-26` period. It is associated with epigraphic inscription `100`. Region `2`, `Adaptive Survey D`, covers `regional-geograph-60`, shows `extended-dominant-69` cultural dominance, `baseline-slavic-61` Slavic influence, and the `composite-historic-27` period, linked to inscription `101`. Regions `3` and `4`, `Primary Corridor` and `Composite Series`, continue this pattern with `legacy-geograph-61` and `compact-geograph-62` bounds respectively, anchoring inscriptions `102` and `103`.

Historical documents serve as the scholarly bridge between material evidence and interpretation. Each document records a title, author, publication year, document type, and content summary.

**Table `historical_documents`**

| id | document_title | author | publication_year | document_type | content_summary | linguistic_analysis_id | toponym_id | epigraphic_inscription_id |
|---|---|---|---|---|---|---|---|---|
| 1 | Compact Series | Norma Fisher | 25 | distributed-document-96 | seasonal-content-41 | 1000 | 100 | 100 |
| 2 | Legacy Assessment | Daniel Abbott | 33 | baseline-document-97 | regional-content-42 | 1001 | 101 | 101 |
| 3 | Regional Survey A | Chris Bennett | 41 | pilot-document-98 | legacy-content-43 | 1002 | 102 | 102 |
| 4 | Seasonal Corridor | Ernest Hemingway | 49 | extended-document-99 | compact-content-44 | 1003 | 103 | 103 |

The document `Compact Series`, authored by Norma Fisher in year `25`, is classified as `distributed-document-96` with `seasonal-content-41` content. It references linguistic analysis `1000`, toponym `100`, and epigraphic inscription `100`. The document `Legacy Assessment` by Daniel Abbott (year `33`, type `baseline-document-97`, content `regional-content-42`) connects analysis `1001`, toponym `101`, and inscription `101`. The final two documents, `Regional Survey A` by Chris Bennett and `Seasonal Corridor` by Ernest Hemingway, complete the documentary corpus, each tying together a specific analysis, toponym, and inscription.

### Junction Records and Cross-Referencing

The corpus includes junction tables that explicitly encode the many-to-many relationships between tribes and toponyms, regions and toponyms, and regions and tribes.

**Table `tribes_toponyms`**

| gaulish_tribe_id | toponym_id |
|---|---|
| 1000 | 100 |
| 1000 | 101 |
| 1001 | 101 |
| 1001 | 102 |
| 1002 | 102 |
| 1002 | 103 |
| 1003 | 103 |
| 1003 | 100 |

**Table `regions_toponyms`**

| historical_region_id | toponym_id |
|---|---|
| 1 | 100 |
| 1 | 101 |
| 2 | 101 |
| 2 | 102 |
| 3 | 102 |
| 3 | 103 |
| 4 | 103 |
| 4 | 100 |

**Table `regions_tribes`**

| historical_region_id | gaulish_tribe_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

These junction records formalize the associations that also appear as foreign keys in the base tables, providing an explicit mapping layer that supports complex queries across the domain.

### Joined Views: Integrated Perspectives

The analytical power of the corpus emerges through joined views that synthesize records from multiple tables. Each view answers a specific research question by combining related entities.

The view `v_gaulish_tribe_toponym_detail` joins tribal records with their associated toponyms, revealing how ethnonymic identities map onto place names.

**View `v_gaulish_tribe_toponym_detail`**

```sql
CREATE VIEW v_gaulish_tribe_toponym_detail AS
SELECT a.id, a.ethnonym, a.primary_occupation, b.id AS toponym_id, b.name AS toponym_name, b.region AS toponym_region
FROM gaulish_tribes a
  JOIN tribes_toponyms j ON j.gaulish_tribe_id = a.id
  JOIN toponyms b ON b.id = j.toponym_id;
```

| id | ethnonym | primary_occupation | toponym_id | toponym_name | toponym_region |
|---|---|---|---|---|---|
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | 100 | Extended Review | distributed-region-12 |
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | 101 | Pilot Initiative A | baseline-region-13 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | 101 | Pilot Initiative A | baseline-region-13 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | 102 | Baseline Model | pilot-region-14 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | 102 | Baseline Model | pilot-region-14 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | 103 | Distributed Cluster | extended-region-15 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | 103 | Distributed Cluster | extended-region-15 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | 100 | Extended Review | distributed-region-12 |

Reading the first row of this view, the ethnonym `seasonal-ethnonym-17` is paired with the toponym `Extended Review` from `distributed-region-12`. The toponym's `primary-slavic-10` root and `baseline-confiden-91` confidence level sit alongside the tribe's `composite-primary-39` occupation and `baseline-settleme-37` settlement area. The second row connects `regional-ethnonym-18` with `Pilot Initiative A`, showing how a non-Celtic-origin tribe (`false`) with `legacy-slavic-37` etymology corresponds to a toponym bearing the `adaptive-slavic-11` root.

The view `v_gaulish_tribe_epigraphic_inscription` links tribal records directly to their epigraphic evidence.

**View `v_gaulish_tribe_epigraphic_inscription`**

```sql
CREATE VIEW v_gaulish_tribe_epigraphic_inscription AS
SELECT a.id, a.ethnonym, a.primary_occupation, a.settlement_area, b.epigraphic_inscription_id AS inscription_epigraphic_inscription_id, b.inscription_text AS inscription_inscription_text, b.script_type AS inscription_script_type
FROM gaulish_tribes a JOIN epigraphic_inscriptions b ON a.epigraphic_inscription_id = b.epigraphic_inscription_id;
```

| id | ethnonym | primary_occupation | settlement_area | inscription_epigraphic_inscription_id | inscription_inscription_text | inscription_script_type |
|---|---|---|---|---|---|---|
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | baseline-settleme-37 | 100 | distributed-inscript-78 | regional-script-18 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | pilot-settleme-38 | 101 | baseline-inscript-79 | legacy-script-19 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | extended-settleme-39 | 102 | pilot-inscript-80 | compact-script-20 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | integrated-settleme-40 | 103 | extended-inscript-81 | composite-script-21 |

In the first row, `seasonal-ethnonym-17` is associated with inscription `distributed-inscript-78`, written in `regional-script-18` and discovered at `baseline-discover-43`. The deciphered meaning `baseline-decipher-85` and source `integrated-source-58` provide the interpretive context for this tribal-epigraphic pairing. The second row ties `regional-ethnonym-18` to `baseline-inscript-79`, a `legacy-script-19` inscription from `pilot-discover-44` with meaning `pilot-decipher-86`.

The view `v_gaulish_tribe_historical_region` situates tribes within their territorial contexts.

**View `v_gaulish_tribe_historical_region`**

```sql
CREATE VIEW v_gaulish_tribe_historical_region AS
SELECT a.id, a.ethnonym, a.primary_occupation, a.settlement_area, b.id AS region_id, b.region_name AS region_region_name, b.geographical_bounds AS region_geographical_bounds
FROM gaulish_tribes a JOIN historical_regions b ON a.historical_region_id = b.id;
```

| id | ethnonym | primary_occupation | settlement_area | region_id | region_region_name | region_geographical_bounds |
|---|---|---|---|---|---|---|
| 1000 | seasonal-ethnonym-17 | composite-primary-39 | baseline-settleme-37 | 1 | Distributed Assessment | seasonal-geograph-59 |
| 1001 | regional-ethnonym-18 | primary-primary-40 | pilot-settleme-38 | 2 | Adaptive Survey D | regional-geograph-60 |
| 1002 | legacy-ethnonym-19 | adaptive-primary-41 | extended-settleme-39 | 3 | Primary Corridor | legacy-geograph-61 |
| 1003 | compact-ethnonym-20 | distributed-primary-42 | integrated-settleme-40 | 4 | Composite Series | compact-geograph-62 |

The first row places `seasonal-ethnonym-17` within `Distributed Assessment`, a region spanning `seasonal-geograph-59` with `pilot-dominant-68` culture and `distributed-slavic-60` Slavic influence during the `compact-historic-26` period. The second row associates `regional-ethnonym-18` with `Adaptive Survey D`, characterized by `regional-geograph-60` bounds, `extended-dominant-69` culture, and `baseline-slavic-61` influence in the `composite-historic-27` period.

The view `v_toponym_historical_region` connects place names to their territorial settings.

**View `v_toponym_historical_region`**

```sql
CREATE VIEW v_toponym_historical_region AS
SELECT a.id, a.name, a.region, a.slavic_root, b.id AS region_id, b.region_name AS region_region_name, b.geographical_bounds AS region_geographical_bounds
FROM toponyms a JOIN historical_regions b ON a.historical_region_id = b.id;
```

| id | name | region | slavic_root | region_id | region_region_name | region_geographical_bounds |
|---|---|---|---|---|---|---|
| 100 | Extended Review | distributed-region-12 | primary-slavic-10 | 1 | Distributed Assessment | seasonal-geograph-59 |
| 101 | Pilot Initiative A | baseline-region-13 | adaptive-slavic-11 | 2 | Adaptive Survey D | regional-geograph-60 |
| 102 | Baseline Model | pilot-region-14 | distributed-slavic-12 | 3 | Primary Corridor | legacy-geograph-61 |
| 103 | Distributed Cluster | extended-region-15 | baseline-slavic-13 | 4 | Composite Series | compact-geograph-62 |

The first row shows `Extended Review` situated in `Distributed Assessment`, where the toponym's `primary-slavic-10` root and `baseline-confiden-91` confidence intersect with the region's `pilot-dominant-68` culture and `compact-historic-26` period. The second row links `Pilot Initiative A` to `Adaptive Survey D`, pairing the `adaptive-slavic-11` root with `extended-dominant-69` cultural dominance.

The view `v_toponym_gaulish_tribe` reverses the tribal-toponymic relationship, starting from place names.

**View `v_toponym_gaulish_tribe`**

```sql
CREATE VIEW v_toponym_gaulish_tribe AS
SELECT a.id, a.name, a.region, a.slavic_root, b.id AS tribe_id, b.ethnonym AS tribe_ethnonym, b.primary_occupation AS tribe_primary_occupation
FROM toponyms a JOIN gaulish_tribes b ON a.gaulish_tribe_id = b.id;
```

| id | name | region | slavic_root | tribe_id | tribe_ethnonym | tribe_primary_occupation |
|---|---|---|---|---|---|---|
| 100 | Extended Review | distributed-region-12 | primary-slavic-10 | 1000 | seasonal-ethnonym-17 | composite-primary-39 |
| 101 | Pilot Initiative A | baseline-region-13 | adaptive-slavic-11 | 1001 | regional-ethnonym-18 | primary-primary-40 |
| 102 | Baseline Model | pilot-region-14 | distributed-slavic-12 | 1002 | legacy-ethnonym-19 | adaptive-primary-41 |
| 103 | Distributed Cluster | extended-region-15 | baseline-slavic-13 | 1003 | compact-ethnonym-20 | distributed-primary-42 |

In the first row, `Extended Review` is associated with `seasonal-ethnonym-17`, whose `composite-primary-39` occupation and `baseline-settleme-37` settlement area provide the tribal context for this place name. The second row connects `Pilot Initiative A` to `regional-ethnonym-18`, revealing a tribe with `primary-primary-40` occupation and `pilot-settleme-38` settlement.

The view `v_toponym_historical_document` ties toponyms to the scholarly documents that discuss them.

**View `v_toponym_historical_document`**

```sql
CREATE VIEW v_toponym_historical_document AS
SELECT a.id, a.name, a.region, a.slavic_root, b.id AS document_id, b.document_title AS document_document_title, b.author AS document_author
FROM toponyms a JOIN historical_documents b ON a.historical_document_id = b.id;
```

| id | name | region | slavic_root | document_id | document_document_title | document_author |
|---|---|---|---|---|---|---|
| 100 | Extended Review | distributed-region-12 | primary-slavic-10 | 1 | Compact Series | Norma Fisher |
| 101 | Pilot Initiative A | baseline-region-13 | adaptive-slavic-11 | 2 | Legacy Assessment | Daniel Abbott |
| 102 | Baseline Model | pilot-region-14 | distributed-slavic-12 | 3 | Regional Survey A | Chris Bennett |
| 103 | Distributed Cluster | extended-region-15 | baseline-slavic-13 | 4 | Seasonal Corridor | Ernest Hemingway |

The first row pairs `Extended Review` with `Compact Series`, authored by Norma Fisher in year `25`. The document's `distributed-document-96` type and `seasonal-content-41` summary frame the scholarly treatment of this toponym. The second row links `Pilot Initiative A` to `Legacy Assessment` by Daniel Abbott, a `baseline-document-97` with `regional-content-42` content.

The view `v_epigraphic_inscription_historical_region` situates inscriptions within their territorial contexts.

**View `v_epigraphic_inscription_historical_region`**

```sql
CREATE VIEW v_epigraphic_inscription_historical_region AS
SELECT a.epigraphic_inscription_id, a.inscription_text, a.script_type, a.discovery_location, b.id AS region_id, b.region_name AS region_region_name, b.geographical_bounds AS region_geographical_bounds
FROM epigraphic_inscriptions a JOIN historical_regions b ON a.historical_region_id = b.id;
```

| epigraphic_inscription_id | inscription_text | script_type | discovery_location | region_id | region_region_name | region_geographical_bounds |
|---|---|---|---|---|---|---|
| 100 | distributed-inscript-78 | regional-script-18 | baseline-discover-43 | 1 | Distributed Assessment | seasonal-geograph-59 |
| 101 | baseline-inscript-79 | legacy-script-19 | pilot-discover-44 | 2 | Adaptive Survey D | regional-geograph-60 |
| 102 | pilot-inscript-80 | compact-script-20 | extended-discover-45 | 3 | Primary Corridor | legacy-geograph-61 |
| 103 | extended-inscript-81 | composite-script-21 | integrated-discover-46 | 4 | Composite Series | compact-geograph-62 |

The first row places `distributed-inscript-78` within `Distributed Assessment`, where the inscription's `regional-script-18` and `baseline-decipher-85` meaning are contextualized by the region's `pilot-dominant-68` culture and `compact-historic-26` period. The second row associates `baseline-inscript-79` with `Adaptive Survey D`, pairing `legacy-script-19` with `extended-dominant-69` cultural dominance.

The view `v_epigraphic_inscription_linguistic_analysis` connects inscriptions to their analytical interpretations.

**View `v_epigraphic_inscription_linguistic_analysis`**

```sql
CREATE VIEW v_epigraphic_inscription_linguistic_analysis AS
SELECT a.epigraphic_inscription_id, a.inscription_text, a.script_type, a.discovery_location, b.id AS analysis_id, b.methodology AS analysis_methodology, b.slavic_language_basis AS analysis_slavic_language_basis
FROM epigraphic_inscriptions a JOIN linguistic_analysises b ON a.linguistic_analysis_id = b.id;
```

| epigraphic_inscription_id | inscription_text | script_type | discovery_location | analysis_id | analysis_methodology | analysis_slavic_language_basis |
|---|---|---|---|---|---|---|
| 100 | distributed-inscript-78 | regional-script-18 | baseline-discover-43 | 1000 | compact-methodol-68 | legacy-slavic-73 |
| 101 | baseline-inscript-79 | legacy-script-19 | pilot-discover-44 | 1001 | composite-methodol-69 | compact-slavic-74 |
| 102 | pilot-inscript-80 | compact-script-20 | extended-discover-45 | 1002 | primary-methodol-70 | composite-slavic-75 |
| 103 | extended-inscript-81 | composite-script-21 | integrated-discover-46 | 1003 | adaptive-methodol-71 | primary-slavic-76 |

The first row links `distributed-inscript-78` to analysis `1000`, where the `compact-methodol-68` methodology and `legacy-slavic-73` basis produced the `baseline-interpre-91` result. Norma Fisher's authorship and year `25` date anchor this interpretive act. The second row connects `baseline-inscript-79` to analysis `1001`, applying `composite-methodol-69` with `compact-slavic-74` basis to yield `pilot-interpre-92`.

The view `v_epigraphic_inscription_gaulish_tribe` directly associates inscriptions with tribal records.

**View `v_epigraphic_inscription_gaulish_tribe`**

```sql
CREATE VIEW v_epigraphic_inscription_gaulish_tribe AS
SELECT a.epigraphic_inscription_id, a.inscription_text, a.script_type, a.discovery_location, b.id AS tribe_id, b.ethnonym AS tribe_ethnonym, b.primary_occupation AS tribe_primary_occupation
FROM epigraphic_inscriptions a JOIN gaulish_tribes b ON a.gaulish_tribe_id = b.id;
```

| epigraphic_inscription_id | inscription_text | script_type | discovery_location | tribe_id | tribe_ethnonym | tribe_primary_occupation |
|---|---|---|---|---|---|---|
| 100 | distributed-inscript-78 | regional-script-18 | baseline-discover-43 | 1000 | seasonal-ethnonym-17 | composite-primary-39 |
| 101 | baseline-inscript-79 | legacy-script-19 | pilot-discover-44 | 1001 | regional-ethnonym-18 | primary-primary-40 |
| 102 | pilot-inscript-80 | compact-script-20 | extended-discover-45 | 1002 | legacy-ethnonym-19 | adaptive-primary-41 |
| 103 | extended-inscript-81 | composite-script-21 | integrated-discover-46 | 1003 | compact-ethnonym-20 | distributed-primary-42 |

In the first row, `distributed-inscript-78` is tied to `seasonal-ethnonym-17`, whose `composite-primary-39` occupation and `baseline-settleme-37` settlement provide the tribal identity behind this inscription. The second row links `baseline-inscript-79` to `regional-ethnonym-18`, a tribe with `primary-primary-40` occupation and `pilot-settleme-38` settlement.

The view `v_linguistic_analysis_epigraphic_inscription` presents the analytical perspective on inscriptions.

**View `v_linguistic_analysis_epigraphic_inscription`**

```sql
CREATE VIEW v_linguistic_analysis_epigraphic_inscription AS
SELECT a.id, a.methodology, a.slavic_language_basis, a.interpretation_result, b.epigraphic_inscription_id AS inscription_epigraphic_inscription_id, b.inscription_text AS inscription_inscription_text, b.script_type AS inscription_script_type
FROM linguistic_analysises a JOIN epigraphic_inscriptions b ON a.epigraphic_inscription_id = b.epigraphic_inscription_id;
```

| id | methodology | slavic_language_basis | interpretation_result | inscription_epigraphic_inscription_id | inscription_inscription_text | inscription_script_type |
|---|---|---|---|---|---|---|
| 1000 | compact-methodol-68 | legacy-slavic-73 | baseline-interpre-91 | 100 | distributed-inscript-78 | regional-script-18 |
| 1001 | composite-methodol-69 | compact-slavic-74 | pilot-interpre-92 | 101 | baseline-inscript-79 | legacy-script-19 |
| 1002 | primary-methodol-70 | composite-slavic-75 | extended-interpre-93 | 102 | pilot-inscript-80 | compact-script-20 |
| 1003 | adaptive-methodol-71 | primary-slavic-76 | integrated-interpre-94 | 103 | extended-inscript-81 | composite-script-21 |

The first row shows analysis `1000` applied to `distributed-inscript-78`, where the `compact-methodol-68` methodology and `legacy-slavic-73` basis produced `baseline-interpre-91`. The inscription's `regional-script-18` and discovery at `baseline-discover-43` provide the material context. The second row connects analysis `1001` to `baseline-inscript-79`, with `composite-methodol-69` and `compact-slavic-74` yielding `pilot-interpre-92`.

The view `v_linguistic_analysis_toponym` links analyses to the toponyms they address.

**View `v_linguistic_analysis_toponym`**

```sql
CREATE VIEW v_linguistic_analysis_toponym AS
SELECT a.id, a.methodology, a.slavic_language_basis, a.interpretation_result, b.id AS toponym_id, b.name AS toponym_name, b.region AS toponym_region
FROM linguistic_analysises a JOIN toponyms b ON a.toponym_id = b.id;
```

| id | methodology | slavic_language_basis | interpretation_result | toponym_id | toponym_name | toponym_region |
|---|---|---|---|---|---|---|
| 1000 | compact-methodol-68 | legacy-slavic-73 | baseline-interpre-91 | 100 | Extended Review | distributed-region-12 |
| 1001 | composite-methodol-69 | compact-slavic-74 | pilot-interpre-92 | 101 | Pilot Initiative A | baseline-region-13 |
| 1002 | primary-methodol-70 | composite-slavic-75 | extended-interpre-93 | 102 | Baseline Model | pilot-region-14 |
| 1003 | adaptive-methodol-71 | primary-slavic-76 | integrated-interpre-94 | 103 | Distributed Cluster | extended-region-15 |

The first row associates analysis `1000` with `Extended Review`, where the `compact-methodol-68` methodology and `legacy-slavic-73` basis produced `baseline-interpre-91`. The toponym's `primary-slavic-10` root and `baseline-confiden-91` confidence provide the toponymic context. The second row connects analysis `1001` to `Pilot Initiative A`, applying `composite-methodol-69` with `compact-slavic-74` basis to generate `pilot-interpre-92`.

The view `v_linguistic_analysis_historical_document` ties analyses to the documents that report them.

**View `v_linguistic_analysis_historical_document`**

```sql
CREATE VIEW v_linguistic_analysis_historical_document AS
SELECT a.id, a.methodology, a.slavic_language_basis, a.interpretation_result, b.id AS document_id, b.document_title AS document_document_title, b.author AS document_author
FROM linguistic_analysises a JOIN historical_documents b ON a.historical_document_id = b.id;
```

| id | methodology | slavic_language_basis | interpretation_result | document_id | document_document_title | document_author |
|---|---|---|---|---|---|---|
| 1000 | compact-methodol-68 | legacy-slavic-73 | baseline-interpre-91 | 1 | Compact Series | Norma Fisher |
| 1001 | composite-methodol-69 | compact-slavic-74 | pilot-interpre-92 | 2 | Legacy Assessment | Daniel Abbott |
| 1002 | primary-methodol-70 | composite-slavic-75 | extended-interpre-93 | 3 | Regional Survey A | Chris Bennett |
| 1003 | adaptive-methodol-71 | primary-slavic-76 | integrated-interpre-94 | 4 | Seasonal Corridor | Ernest Hemingway |

The first row links analysis `1000` to `Compact Series`, authored by Norma Fisher in year `25`. The document's `distributed-document-96` type and `seasonal-content-41` summary frame the publication context for this analysis. The second row connects analysis `1001` to `Legacy Assessment` by Daniel Abbott, a `baseline-document-97` with `regional-content-42` content.

The view `v_historical_region_toponym_detail` provides a territorial perspective on toponyms.

**View `v_historical_region_toponym_detail`**

```sql
CREATE VIEW v_historical_region_toponym_detail AS
SELECT a.id, a.region_name, a.geographical_bounds, b.id AS toponym_id, b.name AS toponym_name, b.region AS toponym_region
FROM historical_regions a
  JOIN regions_toponyms j ON j.historical_region_id = a.id
  JOIN toponyms b ON b.id = j.toponym_id;
```

| id | region_name | geographical_bounds | toponym_id | toponym_name | toponym_region |
|---|---|---|---|---|---|
| 1 | Distributed Assessment | seasonal-geograph-59 | 100 | Extended Review | distributed-region-12 |
| 1 | Distributed Assessment | seasonal-geograph-59 | 101 | Pilot Initiative A | baseline-region-13 |
| 2 | Adaptive Survey D | regional-geograph-60 | 101 | Pilot Initiative A | baseline-region-13 |
| 2 | Adaptive Survey D | regional-geograph-60 | 102 | Baseline Model | pilot-region-14 |
| 3 | Primary Corridor | legacy-geograph-61 | 102 | Baseline Model | pilot-region-14 |
| 3 | Primary Corridor | legacy-geograph-61 | 103 | Distributed Cluster | extended-region-15 |
| 4 | Composite Series | compact-geograph-62 | 103 | Distributed Cluster | extended-region-15 |
| 4 | Composite Series | compact-geograph-62 | 100 | Extended Review | distributed-region-12 |

The first row places `Extended Review` within `Distributed Assessment`, where the toponym's `primary-slavic-10` root and `baseline-confiden-91` confidence intersect with the region's `pilot-dominant-68` culture and `compact-historic-26` period. The second row situates `Pilot Initiative A` in `Adaptive Survey D`, pairing the `adaptive-slavic-11` root with `extended-dominant-69` cultural dominance.

The view `v_historical_region_gaulish_tribe_detail` offers a territorial view of tribal records.

**View `v_historical_region_gaulish_tribe_detail`**

```sql
CREATE VIEW v_historical_region_gaulish_tribe_detail AS
SELECT a.id, a.region_name, a.geographical_bounds, b.id AS tribe_id, b.ethnonym AS tribe_ethnonym, b.primary_occupation AS tribe_primary_occupation
FROM historical_regions a
  JOIN regions_tribes j ON j.historical_region_id = a.id
  JOIN gaulish_tribes b ON b.id = j.gaulish_tribe_id;
```

| id | region_name | geographical_bounds | tribe_id | tribe_ethnonym | tribe_primary_occupation |
|---|---|---|---|---|---|
| 1 | Distributed Assessment | seasonal-geograph-59 | 1000 | seasonal-ethnonym-17 | composite-primary-39 |
| 1 | Distributed Assessment | seasonal-geograph-59 | 1001 | regional-ethnonym-18 | primary-primary-40 |
| 2 | Adaptive Survey D | regional-geograph-60 | 1001 | regional-ethnonym-18 | primary-primary-40 |
| 2 | Adaptive Survey D | regional-geograph-60 | 1002 | legacy-ethnonym-19 | adaptive-primary-41 |
| 3 | Primary Corridor | legacy-geograph-61 | 1002 | legacy-ethnonym-19 | adaptive-primary-41 |
| 3 | Primary Corridor | legacy-geograph-61 | 1003 | compact-ethnonym-20 | distributed-primary-42 |
| 4 | Composite Series | compact-geograph-62 | 1003 | compact-ethnonym-20 | distributed-primary-42 |
| 4 | Composite Series | compact-geograph-62 | 1000 | seasonal-ethnonym-17 | composite-primary-39 |

The first row associates `Distributed Assessment` with `seasonal-ethnonym-17`, whose `composite-primary-39` occupation and `baseline-settleme-37` settlement are contextualized by the region's `pilot-dominant-68` culture and `compact-historic-26` period. The second row links `Adaptive Survey D` to `regional-ethnonym-18`, a tribe with `primary-primary-40` occupation and `pilot-settleme-38` settlement.

The view `v_historical_region_epigraphic_inscription` situates inscriptions within their regions.

**View `v_historical_region_epigraphic_inscription`**

```sql
CREATE VIEW v_historical_region_epigraphic_inscription AS
SELECT a.id, a.region_name, a.geographical_bounds, a.dominant_culture, b.epigraphic_inscription_id AS inscription_epigraphic_inscription_id, b.inscription_text AS inscription_inscription_text, b.script_type AS inscription_script_type
FROM historical_regions a JOIN epigraphic_inscriptions b ON a.epigraphic_inscription_id = b.epigraphic_inscription_id;
```

| id | region_name | geographical_bounds | dominant_culture | inscription_epigraphic_inscription_id | inscription_inscription_text | inscription_script_type |
|---|---|---|---|---|---|---|
| 1 | Distributed Assessment | seasonal-geograph-59 | pilot-dominant-68 | 100 | distributed-inscript-78 | regional-script-18 |
| 2 | Adaptive Survey D | regional-geograph-60 | extended-dominant-69 | 101 | baseline-inscript-79 | legacy-script-19 |
| 3 | Primary Corridor | legacy-geograph-61 | integrated-dominant-70 | 102 | pilot-inscript-80 | compact-script-20 |
| 4 | Composite Series | compact-geograph-62 | seasonal-dominant-71 | 103 | extended-inscript-81 | composite-script-21 |

The first row places `distributed-inscript-78` in `Distributed Assessment`, where the inscription's `regional-script-18` and `baseline-decipher-85` meaning are framed by the region's `pilot-dominant-68` culture and `compact-historic-26` period. The second row connects `baseline-inscript-79` to `Adaptive Survey D`, pairing `legacy-script-19` with `extended-dominant-69` cultural dominance.

The view `v_historical_document_linguistic_analysis` links documents to the analyses they contain.

**View `v_historical_document_linguistic_analysis`**

```sql
CREATE VIEW v_historical_document_linguistic_analysis AS
SELECT a.id, a.document_title, a.author, a.publication_year, b.id AS analysis_id, b.methodology AS analysis_methodology, b.slavic_language_basis AS analysis_slavic_language_basis
FROM historical_documents a JOIN linguistic_analysises b ON a.linguistic_analysis_id = b.id;
```

| id | document_title | author | publication_year | analysis_id | analysis_methodology | analysis_slavic_language_basis |
|---|---|---|---|---|---|---|
| 1 | Compact Series | Norma Fisher | 25 | 1000 | compact-methodol-68 | legacy-slavic-73 |
| 2 | Legacy Assessment | Daniel Abbott | 33 | 1001 | composite-methodol-69 | compact-slavic-74 |
| 3 | Regional Survey A | Chris Bennett | 41 | 1002 | primary-methodol-70 | composite-slavic-75 |
| 4 | Seasonal Corridor | Ernest Hemingway | 49 | 1003 | adaptive-methodol-71 | primary-slavic-76 |

The first row associates `Compact Series` with analysis `1000`, where the `compact-methodol-68` methodology and `legacy-slavic-73` basis produced `baseline-interpre-91`. The document's `distributed-document-96` type and `seasonal-content-41` summary provide the publication context. The second row connects `Legacy Assessment` to analysis `1001`, applying `composite-methodol-69` with `compact-slavic-74` basis to yield `pilot-interpre-92`.

The view `v_historical_document_toponym` ties documents to the toponyms they reference.

**View `v_historical_document_toponym`**

```sql
CREATE VIEW v_historical_document_toponym AS
SELECT a.id, a.document_title, a.author, a.publication_year, b.id AS toponym_id, b.name AS toponym_name, b.region AS toponym_region
FROM historical_documents a JOIN toponyms b ON a.toponym_id = b.id;
```

| id | document_title | author | publication_year | toponym_id | toponym_name | toponym_region |
|---|---|---|---|---|---|---|
| 1 | Compact Series | Norma Fisher | 25 | 100 | Extended Review | distributed-region-12 |
| 2 | Legacy Assessment | Daniel Abbott | 33 | 101 | Pilot Initiative A | baseline-region-13 |
| 3 | Regional Survey A | Chris Bennett | 41 | 102 | Baseline Model | pilot-region-14 |
| 4 | Seasonal Corridor | Ernest Hemingway | 49 | 103 | Distributed Cluster | extended-region-15 |

The first row links `Compact Series` to `Extended Review`, where the document's `distributed-document-96` type and `seasonal-content-41` summary frame the scholarly treatment of a toponym bearing the `primary-slavic-10` root and `baseline-confiden-91` confidence. The second row connects `Legacy Assessment` to `Pilot Initiative A`, pairing `baseline-document-97` content with the `adaptive-slavic-11` root.

The view `v_historical_document_epigraphic_inscription` connects documents to the inscriptions they discuss.

**View `v_historical_document_epigraphic_inscription`**

```sql
CREATE VIEW v_historical_document_epigraphic_inscription AS
SELECT a.id, a.document_title, a.author, a.publication_year, b.epigraphic_inscription_id AS inscription_epigraphic_inscription_id, b.inscription_text AS inscription_inscription_text, b.script_type AS inscription_script_type
FROM historical_documents a JOIN epigraphic_inscriptions b ON a.epigraphic_inscription_id = b.epigraphic_inscription_id;
```

| id | document_title | author | publication_year | inscription_epigraphic_inscription_id | inscription_inscription_text | inscription_script_type |
|---|---|---|---|---|---|---|
| 1 | Compact Series | Norma Fisher | 25 | 100 | distributed-inscript-78 | regional-script-18 |
| 2 | Legacy Assessment | Daniel Abbott | 33 | 101 | baseline-inscript-79 | legacy-script-19 |
| 3 | Regional Survey A | Chris Bennett | 41 | 102 | pilot-inscript-80 | compact-script-20 |
| 4 | Seasonal Corridor | Ernest Hemingway | 49 | 103 | extended-inscript-81 | composite-script-21 |

The first row associates `Compact Series` with `distributed-inscript-78`, where the document's `distributed-document-96` type and `seasonal-content-41` summary frame the scholarly treatment of an inscription written in `regional-script-18` and deciphered as `baseline-decipher-85`. The second row links `Legacy Assessment` to `baseline-inscript-79`, a `legacy-script-19` inscription with meaning `pilot-decipher-86`.

### Synthesis

The corpus presents a tightly interwoven network of Gaulish tribal identities, place names, inscribed monuments, linguistic analyses, territorial boundaries, and scholarly documents. Each entity carries foreign-key references that anchor it to related records, and the junction tables provide explicit mappings for the many-to-many relationships that arise when tribes share toponyms or regions overlap across multiple tribal territories. The joined views demonstrate how these relationships can be queried to answer specific research questions: which inscriptions belong to which tribes, how toponyms distribute across regions, what analyses support particular epigraphic readings, and which documents report which findings. Together, these records form a structured evidentiary base for reconstructing the cultural and linguistic landscape of ancient Gaulish territories.