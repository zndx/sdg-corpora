## Ontology-Grounded Relational Modelling in Policy Governance

The domain under examination concerns the administration of organizational policy documents, the personnel who are subject to them, the social media channels through which policy-related communications are disseminated, and the investigations triggered when those communications require scrutiny. At its core, the ontology distinguishes five entity types—policy documents, personnel roles, social media platforms, social media posts, and investigations—each carrying attributes that capture the lifecycle of a policy artifact and the actors, channels, and enforcement actions surrounding it. The relational schema materializes this ontology through five base tables whose primary keys and foreign keys encode the cardinality-bounded relationships, while a suite of twelve views reconstructs the domain facts that analysts query in their native, denormalized form.

**Table `policy_documents`**

| policy_number | title | last_updated | issued_by | approved_by | status | policy_document_policy_number | is_superseded_by_policy_document_policy_number | references_policy_document_policy_number | personnel_role_id |
|---|---|---|---|---|---|---|---|---|---|
| POL-2302 | Compact Initiative | 2023-06-17 | compact-issued-50 | regional-approved-54 | Active | POL-2302 | POL-2302 | POL-2302 | 1 |
| POL-2304 | Legacy Model | 2024-11-01 | composite-issued-51 | legacy-approved-55 | In Process | POL-2304 | POL-2304 | POL-2304 | 2 |
| POL-2306 | Regional Cluster A | 2025-04-12 | primary-issued-52 | compact-approved-56 | Superseded | POL-2306 | POL-2306 | POL-2306 | 3 |
| POL-2308 | Seasonal Review | 2022-09-23 | adaptive-issued-53 | composite-approved-57 | Active | POL-2308 | POL-2308 | POL-2308 | 4 |

The `policy_documents` table anchors the ontology. Its primary key is `policy_number`, a business key such as `POL-2302` or `POL-2308` that uniquely identifies each policy artifact. The column `title` carries human-readable labels like *Compact Initiative* and *Seasonal Review*, while `last_updated` records the most recent modification date in ISO format (`2023-06-17`, `2024-11-01`). The `issued_by` and `approved_by` columns store organizational identifiers—`compact-issued-50`, `regional-approved-54`—that point to the issuing and approving bodies within the ontology. The `status` column enumerates the lifecycle state of the document (`Active`, `In Process`, `Superseded`), and `personnel_role_id` is a foreign key referencing the `personnel_roles` table, establishing that each policy document is associated with exactly one personnel role. The self-referencing columns `policy_document_policy_number`, `is_superseded_by_policy_document_policy_number`, and `references_policy_document_policy_number` model intra-document relationships: a policy may supersede another, be superseded by another, or reference another, all within the same table.

**Table `personnel_roles`**

| id | role_type | department | clearance_level | start_date | end_date | is_active | personnel_role_id | policy_document_policy_number | subject_to_policy_document_policy_number | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Employee | adaptive-departme-89 | regional-clearanc-36 | 2022-09-05 | 2022-09-01 | true | 1 | POL-2302 | POL-2302 | 2025-01-01 00:14:00 |
| 2 | Volunteer | distributed-departme-90 | legacy-clearanc-37 | 2023-02-16 | 2023-02-12 | false | 2 | POL-2304 | POL-2304 | 2025-02-06 03:14:00 |
| 3 | Practicum Student | baseline-departme-91 | compact-clearanc-38 | 2024-07-27 | 2024-07-23 | true | 3 | POL-2306 | POL-2306 | 2025-03-11 06:14:00 |
| 4 | Contractor | pilot-departme-92 | composite-clearanc-39 | 2025-12-11 | 2025-12-07 | false | 4 | POL-2308 | POL-2308 | 2025-04-16 09:14:00 |

