The domain under examination is a B2B calendar production pipeline in which business clients commission themed calendars, each order carrying a specific ad copy and corporate logo. The relational model separates the concerns of client identity, thematic design, advertising content, and branding assets into distinct base tables, while junction tables capture the many-to-many relationships that arise when a single client commissions multiple orders or a single order references multiple supporting assets. Views then materialize the most common analytical joins so that a data consumer can reconstruct a complete domain fact—such as "which client ordered which themed calendar with which ad copy and logo"—from a single query rather than composing ad-hoc joins.

## The Core Entities

The backbone of the model is the `calendar_orders` table, which records each production order as a row. Its primary key, `calendar_order_id`, is an integer surrogate. The columns `order_reference`, `order_date`, `unit_price`, `setup_fee`, `total_quantity`, `status`, and `submission_deadline` capture the commercial and logistical attributes of the order. Four foreign keys—`business_client_id`, `calendar_theme_id`, `ad_copy_id`, and `corporate_logo_id`—anchor the order to its supporting entities.

**Table `calendar_orders`**

| calendar_order_id | order_reference | order_date | unit_price | setup_fee | total_quantity | status | submission_deadline | business_client_id | calendar_theme_id | ad_copy_id | corporate_logo_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | extended-order-93 | 2023-02-27T13:15:00 | 5,692 | 30.51 | 20 | pending | 2025-08-26 | 1 | 1000 | 1 | 1 |
| 2 | integrated-order-94 | 2024-07-11T20:32:00 | 45,650 | 38.08 | 20 | submitted | 2022-01-10 | 2 | 1001 | 2 | 2 |
| 3 | seasonal-order-95 | 2025-12-22T03:49:00 | 2,705 | 12.34 | 0 | processing | 2023-06-21 | 3 | 1002 | 3 | 3 |
| 4 | regional-order-96 | 2022-05-06T10:06:00 | 211.07 | 33.06 | 1 | fulfilled | 2024-11-05 | 4 | 1003 | 4 | 4 |

The `business_clients` table stores the identity and contact details of each client organization. Its primary key `id` is an integer, and the columns `business_name`, `contact_name`, `membership_status`, `email_address`, `fax_number`, and `website_url` provide the full contact profile. For example, client 1 is "Kyle Wallace" with contact "Kenneth Smith," a `false` membership status, and the email address `primary-email-70`. Client 2, "Andrew Hatfield," has `true` membership status and the email `adaptive-email-71`.

**Table `business_clients`**

| id | business_name | contact_name | membership_status | email_address | fax_number | website_url |
|---|---|---|---|---|---|---|
| 1 | Kyle Wallace | Kenneth Smith | false | primary-email-70 | FAX-2047 | https://github.com/chiphuyen/lazynlp |
| 2 | Andrew Hatfield | Michelle Kelley | true | adaptive-email-71 | FAX-2049 | https://bugs.launchpad.net/ironic/+bug/1346406 |
| 3 | Kimberly Smith | Kimberly Myers | false | distributed-email-72 | FAX-2051 | http://en.wikipedia.org/wiki/Hyla_femoralis |
| 4 | Michael Williams | Tasha Rodriguez | true | baseline-email-73 | FAX-2053 | https://www.nature.com/articles/nphoton.2014.41 |

The `calendar_themes` table defines the thematic design of each calendar. Its primary key `id` is an integer, and the columns `theme_name`, `category`, and `preview_url` describe the theme. Theme 1000 is "Distributed Standard" in the "Classic Cars" category, while theme 1001 is "Adaptive Framework D" in "Exotic Cars." Theme 1002, "Primary Protocol," belongs to "Road Warriors," and theme 1003, "Composite Programme," covers "Scenes of Canada."

**Table `calendar_themes`**

| id | theme_name | category | preview_url |
|---|---|---|---|
| 1000 | Distributed Standard | Classic Cars | http://marvel.wikia.com/Robert_Bruce_Banner_(Earth-616) |
| 1001 | Adaptive Framework D | Exotic Cars | https://www.nature.com/articles/nphoton.2014.42 |
| 1002 | Primary Protocol | Road Warriors | http://www.barrelassembly.com |
| 1003 | Composite Programme | Scenes of Canada | https://archive.org/details/CNN_20101215_180000_CNN_Newsroom |

