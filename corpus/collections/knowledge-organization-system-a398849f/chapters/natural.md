Knowledge organization in modern information systems rests on the interplay between formal vocabularies, user-generated annotations, and the digital objects they describe. Practitioners manage collections of resources—documents, datasets, media—by applying structured terminology and informal tags, recording who performed each annotation, and tracking the quality of the work. The system captures this activity across multiple layers: the knowledge organization systems that provide the conceptual scaffolding, the controlled terms that enforce consistency, the social tags that capture emergent vocabulary, and the users who drive the entire process. Understanding how these pieces fit together requires examining both the raw records and the analytical views that join them into coherent narratives.

## Knowledge Organization Systems

At the foundation of the domain are the knowledge organization systems themselves—frameworks that define how terminology is structured, versioned, and deployed. Each system carries a unique identifier, a human-readable name, a version string, and a scope that indicates its operational reach.

**Table `knowledge_organization_systems`**

| knowledge_organization_system_id | identifier | name | version | last_updated | scope | status | tagging_activity_id |
|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | seasonal-version-71 | 2023-06-17T17:27:00 | integrated-scope-52 | active | 1 |
| 2 | IDE-2091 | Pilot Initiative A | regional-version-72 | 2024-11-01T00:44:00 | seasonal-scope-53 | deprecated | 2 |
| 3 | IDE-2096 | Baseline Model | legacy-version-73 | 2025-04-12T07:01:00 | regional-scope-54 | draft | 3 |
| 4 | IDE-2101 | Distributed Cluster | compact-version-74 | 2022-09-23T14:18:00 | legacy-scope-55 | active | 4 |

The systems in the registry span different maturity levels. The Extended Review (IDE-2086) operates with an integrated scope and holds active status, while the Pilot Initiative A (IDE-2091) carries a regional scope and has been deprecated. The Baseline Model (IDE-2096) exists in draft form with a regional scope, and the Distributed Cluster (IDE-2101) maintains active status under a legacy scope. Each system is associated with a specific tagging activity, linking the conceptual framework to the operational work of annotating resources. The version strings—such as seasonal-version-71 and compact-version-74—reflect the iterative nature of terminology development, and the last_updated timestamps show that these systems are actively maintained across a multi-year timeline from 2022 through 2025.

## Controlled Terminology

Controlled terms provide the standardized vocabulary that ensures consistency across annotations. Each term carries a preferred label, optional alternate labels, a definition, and hierarchical relationships to other terms. The controlled term registry also records which knowledge organization system each term belongs to, and includes self-referential fields for broader, narrower, and related relationships.

**Table `controlled_terms`**

| controlled_term_id | term_id | pref_label | alt_label | definition | broader_term | narrower_term | related_term | knowledge_organization_system_id | synonym_of_controlled_term_id | broader_than_controlled_term_id | narrower_than_controlled_term_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | model_delegation_child0 | Pilot Review | Primary Framework A | primary-definiti-22 | integrated-broader-16 | composite-narrower-45 | primary-related-22 | 1 | 1000 | 1000 | 1000 |
| 1001 | 2986222 | Baseline Initiative | Composite Protocol | adaptive-definiti-23 | seasonal-broader-17 | primary-narrower-46 | adaptive-related-23 | 2 | 1001 | 1001 | 1001 |
| 1002 | id_26 | Distributed Model A | Compact Programme | distributed-definiti-24 | regional-broader-18 | adaptive-narrower-47 | distributed-related-24 | 3 | 1002 | 1002 | 1002 |
| 1003 | 5006436 | Adaptive Cluster | Legacy Standard D | baseline-definiti-25 | legacy-broader-19 | distributed-narrower-48 | baseline-related-25 | 4 | 1003 | 1003 | 1003 |

The controlled terms form a structured hierarchy. Pilot Review (term_id: model_delegation_child0) sits under the broader category integrated-broader-16 and has the narrower composite-narrower-45 beneath it, with a related term primary-related-22. Baseline Initiative (term_id: 2986222) is nested under seasonal-broader-17 with primary-narrower-46 as its child and adaptive-related-23 as a related concept. Distributed Model A (term_id: id_26) belongs to the regional-broader-18 parent with adaptive-narrower-47 below it, while Adaptive Cluster (term_id: 5006436) falls under legacy-broader-19 with distributed-narrower-48 as its narrower term. Each term is assigned to exactly one knowledge organization system—terms 1000 through 1003 map to systems 1 through 4 respectively—and the synonym_of_controlled_term_id field creates a chain linking each term back to itself, establishing a baseline for synonym resolution.

## Social Tags

Social tags represent the informal, user-generated vocabulary that complements the controlled terminology. Unlike controlled terms, social tags are created by users in the course of their work and carry metadata about usage frequency, spelling variants, and ambiguity.

**Table `social_tags`**

| id | tag_id | tag_text | spelling_variant | usage_count | first_used | last_used | is_ambiguous | resource_id | user_id | controlled_term_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | baseline-tag-61 | pilot-spelling-32 | 87 | 2022-09-19T08:24:00 | 2023-02-10T01:27:00 | true | 1167 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 5844272 | pilot-tag-62 | extended-spelling-33 | 20 | 2023-02-03T15:41:00 | 2024-07-21T08:44:00 | false | 2106708 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 89445 | extended-tag-63 | integrated-spelling-34 | 33 | 2024-07-14T22:58:00 | 2025-12-05T15:01:00 | true | 4180945 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | gd_fp_eu_acc1 | integrated-tag-64 | seasonal-spelling-35 | 15 | 2025-12-25T05:15:00 | 2022-05-16T22:18:00 | false | 10238270 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The social tags in the system show a range of adoption patterns. Tag baseline-tag-61 (identifier 57dbb53c-8fcc-11eb-924d-9cd76263cbd0) has been used 87 times, with first use recorded on 2022-09-19 and most recent use on 2023-02-10; it is marked as ambiguous and carries the spelling variant pilot-spelling-32. Tag pilot-tag-62 (5844272) has seen 20 uses between 2023-02-03 and 2024-07-21, is not ambiguous, and uses extended-spelling-33. Tag extended-tag-63 (89445) has accumulated 33 uses from 2024-07-14 through 2025-12-05, is flagged as ambiguous, and carries integrated-spelling-34. Tag integrated-tag-64 (gd_fp_eu_acc1) has 15 recorded uses spanning from 2025-12-25 back to 2022-05-16, is not ambiguous, and uses seasonal-spelling-35. Each social tag is associated with a specific resource, a user, and a controlled term, creating a bridge between informal and formal classification.

