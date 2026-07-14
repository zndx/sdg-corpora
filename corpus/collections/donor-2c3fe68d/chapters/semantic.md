The domain under examination is a charitable giving and recognition system, where individual donors contribute funds to programs, memorial or honor gifts are recorded, and contact preferences are tracked alongside recipient notifications. At its core, the model captures a single donation event as the central fact, enriched by the identity of the donor, the program that receives the funds, the person being honored or memorialized, and the contact recipient who is notified. Six base tables materialize this domain into a normalized relational schema, and ten views reconstruct the domain facts through controlled joins.

**Table `Donor`**

| donorIdentifier | donorName | streetAddress | city | state | zipCode | emailAddress | isAnonymous | donationId | requestId |
|---|---|---|---|---|---|---|---|---|---|
| DON-2650 | Regional Framework | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | primary-email-70 | true | 1 | 1000 |
| DON-2654 | Seasonal Protocol D | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | adaptive-email-71 | false | 2 | 1001 |
| DON-2658 | Integrated Programme | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | distributed-email-72 | true | 3 | 1002 |
| DON-2662 | Extended Standard | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | baseline-email-73 | false | 4 | 1003 |

The `Donor` table stores the identity and contact information of the person or organization making a contribution. Its primary key, `donorIdentifier`, uses a prefixed code such as `DON-2650` to uniquely identify each donor. The `donorName` column holds the display name — for example, `Regional Framework` or `Seasonal Protocol D` — while the address is decomposed into `streetAddress`, `city`, `state`, and `zipCode`, yielding values like `composite-street-15` in `integrated-city-34` under `distributed-state-84` with postal code `69434`. The `emailAddress` column (e.g., `primary-email-70`) provides a communication channel, and `isAnonymous` is a boolean flag; a value of `true` indicates the donor wishes to remain unattributed. Two foreign keys anchor the donor to other entities: `donationId` references `Donation.donationId`, and `requestId` references `ContactRequest.id`. These columns encode the cardinality-bounded relationships — each donor record points to exactly one donation and one contact request in this schema.

**Table `Donation`**

| donationId | donationIdentifier | amount | donationDate | isMemorial | isHonor | isDeferred | donorZipCode | programId | honoreeId | recipientId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | DON-2057 | 13.49 | 2022-01-26 | false | true | false | 69434 | 1 | 1000 | 1 |
| 2 | DON-2058 | 25.47 | 2023-06-10 | true | false | true | 13589 | 2 | 1001 | 2 |
| 3 | DON-2059 | 19.72 | 2024-11-21 | false | true | false | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 3 | 1002 | 3 |
| 4 | DON-2060 | 12.74 | 2025-04-05 | true | false | true | 1250214 | 4 | 1003 | 4 |

The `Donation` table is the central fact table of the model. Its surrogate primary key `donationId` (values `1` through `4`) is paired with a business identifier `donationIdentifier` such as `DON-2057`. The monetary dimension is captured in `amount`, with sample values of `13.49`, `25.47`, `19.72`, and `12.74`. The `donationDate` column (e.g., `2022-01-26`) records when the gift was made. Three boolean flags — `isMemorial`, `isHonor`, and `isDeferred` — classify the nature of the gift; for instance, donation `1` has `isMemeral = false` and `isHonor = true`, while donation `2` has `isMemorial = true` and `isDeferred = true`. The column `donorZipCode` stores a denormalized copy of the donor's postal code for query convenience. Three foreign keys link the donation to its contextual entities: `programId` references `Program.id`, `honoreeId` references `Honoree.id`, and `recipientId` references `ContactRecipient.id`. Together, these columns reconstruct the full picture of a single charitable transaction.

**Table `Program`**

| id | programIdentifier | programName | programType | donationId |
|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | Service | 1 |
| 2 | PRO-2205 | Pilot Initiative A | Fund | 2 |
| 3 | PRO-2212 | Baseline Model | Camp | 3 |
| 4 | PRO-2219 | Distributed Cluster | Event | 4 |

The `Program` table catalogs the organizational channels through which donations are directed. Its primary key `id` (values `1` through `4`) is paired with `programIdentifier` (e.g., `PRO-2198`) and `programName` (e.g., `Extended Review`, `Pilot Initiative A`, `Baseline Model`, `Distributed Cluster`). The `programType` column classifies the program into categories such as `Service`, `Fund`, `Camp`, or `Event`. The foreign key `donationId` references `Donation.donationId`, establishing a one-to-one linkage from program back to the donation that funded it. This design choice means each program record in the current schema is associated with exactly one donation, making the relationship effectively a one-to-one rather than a many-to-many.

