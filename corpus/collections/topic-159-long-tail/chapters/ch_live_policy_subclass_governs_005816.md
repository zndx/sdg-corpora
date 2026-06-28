---
chapter_id: ch_live_policy_subclass_governs_005816
topic_id: 159
family: 03_directive_governance
cited_terms: ['policy_subclass_governs', 'mental_health_education_program', 'schemaorg_event_starttime']
model: engine-refine
---

In enterprise data governance, the ability to trace policy directives through their operational scope and enforcement cadence is foundational to compliance. The governance framework centers on a policy registry where each directive carries an identifier such as GOVE-0001 through GOVE-0004, a descriptive policy name, and a defined scope of application. A policy like High-Performance Clusters governs the Audit Log Preservation Guideline, while Containerized Microservices appears as a governing policy across multiple scopes including its own and the Audit Log Preservation Guideline. Each policy is assigned a priority level—ranging from 1 for Containerized Microservices to 5 for the Data Classification Framework—and a review cycle measured in days, from 277 days for Production Databases to 799 days for High-Performance Clusters. These review intervals ensure that governance artifacts remain current, with higher-priority policies like Containerized Microservices at priority 1 warranting more frequent reassessment than lower-priority counterparts.

**t_policy_subclass_governs**

| id | policy | governs_scope | priority | review_cycle_days |
| --- | --- | --- | --- | --- |
| GOVE-0001 | High-Performance Clusters | Audit Log Preservation Guideline | 4 | 799 |
| GOVE-0002 | Data Classification Framework | Containerized Microservices | 5 | 632 |
| GOVE-0003 | Containerized Microservices | Audit Log Preservation Guideline | 1 | 507 |
| GOVE-0004 | Production Databases | Containerized Microservices | 4 | 277 |
| GOVE-0005 | Data Classification Framework | Edge Telemetry Nodes | 3 | 143 |
| GOVE-0006 | Audit Log Preservation Guideline | Incident Response Protocol | 5 | 666 |

Parallel to the governance layer, the organization tracks its mental health education initiatives through a structured program catalog. Each program is identified by a code such as PROG-0001 through PROG-0004 and carries a program name like Youth Wellness Initiative or Sources of Strength. Programs are delivered through specific presentations—Coping Skills Session, Understanding Anxiety Workshop, Recognizing Depression Workshop, and Emotional Intelligence Talk—each designed to reach a particular youth demographic. The Youth Wellness Initiative, for instance, is delivered across multiple presentations and targets diverse populations including Immigrant Adolescents, Foster Care Youths, and College Freshmen, while Sources of Strength focuses on Athlete Communities. This structure enables the organization to map which educational content reaches which populations, supporting both outreach effectiveness and equity assessments.

The analytical backbone of the system is built around schema.org event data, captured in a fact table that records event start times, payload sizes, and version numbers. Each fact row is identified by a code such as STAR-0001 through STAR-0004 and carries a foreign key reference to the event start time dimension. The event start time key links each fact to its temporal context—for example, STAR-0001 and STAR-0004 both reference event start time STAR-0001, indicating they share the same temporal classification. The size bytes column records substantial data volumes, ranging from 114,301,972 bytes for STAR-0002 to 998,785,819 bytes for STAR-0004, while the version column tracks schema revisions from version 3 through version 8, enabling version-aware data processing and lineage tracking.

**fact_schemaorg**

| id | event_start_time_key | size_bytes | version |
| --- | --- | --- | --- |
| STAR-0001 | STAR-0005 | 895265030 | 3 |
| STAR-0002 | STAR-0003 | 114301972 | 5 |
| STAR-0003 | STAR-0001 | 338701831 | 4 |
| STAR-0004 | STAR-0001 | 998785819 | 8 |

The event start time dimension provides the categorical context that gives temporal identifiers their meaning. Each dimension member, identified by codes STAR-0001 through STAR-0004, carries a human-readable label such as Event Start Time Label 01 and a category designation like Event Start Time Category 01. These labels and categories serve as the bridge between raw event identifiers and business-understandable time groupings, allowing downstream consumers to filter, aggregate, and report on events by their temporal classification without needing to interpret opaque keys. The dimension's flat structure—each row representing a single event start time with its associated label and category—ensures that joins from the fact table are straightforward and performant.

**dim_event_start_time**

| id | event_start_time_label | event_start_time_category |
| --- | --- | --- |
| STAR-0001 | Event Start Time Label 01 | Event Start Time Category 01 |
| STAR-0002 | Event Start Time Label 02 | Event Start Time Category 02 |
| STAR-0003 | Event Start Time Label 03 | Event Start Time Category 03 |
| STAR-0004 | Event Start Time Label 04 | Event Start Time Category 04 |
| STAR-0005 | Event Start Time Label 05 | Event Start Time Category 05 |
| STAR-0006 | Event Start Time Label 06 | Event Start Time Category 06 |

Together, these tables form a multi-domain analytical model that supports governance compliance, program delivery tracking, and event data analysis within a unified schema. The governance policies establish the rules and review cadences that keep data practices current; the mental health education programs document the organization's outreach efforts and their target populations; and the schema.org event facts, anchored by the event start time dimension, provide the temporal and volumetric context for data assets. Foreign key relationships—most notably between the schema.org fact table and the event start time dimension—ensure referential integrity, while the consistent use of identifier columns across all tables enables cross-domain joins and unified reporting. The specific values embedded in each table, from the 799-day review cycle of High-Performance Clusters to the 998-megabyte payload of event STAR-0004, ground the abstract schema in the operational realities of the organization's data landscape.

**t_mental_health_education_program**

| id | mental_health_education_program | delivered_presentation | targets_demographic |
| --- | --- | --- | --- |
| PROG-0001 | Youth Wellness Initiative | Coping Skills Session | Immigrant Adolescents |
| PROG-0002 | Youth Wellness Initiative | Understanding Anxiety Workshop | Foster Care Youths |
| PROG-0003 | Sources of Strength | Recognizing Depression Workshop | Athlete Communities |
| PROG-0004 | Youth Wellness Initiative | Emotional Intelligence Talk | College Freshmen |
| PROG-0005 | Sources of Strength | Understanding Anxiety Workshop | College Freshmen |
| PROG-0006 | Sources of Strength | Mental Health Awareness Brief | High School Students |
| PROG-0007 | Teen Resilience Project | Stress Management Seminar | First Nations Youth |