## The Architecture of Theological Interpretation

Theological scholarship operates as a structured discipline of interpretation, where sacred texts, doctrinal claims, covenantal frameworks, and human lineages intersect in systematic ways. Practitioners of this field navigate a landscape of competing and complementary readings, each anchored to specific biblical passages and each carrying implications for how communities understand their place within a broader theological narrative. The records that follow document this ecosystem: interpretations that propose readings of scripture, biblical texts that serve as the raw material of exegesis, theological claims that crystallize doctrinal positions, covenants that bind promises to requirements, and humanities that trace the genealogical and moral contours of the communities involved. Understanding how these entities relate requires examining both the individual records and the composite views that join them into coherent analytical lenses.

**Table `interpretations`**

| interpretation_id | interpretation_name | primary_subject | is_mainstream | is_author_preferred | biblical_text_id | theological_claim_id | contradicts_interpretation_id |
|---|---|---|---|---|---|---|---|
| 1 | Adaptive Assessment | composite-primary-93 | false | Sarah Villanueva | 1 | 100 | 1 |
| 2 | Primary Survey | primary-primary-94 | true | Chloe Foley | 2 | 101 | 2 |
| 3 | Composite Corridor D | adaptive-primary-95 | false | Steve Harvey | 3 | 102 | 3 |
| 4 | Compact Series | distributed-primary-96 | true | Laurie Wallace | 4 | 103 | 4 |

The interpretations table captures the primary readings that scholars and communities advance about scripture. Each record carries an `interpretation_id`, a human-readable `interpretation_name`, and a `primary_subject` that identifies the thematic focus of the reading. The boolean flags `is_mainstream` and `is_author_preferred` distinguish between widely accepted positions and those championed by individual authors. The author attribution appears in the `is_author_preferred` column, where names such as Sarah Villanueva, Chloe Foley, Steve Harvey, and Laurie Wallace mark the intellectual provenance of each reading. Foreign keys `biblical_text_id` and `theological_claim_id` anchor each interpretation to a specific scripture passage and a specific doctrinal claim, while `contradicts_interpretation_id` creates a self-referential chain where each interpretation points to another it opposes—row 1 contradicts itself, row 2 contradicts itself, and so on, suggesting a recursive structure of internal critique. The four recorded interpretations—Adaptive Assessment, Primary Survey, Composite Corridor D, and Compact Series—span a spectrum from non-mainstream to mainstream positions, with authors distributed across the full range.

**Table `biblical_texts`**

| id | text_id | book_name | chapter_number | verse_range | language | is_historic_narrative | interpretation_id | theological_claim_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor | 49 | primary-verse-70 | composite-language-45 | false | 1 | 100 |
| 2 | 7731874 | Legacy Series | 60 | adaptive-verse-71 | primary-language-46 | true | 2 | 101 |
| 3 | 5917299 | Regional Assessment A | 71 | distributed-verse-72 | adaptive-language-47 | false | 3 | 102 |
| 4 | 611500 | Seasonal Survey | 82 | baseline-verse-73 | distributed-language-48 | true | 4 | 103 |

Biblical texts form the foundational layer upon which interpretations are built. Each entry in this table carries a UUID-style `text_id`, a `book_name` that identifies the scriptural source, and precise locators through `chapter_number` and `verse_range`. The `language` column records the linguistic register of the passage, while `is_historic_narrative` distinguishes narrative texts from other genres. The four recorded texts—Compact Corridor (chapter 49, verse primary-verse-70), Legacy Series (chapter 60, verse adaptive-verse-71), Regional Assessment A (chapter 71, verse distributed-verse-72), and Seasonal Survey (chapter 82, verse baseline-verse-73)—represent a diverse corpus spanning both historic narratives and other forms. The foreign keys `interpretation_id` and `theological_claim_id` create bidirectional links back to the interpretive and doctrinal layers, ensuring that every text can be traced to the claims and readings it supports.

**Table `theological_claims`**

