---
chapter_id: ch_live_schemaorg_place_longitude_f65930
topic_id: 186
family: 07_long_tail
cited_terms: ['schemaorg_place_longitude', 'schemaorg_product_brand', 'schemaorg_product_price']
model: engine-refine
---

In any structured data governance framework, the identifier serves as the immutable anchor for every entity, ensuring that records can be traced, reconciled, and audited across systems. Whether a place such as the Mauna Loa Observatory (LONG-0002) or a product like the iPhone 15 Pro Max (PRIC-0003), each receives a scoped, human-readable key that remains constant regardless of how its attributes evolve. This discipline prevents the drift that plagues systems relying on mutable names or composite keys, and it enables reliable joins across fact and dimension tables without ambiguity.

**t_schemaorg_place_longitude**

| id | schemaorg |
| --- | --- |
| LONG-0001 | NOAAStationAlpha |
| LONG-0002 | MaunaLoaObservatory |
| LONG-0003 | SydneyHarbourBridge |
| LONG-0004 | BlackRockForest |
| LONG-0005 | CERNControlCenter |
| LONG-0006 | Dyson V15 |
| LONG-0007 | NOAAStationAlpha |

**t_schemaorg_place_longitude_longitude**

| id | longitude |
| --- | --- |
| LONG-0001 | -27.9692 |
| LONG-0002 | 2.2945 |
| LONG-0003 | -3.3869 |
| LONG-0004 | 2.2945 |
| LONG-0005 | -27.0366 |
| LONG-0006 | -27.0366 |

**t_schemaorg_product_price**

| id | schemaorg |
| --- | --- |
| PRIC-0001 | ISSOrbitModule |
| PRIC-0002 | PaloAltoResearchCenter |
| PRIC-0003 | iPhone 15 Pro Max |
| PRIC-0004 | MountEverestBase |
| PRIC-0005 | HooverDam |
| PRIC-0006 | Dyson V15 |

**t_schemaorg_product_price_price**

| id | price |
| --- | --- |
| PRIC-0001 | 1599 GBP |
| PRIC-0002 | 199.99 CAD |
| PRIC-0003 | $449.95 |
| PRIC-0004 | $349.00 |
| PRIC-0005 | $349.00 |
| PRIC-0006 | $349.00 |
| PRIC-0007 | 1599 GBP |

Brand taxonomy and versioning form the backbone of asset classification and lifecycle management. The brand dimension stores a label—Brand Label 01 through Brand Label 04—and a category assignment such as Brand Category 01 or Brand Category 03, providing a two-tier classification that separates human-readable naming from structural grouping. The fact table ties each brand key, for instance BRAN-0003, to a concrete size in bytes—895,265,030 for one record, 114,301,972 for another—and a version number ranging from 3 to 8. These version integers signal the iteration state of the underlying schema or dataset, allowing operators to distinguish between a version 3 snapshot and a version 8 revision of the same brand asset, while the size metric supports capacity planning and cost allocation.

**fact_schemaorg**

| id | brand_key | size_bytes | version |
| --- | --- | --- | --- |
| BRAN-0001 | BRAN-0003 | 895265030 | 3 |
| BRAN-0002 | BRAN-0005 | 114301972 | 5 |
| BRAN-0003 | BRAN-0004 | 338701831 | 4 |
| BRAN-0004 | BRAN-0002 | 998785819 | 8 |

Subject, target, and role together describe the semantics of relationships between entities, particularly in the associative tables that resolve many-to-many mappings. In the longitude association, a schemaorg entity identified as LONG-0005 (the subject) is linked to a longitude record LONG-0002 (the target) under the role of reviewer, whereas LONG-0003 appears as both subject and target in different rows, sometimes as owner and sometimes as contributor. The same pattern holds for pricing: PRIC-0001 acts as subject linked to PRIC-0001 as target with the reviewer role, while PRIC-0003 assumes the contributor role when linked to PRIC-0007. These role labels—reviewer, contributor, owner—encode the nature of the relationship, making it possible to audit not just what is connected but why and by whom.

**t_schemaorg_place_longitude__longitude**

| id | schemaorg_id | longitude_id | role |
| --- | --- | --- | --- |
| LONG-0001 | LONG-0005 | LONG-0002 | reviewer |
| LONG-0002 | LONG-0007 | LONG-0004 | contributor |
| LONG-0003 | LONG-0003 | LONG-0001 | owner |
| LONG-0004 | LONG-0003 | LONG-0003 | owner |
| LONG-0005 | LONG-0002 | LONG-0003 | reviewer |
| LONG-0006 | LONG-0001 | LONG-0003 | contributor |
| LONG-0007 | LONG-0004 | LONG-0002 | reviewer |
| LONG-0008 | LONG-0007 | LONG-0006 | contributor |

**t_schemaorg_product_price__price**

| id | schemaorg_id | price_id | role |
| --- | --- | --- | --- |
| PRIC-0001 | PRIC-0001 | PRIC-0001 | reviewer |
| PRIC-0002 | PRIC-0003 | PRIC-0007 | reviewer |
| PRIC-0003 | PRIC-0003 | PRIC-0003 | contributor |
| PRIC-0004 | PRIC-0001 | PRIC-0007 | contributor |
| PRIC-0005 | PRIC-0006 | PRIC-0002 | contributor |
| PRIC-0006 | PRIC-0002 | PRIC-0003 | contributor |
| PRIC-0007 | PRIC-0001 | PRIC-0006 | reviewer |
| PRIC-0008 | PRIC-0004 | PRIC-0006 | owner |

The misc field, realized here as the brand label, complements the category by carrying the display-oriented name that end users and reporting tools reference. While the category provides a stable grouping for aggregation and filtering, the label captures the human-facing identity that may change more frequently without affecting downstream joins. Together with the identifier, the label and category form a triad that supports both machine-readable integrity and human-readable clarity.

**dim_brand**

| id | brand_label | brand_category |
| --- | --- | --- |
| BRAN-0001 | Brand Label 01 | Brand Category 01 |
| BRAN-0002 | Brand Label 02 | Brand Category 02 |
| BRAN-0003 | Brand Label 03 | Brand Category 03 |
| BRAN-0004 | Brand Label 04 | Brand Category 04 |
| BRAN-0005 | Brand Label 05 | Brand Category 05 |
| BRAN-0006 | Brand Label 06 | Brand Category 06 |

Size bytes and version numbers, though seemingly operational, carry compliance and financial weight. A brand asset recorded at 998,785,819 bytes and version 8 represents a materially different footprint and maturity state than one at 338,701,831 bytes and version 4. Tracking these metrics enables organizations to enforce storage policies, calculate licensing costs, and demonstrate due diligence in data lifecycle management. When combined with the role-annotated relationships that tie schemaorg entities to their geographic coordinates and pricing information, the full picture emerges: a governed data fabric where every attribute, association, and version is traceable to its source and purpose.