## Digital Resources

Digital resources are the objects being organized and annotated. Each resource has a title, a format designation, creation and modification dates, a size in bytes, and a status indicating whether it is published, in draft, or archived.

**Table `digital_resources`**

| resource_id | title | format | date_created | date_modified | size_bytes | status | controlled_term_id | user_id | digital_collection_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1167 | Compact Initiative | legacy-format-25 | 2024-11-08T10:54:00 | 2023-06-17T05:39:00 | 7 | published | 1000 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2106708 | Legacy Model | compact-format-26 | 2025-04-19T17:11:00 | 2024-11-01T12:56:00 | 10 | draft | 1001 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 4180945 | Regional Cluster A | composite-format-27 | 2022-09-03T00:28:00 | 2025-04-12T19:13:00 | 13 | archived | 1002 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 10238270 | Seasonal Review | primary-format-28 | 2023-02-14T07:45:00 | 2022-09-23T02:30:00 | 16 | published | 1003 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The resource registry contains four items spanning different formats and lifecycle stages. Compact Initiative (resource_id: 1167) is in legacy-format-25, was created on 2024-11-08, last modified on 2023-06-17, is 7 bytes in size, and has published status. Legacy Model (resource_id: 2106708) uses compact-format-26, was created on 2025-04-19, modified on 2024-11-01, is 10 bytes, and remains in draft status. Regional Cluster A (resource_id: 4180945) is in composite-format-27, was created on 2022-09-03, modified on 2025-04-12, is 13 bytes, and has been archived. Seasonal Review (resource_id: 10238270) uses primary-format-28, was created on 2023-02-14, modified on 2022-09-23, is 16 bytes, and is published. Each resource is linked to a controlled term, a user, and a digital collection, anchoring it within the broader organizational structure.

## Tagging Activities

Tagging activities record the actual work of annotating resources. Each activity captures the method used (social, controlled, or hybrid), a quality score, the role of the indexer, and the specific resource, knowledge organization system, social tag, controlled term, and user involved.

**Table `tagging_activities`**

| id | activity_id | start_time | end_time | method | quality_score | indexer_role | resource_id | knowledge_organization_system_id | social_tag_id | controlled_term_id | user_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | social | 19.45 | reader | 1167 | 1 | 1000 | 1000 | 1 |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | controlled | 22.90 | author | 2106708 | 2 | 1001 | 1001 | 2 |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | hybrid | 26.35 | professional | 4180945 | 3 | 1002 | 1002 | 3 |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | social | 29.80 | reader | 10238270 | 4 | 1003 | 1003 | 4 |

The tagging activities show a mix of annotation methods and quality levels. Activity 8843761 used the social method with a quality score of 19.45, was performed by a reader on resource 1167 within knowledge organization system 1, and involved social tag 1000 and controlled term 1000. Activity 4180957 employed the controlled method with a quality score of 22.90, was performed by an author on resource 2106708 within system 2, and involved social tag 1001 and controlled term 1001. Activity 168545 used the hybrid method with the highest quality score of 26.35, was performed by a professional indexer on resource 4180945 within system 3, and involved social tag 1002 and controlled term 1002. Activity default_chart_a_account_53 returned to the social method with the highest quality score of 29.80, was performed by a reader on resource 10238270 within system 4, and involved social tag 1003 and controlled term 1003. The start and end times for each activity reveal that the temporal ordering of annotation work does not always follow a simple chronological sequence.

## Users and Roles

Users are the people who create, manage, and annotate digital resources. Each user record includes a username, registration date, role, affiliation, and active status, along with links to the resources, social tags, and tagging activities they have been involved with.

**Table `users`**

| id | user_id | username | registration_date | role | affiliation | is_active | resource_id | social_tag_id | tagging_activity_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9736910 | Pilot Review | 2023-06-19 | reader | baseline-affiliat-55 | true | 1167 | 1000 | 1 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Baseline Initiative | 2024-11-03 | author | pilot-affiliat-56 | false | 2106708 | 1001 | 2 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2025-04-14 | indexer | extended-affiliat-57 | true | 4180945 | 1002 | 3 |
| 4 | 9125634 | Adaptive Cluster | 2022-09-25 | admin | integrated-affiliat-58 | false | 10238270 | 1003 | 4 |

The user registry contains four individuals with distinct roles and statuses. User 9736910, operating under the username Pilot Review, registered on 2023-06-19 with the role of reader, is affiliated with baseline-affiliat-55, and is currently active. User 40c1e50ce74c42d6801b1e2f409c1cfc, with the username Baseline Initiative, registered on 2024-11-03 as an author, belongs to pilot-affiliat-56, and is currently inactive. User 92297f70-9bad-11eb-a8a2-19ed5c03f8d3, named Distributed Model A, registered on 2025-04-14 with the role of indexer, is affiliated with extended-affiliat-57, and is active. User 9125634, the Adaptive Cluster, registered on 2022-09-25 as an admin, belongs to integrated-affiliat-58, and is currently inactive. The roles—reader, author, indexer, and admin—reflect a tiered permission model where different users contribute to the system at different levels of authority.

## Digital Collections

Digital collections group related resources together, providing an additional organizational layer beyond the knowledge organization systems and controlled terms.

**Table `digital_collections`**

