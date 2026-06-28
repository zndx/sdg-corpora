---
chapter_id: ch_live_cardinality_min_one_generic_718e9a
topic_id: 1
family: 01_foundation
cited_terms: ['cardinality_min_one_generic', 'dengue_transmission_process', 'radicalization_process']
model: engine-refine
---

Radicalization processes are tracked through a structured framework that links specific organizational activities to their operational characteristics. Each process receives a unique identifier—such as PROC-0001 through PROC-0004—that serves as the primary anchor for all downstream analysis. These identifiers appear consistently across related tables, enabling precise joins between process records and their associated metadata. The processes themselves span distinct phases and patterns: Militia Formation Phase describes the organizational structuring of armed groups, while Network Recruit Wave captures episodic surges in recruitment activity. A Radicalization Vector Delta indicates shifts in the methods or channels through which individuals are drawn into extremist networks. Each process is associated with an affiliated organization that participates in or facilitates the activity—Sympathizer Network Alpha and Al-Shabaab Recruitment Cell are examples of entities that appear as participants, alongside Regional Coordination Cell, which suggests a more logistical or coordinating role rather than direct operational involvement.

**t_radicalization_process**

| id | radicalization_process | has_participant |
| --- | --- | --- |
| PROC-0001 | Militia Formation Phase | Sympathizer Network Alpha |
| PROC-0002 | Network Recruit Wave | Al-Shabaab Recruitment Cell |
| PROC-0003 | Radicalization Vector Delta | Regional Coordination Cell |
| PROC-0004 | Network Recruit Wave | Sympathizer Network Alpha |
| PROC-0005 | Ideological Shift Cycle | Militia Training Outpost |
| PROC-0006 | Radicalization Vector Delta | Ideological Mentorship Program |

The involvement of hosts and vectors forms a critical dimension of process characterization. Host entities—whether they represent geographic regions, demographic populations, or institutional targets—are catalogued in a dedicated dimension table that assigns each a categorical classification and a descriptive label. Involves Host Category 01 through 04 provide the taxonomic grouping, while labels such as Involves Host Label 01 through 04 supply the human-readable identifiers used in reporting. Similarly, vector entities—representing the channels, platforms, or mechanisms through which radicalization propagates—are independently classified under Involves Vector Category 01 through 04 with corresponding labels. This separation of host and vector dimensions allows analysts to query processes by the type of target involved, the means of influence deployed, or both simultaneously. A single process may reference multiple hosts and vectors through its foreign key relationships, enabling a many-to-many mapping that reflects the complexity of real-world radicalization campaigns.

**dim_involves_host**

| id | involves_host_label | involves_host_category |
| --- | --- | --- |
| PROC-0001 | Involves Host Label 01 | Involves Host Category 01 |
| PROC-0002 | Involves Host Label 02 | Involves Host Category 02 |
| PROC-0003 | Involves Host Label 03 | Involves Host Category 03 |
| PROC-0004 | Involves Host Label 04 | Involves Host Category 04 |
| PROC-0005 | Involves Host Label 05 | Involves Host Category 05 |
| PROC-0006 | Involves Host Label 06 | Involves Host Category 06 |

**dim_involves_vector**

| id | involves_vector_label | involves_vector_category |
| --- | --- | --- |
| PROC-0001 | Involves Vector Label 01 | Involves Vector Category 01 |
| PROC-0002 | Involves Vector Label 02 | Involves Vector Category 02 |
| PROC-0003 | Involves Vector Label 03 | Involves Vector Category 03 |
| PROC-0004 | Involves Vector Label 04 | Involves Vector Category 04 |
| PROC-0005 | Involves Vector Label 05 | Involves Vector Category 05 |
| PROC-0006 | Involves Vector Label 06 | Involves Vector Category 06 |
| PROC-0007 | Involves Vector Label 07 | Involves Vector Category 07 |
| PROC-0008 | Involves Vector Label 08 | Involves Vector Category 08 |

Event counts quantify the observable activity associated with each process, providing a measure of intensity or scale. Values such as 251, 444, 56, and 167 represent the number of discrete events—recruitment contacts, propaganda distributions, operational actions, or other measurable interactions—attributed to a given process identifier. These counts are stored in the fact table alongside the foreign keys that link back to the host and vector dimensions, creating a single analytical record that captures what happened, how many times, and through which mechanisms. The fact table structure supports aggregation across dimensions: analysts can sum event counts by host category to identify which target types are most frequently engaged, or by vector category to determine which propagation channels carry the highest volume of activity. This quantitative layer transforms categorical process descriptions into measurable indicators suitable for trend analysis and resource allocation.

**fact_dengue**

| id | involves_host_key | involves_vector_key | event_count |
| --- | --- | --- | --- |
| PROC-0001 | PROC-0002 | PROC-0004 | 251 |
| PROC-0002 | PROC-0001 | PROC-0002 | 444 |
| PROC-0003 | PROC-0005 | PROC-0007 | 56 |
| PROC-0004 | PROC-0002 | PROC-0003 | 167 |
| PROC-0005 | PROC-0002 | PROC-0008 | 168 |

Cardinality constraints govern the structural integrity of the data model, ensuring that every record carries the minimum required information for downstream use. The cardinality table defines rules such as exactlyOne, minOne, and required, each specifying how many related entities must be present for a given relationship. For instance, a cardinality of exactlyOne paired with a related field of tenantId means that each record must belong to precisely one tenant, enforcing multi-tenancy isolation. A minOne cardinality on batchId ensures that every record is associated with at least one batch, while required on assetId mandates the presence of an asset reference. These constraints operate at the schema level, preventing incomplete or orphaned records from entering the system and providing a foundation for reliable joins and aggregations. The generic nature of this cardinality table—using identifiers like GENE-0001 through GENE-0004—allows it to apply uniformly across different entity types, creating a consistent validation layer throughout the data architecture.

**t_cardinality_min_one_generic**

| id | cardinality | related |
| --- | --- | --- |
| GENE-0001 | exactlyOne | tenantId |
| GENE-0002 | minOne | batchId |
| GENE-0003 | minOne | assetId |
| GENE-0004 | required | batchId |
| GENE-0005 | minOne | deviceId |
| GENE-0006 | many | tenantId |