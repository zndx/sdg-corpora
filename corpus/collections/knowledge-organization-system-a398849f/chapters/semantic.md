The domain under examination is a knowledge organization ecosystem in which structured taxonomies, user-driven social tags, and digital resources are woven together through tagging activities and grouped into collections. At its core, the system supports two parallel annotation strategies: controlled vocabulary terms drawn from formal knowledge organization systems, and free-form social tags contributed by users. These annotations are not static metadata; they are events — `tagging_activities` — that record who annotated what, with which method, and under which organizational framework. The relational schema captures this complexity through a set of seven core entity tables, three junction tables that resolve many-to-many relationships, and a rich layer of materialized views that reassemble normalized facts into domain-meaningful projections.

**Table `knowledge_organization_systems`**

| knowledge_organization_system_id | identifier | name | version | last_updated | scope | status | tagging_activity_id |
|---|---|---|---|---|---|---|---|
| 1 | IDE-2086 | Extended Review | seasonal-version-71 | 2023-06-17T17:27:00 | integrated-scope-52 | active | 1 |
| 2 | IDE-2091 | Pilot Initiative A | regional-version-72 | 2024-11-01T00:44:00 | seasonal-scope-53 | deprecated | 2 |
| 3 | IDE-2096 | Baseline Model | legacy-version-73 | 2025-04-12T07:01:00 | regional-scope-54 | draft | 3 |
| 4 | IDE-2101 | Distributed Cluster | compact-version-74 | 2022-09-23T14:18:00 | legacy-scope-55 | active | 4 |

The `knowledge_organization_systems` table anchors the entire model. Each row represents a distinct taxonomy or classification framework, identified by a surrogate `knowledge_organization_system_id` and a human-readable `identifier` such as `IDE-2086` or `IDE-2101`. The `name` column carries descriptive labels like *Extended Review*, *Pilot Initiative A*, *Baseline Model*, and *Distributed Cluster*. A `version` field (e.g., `seasonal-version-71`, `legacy-version-73`) tracks revisions, while `last_updated` records the timestamp of the most recent modification. The `scope` column constrains the applicability of the system to values such as `integrated-scope-52`, `seasonal-scope-53`, `regional-scope-54`, and `legacy-scope-55`. A `status` column — `active`, `deprecated`, or `draft` — indicates lifecycle state. Finally, a `tagging_activity_id` foreign key links each system to a specific tagging activity, establishing the first bridge between the organizational layer and the annotation layer.

**Table `controlled_terms`**

| controlled_term_id | term_id | pref_label | alt_label | definition | broader_term | narrower_term | related_term | knowledge_organization_system_id | synonym_of_controlled_term_id | broader_than_controlled_term_id | narrower_than_controlled_term_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | model_delegation_child0 | Pilot Review | Primary Framework A | primary-definiti-22 | integrated-broader-16 | composite-narrower-45 | primary-related-22 | 1 | 1000 | 1000 | 1000 |
| 1001 | 2986222 | Baseline Initiative | Composite Protocol | adaptive-definiti-23 | seasonal-broader-17 | primary-narrower-46 | adaptive-related-23 | 2 | 1001 | 1001 | 1001 |
| 1002 | id_26 | Distributed Model A | Compact Programme | distributed-definiti-24 | regional-broader-18 | adaptive-narrower-47 | distributed-related-24 | 3 | 1002 | 1002 | 1002 |
| 1003 | 5006436 | Adaptive Cluster | Legacy Standard D | baseline-definiti-25 | legacy-broader-19 | distributed-narrower-48 | baseline-related-25 | 4 | 1003 | 1003 | 1003 |

Controlled terms are the structured vocabulary units that inhabit knowledge organization systems. The `controlled_terms` table uses `controlled_term_id` as its primary key, with each term carrying a `term_id` (e.g., `model_delegation_child0`, `2986222`, `id_26`, `5006436`) and a preferred label (`pref_label`) such as *Pilot Review*, *Baseline Initiative*, *Distributed Model A*, and *Adaptive Cluster*. An `alt_label` provides an alternative name — *Primary Framework A*, *Composite Protocol*, *Compact Programme*, *Legacy Standard D* — while `definition` holds a short descriptive string like `primary-definiti-22` or `adaptive-definiti-23`. The table supports hierarchical relationships through self-referencing columns: `broader_term`, `narrower_term`, and `related_term` store string identifiers for parent, child, and peer terms respectively. A `knowledge_organization_system_id` foreign key binds each term to its parent system, and three additional self-referential foreign keys — `synonym_of_controlled_term_id`, `broader_than_controlled_term_id`, and `narrower_than_controlled_term_id` — enable synonymy and hierarchy within the same table. In the sample data, every term references itself across these three columns, indicating a degenerate self-link pattern that the schema accommodates.

