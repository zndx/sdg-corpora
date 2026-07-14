# The Perpetual Prayer and Occasion Card Service

Religious and charitable organizations have long maintained traditions of intercessory prayer and commemorative correspondence. The operational backbone of such a service rests on three interlocking concerns: the management of occasion cards sent to mark life events, the stewardship of perpetual prayer folders dedicated to specific saints or devotions, and the enrolment of individuals whose names are entered into these ongoing spiritual practices. Every transaction, from the initial enrolment of a person to the delivery of sympathy cards to a bereaved family, flows through a structured set of records that capture who is enrolled, which cards are associated with each enrolment, which folder serves as the devotional home, and what orders have been placed for physical materials.

## Occasion Cards and Their Attributes

The service begins with occasion cards—physical or digital cards dispatched to mark specific moments. Each card carries a type that identifies its purpose, a reference number for internal tracking, and financial parameters that govern donations.

**Table `occasion_cards`**

| occasion_card_id | card_type | reference_number | suggested_donation | is_pre_signed | is_free | perpetual_folder_id |
|---|---|---|---|---|---|---|
| 1 | Sympathy | REF-2039 | 21.95 | true | true | 100 |
| 2 | Get Well | REF-2040 | 25.90 | false | false | 101 |
| 3 | For Your Intention | REF-2041 | 29.85 | true | true | 102 |
| 4 | Thank You | REF-2042 | 33.80 | false | false | 103 |

The card types in the system—Sympathy, Get Well, For Your Intention, and Thank You—represent the full range of life events the service supports. Card REF-2039, a Sympathy card, is configured as pre-signed and free of charge, with a suggested donation of 21.95. By contrast, card REF-2040 (Get Well) is neither pre-signed nor free, carrying a suggested donation of 25.90. The For Your Intention card (REF-2041) mirrors the Sympathy card's pre-signed and free configuration at a slightly higher suggested donation of 29.85. The Thank You card (REF-2042) follows the Get Well pattern: not pre-signed, not free, with a suggested donation of 33.80. Each card is also linked to a perpetual folder, establishing the devotional context in which the card operates.

## Perpetual Folders and Their Devotional Identity

Perpetual folders serve as the enduring spiritual home for enrollees. Each folder is named after a saint, devotion, or religious theme, and carries physical attributes such as cover color and branding elements.

**Table `perpetual_folders`**

| id | folder_name | cover_color | suggested_donation | has_society_logo | enrollee_id | created_at | updated_at |
|---|---|---|---|---|---|---|---|
| 100 | Agony in the Garden | White | 21.95 | true | 1 | 2025-01-01 00:14:00 | 2025-01-02 00:41:00 |
| 101 | Sacred Heart | Red | 25.90 | false | 2 | 2025-02-06 03:14:00 | 2025-02-09 05:41:00 |
| 102 | St. Patrick | Green | 29.85 | true | 3 | 2025-03-11 06:14:00 | 2025-03-16 10:41:00 |
| 103 | Immaculate Conception | Light Blue | 33.80 | false | 4 | 2025-04-16 09:14:00 | 2025-04-23 15:41:00 |

Folder 100, titled "Agony in the Garden," features a white cover, carries a suggested donation of 21.95, displays the society logo, and is associated with enrollee 1. It was created on 2025-01-01 and last updated on 2025-01-02. Folder 101, "Sacred Heart," uses a red cover, has no society logo, and is linked to enrollee 2; it was created on 2025-02-06 and last updated on 2025-02-09. Folder 102, "St. Patrick," is green, bears the society logo, and connects to enrollee 3, with creation and update dates of 2025-03-11 and 2025-03-16 respectively. Folder 103, "Immaculate Conception," uses a light blue cover, lacks the society logo, and is tied to enrollee 4, created on 2025-04-16 and updated on 2025-04-23. The naming convention and cover colors provide immediate visual and devotional identification for staff and recipients alike.

## Enrollees and Their Relationships

At the heart of the service are enrollees—the individuals or entities whose names are entered into perpetual prayer. Each enrollee record captures their full name, whether they have passed away, their relationship to the person who requested the enrolment, and the folder to which they are assigned.

**Table `enrollees`**

| enrollee_id | full_name | is_deceased | relationship_to_requester | perpetual_folder_id |
|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | regional-relation-96 | 100 |
| 2 | Account Name | false | legacy-relation-97 | 101 |
| 3 | Saipan International Airport | true | compact-relation-98 | 102 |
| 4 | Norma Fisher | false | composite-relation-99 | 103 |

