## The Architecture of Donor Engagement

Charitable organizations manage a complex ecosystem of contributions, recognition programs, and outreach initiatives. At the heart of this ecosystem lies a structured record of every donation, linked to the donor who made it, the program that received it, and the individuals honored or remembered through the gift. Beyond the transaction itself, organizations track contact preferences and recipient relationships, building a comprehensive picture of engagement. This chapter examines the data structures that capture these relationships, drawing on concrete records to illustrate how each component fits into the broader operational framework.

The foundation of the system begins with the people and organizations who give.

**Table `Donor`**

| donorIdentifier | donorName | streetAddress | city | state | zipCode | emailAddress | isAnonymous | donationId | requestId |
|---|---|---|---|---|---|---|---|---|---|
| DON-2650 | Regional Framework | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | primary-email-70 | true | 1 | 1000 |
| DON-2654 | Seasonal Protocol D | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | adaptive-email-71 | false | 2 | 1001 |
| DON-2658 | Integrated Programme | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | distributed-email-72 | true | 3 | 1002 |
| DON-2662 | Extended Standard | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | baseline-email-73 | false | 4 | 1003 |

The Donor table stores identifying and contact information for every contributor. Each record carries a unique donor identifier such as DON-2650 or DON-2654, alongside the donor's name, full street address, city, state, and zip code. An email address provides a digital contact point. The isAnonymous flag determines whether the donor's identity is publicly visible; for instance, DON-2650 (Regional Framework) and DON-2658 (Integrated Programme) are both marked as anonymous, while DON-2654 (Seasonal Protocol D) and DON-2662 (Extended Standard) are not. The donationId and requestId columns link each donor record to specific transactions and outreach requests, creating the bridge between the donor's profile and their activity.

Every contribution is captured as a discrete event in the Donation table.

**Table `Donation`**

| donationId | donationIdentifier | amount | donationDate | isMemorial | isHonor | isDeferred | donorZipCode | programId | honoreeId | recipientId |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | DON-2057 | 13.49 | 2022-01-26 | false | true | false | 69434 | 1 | 1000 | 1 |
| 2 | DON-2058 | 25.47 | 2023-06-10 | true | false | true | 13589 | 2 | 1001 | 2 |
| 3 | DON-2059 | 19.72 | 2024-11-21 | false | true | false | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | 3 | 1002 | 3 |
| 4 | DON-2060 | 12.74 | 2025-04-05 | true | false | true | 1250214 | 4 | 1003 | 4 |

The Donation table records each gift with a donation identifier (DON-2057 through DON-2060), the monetary amount, and the date the donation was made. Amounts in the current dataset range from 12.74 to 25.47, with donation dates spanning from January 2022 through April 2025. Three boolean flags classify the nature of each gift: isMemorial indicates whether the donation honors someone who has passed, isHonor marks a gift made in celebration of a living person, and isDeferred signals that the contribution will be fulfilled at a future date. The first donation (DON-2057) is an honor gift dated 2022-01-26 for 13.47, while the second (DON-2058) is both a memorial and a deferred gift dated 2023-06-10 for 25.47. The donorZipCode column provides a quick geographic reference, and the programId, honoreeId, and recipientId columns link the donation to its destination and associated individuals.

Programs define the categories and purposes that receive donations.

**Table `Program`**

| id | programIdentifier | programName | programType | donationId |
|---|---|---|---|---|
| 1 | PRO-2198 | Extended Review | Service | 1 |
| 2 | PRO-2205 | Pilot Initiative A | Fund | 2 |
| 3 | PRO-2212 | Baseline Model | Camp | 3 |
| 4 | PRO-2219 | Distributed Cluster | Event | 4 |

Each program is identified by a program identifier such as PRO-2198 or PRO-2205 and carries a descriptive programName like "Extended Review" or "Pilot Initiative A." The programType classifies the nature of the program into categories such as Service, Fund, Camp, or Event. The Extended Review (PRO-2198) operates as a Service program, while Pilot Initiative A (PRO-2205) functions as a Fund. Baseline Model (PRO-2212) is a Camp program, and Distributed Cluster (PRO-2219) is an Event. The donationId column creates the link back to the specific donation that funds or supports the program, establishing a direct financial relationship between the gift and its intended use.

Honorees represent the individuals recognized through memorial or honor gifts.

**Table `Honoree`**

| id | honoreeName | honoreeType | donationId |
|---|---|---|---|
| 1000 | Baseline Standard D | Memorial | 1 |
| 1001 | Distributed Framework | Honor | 2 |
| 1002 | Adaptive Protocol | Memorial | 3 |
| 1003 | Primary Programme A | Honor | 4 |

The Honoree table stores the name and type of each recognized individual. Honoree types correspond to the nature of recognition: Memorial for those being remembered after death, and Honor for those being celebrated while living. Baseline Standard D (id 1000) is recognized as a Memorial, while Distributed Framework (id 1001) is recognized as an Honor. Adaptive Protocol (id 1002) carries the Memorial designation, and Primary Programme A (id 1003) carries the Honor designation. The donationId column ties each honoree record to the specific donation that triggered the recognition, ensuring that every tribute can be traced back to its source.