**Table `social_tags`**

| id | tag_id | tag_text | spelling_variant | usage_count | first_used | last_used | is_ambiguous | resource_id | user_id | controlled_term_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1000 | 57dbb53c-8fcc-11eb-924d-9cd76263cbd0 | baseline-tag-61 | pilot-spelling-32 | 87 | 2022-09-19T08:24:00 | 2023-02-10T01:27:00 | true | 1167 | 1 | 1000 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 1001 | 5844272 | pilot-tag-62 | extended-spelling-33 | 20 | 2023-02-03T15:41:00 | 2024-07-21T08:44:00 | false | 2106708 | 2 | 1001 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 1002 | 89445 | extended-tag-63 | integrated-spelling-34 | 33 | 2024-07-14T22:58:00 | 2025-12-05T15:01:00 | true | 4180945 | 3 | 1002 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 1003 | gd_fp_eu_acc1 | integrated-tag-64 | seasonal-spelling-35 | 15 | 2025-12-25T05:15:00 | 2022-05-16T22:18:00 | false | 10238270 | 4 | 1003 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Social tags represent the folksonomy side of the annotation ecosystem. The `social_tags` table uses `id` as its primary key and stores each tag with a `tag_id` (a UUID-like string such as `57dbb53c-8fcc-11eb-924d-9cd76263cbd0` or `gd_fp_eu_acc1`), a `tag_text` value (`baseline-tag-61`, `pilot-tag-62`, `extended-tag-63`, `integrated-tag-64`), and a `spelling_variant` (e.g., `pilot-spelling-32`, `extended-spelling-33`). The `usage_count` column records how many times the tag has been applied — values range from 15 to 87 in the sample data. Temporal tracking is provided by `first_used` and `last_used` timestamps. A boolean `is_ambiguous` flag (true or false) indicates whether the tag's meaning is context-dependent. The table carries three foreign keys: `resource_id` links the tag to a `digital_resources` row, `user_id` links it to a `users` row, and `controlled_term_id` links it to a `controlled_terms` row, thereby allowing a social tag to be associated with both a resource and a controlled term simultaneously.

**Table `digital_resources`**

| resource_id | title | format | date_created | date_modified | size_bytes | status | controlled_term_id | user_id | digital_collection_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1167 | Compact Initiative | legacy-format-25 | 2024-11-08T10:54:00 | 2023-06-17T05:39:00 | 7 | published | 1000 | 1 | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2106708 | Legacy Model | compact-format-26 | 2025-04-19T17:11:00 | 2024-11-01T12:56:00 | 10 | draft | 1001 | 2 | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 4180945 | Regional Cluster A | composite-format-27 | 2022-09-03T00:28:00 | 2025-04-12T19:13:00 | 13 | archived | 1002 | 3 | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 10238270 | Seasonal Review | primary-format-28 | 2023-02-14T07:45:00 | 2022-09-23T02:30:00 | 16 | published | 1003 | 4 | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Digital resources are the objects being annotated. The `digital_resources` table uses `resource_id` as its primary key and stores a `title` (e.g., *Compact Initiative*, *Legacy Model*, *Regional Cluster A*, *Seasonal Review*), a `format` column (`legacy-format-25`, `compact-format-26`, `composite-format-27`, `primary-format-28`), and creation/modification timestamps (`date_created`, `date_modified`). The `size_bytes` column holds small integer values (7, 10, 13, 16) in the sample data, likely representing a normalized or categorical size indicator. A `status` column takes values `published`, `draft`, or `archived`. Foreign keys `controlled_term_id`, `user_id`, and `digital_collection_id` link each resource to its associated controlled term, its creator or curator (a `users` row), and its parent collection.

**Table `tagging_activities`**

| id | activity_id | start_time | end_time | method | quality_score | indexer_role | resource_id | knowledge_organization_system_id | social_tag_id | controlled_term_id | user_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 8843761 | 2024-03-27T14:42:00 | 2023-02-26T13:27:00 | social | 19.45 | reader | 1167 | 1 | 1000 | 1000 | 1 |
| 2 | 4180957 | 2025-08-11T21:59:00 | 2024-07-10T20:44:00 | controlled | 22.90 | author | 2106708 | 2 | 1001 | 1001 | 2 |
| 3 | 168545 | 2022-01-22T04:16:00 | 2025-12-21T03:01:00 | hybrid | 26.35 | professional | 4180945 | 3 | 1002 | 1002 | 3 |
| 4 | default_chart_a_account_53 | 2023-06-06T11:33:00 | 2022-05-05T10:18:00 | social | 29.80 | reader | 10238270 | 4 | 1003 | 1003 | 4 |