| id | claim_id | claim_text | claim_type | is_covenantal | is_eschatological | biblical_text_id | is_contradicted_by_biblical_text_id | interpretation_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 100 | 6969435 | pilot-claim-56 | baseline-claim-31 | false | true | 1 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | 4463668 | extended-claim-57 | pilot-claim-32 | true | false | 2 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 | extended-claim-33 | false | true | 3 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | 727058 | seasonal-claim-59 | integrated-claim-34 | true | false | 4 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Theological claims distill doctrinal positions into discrete, trackable assertions. Each claim carries a `claim_id`, a `claim_text` that serves as a short label, and a `claim_type` that categorizes its doctrinal family. The boolean columns `is_covenantal` and `is_eschatological` mark whether a claim pertains to covenantal theology or eschatological (end-times) theology, creating a two-dimensional typology across the four records. The `biblical_text_id` and `is_contradicted_by_biblical_text_id` columns link claims to their scriptural grounding and to texts that challenge them, while `interpretation_id` connects each claim to the interpretive framework that advances it. Timestamps `created_at` and `updated_at` provide an audit trail of doctrinal development. The four claims—pilot-claim-56, extended-claim-57, integrated-claim-58, and seasonal-claim-59—span claim types from baseline-claim-31 through integrated-claim-34, with covenantal and eschatological attributes alternating across the set.

**Table `covenants`**

| id | covenant_id | covenant_name | is_unilateral | is_bilateral | promises | requirements | humanity_id | theological_claim_id | biblical_text_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | false | false | pilot-promises-38 | composite-requirem-15 | 1 | 100 | 1 |
| 2 | 195361 | Pilot Cluster A | true | true | extended-promises-39 | primary-requirem-16 | 2 | 101 | 2 |
| 3 | 10207171 | Baseline Review | false | false | integrated-promises-40 | adaptive-requirem-17 | 3 | 102 | 3 |
| 4 | 168555 | Distributed Initiative | true | true | seasonal-promises-41 | distributed-requirem-18 | 4 | 103 | 4 |

Covenants represent the binding agreements that structure the relationship between divine promises and human obligations. Each covenant record carries a UUID `covenant_id`, a `covenant_name`, and boolean flags `is_unilateral` and `is_bilateral` that classify the covenant's structural type. The `promises` and `requirements` columns enumerate the specific commitments and duties associated with each covenant. Foreign keys `humanity_id`, `theological_claim_id`, and `biblical_text_id` tie each covenant to a specific human lineage, a doctrinal claim, and a scriptural text, creating a three-way anchor that situates the covenant within the broader theological ecosystem. The four recorded covenants—Extended Model, Pilot Cluster A, Baseline Review, and Distributed Initiative—present a mix of unilateral and bilateral structures, with promise and requirement labels such as pilot-promises-38 and composite-requirem-15 marking their distinctive character.

**Table `humanities`**

| id | humanity_id | lineage | is_godly | is_ungodly | is_covenant_people | covenant_id | theological_claim_id | intermarries_with_humanity_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 9424907 | compact-lineage-44 | true | true | true | 1 | 100 | 1 |
| 2 | 2986230 | composite-lineage-45 | false | false | false | 2 | 101 | 2 |
| 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 | true | true | true | 3 | 102 | 3 |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 | false | false | false | 4 | 103 | 4 |

The humanities table documents the human communities and lineages that participate in the theological narrative. Each record carries a `humanity_id`, a `lineage` name that identifies the community's genealogical or cultural identity, and boolean flags `is_godly`, `is_ungodly`, and `is_covenant_people` that classify the community's moral and covenantal status. The foreign keys `covenant_id` and `theological_claim_id` link each humanity to a specific covenant and doctrinal claim, while `intermarries_with_humanity_id` creates a self-referential network showing inter-community relationships. The four recorded lineages—compact-lineage-44, composite-lineage-45, primary-lineage-46, and adaptive-lineage-47—present alternating patterns of godly and ungodly classification, with covenant people status also alternating across the set.

The views that follow synthesize these base tables into analytical lenses, each answering a specific question about the relationships between entities.

**View `vw_interpretation_biblical_text`**