The `personnel_roles` table captures the human and organizational actors. Its surrogate primary key is `id` (values `1` through `4`), while `role_type` distinguishes the ontology's role subtypes: `Employee`, `Volunteer`, `Practicum Student`, and `Contractor`. The `department` column holds abbreviated department identifiers such as `adaptive-departme-89` and `pilot-departme-92`, and `clearance_level` records the access tier (`regional-clearanc-36`, `legacy-clearanc-37`). Temporal attributes `start_date` and `end_date` bound the validity window of each role assignment, while `is_active` is a boolean flag (`true` or `false`). The foreign key `policy_document_policy_number` links each personnel role back to the policy document it is subject to, and the self-referencing columns `personnel_role_id`, `subject_to_policy_document_policy_number` support intra-role relationships. The `created_at` timestamp records when the role record was first materialized.

**Table `social_media_platforms`**

| social_media_platform_id | platform_name | platform_url | is_official | approval_date | monitoring_section | contact_info | personnel_role_id | policy_document_policy_number | social_media_post_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Baseline Initiative D | https://bugs.launchpad.net/openstack-manuals/+bug/1458714 | false | 2023-10-10 | adaptive-monitori-89 | Jorge Luis Borges | 1 | POL-2302 | 1 |
| 101 | Distributed Model | https://www.nature.com/articles/nphoton.2017.99 | true | 2024-03-21 | distributed-monitori-90 | Focus Device | 2 | POL-2304 | 2 |
| 102 | Adaptive Cluster | https://www.nature.com/articles/nphoton.2014.26 | false | 2025-08-05 | baseline-monitori-91 | Thomas Rivers | 3 | POL-2306 | 3 |
| 103 | Primary Review A | https://defenders.org/elephant/basic-facts | true | 2022-01-16 | pilot-monitori-92 | Kimberly Myers | 4 | POL-2308 | 4 |

Social media platforms are modelled in `social_media_platforms`, whose primary key is `social_media_platform_id` (values `100` through `103`). The `platform_name` column carries descriptive labels such as *Baseline Initiative D* and *Primary Review A*, while `platform_url` stores the canonical URL of the platform. The `is_official` boolean distinguishes official from unofficial channels, and `approval_date` records when the platform received formal approval (`2023-10-10`, `2024-03-21`). The `monitoring_section` and `contact_info` columns capture operational metadata (`adaptive-monitori-89`, *Jorge Luis Borges*). Foreign keys `personnel_role_id` and `policy_document_policy_number` tie each platform to a personnel role and a policy document, respectively, while `social_media_post_id` links the platform to its associated social media post.

**Table `social_media_posts`**

| social_media_post_id | post_id | content | post_date | post_type | is_official | is_monitored | is_subject_to_disclosure | social_media_platform_id | personnel_role_id | policy_document_policy_number | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 32811 | adaptive-content-83 | 2023-02-09T01:03:00 | Text | false | false | false | 100 | 1 | POL-2302 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 3717632 | distributed-content-84 | 2024-07-20T08:20:00 | Image | true | true | true | 101 | 2 | POL-2304 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 4654 | baseline-content-85 | 2025-12-04T15:37:00 | Video | false | false | false | 102 | 3 | POL-2306 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | IVC0 | pilot-content-86 | 2022-05-15T22:54:00 | Link | true | true | true | 103 | 4 | POL-2308 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

The `social_media_posts` table is the most attribute-rich entity. Its primary key is `social_media_post_id` (`1` through `4`), and `post_id` stores an external identifier (`32811`, `3717632`, `4654`, `IVC0`). The `content` column holds the post body (`adaptive-content-83`, `distributed-content-84`), while `post_date` records the publication timestamp (`2023-02-09T01:03:00`, `2024-07-20T08:20:00`). The `post_type` column enumerates the media format (`Text`, `Image`, `Video`, `Link`), and the boolean flags `is_official`, `is_monitored`, and `is_subject_to_disclosure` capture the governance posture of each post. Foreign keys `social_media_platform_id`, `personnel_role_id`, and `policy_document_policy_number` link the post to its platform, its authoring personnel role, and the governing policy document. The `created_at` and `updated_at` timestamps record the full lifecycle of the post record.

**Table `investigations`**

