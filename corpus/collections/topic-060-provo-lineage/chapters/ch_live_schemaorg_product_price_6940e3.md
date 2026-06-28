---
chapter_id: ch_live_schemaorg_product_price_6940e3
topic_id: 60
family: 07_long_tail
cited_terms: ['schemaorg_product_price', 'outlier_detection_with_baseline', 'ice_subclass_with_part']
model: engine-refine
---

Identifiers serve as the immutable anchors of any structured data ecosystem, providing stable handles that survive the migration, transformation, and recombination of underlying content. In the product pricing registry, identifiers such as `PRIC-0001` through `PRIC-0004` uniquely tag entries whose schemaorg labels range from `Apple AirPods Pro` to `Samsung Galaxy S24`, while the outlier detection baseline employs a parallel scheme with keys like `BASE-0001` and `BASE-0004` to distinguish anomalies such as `network latency jump` and `sensor drift`. The ICE subclass catalogue similarly assigns identifiers (`PART-0001` through `PART-0004`) to records whose semantic content spans `sensor_calibration_record`, `observatory_metadata`, `event_stream_format`, and `model_feature_catalog`. These identifiers are not merely enumerations; they are the stable references that permit cross-table joins, audit trails, and referential integrity across the entire data fabric.

**t_schemaorg_product_price**

| id | schemaorg |
| --- | --- |
| PRIC-0001 | Apple AirPods Pro |
| PRIC-0002 | Dyson V15 |
| PRIC-0003 | Bose QC Ultra |
| PRIC-0004 | Samsung Galaxy S24 |
| PRIC-0005 | Dyson V15 |
| PRIC-0006 | Apple AirPods Pro |

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

**t_outlier_detection_with_baseline**

| id | outlier |
| --- | --- |
| BASE-0001 | network latency jump |
| BASE-0002 | network latency jump |
| BASE-0003 | log flood |
| BASE-0004 | sensor drift |
| BASE-0005 | API error surge |
| BASE-0006 | disk I/O stall |

**t_outlier_detection_with_baseline_against**

| id | against |
| --- | --- |
| BASE-0001 | expected distribution |
| BASE-0002 | nominal profile |
| BASE-0003 | seasonal pattern |
| BASE-0004 | seasonal pattern |
| BASE-0005 | statistical baseline |
| BASE-0006 | control group dataset |
| BASE-0007 | seasonal pattern |

**t_ice_subclass_with_part**

| id | ice | encoding | label_text |
| --- | --- | --- | --- |
| PART-0001 | sensor_calibration_record | ascii | intake form |
| PART-0002 | observatory_metadata | unicode | pre-release note |
| PART-0003 | event_stream_format | unicode | calibration record |
| PART-0004 | model_feature_catalog | ascii | nightly summary |
| PART-0005 | compliance_audit_report | utf8 | pre-release note |
| PART-0006 | customer_transaction_log | latin1 | audit excerpt |

Encoding and labeltext constitute the human- and machine-readable surface layer that sits atop these opaque keys. Encoding specifies the character representation of the associated content—`ascii` for the `sensor_calibration_record` and `model_feature_catalog`, `unicode` for `observatory_metadata` and `event_stream_format`—ensuring that downstream consumers can parse the payload without ambiguity. Labeltext provides the human-facing descriptor: `intake form`, `pre-release note`, `calibration record`, and `nightly summary` are the human-readable captions that allow operators to orient themselves without consulting the identifier column. Together, encoding and labeltext bridge the gap between machine-stable references and the semantic expectations of both automated pipelines and human reviewers.

The subject-target relationship pattern formalizes how entities in one table are linked to entities in another, transforming isolated records into a navigable graph. In the product pricing domain, the junction table `t_schemaorg_product_price__price` maps a `schemaorg_id` (the subject) to a `price_id` (the target), so that `PRIC-0001`—the Apple AirPods Pro—can be associated with a price record identified as `PRIC-0001`, while the same product also resolves to `PRIC-0007` under a different relationship. The outlier detection baseline follows an analogous structure: `t_outlier_detection_with_baseline__against` connects `outlier_id` values such as `BASE-0001` (a `network latency jump`) to `against_id` values like `BASE-0005` and `BASE-0004`, each of which denotes a baseline profile—`expected distribution`, `nominal profile`, or `seasonal pattern`—against which the anomaly is evaluated. This subject-target architecture permits many-to-many associations, allowing a single outlier to be assessed against multiple baselines and a single baseline to serve as the reference for multiple outliers.

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

**t_outlier_detection_with_baseline__against**

| id | outlier_id | against_id | role |
| --- | --- | --- | --- |
| BASE-0001 | BASE-0001 | BASE-0005 | observer |
| BASE-0002 | BASE-0001 | BASE-0004 | owner |
| BASE-0003 | BASE-0004 | BASE-0002 | reviewer |
| BASE-0004 | BASE-0003 | BASE-0002 | observer |
| BASE-0005 | BASE-0004 | BASE-0007 | observer |
| BASE-0006 | BASE-0005 | BASE-0003 | observer |
| BASE-0007 | BASE-0006 | BASE-0006 | owner |
| BASE-0008 | BASE-0001 | BASE-0003 | reviewer |

Role disambiguates the nature of the relationship between subject and target, answering not merely which entity connects to which, but in what capacity. Within the pricing junction, the role column distinguishes `reviewer` from `contributor`: the Apple AirPods Pro (`PRIC-0001`) appears as a `reviewer` against its own price record `PRIC-0001` and as a `contributor` against `PRIC-0007`, while the Bose QC Ultra (`PRIC-0003`) is a `contributor` to `PRIC-0003` and a `reviewer` of `PRIC-0007`. In the outlier detection context, roles take on the values `observer` and `owner`: `BASE-0001` (the `network latency jump`) is linked to `BASE-0005` with the role `observer` and to `BASE-0004` with the role `owner`, while `BASE-0004` (sensor drift) is an `observer` of `BASE-0002`. These role designations carry governance weight—they determine who may modify a record, who must approve changes, and which relationships are authoritative versus advisory.