```sql
CREATE VIEW vw_interpretation_biblical_text AS
SELECT a.interpretation_id, a.interpretation_name, a.primary_subject, a.is_mainstream, b.id AS text_id, b.text_id AS text_text_id, b.book_name AS text_book_name
FROM interpretations a JOIN biblical_texts b ON a.biblical_text_id = b.id;
```

| interpretation_id | interpretation_name | primary_subject | is_mainstream | text_id | text_text_id | text_book_name |
|---|---|---|---|---|---|---|
| 1 | Adaptive Assessment | composite-primary-93 | false | 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor |
| 2 | Primary Survey | primary-primary-94 | true | 2 | 7731874 | Legacy Series |
| 3 | Composite Corridor D | adaptive-primary-95 | false | 3 | 5917299 | Regional Assessment A |
| 4 | Compact Series | distributed-primary-96 | true | 4 | 611500 | Seasonal Survey |

This view joins interpretations with biblical texts, answering the question: which scripture passages does each interpretation engage? The result pairs each interpretation with the book name and structural identifiers of its source text. Row 1 shows that Adaptive Assessment engages the Compact Corridor (text UUID 6a4248dc-8fc0-11eb-924d-9cd76263cbd0), while row 2 reveals that Primary Survey draws from the Legacy Series. The view preserves the interpretation's metadata—its name, primary subject, and mainstream status—alongside the text's identifiers, enabling practitioners to trace interpretive claims directly to their scriptural anchors.

**View `vw_interpretation_theological_claim`**

```sql
CREATE VIEW vw_interpretation_theological_claim AS
SELECT a.interpretation_id, a.interpretation_name, a.primary_subject, a.is_mainstream, b.id AS claim_id, b.claim_id AS claim_claim_id, b.claim_text AS claim_claim_text
FROM interpretations a JOIN theological_claims b ON a.theological_claim_id = b.id;
```

| interpretation_id | interpretation_name | primary_subject | is_mainstream | claim_id | claim_claim_id | claim_claim_text |
|---|---|---|---|---|---|---|
| 1 | Adaptive Assessment | composite-primary-93 | false | 100 | 6969435 | pilot-claim-56 |
| 2 | Primary Survey | primary-primary-94 | true | 101 | 4463668 | extended-claim-57 |
| 3 | Composite Corridor D | adaptive-primary-95 | false | 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 |
| 4 | Compact Series | distributed-primary-96 | true | 103 | 727058 | seasonal-claim-59 |

This view connects interpretations to their supporting theological claims, answering: which doctrinal position does each interpretation advance? The join produces rows where each interpretation is paired with the claim text, claim type, and covenantal and eschatological flags of its associated claim. Row 1 links Adaptive Assessment to pilot-claim-56 (a baseline-claim-31 type that is not covenantal but is eschatological), while row 2 connects Primary Survey to extended-claim-57 (an extended-claim-32 type that is covenantal but not eschatological). This view enables practitioners to assess whether interpretations cluster around particular claim types or theological dimensions.

**View `vw_interpretation_interpretation`**

```sql
CREATE VIEW vw_interpretation_interpretation AS
SELECT a.interpretation_id, a.interpretation_name, a.primary_subject, a.is_mainstream, b.interpretation_id AS interpretation_interpretation_id, b.interpretation_name AS interpretation_interpretation_name, b.primary_subject AS interpretation_primary_subject
FROM interpretations a JOIN interpretations b ON a.contradicts_interpretation_id = b.interpretation_id;
```

| interpretation_id | interpretation_name | primary_subject | is_mainstream | interpretation_interpretation_id | interpretation_interpretation_name | interpretation_primary_subject |
|---|---|---|---|---|---|---|
| 1 | Adaptive Assessment | composite-primary-93 | false | 1 | Adaptive Assessment | composite-primary-93 |
| 2 | Primary Survey | primary-primary-94 | true | 2 | Primary Survey | primary-primary-94 |
| 3 | Composite Corridor D | adaptive-primary-95 | false | 3 | Composite Corridor D | adaptive-primary-95 |
| 4 | Compact Series | distributed-primary-96 | true | 4 | Compact Series | distributed-primary-96 |