Enrollee 1, Theodore Mcgrath, is recorded as deceased and holds a "regional-relation-96" relationship to the requester. Enrollee 2, listed as "Account Name," is living and carries a "legacy-relation-97" relationship. Enrollee 3, "Saipan International Airport," is deceased and associated with a "compact-relation-98" relationship—an organizational entity rather than a person. Enrollee 4, Norma Fisher, is living and linked through a "composite-relation-99" relationship. The `is_deceased` flag is critical for operational purposes: it determines whether cards are sent to the enrollee directly or to a designated contact, and it influences the type of occasion card that may be appropriate.

## Enrolments: The Central Transaction

An enrolment is the operational record that binds an occasion card, a perpetual folder, and an enrollee into a single transaction. It captures the status of the enrolment, its duration, the donation amount collected, and the date on which the enrolment was initiated.

**Table `enrolments`**

| enrolment_id | enrolment_status | duration_years | donation_amount | enrolment_date | occasion_card_id | perpetual_folder_id | enrollee_id |
|---|---|---|---|---|---|---|---|
| 1 | Pending | 14 | 26.25 | 2024-07-10T18:54:00 | 1 | 100 | 1 |
| 2 | Active | 18 | 29.99 | 2025-12-21T01:11:00 | 2 | 101 | 2 |
| 3 | Completed | 22 | 16.11 | 2022-05-05T08:28:00 | 3 | 102 | 3 |
| 4 | Pending | 26 | 13.49 | 2023-10-16T15:45:00 | 4 | 103 | 4 |

Enrolment 1 is in Pending status, spans 14 years, collected a donation of 26.25, and was initiated on 2024-07-10. It links occasion card 1 (Sympathy) with folder 100 (Agony in the Garden) and enrollee 1 (Theodore Mcgrath). Enrolment 2 is Active, has an 18-year duration, a donation of 29.99, and was started on 2025-12-21. It connects card 2 (Get Well) with folder 101 (Sacred Heart) and enrollee 2 (Account Name). Enrolment 3 is Completed, runs for 22 years, collected 16.11, and began on 2022-05-05, tying card 3 (For Your Intention) to folder 102 (St. Patrick) and enrollee 3 (Saipan International Airport). Enrolment 4 is Pending, lasts 26 years, has a donation of 13.49, and was created on 2023-10-16, associating card 4 (Thank You) with folder 103 (Immaculate Conception) and enrollee 4 (Norma Fisher).

## Order Requests and Delivery

Order requests represent the physical fulfillment side of the service. Each request records a unique request identifier, the date it was submitted, the delivery method chosen by the requester, the total quantity of materials ordered, and the associated folder and enrollee.

**Table `order_requests`**

| id | request_id | submission_date | delivery_method | total_quantity | perpetual_folder_id | enrollee_id |
|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | Post | 20 | 100 | 1 |
| 1001 | 575213 | 2022-09-08T10:14:00 | Email | 20 | 101 | 2 |
| 1002 | 103167 | 2023-02-19T17:31:00 | Phone | 0 | 102 | 3 |
| 1003 | 611510 | 2024-07-03T00:48:00 | Post | 1 | 103 | 4 |

Request 1000, identified by request_id 2087732, was submitted on 2025-04-24 for delivery by Post, with a total quantity of 20 items, linked to folder 100 and enrollee 1. Request 1001 (request_id 575213) was submitted on 2022-09-08 for Email delivery, also with a quantity of 20, tied to folder 101 and enrollee 2. Request 1002 (request_id 103167) was submitted on 2023-02-19 for Phone delivery with a quantity of 0—indicating a placeholder or informational order—connected to folder 102 and enrollee 3. Request 1003 (request_id 611510) was submitted on 2024-07-03 for Post delivery with a quantity of 1, linked to folder 103 and enrollee 4. The delivery methods—Post, Email, and Phone—reflect the service's multi-channel approach to fulfilling physical and digital card distributions.

## Associative Records: Cards, Folders, and Enrollees in Enrolments

The service uses associative tables to manage the many-to-many relationships between cards, folders, and enrollees on the one hand, and enrolments on the other. These tables ensure that a single enrolment can be associated with multiple cards, folders, or enrollees as the operational needs require.

**Table `cards_enrolments`**