| investigation_id | case_number | start_date | end_date | status | lead_investigator | social_media_post_id | personnel_role_id | policy_document_policy_number |
|---|---|---|---|---|---|---|---|---|
| 1 | CAS-2649 | 2022-09-05 | 2022-09-01 | Open | extended-lead-57 | 1 | 1 | POL-2302 |
| 2 | CAS-2654 | 2023-02-16 | 2023-02-12 | Closed | integrated-lead-58 | 2 | 2 | POL-2304 |
| 3 | CAS-2659 | 2024-07-27 | 2024-07-23 | Pending | seasonal-lead-59 | 3 | 3 | POL-2306 |
| 4 | CAS-2664 | 2025-12-11 | 2025-12-07 | Open | regional-lead-60 | 4 | 4 | POL-2308 |

The `investigations` table models enforcement actions. Its primary key is `investigation_id` (`1` through `4`), and `case_number` stores the external case identifier (`CAS-2649`, `CAS-2654`). The `start_date` and `end_date` columns bound the investigation window, while `status` enumerates the current state (`Open`, `Closed`, `Pending`). The `lead_investigator` column records the identifier of the assigned investigator (`extended-lead-57`, `integrated-lead-58`). Foreign keys `social_media_post_id`, `personnel_role_id`, and `policy_document_policy_number` tie each investigation to the post under review, the personnel role involved, and the governing policy document.

The base tables above form a star-like topology: `policy_documents` sits at the centre, with `personnel_roles`, `social_media_platforms`, `social_media_posts`, and `investigations` all referencing it through `policy_document_policy_number`. Each of the four satellite tables also references `personnel_roles` through `personnel_role_id`, creating a second layer of connectivity. The self-referencing columns in `policy_documents` and `personnel_roles` add intra-entity edges that the views below make queryable.

**View `v_policy_document_policy_document`**

```sql
CREATE VIEW v_policy_document_policy_document AS
SELECT a.policy_number, a.title, a.last_updated, a.issued_by, b.policy_number AS document_policy_number, b.title AS document_title, b.last_updated AS document_last_updated
FROM policy_documents a JOIN policy_documents b ON a.policy_document_policy_number = b.policy_number;
```

| policy_number | title | last_updated | issued_by | document_policy_number | document_title | document_last_updated |
|---|---|---|---|---|---|---|
| POL-2302 | Compact Initiative | 2023-06-17 | compact-issued-50 | POL-2302 | Compact Initiative | 2023-06-17 |
| POL-2304 | Legacy Model | 2024-11-01 | composite-issued-51 | POL-2304 | Legacy Model | 2024-11-01 |
| POL-2306 | Regional Cluster A | 2025-04-12 | primary-issued-52 | POL-2306 | Regional Cluster A | 2025-04-12 |
| POL-2308 | Seasonal Review | 2022-09-23 | adaptive-issued-53 | POL-2308 | Seasonal Review | 2022-09-23 |

The view `v_policy_document_policy_document` answers the question: *Which policy documents reference or supersede other policy documents?* It performs a self-join on `policy_documents`, matching `a.policy_document_policy_number` to `b.policy_number`. The result reproduces each policy alongside its referenced counterpart. For the row where `policy_number` is `POL-2302` (*Compact Initiative*), the columns `document_policy_number`, `document_title`, and `document_last_updated` all resolve to `POL-2302`, *Compact Initiative*, and `2023-06-17`—indicating that the document references itself, a common pattern when a policy's supersession chain has not yet diverged. The same self-referencing pattern holds for `POL-2304`, `POL-2306`, and `POL-2308`.

**View `v_policy_document_personnel_role`**

```sql
CREATE VIEW v_policy_document_personnel_role AS
SELECT a.policy_number, a.title, a.last_updated, a.issued_by, b.id AS role_id, b.role_type AS role_role_type, b.department AS role_department
FROM policy_documents a JOIN personnel_roles b ON a.personnel_role_id = b.id;
```