The `ad_copies` table holds the advertising content associated with each order. Its primary key is `ad_copy_id`, and the columns `copy_area_dimensions`, `print_color`, `language`, and `imprint_source` describe the ad's physical and linguistic properties. Ad copy 1 has dimensions `distributed-copy-66`, is `full-colour`, in `English`, with an imprint source of `new`. Ad copy 2, `baseline-copy-67`, is `two-colour` and `Bilingual`, sourced from `repeated_2019`.

**Table `ad_copies`**

| ad_copy_id | copy_area_dimensions | print_color | language | imprint_source | calendar_order_id | business_client_id | corporate_logo_id |
|---|---|---|---|---|---|---|---|
| 1 | distributed-copy-66 | full-colour | English | new | 1 | 1 | 1 |
| 2 | baseline-copy-67 | two-colour | Bilingual | repeated_2019 | 2 | 2 | 2 |
| 3 | pilot-copy-68 | full-colour | English | new | 3 | 3 | 3 |
| 4 | extended-copy-69 | two-colour | Bilingual | repeated_2019 | 4 | 4 | 4 |

The `corporate_logos` table stores branding assets. Its primary key `id` is an integer, and the columns `logo_type` and `vendor` describe the logo. Logo 1 is `client_provided` from "Feedback Ratings," while logo 2 is `vendor_standard` from "Abbott Laboratories." Logo 3 is `client_provided` from "American Express," and logo 4 is `vendor_standard` from "Whatsapp Inc."

**Table `corporate_logos`**

| id | logo_type | vendor |
|---|---|---|
| 1 | client_provided | Feedback Ratings |
| 2 | vendor_standard | Abbott Laboratories |
| 3 | client_provided | American Express |
| 4 | vendor_standard | Whatsapp Inc. |

## Junction Tables and Many-to-Many Relationships

Although `calendar_orders` carries direct foreign keys to the four supporting entities, the model also includes five junction tables that capture many-to-many relationships between pairs of entities. These tables each consist of exactly two columns, both of which are foreign keys, and together form a composite primary key.

The `clients_orders` table links `business_client_id` to `calendar_order_id`, allowing a single client to be associated with multiple orders and a single order to reference multiple clients. The data shows that client 1 appears in orders 1 and 2, client 2 in orders 2 and 3, client 3 in orders 3 and 4, and client 4 in orders 4 and 1. This creates a cyclic overlap pattern where each client shares an order with its neighbours.

**Table `clients_orders`**

| business_client_id | calendar_order_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

The remaining junction tables—`clients_copies`, `themes_orders`, `logos_orders`, and `logos_copies`—serve the same structural purpose for their respective entity pairs, enabling flexible many-to-many associations that the direct foreign keys in `calendar_orders` do not capture.

**Table `clients_copies`**

| business_client_id | ad_copy_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
**Table `themes_orders`**

| calendar_theme_id | calendar_order_id |
|---|---|
| 1000 | 1 |
| 1000 | 2 |
| 1001 | 2 |
| 1001 | 3 |
| 1002 | 3 |
| 1002 | 4 |
| 1003 | 4 |
| 1003 | 1 |
**Table `logos_orders`**

| corporate_logo_id | calendar_order_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |
**Table `logos_copies`**

| corporate_logo_id | ad_copy_id |
|---|---|
| 1 | 1 |
| 1 | 2 |
| 2 | 2 |
| 2 | 3 |
| 3 | 3 |
| 3 | 4 |
| 4 | 4 |
| 4 | 1 |

## Views: Reconstructing Domain Facts

Views in this model materialize the most common analytical joins, each answering a specific business question by combining two base tables. The following sections interpret each view's result set.

### Views Joining Calendar Orders to Supporting Entities

The view `v_calendar_order_business_client` joins `calendar_orders` to `business_clients` on `business_client_id`, answering the question "which client placed which order?" The result for order 1 shows the order reference `extended-order-93` alongside the client name "Kyle Wallace" and email `primary-email-70`. Order 2, `integrated-order-94`, is linked to "Andrew Hatfield" with email `adaptive-email-71`.