| occasion_card_id | enrolment_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The `cards_enrolments` table reveals that occasion card 1 (Sympathy) is associated with both enrolment 1 and enrolment 2, meaning the same card type is used across multiple enrolments. Card 2 (Get Well) appears in enrolments 2 and 3, card 3 (For Your Intention) in enrolments 3 and 4, and card 4 (Thank You) in enrolments 4 and 1. This cross-referencing pattern demonstrates that card types are reusable resources rather than one-to-one assignments, allowing the service to scale its card inventory across a growing enrolment base.

The remaining associative tables—`folders_enrolments`, `enrollees_enrolments`, and `requests_cards`—serve analogous functions, linking folders, enrollees, and order requests to enrolments in flexible configurations that support the operational complexity of the service.

## Detail Views: Joining Records for Operational Clarity

The service provides a suite of detail views that join the base tables into coherent, queryable records. Each view answers a specific operational question by combining data from multiple sources.

**View `v_occasion_card_enrolment_detail`**

```sql
CREATE VIEW v_occasion_card_enrolment_detail AS
SELECT a.occasion_card_id, a.card_type, a.reference_number, b.enrolment_id AS enrolment_enrolment_id, b.enrolment_status AS enrolment_enrolment_status, b.duration_years AS enrolment_duration_years
FROM occasion_cards a
  JOIN cards_enrolments j ON j.occasion_card_id = a.occasion_card_id
  JOIN enrolments b ON b.enrolment_id = j.enrolment_id;
```

| occasion_card_id | card_type | reference_number | enrolment_enrolment_id | enrolment_enrolment_status | enrolment_duration_years |
|---|---|---|---|---|---|
| 1 | Sympathy | REF-2039 | 1 | Pending | 14 |
| 1 | Sympathy | REF-2039 | 2 | Active | 18 |
| 2 | Get Well | REF-2040 | 2 | Active | 18 |
| 2 | Get Well | REF-2040 | 3 | Completed | 22 |
| 3 | For Your Intention | REF-2041 | 3 | Completed | 22 |
| 3 | For Your Intention | REF-2041 | 4 | Pending | 26 |
| 4 | Thank You | REF-2042 | 4 | Pending | 26 |
| 4 | Thank You | REF-2042 | 1 | Pending | 14 |

This view answers the question: "What occasion card is associated with each enrolment, and what are the enrolment's financial and temporal details?" A row from this view might show that enrolment 1 uses the Sympathy card (REF-2039), has a donation of 26.25, and is in Pending status. This allows staff to quickly assess the card-enrolment pairing without manually joining tables.

**View `v_occasion_card_perpetual_folder`**

```sql
CREATE VIEW v_occasion_card_perpetual_folder AS
SELECT a.occasion_card_id, a.card_type, a.reference_number, a.suggested_donation, b.id AS folder_id, b.folder_name AS folder_folder_name, b.cover_color AS folder_cover_color
FROM occasion_cards a JOIN perpetual_folders b ON a.perpetual_folder_id = b.id;
```

| occasion_card_id | card_type | reference_number | suggested_donation | folder_id | folder_folder_name | folder_cover_color |
|---|---|---|---|---|---|---|
| 1 | Sympathy | REF-2039 | 21.95 | 100 | Agony in the Garden | White |
| 2 | Get Well | REF-2040 | 25.90 | 101 | Sacred Heart | Red |
| 3 | For Your Intention | REF-2041 | 29.85 | 102 | St. Patrick | Green |
| 4 | Thank You | REF-2042 | 33.80 | 103 | Immaculate Conception | Light Blue |

This view answers: "Which occasion card is paired with which perpetual folder?" It reveals that card 1 (Sympathy) is associated with folder 100 (Agony in the Garden), card 2 (Get Well) with folder 101 (Sacred Heart), and so on. This pairing is essential for understanding the devotional context of each card dispatch.

**View `v_perpetual_folder_enrolment_detail`**

```sql
CREATE VIEW v_perpetual_folder_enrolment_detail AS
SELECT a.id, a.folder_name, a.cover_color, b.enrolment_id AS enrolment_enrolment_id, b.enrolment_status AS enrolment_enrolment_status, b.duration_years AS enrolment_duration_years
FROM perpetual_folders a
  JOIN folders_enrolments j ON j.perpetual_folder_id = a.id
  JOIN enrolments b ON b.enrolment_id = j.enrolment_id;
```