| policy_number | title | last_updated | issued_by | role_id | role_role_type | role_department |
|---|---|---|---|---|---|---|
| POL-2302 | Compact Initiative | 2023-06-17 | compact-issued-50 | 1 | Employee | adaptive-departme-89 |
| POL-2304 | Legacy Model | 2024-11-01 | composite-issued-51 | 2 | Volunteer | distributed-departme-90 |
| POL-2306 | Regional Cluster A | 2025-04-12 | primary-issued-52 | 3 | Practicum Student | baseline-departme-91 |
| POL-2308 | Seasonal Review | 2022-09-23 | adaptive-issued-53 | 4 | Contractor | pilot-departme-92 |

The view `v_policy_document_personnel_role` reconstructs the association between policy documents and the personnel roles subject to them. By joining `policy_documents` to `personnel_roles` on `policy_documents.policy_number = personnel_roles.policy_document_policy_number`, it produces rows that pair a policy title with a role type, department, and clearance level. For example, the row pairing `POL-2302` (*Compact Initiative*) with personnel role `1` reveals that an `Employee` in department `adaptive-departme-89` with clearance `regional-clearanc-36` is the subject of this policy. The view thus materializes the ontology's "policy governs role" relationship in a single denormalized row.

**View `v_personnel_role_personnel_role`**

```sql
CREATE VIEW v_personnel_role_personnel_role AS
SELECT a.id, a.role_type, a.department, a.clearance_level, b.id AS role_id, b.role_type AS role_role_type, b.department AS role_department
FROM personnel_roles a JOIN personnel_roles b ON a.personnel_role_id = b.id;
```

| id | role_type | department | clearance_level | role_id | role_role_type | role_department |
|---|---|---|---|---|---|---|
| 1 | Employee | adaptive-departme-89 | regional-clearanc-36 | 1 | Employee | adaptive-departme-89 |
| 2 | Volunteer | distributed-departme-90 | legacy-clearanc-37 | 2 | Volunteer | distributed-departme-90 |
| 3 | Practicum Student | baseline-departme-91 | compact-clearanc-38 | 3 | Practicum Student | baseline-departme-91 |
| 4 | Contractor | pilot-departme-92 | composite-clearanc-39 | 4 | Contractor | pilot-departme-92 |

The view `v_personnel_role_personnel_role` performs a self-join on `personnel_roles`, matching `a.personnel_role_id` to `b.personnel_role_id`. This view surfaces intra-role relationships: it answers *which personnel roles are linked to other personnel roles through the self-referencing columns*. In the current data, each role (`1` through `4`) joins to itself, producing rows where the left and right sides carry identical `role_type`, `department`, and `clearance_level` values. This pattern indicates that the self-referencing columns have not yet been populated with cross-role links, but the view's structure is ready to expose hierarchical or peer relationships once they are introduced.

**View `v_personnel_role_policy_document`**

```sql
CREATE VIEW v_personnel_role_policy_document AS
SELECT a.id, a.role_type, a.department, a.clearance_level, b.policy_number AS document_policy_number, b.title AS document_title, b.last_updated AS document_last_updated
FROM personnel_roles a JOIN policy_documents b ON a.policy_document_policy_number = b.policy_number;
```

| id | role_type | department | clearance_level | document_policy_number | document_title | document_last_updated |
|---|---|---|---|---|---|---|
| 1 | Employee | adaptive-departme-89 | regional-clearanc-36 | POL-2302 | Compact Initiative | 2023-06-17 |
| 2 | Volunteer | distributed-departme-90 | legacy-clearanc-37 | POL-2304 | Legacy Model | 2024-11-01 |
| 3 | Practicum Student | baseline-departme-91 | compact-clearanc-38 | POL-2306 | Regional Cluster A | 2025-04-12 |
| 4 | Contractor | pilot-departme-92 | composite-clearanc-39 | POL-2308 | Seasonal Review | 2022-09-23 |

