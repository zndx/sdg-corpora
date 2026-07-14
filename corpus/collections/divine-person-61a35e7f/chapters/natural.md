## Trinitarian Operations and Human Response: A Relational Reference

The domain under examination records the interactions between divine persons, their acts in history, and the resulting states of humanity within ecclesial and salvific frameworks. Six base tables capture these records: divine persons identified by roles such as Creator, Savior, and Lord; divine acts ranging from Creation to BodilyResurrection; humanities tracking image-bearing status, sin conditions, and eternal destinies; salvations documenting mechanisms like Faith and Justification; churches recording institutional roles and missions; and theological propositions encoding doctrinal claims with truth values and scopes. Each record carries temporal metadata and cross-references to related entities, forming a tightly interwoven dataset that answers questions about who acts, what is accomplished, who receives the benefit, and how the church participates.

**Table `divine_persons`**

| id | has_name | has_role | has_nature | has_position | divine_act_id | theological_proposition_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|
| 100 | Father | Creator | Fullness of Godhead | Right Hand of God | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Son | Savior | Sinless | Heaven | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | Holy Spirit | Lord | Eternal | Right Hand of God | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Father | Regenerator | Fullness of Godhead | Heaven | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The divine_persons table anchors the entire domain. Four records identify the Father (rows 100 and 103), the Son (row 101), and the Holy Spirit (row 102). Each person carries a has_role designation—Creator, Savior, Lord, and Regenerator respectively—and a has_nature attribute such as Fullness of Godhead, Sinless, or Eternal. Positions include Right Hand of God and Heaven. The temporal metadata shows creation and update timestamps spanning January through April 2025. Each person record links to a divine_act_id and a theological_proposition_id, establishing the primary foreign-key bridges into the act and proposition tables.

**Table `divine_acts`**

| id | has_act_type | has_temporal_phase | has_location | has_outcome | divine_person_id | humanity_id | salvation_id |
|---|---|---|---|---|---|---|---|
| 1 | Creation | Past | Earth | Reconciliation | 100 | 1 | 1 |
| 2 | Incarnation | Present | Heaven | Restoration | 101 | 2 | 2 |
| 3 | SacrificialDeath | Future | Virgin Mary's Womb | Eternal Life | 102 | 3 | 3 |
| 4 | BodilyResurrection | Past | Earth | Condemnation | 103 | 4 | 4 |