Contact recipients are the people organizations reach out to on behalf of donors or in connection with donations.

**Table `ContactRecipient`**

| id | recipientName | streetAddress | city | state | zipCode | relationship | donationId |
|---|---|---|---|---|---|---|---|
| 1 | Peter Montgomery | composite-street-15 | integrated-city-34 | distributed-state-84 | 69434 | Spouse | 1 |
| 2 | Kimberly Myers | primary-street-16 | seasonal-city-35 | baseline-state-85 | 13589 | Sibling | 2 |
| 3 | Richard Austin | adaptive-street-17 | regional-city-36 | pilot-state-86 | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 | Parent | 3 |
| 4 | Theodore Mcgrath | distributed-street-18 | legacy-city-37 | extended-state-87 | 1250214 | Child | 4 |

The ContactRecipient table maintains records of individuals who receive communications, either as the donor themselves or as a designated contact. Each record includes the recipient's name, full address, and a relationship field that describes their connection to the donor or the donation context. Peter Montgomery (id 1) is listed with the relationship "Spouse," Kimberly Myers (id 2) as "Sibling," Richard Austin (id 3) as "Parent," and Theodore Mcgrath (id 4) as "Child." The donationId column links each contact recipient to the relevant donation, enabling organizations to understand the relational context of their outreach.

Contact requests capture the preferences and interests that donors express to the organization.

**Table `ContactRequest`**

| id | requestIdentifier | requestType | isRequested | donorZipCode |
|---|---|---|---|---|
| 1000 | REQ-2516 | Volunteer | false | 69434 |
| 1001 | REQ-2522 | Newsletter | true | 13589 |
| 1002 | REQ-2528 | DeferredGiving | false | 9bb5fec0-8fcc-11eb-924d-9cd76263cbd0 |
| 1003 | REQ-2534 | Volunteer | true | 1250214 |

The ContactRequest table records outreach requests submitted by or on behalf of donors. Each request carries a unique identifier such as REQ-2516 or REQ-2522, a requestType that specifies the nature of the interest (Volunteer, Newsletter, or DeferredGiving), and an isRequested flag indicating whether the request has been fulfilled. REQ-2516 is a Volunteer request that has not been fulfilled (isRequested is false), while REQ-2522 is a Newsletter request that has been fulfilled (isRequested is true). REQ-2528 is a DeferredGiving request that remains unfulfilled, and REQ-2534 is a Volunteer request that has been fulfilled. The donorZipCode column provides geographic context for the request, linking it back to the donor's location.

The relationships between these tables become most visible through joined views that answer specific operational questions.

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

The donor_donation_view joins donor profiles with their corresponding donations, answering the question of which donors have made which contributions. This view reveals that DON-2650 (Regional Framework) is associated with donation DON-2057 for 13.49, while DON-2654 (Seasonal Protocol D) is linked to donation DON-2058 for 25.47. The view preserves the anonymous flag, so organizations can see that the donor behind DON-2057 is anonymous even while viewing the donation details. Similarly, DON-2658 (Integrated Programme) appears with donation DON-2059 for 19.72, and DON-2662 (Extended Standard) with donation DON-2060 for 12.74. This join is essential for donor stewardship, allowing staff to review the giving history of each contributor in a single record.

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

The donor_contact_request_view connects donors with their contact requests, revealing how each contributor has expressed interest in further engagement. DON-2650 (Regional Framework) has submitted request REQ-2516 for Volunteer opportunities, which remains unfulfilled. DON-2654 (Seasonal Protocol D) has submitted request REQ-2522 for the Newsletter, which has been fulfilled. DON-2658 (Integrated Programme) has submitted request REQ-2528 for DeferredGiving, which remains unfulfilled, while DON-2662 (Extended Standard) has submitted request REQ-2534 for Volunteer opportunities, which has been fulfilled. This view enables organizations to track outreach follow-ups and ensure that donor interests are addressed in a timely manner.

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

The donation_donor_view presents each donation alongside the full profile of the donor who made it, answering the question of who gave what and when. Donation DON-2057 for 13.49 on 2022-01-26 is linked to donor DON-2650 (Regional Framework), who is marked as anonymous. Donation DON-2058 for 25.47 on 2023-06-10 is linked to donor DON-2654 (Seasonal Protocol D), who is not anonymous. The view combines the donation's flags with the donor's contact information, providing a complete picture for receipt generation and acknowledgment. For example, the memorial and deferred flags on DON-2058 can be cross-referenced with the non-anonymous status of DON-2654 to determine the appropriate acknowledgment protocol.

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