This self-join view reveals the contradiction network among interpretations, answering: which interpretations oppose which others? The join matches each interpretation's `contradicts_interpretation_id` to the `interpretation_id` of the target, producing rows that pair the contradicting interpretation with the contradicted one. In the current data, each interpretation contradicts itself—row 1's Adaptive Assessment points to interpretation 1, row 2's Primary Survey points to interpretation 2—suggesting either a data artifact or a deliberate structure of self-referential critique. The view preserves both the source and target interpretation names and metadata, enabling practitioners to map the topology of interpretive conflict.

**View `vw_biblical_text_interpretation`**

```sql
CREATE VIEW vw_biblical_text_interpretation AS
SELECT a.id, a.text_id, a.book_name, a.chapter_number, b.interpretation_id AS interpretation_interpretation_id, b.interpretation_name AS interpretation_interpretation_name, b.primary_subject AS interpretation_primary_subject
FROM biblical_texts a JOIN interpretations b ON a.interpretation_id = b.interpretation_id;
```

| id | text_id | book_name | chapter_number | interpretation_interpretation_id | interpretation_interpretation_name | interpretation_primary_subject |
|---|---|---|---|---|---|---|
| 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor | 49 | 1 | Adaptive Assessment | composite-primary-93 |
| 2 | 7731874 | Legacy Series | 60 | 2 | Primary Survey | primary-primary-94 |
| 3 | 5917299 | Regional Assessment A | 71 | 3 | Composite Corridor D | adaptive-primary-95 |
| 4 | 611500 | Seasonal Survey | 82 | 4 | Compact Series | distributed-primary-96 |

This view reverses the perspective of the interpretation-to-text join, answering: which interpretations are associated with each biblical text? The result pairs each text's identifiers and metadata with the interpretation that engages it. Row 1 shows that Compact Corridor is interpreted by Adaptive Assessment (a non-mainstream reading with primary subject composite-primary-93), while row 4 reveals that Seasonal Survey receives the Compact Series interpretation (a mainstream reading by Laurie Wallace). This inverted view is useful for practitioners who begin with a scripture passage and seek to understand the range of interpretive responses it has generated.

**View `vw_biblical_text_theological_claim`**

```sql
CREATE VIEW vw_biblical_text_theological_claim AS
SELECT a.id, a.text_id, a.book_name, a.chapter_number, b.id AS claim_id, b.claim_id AS claim_claim_id, b.claim_text AS claim_claim_text
FROM biblical_texts a JOIN theological_claims b ON a.theological_claim_id = b.id;
```

| id | text_id | book_name | chapter_number | claim_id | claim_claim_id | claim_claim_text |
|---|---|---|---|---|---|---|
| 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor | 49 | 100 | 6969435 | pilot-claim-56 |
| 2 | 7731874 | Legacy Series | 60 | 101 | 4463668 | extended-claim-57 |
| 3 | 5917299 | Regional Assessment A | 71 | 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 |
| 4 | 611500 | Seasonal Survey | 82 | 103 | 727058 | seasonal-claim-59 |

This view links biblical texts to their associated theological claims, answering: which doctrinal positions are grounded in each scripture passage? The join produces rows pairing each text's identifiers with the claim text, claim type, and theological flags of its linked claim. Row 1 connects Compact Corridor to pilot-claim-56 (a non-covenantal, eschatological baseline claim), while row 2 links Legacy Series to extended-claim-57 (a covenantal, non-eschatological extended claim). The alternating pattern of covenantal and eschatological attributes across the four rows suggests a deliberate balancing of theological dimensions across the scriptural corpus.

**View `vw_theological_claim_biblical_text`**

```sql
CREATE VIEW vw_theological_claim_biblical_text AS
SELECT a.id, a.claim_id, a.claim_text, a.claim_type, b.id AS text_id, b.text_id AS text_text_id, b.book_name AS text_book_name
FROM theological_claims a JOIN biblical_texts b ON a.biblical_text_id = b.id;
```