**View `v_calendar_order_business_client`**

```sql
CREATE VIEW v_calendar_order_business_client AS
SELECT a.calendar_order_id, a.order_reference, a.order_date, a.unit_price, b.id AS client_id, b.business_name AS client_business_name, b.contact_name AS client_contact_name
FROM calendar_orders a JOIN business_clients b ON a.business_client_id = b.id;
```

| calendar_order_id | order_reference | order_date | unit_price | client_id | client_business_name | client_contact_name |
|---|---|---|---|---|---|---|
| 1 | extended-order-93 | 2023-02-27T13:15:00 | 5,692 | 1 | Kyle Wallace | Kenneth Smith |
| 2 | integrated-order-94 | 2024-07-11T20:32:00 | 45,650 | 2 | Andrew Hatfield | Michelle Kelley |
| 3 | seasonal-order-95 | 2025-12-22T03:49:00 | 2,705 | 3 | Kimberly Smith | Kimberly Myers |
| 4 | regional-order-96 | 2022-05-06T10:06:00 | 211.07 | 4 | Michael Williams | Tasha Rodriguez |

The view `v_calendar_order_calendar_theme` joins `calendar_orders` to `calendar_themes` on `calendar_theme_id`, answering "which theme was assigned to which order?" Order 1 carries theme 1000, "Distributed Standard" in the "Classic Cars" category. Order 2 carries theme 1001, "Adaptive Framework D" in "Exotic Cars."

**View `v_calendar_order_calendar_theme`**

```sql
CREATE VIEW v_calendar_order_calendar_theme AS
SELECT a.calendar_order_id, a.order_reference, a.order_date, a.unit_price, b.id AS theme_id, b.theme_name AS theme_theme_name, b.category AS theme_category
FROM calendar_orders a JOIN calendar_themes b ON a.calendar_theme_id = b.id;
```

| calendar_order_id | order_reference | order_date | unit_price | theme_id | theme_theme_name | theme_category |
|---|---|---|---|---|---|---|
| 1 | extended-order-93 | 2023-02-27T13:15:00 | 5,692 | 1000 | Distributed Standard | Classic Cars |
| 2 | integrated-order-94 | 2024-07-11T20:32:00 | 45,650 | 1001 | Adaptive Framework D | Exotic Cars |
| 3 | seasonal-order-95 | 2025-12-22T03:49:00 | 2,705 | 1002 | Primary Protocol | Road Warriors |
| 4 | regional-order-96 | 2022-05-06T10:06:00 | 211.07 | 1003 | Composite Programme | Scenes of Canada |

The view `v_calendar_order_ad_copy` joins `calendar_orders` to `ad_copies` on `ad_copy_id`, answering "which ad copy was used in which order?" Order 1 uses ad copy 1, `distributed-copy-66`, which is `full-colour` and in `English`. Order 2 uses ad copy 2, `baseline-copy-67`, which is `two-colour` and `Bilingual`.

**View `v_calendar_order_ad_copy`**

```sql
CREATE VIEW v_calendar_order_ad_copy AS
SELECT a.calendar_order_id, a.order_reference, a.order_date, a.unit_price, b.ad_copy_id AS copy_ad_copy_id, b.copy_area_dimensions AS copy_copy_area_dimensions, b.print_color AS copy_print_color
FROM calendar_orders a JOIN ad_copies b ON a.ad_copy_id = b.ad_copy_id;
```

| calendar_order_id | order_reference | order_date | unit_price | copy_ad_copy_id | copy_copy_area_dimensions | copy_print_color |
|---|---|---|---|---|---|---|
| 1 | extended-order-93 | 2023-02-27T13:15:00 | 5,692 | 1 | distributed-copy-66 | full-colour |
| 2 | integrated-order-94 | 2024-07-11T20:32:00 | 45,650 | 2 | baseline-copy-67 | two-colour |
| 3 | seasonal-order-95 | 2025-12-22T03:49:00 | 2,705 | 3 | pilot-copy-68 | full-colour |
| 4 | regional-order-96 | 2022-05-06T10:06:00 | 211.07 | 4 | extended-copy-69 | two-colour |

