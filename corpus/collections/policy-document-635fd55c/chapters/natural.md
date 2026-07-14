## Policy Governance and Social Media Compliance

Organizations that regulate public-facing communications must maintain a clear chain of authority: policies define what is permitted, personnel roles establish who holds responsibility, social media platforms and their posts serve as the observable output of those responsibilities, and investigations provide the mechanism for accountability when standards are breached. This chapter documents the operational architecture of such a system, tracing how each record type connects to the others and how analytical views synthesize the raw data into actionable intelligence.

**Table `policy_documents`**

| policy_number | title | last_updated | issued_by | approved_by | status | policy_document_policy_number | is_superseded_by_policy_document_policy_number | references_policy_document_policy_number | personnel_role_id |
|---|---|---|---|---|---|---|---|---|---|
| POL-2302 | Compact Initiative | 2023-06-17 | compact-issued-50 | regional-approved-54 | Active | POL-2302 | POL-2302 | POL-2302 | 1 |
| POL-2304 | Legacy Model | 2024-11-01 | composite-issued-51 | legacy-approved-55 | In Process | POL-2304 | POL-2304 | POL-2304 | 2 |
| POL-2306 | Regional Cluster A | 2025-04-12 | primary-issued-52 | compact-approved-56 | Superseded | POL-2306 | POL-2306 | POL-2306 | 3 |
| POL-2308 | Seasonal Review | 2022-09-23 | adaptive-issued-53 | composite-approved-57 | Active | POL-2308 | POL-2308 | POL-2308 | 4 |

The policy_documents table is the foundational registry of organizational directives. Each row represents a single policy instrument identified by a policy_number such as POL-2302 or POL-2308, with a human-readable title like Compact Initiative or Seasonal Review. The last_updated column tracks the most recent revision date, while issued_by and approved_by encode the issuing authority and the approving authority respectively—values such as compact-issued-50 and regional-approved-54 distinguish between the bodies that draft versus those that authorize. The status column classifies each policy as Active, In Process, or Superseded, enabling operators to filter for currently enforceable directives. Self-referential columns—policy_document_policy_number, is_superseded_by_policy_document_policy_number, and references_policy_document_policy_number—allow policies to point to one another, forming a dependency graph that captures supersession chains and cross-references. Every policy also carries a personnel_role_id, linking the document to the role responsible for its execution.

**Table `personnel_roles`**

| id | role_type | department | clearance_level | start_date | end_date | is_active | personnel_role_id | policy_document_policy_number | subject_to_policy_document_policy_number | created_at |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Employee | adaptive-departme-89 | regional-clearanc-36 | 2022-09-05 | 2022-09-01 | true | 1 | POL-2302 | POL-2302 | 2025-01-01 00:14:00 |
| 2 | Volunteer | distributed-departme-90 | legacy-clearanc-37 | 2023-02-16 | 2023-02-12 | false | 2 | POL-2304 | POL-2304 | 2025-02-06 03:14:00 |
| 3 | Practicum Student | baseline-departme-91 | compact-clearanc-38 | 2024-07-27 | 2024-07-23 | true | 3 | POL-2306 | POL-2306 | 2025-03-11 06:14:00 |
| 4 | Contractor | pilot-departme-92 | composite-clearanc-39 | 2025-12-11 | 2025-12-07 | false | 4 | POL-2308 | POL-2308 | 2025-04-16 09:14:00 |

Personnel_roles records the individuals and positions through which policies are enacted. The id column provides a unique identifier for each role assignment, while role_type distinguishes between Employee, Volunteer, Practicum Student, and Contractor—each carrying different levels of organizational commitment. The department column (for example, adaptive-departme-89 or pilot-departme-92) situates the role within a functional unit, and clearance_level (regional-clearanc-36, legacy-clearanc-37, and so on) encodes the scope of access granted. Start and end dates delimit the period of assignment, and the is_active flag provides a quick boolean filter for current versus historical assignments. The personnel_role_id column creates a self-link for role-to-role relationships, while policy_document_policy_number and subject_to_policy_document_policy_number tie the role to specific policies—one column indicating the policy the role is assigned to manage, the other indicating the policy under which the role operates. The created_at timestamp records when the assignment was first logged.