| id | folder_name | cover_color | enrolment_enrolment_id | enrolment_enrolment_status | enrolment_duration_years |
|---|---|---|---|---|---|
| 100 | Agony in the Garden | White | 1 | Pending | 14 |
| 100 | Agony in the Garden | White | 2 | Active | 18 |
| 101 | Sacred Heart | Red | 2 | Active | 18 |
| 101 | Sacred Heart | Red | 3 | Completed | 22 |
| 102 | St. Patrick | Green | 3 | Completed | 22 |
| 102 | St. Patrick | Green | 4 | Pending | 26 |
| 103 | Immaculate Conception | Light Blue | 4 | Pending | 26 |
| 103 | Immaculate Conception | Light Blue | 1 | Pending | 14 |

This view answers: "What enrolments are tied to a given perpetual folder, and what are their statuses and durations?" A row might show that folder 100 (Agony in the Garden) has enrolment 1 in Pending status with a 14-year duration. This view supports folder-level reporting and capacity planning.

**View `v_perpetual_folder_enrollee`**

```sql
CREATE VIEW v_perpetual_folder_enrollee AS
SELECT a.id, a.folder_name, a.cover_color, a.suggested_donation, b.enrollee_id AS enrollee_enrollee_id, b.full_name AS enrollee_full_name, b.is_deceased AS enrollee_is_deceased
FROM perpetual_folders a JOIN enrollees b ON a.enrollee_id = b.enrollee_id;
```

| id | folder_name | cover_color | suggested_donation | enrollee_enrollee_id | enrollee_full_name | enrollee_is_deceased |
|---|---|---|---|---|---|---|
| 100 | Agony in the Garden | White | 21.95 | 1 | Theodore Mcgrath | true |
| 101 | Sacred Heart | Red | 25.90 | 2 | Account Name | false |
| 102 | St. Patrick | Green | 29.85 | 3 | Saipan International Airport | true |
| 103 | Immaculate Conception | Light Blue | 33.80 | 4 | Norma Fisher | false |

This view answers: "Which enrollee is associated with each perpetual folder?" It confirms that folder 100 is linked to enrollee 1 (Theodore Mcgrath), folder 101 to enrollee 2 (Account Name), folder 102 to enrollee 3 (Saipan International Airport), and folder 103 to enrollee 4 (Norma Fisher). This view is critical for verifying that the correct names are entered into the correct devotional folders.

**View `v_enrolment_occasion_card`**

```sql
CREATE VIEW v_enrolment_occasion_card AS
SELECT a.enrolment_id, a.enrolment_status, a.duration_years, a.donation_amount, b.occasion_card_id AS card_occasion_card_id, b.card_type AS card_card_type, b.reference_number AS card_reference_number
FROM enrolments a JOIN occasion_cards b ON a.occasion_card_id = b.occasion_card_id;
```

| enrolment_id | enrolment_status | duration_years | donation_amount | card_occasion_card_id | card_card_type | card_reference_number |
|---|---|---|---|---|---|---|
| 1 | Pending | 14 | 26.25 | 1 | Sympathy | REF-2039 |
| 2 | Active | 18 | 29.99 | 2 | Get Well | REF-2040 |
| 3 | Completed | 22 | 16.11 | 3 | For Your Intention | REF-2041 |
| 4 | Pending | 26 | 13.49 | 4 | Thank You | REF-2042 |

This view answers: "What occasion card details accompany each enrolment?" It combines enrolment metadata with card attributes, showing for example that enrolment 2 (Active, 18 years, donation 29.99) is paired with the Get Well card (REF-2040, not pre-signed, not free, suggested donation 25.90).

**View `v_enrolment_perpetual_folder`**

```sql
CREATE VIEW v_enrolment_perpetual_folder AS
SELECT a.enrolment_id, a.enrolment_status, a.duration_years, a.donation_amount, b.id AS folder_id, b.folder_name AS folder_folder_name, b.cover_color AS folder_cover_color
FROM enrolments a JOIN perpetual_folders b ON a.perpetual_folder_id = b.id;
```

| enrolment_id | enrolment_status | duration_years | donation_amount | folder_id | folder_folder_name | folder_cover_color |
|---|---|---|---|---|---|---|
| 1 | Pending | 14 | 26.25 | 100 | Agony in the Garden | White |
| 2 | Active | 18 | 29.99 | 101 | Sacred Heart | Red |
| 3 | Completed | 22 | 16.11 | 102 | St. Patrick | Green |
| 4 | Pending | 26 | 13.49 | 103 | Immaculate Conception | Light Blue |

This view answers: "What folder details accompany each enrolment?" It might show that enrolment 3 (Completed, 22 years, donation 16.11) is associated with folder 102 (St. Patrick, Green cover, has society logo, suggested donation 29.85).