The view `v_calendar_order_corporate_logo` joins `calendar_orders` to `corporate_logos` on `corporate_logo_id`, answering "which logo was applied to which order?" Order 1 uses logo 1, a `client_provided` logo from "Feedback Ratings." Order 2 uses logo 2, a `vendor_standard` logo from "Abbott Laboratories."

**View `v_calendar_order_corporate_logo`**

```sql
CREATE VIEW v_calendar_order_corporate_logo AS
SELECT a.calendar_order_id, a.order_reference, a.order_date, a.unit_price, b.id AS logo_id, b.logo_type AS logo_logo_type, b.vendor AS logo_vendor
FROM calendar_orders a JOIN corporate_logos b ON a.corporate_logo_id = b.id;
```

| calendar_order_id | order_reference | order_date | unit_price | logo_id | logo_logo_type | logo_vendor |
|---|---|---|---|---|---|---|
| 1 | extended-order-93 | 2023-02-27T13:15:00 | 5,692 | 1 | client_provided | Feedback Ratings |
| 2 | integrated-order-94 | 2024-07-11T20:32:00 | 45,650 | 2 | vendor_standard | Abbott Laboratories |
| 3 | seasonal-order-95 | 2025-12-22T03:49:00 | 2,705 | 3 | client_provided | American Express |
| 4 | regional-order-96 | 2022-05-06T10:06:00 | 211.07 | 4 | vendor_standard | Whatsapp Inc. |

### Views Joining Business Clients to Orders and Ad Copies

The view `v_business_client_calendar_order_detail` joins `business_clients` to `calendar_orders` on `business_client_id`, answering "which orders did a given client place?" Client 1 ("Kyle Wallace") appears with order 1 (`extended-order-93`, status `pending`) and order 2 (`integrated-order-94`, status `submitted`). Client 2 ("Andrew Hatfield") appears with order 2 and order 3 (`seasonal-order-95`, status `processing`).

**View `v_business_client_calendar_order_detail`**

```sql
CREATE VIEW v_business_client_calendar_order_detail AS
SELECT a.id, a.business_name, a.contact_name, b.calendar_order_id AS order_calendar_order_id, b.order_reference AS order_order_reference, b.order_date AS order_order_date
FROM business_clients a
  JOIN clients_orders j ON j.business_client_id = a.id
  JOIN calendar_orders b ON b.calendar_order_id = j.calendar_order_id;
```

| id | business_name | contact_name | order_calendar_order_id | order_order_reference | order_order_date |
|---|---|---|---|---|---|
| 1 | Kyle Wallace | Kenneth Smith | 1 | extended-order-93 | 2023-02-27T13:15:00 |
| 1 | Kyle Wallace | Kenneth Smith | 2 | integrated-order-94 | 2024-07-11T20:32:00 |
| 2 | Andrew Hatfield | Michelle Kelley | 2 | integrated-order-94 | 2024-07-11T20:32:00 |
| 2 | Andrew Hatfield | Michelle Kelley | 3 | seasonal-order-95 | 2025-12-22T03:49:00 |
| 3 | Kimberly Smith | Kimberly Myers | 3 | seasonal-order-95 | 2025-12-22T03:49:00 |
| 3 | Kimberly Smith | Kimberly Myers | 4 | regional-order-96 | 2022-05-06T10:06:00 |
| 4 | Michael Williams | Tasha Rodriguez | 4 | regional-order-96 | 2022-05-06T10:06:00 |
| 4 | Michael Williams | Tasha Rodriguez | 1 | extended-order-93 | 2023-02-27T13:15:00 |

The view `v_business_client_ad_copy_detail` joins `business_clients` to `ad_copies` on `business_client_id`, answering "which ad copies did a given client commission?" Client 1 is linked to ad copy 1 (`distributed-copy-66`, `full-colour`, `English`). Client 2 is linked to ad copy 2 (`baseline-copy-67`, `two-colour`, `Bilingual`).

**View `v_business_client_ad_copy_detail`**