**Table `Honoree`**

| id | honoreeName | honoreeType | donationId |
|---|---|---|---|
| 1000 | Baseline Standard D | Memorial | 1 |
| 1001 | Distributed Framework | Honor | 2 |
| 1002 | Adaptive Protocol | Memorial | 3 |
| 1003 | Primary Programme A | Honor | 4 |

The `Honoree` table records the individual or entity being recognized through a memorial or honor gift. Its primary key `id` (values `1000` through `1003`) is paired with `honoreeName` (e.g., `Baseline Standard D`, `Distributed Framework`, `Adaptive Protocol`, `Primary Programme A`) and `honoreeType`, which takes values such as `Memorial` or `Honor`. The foreign key `donationId` references `Donation.donationId`, tying each honoree record to the specific donation that triggered the recognition. In the sample data, honoree `1000` (`Baseline Standard D`, type `Memorial`) is linked to donation `1`, while honoree `1001` (`Distributed Framework`, type `Honor`) is linked to donation `2`.

**Table `ContactRecipient`**

| id | recipientName | streetAddress | city | state | zipCode | relationship | donationId |
|---|---|---|---|---|---|---|---|
| 1 | Peter Montgomery | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | Spouse | 1 |
| 2 | Kimberly Myers | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | Sibling | 2 |
| 3 | Richard Austin | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | Parent | 3 |
| 4 | Theodore Mcgrath | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | Child | 4 |

The `ContactRecipient` table captures the person who receives notification about a donation, typically a family member or designated contact. Its primary key `id` (values `1` through `4`) is paired with `recipientName` (e.g., `Peter Montgomery`, `Kimberly Myers`, `Richard Austin`, `Theodore Mcgrath`). The address is again decomposed into `streetAddress`, `city`, `state`, and `zipCode`. The `relationship` column describes the connection to the donor, with sample values of `Spouse`, `Sibling`, `Parent`, and `Child`. The foreign key `donationId` references `Donation.donationId`, linking each recipient to the donation that prompted the notification. For example, recipient `1` (`Peter Montgomery`, relationship `Spouse`) is associated with donation `1`.

**Table `ContactRequest`**

| id | requestIdentifier | requestType | isRequested | donorZipCode |
|---|---|---|---|---|
| 1000 | REQ-2516 | Volunteer | false | 69434 |
| 1001 | REQ-2522 | Newsletter | true | 13589 |
| 1002 | REQ-2528 | DeferredGiving | false | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 1003 | REQ-2534 | Volunteer | true | 1250214 |

The `ContactRequest` table stores preferences and requests submitted by donors. Its primary key `id` (values `1000` through `1003`) is paired with `requestIdentifier` (e.g., `REQ-2516`, `REQ-2522`, `REQ-2528`, `REQ-2534`). The `requestType` column classifies the request into categories such as `Volunteer`, `Newsletter`, or `DeferredGiving`. The boolean `isRequested` indicates whether the request has been fulfilled — for instance, request `1001` (`REQ-2522`, type `Newsletter`) has `isRequested = true`, while request `1000` (`REQ-2516`, type `Volunteer`) has `isRequested = false`. The `donorZipCode` column stores a denormalized copy of the donor's postal code. This table is linked to `Donor` through the `requestId` foreign key in the `Donor` table.

The foreign-key topology of the schema can be summarized as follows. The `Donation` table sits at the center, with three outbound foreign keys — `programId`, `honoreeId`, and `recipientId` — pointing to `Program`, `Honoree`, and `ContactRecipient` respectively. The `Donor` table has an outbound foreign key `donationId` pointing to `Donation`, and another outbound key `requestId` pointing to `ContactRequest`. The `Program`, `Honoree`, and `ContactRecipient` tables each have an outbound foreign key `donationId` pointing back to `Donation`. This creates a hub-and-spoke pattern where `Donation` is the central hub, and the other four tables are spokes. The `Donor` table is connected to the hub via `donationId` and to `ContactRequest` via `requestId`. The `ContactRequest` table itself has no outbound foreign keys, making it a leaf in the graph.

**View `donor_donation_view`**