The view `v_personnel_role_policy_document` inverts the perspective of `v_policy_document_personnel_role`: it starts from the personnel role and surfaces the policy document it is subject to. Joining `personnel_roles` to `policy_documents` on `personnel_roles.policy_document_policy_number = policy_documents.policy_number`, it yields rows such as the one where role `2` (*Volunteer*, `distributed-departme-90`) is linked to policy `POL-2304` (*Legacy Model*). This view is useful for answering *which policies apply to a given role or department*, a common query in compliance audits.

**View `v_social_media_platform_personnel_role`**

```sql
CREATE VIEW v_social_media_platform_personnel_role AS
SELECT a.social_media_platform_id, a.platform_name, a.platform_url, a.is_official, b.id AS role_id, b.role_type AS role_role_type, b.department AS role_department
FROM social_media_platforms a JOIN personnel_roles b ON a.personnel_role_id = b.id;
```

| social_media_platform_id | platform_name | platform_url | is_official | role_id | role_role_type | role_department |
|---|---|---|---|---|---|---|
| 100 | Baseline Initiative D | https://bugs.launchpad.net/openstack-manuals/+bug/1458714 | false | 1 | Employee | adaptive-departme-89 |
| 101 | Distributed Model | https://www.nature.com/articles/nphoton.2017.99 | true | 2 | Volunteer | distributed-departme-90 |
| 102 | Adaptive Cluster | https://www.nature.com/articles/nphoton.2014.26 | false | 3 | Practicum Student | baseline-departme-91 |
| 103 | Primary Review A | https://defenders.org/elephant/basic-facts | true | 4 | Contractor | pilot-departme-92 |

The view `v_social_media_platform_personnel_role` joins `social_media_platforms` to `personnel_roles` on `social_media_platforms.personnel_role_id = personnel_roles.id`, answering *which personnel role is responsible for which social media platform*. The row for platform `100` (*Baseline Initiative D*) reveals that it is managed by personnel role `1` (an `Employee` in `adaptive-departme-89`), while platform `103` (*Primary Review A*) is managed by role `4` (a `Contractor` in `pilot-departme-92`). This view materializes the governance chain from platform to responsible actor.

**View `v_social_media_platform_policy_document`**

```sql
CREATE VIEW v_social_media_platform_policy_document AS
SELECT a.social_media_platform_id, a.platform_name, a.platform_url, a.is_official, b.policy_number AS document_policy_number, b.title AS document_title, b.last_updated AS document_last_updated
FROM social_media_platforms a JOIN policy_documents b ON a.policy_document_policy_number = b.policy_number;
```

| social_media_platform_id | platform_name | platform_url | is_official | document_policy_number | document_title | document_last_updated |
|---|---|---|---|---|---|---|
| 100 | Baseline Initiative D | https://bugs.launchpad.net/openstack-manuals/+bug/1458714 | false | POL-2302 | Compact Initiative | 2023-06-17 |
| 101 | Distributed Model | https://www.nature.com/articles/nphoton.2017.99 | true | POL-2304 | Legacy Model | 2024-11-01 |
| 102 | Adaptive Cluster | https://www.nature.com/articles/nphoton.2014.26 | false | POL-2306 | Regional Cluster A | 2025-04-12 |
| 103 | Primary Review A | https://defenders.org/elephant/basic-facts | true | POL-2308 | Seasonal Review | 2022-09-23 |

The view `v_social_media_platform_policy_document` joins `social_media_platforms` to `policy_documents` on `social_media_platforms.policy_document_policy_number = policy_documents.policy_number`, answering *which policy document governs which social media platform*. The row for platform `100` (*Baseline Initiative D*) shows it is governed by policy `POL-2302` (*Compact Initiative*), while platform `103` (*Primary Review A*) is governed by `POL-2308` (*Seasonal Review*). This view is essential for compliance reporting: it lets auditors trace every platform back to its governing policy.

**View `v_social_media_platform_social_media_post`**