| id | claim_id | claim_text | claim_type | text_id | text_text_id | text_book_name |
|---|---|---|---|---|---|---|
| 100 | 6969435 | pilot-claim-56 | baseline-claim-31 | 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor |
| 101 | 4463668 | extended-claim-57 | pilot-claim-32 | 2 | 7731874 | Legacy Series |
| 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 | extended-claim-33 | 3 | 5917299 | Regional Assessment A |
| 103 | 727058 | seasonal-claim-59 | integrated-claim-34 | 4 | 611500 | Seasonal Survey |

This view presents the theological claim perspective on the text-claim relationship, answering: which scripture passages support each theological claim? The result pairs each claim's metadata with the identifiers and book names of its associated text. Row 1 shows that pilot-claim-56 is grounded in Compact Corridor, while row 3 reveals that integrated-claim-58 draws from Regional Assessment A. The view preserves the claim's type, covenantal status, and eschatological flags alongside the text's identifiers, enabling practitioners to assess whether particular claim types cluster around specific scriptural sources.

**View `vw_theological_claim_interpretation`**

```sql
CREATE VIEW vw_theological_claim_interpretation AS
SELECT a.id, a.claim_id, a.claim_text, a.claim_type, b.interpretation_id AS interpretation_interpretation_id, b.interpretation_name AS interpretation_interpretation_name, b.primary_subject AS interpretation_primary_subject
FROM theological_claims a JOIN interpretations b ON a.interpretation_id = b.interpretation_id;
```

| id | claim_id | claim_text | claim_type | interpretation_interpretation_id | interpretation_interpretation_name | interpretation_primary_subject |
|---|---|---|---|---|---|---|
| 100 | 6969435 | pilot-claim-56 | baseline-claim-31 | 1 | Adaptive Assessment | composite-primary-93 |
| 101 | 4463668 | extended-claim-57 | pilot-claim-32 | 2 | Primary Survey | primary-primary-94 |
| 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 | extended-claim-33 | 3 | Composite Corridor D | adaptive-primary-95 |
| 103 | 727058 | seasonal-claim-59 | integrated-claim-34 | 4 | Compact Series | distributed-primary-96 |

This view connects theological claims to the interpretations that advance them, answering: which interpretations promote each doctrinal claim? The join produces rows where each claim is paired with its associated interpretation's name, primary subject, and mainstream status. Row 1 links pilot-claim-56 to Adaptive Assessment (non-mainstream), while row 2 connects extended-claim-57 to Primary Survey (mainstream). This view enables practitioners to evaluate whether certain claim types tend to be promoted by mainstream or non-mainstream interpretations, and whether author attribution correlates with claim characteristics.

**View `vw_covenant_humanity`**

```sql
CREATE VIEW vw_covenant_humanity AS
SELECT a.id, a.covenant_id, a.covenant_name, a.is_unilateral, b.id AS humanity_id, b.humanity_id AS humanity_humanity_id, b.lineage AS humanity_lineage
FROM covenants a JOIN humanities b ON a.humanity_id = b.id;
```

| id | covenant_id | covenant_name | is_unilateral | humanity_id | humanity_humanity_id | humanity_lineage |
|---|---|---|---|---|---|---|
| 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | false | 1 | 9424907 | compact-lineage-44 |
| 2 | 195361 | Pilot Cluster A | true | 2 | 2986230 | composite-lineage-45 |
| 3 | 10207171 | Baseline Review | false | 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 |
| 4 | 168555 | Distributed Initiative | true | 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 |

This view joins covenants with the human lineages they bind, answering: which communities participate in each covenant? The result pairs each covenant's name and structural flags with the lineage name and moral classification of its associated humanity. Row 1 shows that the Extended Model binds compact-lineage-44 (a godly, ungodly, covenant people), while row 2 reveals that Pilot Cluster A binds composite-lineage-45 (neither godly nor ungodly, not a covenant people). The view preserves the covenant's promise and requirement labels alongside the humanity's classification flags, enabling practitioners to assess whether particular covenant structures correlate with specific community profiles.