**Table `social_media_platforms`**

| social_media_platform_id | platform_name | platform_url | is_official | approval_date | monitoring_section | contact_info | personnel_role_id | policy_document_policy_number | social_media_post_id |
|---|---|---|---|---|---|---|---|---|---|
| 100 | Baseline Initiative D | https://bugs.launchpad.net/openstack-manuals/+bug/1458714 | false | 2023-10-10 | adaptive-monitori-89 | Jorge Luis Borges | 1 | POL-2302 | 1 |
| 101 | Distributed Model | https://www.nature.com/articles/nphoton.2017.99 | true | 2024-03-21 | distributed-monitori-90 | Focus Device | 2 | POL-2304 | 2 |
| 102 | Adaptive Cluster | https://www.nature.com/articles/nphoton.2014.26 | false | 2025-08-05 | baseline-monitori-91 | Thomas Rivers | 3 | POL-2306 | 3 |
| 103 | Primary Review A | https://defenders.org/elephant/basic-facts | true | 2022-01-16 | pilot-monitori-92 | Kimberly Myers | 4 | POL-2308 | 4 |

Social media platforms represent the external channels through which the organization communicates. Each row identifies a platform instance by social_media_platform_id (100 through 103 in the current dataset) and assigns it a platform_name such as Baseline Initiative D or Distributed Model. The platform_url provides the direct link to the channel, while is_official marks whether the platform is an authorized organizational asset—values of true and false separate sanctioned channels from unofficial ones. The approval_date records when the platform was formally authorized, and monitoring_section (adaptive-monitori-89, distributed-monitori-90, etc.) assigns it to a monitoring unit responsible for oversight. Contact information, stored in contact_info, names the individual point of contact—Jorge Luis Borges, Focus Device, Thomas Rivers, Kimberly Myers—ensuring that escalation paths are documented. The platform row also carries foreign keys to personnel_role_id and policy_document_policy_number, anchoring each platform to a responsible role and a governing policy.

**Table `social_media_posts`**

| social_media_post_id | post_id | content | post_date | post_type | is_official | is_monitored | is_subject_to_disclosure | social_media_platform_id | personnel_role_id | policy_document_policy_number | created_at | updated_at |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | 32811 | adaptive-content-83 | 2023-02-09T01:03:00 | Text | false | false | false | 100 | 1 | POL-2302 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 2 | 3717632 | distributed-content-84 | 2024-07-20T08:20:00 | Image | true | true | true | 101 | 2 | POL-2304 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 3 | 4654 | baseline-content-85 | 2025-12-04T15:37:00 | Video | false | false | false | 102 | 3 | POL-2306 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 4 | IVC0 | pilot-content-86 | 2022-05-15T22:54:00 | Link | true | true | true | 103 | 4 | POL-2308 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Social media posts are the individual communications published on the platforms. Each post carries a social_media_post_id and a post_id (32811, 3717632, 4654, IVC0), with content such as adaptive-content-83 or pilot-content-86 describing the message body. The post_date records when the content was published, and post_type classifies it as Text, Image, Video, or Link. Boolean flags— is_official, is_monitored, and is_subject_to_disclosure—encode the compliance posture of each post. A post that is both is_monitored and is_subject_to_disclosure, such as the row with post_id 3717632, signals content that requires active surveillance and may be subject to regulatory disclosure. The social_media_platform_id column links the post to its hosting platform, while personnel_role_id and policy_document_policy_number tie the post to the role that published it and the policy that governs it. Timestamps for created_at and updated_at capture the full lifecycle of the post.

**Table `investigations`**