```sql
CREATE VIEW v_business_client_ad_copy_detail AS
SELECT a.id, a.business_name, a.contact_name, b.ad_copy_id AS copy_ad_copy_id, b.copy_area_dimensions AS copy_copy_area_dimensions, b.print_color AS copy_print_color
FROM business_clients a
  JOIN clients_copies j ON j.business_client_id = a.id
  JOIN ad_copies b ON b.ad_copy_id = j.ad_copy_id;
```

| id | business_name | contact_name | copy_ad_copy_id | copy_copy_area_dimensions | copy_print_color |
|---|---|---|---|---|---|
| 1 | Kyle Wallace | Kenneth Smith | 1 | distributed-copy-66 | full-colour |
| 1 | Kyle Wallace | Kenneth Smith | 2 | baseline-copy-67 | two-colour |
| 2 | Andrew Hatfield | Michelle Kelley | 2 | baseline-copy-67 | two-colour |
| 2 | Andrew Hatfield | Michelle Kelley | 3 | pilot-copy-68 | full-colour |
| 3 | Kimberly Smith | Kimberly Myers | 3 | pilot-copy-68 | full-colour |
| 3 | Kimberly Smith | Kimberly Myers | 4 | extended-copy-69 | two-colour |
| 4 | Michael Williams | Tasha Rodriguez | 4 | extended-copy-69 | two-colour |
| 4 | Michael Williams | Tasha Rodriguez | 1 | distributed-copy-66 | full-colour |

### Views Joining Calendar Themes to Orders

The view `v_calendar_theme_calendar_order_detail` joins `calendar_themes` to `calendar_orders` on `calendar_theme_id`, answering "which orders used a given theme?" Theme 1000 ("Distributed Standard", "Classic Cars") is used in order 1 (`extended-order-93`, unit price 5,692). Theme 1001 ("Adaptive Framework D", "Exotic Cars") is used in order 2 (`integrated-order-94`, unit price 45,650).

**View `v_calendar_theme_calendar_order_detail`**

```sql
CREATE VIEW v_calendar_theme_calendar_order_detail AS
SELECT a.id, a.theme_name, a.category, b.calendar_order_id AS order_calendar_order_id, b.order_reference AS order_order_reference, b.order_date AS order_order_date
FROM calendar_themes a
  JOIN themes_orders j ON j.calendar_theme_id = a.id
  JOIN calendar_orders b ON b.calendar_order_id = j.calendar_order_id;
```

| id | theme_name | category | order_calendar_order_id | order_order_reference | order_order_date |
|---|---|---|---|---|---|
| 1000 | Distributed Standard | Classic Cars | 1 | extended-order-93 | 2023-02-27T13:15:00 |
| 1000 | Distributed Standard | Classic Cars | 2 | integrated-order-94 | 2024-07-11T20:32:00 |
| 1001 | Adaptive Framework D | Exotic Cars | 2 | integrated-order-94 | 2024-07-11T20:32:00 |
| 1001 | Adaptive Framework D | Exotic Cars | 3 | seasonal-order-95 | 2025-12-22T03:49:00 |
| 1002 | Primary Protocol | Road Warriors | 3 | seasonal-order-95 | 2025-12-22T03:49:00 |
| 1002 | Primary Protocol | Road Warriors | 4 | regional-order-96 | 2022-05-06T10:06:00 |
| 1003 | Composite Programme | Scenes of Canada | 4 | regional-order-96 | 2022-05-06T10:06:00 |
| 1003 | Composite Programme | Scenes of Canada | 1 | extended-order-93 | 2023-02-27T13:15:00 |

### Views Joining Ad Copies to Orders, Clients, and Logos

The view `v_ad_copy_calendar_order` joins `ad_copies` to `calendar_orders` on `ad_copy_id`, answering "which order used a given ad copy?" Ad copy 1 (`distributed-copy-66`) is used in order 1 (`extended-order-93`, status `pending`). Ad copy 2 (`baseline-copy-67`) is used in order 2 (`integrated-order-94`, status `submitted`).

**View `v_ad_copy_calendar_order`**