```sql
CREATE VIEW donor_donation_view AS
SELECT a.donorIdentifier, a.donorName, a.streetAddress, a.city, b.donationId AS donation_donationId, b.donationIdentifier AS donation_donationIdentifier, b.amount AS donation_amount
FROM Donor a JOIN Donation b ON a.donationId = b.donationId;
```

| donorIdentifier | donorName | streetAddress | city | donation_donationId | donation_donationIdentifier | donation_amount |
|---|---|---|---|---|---|---|
| DON-2650 | Regional Framework | composite-street-15 | integrated-city-34 | 1 | DON-2057 | 13.49 |
| DON-2654 | Seasonal Protocol D | primary-street-16 | seasonal-city-35 | 2 | DON-2058 | 25.47 |
| DON-2658 | Integrated Programme | adaptive-street-17 | regional-city-36 | 3 | DON-2059 | 19.72 |
| DON-2662 | Extended Standard | distributed-street-18 | legacy-city-37 | 4 | DON-2060 | 12.74 |

The view `donor_donation_view` joins `Donor` to `Donation` on the condition `Donor.donationId = Donation.donationId`. This join answers the question: "What did each donor give, and what are the details of that gift?" Reading the first row of the joined result, we see donor `DON-2650` (`Regional Framework`, `isAnonymous = true`) associated with donation `1` (`DON-2057`, amount `13.49`, date `2022-01-26`, `isHonor = true`). The second row pairs donor `DON-2654` (`Seasonal Protocol D`, `isAnonymous = false`) with donation `2` (`DON-2058`, amount `25.47`, date `2023-06-10`, `isMemorial = true`, `isDeferred = true`). This view materializes the donor-to-gift relationship as a flat, queryable record.

**View `donor_contact_request_view`**

```sql
CREATE VIEW donor_contact_request_view AS
SELECT a.donorIdentifier, a.donorName, a.streetAddress, a.city, b.id AS request_id, b.requestIdentifier AS request_requestIdentifier, b.requestType AS request_requestType
FROM Donor a JOIN ContactRequest b ON a.requestId = b.id;
```

| donorIdentifier | donorName | streetAddress | city | request_id | request_requestIdentifier | request_requestType |
|---|---|---|---|---|---|---|
| DON-2650 | Regional Framework | composite-street-15 | integrated-city-34 | 1000 | REQ-2516 | Volunteer |
| DON-2654 | Seasonal Protocol D | primary-street-16 | seasonal-city-35 | 1001 | REQ-2522 | Newsletter |
| DON-2658 | Integrated Programme | adaptive-street-17 | regional-city-36 | 1002 | REQ-2528 | DeferredGiving |
| DON-2662 | Extended Standard | distributed-street-18 | legacy-city-37 | 1003 | REQ-2534 | Volunteer |

The view `donor_contact_request_view` joins `Donor` to `ContactRequest` on `Donor.requestId = ContactRequest.id`. It answers the question: "What contact preferences has each donor expressed?" The first row shows donor `DON-2650` (`Regional Framework`) linked to request `1000` (`REQ-2516`, type `Volunteer`, `isRequested = false`). The second row pairs donor `DON-2654` (`Seasonal Protocol D`) with request `1001` (`REQ-2522`, type `Newsletter`, `isRequested = true`). The join reconstructs the full context of a donor's engagement preference by combining identity data from `Donor` with request metadata from `ContactRequest`.

**View `donation_donor_view`**

```sql
CREATE VIEW donation_donor_view AS
SELECT a.donationId, a.donationIdentifier, a.amount, a.donationDate, b.donorIdentifier AS donor_donorIdentifier, b.donorName AS donor_donorName, b.streetAddress AS donor_streetAddress
FROM Donation a JOIN Donor b ON a.donorZipCode = b.zipCode;
```

| donationId | donationIdentifier | amount | donationDate | donor_donorIdentifier | donor_donorName | donor_streetAddress |
|---|---|---|---|---|---|---|
| 1 | DON-2057 | 13.49 | 2022-01-26 | DON-2650 | Regional Framework | composite-street-15 |
| 2 | DON-2058 | 25.47 | 2023-06-10 | DON-2654 | Seasonal Protocol D | primary-street-16 |
| 3 | DON-2059 | 19.72 | 2024-11-21 | DON-2658 | Integrated Programme | adaptive-street-17 |
| 4 | DON-2060 | 12.74 | 2025-04-05 | DON-2662 | Extended Standard | distributed-street-18 |