The donation_program_view links each donation to the program it supports, answering the question of how funds are distributed across organizational initiatives. Donation DON-2057 is associated with program PRO-2198 (Extended Review), a Service-type program. Donation DON-2058 is associated with program PRO-2205 (Pilot Initiative A), a Fund-type program. Donation DON-2059 is associated with program PRO-2212 (Baseline Model), a Camp-type program. Donation DON-2060 is associated with program PRO-2219 (Distributed Cluster), an Event-type program. This view is critical for financial reporting, allowing organizations to track revenue by program category and ensure that restricted gifts are applied to their intended destinations.

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

The donation_honoree_view connects donations with the individuals they honor or memorialize, answering the question of which gifts carry recognition. Donation DON-2057 is linked to honoree 1000 (Baseline Standard D), a Memorial recognition. Donation DON-2058 is linked to honoree 1001 (Distributed Framework), an Honor recognition. Donation DON-2059 is linked to honoree 1002 (Adaptive Protocol), a Memorial recognition. Donation DON-2060 is linked to honoree 1003 (Primary Programme A), an Honor recognition. This view supports the operational workflow of recognition notifications, ensuring that families and honorees receive appropriate correspondence when a gift is made in their name.

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

The donation_contact_recipient_view associates each donation with its contact recipient, answering the question of who should be notified about a particular gift. Donation DON-2057 is linked to contact recipient 1 (Peter Montgomery), whose relationship is Spouse. Donation DON-2058 is linked to contact recipient 2 (Kimberly Myers), whose relationship is Sibling. Donation DON-2059 is linked to contact recipient 3 (Richard Austin), whose relationship is Parent. Donation DON-2060 is linked to contact recipient 4 (Theodore Mcgrath), whose relationship is Child. This view is essential for managing the distribution of acknowledgment letters and recognition notices to the appropriate individuals, whether they are the donors themselves or designated contacts.

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

The program_donation_view presents each program alongside the donations that fund it, answering the question of which contributions support each initiative. Program PRO-2198 (Extended Review, Service type) is funded by donation DON-2057 for 13.49. Program PRO-2205 (Pilot Initiative A, Fund type) is funded by donation DON-2058 for 25.47. Program PRO-2212 (Baseline Model, Camp type) is funded by donation DON-2059 for 19.72. Program PRO-2219 (Distributed Cluster, Event type) is funded by donation DON-2060 for 12.74. This view enables program managers to see their funding sources and supports budget planning by showing the relationship between program types and donation amounts.

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

The honoree_donation_view links each honoree with the donation that recognizes them, answering the question of which gifts are associated with each person being honored. Honoree 1000 (Baseline Standard D, Memorial type) is recognized through donation DON-2057. Honoree 1001 (Distributed Framework, Honor type) is recognized through donation DON-2058. Honoree 1002 (Adaptive Protocol, Memorial type) is recognized through donation DON-2059. Honoree 1003 (Primary Programme A, Honor type) is recognized through donation DON-2060. This view supports the recognition workflow by providing a complete list of all honors and memorials, along with the associated donation details needed for notification and record-keeping.

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

The contact_recipient_donation_view connects each contact recipient with the donation they are associated with, answering the question of which gifts each person should be notified about. Contact recipient 1 (Peter Montgomery, Spouse) is associated with donation DON-2057. Contact recipient 2 (Kimberly Myers, Sibling) is associated with donation DON-2058. Contact recipient 3 (Richard Austin, Parent) is associated with donation DON-2059. Contact recipient 4 (Theodore Mcgrath, Child) is associated with donation DON-2060. This view ensures that acknowledgment and recognition communications reach the correct individuals based on their relationship to the donation.

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

The contact_request_donor_view joins contact requests with the donors who submitted them, answering the question of which donors have expressed which interests and whether those interests have been addressed. Donor DON-2650 (Regional Framework) submitted request REQ-2516 (Volunteer), which is not yet fulfilled. Donor DON-2654 (Seasonal Protocol D) submitted request REQ-2522 (Newsletter), which has been fulfilled. Donor DON-2658 (Integrated Programme) submitted request REQ-2528 (DeferredGiving), which is not yet fulfilled. Donor DON-2662 (Extended Standard) submitted request REQ-2534 (Volunteer), which has been fulfilled. This view is vital for tracking donor engagement pipelines, allowing staff to prioritize follow-up on unfulfilled requests and confirm that fulfilled requests have been properly documented.

## Synthesis

The data structures described above form an integrated system for managing the full lifecycle of donor engagement. Donors are identified and profiled, their contributions are recorded with classification flags, and each gift is linked to a program, an honoree, and a contact recipient. Contact requests capture ongoing interests, creating a feedback loop that informs future outreach. The joined views provide operational clarity by presenting these relationships in context-specific formats, enabling staff to answer questions about giving patterns, program funding, recognition workflows, and engagement follow-ups. Together, these records support the operational integrity of the organization, ensuring that every donation is properly accounted for, every recognition is appropriately communicated, and every donor interest is tracked to resolution.