Divine acts represent the operational dimension of the domain. Four acts are recorded: Creation (id 1), Incarnation (id 2), SacrificialDeath (id 3), and BodilyResurrection (id 4). Each act carries a has_act_type, a has_temporal_phase (Past, Present, or Future), a has_location (Earth, Heaven, or Virgin Mary's Womb), and a has_outcome such as Reconciliation, Restoration, Eternal Life, or Condemnation. The foreign-key columns divine_person_id, humanity_id, and salvation_id tie each act to its agent, its human subject, and its salvific result. For instance, act 1 (Creation) is performed by divine person 100 (Father) and targets humanity 1 with outcome Reconciliation.

**Table `humanities`**

| id | has_image_status | has_sin_condition | has_reconciliation_status | has_eternal_destiny | divine_person_id | divine_act_id | church_id |
|---|---|---|---|---|---|---|---|
| 1 | true | false | Separated | Eternal Life | 100 | 1 | 1 |
| 2 | false | true | Reconciled | Eternal Condemnation | 101 | 2 | 2 |
| 3 | true | false | Justified | Eternal Life | 102 | 3 | 3 |
| 4 | false | true | Condemned | Eternal Condemnation | 103 | 4 | 4 |

The humanities table records the condition and status of human entities across four rows. Each row carries a has_image_status (true or false), a has_sin_condition (true or false), a has_reconciliation_status (Separated, Reconciled, Justified, or Condemned), and a has_eternal_destiny (Eternal Life or Eternal Condemnation). Row 1 shows a human with image status true, no sin condition, Separated reconciliation, and Eternal Life as destiny. Row 2 presents the inverse: image status false, sin condition true, Reconciled status, yet Eternal Condemnation as the final state. Foreign keys link each human record to a divine_person_id, a divine_act_id, and a church_id, enabling multi-dimensional joins across the domain.

**Table `salvations`**

| id | has_source | has_mechanism | has_recipient | has_result | divine_act_id | humanity_id | divine_person_id |
|---|---|---|---|---|---|---|---|
| 1 | Free Gift | Faith | Believers | Eternal Life | 1 | 1 | 100 |
| 2 | Atoning Work of Christ | Regeneration | Righteous | Restoration of Creation | 2 | 2 | 101 |
| 3 | Free Gift | Justification | Believers | Eternal Life | 3 | 3 | 102 |
| 4 | Atoning Work of Christ | Faith | Righteous | Restoration of Creation | 4 | 4 | 103 |

Salvations capture the mechanics of deliverance. Four records describe salvific processes with attributes has_source (Free Gift or Atoning Work of Christ), has_mechanism (Faith, Regeneration, or Justification), has_recipient (Believers or Righteous), and has_result (Eternal Life or Restoration of Creation). Row 1 identifies a Free Gift mediated through Faith for Believers, yielding Eternal Life. Row 2 describes the Atoning Work of Christ operating through Regeneration for the Righteous, producing Restoration of Creation. Each salvation links to a divine_act_id, a humanity_id, and a divine_person_id, creating bidirectional pathways between acts, recipients, and agents.

**Table `churches`**

| id | has_role | has_mission | has_unity_type | has_responsibility | humanity_id | divine_person_id | divine_act_id |
|---|---|---|---|---|---|---|---|
| 1 | Central Role | Great Commission | Spiritual Unity | Holiness | 1 | 100 | 1 |
| 2 | Ambassador of Kingdom | Proclaim Gospel | One Body | Service | 2 | 101 | 2 |
| 3 | Central Role | Great Commission | Spiritual Unity | Love | 3 | 102 | 3 |
| 4 | Ambassador of Kingdom | Proclaim Gospel | One Body | Holiness | 4 | 103 | 4 |

The churches table documents institutional roles and responsibilities. Four church records carry has_role (Central Role or Ambassador of Kingdom), has_mission (Great Commission or Proclaim Gospel), has_unity_type (Spiritual Unity or One Body), and has_responsibility (Holiness, Service, or Love). Row 1 assigns a Central Role with the Great Commission, Spiritual Unity, and a responsibility of Holiness. Row 2 designates an Ambassador of Kingdom with Proclaim Gospel, One Body, and Service. Each church links to a humanity_id, a divine_person_id, and a divine_act_id, situating the institution within the broader theological narrative.

**Table `theological_propositions`**

| id | has_proposition_type | has_authority | has_truth_value | has_scope | divine_person_id | humanity_id | salvation_id |
|---|---|---|---|---|---|---|---|
| 1 | Nature of God | Inspired Word | true | Faith | 100 | 1 | 1 |
| 2 | Creation | Infallible | false | Life | 101 | 2 | 2 |
| 3 | Sin | Inspired Word | true | Society | 102 | 3 | 3 |
| 4 | Redemption | Infallible | false | Faith | 103 | 4 | 4 |

Theological propositions encode doctrinal claims. Four propositions are recorded with has_proposition_type (Nature of God, Creation, Sin, or Redemption), has_authority (Inspired Word or Infallible), has_truth_value (true or false), and has_scope (Faith, Life, or Society). Row 1 asserts the Nature of God with Inspired Word authority, a true truth value, scoped to Faith. Row 2 addresses Creation with Infallible authority but a false truth value, scoped to Life. Each proposition references a divine_person_id, a humanity_id, and a salvation_id, anchoring abstract claims to concrete persons, humans, and salvific outcomes.

### Relational Views: Join Interpretations

The view layer synthesizes base tables into answerable queries. Each view represents a specific relational question, and its joined result can be read against concrete rows from the underlying data.

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

This view answers which divine person performs which act. Row 100 (Father, Creator) is joined with act 1 (Creation, Past, Earth, Reconciliation), confirming the Father's role in the creative act. Row 101 (Son, Savior) pairs with act 2 (Incarnation, Present, Heaven, Restoration), situating the Son's incarnational work in the present temporal phase.

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

This view links persons to the propositions that describe them. Row 100 (Father) connects to proposition 1 (Nature of God, Inspired Word, true, Faith), while row 101 (Son) connects to proposition 2 (Creation, Infallible, false, Life). The truth values diverge here: the Father's associated proposition affirms truth, whereas the Son's associated proposition carries a false value, suggesting a distinction in doctrinal status.

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

The inverse of the person-act view, this join confirms the same relationships from the act's perspective. Act 1 (Creation) traces back to person 100 (Father), and act 3 (SacrificialDeath) traces to person 102 (Holy Spirit). The future temporal phase of act 3 contrasts with the Past phases of acts 1 and 4.

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

This view reveals which human entity is the subject of each divine act. Act 1 (Creation) targets humanity 1, which holds image status true, no sin condition, Separated reconciliation, and Eternal Life destiny. Act 4 (BodilyResurrection) targets humanity 4, which has image status false, sin condition true, Condemned reconciliation, and Eternal Condemnation destiny. The contrast between these two rows illustrates the domain's treatment of divergent human states under identical divine action categories.

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

This join connects acts to their salvific outcomes. Act 1 (Creation) links to salvation 1 (Free Gift, Faith, Believers, Eternal Life), while act 2 (Incarnation) links to salvation 2 (Atoning Work of Christ, Regeneration, Righteous, Restoration of Creation). The mechanisms differ—Faith versus Regeneration—and the recipients differ—Believers versus Righteous—demonstrating that each act produces a distinct salvific profile.

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

This view answers which divine person is associated with each human record. Humanity 1 connects to person 100 (Father, Creator, Fullness of Godhead), and humanity 2 connects to person 101 (Son, Savior, Sinless). The image status and sin condition of each human row can be read alongside the nature of the associated divine person, revealing patterns between human condition and divine nature.

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

This join reveals which divine act each human record is tied to. Humanity 1 is linked to act 1 (Creation, Past, Earth, Reconciliation), while humanity 3 is linked to act 3 (SacrificialDeath, Future, Virgin Mary's Womb, Eternal Life). The temporal phases span Past and Future, and the locations range from Earth to the Virgin Mary's Womb, showing the breadth of divine action across time and space.

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

This view situates each human within an ecclesial context. Humanity 1 belongs to church 1 (Central Role, Great Commission, Spiritual Unity, Holiness), and humanity 2 belongs to church 2 (Ambassador of Kingdom, Proclaim Gospel, One Body, Service). The church's mission and responsibility attributes provide the institutional framework within which human reconciliation statuses are understood.

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

This join maps salvations back to their originating acts. Salvation 1 (Free Gift, Faith, Believers, Eternal Life) originates from act 1 (Creation), while salvation 3 (Free Gift, Justification, Believers, Eternal Life) originates from act 3 (SacrificialDeath). Both salvations share the same source (Free Gift) and result (Eternal Life) but differ in mechanism—Faith versus Justification—highlighting that identical outcomes can arise through distinct salvific pathways.

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

This view connects salvations to their human recipients. Salvation 1 targets humanity 1 (image true, sin false, Separated, Eternal Life), and salvation 2 targets humanity 2 (image false, sin true, Reconciled, Eternal Condemnation). The juxtaposition is striking: salvation 2, described as the Atoning Work of Christ through Regeneration, is associated with a human bearing Eternal Condemnation as destiny, raising interpretive questions about the relationship between salvific mechanism and final state.

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

This join identifies which divine person is associated with each salvation. Salvation 1 links to person 100 (Father, Creator), salvation 2 to person 101 (Son, Savior), and salvation 3 to person 102 (Holy Spirit, Lord). The distribution suggests a trinitarian pattern where each person participates in distinct salvific operations.

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

This view reveals the human entities associated with each church. Church 1 (Central Role, Great Commission) is linked to humanity 1 (image true, Separated, Eternal Life), while church 3 (Central Role, Great Commission) is linked to humanity 3 (image true, Justified, Eternal Life). Both churches share the same role and mission, yet their associated humans differ in reconciliation status—Separated versus Justified—suggesting internal diversity within identical ecclesial structures.

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

This join situates churches within the trinitarian framework. Church 1 connects to person 100 (Father, Creator, Right Hand of God), church 2 to person 101 (Son, Savior, Heaven), and church 4 to person 103 (Father, Regenerator, Heaven). The positions—Right Hand of God and Heaven—provide spatial-theological context for each church's divine patron.

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

This view links churches to the divine acts they participate in or proclaim. Church 1 is associated with act 1 (Creation, Past, Earth, Reconciliation), church 2 with act 2 (Incarnation, Present, Heaven, Restoration), and church 4 with act 4 (BodilyResurrection, Past, Earth, Condemnation). The acts span all four temporal-spatial categories, indicating that the church's mission encompasses the full spectrum of divine operations.

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

This join connects propositions to the divine persons they describe. Proposition 1 (Nature of God, Inspired Word, true, Faith) links to person 100 (Father), while proposition 3 (Sin, Inspired Word, true, Society) links to person 102 (Holy Spirit). Both carry a true truth value and Inspired Word authority, whereas propositions 2 and 4 carry Infallible authority with false truth values, creating a binary pattern in the doctrinal dataset.

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

This view reveals which human entity is associated with each theological proposition. Proposition 1 (Nature of God) connects to humanity 1 (image true, Separated, Eternal Life), and proposition 2 (Creation) connects to humanity 2 (image false, Reconciled, Eternal Condemnation). The truth value of the proposition and the eternal destiny of the human do not align linearly, suggesting that doctrinal truth and human outcome operate on independent axes.

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

This final join maps propositions to salvific outcomes. Proposition 1 (Nature of God, true, Faith) links to salvation 1 (Free Gift, Faith, Believers, Eternal Life), and proposition 3 (Sin, true, Society) links to salvation 3 (Free Gift, Justification, Believers, Eternal Life). Both propositions carry true truth values and both salvations yield Eternal Life, reinforcing a coherent pattern where affirmed doctrinal claims correspond to positive salvific results.

### Synthesis

The domain presents a tightly coupled relational structure in which six base tables and seventeen derived views form a comprehensive record of divine operations and their human consequences. Divine persons act through specific acts that produce salvific outcomes for defined human recipients, all within ecclesial frameworks and under the authority of theological propositions. The foreign-key relationships—person to act, act to humanity, salvation to person, church to humanity and act, proposition to person and salvation—create a network where any entity can be traced through multiple relational pathways. Concrete values such as the Father's role as Creator (person 100), the Incarnation's present temporal phase (act 2), the Free Gift mechanism (salvations 1 and 3), and the Great Commission mission (churches 1 and 3) ground the abstract structure in specific, verifiable records. The dataset supports queries about trinitarian participation, salvific mechanisms, ecclesial roles, and doctrinal truth, providing practitioners with a complete reference for navigating the theological domain.