**View `v_enrolment_enrollee`**

```sql
CREATE VIEW v_enrolment_enrollee AS
SELECT a.enrolment_id, a.enrolment_status, a.duration_years, a.donation_amount, b.enrollee_id AS enrollee_enrollee_id, b.full_name AS enrollee_full_name, b.is_deceased AS enrollee_is_deceased
FROM enrolments a JOIN enrollees b ON a.enrollee_id = b.enrollee_id;
```

| enrolment_id | enrolment_status | duration_years | donation_amount | enrollee_enrollee_id | enrollee_full_name | enrollee_is_deceased |
|---|---|---|---|---|---|---|
| 1 | Pending | 14 | 26.25 | 1 | Theodore Mcgrath | true |
| 2 | Active | 18 | 29.99 | 2 | Account Name | false |
| 3 | Completed | 22 | 16.11 | 3 | Saipan International Airport | true |
| 4 | Pending | 26 | 13.49 | 4 | Norma Fisher | false |

This view answers: "Which enrollee is associated with each enrolment, and what are their details?" A row might show that enrolment 4 (Pending, 26 years, donation 13.49) is linked to enrollee 4 (Norma Fisher, living, composite-relation-99).

**View `v_enrollee_enrolment_detail`**

```sql
CREATE VIEW v_enrollee_enrolment_detail AS
SELECT a.enrollee_id, a.full_name, a.is_deceased, b.enrolment_id AS enrolment_enrolment_id, b.enrolment_status AS enrolment_enrolment_status, b.duration_years AS enrolment_duration_years
FROM enrollees a
  JOIN enrollees_enrolments j ON j.enrollee_id = a.enrollee_id
  JOIN enrolments b ON b.enrolment_id = j.enrolment_id;
```

| enrollee_id | full_name | is_deceased | enrolment_enrolment_id | enrolment_enrolment_status | enrolment_duration_years |
|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | 1 | Pending | 14 |
| 1 | Theodore Mcgrath | true | 2 | Active | 18 |
| 2 | Account Name | false | 2 | Active | 18 |
| 2 | Account Name | false | 3 | Completed | 22 |
| 3 | Saipan International Airport | true | 3 | Completed | 22 |
| 3 | Saipan International Airport | true | 4 | Pending | 26 |
| 4 | Norma Fisher | false | 4 | Pending | 26 |
| 4 | Norma Fisher | false | 1 | Pending | 14 |

This view answers: "What enrolment details are associated with each enrollee?" It might show that enrollee 1 (Theodore Mcgrath, deceased, regional-relation-99) has enrolment 1 in Pending status with a 14-year duration and a donation of 26.25.

**View `v_enrollee_perpetual_folder`**

```sql
CREATE VIEW v_enrollee_perpetual_folder AS
SELECT a.enrollee_id, a.full_name, a.is_deceased, a.relationship_to_requester, b.id AS folder_id, b.folder_name AS folder_folder_name, b.cover_color AS folder_cover_color
FROM enrollees a JOIN perpetual_folders b ON a.perpetual_folder_id = b.id;
```

| enrollee_id | full_name | is_deceased | relationship_to_requester | folder_id | folder_folder_name | folder_cover_color |
|---|---|---|---|---|---|---|
| 1 | Theodore Mcgrath | true | regional-relation-96 | 100 | Agony in the Garden | White |
| 2 | Account Name | false | legacy-relation-97 | 101 | Sacred Heart | Red |
| 3 | Saipan International Airport | true | compact-relation-98 | 102 | St. Patrick | Green |
| 4 | Norma Fisher | false | composite-relation-99 | 103 | Immaculate Conception | Light Blue |

This view answers: "Which perpetual folder is associated with each enrollee?" It confirms the one-to-one mapping: enrollee 1 to folder 100, enrollee 2 to folder 101, enrollee 3 to folder 102, and enrollee 4 to folder 103.

**View `v_order_request_occasion_card_detail`**

```sql
CREATE VIEW v_order_request_occasion_card_detail AS
SELECT a.id, a.request_id, a.submission_date, b.occasion_card_id AS card_occasion_card_id, b.card_type AS card_card_type, b.reference_number AS card_reference_number
FROM order_requests a
  JOIN requests_cards j ON j.order_request_id = a.id
  JOIN occasion_cards b ON b.occasion_card_id = j.occasion_card_id;
```

