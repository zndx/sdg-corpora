---
chapter_id: ch_live_attrkey_subclass_4370c8
topic_id: 187
family: 01_foundation
cited_terms: ['attrkey_subclass', 'evidence_with_source', 'lineage_governed_by_directive']
model: engine-refine
---

Format, identifier, labeltext, language, namespace, and unit constitute the structural vocabulary of any governed data ecosystem, each serving as a constraint that transforms raw information into auditable, interoperable artifacts. An identifier anchors a record to a stable reference point—ATTR-0001, SOUR-0001, DIRE-0001—ensuring that downstream systems can unambiguously resolve provenance, while a namespace partitions those identifiers into logical domains such as governance or telemetry, thereby preventing collision across organizational boundaries. The format column further constrains the shape of the data itself: a lot_number may be encoded as CSV for batch processing, a batch_id as a UUID for distributed traceability, and a voltage_read as E.164 when the value must conform to an internationally standardized numbering scheme. These constraints are not decorative; they are the difference between a field that can be joined across systems and one that cannot.

**t_attrkey_subclass**

| id | attrkey | describes_property | format | namespace |
| --- | --- | --- | --- | --- |
| ATTR-0001 | lot_number | SOUR-0006 | CSV | governance |
| ATTR-0002 | batch_id | SOUR-0002 | UUID | governance |
| ATTR-0003 | operator_code | SOUR-0006 | UUID | telemetry |
| ATTR-0004 | voltage_read | SOUR-0001 | E.164 | telemetry |
| ATTR-0005 | flow_rate | SOUR-0003 | E.164 | governance |
| ATTR-0006 | lot_number | SOUR-0005 | CSV | governance |
| ATTR-0007 | ambient_temp | SOUR-0006 | JSON | catalog |

The label_text column provides the human-facing gloss that bridges machine-readable identifiers to operational understanding. An evidence record identified as SOUR-0001 carries the label "intake form," as does SOUR-0002 and SOUR-0004, yet each points to a fundamentally different evidence_source—ATTR-0003, ATTR-0002, and ATTR-0004 respectively—demonstrating that a shared label does not imply shared semantics. The language column disambiguates further: SOUR-0001 is recorded in French (fr), SOUR-0002 in Japanese (ja), and SOUR-0003 in English (en), ensuring that the same label can be localized without altering the underlying identifier or its referent. This separation of label from language from identifier is what permits a single governance framework to operate across multilingual, multinational data pipelines.

**t_evidence_with_source**

| id | evidence | evidence_source | label_text | language |
| --- | --- | --- | --- | --- |
| SOUR-0001 | OpenTelemetry Collector | ATTR-0003 | intake form | fr |
| SOUR-0002 | GitHub Actions Workflow | ATTR-0002 | intake form | ja |
| SOUR-0003 | Network Latency Benchmark | ATTR-0007 | calibration record | en |
| SOUR-0004 | Phase II Clinical Summary | ATTR-0004 | intake form | fr |
| SOUR-0005 | Data Pipeline Integrity Check | ATTR-0002 | calibration record | es |
| SOUR-0006 | Incident Root Cause Analysis | ATTR-0007 | calibration record | en |

The unit column in the lineage table imposes physical or logical quantification on the data flowing through a lineage. The Model Training Registry (DIRE-0001) measures its throughput in milliseconds (ms), the Patient Cohort Dataset (DIRE-0002 and DIRE-0004) in meters per second (m/s), and the Sensor Telemetry Stream (DIRE-0003) in raw count, each unit anchoring the lineage to a specific domain of measurement. The language column here operates independently of the evidence table: DIRE-0001 is associated with Japanese (ja), DIRE-0002 with German (de), and DIRE-0003 and DIRE-0004 with English (en), reflecting the language of the governing directive rather than the language of the evidence itself. This distinction is critical—governance language and evidence language are orthogonal concerns that must be tracked separately to maintain auditability.

The foreign-key relationships between these tables form a provenance chain that can be traversed in either direction. An attribute key in t_attrkey_subclass—ATTR-0002, for instance, carrying the batch_id property under the governance namespace—links via evidence_source to SOUR-0002 in t_evidence_with_source, which in turn is described by SOUR-0002 in t_attrkey_subclass's describes_property column, creating a bidirectional reference that ties the attribute to its evidence artifact. The evidence_source column in t_evidence_with_source references t_attrkey_subclass.id, while describes_property in t_attrkey_subclass references t_evidence_with_source.id, forming a many-to-many bridge that allows a single attribute to be associated with multiple evidence records and vice versa. This relational architecture ensures that every piece of evidence can be traced back to the attribute it validates, and every attribute can be audited against the evidence that supports it.

In practice, this structure enables compliance teams to answer questions that would otherwise require cross-system reconciliation. When an auditor asks which evidence supports the voltage_read attribute (ATTR-0004), the answer is the Phase II Clinical Summary (SOUR-0004), recorded in French (fr) and labeled as an intake form, governed under the telemetry namespace with an E.164 format. When the same auditor asks what unit applies to the Patient Cohort Dataset lineage, the answer is m/s, appearing in both DIRE-0002 under German (de) governance and DIRE-0004 under English (en) governance, confirming that the unit is consistent even as the directive language differs. The density of these relationships—identifier to format to namespace to evidence to label to language to unit to lineage—creates a graph of accountability that is both machine-readable and human-verifiable, which is precisely what modern data governance frameworks require.

**t_lineage_governed_by_directive**

| id | lineage | unit | language |
| --- | --- | --- | --- |
| DIRE-0001 | Model Training Registry | ms | ja |
| DIRE-0002 | Patient Cohort Dataset | m/s | de |
| DIRE-0003 | Sensor Telemetry Stream | count | en |
| DIRE-0004 | Patient Cohort Dataset | m/s | en |
| DIRE-0005 | API Request Trace | ratio | es |
| DIRE-0006 | Laboratory Batch Records | nm | de |
| DIRE-0007 | Patient Cohort Dataset | kg | en |
| DIRE-0008 | Inventory Sync Job | nm | ja |