**View `vw_covenant_theological_claim`**

```sql
CREATE VIEW vw_covenant_theological_claim AS
SELECT a.id, a.covenant_id, a.covenant_name, a.is_unilateral, b.id AS claim_id, b.claim_id AS claim_claim_id, b.claim_text AS claim_claim_text
FROM covenants a JOIN theological_claims b ON a.theological_claim_id = b.id;
```

| id | covenant_id | covenant_name | is_unilateral | claim_id | claim_claim_id | claim_claim_text |
|---|---|---|---|---|---|---|
| 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | false | 100 | 6969435 | pilot-claim-56 |
| 2 | 195361 | Pilot Cluster A | true | 101 | 4463668 | extended-claim-57 |
| 3 | 10207171 | Baseline Review | false | 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 |
| 4 | 168555 | Distributed Initiative | true | 103 | 727058 | seasonal-claim-59 |

This view links covenants to their associated theological claims, answering: which doctrinal positions underpin each covenant? The join produces rows pairing each covenant's metadata with the claim text, claim type, and theological flags of its linked claim. Row 1 connects the Extended Model to pilot-claim-56 (non-covenantal, eschatological), while row 2 links Pilot Cluster A to extended-claim-57 (covenantal, non-eschatological). This view enables practitioners to evaluate whether covenantal structures tend to align with particular claim types or theological dimensions, and whether the promises and requirements of a covenant correspond to the nature of its supporting claim.

**View `vw_covenant_biblical_text`**

```sql
CREATE VIEW vw_covenant_biblical_text AS
SELECT a.id, a.covenant_id, a.covenant_name, a.is_unilateral, b.id AS text_id, b.text_id AS text_text_id, b.book_name AS text_book_name
FROM covenants a JOIN biblical_texts b ON a.biblical_text_id = b.id;
```

| id | covenant_id | covenant_name | is_unilateral | text_id | text_text_id | text_book_name |
|---|---|---|---|---|---|---|
| 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model | false | 1 | 6a4248dc-8fc0-11eb-924d-9cd76263cbd0 | Compact Corridor |
| 2 | 195361 | Pilot Cluster A | true | 2 | 7731874 | Legacy Series |
| 3 | 10207171 | Baseline Review | false | 3 | 5917299 | Regional Assessment A |
| 4 | 168555 | Distributed Initiative | true | 4 | 611500 | Seasonal Survey |

This view connects covenants to their scriptural foundations, answering: which biblical texts ground each covenant? The result pairs each covenant's identifiers and structural flags with the book name and locators of its associated text. Row 1 shows that the Extended Model is grounded in Compact Corridor (chapter 49), while row 4 reveals that Distributed Initiative draws from Seasonal Survey (chapter 82). The view preserves the covenant's promise and requirement labels alongside the text's chapter, verse, and language identifiers, enabling practitioners to trace covenantal structures back to their scriptural origins.

**View `vw_humanity_covenant`**

```sql
CREATE VIEW vw_humanity_covenant AS
SELECT a.id, a.humanity_id, a.lineage, a.is_godly, b.id AS covenant_id, b.covenant_id AS covenant_covenant_id, b.covenant_name AS covenant_covenant_name
FROM humanities a JOIN covenants b ON a.covenant_id = b.id;
```

| id | humanity_id | lineage | is_godly | covenant_id | covenant_covenant_id | covenant_covenant_name |
|---|---|---|---|---|---|---|
| 1 | 9424907 | compact-lineage-44 | true | 1 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | Extended Model |
| 2 | 2986230 | composite-lineage-45 | false | 2 | 195361 | Pilot Cluster A |
| 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 | true | 3 | 10207171 | Baseline Review |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 | false | 4 | 168555 | Distributed Initiative |

This view reverses the covenant-to-humanity perspective, answering: which covenants does each humanity participate in? The join produces rows pairing each humanity's lineage and moral classification with the name and structural flags of its associated covenant. Row 1 shows that compact-lineage-44 participates in the Extended Model (neither unilateral nor bilateral), while row 3 reveals that primary-lineage-46 is bound by Baseline Review (also neither unilateral nor bilateral). This inverted view is useful for practitioners who begin with a community and seek to understand its covenantal commitments.

