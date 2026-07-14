## Ontology-Grounded Relational Modelling in Theological Ontology

The theological ontology under examination captures a triadic domain of divine agency, human condition, and salvific outcome, structured around six entity types: divine persons, divine acts, humanities, salvations, churches, and theological propositions. Each entity is materialised as a relational table whose columns encode both intrinsic attributes and foreign-key relationships to the other five entities. The schema follows a normalised design in which every entity type receives its own table, and cross-entity associations are expressed through foreign keys embedded directly in the base tables rather than through separate junction tables. This chapter walks through the conceptual model, the column-level mapping of attributes and relationships, and the materialised views that reconstruct domain facts from the normalised tables.

**Table `divine_persons`**

| id | has_name | has_role | has_nature | has_position | divine_act_id | theological_proposition_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | Father | Creator | Fullness of Godhead | Right Hand of God | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Son | Savior | Sinless | Heaven | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | Holy Spirit | Lord | Eternal | Right Hand of God | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Father | Regenerator | Fullness of Godhead | Heaven | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `divine_persons` table anchors the ontology with four rows representing distinct persons of the Godhead. Each row carries a unique surrogate key (`id`) — values 100, 101, 102, and 103 — alongside five descriptive attributes: `has_name` (e.g. "Father", "Son", "Holy Spirit"), `has_role` (e.g. "Creator", "Savior", "Lord"), `has_nature` (e.g. "Fullness of Godhead", "Sinless", "Eternal"), and `has_position` (e.g. "Right Hand of God", "Heaven"). Two foreign keys, `divine_act_id` and `theological_proposition_id`, link each person to a specific act and a corresponding theological proposition. Timestamps `created_at` and `updated_at` record the provenance of each row. The cardinality here is one-to-one from person to act and from person to proposition within this dataset, though the schema permits broader cardinality in principle.

**Table `divine_acts`**

| id | has_act_type | has_temporal_phase | has_location | has_outcome | divine_person_id | humanity_id | salvation_id |
|---|---|---|---|---|---|---|---|
| 1 | Creation | Past | Earth | Reconciliation | 100 | 1 | 1 |
| 2 | Incarnation | Present | Heaven | Restoration | 101 | 2 | 2 |
| 3 | SacrificialDeath | Future | Virgin Mary's Womb | Eternal Life | 102 | 3 | 3 |
| 4 | BodilyResurrection | Past | Earth | Condemnation | 103 | 4 | 4 |