```sql
CREATE VIEW v_social_media_platform_social_media_post AS
SELECT a.social_media_platform_id, a.platform_name, a.platform_url, a.is_official, b.social_media_post_id AS post_social_media_post_id, b.post_id AS post_post_id, b.content AS post_content
FROM social_media_platforms a JOIN social_media_posts b ON a.social_media_post_id = b.social_media_post_id;
```

| social_media_platform_id | platform_name | platform_url | is_official | post_social_media_post_id | post_post_id | post_content |
|---|---|---|---|---|---|---|
| 100 | Baseline Initiative D | https://bugs.launchpad.net/openstack-manuals/+bug/1458714 | false | 1 | 32811 | adaptive-content-83 |
| 101 | Distributed Model | https://www.nature.com/articles/nphoton.2017.99 | true | 2 | 3717632 | distributed-content-84 |
| 102 | Adaptive Cluster | https://www.nature.com/articles/nphoton.2014.26 | false | 3 | 4654 | baseline-content-85 |
| 103 | Primary Review A | https://defenders.org/elephant/basic-facts | true | 4 | IVC0 | pilot-content-86 |

The view `v_social_media_platform_social_media_post` joins `social_media_platforms` to `social_media_posts` on `social_media_platforms.social_media_post_id = social_media_posts.social_media_post_id`, answering *which social media post is published on which platform*. The row for platform `100` (*Baseline Initiative D*) links to post `1` (content `adaptive-content-83`, type `Text`, posted on `2023-02-09T01:03:00`), while platform `103` (*Primary Review A*) links to post `4` (content `pilot-content-86`, type `Link`, posted on `2022-05-15T22:54:00`). This view reconstructs the platform-to-post relationship that is stored as a foreign key in the `social_media_platforms` table.

**View `v_social_media_post_social_media_platform`**

```sql
CREATE VIEW v_social_media_post_social_media_platform AS
SELECT a.social_media_post_id, a.post_id, a.content, a.post_date, b.social_media_platform_id AS platform_social_media_platform_id, b.platform_name AS platform_platform_name, b.platform_url AS platform_platform_url
FROM social_media_posts a JOIN social_media_platforms b ON a.social_media_platform_id = b.social_media_platform_id;
```

| social_media_post_id | post_id | content | post_date | platform_social_media_platform_id | platform_platform_name | platform_platform_url |
|---|---|---|---|---|---|---|
| 1 | 32811 | adaptive-content-83 | 2023-02-09T01:03:00 | 100 | Baseline Initiative D | https://bugs.launchpad.net/openstack-manuals/+bug/1458714 |
| 2 | 3717632 | distributed-content-84 | 2024-07-20T08:20:00 | 101 | Distributed Model | https://www.nature.com/articles/nphoton.2017.99 |
| 3 | 4654 | baseline-content-85 | 2025-12-04T15:37:00 | 102 | Adaptive Cluster | https://www.nature.com/articles/nphoton.2014.26 |
| 4 | IVC0 | pilot-content-86 | 2022-05-15T22:54:00 | 103 | Primary Review A | https://defenders.org/elephant/basic-facts |

The view `v_social_media_post_social_media_platform` inverts the previous join: it starts from `social_media_posts` and surfaces the platform each post belongs to. Joining on `social_media_posts.social_media_platform_id = social_media_platforms.social_media_platform_id`, it yields rows such as post `2` (*distributed-content-84*, type `Image`) being published on platform `101` (*Distributed Model*). This view is useful for content analysts who need to know the platform context of each post.

**View `v_social_media_post_personnel_role`**

```sql
CREATE VIEW v_social_media_post_personnel_role AS
SELECT a.social_media_post_id, a.post_id, a.content, a.post_date, b.id AS role_id, b.role_type AS role_role_type, b.department AS role_department
FROM social_media_posts a JOIN personnel_roles b ON a.personnel_role_id = b.id;
```