| id | request_id | submission_date | card_occasion_card_id | card_card_type | card_reference_number |
|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | 1 | Sympathy | REF-2039 |
| 1000 | 2087732 | 2025-04-24T03:57:00 | 2 | Get Well | REF-2040 |
| 1001 | 575213 | 2022-09-08T10:14:00 | 2 | Get Well | REF-2040 |
| 1001 | 575213 | 2022-09-08T10:14:00 | 3 | For Your Intention | REF-2041 |
| 1002 | 103167 | 2023-02-19T17:31:00 | 3 | For Your Intention | REF-2041 |
| 1002 | 103167 | 2023-02-19T17:31:00 | 4 | Thank You | REF-2042 |
| 1003 | 611510 | 2024-07-03T00:48:00 | 4 | Thank You | REF-2042 |
| 1003 | 611510 | 2024-07-03T00:48:00 | 1 | Sympathy | REF-2039 |

This view answers: "What occasion card details accompany each order request?" It might show that order request 1000 (request_id 2087732, Post delivery, quantity 20) is associated with card 1 (Sympathy, REF-2039, pre-signed, free, suggested donation 21.95).

**View `v_order_request_perpetual_folder`**

```sql
CREATE VIEW v_order_request_perpetual_folder AS
SELECT a.id, a.request_id, a.submission_date, a.delivery_method, b.id AS folder_id, b.folder_name AS folder_folder_name, b.cover_color AS folder_cover_color
FROM order_requests a JOIN perpetual_folders b ON a.perpetual_folder_id = b.id;
```

| id | request_id | submission_date | delivery_method | folder_id | folder_folder_name | folder_cover_color |
|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | Post | 100 | Agony in the Garden | White |
| 1001 | 575213 | 2022-09-08T10:14:00 | Email | 101 | Sacred Heart | Red |
| 1002 | 103167 | 2023-02-19T17:31:00 | Phone | 102 | St. Patrick | Green |
| 1003 | 611510 | 2024-07-03T00:48:00 | Post | 103 | Immaculate Conception | Light Blue |

This view answers: "What folder details accompany each order request?" It might show that order request 1001 (request_id 575213, Email delivery, quantity 20) is linked to folder 101 (Sacred Heart, Red cover, no society logo, suggested donation 25.90).

**View `v_order_request_enrollee`**

```sql
CREATE VIEW v_order_request_enrollee AS
SELECT a.id, a.request_id, a.submission_date, a.delivery_method, b.enrollee_id AS enrollee_enrollee_id, b.full_name AS enrollee_full_name, b.is_deceased AS enrollee_is_deceased
FROM order_requests a JOIN enrollees b ON a.enrollee_id = b.enrollee_id;
```

| id | request_id | submission_date | delivery_method | enrollee_enrollee_id | enrollee_full_name | enrollee_is_deceased |
|---|---|---|---|---|---|---|
| 1000 | 2087732 | 2025-04-24T03:57:00 | Post | 1 | Theodore Mcgrath | true |
| 1001 | 575213 | 2022-09-08T10:14:00 | Email | 2 | Account Name | false |
| 1002 | 103167 | 2023-02-19T17:31:00 | Phone | 3 | Saipan International Airport | true |
| 1003 | 611510 | 2024-07-03T00:48:00 | Post | 4 | Norma Fisher | false |

This view answers: "Which enrollee is associated with each order request?" It might show that order request 1002 (request_id 103167, Phone delivery, quantity 0) is linked to enrollee 3 (Saipan International Airport, deceased, compact-relation-98).

## Synthesis

The perpetual prayer and occasion card service operates as an integrated system where occasion cards, perpetual folders, enrollees, enrolments, and order requests form a coherent operational ecosystem. Cards mark life events and are dispatched according to the devotional context provided by perpetual folders. Enrolments bind these elements together with financial and temporal metadata, while associative tables ensure flexibility in how cards, folders, and enrollees are paired. Order requests capture the physical fulfillment of the service, with delivery methods and quantities reflecting the diverse needs of requesters. The detail views provide the operational clarity needed for staff to manage this ecosystem efficiently, answering specific questions about card-enrolment pairings, folder-enrollee associations, and order fulfillment status. Together, these records form the operational backbone of a service that supports religious and charitable organizations in their ongoing work of intercessory prayer and commemorative correspondence.

## Data appendix

**Table `folders_enrolments`**

| perpetual_folder_id | enrolment_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

**Table `enrollees_enrolments`**

| enrollee_id | enrolment_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

**Table `requests_cards`**

| order_request_id | occasion_card_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |
