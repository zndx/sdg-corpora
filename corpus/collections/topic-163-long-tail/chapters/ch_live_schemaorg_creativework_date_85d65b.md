---
chapter_id: ch_live_schemaorg_creativework_date_85d65b
topic_id: 163
family: 07_long_tail
cited_terms: ['schemaorg_creativework_date', 'cardinality_exactly_one_generic', 'schemaorg_review_rating']
model: engine-refine
---

In governed information systems, every assertable fact must be anchored to a stable identifier that survives renaming, republication, and cross-system reconciliation. Identifiers such as DATE-0001, RATI-0003, and GENE-0002 function not as display labels but as durable keys within a compliance boundary: they permit auditors to trace a specific publication date, review score, or cardinality rule back to exactly one row in the authoritative registry without conflating homonymous assets. The human-readable descriptors that accompany those keys—The Great Gatsby, Canon EOS R5, Proof of Stake Paper—belong to the descriptive layer and may change with editorial convention; the identifier remains the invariant handle through which lineage, accountability, and constraint enforcement are applied. Where interpretation depends on correlating registry facts with operational context, results relate only to the entities keyed and must be read in light of the governing predicates that bind them.

**t_cardinality_exactly_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | ExclusiveOwner | CoreService |
| GENE-0002 | ExclusiveOwner | SingleSource |
| GENE-0003 | StrictParent | DesignatedOwner |
| GENE-0004 | StrictParent | SourceSystem |
| GENE-0005 | ExclusiveOwner | TargetNode |

Subject and target articulate the directional semantics of an association: the subject is the entity whose state or obligation is being characterized, and the target is the value, resource, or dependent record to which that characterization refers. In a publication-date assertion, schemaorg_id DATE-0006 (The Great Gatsby) stands as subject while date_published_id DATE-0004 (2024-05-11) stands as target; in a rating linkage, schemaorg_id RATI-0001 (Proof of Stake Paper) is subject to review_rating_id RATI-0001 (3.2 points). The asymmetry is deliberate. Subjects carry governance identity; targets supply measurable or temporal payload. Reversing that polarity would break audit trails, because the same target—DATE-0001 encoding 2024-05-11—may legitimately attach to more than one subject under different roles, as when DATE-0005 (Sentinel-2 Imagery Index and iPhone 15 Pro) both reference DATE-0001 while remaining distinct governed assets.

**t_schemaorg_creativework_date_date_published**

| id | date_published |
| --- | --- |
| DATE-0001 | 2024-05-11 |
| DATE-0002 | 2022-11-05 |
| DATE-0003 | 2023-12-01 |
| DATE-0004 | 2023-04-12 |
| DATE-0005 | 2023-12-01 |
| DATE-0006 | 2024-01-18 |

**t_schemaorg_creativework_date__date_published**

| id | schemaorg_id | date_published_id | role |
| --- | --- | --- | --- |
| DATE-0001 | DATE-0006 | DATE-0004 | owner |
| DATE-0002 | DATE-0006 | DATE-0001 | contributor |
| DATE-0003 | DATE-0005 | DATE-0001 | contributor |
| DATE-0004 | DATE-0005 | DATE-0002 | observer |
| DATE-0005 | DATE-0005 | DATE-0005 | owner |
| DATE-0006 | DATE-0003 | DATE-0005 | owner |
| DATE-0007 | DATE-0004 | DATE-0004 | observer |
| DATE-0008 | DATE-0004 | DATE-0004 | owner |

Role qualifies the nature of the subject–target bond and determines which actor may assert, inherit, or merely observe the relationship without acquiring ownership rights. An owner role on DATE-0001 binds The Great Gatsby to its publication date as the exclusive asserting party; contributor roles on DATE-0002 and DATE-0003 attach Canon EOS R5 and Sentinel-2 Imagery Index to alternate date records (DATE-0001 and DATE-0002 respectively) without displacing the owner’s primacy; observer on DATE-0004 records iPhone 15 Pro’s non-proprietary visibility of 2022-11-05. The rating domain exhibits the same discriminant: reviewer on RATI-0001 and RATI-0002 governs how Proof of Stake Paper and Star Wars Episode IV relate to their scores, contributor on RATI-0003 permits LoRaWAN Sensor Spec to supply a 9.1 rating without claiming review authority, and reviewer again on RATI-0004 positions Tesla Model 3 against a 4.0 average. Roles are therefore normative, not decorative; they tell compliance officers whether a linkage creates obligation, delegation, or read-only attestation.