The view `donation_donor_view` joins `Donation` to `Donor` on `Donation.donationId = Donor.donationId`. This is the inverse of `donor_donation_view` and answers the question: "Who gave each donation?" The first row presents donation `1` (`DON-2057`, amount `13.49`, `isHonor = true`) attributed to donor `DON-2650` (`Regional Framework`, `isAnonymous = true`). The second row shows donation `2` (`DON-2058`, amount `25.47`, `isMemorial = true`, `isDeferred = true`) attributed to donor `DON-2654` (`Seasonal Protocol D`, `isAnonymous = false`). This perspective is useful for reporting from the gift outward to the giver.

**View `donation_program_view`**

```sql
CREATE VIEW donation_program_view AS
SELECT a.donationId, a.donationIdentifier, a.amount, a.donationDate, b.id AS program_id, b.programIdentifier AS program_programIdentifier, b.programName AS program_programName
FROM Donation a JOIN Program b ON a.programId = b.id;
```

| donationId | donationIdentifier | amount | donationDate | program_id | program_programIdentifier | program_programName |
|---|---|---|---|---|---|---|
| 1 | DON-2057 | 13.49 | 2022-01-26 | 1 | PRO-2198 | Extended Review |
| 2 | DON-2058 | 25.47 | 2023-06-10 | 2 | PRO-2205 | Pilot Initiative A |
| 3 | DON-2059 | 19.72 | 2024-11-21 | 3 | PRO-2212 | Baseline Model |
| 4 | DON-2060 | 12.74 | 2025-04-05 | 4 | PRO-2219 | Distributed Cluster |

The view `donation_program_view` joins `Donation` to `Program` on `Donation.programId = Program.id`. It answers the question: "Which program received each donation?" The first row pairs donation `1` (`DON-2057`, amount `13.49`) with program `1` (`PRO-2198`, `Extended Review`, type `Service`). The second row links donation `2` (`DON-2058`, amount `25.47`) with program `2` (`PRO-2205`, `Pilot Initiative A`, type `Fund`). This view is essential for financial reporting by program, allowing analysts to aggregate amounts by `programName` or `programType`.

**View `donation_honoree_view`**

```sql
CREATE VIEW donation_honoree_view AS
SELECT a.donationId, a.donationIdentifier, a.amount, a.donationDate, b.id AS honoree_id, b.honoreeName AS honoree_honoreeName, b.honoreeType AS honoree_honoreeType
FROM Donation a JOIN Honoree b ON a.honoreeId = b.id;
```

| donationId | donationIdentifier | amount | donationDate | honoree_id | honoree_honoreeName | honoree_honoreeType |
|---|---|---|---|---|---|---|
| 1 | DON-2057 | 13.49 | 2022-01-26 | 1000 | Baseline Standard D | Memorial |
| 2 | DON-2058 | 25.47 | 2023-06-10 | 1001 | Distributed Framework | Honor |
| 3 | DON-2059 | 19.72 | 2024-11-21 | 1002 | Adaptive Protocol | Memorial |
| 4 | DON-2060 | 12.74 | 2025-04-05 | 1003 | Primary Programme A | Honor |

The view `donation_honoree_view` joins `Donation` to `Honoree` on `Donation.honoreeId = Honoree.id`. It answers the question: "Which person or entity is being honored or memorialized by each donation?" The first row shows donation `1` (`DON-2057`, `isHonor = true`) linked to honoree `1000` (`Baseline Standard D`, type `Memorial`). The second row links donation `2` (`DON-2058`, `isMemorial = true`) to honoree `1001` (`Distributed Framework`, type `Honor`). This view enables recognition reporting, allowing the organization to track which honorees have received gifts and in what capacity.

**View `donation_contact_recipient_view`**

```sql
CREATE VIEW donation_contact_recipient_view AS
SELECT a.donationId, a.donationIdentifier, a.amount, a.donationDate, b.id AS recipient_id, b.recipientName AS recipient_recipientName, b.streetAddress AS recipient_streetAddress
FROM Donation a JOIN ContactRecipient b ON a.recipientId = b.id;
```

