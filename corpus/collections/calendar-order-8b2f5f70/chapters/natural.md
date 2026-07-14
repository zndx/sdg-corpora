## Calendar Order Management

The calendar order management domain captures the end-to-end lifecycle of custom promotional calendar production, where business clients commission themed calendars bearing their advertising copy and corporate branding. Each calendar order is a discrete commercial transaction that ties together a client organization, a thematic category, an advertising specification, and a logo asset. The system tracks orders from initial submission through fulfillment, recording pricing details, quantities, and regulatory deadlines along the way.

**Table `calendar_orders`**

| calendar_order_id | order_reference | order_date | unit_price | setup_fee | total_quantity | status | submission_deadline | business_client_id | calendar_theme_id | ad_copy_id | corporate_logo_id |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | extended-order-93 | 2023-02-27T13:15:00 | 5,692 | 30.51 | 20 | pending | 2025-08-26 | 1 | 1000 | 1 | 1 |
| 2 | integrated-order-94 | 2024-07-11T20:32:00 | 45,650 | 38.08 | 20 | submitted | 2022-01-10 | 2 | 1001 | 2 | 2 |
| 3 | seasonal-order-95 | 2025-12-22T03:49:00 | 2,705 | 12.34 | 0 | processing | 2023-06-21 | 3 | 1002 | 3 | 3 |
| 4 | regional-order-96 | 2022-05-06T10:06:00 | 211.07 | 33.06 | 1 | fulfilled | 2024-11-05 | 4 | 1003 | 4 | 4 |

A calendar order is the central record in this domain. The `calendar_order_id` provides a unique identifier, while the `order_reference` field carries a human-readable label such as `extended-order-93` or `seasonal-order-95`. The `order_date` marks when the order was placed, and the `submission_deadline` defines the latest date by which the client must finalize or approve the order. Pricing is captured through `unit_price` and `setup_fee`, with `total_quantity` indicating the number of calendar units ordered. The `status` column tracks the order's progression through the pipeline, taking values such as `pending`, `submitted`, `processing`, and `fulfilled`. Each order is associated with a business client, a calendar theme, an ad copy, and a corporate logo through foreign key columns.

**Table `business_clients`**

| id | business_name | contact_name | membership_status | email_address | fax_number | website_url |
|---|---|---|---|---|---|---|
| 1 | Kyle Wallace | Kenneth Smith | false | primary-email-70 | FAX-2047 | https://github.com/chiphuyen/lazynlp |
| 2 | Andrew Hatfield | Michelle Kelley | true | adaptive-email-71 | FAX-2049 | https://bugs.launchpad.net/ironic/+bug/1346406 |
| 3 | Kimberly Smith | Kimberly Myers | false | distributed-email-72 | FAX-2051 | http://en.wikipedia.org/wiki/Hyla_femoralis |
| 4 | Michael Williams | Tasha Rodriguez | true | baseline-email-73 | FAX-2053 | https://www.nature.com/articles/nphoton.2014.41 |

Business clients are the organizations and individuals who place calendar orders. The `business_clients` table stores each client's `business_name`, a `contact_name` for direct communication, and their `membership_status`, a boolean flag indicating whether the client holds an active membership. Contact information includes an `email_address`, `fax_number`, and `website_url`. In the current dataset, clients range from Kyle Wallace (contact: Kenneth Smith, non-member) to Andrew Hatfield (contact: Michelle Kelley, active member). The membership status appears to correlate with order volume: Andrew Hatfield, the sole active member, has orders with the highest unit prices, including the `integrated-order-94` at a unit price of 45,650.

**Table `calendar_themes`**

| id | theme_name | category | preview_url |
|---|---|---|---|
| 1000 | Distributed Standard | Classic Cars | http://marvel.wikia.com/Robert_Bruce_Banner_(Earth-616) |
| 1001 | Adaptive Framework D | Exotic Cars | https://www.nature.com/articles/nphoton.2014.42 |
| 1002 | Primary Protocol | Road Warriors | http://www.barrelassembly.com |
| 1003 | Composite Programme | Scenes of Canada | https://archive.org/details/CNN_20101215_180000_CNN_Newsroom |

Calendar themes define the visual and editorial direction of each calendar product. The `calendar_themes` table records a `theme_name` such as `Distributed Standard` or `Adaptive Framework D`, a `category` that groups themes into broader subject areas like Classic Cars, Exotic Cars, Road Warriors, and Scenes of Canada, and a `preview_url` where clients can review sample layouts. The four themes in the dataset span automotive photography and Canadian cultural imagery, suggesting a diverse product catalog aimed at different market segments.