**View `vw_humanity_theological_claim`**

```sql
CREATE VIEW vw_humanity_theological_claim AS
SELECT a.id, a.humanity_id, a.lineage, a.is_godly, b.id AS claim_id, b.claim_id AS claim_claim_id, b.claim_text AS claim_claim_text
FROM humanities a JOIN theological_claims b ON a.theological_claim_id = b.id;
```

| id | humanity_id | lineage | is_godly | claim_id | claim_claim_id | claim_claim_text |
|---|---|---|---|---|---|---|
| 1 | 9424907 | compact-lineage-44 | true | 100 | 6969435 | pilot-claim-56 |
| 2 | 2986230 | composite-lineage-45 | false | 101 | 4463668 | extended-claim-57 |
| 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 | true | 102 | lu_tax_code_template_b_VB-EC-Tab | integrated-claim-58 |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 | false | 103 | 727058 | seasonal-claim-59 |

This view links human lineages to their associated theological claims, answering: which doctrinal positions does each community uphold? The result pairs each humanity's identifiers and classification flags with the claim text, claim type, and theological attributes of its linked claim. Row 1 connects compact-lineage-44 to pilot-claim-56 (a baseline, non-covenantal, eschatological claim), while row 2 links composite-lineage-45 to extended-claim-57 (an extended, covenantal, non-eschatological claim). The alternating pattern of godly/ungodly and covenant people status across the four rows, combined with the alternating claim attributes, suggests a structured correspondence between community identity and doctrinal position.

**View `vw_humanity_humanity`**

```sql
CREATE VIEW vw_humanity_humanity AS
SELECT a.id, a.humanity_id, a.lineage, a.is_godly, b.id AS humanity_id, b.humanity_id AS humanity_humanity_id, b.lineage AS humanity_lineage
FROM humanities a JOIN humanities b ON a.intermarries_with_humanity_id = b.id;
```

| id | humanity_id | lineage | is_godly | humanity_id | humanity_humanity_id | humanity_lineage |
|---|---|---|---|---|---|---|
| 1 | 9424907 | compact-lineage-44 | true | 1 | 9424907 | compact-lineage-44 |
| 2 | 2986230 | composite-lineage-45 | false | 2 | 2986230 | composite-lineage-45 |
| 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 | true | 3 | 4e386610-8fcc-11eb-924d-9cd76263cbd0 | primary-lineage-46 |
| 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 | false | 4 | ce090318-ea6a-431b-949e-c1573da75d62 | adaptive-lineage-47 |

This self-join view reveals the intermarriage network among human lineages, answering: which communities intermarry with which others? The join matches each humanity's `intermarries_with_humanity_id` to the `humanity_id` of the target, producing rows that pair the source lineage with the target lineage's name and classification. In the current data, each lineage intermarries with itself—compact-lineage-44 intermarries with compact-lineage-44, composite-lineage-45 with composite-lineage-45—suggesting either endogamous patterns or a data structure awaiting expansion. The view preserves both source and target lineage names, godly/ungodly flags, and covenant people status, enabling practitioners to map the social topology of the communities involved.

The five base tables and twelve composite views together form a complete analytical framework for theological interpretation. The base tables capture the individual entities—interpretations, texts, claims, covenants, and lineages—each with its own attributes and foreign-key links. The views synthesize these entities into relational lenses that answer specific analytical questions: which texts support which interpretations, which claims underpin which covenants, which lineages participate in which agreements. The data values—Sarah Villanueva's Adaptive Assessment, the Compact Corridor's chapter 49, the eschatological nature of pilot-claim-56, the bilateral structure of Pilot Cluster A, the godly classification of compact-lineage-46—provide concrete anchors for scholarly inquiry. Together, they enable practitioners to trace doctrinal positions back through interpretations to their scriptural sources, to evaluate covenantal structures against their human participants, and to map the complex web of relationships that constitute the theological landscape.