| social_media_post_id | post_id | content | post_date | role_id | role_role_type | role_department |
|---|---|---|---|---|---|---|
| 1 | 32811 | adaptive-content-83 | 2023-02-09T01:03:00 | 1 | Employee | adaptive-departme-89 |
| 2 | 3717632 | distributed-content-84 | 2024-07-20T08:20:00 | 2 | Volunteer | distributed-departme-90 |
| 3 | 4654 | baseline-content-85 | 2025-12-04T15:37:00 | 3 | Practicum Student | baseline-departme-91 |
| 4 | IVC0 | pilot-content-86 | 2022-05-15T22:54:00 | 4 | Contractor | pilot-departme-92 |

The view `v_social_media_post_personnel_role` joins `social_media_posts` to `personnel_roles` on `social_media_posts.personnel_role_id = personnel_roles.id`, answering *which personnel role authored or is associated with which social media post*. The row for post `1` (content `adaptive-content-83`) links to personnel role `1` (an `Employee`), while post `4` (content `pilot-content-86`) links to role `4` (a `Contractor`). This view materializes the authorship relationship central to the ontology.

**View `v_social_media_post_policy_document`**

```sql
CREATE VIEW v_social_media_post_policy_document AS
SELECT a.social_media_post_id, a.post_id, a.content, a.post_date, b.policy_number AS document_policy_number, b.title AS document_title, b.last_updated AS document_last_updated
FROM social_media_posts a JOIN policy_documents b ON a.policy_document_policy_number = b.policy_number;
```

| social_media_post_id | post_id | content | post_date | document_policy_number | document_title | document_last_updated |
|---|---|---|---|---|---|---|
| 1 | 32811 | adaptive-content-83 | 2023-02-09T01:03:00 | POL-2302 | Compact Initiative | 2023-06-17 |
| 2 | 3717632 | distributed-content-84 | 2024-07-20T08:20:00 | POL-2304 | Legacy Model | 2024-11-01 |
| 3 | 4654 | baseline-content-85 | 2025-12-04T15:37:00 | POL-2306 | Regional Cluster A | 2025-04-12 |
| 4 | IVC0 | pilot-content-86 | 2022-05-15T22:54:00 | POL-2308 | Seasonal Review | 2022-09-23 |

The view `v_social_media_post_policy_document` joins `social_media_posts` to `policy_documents` on `social_media_posts.policy_document_policy_number = policy_documents.policy_number`, answering *which policy document governs which social media post*. The row for post `2` (*distributed-content-84*) shows it is governed by policy `POL-2304` (*Legacy Model*), while post `3` (*baseline-content-85*) is governed by `POL-2306` (*Regional Cluster A*). This view is critical for compliance: it lets analysts determine whether a given post falls under an active, superseded, or in-process policy.

**View `v_investigation_social_media_post`**

```sql
CREATE VIEW v_investigation_social_media_post AS
SELECT a.investigation_id, a.case_number, a.start_date, a.end_date, b.social_media_post_id AS post_social_media_post_id, b.post_id AS post_post_id, b.content AS post_content
FROM investigations a JOIN social_media_posts b ON a.social_media_post_id = b.social_media_post_id;
```

| investigation_id | case_number | start_date | end_date | post_social_media_post_id | post_post_id | post_content |
|---|---|---|---|---|---|---|
| 1 | CAS-2649 | 2022-09-05 | 2022-09-01 | 1 | 32811 | adaptive-content-83 |
| 2 | CAS-2654 | 2023-02-16 | 2023-02-12 | 2 | 3717632 | distributed-content-84 |
| 3 | CAS-2659 | 2024-07-27 | 2024-07-23 | 3 | 4654 | baseline-content-85 |
| 4 | CAS-2664 | 2025-12-11 | 2025-12-07 | 4 | IVC0 | pilot-content-86 |

The view `v_investigation_social_media_post` joins `investigations` to `social_media_posts` on `investigations.social_media_post_id = social_media_posts.social_media_post_id`, answering *which social media post is under investigation*. The row for investigation `1` (case `CAS-2649`, status `Open`) links to post `1` (content `adaptive-content-83`, type `Text`), while investigation `2` (case `CAS-2654`, status `Closed`) links to post `2` (content `distributed-content-84`, type `Image`). This view reconstructs the investigation-to-post relationship, enabling auditors to see the content that triggered each case.