**Table `ad_copies`**

| ad_copy_id | copy_area_dimensions | print_color | language | imprint_source | calendar_order_id | business_client_id | corporate_logo_id |
|---|---|---|---|---|---|---|---|
| 1 | distributed-copy-66 | full-colour | English | new | 1 | 1 | 1 |
| 2 | baseline-copy-67 | two-colour | Bilingual | repeated_2019 | 2 | 2 | 2 |
| 3 | pilot-copy-68 | full-colour | English | new | 3 | 3 | 3 |
| 4 | extended-copy-69 | two-colour | Bilingual | repeated_2019 | 4 | 4 | 4 |

Ad copies specify the advertising content printed on each calendar. The `ad_copies` table captures the `copy_area_dimensions` (e.g., `distributed-copy-66`), the `print_color` specification (either `full-colour` or `two-colour`), the `language` of the copy (English or Bilingual), and the `imprint_source`, which indicates whether the copy is `new` or `repeated_2019`. Each ad copy record is linked to a specific calendar order, a business client, and a corporate logo, forming a tight bundle of branding elements. In the dataset, ad copies alternate between full-colour and two-colour printing, with English and Bilingual languages distributed across the four records.

**Table `corporate_logos`**

| id | logo_type | vendor |
|---|---|---|
| 1 | client_provided | Feedback Ratings |
| 2 | vendor_standard | Abbott Laboratories |
| 3 | client_provided | American Express |
| 4 | vendor_standard | Whatsapp Inc. |

Corporate logos represent the branding assets applied to calendar products. The `corporate_logos` table stores a `logo_type` indicating whether the logo is `client_provided` or `vendor_standard`, and a `vendor` field naming the source organization, such as Feedback Ratings, Abbott Laboratories, American Express, or Whatsapp Inc. The logo type is a critical operational distinction: client-provided logos require verification and quality checks, while vendor-standard logos are pre-approved templates.

The relational structure extends beyond these five core tables through a set of junction tables that model many-to-many relationships. The `clients_orders` table links business clients to calendar orders, allowing a single client to place multiple orders and a single order to be associated with multiple clients. In the current data, client 1 (Kyle Wallace) appears in orders 1 and 2, while client 4 (Michael Williams) appears in orders 4 and 1, demonstrating that clients can be associated with orders in non-sequential patterns.

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

The `clients_copies` table establishes relationships between business clients and ad copies, enabling clients to reuse advertising content across different calendar orders or to assign multiple copies to a single client account. Similarly, `themes_orders` links calendar themes to orders, and `logos_orders` links corporate logos to orders, both supporting the flexibility needed when clients commission multiple calendar products with overlapping or interchangeable assets.

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

The `logos_copies` table connects corporate logos to ad copies, allowing a single logo asset to be reused across multiple advertising specifications. This is particularly relevant when a client maintains a consistent brand identity across different print formats and color schemes.

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

## Order-Client Relationships

The view `v_calendar_order_business_client` joins calendar orders with their associated business clients, answering the question of which organization is responsible for each order and what the financial terms are. This view is essential for account management, allowing staff to see all orders attributed to a given client in a single query.

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

For example, the first row of this view would show that Kyle Wallace (client ID 1) placed the `extended-order-93` on 2023-02-27 at a unit price of 5,692 with a total quantity of 20 units, currently in `pending` status. The fourth row would reveal that Michael Williams (client ID 4) placed the `regional-order-96` on 2022-05-06 at a unit price of 211.07 with a single unit, already marked as `fulfilled`. This join enables revenue tracking by client and supports decisions about membership renewals and account prioritization.

## Order-Theme Relationships

The view `v_calendar_order_calendar_theme` joins calendar orders with their selected themes, revealing which thematic category each order falls under. This relationship is fundamental for production planning, as different themes may require different photography licensing, layout templates, and printing specifications.

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

The first row of this view would pair the `extended-order-93` with the `Distributed Standard` theme in the Classic Cars category, while the second row would link the `integrated-order-94` to `Adaptive Framework D` under Exotic Cars. The third row connects `seasonal-order-95` to `Primary Protocol` (Road Warriors), and the fourth row associates `regional-order-96` with `Composite Programme` (Scenes of Canada). Production managers use this view to balance workload across theme categories and to ensure that seasonal themes like Road Warriors are ordered ahead of their relevant periods.