| investigation_id | case_number | start_date | end_date | status | lead_investigator | social_media_post_id | personnel_role_id | policy_document_policy_number |
|---|---|---|---|---|---|---|---|---|
| 1 | CAS-2649 | 2022-09-05 | 2022-09-01 | Open | extended-lead-57 | 1 | 1 | POL-2302 |
| 2 | CAS-2654 | 2023-02-16 | 2023-02-12 | Closed | integrated-lead-58 | 2 | 2 | POL-2304 |
| 3 | CAS-2659 | 2024-07-27 | 2024-07-23 | Pending | seasonal-lead-59 | 3 | 3 | POL-2306 |
| 4 | CAS-2664 | 2025-12-11 | 2025-12-07 | Open | regional-lead-60 | 4 | 4 | POL-2308 |

Investigations are the enforcement mechanism. Each investigation is identified by investigation_id and assigned a case_number such as CAS-2649 or CAS-2664. The start_date and end_date delimit the investigation period, and status classifies it as Open, Closed, or Pending. The lead_investigator column names the responsible party—extended-lead-57, integrated-lead-58, seasonal-lead-59, regional-lead-60—and the investigation is linked to a specific social_media_post_id, personnel_role_id, and policy_document_policy_number, establishing exactly which post, which role, and which policy are under review. This triad of foreign keys ensures that every investigation can be traced back to its originating communication, the person responsible for it, and the policy standard it allegedly violated.

### Policy Self-Reference and Supersession

The view v_policy_document_policy_document answers the question: which policies reference themselves or other policies in their dependency chain? By joining policy_documents to itself on the policy_document_policy_number column, the view produces a side-by-side comparison of a policy and the document it points to.

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

Each row in this view pairs a policy_number with its document_policy_number, along with the title and last_updated date of both sides. In the current dataset, every policy references itself—POL-2302 appears as both the source and the target, as does POL-2304, POL-2306, and POL-2308. This self-referential pattern indicates that the policies are configured to point to their own canonical records, a design choice that ensures the dependency graph remains navigable even when no external cross-references exist. In production environments, this same join would surface chains where POL-2306 (Regional Cluster A, status Superseded) might reference a successor policy, allowing auditors to trace the evolution of policy requirements over time.

### Policy-to-Personnel Assignment

The view v_policy_document_personnel_role reveals which personnel roles are assigned to which policies. It joins policy_documents to personnel_roles, producing a combined record that shows the policy title alongside the role type, department, and clearance level of the responsible individual.

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

For example, the policy Compact Initiative (POL-2302, status Active) is assigned to role id 1, an Employee in department adaptive-departme-89 with regional-clearanc-36 clearance. The Legacy Model (POL-2304, In Process) is assigned to role id 2, a Volunteer in distributed-departme-90 with legacy-clearanc-37 clearance. The Regional Cluster A (POL-2306, Superseded) maps to role id 3, a Practicum Student in baseline-departme-91 with compact-clearanc-38 clearance. The Seasonal Review (POL-2308, Active) maps to role id 4, a Contractor in pilot-departme-92 with composite-clearanc-39 clearance. This view enables compliance officers to verify that every active policy has a designated responsible role and to audit whether clearance levels are appropriate for the sensitivity of the policy being managed.

### Personnel Self-Reference and Role Relationships

The view v_personnel_role_personnel_role joins the personnel_roles table to itself, exposing relationships between role assignments. This self-join can reveal supervisory chains, shared department assignments, or roles that operate under the same policy framework.

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

In the current dataset, each role references itself through the personnel_role_id column, producing rows where role id 1 pairs with role id 1, role id 2 with role id 2, and so on. While this self-referential pattern does not reveal cross-role relationships in the sample data, the join structure supports more complex scenarios where, for instance, a Contractor might be supervised by an Employee, or where multiple roles share a department and require coordinated policy enforcement.

### Personnel-to-Policy Assignment

The view v_personnel_role_policy_document connects personnel roles to the policies they are subject to, providing a clear mapping from individual responsibility to regulatory requirement.

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