**View `v_investigation_personnel_role`**

```sql
CREATE VIEW v_investigation_personnel_role AS
SELECT a.investigation_id, a.case_number, a.start_date, a.end_date, b.id AS role_id, b.role_type AS role_role_type, b.department AS role_department
FROM investigations a JOIN personnel_roles b ON a.personnel_role_id = b.id;
```

| investigation_id | case_number | start_date | end_date | role_id | role_role_type | role_department |
|---|---|---|---|---|---|---|
| 1 | CAS-2649 | 2022-09-05 | 2022-09-01 | 1 | Employee | adaptive-departme-89 |
| 2 | CAS-2654 | 2023-02-16 | 2023-02-12 | 2 | Volunteer | distributed-departme-90 |
| 3 | CAS-2659 | 2024-07-27 | 2024-07-23 | 3 | Practicum Student | baseline-departme-91 |
| 4 | CAS-2664 | 2025-12-11 | 2025-12-07 | 4 | Contractor | pilot-departme-92 |

The view `v_investigation_personnel_role` joins `investigations` to `personnel_roles` on `investigations.personnel_role_id = personnel_roles.id`, answering *which personnel role is involved in which investigation*. The row for investigation `3` (case `CAS-2659`, status `Pending`) links to personnel role `3` (a `Practicum Student` in `baseline-departme-91`), while investigation `4` (case `CAS-2664`, status `Open`) links to role `4` (a `Contractor`). This view surfaces the human element of investigations, connecting enforcement actions to the roles they concern.

**View `v_investigation_policy_document`**

```sql
CREATE VIEW v_investigation_policy_document AS
SELECT a.investigation_id, a.case_number, a.start_date, a.end_date, b.policy_number AS document_policy_number, b.title AS document_title, b.last_updated AS document_last_updated
FROM investigations a JOIN policy_documents b ON a.policy_document_policy_number = b.policy_number;
```

| investigation_id | case_number | start_date | end_date | document_policy_number | document_title | document_last_updated |
|---|---|---|---|---|---|---|
| 1 | CAS-2649 | 2022-09-05 | 2022-09-01 | POL-2302 | Compact Initiative | 2023-06-17 |
| 2 | CAS-2654 | 2023-02-16 | 2023-02-12 | POL-2304 | Legacy Model | 2024-11-01 |
| 3 | CAS-2659 | 2024-07-27 | 2024-07-23 | POL-2306 | Regional Cluster A | 2025-04-12 |
| 4 | CAS-2664 | 2025-12-11 | 2025-12-07 | POL-2308 | Seasonal Review | 2022-09-23 |

The view `v_investigation_policy_document` joins `investigations` to `policy_documents` on `investigations.policy_document_policy_number = policy_documents.policy_number`, answering *which policy document is the basis for which investigation*. The row for investigation `1` (case `CAS-2649`) links to policy `POL-2302` (*Compact Initiative*), while investigation `4` (case `CAS-2664`) links to `POL-2308` (*Seasonal Review*). This view completes the enforcement chain: it shows that every investigation is grounded in a specific policy document, closing the loop from policy to post to investigation.

The schema above demonstrates a clean ontology-to-relations mapping: each entity type becomes a table, each attribute becomes a column, and each many-to-one or one-to-one relationship becomes a foreign key. Self-referencing columns in `policy_documents` and `personnel_roles` capture intra-entity relationships that the corresponding self-join views (`v_policy_document_policy_document`, `v_personnel_role_personnel_role`) make queryable. The twelve denormalized views collectively reconstruct every pairwise relationship in the domain, allowing analysts to ask questions about policy governance, personnel accountability, platform oversight, post content, and investigation outcomes without writing joins manually. The result is a schema that is both normalized for update integrity and fully denormalized for analytical clarity through its view layer.