| digital_collection_id | collection_id | name | description | date_established | resource_count | access_level | knowledge_organization_system_id | user_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7441154 | Extended Review | Extended Survey | 2022-09-25 | 50 | public | 1 | 1 |
| 2 | 2087754 | Pilot Initiative A | Pilot Corridor A | 2023-02-09 | 23 | restricted | 2 | 2 |
| 3 | developing-talent | Baseline Model | Baseline Series | 2024-07-20 | 9 | private | 3 | 3 |
| 4 | 5c6f01c708ff420a862fd80b80bd80dc | Distributed Cluster | Distributed Assessment | 2025-12-04 | 78 | public | 4 | 4 |

## Cross-Reference Tables

The relationships between the core entities are captured in three cross-reference tables. The systems_terms table links knowledge organization systems to controlled terms, establishing which vocabulary belongs to which framework. The resources_tags table connects digital resources to social tags, recording which informal labels have been applied to which objects. The collections_resources table maps digital collections to their constituent resources, defining the membership of each collection.

**Table `systems_terms`**

| knowledge_organization_system_id | controlled_term_id |
|---|---|
| 1 | 1000 |
| 1 | 1001 |
| 2 | 1001 |
| 2 | 1002 |
| 3 | 1002 |
| 3 | 1003 |
| 4 | 1003 |
| 4 | 1000 |

**Table `resources_tags`**

| resource_id | social_tag_id |
|---|---|
| 1167 | 1000 |
| 1167 | 1001 |
| 2106708 | 1001 |
| 2106708 | 1002 |
| 4180945 | 1002 |
| 4180945 | 1003 |
| 10238270 | 1003 |
| 10238270 | 1000 |

**Table `collections_resources`**

| digital_collection_id | resource_id |
|---|---|
| 1 | 1167 |
| 1 | 2106708 |
| 2 | 2106708 |
| 2 | 4180945 |
| 3 | 4180945 |
| 3 | 10238270 |
| 4 | 10238270 |
| 4 | 1167 |

## View: Knowledge Organization System and Controlled Term Detail

The view v_knowledge_organization_system_controlled_term_detail joins knowledge organization systems with their associated controlled terms, answering the question of which terms are governed by which organizational framework. Reading the joined result reveals how each system's scope and status propagate to the terms it controls. For instance, the active Extended Review system (IDE-2086) governs controlled term 1000 (Pilot Review), while the deprecated Pilot Initiative A (IDE-2091) manages term 1001 (Baseline Initiative). This view is essential for auditors who need to verify that terminology remains consistent within each active system.

**View `v_knowledge_organization_system_controlled_term_detail`**

```sql
CREATE VIEW v_knowledge_organization_system_controlled_term_detail AS
SELECT a.knowledge_organization_system_id, a.identifier, a.name, b.controlled_term_id AS term_controlled_term_id, b.term_id AS term_term_id, b.pref_label AS term_pref_label
FROM knowledge_organization_systems a
  JOIN systems_terms j ON j.knowledge_organization_system_id = a.knowledge_organization_system_id
  JOIN controlled_terms b ON b.controlled_term_id = j.controlled_term_id;
```

| knowledge_organization_system_id | identifier | name | term_controlled_term_id | term_term_id | term_pref_label |
|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | 1000 | model_delegation_child0 | Pilot Review |
| 1 | IDE-2086 | Extended Review | 1001 | 2986222 | Baseline Initiative |
| 2 | IDE-2091 | Pilot Initiative A | 1001 | 2986222 | Baseline Initiative |
| 2 | IDE-2091 | Pilot Initiative A | 1002 | id_26 | Distributed Model A |
| 3 | IDE-2096 | Baseline Model | 1002 | id_26 | Distributed Model A |
| 3 | IDE-2096 | Baseline Model | 1003 | 5006436 | Adaptive Cluster |
| 4 | IDE-2101 | Distributed Cluster | 1003 | 5006436 | Adaptive Cluster |
| 4 | IDE-2101 | Distributed Cluster | 1000 | model_delegation_child0 | Pilot Review |

## View: Knowledge Organization System and Tagging Activity

The view v_knowledge_organization_system_tagging_activity connects knowledge organization systems to the tagging activities that operate within them, revealing how conceptual frameworks translate into operational work. Each row shows which system a given activity belongs to, along with the method, quality score, and indexer role. The active Distributed Cluster system (IDE-2101) is associated with activity default_chart_a_account_53, which achieved a quality score of 29.80 using the social method, demonstrating that even legacy-scoped systems can produce high-quality annotation work.

**View `v_knowledge_organization_system_tagging_activity`**

```sql
CREATE VIEW v_knowledge_organization_system_tagging_activity AS
SELECT a.knowledge_organization_system_id, a.identifier, a.name, a.version, b.id AS activity_id, b.activity_id AS activity_activity_id, b.start_time AS activity_start_time
FROM knowledge_organization_systems a JOIN tagging_activities b ON a.tagging_activity_id = b.id;
```

| knowledge_organization_system_id | identifier | name | version | activity_id | activity_activity_id | activity_start_time |
|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | seasonal-version-71 | 1 | 8843761 | 2024-03-27T14:42:00 |
| 2 | IDE-2091 | Pilot Initiative A | regional-version-72 | 2 | 4180957 | 2025-08-11T21:59:00 |
| 3 | IDE-2096 | Baseline Model | legacy-version-73 | 3 | 168545 | 2022-01-22T04:16:00 |
| 4 | IDE-2101 | Distributed Cluster | compact-version-74 | 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 |

## View: Controlled Term and Knowledge Organization System

The view v_controlled_term_knowledge_organization_system presents the controlled terms from the perspective of their parent systems, providing a reverse lookup from term to framework. This view is useful when a practitioner starts with a specific term and needs to determine which knowledge organization system governs it. Term 1000 (Pilot Review) maps to system 1 (Extended Review), term 1001 (Baseline Initiative) maps to system 2 (Pilot Initiative A), and so on, confirming the one-to-one assignment between terms and systems in the base data.

**View `v_controlled_term_knowledge_organization_system`**

```sql
CREATE VIEW v_controlled_term_knowledge_organization_system AS
SELECT a.controlled_term_id, a.term_id, a.pref_label, a.alt_label, b.knowledge_organization_system_id AS system_knowledge_organization_system_id, b.identifier AS system_identifier, b.name AS system_name
FROM controlled_terms a JOIN knowledge_organization_systems b ON a.knowledge_organization_system_id = b.knowledge_organization_system_id;
```

| controlled_term_id | term_id | pref_label | alt_label | system_knowledge_organization_system_id | system_identifier | system_name |
|---|---|---|---|---|---|---|
| 1000 | model_delegation_child0 | Pilot Review | Primary Framework A | 1 | IDE-2086 | Extended Review |
| 1001 | 2986222 | Baseline Initiative | Composite Protocol | 2 | IDE-2091 | Pilot Initiative A |
| 1002 | id_26 | Distributed Model A | Compact Programme | 3 | IDE-2096 | Baseline Model |
| 1003 | 5006436 | Adaptive Cluster | Legacy Standard D | 4 | IDE-2101 | Distributed Cluster |

## View: Controlled Term Hierarchy

The view v_controlled_term_controlled_term exposes the hierarchical relationships between controlled terms, showing broader, narrower, and related connections. Each row in this view represents a self-referential link: term 1000 is broader than itself in the data, narrower than itself, and related to itself, establishing a baseline structure that can be extended with additional terms. This self-referential pattern indicates that the hierarchy is designed to support future expansion, where new terms will be linked to existing ones through the broader_term, narrower_term, and related_term columns.

**View `v_controlled_term_controlled_term`**

```sql
CREATE VIEW v_controlled_term_controlled_term AS
SELECT a.controlled_term_id, a.term_id, a.pref_label, a.alt_label, b.controlled_term_id AS term_controlled_term_id, b.term_id AS term_term_id, b.pref_label AS term_pref_label
FROM controlled_terms a JOIN controlled_terms b ON a.synonym_of_controlled_term_id = b.controlled_term_id;
```

| controlled_term_id | term_id | pref_label | alt_label | term_controlled_term_id | term_term_id | term_pref_label |
|---|---|---|---|---|---|---|
| 1000 | model_delegation_child0 | Pilot Review | Primary Framework A | 1000 | model_delegation_child0 | Pilot Review |
| 1001 | 2986222 | Baseline Initiative | Composite Protocol | 1001 | 2986222 | Baseline Initiative |
| 1002 | id_26 | Distributed Model A | Compact Programme | 1002 | id_26 | Distributed Model A |
| 1003 | 5006436 | Adaptive Cluster | Legacy Standard D | 1003 | 5006436 | Adaptive Cluster |

## View: Social Tag and Digital Resource

The view v_social_tag_digital_resource joins social tags with the digital resources they annotate, answering the question of which informal labels have been applied to which objects. Tag baseline-tag-61 is associated with resource 1167 (Compact Initiative), tag pilot-tag-62 with resource 2106708 (Legacy Model), tag extended-tag-63 with resource 4180945 (Regional Cluster A), and tag integrated-tag-64 with resource 10238270 (Seasonal Review). This view is particularly valuable for practitioners who need to audit the informal classification of resources or identify resources that have received social tags but no controlled term assignment.

**View `v_social_tag_digital_resource`**

```sql
CREATE VIEW v_social_tag_digital_resource AS
SELECT a.id, a.tag_id, a.tag_text, a.spelling_variant, b.resource_id AS resource_resource_id, b.title AS resource_title, b.format AS resource_format
FROM social_tags a JOIN digital_resources b ON a.resource_id = b.resource_id;
```

| id | tag_id | tag_text | spelling_variant | resource_resource_id | resource_title | resource_format |
|---|---|---|---|---|---|---|
| 1000 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | baseline-tag-61 | pilot-spelling-32 | 1167 | Compact Initiative | legacy-format-25 |
| 1001 | 5844272 | pilot-tag-62 | extended-spelling-33 | 2106708 | Legacy Model | compact-format-26 |
| 1002 | 89445 | extended-tag-63 | integrated-spelling-34 | 4180945 | Regional Cluster A | composite-format-27 |
| 1003 | gd_fp_eu_acc1 | integrated-tag-64 | seasonal-spelling-35 | 10238270 | Seasonal Review | primary-format-28 |

## View: Social Tag and User

The view v_social_tag_user connects social tags to the users who created them, revealing the human dimension of informal classification. Tag baseline-tag-61 was created by user 1 (Pilot Review), tag pilot-tag-62 by user 2 (Baseline Initiative), tag extended-tag-63 by user 3 (Distributed Model A), and tag integrated-tag-64 by user 4 (Adaptive Cluster). This view supports accountability and workload analysis, allowing managers to see which users are most active in generating social tags.

**View `v_social_tag_user`**

```sql
CREATE VIEW v_social_tag_user AS
SELECT a.id, a.tag_id, a.tag_text, a.spelling_variant, b.id AS user_id, b.user_id AS user_user_id, b.username AS user_username
FROM social_tags a JOIN users b ON a.user_id = b.id;
```

| id | tag_id | tag_text | spelling_variant | user_id | user_user_id | user_username |
|---|---|---|---|---|---|---|
| 1000 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | baseline-tag-61 | pilot-spelling-32 | 1 | 9736910 | Pilot Review |
| 1001 | 5844272 | pilot-tag-62 | extended-spelling-33 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Baseline Initiative |
| 1002 | 89445 | extended-tag-63 | integrated-spelling-34 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A |
| 1003 | gd_fp_eu_acc1 | integrated-tag-64 | seasonal-spelling-35 | 4 | 9125634 | Adaptive Cluster |

## View: Social Tag and Controlled Term

The view v_social_tag_controlled_term links social tags to their corresponding controlled terms, showing how informal labels relate to formal vocabulary. Each social tag in the dataset is associated with exactly one controlled term: tag baseline-tag-61 maps to term 1000, tag pilot-tag-62 to term 1001, tag extended-tag-63 to term 1002, and tag integrated-tag-64 to term 1003. This one-to-one correspondence suggests a design where social tags are intended to complement, rather than replace, controlled terminology.

**View `v_social_tag_controlled_term`**

```sql
CREATE VIEW v_social_tag_controlled_term AS
SELECT a.id, a.tag_id, a.tag_text, a.spelling_variant, b.controlled_term_id AS term_controlled_term_id, b.term_id AS term_term_id, b.pref_label AS term_pref_label
FROM social_tags a JOIN controlled_terms b ON a.controlled_term_id = b.controlled_term_id;
```

| id | tag_id | tag_text | spelling_variant | term_controlled_term_id | term_term_id | term_pref_label |
|---|---|---|---|---|---|---|
| 1000 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | baseline-tag-61 | pilot-spelling-32 | 1000 | model_delegation_child0 | Pilot Review |
| 1001 | 5844272 | pilot-tag-62 | extended-spelling-33 | 1001 | 2986222 | Baseline Initiative |
| 1002 | 89445 | extended-tag-63 | integrated-spelling-34 | 1002 | id_26 | Distributed Model A |
| 1003 | gd_fp_eu_acc1 | integrated-tag-64 | seasonal-spelling-35 | 1003 | 5006436 | Adaptive Cluster |

## View: Digital Resource and Social Tag Detail

The view v_digital_resource_social_tag_detail provides a detailed look at the relationship between digital resources and the social tags applied to them, including the full metadata of both entities. Resource 1167 (Compact Initiative) carries tag baseline-tag-61, which has been used 87 times and is marked as ambiguous. Resource 2106708 (Legacy Model) carries tag pilot-tag-62, used 20 times and not ambiguous. Resource 4180945 (Regional Cluster A) carries tag extended-tag-63, used 33 times and marked as ambiguous. Resource 10238270 (Seasonal Review) carries tag integrated-tag-64, used 15 times and not ambiguous. This view is essential for practitioners who need to assess the reliability of social tags, since the is_ambiguous flag and usage_count provide signals about tag quality.

**View `v_digital_resource_social_tag_detail`**

```sql
CREATE VIEW v_digital_resource_social_tag_detail AS
SELECT a.resource_id, a.title, a.format, b.id AS tag_id, b.tag_id AS tag_tag_id, b.tag_text AS tag_tag_text
FROM digital_resources a
  JOIN resources_tags j ON j.resource_id = a.resource_id
  JOIN social_tags b ON b.id = j.social_tag_id;
```

| resource_id | title | format | tag_id | tag_tag_id | tag_tag_text |
|---|---|---|---|---|---|
| 1167 | Compact Initiative | legacy-format-25 | 1000 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | baseline-tag-61 |
| 1167 | Compact Initiative | legacy-format-25 | 1001 | 5844272 | pilot-tag-62 |
| 2106708 | Legacy Model | compact-format-26 | 1001 | 5844272 | pilot-tag-62 |
| 2106708 | Legacy Model | compact-format-26 | 1002 | 89445 | extended-tag-63 |
| 4180945 | Regional Cluster A | composite-format-27 | 1002 | 89445 | extended-tag-63 |
| 4180945 | Regional Cluster A | composite-format-27 | 1003 | gd_fp_eu_acc1 | integrated-tag-64 |
| 10238270 | Seasonal Review | primary-format-28 | 1003 | gd_fp_eu_acc1 | integrated-tag-64 |
| 10238270 | Seasonal Review | primary-format-28 | 1000 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | baseline-tag-61 |

## View: Digital Resource and Controlled Term

The view v_digital_resource_controlled_term joins digital resources with their assigned controlled terms, answering the question of which formal vocabulary governs each resource. Resource 1167 (Compact Initiative) is classified under controlled term 1000 (Pilot Review), resource 2106708 (Legacy Model) under term 1001 (Baseline Initiative), resource 4180945 (Regional Cluster A) under term 1002 (Distributed Model A), and resource 10238270 (Seasonal Review) under term 1003 (Adaptive Cluster). This view is the primary tool for practitioners who need to verify that all resources have been assigned appropriate controlled terms.

**View `v_digital_resource_controlled_term`**

```sql
CREATE VIEW v_digital_resource_controlled_term AS
SELECT a.resource_id, a.title, a.format, a.date_created, b.controlled_term_id AS term_controlled_term_id, b.term_id AS term_term_id, b.pref_label AS term_pref_label
FROM digital_resources a JOIN controlled_terms b ON a.controlled_term_id = b.controlled_term_id;
```

| resource_id | title | format | date_created | term_controlled_term_id | term_term_id | term_pref_label |
|---|---|---|---|---|---|---|
| 1167 | Compact Initiative | legacy-format-25 | 2024-11-08T10:54:00 | 1000 | model_delegation_child0 | Pilot Review |
| 2106708 | Legacy Model | compact-format-26 | 2025-04-19T17:11:00 | 1001 | 2986222 | Baseline Initiative |
| 4180945 | Regional Cluster A | composite-format-27 | 2022-09-03T00:28:00 | 1002 | id_26 | Distributed Model A |
| 10238270 | Seasonal Review | primary-format-28 | 2023-02-14T07:45:00 | 1003 | 5006436 | Adaptive Cluster |

## View: Digital Resource and User

The view v_digital_resource_user connects digital resources to the users associated with them, revealing the human ownership or responsibility for each object. Resource 1167 is linked to user 1 (Pilot Review), resource 2106708 to user 2 (Baseline Initiative), resource 4180945 to user 3 (Distributed Model A), and resource 10238270 to user 4 (Adaptive Cluster). This view supports access control audits and helps practitioners identify which users are responsible for maintaining which resources.

**View `v_digital_resource_user`**

```sql
CREATE VIEW v_digital_resource_user AS
SELECT a.resource_id, a.title, a.format, a.date_created, b.id AS user_id, b.user_id AS user_user_id, b.username AS user_username
FROM digital_resources a JOIN users b ON a.user_id = b.id;
```

| resource_id | title | format | date_created | user_id | user_user_id | user_username |
|---|---|---|---|---|---|---|
| 1167 | Compact Initiative | legacy-format-25 | 2024-11-08T10:54:00 | 1 | 9736910 | Pilot Review |
| 2106708 | Legacy Model | compact-format-26 | 2025-04-19T17:11:00 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Baseline Initiative |
| 4180945 | Regional Cluster A | composite-format-27 | 2022-09-03T00:28:00 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A |
| 10238270 | Seasonal Review | primary-format-28 | 2023-02-14T07:45:00 | 4 | 9125634 | Adaptive Cluster |