This view shows that role id 1 (Employee, adaptive-departme-89) is subject to policy POL-2302 (Compact Initiative), role id 2 (Volunteer, distributed-departme-90) to POL-2304 (Legacy Model), role id 3 (Practicum Student, baseline-departme-91) to POL-2306 (Regional Cluster A), and role id 4 (Contractor, pilot-departme-92) to POL-2308 (Seasonal Review). The one-to-one mapping in the current data suggests a simplified assignment model where each role is governed by a single policy. In more complex deployments, the same role might appear in multiple rows, each tied to a different policy, reflecting the reality that personnel often operate under overlapping regulatory frameworks.

### Platform-to-Personnel Oversight

The view v_social_media_platform_personnel_role links social media platforms to the personnel roles responsible for monitoring them. This join answers the question: who is accountable for each communication channel?

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

The data shows that platform 100 (Baseline Initiative D) is overseen by role id 1 (Employee), platform 101 (Distributed Model) by role id 2 (Volunteer), platform 102 (Adaptive Cluster) by role id 3 (Practicum Student), and platform 103 (Primary Review A) by role id 4 (Contractor). The contact_info column provides the human point of contact for each platform—Jorge Luis Borges for the Baseline Initiative, Focus Device for the Distributed Model, Thomas Rivers for the Adaptive Cluster, and Kimberly Myers for the Primary Review. This view is essential for operational readiness: if a platform requires urgent moderation or escalation, operators can immediately identify the responsible role and the named contact.

### Platform-to-Policy Governance

The view v_social_media_platform_policy_document establishes which policy governs each social media platform. It joins platforms to policies, producing a record that shows the platform name alongside the policy title and status.

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

In the current dataset, platform 100 (Baseline Initiative D) is governed by POL-2302 (Compact Initiative, Active), platform 101 (Distributed Model) by POL-2304 (Legacy Model, In Process), platform 102 (Adaptive Cluster) by POL-2306 (Regional Cluster A, Superseded), and platform 103 (Primary Review A) by POL-2308 (Seasonal Review, Active). This view enables compliance auditors to verify that every active platform is covered by an active policy and to flag platforms whose governing policies have been superseded or are still in process.

### Platform-to-Post Publication

The view v_social_media_platform_social_media_post connects social media posts to their hosting platforms, answering the question: which platform published which post?

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

The join reveals that post 1 (content adaptive-content-83, type Text) was published on platform 100 (Baseline Initiative D), post 2 (distributed-content-84, type Image) on platform 101 (Distributed Model), post 3 (baseline-content-85, type Video) on platform 102 (Adaptive Cluster), and post 4 (pilot-content-86, type Link) on platform 103 (Primary Review A). This view is the foundation for platform-level analytics: it allows operators to count posts per platform, compare content types across channels, and identify which platforms are most active.

### Post-to-Platform Attribution

The view v_social_media_post_social_media_platform provides the inverse perspective, listing each post alongside its hosting platform. This join is useful when the starting point is a specific post and the question is which channel it appeared on.

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

Each row in this view pairs a post_id with its platform_name and platform_url. For instance, post 32811 (adaptive-content-83) appeared on Baseline Initiative D at https://bugs.launchpad.net/openstack-manuals/+bug/1458714, while post IVC0 (pilot-content-86) appeared on Primary Review A at https://defenders.org/elephant/basic-facts. The is_official flag on the platform side (true for Distributed Model and Primary Review A, false for Baseline Initiative D and Adaptive Cluster) helps distinguish official organizational communications from unofficial ones.

### Post-to-Personnel Authorship

The view v_social_media_post_personnel_role links social media posts to the personnel roles that authored or published them. This join answers the question: which role is responsible for each post?

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

The data shows that post 1 (adaptive-content-83) was published by role id 1 (Employee), post 2 (distributed-content-84) by role id 2 (Volunteer), post 3 (baseline-content-85) by role id 3 (Practicum Student), and post 4 (pilot-content-86) by role id 4 (Contractor). Combined with the is_official, is_monitored, and is_subject_to_disclosure flags on the post, this view enables compliance teams to assess whether the clearance level and role type of the author are appropriate for the compliance posture of the content. A post that is both is_monitored and is_subject_to_disclosure, such as post 2, should ideally be authored by a role with sufficient clearance and organizational standing.