```sql
CREATE VIEW v_ad_copy_calendar_order AS
SELECT a.ad_copy_id, a.copy_area_dimensions, a.print_color, a.language, b.calendar_order_id AS order_calendar_order_id, b.order_reference AS order_order_reference, b.order_date AS order_order_date
FROM ad_copies a JOIN calendar_orders b ON a.calendar_order_id = b.calendar_order_id;
```

| ad_copy_id | copy_area_dimensions | print_color | language | order_calendar_order_id | order_order_reference | order_order_date |
|---|---|---|---|---|---|---|
| 1 | distributed-copy-66 | full-colour | English | 1 | extended-order-93 | 2023-02-27T13:15:00 |
| 2 | baseline-copy-67 | two-colour | Bilingual | 2 | integrated-order-94 | 2024-07-11T20:32:00 |
| 3 | pilot-copy-68 | full-colour | English | 3 | seasonal-order-95 | 2025-12-22T03:49:00 |
| 4 | extended-copy-69 | two-colour | Bilingual | 4 | regional-order-96 | 2022-05-06T10:06:00 |

The view `v_ad_copy_business_client` joins `ad_copies` to `business_clients` on `business_client_id`, answering "which client commissioned a given ad copy?" Ad copy 1 is commissioned by client 1 ("Kyle Wallace"). Ad copy 2 is commissioned by client 2 ("Andrew Hatfield").

**View `v_ad_copy_business_client`**

```sql
CREATE VIEW v_ad_copy_business_client AS
SELECT a.ad_copy_id, a.copy_area_dimensions, a.print_color, a.language, b.id AS client_id, b.business_name AS client_business_name, b.contact_name AS client_contact_name
FROM ad_copies a JOIN business_clients b ON a.business_client_id = b.id;
```

| ad_copy_id | copy_area_dimensions | print_color | language | client_id | client_business_name | client_contact_name |
|---|---|---|---|---|---|---|
| 1 | distributed-copy-66 | full-colour | English | 1 | Kyle Wallace | Kenneth Smith |
| 2 | baseline-copy-67 | two-colour | Bilingual | 2 | Andrew Hatfield | Michelle Kelley |
| 3 | pilot-copy-68 | full-colour | English | 3 | Kimberly Smith | Kimberly Myers |
| 4 | extended-copy-69 | two-colour | Bilingual | 4 | Michael Williams | Tasha Rodriguez |

The view `v_ad_copy_corporate_logo` joins `ad_copies` to `corporate_logos` on `corporate_logo_id`, answering "which logo accompanies a given ad copy?" Ad copy 1 is paired with logo 1 (`client_provided`, "Feedback Ratings"). Ad copy 2 is paired with logo 2 (`vendor_standard`, "Abbott Laboratories").

**View `v_ad_copy_corporate_logo`**

```sql
CREATE VIEW v_ad_copy_corporate_logo AS
SELECT a.ad_copy_id, a.copy_area_dimensions, a.print_color, a.language, b.id AS logo_id, b.logo_type AS logo_logo_type, b.vendor AS logo_vendor
FROM ad_copies a JOIN corporate_logos b ON a.corporate_logo_id = b.id;
```

| ad_copy_id | copy_area_dimensions | print_color | language | logo_id | logo_logo_type | logo_vendor |
|---|---|---|---|---|---|---|
| 1 | distributed-copy-66 | full-colour | English | 1 | client_provided | Feedback Ratings |
| 2 | baseline-copy-67 | two-colour | Bilingual | 2 | vendor_standard | Abbott Laboratories |
| 3 | pilot-copy-68 | full-colour | English | 3 | client_provided | American Express |
| 4 | extended-copy-69 | two-colour | Bilingual | 4 | vendor_standard | Whatsapp Inc. |

### Views Joining Corporate Logos to Orders and Ad Copies

The view `v_corporate_logo_calendar_order_detail` joins `corporate_logos` to `calendar_orders` on `corporate_logo_id`, answering "which orders used a given logo?" Logo 1 (`client_provided`, "Feedback Ratings") is used in order 1 (`extended-order-93`, total quantity 20). Logo 2 (`vendor_standard`, "Abbott Laboratories") is used in order 2 (`integrated-order-94`, total quantity 20).

**View `v_corporate_logo_calendar_order_detail`**