Cardinality predicates sit above individual associations and declare how many role-qualified links of a given class may exist for a governed subject. GENE-0001 and GENE-0002 impose ExclusiveOwner against CoreService and SingleSource, meaning at most one owner-typed binding may hold for each protected subject class—mirroring the singular owner assertion that ties The Great Gatsby to 2024-05-11. GENE-0003 and GENE-0004 apply StrictParent to DesignatedOwner and SourceSystem, requiring that contributor and observer relationships resolve upward to a recognized parent authority rather than floating as peer assertions. When Sentinel-2 Imagery Index and iPhone 15 Pro both reference DATE-0001 under contributor and observer roles respectively, StrictParent ensures those secondary linkages remain subordinate to the owner’s record rather than competing as parallel sources of truth.

Operational practice treats the quartet—identifier, subject, target, role—as a minimum viable provenance tuple for any cross-table claim. Registration begins by minting or resolving an identifier; assertion pairs a subject key with a target key; role stamps the legal character of that pair; cardinality rules validate the assertion against enterprise policy before commit. A reviewer examining Canon EOS R5 should expect to find DATE-0002 as target with contributor role, not owner—mis-typed roles surface immediately as policy violations under ExclusiveOwner. Likewise, a 100 percentile score attached to Star Wars Episode IV through RATI-0007 is intelligible only when RATI-0002’s reviewer role is honored: the target encodes magnitude, the role encodes who may vouch for it.

Interpretation guidance for registry consumers parallels clinical correlation clauses in formal test reporting: isolated targets—2023-12-01, 9.1 rating, 4.0 average—do not stand alone as organizational facts until joined through their subject identifiers and role qualifiers. Cross-domain reads must preserve key integrity across junction rows DATE-0001 through DATE-0004 and RATI-0001 through RATI-0004, recognizing that schemaorg_id and review_rating_id reference foreign governed entities (DATE-0005, DATE-0006, RATI-0004, RATI-0005, RATI-0006) not fully enumerated in every excerpt. Where cardinality, role, and subject–target direction align, the registry yields defensible evidence suitable for audit, publication compliance, and downstream API serialization; where any element is missing or inverted, the same values become ambiguous testimony—usable descriptively, but unfit for enforcement until reconciled against the authoritative key and its governing predicate set.

**t_schemaorg_creativework_date**

| id | schemaorg |
| --- | --- |
| DATE-0001 | The Great Gatsby |
| DATE-0002 | Canon EOS R5 |
| DATE-0003 | Sentinel-2 Imagery Index |
| DATE-0004 | iPhone 15 Pro |
| DATE-0005 | Canon EOS R5 |
| DATE-0006 | Star Wars Episode IV |

**t_schemaorg_review_rating**

| id | schemaorg |
| --- | --- |
| RATI-0001 | Proof of Stake Paper |
| RATI-0002 | Star Wars Episode IV |
| RATI-0003 | LoRaWAN Sensor Spec |
| RATI-0004 | Tesla Model 3 |
| RATI-0005 | Honda Civic |
| RATI-0006 | Honda Civic |

**t_schemaorg_review_rating_review_rating**

| id | review_rating |
| --- | --- |
| RATI-0001 | 3.2 points |
| RATI-0002 | 100 percentile |
| RATI-0003 | 9.1 rating |
| RATI-0004 | 4.0 average |
| RATI-0005 | 47 score |
| RATI-0006 | 5.0 scale |
| RATI-0007 | 8.7 out of 10 |
| RATI-0008 | 88 out of 100 |

**t_schemaorg_review_rating__review_rating**

| id | schemaorg_id | review_rating_id | role |
| --- | --- | --- | --- |
| RATI-0001 | RATI-0004 | RATI-0001 | reviewer |
| RATI-0002 | RATI-0006 | RATI-0007 | reviewer |
| RATI-0003 | RATI-0001 | RATI-0004 | contributor |
| RATI-0004 | RATI-0005 | RATI-0003 | reviewer |
| RATI-0005 | RATI-0006 | RATI-0001 | owner |
| RATI-0006 | RATI-0006 | RATI-0007 | owner |
| RATI-0007 | RATI-0001 | RATI-0008 | owner |
| RATI-0008 | RATI-0006 | RATI-0008 | observer |