Tagging activities are the central event table. Each row in `tagging_activities` records a discrete annotation event with an `id` primary key and an `activity_id` (e.g., `8843761`, `4180957`, `168545`, `default_chart_a_account_53`). The `start_time` and `end_time` columns define the temporal window of the activity. The `method` column distinguishes between `social`, `controlled`, and `hybrid` annotation approaches. A `quality_score` (ranging from 19.45 to 29.80) and an `indexer_role` (`reader`, `author`, `professional`) provide metadata about the annotation's provenance. Five foreign keys — `resource_id`, `knowledge_organization_system_id`, `social_tag_id`, `controlled_term_id`, and `user_id` — make this table the hub that connects every other entity in the model.

**Table `users`**

| id | user_id | username | registration_date | role | affiliation | is_active | resource_id | social_tag_id | tagging_activity_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | 9736910 | Pilot Review | 2023-06-19 | reader | baseline-affiliat-55 | true | 1167 | 1000 | 1 |
| 2 | 40c1e50ce74c42d6801b1e2f409c1cfc | Baseline Initiative | 2024-11-03 | author | pilot-affiliat-56 | false | 2106708 | 1001 | 2 |
| 3 | 92297f70-9bad-11eb-a8a2-19ed5c03f8d3 | Distributed Model A | 2025-04-14 | indexer | extended-affiliat-57 | true | 4180945 | 1002 | 3 |
| 4 | 9125634 | Adaptive Cluster | 2022-09-25 | admin | integrated-affiliat-58 | false | 10238270 | 1003 | 4 |

The `users` table stores the people who create and annotate resources. Its `id` primary key maps to a `user_id` (e.g., `9736910`, `40c1e50ce74c42d6801b1e2f409c1cfc`, `92297f70-9bad-11eb-a8a2-19ed5c03f8d3`, `9125634`) and a `username` that, in this dataset, coincides with names like *Pilot Review*, *Baseline Initiative*, *Distributed Model A*, and *Adaptive Cluster*. A `registration_date`, `role` (`reader`, `author`, `indexer`, `admin`), `affiliation` (e.g., `baseline-affiliat-55`, `pilot-affiliat-56`), and `is_active` boolean complete the profile. Foreign keys `resource_id`, `social_tag_id`, and `tagging_activity_id` link each user to their contributions.

**Table `digital_collections`**

| digital_collection_id | collection_id | name | description | date_established | resource_count | access_level | knowledge_organization_system_id | user_id |
|---|---|---|---|---|---|---|---|---|
| 1 | 7441154 | Extended Review | Extended Survey | 2022-09-25 | 50 | public | 1 | 1 |
| 2 | 2087754 | Pilot Initiative A | Pilot Corridor A | 2023-02-09 | 23 | restricted | 2 | 2 |
| 3 | developing-talent | Baseline Model | Baseline Series | 2024-07-20 | 9 | private | 3 | 3 |
| 4 | 5c6f01c708ff420a862fd80b80bd80dc | Distributed Cluster | Distributed Assessment | 2025-12-04 | 78 | public | 4 | 4 |

Digital collections group resources into thematic or administrative groupings. The `digital_collections` table (referenced via `digital_collection_id` in `digital_resources`) provides the container entity for resource aggregation.

The many-to-many relationships between knowledge organization systems and controlled terms, between digital resources and social tags, and between digital collections and digital resources are resolved through three junction tables.

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

The `systems_terms` junction table resolves the relationship between `knowledge_organization_systems` and `controlled_terms`, allowing a single term to belong to multiple systems and a single system to contain multiple terms.

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

The `resources_tags` junction table resolves the relationship between `digital_resources` and `social_tags`, supporting the one-to-many or many-to-many association between resources and the social tags applied to them.

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

The `collections_resources` junction table resolves the relationship between `digital_collections` and `digital_resources`, enabling a resource to appear in multiple collections and a collection to contain multiple resources.

With the base schema established, the materialized views reassemble normalized data into domain-meaningful projections. Each view answers a specific analytical question by joining the appropriate tables.

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

The view `v_knowledge_organization_system_controlled_term_detail` joins `knowledge_organization_systems` with `controlled_terms` to present each controlled term alongside its parent system's metadata. It answers the question: *Which controlled terms belong to which knowledge organization system, and what are the system's lifecycle attributes?* A row from this view would show, for example, that the term *Pilot Review* (`term_id: model_delegation_child0`) belongs to the *Extended Review* system (`identifier: IDE-2086`, `status: active`, `scope: integrated-scope-52`).

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

The view `v_knowledge_organization_system_tagging_activity` joins `knowledge_organization_systems` with `tagging_activities` to reveal which tagging activities were conducted under which organizational framework. It answers: *Under which knowledge organization system was each tagging activity performed, and what were the activity's temporal and quality characteristics?* A representative row would show that activity `8843761` (method: `social`, quality_score: `19.45`, indexer_role: `reader`) was conducted under the *Extended Review* system (`IDE-2086`).

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

The view `v_controlled_term_knowledge_organization_system` presents controlled terms enriched with their parent system's identifier and name. It answers: *For each controlled term, what is the associated knowledge organization system?* A row would show that the term *Baseline Initiative* (`term_id: 2986222`) is governed by the *Pilot Initiative A* system (`identifier: IDE-2091`, `status: deprecated`).

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

The view `v_controlled_term_controlled_term` performs a self-join on `controlled_terms` to expose hierarchical and synonym relationships between terms. It answers: *How does each controlled term relate to other controlled terms through broader, narrower, and synonym links?* A row would show that the term *Pilot Review* (`controlled_term_id: 1000`) is linked to itself via `synonym_of_controlled_term_id`, `broader_than_controlled_term_id`, and `narrower_than_controlled_term_id` — all pointing to `1000`.

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

The view `v_social_tag_digital_resource` joins `social_tags` with `digital_resources` to show which social tags have been applied to which resources. It answers: *What social tags are associated with each digital resource, and what are the tag's usage statistics?* A row would show that the tag `baseline-tag-61` (`tag_id: 57dbb53c-8fcc-11eb-924d-9cd76263cbd0`, `usage_count: 87`) is associated with the resource *Compact Initiative* (`resource_id: 1167`, `status: published`).

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

The view `v_social_tag_user` joins `social_tags` with `users` to reveal which user contributed which social tag. It answers: *Who created or applied each social tag?* A row would show that user `9736910` (role: `reader`, affiliation: `baseline-affiliat-55`, `is_active: true`) is associated with the tag `baseline-tag-61`.

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

The view `v_social_tag_controlled_term` joins `social_tags` with `controlled_terms` to show the relationship between folksonomy tags and formal vocabulary terms. It answers: *Which controlled term is associated with each social tag?* A row would show that the tag `baseline-tag-61` is linked to the controlled term *Pilot Review* (`controlled_term_id: 1000`, `pref_label: Pilot Review`).

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

The view `v_digital_resource_social_tag_detail` joins `digital_resources` with `social_tags` to present resources alongside the social tags applied to them, enriched with tag metadata. It answers: *For each digital resource, what are the social tags, their usage counts, and their temporal characteristics?* A row would show that the resource *Compact Initiative* (`resource_id: 1167`, `format: legacy-format-25`, `status: published`) is tagged with `baseline-tag-61` (`usage_count: 87`, `is_ambiguous: true`, `first_used: 2022-09-19T08:24:00`).

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

The view `v_digital_resource_controlled_term` joins `digital_resources` with `controlled_terms` to show the formal vocabulary classification of each resource. It answers: *Which controlled term classifies each digital resource?* A row would show that the resource *Compact Initiative* (`resource_id: 1167`) is classified under the controlled term *Pilot Review* (`controlled_term_id: 1000`, `pref_label: Pilot Review`, `definition: primary-definiti-22`).

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

The view `v_digital_resource_user` joins `digital_resources` with `users` to reveal the creator or curator of each resource. It answers: *Which user is associated with each digital resource?* A row would show that the resource *Compact Initiative* (`resource_id: 1167`) is associated with user `9736910` (username: *Pilot Review*, role: `reader`, `is_active: true`).

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

The view `v_digital_resource_digital_collection` joins `digital_resources` with `digital_collections` to show which collection each resource belongs to. It answers: *Which digital collection contains each resource?* A row would show that the resource *Compact Initiative* (`resource_id: 1167`) belongs to digital collection `1`.

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

The view `v_tagging_activity_digital_resource` joins `tagging_activities` with `digital_resources` to show which resource was annotated in each activity. It answers: *What resource was the target of each tagging activity?* A row would show that activity `8843761` (method: `social`, quality_score: `19.45`) targeted the resource *Compact Initiative* (`resource_id: 1167`, `title: Compact Initiative`, `status: published`).

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