```sql
CREATE VIEW v_corporate_logo_calendar_order_detail AS
SELECT a.id, a.logo_type, a.vendor, b.calendar_order_id AS order_calendar_order_id, b.order_reference AS order_order_reference, b.order_date AS order_order_date
FROM corporate_logos a
  JOIN logos_orders j ON j.corporate_logo_id = a.id
  JOIN calendar_orders b ON b.calendar_order_id = j.calendar_order_id;
```

| id | logo_type | vendor | order_calendar_order_id | order_order_reference | order_order_date |
|---|---|---|---|---|---|
| 1 | client_provided | Feedback Ratings | 1 | extended-order-93 | 2023-02-27T13:15:00 |
| 1 | client_provided | Feedback Ratings | 2 | integrated-order-94 | 2024-07-11T20:32:00 |
| 2 | vendor_standard | Abbott Laboratories | 2 | integrated-order-94 | 2024-07-11T20:32:00 |
| 2 | vendor_standard | Abbott Laboratories | 3 | seasonal-order-95 | 2025-12-22T03:49:00 |
| 3 | client_provided | American Express | 3 | seasonal-order-95 | 2025-12-22T03:49:00 |
| 3 | client_provided | American Express | 4 | regional-order-96 | 2022-05-06T10:06:00 |
| 4 | vendor_standard | Whatsapp Inc. | 4 | regional-order-96 | 2022-05-06T10:06:00 |
| 4 | vendor_standard | Whatsapp Inc. | 1 | extended-order-93 | 2023-02-27T13:15:00 |

The view `v_corporate_logo_ad_copy_detail` joins `corporate_logos` to `ad_copies` on `corporate_logo_id`, answering "which ad copy is paired with a given logo?" Logo 1 is paired with ad copy 1 (`distributed-copy-66`, `full-colour`, `English`). Logo 2 is paired with ad copy 2 (`baseline-copy-67`, `two-colour`, `Bilingual`).

**View `v_corporate_logo_ad_copy_detail`**

```sql
CREATE VIEW v_corporate_logo_ad_copy_detail AS
SELECT a.id, a.logo_type, a.vendor, b.ad_copy_id AS copy_ad_copy_id, b.copy_area_dimensions AS copy_copy_area_dimensions, b.print_color AS copy_print_color
FROM corporate_logos a
  JOIN logos_copies j ON j.corporate_logo_id = a.id
  JOIN ad_copies b ON b.ad_copy_id = j.ad_copy_id;
```

| id | logo_type | vendor | copy_ad_copy_id | copy_copy_area_dimensions | copy_print_color |
|---|---|---|---|---|---|
| 1 | client_provided | Feedback Ratings | 1 | distributed-copy-66 | full-colour |
| 1 | client_provided | Feedback Ratings | 2 | baseline-copy-67 | two-colour |
| 2 | vendor_standard | Abbott Laboratories | 2 | baseline-copy-67 | two-colour |
| 2 | vendor_standard | Abbott Laboratories | 3 | pilot-copy-68 | full-colour |
| 3 | client_provided | American Express | 3 | pilot-copy-68 | full-colour |
| 3 | client_provided | American Express | 4 | extended-copy-69 | two-colour |
| 4 | vendor_standard | Whatsapp Inc. | 4 | extended-copy-69 | two-colour |
| 4 | vendor_standard | Whatsapp Inc. | 1 | distributed-copy-66 | full-colour |

## Synthesis

The model separates concerns cleanly: `calendar_orders` is the central fact table carrying the commercial attributes of each production order, while `business_clients`, `calendar_themes`, `ad_copies`, and `corporate_logos` are dimension tables providing the descriptive context. The four direct foreign keys in `calendar_orders` establish one-to-many relationships from each dimension to the fact, and the five junction tables (`clients_orders`, `clients_copies`, `themes_orders`, `logos_orders`, `logos_copies`) provide the flexibility to express many-to-many relationships where a single entity participates in multiple orders or ad copies. The twelve views each materialize a pairwise join between two base tables, answering a specific analytical question by reconstructing a domain fact from the normalized tables. Together, the base tables and views form a complete, queryable representation of the B2B calendar production pipeline.