## View: Digital Resource and Digital Collection

The view v_digital_resource_digital_collection joins digital resources with the collections they belong to, showing how resources are grouped into organizational units. Resource 1167 (Compact Initiative) belongs to collection 1, resource 2106708 (Legacy Model) to collection 2, resource 4180945 (Regional Cluster A) to collection 3, and resource 10238270 (Seasonal Review) to collection 4. This view is useful for practitioners who need to understand the collection-level organization of resources or identify which collections contain resources of a particular format or status.

**View `v_digital_resource_digital_collection`**

```sql
CREATE VIEW v_digital_resource_digital_collection AS
SELECT a.resource_id, a.title, a.format, a.date_created, b.digital_collection_id AS collection_digital_collection_id, b.collection_id AS collection_collection_id, b.name AS collection_name
FROM digital_resources a JOIN digital_collections b ON a.digital_collection_id = b.digital_collection_id;
```

| resource_id | title | format | date_created | collection_digital_collection_id | collection_collection_id | collection_name |
|---|---|---|---|---|---|---|
| 1167 | Compact Initiative | legacy-format-25 | 2024-11-08T10:54:00 | 1 | 7441154 | Extended Review |
| 2106708 | Legacy Model | compact-format-26 | 2025-04-19T17:11:00 | 2 | 2087754 | Pilot Initiative A |
| 4180945 | Regional Cluster A | composite-format-27 | 2022-09-03T00:28:00 | 3 | developing-talent | Baseline Model |
| 10238270 | Seasonal Review | primary-format-28 | 2023-02-14T07:45:00 | 4 | 5c6f01c708ff420a862fd80b80bd80dc | Distributed Cluster |

## View: Tagging Activity and Digital Resource

The view v_tagging_activity_digital_resource connects tagging activities to the resources they annotate, providing a direct link between annotation work and the objects being classified. Activity 8843761 annotated resource 1167, activity 4180957 annotated resource 2106708, activity 168545 annotated resource 4180945, and activity default_chart_a_account_53 annotated resource 10238270. Each row in this view includes the method, quality score, and indexer role, allowing practitioners to assess the quality and nature of the annotation work performed on each resource.

**View `v_tagging_activity_digital_resource`**

```sql
CREATE VIEW v_tagging_activity_digital_resource AS
SELECT a.id, a.activity_id, a.start_time, a.end_time, b.resource_id AS resource_resource_id, b.title AS resource_title, b.format AS resource_format
FROM tagging_activities a JOIN digital_resources b ON a.resource_id = b.resource_id;
```

| id | activity_id | start_time | end_time | resource_resource_id | resource_title | resource_format |
|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1167 | Compact Initiative | legacy-format-25 |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2106708 | Legacy Model | compact-format-26 |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 4180945 | Regional Cluster A | composite-format-27 |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 10238270 | Seasonal Review | primary-format-28 |

## View: Tagging Activity and Knowledge Organization System

The view v_tagging_activity_knowledge_organization_system links tagging activities to the knowledge organization systems within which they were conducted, revealing how operational work maps to conceptual frameworks. Activity 8843761 was conducted within system 1 (Extended Review), activity 4180957 within system 2 (Pilot Initiative A), activity 168545 within system 3 (Baseline Model), and activity default_chart_a_account_53 within system 4 (Distributed Cluster). This view is essential for practitioners who need to evaluate the quality of annotation work within specific systems or identify which systems are most actively used.

**View `v_tagging_activity_knowledge_organization_system`**

```sql
CREATE VIEW v_tagging_activity_knowledge_organization_system AS
SELECT a.id, a.activity_id, a.start_time, a.end_time, b.knowledge_organization_system_id AS system_knowledge_organization_system_id, b.identifier AS system_identifier, b.name AS system_name
FROM tagging_activities a JOIN knowledge_organization_systems b ON a.knowledge_organization_system_id = b.knowledge_organization_system_id;
```

| id | activity_id | start_time | end_time | system_knowledge_organization_system_id | system_identifier | system_name |
|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | IDE-2086 | Extended Review |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | IDE-2091 | Pilot Initiative A |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | IDE-2096 | Baseline Model |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | IDE-2101 | Distributed Cluster |

## View: Tagging Activity and Social Tag

The view v_tagging_activity_social_tag connects tagging activities to the social tags involved in each annotation, showing how informal labels are incorporated into the annotation process. Activity 8843761 involved social tag 1000 (baseline-tag-61), activity 4180957 involved tag 1001 (pilot-tag-62), activity 168545 involved tag 1002 (extended-tag-63), and activity default_chart_a_account_53 involved tag 1003 (integrated-tag-64). This view is useful for practitioners who need to trace the provenance of social tags or assess how frequently they are used in formal annotation activities.

**View `v_tagging_activity_social_tag`**

```sql
CREATE VIEW v_tagging_activity_social_tag AS
SELECT a.id, a.activity_id, a.start_time, a.end_time, b.id AS tag_id, b.tag_id AS tag_tag_id, b.tag_text AS tag_tag_text
FROM tagging_activities a JOIN social_tags b ON a.social_tag_id = b.id;
```

| id | activity_id | start_time | end_time | tag_id | tag_tag_id | tag_tag_text |
|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1000 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | baseline-tag-61 |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 1001 | 5844272 | pilot-tag-62 |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 1002 | 89445 | extended-tag-63 |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 1003 | gd_fp_eu_acc1 | integrated-tag-64 |

## View: Tagging Activity and Controlled Term

The view v_tagging_activity_controlled_term links tagging activities to the controlled terms applied during each annotation, providing a direct record of which formal vocabulary was used in each activity. Activity 8843761 applied controlled term 1000, activity 4180957 applied term 1001, activity 168545 applied term 1002, and activity default_chart_a_account_53 applied term 1003. This view is the primary tool for practitioners who need to audit the use of controlled terminology across annotation activities.

**View `v_tagging_activity_controlled_term`**

```sql
CREATE VIEW v_tagging_activity_controlled_term AS
SELECT a.id, a.activity_id, a.start_time, a.end_time, b.controlled_term_id AS term_controlled_term_id, b.term_id AS term_term_id, b.pref_label AS term_pref_label
FROM tagging_activities a JOIN controlled_terms b ON a.controlled_term_id = b.controlled_term_id;
```

| id | activity_id | start_time | end_time | term_controlled_term_id | term_term_id | term_pref_label |
|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1000 | model_delegation_child0 | Pilot Review |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 1001 | 2986222 | Baseline Initiative |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 1002 | id_26 | Distributed Model A |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 1003 | 5006436 | Adaptive Cluster |

## View: Tagging Activity and User

The view v_tagging_activity_user connects tagging activities to the users who performed them, revealing the human contributors to the annotation process. Activity 8843761 was performed by user 1 (Pilot Review), activity 4180957 by user 2 (Baseline Initiative), activity 168545 by user 3 (Distributed Model A), and activity default_chart_a_account_53 by user 4 (Adaptive Cluster). This view supports workload analysis and performance evaluation, allowing managers to see which users are most active in annotation work and how their quality scores compare.

**View `v_tagging_activity_user`**

```sql
CREATE VIEW v_tagging_activity_user AS
SELECT a.id, a.activity_id, a.start_time, a.end_time, b.id AS user_id, b.user_id AS user_user_id, b.username AS user_username
FROM tagging_activities a JOIN users b ON a.user_id = b.id;
```

| id | activity_id | start_time | end_time | user_id | user_user_id | user_username |
|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | 1 | 9736910 | Pilot Review |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Baseline Initiative |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | 4 | 9125634 | Adaptive Cluster |

## View: User and Digital Resource

The view v_user_digital_resource joins users with the digital resources they are associated with, providing a comprehensive view of user-resource relationships. User 1 (Pilot Review) is associated with resource 1167 (Compact Initiative), user 2 (Baseline Initiative) with resource 2106708 (Legacy Model), user 3 (Distributed Model A) with resource 4180945 (Regional Cluster A), and user 4 (Adaptive Cluster) with resource 10238270 (Seasonal Review). This view is useful for practitioners who need to understand the distribution of resources among users or identify users who may need additional resources to work with.

**View `v_user_digital_resource`**

```sql
CREATE VIEW v_user_digital_resource AS
SELECT a.id, a.user_id, a.username, a.registration_date, b.resource_id AS resource_resource_id, b.title AS resource_title, b.format AS resource_format
FROM users a JOIN digital_resources b ON a.resource_id = b.resource_id;
```

| id | user_id | username | registration_date | resource_resource_id | resource_title | resource_format |
|---|---|---|---|---|---|---|
| 1 | 9736910 | Pilot Review | 2023-06-19 | 1167 | Compact Initiative | legacy-format-25 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Baseline Initiative | 2024-11-03 | 2106708 | Legacy Model | compact-format-26 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2025-04-14 | 4180945 | Regional Cluster A | composite-format-27 |
| 4 | 9125634 | Adaptive Cluster | 2022-09-25 | 10238270 | Seasonal Review | primary-format-28 |

## View: User and Social Tag

The view v_user_social_tag connects users to the social tags they have created, revealing the informal vocabulary contributions of each user. User 1 (Pilot Review) created tag 1000 (baseline-tag-61), user 2 (Baseline Initiative) created tag 1001 (pilot-tag-62), user 3 (Distributed Model A) created tag 1002 (extended-tag-63), and user 4 (Adaptive Cluster) created tag 1003 (integrated-tag-64). This view is valuable for practitioners who need to assess the social tagging contributions of individual users or identify users who are generating the most informal vocabulary.

**View `v_user_social_tag`**

```sql
CREATE VIEW v_user_social_tag AS
SELECT a.id, a.user_id, a.username, a.registration_date, b.id AS tag_id, b.tag_id AS tag_tag_id, b.tag_text AS tag_tag_text
FROM users a JOIN social_tags b ON a.social_tag_id = b.id;
```

| id | user_id | username | registration_date | tag_id | tag_tag_id | tag_tag_text |
|---|---|---|---|---|---|---|
| 1 | 9736910 | Pilot Review | 2023-06-19 | 1000 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | baseline-tag-61 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Baseline Initiative | 2024-11-03 | 1001 | 5844272 | pilot-tag-62 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2025-04-14 | 1002 | 89445 | extended-tag-63 |
| 4 | 9125634 | Adaptive Cluster | 2022-09-25 | 1003 | gd_fp_eu_acc1 | integrated-tag-64 |

## View: User and Tagging Activity

The view v_user_tagging_activity links users to the tagging activities they have performed, providing a direct record of each user's annotation work. User 1 (Pilot Review) performed activity 8843761, user 2 (Baseline Initiative) performed activity 4180957, user 3 (Distributed Model A) performed activity 168545, and user 4 (Adaptive Cluster) performed activity default_chart_a_account_53. This view is the primary tool for practitioners who need to evaluate individual user performance, track annotation quality over time, or identify users who may need additional training.

**View `v_user_tagging_activity`**

```sql
CREATE VIEW v_user_tagging_activity AS
SELECT a.id, a.user_id, a.username, a.registration_date, b.id AS activity_id, b.activity_id AS activity_activity_id, b.start_time AS activity_start_time
FROM users a JOIN tagging_activities b ON a.tagging_activity_id = b.id;
```

| id | user_id | username | registration_date | activity_id | activity_activity_id | activity_start_time |
|---|---|---|---|---|---|---|
| 1 | 9736910 | Pilot Review | 2023-06-19 | 1 | 8843761 | 2024-03-27T14:42:00 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Baseline Initiative | 2024-11-03 | 2 | 4180957 | 2025-08-11T21:59:00 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2025-04-14 | 3 | 168545 | 2022-01-22T04:16:00 |
| 4 | 9125634 | Adaptive Cluster | 2022-09-25 | 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 |