The view `v_tagging_activity_knowledge_organization_system` joins `tagging_activities` with `knowledge_organization_systems` to reveal the organizational framework under which each activity was conducted. It answers: *Under which knowledge organization system was each tagging activity performed?* A row would show that activity `8843761` was conducted under the *Extended Review* system (`identifier: IDE-2086`, `version: seasonal-version-71`, `scope: integrated-scope-52`, `status: active`).

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

The view `v_tagging_activity_social_tag` joins `tagging_activities` with `social_tags` to show which social tag was used in each activity. It answers: *Which social tag was applied during each tagging activity?* A row would show that activity `8843761` used the social tag `baseline-tag-61` (`tag_id: 57dbb53c-8fcc-11eb-924d-9cd76263cbd0`, `usage_count: 87`, `is_ambiguous: true`).

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

The view `v_tagging_activity_controlled_term` joins `tagging_activities` with `controlled_terms` to show which controlled term was applied in each activity. It answers: *Which controlled term was used during each tagging activity?* A row would show that activity `8843761` applied the controlled term *Pilot Review* (`controlled_term_id: 1000`, `pref_label: Pilot Review`, `definition: primary-definiti-22`).

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

The view `v_tagging_activity_user` joins `tagging_activities` with `users` to reveal who performed each tagging activity. It answers: *Which user conducted each tagging activity?* A row would show that activity `8843761` was performed by user `9736910` (username: *Pilot Review*, role: `reader`, affiliation: `baseline-affiliat-55`, `is_active: true`).

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

The view `v_user_digital_resource` joins `users` with `digital_resources` to show which resources are associated with each user. It answers: *What digital resources are linked to each user?* A row would show that user `9736910` (role: `reader`, `is_active: true`) is associated with the resource *Compact Initiative* (`resource_id: 1167`, `title: Compact Initiative`, `format: legacy-format-25`, `status: published`).

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

The view `v_user_social_tag` joins `users` with `social_tags` to reveal which social tags are associated with each user. It answers: *Which social tags has each user contributed or applied?* A row would show that user `9736910` (role: `reader`) is associated with the tag `baseline-tag-61` (`tag_text: baseline-tag-61`, `usage_count: 87`, `is_ambiguous: true`).

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

The view `v_user_tagging_activity` joins `users` with `tagging_activities` to show which tagging activities each user has performed. It answers: *What tagging activities has each user conducted?* A row would show that user `9736910` (role: `reader`, `is_active: true`) performed activity `8843761` (method: `social`, quality_score: `19.45`, indexer_role: `reader`).

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

The view `v_digital_collection_digital_resource_detail` joins `digital_collections` with `digital_resources` to present resources alongside their parent collection's details. It answers: *Which digital resources belong to each collection, and what are the resources' metadata?* A row would show that digital collection `1` contains the resource *Compact Initiative* (`resource_id: 1167`, `title: Compact Initiative`, `format: legacy-format-25`, `status: published`, `size_bytes: 7`).

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

The view `v_digital_collection_knowledge_organization_system` joins `digital_collections` with `knowledge_organization_systems` to reveal the relationship between collections and organizational frameworks. It answers: *Which knowledge organization system is associated with each digital collection?* A row would show that digital collection `1` is associated with the *Extended Review* system (`identifier: IDE-2086`, `name: Extended Review`, `status: active`).

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

The view `v_digital_collection_user` joins `digital_collections` with `users` to show which users are associated with each digital collection. It answers: *Which users manage or contribute to each digital collection?* A row would show that digital collection `1` is associated with user `9736910` (username: *Pilot Review*, role: `reader`, `is_active: true`).

The schema as a whole embodies a layered architecture: knowledge organization systems provide the conceptual scaffolding, controlled terms populate that scaffolding with formal vocabulary, social tags offer a parallel folksonomic layer, digital resources are the annotated objects, and tagging activities serve as the event log that binds users, resources, tags, and systems into a coherent provenance trail. Junction tables (`systems_terms`, `resources_tags`, `collections_resources`) resolve the many-to-many relationships that the base tables cannot express directly. The materialized views then reassemble these normalized fragments into domain-meaningful projections — each view answering a specific analytical question by joining the appropriate tables and presenting the result as a flat, queryable fact. This design supports both strict closed-world validation (via the controlled vocabulary path) and open-ended folksonomic exploration (via the social tag path), while the tagging activity table ensures that every annotation can be traced back to its actor, method, and temporal context.