## Order-Ad Copy Relationships

The view `v_calendar_order_ad_copy` joins calendar orders with their advertising copy specifications, providing a complete picture of the branding elements for each order. This view is critical for the design and pre-press teams, who need to know the print color, language, and imprint source for every order they process.

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

In the first row, the `extended-order-93` is paired with `distributed-copy-66`, a full-colour English ad copy marked as `new`. The second row shows the `integrated-order-94` with `baseline-copy-67`, a two-colour Bilingual copy sourced from `repeated_2019`. The third row links `seasonal-order-95` to `pilot-copy-68` (full-colour, English, new), and the fourth row connects `regional-order-96` to `extended-copy-69` (two-colour, Bilingual, repeated_2019). The distinction between new and repeated copies has operational implications: repeated copies bypass initial design review, reducing turnaround time.

## Order-Logo Relationships

The view `v_calendar_order_corporate_logo` joins calendar orders with their corporate logo assets, informing the production team about the branding source for each order. This relationship determines whether a logo requires client verification or can be applied directly from the vendor standard library.

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

The first row of this view would show that the `extended-order-93` uses a `client_provided` logo from Feedback Ratings, requiring quality verification before printing. The second row links the `integrated-order-94` to a `vendor_standard` logo from Abbott Laboratories, which can be applied without additional review. The third row pairs `seasonal-order-95` with a `client_provided` logo from American Express, and the fourth row connects `regional-order-96` to a `vendor_standard` logo from Whatsapp Inc. The ratio of client-provided to vendor-standard logos in any given period affects the pre-press workload and should be monitored for capacity planning.

## Client-Centric Order Detail

The view `v_business_client_calendar_order_detail` provides a client-centric perspective by joining business clients with their calendar orders, presenting all order details alongside client information. This view supports account management and client-facing reporting.

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

The first row of this view would present Kyle Wallace's contact details (contact: Kenneth Smith, non-member) alongside the `extended-order-93` order, including its unit price of 5,692, quantity of 20, and pending status. The second row would show Andrew Hatfield (contact: Michelle Kelley, active member) with the `integrated-order-94` at a unit price of 45,650 and quantity of 20, currently submitted. This consolidated view allows account managers to assess the total value and status of each client's portfolio at a glance.

## Client-Centric Ad Copy Detail

The view `v_business_client_ad_copy_detail` joins business clients with their ad copies, revealing which advertising specifications each client has used. This view is useful for identifying clients who consistently use certain print specifications or languages, enabling targeted upselling and content recommendations.

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

The first row would show Kyle Wallace associated with `distributed-copy-66`, a full-colour English ad copy. The second row would link Andrew Hatfield to `baseline-copy-67`, a two-colour Bilingual copy. The third row connects Kimberly Smith to `pilot-copy-68` (full-colour, English), and the fourth row associates Michael Williams with `extended-copy-69` (two-colour, Bilingual). The pattern of English versus Bilingual copies may inform decisions about regional marketing strategies or language-specific promotional campaigns.

## Theme-Centric Order Detail

The view `v_calendar_theme_calendar_order_detail` joins calendar themes with their associated orders, providing a theme-centric view of demand. This view helps production planners understand which themes are most popular and whether certain categories are underrepresented in the order pipeline.

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

The first row would pair the `Distributed Standard` theme (Classic Cars category) with the `extended-order-93`, showing a unit price of 5,692 and a pending status. The second row would link `Adaptive Framework D` (Exotic Cars) to the `integrated-order-94` at a unit price of 45,650 with submitted status. The third row connects `Primary Protocol` (Road Warriors) to `seasonal-order-95` at a unit price of 2,705 with processing status, and the fourth row associates `Composite Programme` (Scenes of Canada) with `regional-order-96` at a unit price of 211.07 and fulfilled status. This view supports strategic decisions about which theme categories to promote or expand.

## Ad Copy-Centric Order View

The view `v_ad_copy_calendar_order` joins ad copies with their calendar orders, presenting the advertising specifications alongside the order details. This view is primarily used by the design and pre-press teams to understand the full context of each ad copy assignment.

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