| donationId | donationIdentifier | amount | donationDate | recipient_id | recipient_recipientName | recipient_streetAddress |
|---|---|---|---|---|---|---|
| 1 | DON-2057 | 13.49 | 2022-01-26 | 1 | Peter Montgomery | composite-street-15 |
| 2 | DON-2058 | 25.47 | 2023-06-10 | 2 | Kimberly Myers | primary-street-16 |
| 3 | DON-2059 | 19.72 | 2024-11-21 | 3 | Richard Austin | adaptive-street-17 |
| 4 | DON-2060 | 12.74 | 2025-04-05 | 4 | Theodore Mcgrath | distributed-street-18 |

The view `donation_contact_recipient_view` joins `Donation` to `ContactRecipient` on `Donation.recipientId = ContactRecipient.id`. It answers the question: "Who is being notified about each donation, and what is their relationship to the donor?" The first row pairs donation `1` (`DON-2057`) with recipient `1` (`Peter Montgomery`, relationship `Spouse`, located at `composite-street-15` in `integrated-city-34`). The second row links donation `2` (`DON-2058`) to recipient `2` (`Kimberly Myers`, relationship `Sibling`, located at `primary-street-16` in `seasonal-city-35`). This view supports outreach and acknowledgment workflows by providing the full contact context for each gift.

**View `program_donation_view`**

```sql
CREATE VIEW program_donation_view AS
SELECT a.id, a.programIdentifier, a.programName, a.programType, b.donationId AS donation_donationId, b.donationIdentifier AS donation_donationIdentifier, b.amount AS donation_amount
FROM Program a JOIN Donation b ON a.donationId = b.donationId;
```

| id | programIdentifier | programName | programType | donation_donationId | donation_donationIdentifier | donation_amount |
|---|---|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | Service | 1 | DON-2057 | 13.49 |
| 2 | PRO-2205 | Pilot Initiative A | Fund | 2 | DON-2058 | 25.47 |
| 3 | PRO-2212 | Baseline Model | Camp | 3 | DON-2059 | 19.72 |
| 4 | PRO-2219 | Distributed Cluster | Event | 4 | DON-2060 | 12.74 |

The view `program_donation_view` joins `Program` to `Donation` on `Program.donationId = Donation.donationId`. This is the inverse of `donation_program_view` and answers the question: "Which donations funded each program?" The first row shows program `1` (`PRO-2198`, `Extended Review`, type `Service`) funded by donation `1` (`DON-2057`, amount `13.49`). The second row links program `2` (`PRO-2205`, `Pilot Initiative A`, type `Fund`) to donation `2` (`DON-2058`, amount `25.47`). This perspective is useful for program managers who need to see the gift-level detail behind their program's funding.

**View `honoree_donation_view`**

```sql
CREATE VIEW honoree_donation_view AS
SELECT a.id, a.honoreeName, a.honoreeType, b.donationId AS donation_donationId, b.donationIdentifier AS donation_donationIdentifier, b.amount AS donation_amount
FROM Honoree a JOIN Donation b ON a.donationId = b.donationId;
```

| id | honoreeName | honoreeType | donation_donationId | donation_donationIdentifier | donation_amount |
|---|---|---|---|---|---|
| 1000 | Baseline Standard D | Memorial | 1 | DON-2057 | 13.49 |
| 1001 | Distributed Framework | Honor | 2 | DON-2058 | 25.47 |
| 1002 | Adaptive Protocol | Memorial | 3 | DON-2059 | 19.72 |
| 1003 | Primary Programme A | Honor | 4 | DON-2060 | 12.74 |

The view `honoree_donation_view` joins `Honoree` to `Donation` on `Honoree.donationId = Donation.donationId`. This is the inverse of `donation_honoree_view` and answers the question: "Which donations recognized each honoree?" The first row presents honoree `1000` (`Baseline Standard D`, type `Memorial`) recognized by donation `1` (`DON-2057`, amount `13.49`, `isHonor = true`). The second row links honoree `1001` (`Distributed Framework`, type `Honor`) to donation `2` (`DON-2058`, amount `25.47`, `isMemorial = true`). This view supports recognition tracking from the honoree's perspective.

**View `contact_recipient_donation_view`**

```sql
CREATE VIEW contact_recipient_donation_view AS
SELECT a.id, a.recipientName, a.streetAddress, a.city, b.donationId AS donation_donationId, b.donationIdentifier AS donation_donationIdentifier, b.amount AS donation_amount
FROM ContactRecipient a JOIN Donation b ON a.donationId = b.donationId;
```