The `divine_acts` table records four acts of divine agency: Creation, Incarnation, SacrificialDeath, and BodilyResurrection. Each row is identified by `id` (1 through 4) and carries four attribute columns — `has_act_type`, `has_temporal_phase` (Past, Present, Future), `has_location` (Earth, Heaven, Virgin Mary's Womb), and `has_outcome` (Reconciliation, Restoration, Eternal Life, Condemnation). Three foreign keys embed relationships: `divine_person_id` points back to the person who performs the act, `humanity_id` identifies the human entity affected, and `salvation_id` links the act to its salvific result. For instance, row 1 (Creation) is performed by divine person 100 (Father), affects humanity 1, and yields salvation 1.

**Table `humanities`**

| id | has_image_status | has_sin_condition | has_reconciliation_status | has_eternal_destiny | divine_person_id | divine_act_id | church_id |
|---|---|---|---|---|---|---|---|
| 1 | true | false | Separated | Eternal Life | 100 | 1 | 1 |
| 2 | false | true | Reconciled | Eternal Condemnation | 101 | 2 | 2 |
| 3 | true | false | Justified | Eternal Life | 102 | 3 | 3 |
| 4 | false | true | Condemned | Eternal Condemnation | 103 | 4 | 4 |

The `humanities` table captures the ontological state of humanity across four rows. Each row carries a surrogate `id` (1–4) and four boolean or categorical attributes: `has_image_status` (a boolean indicating whether the image of God is present), `has_sin_condition` (a boolean indicating the presence of sin), `has_reconciliation_status` (one of "Separated", "Reconciled", "Justified", "Condemned"), and `has_eternal_destiny` (one of "Eternal Life" or "Eternal Condemnation"). Three foreign keys — `divine_person_id`, `divine_act_id`, and `church_id` — tie each humanity row to the divine person, the divine act, and the church that mediates it. Row 1, for example, has `has_image_status` = true, `has_sin_condition` = false, `has_reconciliation_status` = "Separated", and `has_eternal_destiny` = "Eternal Life", and is linked to divine person 100, divine act 1, and church 1.

**Table `salvations`**

| id | has_source | has_mechanism | has_recipient | has_result | divine_act_id | humanity_id | divine_person_id |
|---|---|---|---|---|---|---|---|
| 1 | Free Gift | Faith | Believers | Eternal Life | 1 | 1 | 100 |
| 2 | Atoning Work of Christ | Regeneration | Righteous | Restoration of Creation | 2 | 2 | 101 |
| 3 | Free Gift | Justification | Believers | Eternal Life | 3 | 3 | 102 |
| 4 | Atoning Work of Christ | Faith | Righteous | Restoration of Creation | 4 | 4 | 103 |

The `salvations` table encodes four salvific pathways, each identified by `id` (1–4) and described by four attributes: `has_source` ("Free Gift" or "Atoning Work of Christ"), `has_mechanism` ("Faith", "Regeneration", "Justification"), `has_recipient` ("Believers" or "Righteous"), and `has_result` ("Eternal Life" or "Restoration of Creation"). Three foreign keys — `divine_act_id`, `humanity_id`, and `divine_person_id` — connect each salvation to the act that enables it, the humanity it addresses, and the divine person through whom it flows. Row 1, for instance, has `has_source` = "Free Gift", `has_mechanism` = "Faith", `has_recipient` = "Believers", and `has_result` = "Eternal Life", and is linked to divine act 1, humanity 1, and divine person 100.

**Table `churches`**

| id | has_role | has_mission | has_unity_type | has_responsibility | humanity_id | divine_person_id | divine_act_id |
|---|---|---|---|---|---|---|---|
| 1 | Central Role | Great Commission | Spiritual Unity | Holiness | 1 | 100 | 1 |
| 2 | Ambassador of Kingdom | Proclaim Gospel | One Body | Service | 2 | 101 | 2 |
| 3 | Central Role | Great Commission | Spiritual Unity | Love | 3 | 102 | 3 |
| 4 | Ambassador of Kingdom | Proclaim Gospel | One Body | Holiness | 4 | 103 | 4 |

The `churches` table represents four ecclesial entities, each with a surrogate `id` (1–4) and four descriptive attributes: `has_role` ("Central Role" or "Ambassador of Kingdom"), `has_mission` ("Great Commission" or "Proclaim Gospel"), `has_unity_type` ("Spiritual Unity" or "One Body"), and `has_responsibility` ("Holiness", "Service", or "Love"). Three foreign keys — `humanity_id`, `divine_person_id`, and `divine_act_id` — bind each church to the humanity it serves, the divine person it represents, and the divine act it proclaims. Row 1, for example, has `has_role` = "Central Role", `has_mission` = "Great Commission", `has_unity_type` = "Spiritual Unity", and `has_responsibility` = "Holiness", and is linked to humanity 1, divine person 100, and divine act 1.

**Table `theological_propositions`**

| id | has_proposition_type | has_authority | has_truth_value | has_scope | divine_person_id | humanity_id | salvation_id |
|---|---|---|---|---|---|---|---|
| 1 | Nature of God | Inspired Word | true | Faith | 100 | 1 | 1 |
| 2 | Creation | Infallible | false | Life | 101 | 2 | 2 |
| 3 | Sin | Inspired Word | true | Society | 102 | 3 | 3 |
| 4 | Redemption | Infallible | false | Faith | 103 | 4 | 4 |

The `theological_propositions` table stores four doctrinal propositions, each identified by `id` (1–4) and characterised by four attributes: `has_proposition_type` ("Nature of God", "Creation", "Sin", "Redemption"), `has_authority` ("Inspired Word" or "Infallible"), `has_truth_value` (a boolean), and `has_scope` ("Faith", "Life", or "Society"). Three foreign keys — `divine_person_id`, `humanity_id`, and `salvation_id` — associate each proposition with the divine person who articulates it, the humanity it addresses, and the salvation it supports. Row 1, for instance, has `has_proposition_type` = "Nature of God", `has_authority` = "Inspired Word", `has_truth_value` = true, and `has_scope` = "Faith", and is linked to divine person 100, humanity 1, and salvation 1.

### Foreign-Key Topology and Normalisation

The six base tables form a densely interlinked graph. Every table except `divine_persons` contains at least three foreign keys pointing to other entities, and `divine_persons` itself contains two. This design avoids separate junction tables; instead, each entity carries the foreign keys necessary to reconstruct its relationships. The normalisation is at the third normal form: every non-key attribute is fully functionally dependent on the primary key, and no transitive dependencies exist within the attribute columns. The foreign keys themselves encode the ontology's relationship predicates. For example, `divine_acts.divine_person_id` → `divine_persons.id` expresses the "performed by" relationship, while `salvations.divine_act_id` → `divine_acts.id` expresses the "enabled by" relationship.

### Materialised Views as Domain-Fact Reconstructors

The schema provides twenty materialised views, each joining two or more base tables to answer a specific domain question. The views are named according to the pattern `v_<entity_a>_<entity_b>`, indicating a join between entity A and entity B. Below, each view is interpreted in terms of the question it answers and the concrete rows it produces.

**View `v_divine_person_divine_act`**

```sql
CREATE VIEW v_divine_person_divine_act AS
SELECT a.id, a.has_name, a.has_role, a.has_nature, b.id AS act_id, b.has_act_type AS act_has_act_type, b.has_temporal_phase AS act_has_temporal_phase
FROM divine_persons a JOIN divine_acts b ON a.divine_act_id = b.id;
```

| id | has_name | has_role | has_nature | act_id | act_has_act_type | act_has_temporal_phase |
|---|---|---|---|---|---|---|
| 100 | Father | Creator | Fullness of Godhead | 1 | Creation | Past |
| 101 | Son | Savior | Sinless | 2 | Incarnation | Present |
| 102 | Holy Spirit | Lord | Eternal | 3 | SacrificialDeath | Future |
| 103 | Father | Regenerator | Fullness of Godhead | 4 | BodilyResurrection | Past |

The view `v_divine_person_divine_act` joins `divine_persons` with `divine_acts` on `divine_persons.divine_act_id = divine_acts.id`. It answers the question: "Which divine act is each divine person associated with?" Row 100 (Father) joins with act 1 (Creation), showing that the Father is associated with the act of Creation. Row 101 (Son) joins with act 2 (Incarnation), linking the Son to the Incarnation.

**View `v_divine_person_theological_proposition`**

```sql
CREATE VIEW v_divine_person_theological_proposition AS
SELECT a.id, a.has_name, a.has_role, a.has_nature, b.id AS proposition_id, b.has_proposition_type AS proposition_has_proposition_type, b.has_authority AS proposition_has_authority
FROM divine_persons a JOIN theological_propositions b ON a.theological_proposition_id = b.id;
```

| id | has_name | has_role | has_nature | proposition_id | proposition_has_proposition_type | proposition_has_authority |
|---|---|---|---|---|---|---|
| 100 | Father | Creator | Fullness of Godhead | 1 | Nature of God | Inspired Word |
| 101 | Son | Savior | Sinless | 2 | Creation | Infallible |
| 102 | Holy Spirit | Lord | Eternal | 3 | Sin | Inspired Word |
| 103 | Father | Regenerator | Fullness of Godhead | 4 | Redemption | Infallible |

The view `v_divine_person_theological_proposition` joins `divine_persons` with `theological_propositions` on `divine_persons.theological_proposition_id = theological_propositions.id`. It answers: "Which theological proposition is each divine person associated with?" Row 100 (Father) joins with proposition 1 (Nature of God), and row 101 (Son) joins with proposition 2 (Creation).

**View `v_divine_act_divine_person`**

```sql
CREATE VIEW v_divine_act_divine_person AS
SELECT a.id, a.has_act_type, a.has_temporal_phase, a.has_location, b.id AS person_id, b.has_name AS person_has_name, b.has_role AS person_has_role
FROM divine_acts a JOIN divine_persons b ON a.divine_person_id = b.id;
```

| id | has_act_type | has_temporal_phase | has_location | person_id | person_has_name | person_has_role |
|---|---|---|---|---|---|---|
| 1 | Creation | Past | Earth | 100 | Father | Creator |
| 2 | Incarnation | Present | Heaven | 101 | Son | Savior |
| 3 | SacrificialDeath | Future | Virgin Mary's Womb | 102 | Holy Spirit | Lord |
| 4 | BodilyResurrection | Past | Earth | 103 | Father | Regenerator |

The view `v_divine_act_divine_person` joins `divine_acts` with `divine_persons` on `divine_acts.divine_person_id = divine_persons.id`. It answers the inverse question: "Which divine person performs each divine act?" Act 1 (Creation) is performed by person 100 (Father); act 2 (Incarnation) is performed by person 101 (Son).

**View `v_divine_act_humanity`**

```sql
CREATE VIEW v_divine_act_humanity AS
SELECT a.id, a.has_act_type, a.has_temporal_phase, a.has_location, b.id AS humanity_id, b.has_image_status AS humanity_has_image_status, b.has_sin_condition AS humanity_has_sin_condition
FROM divine_acts a JOIN humanities b ON a.humanity_id = b.id;
```

| id | has_act_type | has_temporal_phase | has_location | humanity_id | humanity_has_image_status | humanity_has_sin_condition |
|---|---|---|---|---|---|---|
| 1 | Creation | Past | Earth | 1 | true | false |
| 2 | Incarnation | Present | Heaven | 2 | false | true |
| 3 | SacrificialDeath | Future | Virgin Mary's Womb | 3 | true | false |
| 4 | BodilyResurrection | Past | Earth | 4 | false | true |

The view `v_divine_act_humanity` joins `divine_acts` with `humanities` on `divine_acts.humanity_id = humanities.id`. It answers: "Which humanity is affected by each divine act?" Act 1 (Creation) affects humanity 1, which has `has_image_status` = true and `has_eternal_destiny` = "Eternal Life". Act 2 (Incarnation) affects humanity 2, which has `has_image_status` = false and `has_eternal_destiny` = "Eternal Condemnation".

**View `v_divine_act_salvation`**

```sql
CREATE VIEW v_divine_act_salvation AS
SELECT a.id, a.has_act_type, a.has_temporal_phase, a.has_location, b.id AS salvation_id, b.has_source AS salvation_has_source, b.has_mechanism AS salvation_has_mechanism
FROM divine_acts a JOIN salvations b ON a.salvation_id = b.id;
```

| id | has_act_type | has_temporal_phase | has_location | salvation_id | salvation_has_source | salvation_has_mechanism |
|---|---|---|---|---|---|---|
| 1 | Creation | Past | Earth | 1 | Free Gift | Faith |
| 2 | Incarnation | Present | Heaven | 2 | Atoning Work of Christ | Regeneration |
| 3 | SacrificialDeath | Future | Virgin Mary's Womb | 3 | Free Gift | Justification |
| 4 | BodilyResurrection | Past | Earth | 4 | Atoning Work of Christ | Faith |

The view `v_divine_act_salvation` joins `divine_acts` with `salvations` on `divine_acts.salvation_id = salvations.id`. It answers: "Which salvation is enabled by each divine act?" Act 1 (Creation) enables salvation 1, which has `has_source` = "Free Gift" and `has_mechanism` = "Faith". Act 2 (Incarnation) enables salvation 2, which has `has_source` = "Atoning Work of Christ" and `has_mechanism` = "Regeneration".

**View `v_humanity_divine_person`**

```sql
CREATE VIEW v_humanity_divine_person AS
SELECT a.id, a.has_image_status, a.has_sin_condition, a.has_reconciliation_status, b.id AS person_id, b.has_name AS person_has_name, b.has_role AS person_has_role
FROM humanities a JOIN divine_persons b ON a.divine_person_id = b.id;
```

| id | has_image_status | has_sin_condition | has_reconciliation_status | person_id | person_has_name | person_has_role |
|---|---|---|---|---|---|---|
| 1 | true | false | Separated | 100 | Father | Creator |
| 2 | false | true | Reconciled | 101 | Son | Savior |
| 3 | true | false | Justified | 102 | Holy Spirit | Lord |
| 4 | false | true | Condemned | 103 | Father | Regenerator |

The view `v_humanity_divine_person` joins `humanities` with `divine_persons` on `humanities.divine_person_id = divine_persons.id`. It answers: "Which divine person is linked to each humanity?" Humanity 1 is linked to divine person 100 (Father); humanity 2 is linked to divine person 101 (Son).

**View `v_humanity_divine_act`**

```sql
CREATE VIEW v_humanity_divine_act AS
SELECT a.id, a.has_image_status, a.has_sin_condition, a.has_reconciliation_status, b.id AS act_id, b.has_act_type AS act_has_act_type, b.has_temporal_phase AS act_has_temporal_phase
FROM humanities a JOIN divine_acts b ON a.divine_act_id = b.id;
```

| id | has_image_status | has_sin_condition | has_reconciliation_status | act_id | act_has_act_type | act_has_temporal_phase |
|---|---|---|---|---|---|---|
| 1 | true | false | Separated | 1 | Creation | Past |
| 2 | false | true | Reconciled | 2 | Incarnation | Present |
| 3 | true | false | Justified | 3 | SacrificialDeath | Future |
| 4 | false | true | Condemned | 4 | BodilyResurrection | Past |

The view `v_humanity_divine_act` joins `humanities` with `divine_acts` on `humanities.divine_act_id = divine_acts.id`. It answers: "Which divine act is associated with each humanity?" Humanity 1 is associated with act 1 (Creation); humanity 2 is associated with act 2 (Incarnation).

**View `v_humanity_church`**

```sql
CREATE VIEW v_humanity_church AS
SELECT a.id, a.has_image_status, a.has_sin_condition, a.has_reconciliation_status, b.id AS church_id, b.has_role AS church_has_role, b.has_mission AS church_has_mission
FROM humanities a JOIN churches b ON a.church_id = b.id;
```

| id | has_image_status | has_sin_condition | has_reconciliation_status | church_id | church_has_role | church_has_mission |
|---|---|---|---|---|---|---|
| 1 | true | false | Separated | 1 | Central Role | Great Commission |
| 2 | false | true | Reconciled | 2 | Ambassador of Kingdom | Proclaim Gospel |
| 3 | true | false | Justified | 3 | Central Role | Great Commission |
| 4 | false | true | Condemned | 4 | Ambassador of Kingdom | Proclaim Gospel |

The view `v_humanity_church` joins `humanities` with `churches` on `humanities.church_id = churches.id`. It answers: "Which church mediates each humanity?" Humanity 1 is mediated by church 1, which has `has_role` = "Central Role" and `has_mission` = "Great Commission". Humanity 2 is mediated by church 2, which has `has_role` = "Ambassador of Kingdom" and `has_mission` = "Proclaim Gospel".

**View `v_salvation_divine_act`**

```sql
CREATE VIEW v_salvation_divine_act AS
SELECT a.id, a.has_source, a.has_mechanism, a.has_recipient, b.id AS act_id, b.has_act_type AS act_has_act_type, b.has_temporal_phase AS act_has_temporal_phase
FROM salvations a JOIN divine_acts b ON a.divine_act_id = b.id;
```

| id | has_source | has_mechanism | has_recipient | act_id | act_has_act_type | act_has_temporal_phase |
|---|---|---|---|---|---|---|
| 1 | Free Gift | Faith | Believers | 1 | Creation | Past |
| 2 | Atoning Work of Christ | Regeneration | Righteous | 2 | Incarnation | Present |
| 3 | Free Gift | Justification | Believers | 3 | SacrificialDeath | Future |
| 4 | Atoning Work of Christ | Faith | Righteous | 4 | BodilyResurrection | Past |

The view `v_salvation_divine_act` joins `salvations` with `divine_acts` on `salvations.divine_act_id = divine_acts.id`. It answers: "Which divine act enables each salvation?" Salvation 1 is enabled by act 1 (Creation); salvation 2 is enabled by act 2 (Incarnation).

**View `v_salvation_humanity`**

```sql
CREATE VIEW v_salvation_humanity AS
SELECT a.id, a.has_source, a.has_mechanism, a.has_recipient, b.id AS humanity_id, b.has_image_status AS humanity_has_image_status, b.has_sin_condition AS humanity_has_sin_condition
FROM salvations a JOIN humanities b ON a.humanity_id = b.id;
```

| id | has_source | has_mechanism | has_recipient | humanity_id | humanity_has_image_status | humanity_has_sin_condition |
|---|---|---|---|---|---|---|
| 1 | Free Gift | Faith | Believers | 1 | true | false |
| 2 | Atoning Work of Christ | Regeneration | Righteous | 2 | false | true |
| 3 | Free Gift | Justification | Believers | 3 | true | false |
| 4 | Atoning Work of Christ | Faith | Righteous | 4 | false | true |

The view `v_salvation_humanity` joins `salvations` with `humanities` on `salvations.humanity_id = humanities.id`. It answers: "Which humanity is the recipient of each salvation?" Salvation 1 addresses humanity 1; salvation 2 addresses humanity 2.

**View `v_salvation_divine_person`**

```sql
CREATE VIEW v_salvation_divine_person AS
SELECT a.id, a.has_source, a.has_mechanism, a.has_recipient, b.id AS person_id, b.has_name AS person_has_name, b.has_role AS person_has_role
FROM salvations a JOIN divine_persons b ON a.divine_person_id = b.id;
```

| id | has_source | has_mechanism | has_recipient | person_id | person_has_name | person_has_role |
|---|---|---|---|---|---|---|
| 1 | Free Gift | Faith | Believers | 100 | Father | Creator |
| 2 | Atoning Work of Christ | Regeneration | Righteous | 101 | Son | Savior |
| 3 | Free Gift | Justification | Believers | 102 | Holy Spirit | Lord |
| 4 | Atoning Work of Christ | Faith | Righteous | 103 | Father | Regenerator |

The view `v_salvation_divine_person` joins `salvations` with `divine_persons` on `salvations.divine_person_id = divine_persons.id`. It answers: "Through which divine person does each salvation flow?" Salvation 1 flows through divine person 100 (Father); salvation 2 flows through divine person 101 (Son).

**View `v_church_humanity`**

```sql
CREATE VIEW v_church_humanity AS
SELECT a.id, a.has_role, a.has_mission, a.has_unity_type, b.id AS humanity_id, b.has_image_status AS humanity_has_image_status, b.has_sin_condition AS humanity_has_sin_condition
FROM churches a JOIN humanities b ON a.humanity_id = b.id;
```

| id | has_role | has_mission | has_unity_type | humanity_id | humanity_has_image_status | humanity_has_sin_condition |
|---|---|---|---|---|---|---|
| 1 | Central Role | Great Commission | Spiritual Unity | 1 | true | false |
| 2 | Ambassador of Kingdom | Proclaim Gospel | One Body | 2 | false | true |
| 3 | Central Role | Great Commission | Spiritual Unity | 3 | true | false |
| 4 | Ambassador of Kingdom | Proclaim Gospel | One Body | 4 | false | true |

The view `v_church_humanity` joins `churches` with `humanities` on `churches.humanity_id = humanities.id`. It answers: "Which humanity does each church serve?" Church 1 serves humanity 1; church 2 serves humanity 2.

**View `v_church_divine_person`**

```sql
CREATE VIEW v_church_divine_person AS
SELECT a.id, a.has_role, a.has_mission, a.has_unity_type, b.id AS person_id, b.has_name AS person_has_name, b.has_role AS person_has_role
FROM churches a JOIN divine_persons b ON a.divine_person_id = b.id;
```

| id | has_role | has_mission | has_unity_type | person_id | person_has_name | person_has_role |
|---|---|---|---|---|---|---|
| 1 | Central Role | Great Commission | Spiritual Unity | 100 | Father | Creator |
| 2 | Ambassador of Kingdom | Proclaim Gospel | One Body | 101 | Son | Savior |
| 3 | Central Role | Great Commission | Spiritual Unity | 102 | Holy Spirit | Lord |
| 4 | Ambassador of Kingdom | Proclaim Gospel | One Body | 103 | Father | Regenerator |

The view `v_church_divine_person` joins `churches` with `divine_persons` on `churches.divine_person_id = divine_persons.id`. It answers: "Which divine person does each church represent?" Church 1 represents divine person 100 (Father); church 2 represents divine person 101 (Son).

**View `v_church_divine_act`**

```sql
CREATE VIEW v_church_divine_act AS
SELECT a.id, a.has_role, a.has_mission, a.has_unity_type, b.id AS act_id, b.has_act_type AS act_has_act_type, b.has_temporal_phase AS act_has_temporal_phase
FROM churches a JOIN divine_acts b ON a.divine_act_id = b.id;
```

| id | has_role | has_mission | has_unity_type | act_id | act_has_act_type | act_has_temporal_phase |
|---|---|---|---|---|---|---|
| 1 | Central Role | Great Commission | Spiritual Unity | 1 | Creation | Past |
| 2 | Ambassador of Kingdom | Proclaim Gospel | One Body | 2 | Incarnation | Present |
| 3 | Central Role | Great Commission | Spiritual Unity | 3 | SacrificialDeath | Future |
| 4 | Ambassador of Kingdom | Proclaim Gospel | One Body | 4 | BodilyResurrection | Past |

The view `v_church_divine_act` joins `churches` with `divine_acts` on `churches.divine_act_id = divine_acts.id`. It answers: "Which divine act does each church proclaim?" Church 1 proclaims act 1 (Creation); church 2 proclaims act 2 (Incarnation).

**View `v_theological_proposition_divine_person`**

```sql
CREATE VIEW v_theological_proposition_divine_person AS
SELECT a.id, a.has_proposition_type, a.has_authority, a.has_truth_value, b.id AS person_id, b.has_name AS person_has_name, b.has_role AS person_has_role
FROM theological_propositions a JOIN divine_persons b ON a.divine_person_id = b.id;
```

| id | has_proposition_type | has_authority | has_truth_value | person_id | person_has_name | person_has_role |
|---|---|---|---|---|---|---|
| 1 | Nature of God | Inspired Word | true | 100 | Father | Creator |
| 2 | Creation | Infallible | false | 101 | Son | Savior |
| 3 | Sin | Inspired Word | true | 102 | Holy Spirit | Lord |
| 4 | Redemption | Infallible | false | 103 | Father | Regenerator |

The view `v_theological_proposition_divine_person` joins `theological_propositions` with `divine_persons` on `theological_propositions.divine_person_id = divine_persons.id`. It answers: "Which divine person articulates each theological proposition?" Proposition 1 (Nature of God) is articulated by divine person 100 (Father); proposition 2 (Creation) is articulated by divine person 101 (Son).

**View `v_theological_proposition_humanity`**

```sql
CREATE VIEW v_theological_proposition_humanity AS
SELECT a.id, a.has_proposition_type, a.has_authority, a.has_truth_value, b.id AS humanity_id, b.has_image_status AS humanity_has_image_status, b.has_sin_condition AS humanity_has_sin_condition
FROM theological_propositions a JOIN humanities b ON a.humanity_id = b.id;
```

| id | has_proposition_type | has_authority | has_truth_value | humanity_id | humanity_has_image_status | humanity_has_sin_condition |
|---|---|---|---|---|---|---|
| 1 | Nature of God | Inspired Word | true | 1 | true | false |
| 2 | Creation | Infallible | false | 2 | false | true |
| 3 | Sin | Inspired Word | true | 3 | true | false |
| 4 | Redemption | Infallible | false | 4 | false | true |

The view `v_theological_proposition_humanity` joins `theological_propositions` with `humanities` on `theological_propositions.humanity_id = humanities.id`. It answers: "Which humanity is addressed by each theological proposition?" Proposition 1 addresses humanity 1; proposition 2 addresses humanity 2.

**View `v_theological_proposition_salvation`**

```sql
CREATE VIEW v_theological_proposition_salvation AS
SELECT a.id, a.has_proposition_type, a.has_authority, a.has_truth_value, b.id AS salvation_id, b.has_source AS salvation_has_source, b.has_mechanism AS salvation_has_mechanism
FROM theological_propositions a JOIN salvations b ON a.salvation_id = b.id;
```

| id | has_proposition_type | has_authority | has_truth_value | salvation_id | salvation_has_source | salvation_has_mechanism |
|---|---|---|---|---|---|---|
| 1 | Nature of God | Inspired Word | true | 1 | Free Gift | Faith |
| 2 | Creation | Infallible | false | 2 | Atoning Work of Christ | Regeneration |
| 3 | Sin | Inspired Word | true | 3 | Free Gift | Justification |
| 4 | Redemption | Infallible | false | 4 | Atoning Work of Christ | Faith |

The view `v_theological_proposition_salvation` joins `theological_propositions` with `salvations` on `theological_propositions.salvation_id = salvations.id`. It answers: "Which salvation does each theological proposition support?" Proposition 1 supports salvation 1; proposition 2 supports salvation 2.

### Synthesis

The ontology materialises as a six-table relational schema in which every entity type is a table and every relationship is a foreign key. The twenty materialised views provide a denormalised, question-oriented access layer: each view joins two base tables to reconstruct a single domain fact — who performs which act, which humanity is affected by which salvation, which church mediates which person, and so on. The concrete values in the data — "Father" as the Creator, "Incarnation" as a present-tense act in Heaven, "Free Gift" as the source of salvation, "Inspired Word" as the authority of a proposition — are not incidental; they are the semantic content that the schema's structure makes queryable. The normalised base tables ensure data integrity through foreign-key constraints, while the views provide the analytical surface that maps directly onto theological reasoning.