The first row would show `distributed-copy-66` (full-colour, English, new) associated with the `extended-order-93` from client Kyle Wallace, with a unit price of 5,692. The second row would link `baseline-copy-67` (two-colour, Bilingual, repeated_2019) to the `integrated-order-94` from Andrew Hatfield at a unit price of 45,650. The third row connects `pilot-copy-68` (full-colour, English, new) to `seasonal-order-95` from Kimberly Smith at a unit price of 2,705, and the fourth row associates `extended-copy-69` (two-colour, Bilingual, repeated_2019) with `regional-order-96` from Michael Williams at a unit price of 211.07. The pre-press team uses this view to batch similar print specifications together for efficient workflow.

## Ad Copy-Centric Client View

The view `v_ad_copy_business_client` joins ad copies with their associated business clients, revealing which clients have used which advertising specifications. This view supports client relationship management by identifying patterns in ad copy usage and enabling personalized recommendations.

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

The first row would show Kyle Wallace associated with `distributed-copy-66`, a full-colour English ad copy. The second row would link Andrew Hatfield to `baseline-copy-67`, a two-colour Bilingual copy. The third row connects Kimberly Smith to `pilot-copy-68` (full-colour, English), and the fourth row associates Michael Williams with `extended-copy-69` (two-colour, Bilingual). This view helps identify opportunities for cross-selling: for example, a client who consistently uses full-colour printing might be a candidate for premium package upgrades.

## Ad Copy-Centric Logo View

The view `v_ad_copy_corporate_logo` joins ad copies with their corporate logos, showing the branding asset paired with each advertising specification. This view is used by the design team to verify that logo and copy specifications are compatible and that all branding elements are properly accounted for.

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

The first row would pair `distributed-copy-66` with the client-provided logo from Feedback Ratings. The second row would link `baseline-copy-67` to the vendor-standard logo from Abbott Laboratories. The third row connects `pilot-copy-68` with the client-provided logo from American Express, and the fourth row associates `extended-copy-69` with the vendor-standard logo from Whatsapp Inc. The design team reviews this view to ensure that client-provided logos meet resolution and format requirements before they are approved for production.

## Logo-Centric Order Detail

The view `v_corporate_logo_calendar_order_detail` joins corporate logos with their calendar orders, providing a logo-centric view of how branding assets are deployed across the order pipeline. This view is useful for tracking logo usage patterns and for managing vendor relationships.

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

The first row would show the client-provided logo from Feedback Ratings associated with the `extended-order-93` at a unit price of 5,692, currently pending. The second row would link the vendor-standard logo from Abbott Laboratories to the `integrated-order-94` at a unit price of 45,650 with submitted status. The third row connects the client-provided logo from American Express to `seasonal-order-95` at a unit price of 2,705 with processing status, and the fourth row associates the vendor-standard logo from Whatsapp Inc. with `regional-order-96` at a unit price of 211.07 and fulfilled status. This view supports vendor performance tracking and helps identify which logo sources are most frequently used.

## Logo-Centric Ad Copy Detail

The view `v_corporate_logo_ad_copy_detail` joins corporate logos with their ad copies, revealing the relationship between branding assets and advertising specifications. This view is used by the creative team to ensure consistency between logo application and copy design across all products.

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

The first row would pair the client-provided logo from Feedback Ratings with `distributed-copy-66`, a full-colour English ad copy. The second row would link the vendor-standard logo from Abbott Laboratories to `baseline-copy-67`, a two-colour Bilingual copy. The third row connects the client-provided logo from American Express to `pilot-copy-68` (full-colour, English), and the fourth row associates the vendor-standard logo from Whatsapp Inc. with `extended-copy-69` (two-colour, Bilingual). This view helps the creative team maintain brand consistency and identify opportunities for logo and copy bundle optimization.

## Synthesis

The calendar order management domain models a structured commercial process where business clients commission themed promotional calendars with specific advertising and branding requirements. The five core tables—calendar orders, business clients, calendar themes, ad copies, and corporate logos—capture the essential attributes of each transaction, while the four junction tables (clients_orders, clients_copies, themes_orders, logos_orders, and logos_copies) provide the flexibility to model complex many-to-many relationships between entities. The twelve views synthesize these relationships into perspective-specific lenses: order-centric views support production planning, client-centric views enable account management, theme-centric views inform product strategy, and asset-centric views guide design and pre-press operations. Together, these records and their relationships form a comprehensive operational picture of a custom calendar production business, where pricing, branding, and fulfillment are tracked from initial order through final delivery.

## Data appendix

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