## View: Digital Collection and Digital Resource Detail

The view v_digital_collection_digital_resource_detail provides a detailed look at the relationship between digital collections and their constituent resources, including the full metadata of both entities. Collection 1 contains resource 1167 (Compact Initiative, legacy-format-25, published), collection 2 contains resource 2106708 (Legacy Model, compact-format-26, draft), collection 3 contains resource 4180945 (Regional Cluster A, composite-format-27, archived), and collection 4 contains resource 10238270 (Seasonal Review, primary-format-28, published). This view is essential for practitioners who need to audit the contents of collections or assess the distribution of formats and statuses across collections.

**View `v_digital_collection_digital_resource_detail`**

```sql
CREATE VIEW v_digital_collection_digital_resource_detail AS
SELECT a.digital_collection_id, a.collection_id, a.name, b.resource_id AS resource_resource_id, b.title AS resource_title, b.format AS resource_format
FROM digital_collections a
  JOIN collections_resources j ON j.digital_collection_id = a.digital_collection_id
  JOIN digital_resources b ON b.resource_id = j.resource_id;
```

| digital_collection_id | collection_id | name | resource_resource_id | resource_title | resource_format |
|---|---|---|---|---|---|
| 1 | 7441154 | Extended Review | 1167 | Compact Initiative | legacy-format-25 |
| 1 | 7441154 | Extended Review | 2106708 | Legacy Model | compact-format-26 |
| 2 | 2087754 | Pilot Initiative A | 2106708 | Legacy Model | compact-format-26 |
| 2 | 2087754 | Pilot Initiative A | 4180945 | Regional Cluster A | composite-format-27 |
| 3 | developing-talent | Baseline Model | 4180945 | Regional Cluster A | composite-format-27 |
| 3 | developing-talent | Baseline Model | 10238270 | Seasonal Review | primary-format-28 |
| 4 | 5c6f01c708ff420a862fd80b80bd80dc | Distributed Cluster | 10238270 | Seasonal Review | primary-format-28 |
| 4 | 5c6f01c708ff420a862fd80b80bd80dc | Distributed Cluster | 1167 | Compact Initiative | legacy-format-25 |

## View: Digital Collection and Knowledge Organization System

The view v_digital_collection_knowledge_organization_system joins digital collections with the knowledge organization systems they are associated with, revealing how collection-level organization relates to conceptual frameworks. Collection 1 is associated with system 1 (Extended Review), collection 2 with system 2 (Pilot Initiative A), collection 3 with system 3 (Baseline Model), and collection 4 with system 4 (Distributed Cluster). This view is useful for practitioners who need to understand the conceptual grounding of collections or identify collections that may need to be migrated to different knowledge organization systems.

**View `v_digital_collection_knowledge_organization_system`**

```sql
CREATE VIEW v_digital_collection_knowledge_organization_system AS
SELECT a.digital_collection_id, a.collection_id, a.name, a.description, b.knowledge_organization_system_id AS system_knowledge_organization_system_id, b.identifier AS system_identifier, b.name AS system_name
FROM digital_collections a JOIN knowledge_organization_systems b ON a.knowledge_organization_system_id = b.knowledge_organization_system_id;
```

| digital_collection_id | collection_id | name | description | system_knowledge_organization_system_id | system_identifier | system_name |
|---|---|---|---|---|---|---|
| 1 | 7441154 | Extended Review | Extended Survey | 1 | IDE-2086 | Extended Review |
| 2 | 2087754 | Pilot Initiative A | Pilot Corridor A | 2 | IDE-2091 | Pilot Initiative A |
| 3 | developing-talent | Baseline Model | Baseline Series | 3 | IDE-2096 | Baseline Model |
| 4 | 5c6f01c708ff420a862fd80b80bd80dc | Distributed Cluster | Distributed Assessment | 4 | IDE-2101 | Distributed Cluster |

## View: Digital Collection and User

The view v_digital_collection_user connects digital collections to the users associated with them, showing the human responsibility for each collection. Collection 1 is linked to user 1 (Pilot Review), collection 2 to user 2 (Baseline Initiative), collection 3 to user 3 (Distributed Model A), and collection 4 to user 4 (Adaptive Cluster). This view supports accountability and governance, allowing practitioners to identify which users are responsible for maintaining which collections and to ensure that collection management responsibilities are appropriately distributed.

**View `v_digital_collection_user`**

```sql
CREATE VIEW v_digital_collection_user AS
SELECT a.digital_collection_id, a.collection_id, a.name, a.description, b.id AS user_id, b.user_id AS user_user_id, b.username AS user_username
FROM digital_collections a JOIN users b ON a.user_id = b.id;
```

| digital_collection_id | collection_id | name | description | user_id | user_user_id | user_username |
|---|---|---|---|---|---|---|
| 1 | 7441154 | Extended Review | Extended Survey | 1 | 9736910 | Pilot Review |
| 2 | 2087754 | Pilot Initiative A | Pilot Corridor A | 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Baseline Initiative |
| 3 | developing-talent | Baseline Model | Baseline Series | 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A |
| 4 | 5c6f01c708ff420a862fd80b80bd80dc | Distributed Cluster | Distributed Assessment | 4 | 9125634 | Adaptive Cluster |

## Closing Synthesis

The domain of knowledge organization systems, controlled terminology, social tagging, and digital resource management forms an interconnected ecosystem where formal and informal classification work together. Knowledge organization systems provide the conceptual scaffolding, controlled terms enforce consistency within those frameworks, social tags capture emergent vocabulary from users, and digital resources are the objects being organized. Tagging activities record the actual work of annotation, linking every element together through the users who perform it. The cross-reference tables and analytical views make these relationships explicit, allowing practitioners to trace any resource back to its governing system, its assigned terminology, its social tags, its collection membership, and the users who have worked with it. This layered approach—combining structured vocabulary with flexible tagging, and recording every annotation with quality metrics and role information—enables both rigorous governance and adaptive evolution of the knowledge organization infrastructure.