### Post-to-Policy Compliance

The view v_social_media_post_policy_document connects each social media post to the policy that governs it. This join is critical for compliance auditing: it answers the question, which policy standard does this post need to satisfy?

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

In the current dataset, post 1 (adaptive-content-83) is governed by POL-2302 (Compact Initiative), post 2 (distributed-content-84) by POL-2304 (Legacy Model), post 3 (baseline-content-85) by POL-2306 (Regional Cluster A), and post 4 (pilot-content-86) by POL-2308 (Seasonal Review). When combined with the post's compliance flags, this view allows auditors to verify that posts flagged as is_subject_to_disclosure are indeed covered by active policies. Post 2, which carries all three compliance flags, is governed by POL-2304, which has status In Process—a potential compliance gap that warrants review.

### Investigation-to-Post溯源

The view v_investigation_social_media_post links investigations to the social media posts that triggered them. This join answers the question: which post is under investigation?

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

The data shows that investigation CAS-2649 (status Open, lead extended-lead-57) concerns post 1 (adaptive-content-83), investigation CAS-2654 (status Closed, lead integrated-lead-58) concerns post 2 (distributed-content-84), investigation CAS-2659 (status Pending, lead seasonal-lead-59) concerns post 3 (baseline-content-85), and investigation CAS-2664 (status Open, lead regional-lead-60) concerns post 4 (pilot-content-86). The status of each investigation—Open, Closed, or Pending—provides a real-time snapshot of enforcement activity. Notably, investigations CAS-2649 and CAS-2664 are both Open, indicating that two posts are currently under active review.

### Investigation-to-Personnel Accountability

The view v_investigation_personnel_role connects investigations to the personnel roles responsible for the posts under review. This join answers the question: which role is being held accountable?

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

Each row pairs an investigation with the role type, department, and clearance level of the responsible individual. Investigation CAS-2649 targets role id 1 (Employee, adaptive-departme-89), CAS-2654 targets role id 2 (Volunteer, distributed-departme-90), CAS-2659 targets role id 3 (Practicum Student, baseline-departme-91), and CAS-2664 targets role id 4 (Contractor, pilot-departme-92). This view is essential for organizational risk assessment: it reveals whether investigations disproportionately target certain role types or departments, and whether clearance levels are adequate for the responsibilities assigned.

### Investigation-to-Policy Standards

The view v_investigation_policy_document links investigations to the policies that define the standards under review. This join answers the question: which policy was allegedly violated?

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

The data shows that investigation CAS-2649 references POL-2302 (Compact Initiative), CAS-2654 references POL-2304 (Legacy Model), CAS-2659 references POL-2306 (Regional Cluster A), and CAS-2664 references POL-2308 (Seasonal Review). By combining this view with the investigation status and the policy status, compliance officers can assess whether investigations are being conducted under active policies or under superseded ones. An investigation referencing a Superseded policy—such as CAS-2659 referencing POL-2306—may require re-evaluation to determine whether the current governing policy applies.

### Synthesis

The five base tables and thirteen analytical views together form a coherent governance architecture. Policy documents define the rules, personnel roles assign responsibility, social media platforms and posts represent the observable communications, and investigations provide the enforcement mechanism. The self-referential columns within each table enable intra-table relationships—policies referencing policies, roles referencing roles—while the foreign keys across tables create a web of accountability that traces every post back to its author, its governing policy, its hosting platform, and any investigation it has triggered. For practitioners, this structure supports three core operations: compliance auditing (which posts satisfy which policies?), operational oversight (which roles manage which platforms?), and enforcement tracking (which investigations are open, closed, or pending?). The data, though drawn from a fictional organization, illustrates the structural patterns that any robust policy governance system must embody.