| id | recipientName | streetAddress | city | donation_donationId | donation_donationIdentifier | donation_amount |
|---|---|---|---|---|---|---|
| 1 | Peter Montgomery | composite-street-15 | integrated-city-34 | 1 | DON-2057 | 13.49 |
| 2 | Kimberly Myers | primary-street-16 | seasonal-city-35 | 2 | DON-2058 | 25.47 |
| 3 | Richard Austin | adaptive-street-17 | regional-city-36 | 3 | DON-2059 | 19.72 |
| 4 | Theodore Mcgrath | distributed-street-18 | legacy-city-37 | 4 | DON-2060 | 12.74 |

The view `contact_recipient_donation_view` joins `ContactRecipient` to `Donation` on `ContactRecipient.donationId = Donation.donationId`. This is the inverse of `donation_contact_recipient_view` and answers the question: "Which donations triggered a notification to each contact recipient?" The first row shows recipient `1` (`Peter Montgomery`, relationship `Spouse`) notified about donation `1` (`DON-2057`, amount `13.49`). The second row links recipient `2` (`Kimberly Myers`, relationship `Sibling`) to donation `2` (`DON-2058`, amount `25.47`). This view is useful for auditing notification compliance and understanding the reach of acknowledgment communications.

**View `contact_request_donor_view`**

```sql
CREATE VIEW contact_request_donor_view AS
SELECT a.id, a.requestIdentifier, a.requestType, a.isRequested, b.donorIdentifier AS donor_donorIdentifier, b.donorName AS donor_donorName, b.streetAddress AS donor_streetAddress
FROM ContactRequest a JOIN Donor b ON a.donorZipCode = b.zipCode;
```

| id | requestIdentifier | requestType | isRequested | donor_donorIdentifier | donor_donorName | donor_streetAddress |
|---|---|---|---|---|---|---|
| 1000 | REQ-2516 | Volunteer | false | DON-2650 | Regional Framework | composite-street-15 |
| 1001 | REQ-2522 | Newsletter | true | DON-2654 | Seasonal Protocol D | primary-street-16 |
| 1002 | REQ-2528 | DeferredGiving | false | DON-2658 | Integrated Programme | adaptive-street-17 |
| 1003 | REQ-2534 | Volunteer | true | DON-2662 | Extended Standard | distributed-street-18 |

The view `contact_request_donor_view` joins `ContactRequest` to `Donor` on `ContactRequest.id = Donor.requestId`. This is the inverse of `donor_contact_request_view` and answers the question: "Which donor submitted each contact request?" The first row shows request `1000` (`REQ-2516`, type `Volunteer`, `isRequested = false`) submitted by donor `DON-2650` (`Regional Framework`). The second row links request `1001` (`REQ-2522`, type `Newsletter`, `isRequested = true`) to donor `DON-2654` (`Seasonal Protocol D`). This view supports request management by surfacing the donor context alongside each preference submission.

The materialization of this domain into a relational schema follows a deliberate normalization strategy. The `Donation` table serves as the central fact, with its three foreign keys (`programId`, `honoreeId`, `recipientId`) pointing to dimension tables that store descriptive attributes separately. This design avoids repeating program names, honoree details, and recipient addresses within the `Donation` table, reducing redundancy and ensuring update consistency. The `Donor` table similarly stores identity and address data separately from the gift itself, linked by the `donationId` foreign key. The `ContactRequest` table is linked to `Donor` rather than to `Donation`, reflecting the domain fact that contact preferences belong to the donor as a person, not to a specific gift.

Denormalized columns such as `donorZipCode` in both `Donation` and `ContactRequest` serve as query optimization aids, allowing fast filtering by postal code without requiring a join to `Donor`. The boolean flags in `Donation` (`isMemorial`, `isHonor`, `isDeferred`) encode gift classification directly in the fact table, enabling efficient filtering and aggregation without additional joins.

The ten views collectively provide every pairwise combination of the central `Donation` entity with its four associated dimensions (`Donor`, `Program`, `Honoree`, `ContactRecipient`), plus the two cross-entity views (`donor_contact_request_view` and `contact_request_donor_view`) that connect the donor to their contact preferences. Each view is a controlled reconstruction of a domain fact from the normalized base tables, answering a specific analytical question by joining exactly two tables along a single foreign-key path. This pattern — a central fact table with dimension joins exposed as named views — is a standard relational modeling technique that balances storage efficiency with query convenience, allowing analysts to work with flat, denormalized result sets while the underlying schema remains normalized and consistent.