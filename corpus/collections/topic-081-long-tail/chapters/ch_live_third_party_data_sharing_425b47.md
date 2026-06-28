---
chapter_id: ch_live_third_party_data_sharing_425b47
topic_id: 81
family: 08_derived
cited_terms: ['third_party_data_sharing', 'clinical_performance_evaluation', 'constraint_check_subclass']
model: engine-refine
---

In clinical data governance frameworks, the integrity of third-party data sharing arrangements forms the foundation of regulatory compliance. The `t_third_party_data_sharing` table captures these arrangements through a unique identifier—such as SHAR-0001 through SHAR-0004—and classifies each by its `thirdpartydatasharing` type, which in practice includes designations like PartnerAnalyticsBridge and GeospatialInfoExchange. Each arrangement is linked to an `externalbusinesspartner`, identifying the participating entity; examples include RegionalHealthNetwork, AcmeAnalyticsCorp, FinServDataHub, and GlobalLogisticsInc. This linkage ensures that every data-sharing relationship can be traced to a specific organizational participant, a requirement that underpins audit readiness and data-provenance reporting across healthcare and financial services sectors.

**t_third_party_data_sharing**

| id | third_party_data_sharing | has_participant |
| --- | --- | --- |
| SHAR-0001 | PartnerAnalyticsBridge | RegionalHealthNetwork |
| SHAR-0002 | GeospatialInfoExchange | AcmeAnalyticsCorp |
| SHAR-0003 | GeospatialInfoExchange | FinServDataHub |
| SHAR-0004 | GeospatialInfoExchange | GlobalLogisticsInc |
| SHAR-0005 | IoTSensorDataBridge | AutoOEMDataTeam |
| SHAR-0006 | ResearchCollabDataFlow | TelecomPartnerOps |

Clinical evaluation activities are tracked through the `fact_clinical` table, which serves as the central fact table for operational metrics. Each record carries an `identifier` (EVAL-0001 through EVAL-0004) and records an `event_count` reflecting the volume of clinical events observed—values such as 306, 371, 304, and 206 provide a quantitative snapshot of activity levels. Crucially, each fact record references two dimension tables: `utilizes_key` and `evaluates_key`, which establish foreign-key relationships to `dim_utilizes` and `dim_evaluates` respectively. These relationships allow every clinical event to be classified along two orthogonal axes—what resources or methods are utilized, and what criteria or standards are evaluated against.

**fact_clinical**

| id | utilizes_key | evaluates_key | event_count |
| --- | --- | --- | --- |
| EVAL-0001 | EVAL-0002 | EVAL-0002 | 306 |
| EVAL-0002 | EVAL-0002 | EVAL-0006 | 371 |
| EVAL-0003 | EVAL-0004 | EVAL-0001 | 304 |
| EVAL-0004 | EVAL-0006 | EVAL-0001 | 206 |
| EVAL-0005 | EVAL-0006 | EVAL-0003 | 268 |
| EVAL-0006 | EVAL-0008 | EVAL-0003 | 303 |

The `dim_utilizes` and `dim_evaluates` dimension tables provide the categorical taxonomy that gives meaning to the clinical fact records. Each dimension contains an `identifier` that matches the foreign keys in the fact table, a `misc` field holding a human-readable label (such as Utilizes Label 01 or Evaluates Label 03), and a `category` field that groups labels into broader classification buckets like Utilizes Category 02 or Evaluates Category 04. This two-dimension design enables multi-faceted analysis: a single clinical evaluation can be understood simultaneously in terms of the tools it employs and the standards it measures, supporting both operational dashboards and compliance reporting.

**dim_utilizes**

| id | utilizes_label | utilizes_category |
| --- | --- | --- |
| EVAL-0001 | Utilizes Label 01 | Utilizes Category 01 |
| EVAL-0002 | Utilizes Label 02 | Utilizes Category 02 |
| EVAL-0003 | Utilizes Label 03 | Utilizes Category 03 |
| EVAL-0004 | Utilizes Label 04 | Utilizes Category 04 |
| EVAL-0005 | Utilizes Label 05 | Utilizes Category 05 |
| EVAL-0006 | Utilizes Label 06 | Utilizes Category 06 |
| EVAL-0007 | Utilizes Label 07 | Utilizes Category 07 |
| EVAL-0008 | Utilizes Label 08 | Utilizes Category 08 |

**dim_evaluates**

| id | evaluates_label | evaluates_category |
| --- | --- | --- |
| EVAL-0001 | Evaluates Label 01 | Evaluates Category 01 |
| EVAL-0002 | Evaluates Label 02 | Evaluates Category 02 |
| EVAL-0003 | Evaluates Label 03 | Evaluates Category 03 |
| EVAL-0004 | Evaluates Label 04 | Evaluates Category 04 |
| EVAL-0005 | Evaluates Label 05 | Evaluates Category 05 |
| EVAL-0006 | Evaluates Label 06 | Evaluates Category 06 |

Data quality and regulatory adherence are enforced through the `t_constraint_check_subclass` table, which defines validation rules applied across the data pipeline. Each constraint carries an `identifier` (CHEC-0001 through CHEC-0004), a descriptive `constraint` name such as Null field rejection or Anomaly detection threshold, and a `checks` field specifying the validation engine—Great Expectations validator, Schema registry linter, or Audit log parser. The `ismandatory` flag (true or false) distinguishes between rules that must always pass and those that are advisory, while the `priority` field (ranging from 1 to 5) orders the severity of enforcement. A constraint like CHEC-0001, marked mandatory with priority 1, represents a critical data-quality gate, whereas CHEC-0004, with priority 1 but non-mandatory status, signals a high-priority recommendation rather than a hard block.

**t_constraint_check_subclass**

| id | constraint | checks | mandatory | priority |
| --- | --- | --- | --- | --- |
| CHEC-0001 | Null field rejection | Great Expectations validator | true | 1 |
| CHEC-0002 | Null field rejection | Schema registry linter | true | 5 |
| CHEC-0003 | Anomaly detection threshold | Great Expectations validator | true | 4 |
| CHEC-0004 | Header presence check | Audit log parser | false | 1 |
| CHEC-0005 | Batch size limit | Prometheus alertmanager | false | 4 |