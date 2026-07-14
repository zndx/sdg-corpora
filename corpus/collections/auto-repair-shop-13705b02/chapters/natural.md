## The Auto Repair Shop Domain

The auto repair shop domain captures the operational fabric of vehicle service organizations—how shops schedule work, how technicians are deployed, how customers experience service, and how diagnostic tools enable repair work. Every record in the system traces a real-world entity or relationship: a shop with a production target, a technician with a skill level and hourly rate, a repair task with estimated and actual durations, a customer with a satisfaction score, and a diagnostic tool with a calibration date. The data model is relational, with junction tables mediating many-to-many associations between shops, technicians, customers, and tasks.

**Table `auto_repair_shops`**

| id | shop_id | shop_name | established_date | shop_type | daily_production_target | current_daily_production | is_profitable | diagnostic_tool_id |
|---|---|---|---|---|---|---|---|---|
| 100 | 3717615 | Regional Initiative | 2024-03-27 | repair_shop | 8.95 | 13.70 | true | 1 |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2025-08-11 | franchise | 12.90 | 15.40 | false | 2 |
| 102 | 3001009030060 | Integrated Cluster | 2022-01-22 | quick_lube | 16.85 | 17.10 | true | 3 |
| 103 | 505989 | Extended Review | 2023-06-06 | specialty | 20.80 | 18.80 | false | 4 |

Each auto repair shop carries a unique identifier, a human-readable name, and a classification by type. Shops range from independent repair shops to franchises, quick-lube centers, and specialty operations. The shop "Regional Initiative" (identifier 3717615) was established on 2024-03-27 as a repair_shop with a daily production target of 8.95 units and a current daily production of 13.70, marking it as profitable. By contrast, "Seasonal Model D" (identifier 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0), a franchise established on 2025-08-11, targets 12.90 units but produces 15.40 yet is flagged as not profitable—a signal that revenue and volume do not always align. The shop "Integrated Cluster" (3001009030060), a quick_lube established in 2022, targets 16.85 and produces 17.10, while "Extended Review" (505989), a specialty shop established in 2023, targets 20.80 but produces only 18.80 and is not profitable. Each shop is linked to a diagnostic tool via its `diagnostic_tool_id`, anchoring the tool to the shop's operational context.

**Table `technicians`**

| id | technician_id | first_name | last_name | hourly_rate | skill_level | is_assigned_to_repair | auto_repair_shop_id | task_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | 611494 | Stephanie Collins | Paul Allen | 13.45 | entry_level | true | 100 | 7731870 |
| 1001 | 5006464 | Janice Johnston | Heather Beasley | 17.90 | basic | false | 101 | id_28 |
| 1002 | 2404 | Upal Saha | Audrey Taylor | 22.35 | master | true | 102 | 7119763 |
| 1003 | 1186102 | Katherine Snyder | Susan Wagner | 26.80 | entry_level | false | 103 | lu_tax_code_template_m82 |

Technicians are the human core of the repair operation. Each record stores a first and last name, an hourly rate, a skill level, and assignment flags. Stephanie Collins (identifier 611494) is an entry_level technician earning $13.45 per hour, currently assigned to a repair task (7731870) at shop 100. Janice Johnston (5006464), a basic-level technician at $17.90 per hour, is not currently assigned to a repair task but is linked to task id_28. Upal Saha (2404), a master-level technician earning $22.35 per hour, is assigned to task 7119763 at shop 102. Katherine Snyder (1186102), an entry_level technician at $26.80 per hour, is not assigned to a repair task and is linked to task lu_tax_code_template_m82 at shop 103. The `is_assigned_to_repair` flag indicates whether a technician is actively engaged in a repair task at the time of the record.

**Table `repair_tasks`**

| task_id | task_description | estimated_duration | actual_duration | task_status | labor_cost | technician_id | customer_id | diagnostic_tool_id |
|---|---|---|---|---|---|---|---|---|
| 7731870 | Legacy Standard D | 42 | 41 | pending | 16.54 | 1000 | 1 | 1 |
| id_28 | Regional Framework | 52 | 48 | in_progress | 35.61 | 1001 | 2 | 2 |
| 7119763 | Seasonal Protocol | 62 | 55 | completed | 12.72 | 1002 | 3 | 3 |
| lu_tax_code_template_m82 | Integrated Programme A | 72 | 62 | failed | 33.06 | 1003 | 4 | 4 |

Repair tasks represent discrete units of work performed on vehicles. Each task has a description, estimated and actual durations (in hours), a status, a labor cost, and foreign keys to the assigned technician, the customer, and the diagnostic tool used. Task 7731870, "Legacy Standard D," was estimated at 42 hours but completed in 41, remains in pending status, and cost $16.54 in labor. Task id_28, "Regional Framework," was estimated at 52 hours and completed in 48, is in_progress, and cost $35.61. Task 7119763, "Seasonal Protocol," was estimated at 62 hours and completed in 55, is completed, and cost $12.72. Task lu_tax_code_template_m82, "Integrated Programme A," was estimated at 72 hours but completed in 62, has a status of failed, and cost $33.06. The variance between estimated and actual duration provides a measure of technician efficiency and task complexity.

**Table `customers`**

| id | customer_id | first_name | last_name | contact_number | satisfaction_score | is_raving_fan | auto_repair_shop_id |
|---|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Stephanie Collins | Paul Allen | Peter Mcdowell | 4.45 | true | 100 |
| 2 | Bryan Larson | Janice Johnston | Heather Beasley | Sophia Meyer | 6.90 | false | 101 |
| 3 | Allen Saunders | Upal Saha | Audrey Taylor | Carol Gaines | 9.35 | true | 102 |
| 4 | Francis Gulotta | Katherine Snyder | Susan Wagner | April Snyder | 11.80 | false | 103 |

Customers are the recipients of repair services. Each customer record includes a name, contact number, a satisfaction score, and a flag indicating whether the customer is a raving fan. Customer Stephanie Lawrence (identifier 1) has a satisfaction score of 4.45 and is a raving fan, associated with shop 100. Customer Bryan Larson (2) has a satisfaction score of 6.90 and is not a raving fan, associated with shop 101. Customer Allen Saunders (3) has a satisfaction score of 9.35 and is a raving fan, associated with shop 102. Customer Francis Gulotta (4) has a satisfaction score of 11.80 and is not a raving fan, associated with shop 103. The satisfaction scores vary widely, suggesting different service experiences across shops.

**Table `diagnostic_tools`**

| id | tool_id | tool_name | tool_type | is_free | last_calibration_date | technician_id | task_id |
|---|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | hardware | true | 2025-12-01 | 1000 | 7731870 |
| 2 | 195360 | Compact Cluster A | software | false | 2022-05-12 | 1001 | id_28 |
| 3 | 3355763 | Legacy Review | hardware | true | 2023-10-23 | 1002 | 7119763 |
| 4 | 8387539 | Regional Initiative | software | false | 2024-03-07 | 1003 | lu_tax_code_template_m82 |

Diagnostic tools are the instruments used to diagnose vehicle issues. Each tool has a name, a type (hardware or software), a free-or-paid flag, a last calibration date, and links to the technician and task associated with its use. Tool comi (identifier 1), a hardware tool named "Composite Model," is free and was last calibrated on 2025-12-01; it is associated with technician 1000 and task 7731870. Tool 195360 (identifier 2), a software tool named "Compact Cluster A," is not free and was last calibrated on 2022-05-12; it is associated with technician 1001 and task id_28. Tool 3355763 (identifier 3), a hardware tool named "Legacy Review," is free and was last calibrated on 2023-10-23; it is associated with technician 1002 and task 7119763. Tool 8387539 (identifier 4), a software tool named "Regional Initiative," is not free and was last calibrated on 2024-03-07; it is associated with technician 1003 and task lu_tax_code_template_m82.

**Table `shops_technicians`**

| auto_repair_shop_id | technician_id |
|---|---|
| 100 | 1000 |
| 100 | 1001 |
| 101 | 1001 |
| 101 | 1002 |
| 102 | 1002 |
| 102 | 1003 |
| 103 | 1003 |
| 103 | 1000 |

The many-to-many relationship between shops and technicians is captured in the junction table `shops_technicians`. A technician can work at multiple shops, and a shop can employ multiple technicians. Shop 100 employs technicians 1000 and 1001. Shop 101 employs technicians 1001 and 1002. Shop 102 employs technicians 1002 and 1003. Shop 103 employs technicians 1003 and 1000. This cross-assignment model allows for flexible staffing: technician 1000 works at both shops 100 and 103, while technician 1001 spans shops 100 and 101.

**Table `shops_customers`**

| auto_repair_shop_id | customer_id |
|---|---|
| 100 | 1 |
| 100 | 2 |
| 101 | 2 |
| 101 | 3 |
| 102 | 3 |
| 102 | 4 |
| 103 | 4 |
| 103 | 1 |

The `shops_customers` junction table records which customers are associated with which shops. This relationship enables the tracking of customer loyalty, service history, and shop-level customer satisfaction aggregation.

**Table `customers_tasks`**

| customer_id | task_id |
|---|---|
| 1 | 7731870 |
| 1 | id_28 |
| 2 | id_28 |
| 2 | 7119763 |
| 3 | 7119763 |
| 3 | lu_tax_code_template_m82 |
| 4 | lu_tax_code_template_m82 |
| 4 | 7731870 |

The `customers_tasks` junction table records which customers are associated with which repair tasks. This relationship enables the tracking of customer-specific service records and the aggregation of task-level data per customer.

### Shop–Technician Detail

**View `v_auto_repair_shop_technician_detail`**

```sql
CREATE VIEW v_auto_repair_shop_technician_detail AS
SELECT a.id, a.shop_id, a.shop_name, b.id AS technician_id, b.technician_id AS technician_technician_id, b.first_name AS technician_first_name
FROM auto_repair_shops a
  JOIN shops_technicians j ON j.auto_repair_shop_id = a.id
  JOIN technicians b ON b.id = j.technician_id;
```

| id | shop_id | shop_name | technician_id | technician_technician_id | technician_first_name |
|---|---|---|---|---|---|
| 100 | 3717615 | Regional Initiative | 1000 | 611494 | Stephanie Collins |
| 100 | 3717615 | Regional Initiative | 1001 | 5006464 | Janice Johnston |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 1001 | 5006464 | Janice Johnston |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 1002 | 2404 | Upal Saha |
| 102 | 3001009030060 | Integrated Cluster | 1002 | 2404 | Upal Saha |
| 102 | 3001009030060 | Integrated Cluster | 1003 | 1186102 | Katherine Snyder |
| 103 | 505989 | Extended Review | 1003 | 1186102 | Katherine Snyder |
| 103 | 505989 | Extended Review | 1000 | 611494 | Stephanie Collins |

This view joins shop and technician records to answer the question: which technicians are deployed at which shops, and what are their skill levels and hourly rates? The joined result surfaces the shop's name, type, and production metrics alongside the technician's name, skill level, and rate. For example, a row might show shop "Regional Initiative" (repair_shop, target 8.95, production 13.70) paired with technician Stephanie Collins (entry_level, $13.45/hour). Another row might pair shop "Extended Review" (specialty, target 20.80, production 18.80) with technician Katherine Snyder (entry_level, $26.80/hour). This view supports staffing analysis: comparing the skill mix of technicians at each shop against the shop's production demands.

### Shop–Customer Detail

**View `v_auto_repair_shop_customer_detail`**

```sql
CREATE VIEW v_auto_repair_shop_customer_detail AS
SELECT a.id, a.shop_id, a.shop_name, b.id AS customer_id, b.customer_id AS customer_customer_id, b.first_name AS customer_first_name
FROM auto_repair_shops a
  JOIN shops_customers j ON j.auto_repair_shop_id = a.id
  JOIN customers b ON b.id = j.customer_id;
```

| id | shop_id | shop_name | customer_id | customer_customer_id | customer_first_name |
|---|---|---|---|---|---|
| 100 | 3717615 | Regional Initiative | 1 | Stephanie Lawrence | Stephanie Collins |
| 100 | 3717615 | Regional Initiative | 2 | Bryan Larson | Janice Johnston |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2 | Bryan Larson | Janice Johnston |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 3 | Allen Saunders | Upal Saha |
| 102 | 3001009030060 | Integrated Cluster | 3 | Allen Saunders | Upal Saha |
| 102 | 3001009030060 | Integrated Cluster | 4 | Francis Gulotta | Katherine Snyder |
| 103 | 505989 | Extended Review | 4 | Francis Gulotta | Katherine Snyder |
| 103 | 505989 | Extended Review | 1 | Stephanie Lawrence | Stephanie Collins |

This view joins shop and customer records to answer: which customers are served by which shops, and what are their satisfaction scores? The joined result surfaces the shop's name and type alongside the customer's name, satisfaction score, and raving-fan status. For instance, a row might show shop "Regional Initiative" paired with customer Stephanie Lawrence (satisfaction 4.45, raving fan). Another row might pair shop "Extended Review" with customer Francis Gulotta (satisfaction 11.80, not a raving fan). This view supports customer experience analysis: identifying shops with high or low satisfaction averages and flagging raving fans for retention programs.

### Shop–Diagnostic Tool

**View `v_auto_repair_shop_diagnostic_tool`**

```sql
CREATE VIEW v_auto_repair_shop_diagnostic_tool AS
SELECT a.id, a.shop_id, a.shop_name, a.established_date, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM auto_repair_shops a JOIN diagnostic_tools b ON a.diagnostic_tool_id = b.id;
```

| id | shop_id | shop_name | established_date | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 100 | 3717615 | Regional Initiative | 2024-03-27 | 1 | comi | Composite Model |
| 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D | 2025-08-11 | 2 | 195360 | Compact Cluster A |
| 102 | 3001009030060 | Integrated Cluster | 2022-01-22 | 3 | 3355763 | Legacy Review |
| 103 | 505989 | Extended Review | 2023-06-06 | 4 | 8387539 | Regional Initiative |

This view joins shop and diagnostic tool records to answer: which diagnostic tools are available at which shops? The joined result surfaces the shop's name and type alongside the tool's name, type (hardware or software), free-or-paid status, and last calibration date. For example, a row might show shop "Regional Initiative" paired with tool "Composite Model" (hardware, free, calibrated 2025-12-01). Another row might pair shop "Seasonal Model D" with tool "Compact Cluster A" (software, not free, calibrated 2022-05-12). This view supports tool management: tracking calibration compliance and identifying shops that rely on paid versus free tools.

### Technician–Shop

**View `v_technician_auto_repair_shop`**

```sql
CREATE VIEW v_technician_auto_repair_shop AS
SELECT a.id, a.technician_id, a.first_name, a.last_name, b.id AS shop_id, b.shop_id AS shop_shop_id, b.shop_name AS shop_shop_name
FROM technicians a JOIN auto_repair_shops b ON a.auto_repair_shop_id = b.id;
```

| id | technician_id | first_name | last_name | shop_id | shop_shop_id | shop_shop_name |
|---|---|---|---|---|---|---|
| 1000 | 611494 | Stephanie Collins | Paul Allen | 100 | 3717615 | Regional Initiative |
| 1001 | 5006464 | Janice Johnston | Heather Beasley | 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D |
| 1002 | 2404 | Upal Saha | Audrey Taylor | 102 | 3001009030060 | Integrated Cluster |
| 1003 | 1186102 | Katherine Snyder | Susan Wagner | 103 | 505989 | Extended Review |

This view joins technician and shop records to answer: which shops does each technician work at, and what are the shop's production metrics? The joined result surfaces the technician's name, skill level, and hourly rate alongside the shop's name, type, and production data. For example, a row might show technician Upal Saha (master, $22.35/hour) at shop "Integrated Cluster" (quick_lube, target 16.85, production 17.10). This view supports workforce planning: understanding the distribution of skill levels across shops and identifying shops where high-skill technicians are deployed.

### Technician–Repair Task

**View `v_technician_repair_task`**

```sql
CREATE VIEW v_technician_repair_task AS
SELECT a.id, a.technician_id, a.first_name, a.last_name, b.task_id AS task_task_id, b.task_description AS task_task_description, b.estimated_duration AS task_estimated_duration
FROM technicians a JOIN repair_tasks b ON a.task_id = b.task_id;
```

| id | technician_id | first_name | last_name | task_task_id | task_task_description | task_estimated_duration |
|---|---|---|---|---|---|---|
| 1000 | 611494 | Stephanie Collins | Paul Allen | 7731870 | Legacy Standard D | 42 |
| 1001 | 5006464 | Janice Johnston | Heather Beasley | id_28 | Regional Framework | 52 |
| 1002 | 2404 | Upal Saha | Audrey Taylor | 7119763 | Seasonal Protocol | 62 |
| 1003 | 1186102 | Katherine Snyder | Susan Wagner | lu_tax_code_template_m82 | Integrated Programme A | 72 |

This view joins technician and repair task records to answer: which tasks is each technician assigned to, and what are the task's duration and cost metrics? The joined result surfaces the technician's name and skill level alongside the task's description, estimated and actual durations, status, and labor cost. For example, a row might show technician Stephanie Collins (entry_level) assigned to task "Legacy Standard D" (estimated 42 hours, actual 41 hours, pending, $16.54). Another row might pair technician Upal Saha (master) with task "Seasonal Protocol" (estimated 62 hours, actual 55 hours, completed, $12.72). This view supports performance analysis: comparing estimated versus actual durations by skill level and tracking task completion rates.

### Repair Task–Technician

**View `v_repair_task_technician`**

```sql
CREATE VIEW v_repair_task_technician AS
SELECT a.task_id, a.task_description, a.estimated_duration, a.actual_duration, b.id AS technician_id, b.technician_id AS technician_technician_id, b.first_name AS technician_first_name
FROM repair_tasks a JOIN technicians b ON a.technician_id = b.id;
```

| task_id | task_description | estimated_duration | actual_duration | technician_id | technician_technician_id | technician_first_name |
|---|---|---|---|---|---|---|
| 7731870 | Legacy Standard D | 42 | 41 | 1000 | 611494 | Stephanie Collins |
| id_28 | Regional Framework | 52 | 48 | 1001 | 5006464 | Janice Johnston |
| 7119763 | Seasonal Protocol | 62 | 55 | 1002 | 2404 | Upal Saha |
| lu_tax_code_template_m82 | Integrated Programme A | 72 | 62 | 1003 | 1186102 | Katherine Snyder |

This view joins repair task and technician records to answer: which technician performed each repair task, and what are the technician's skill and rate details? The joined result surfaces the task's description, status, and labor cost alongside the technician's name, skill level, and hourly rate. For example, a row might show task "Regional Framework" (in_progress, $35.61) performed by technician Janice Johnston (basic, $17.90/hour). Another row might pair task "Integrated Programme A" (failed, $33.06) with technician Katherine Snyder (entry_level, $26.80/hour). This view supports cost analysis: understanding the relationship between technician skill level, labor cost, and task outcomes.

### Repair Task–Customer

**View `v_repair_task_customer`**

```sql
CREATE VIEW v_repair_task_customer AS
SELECT a.task_id, a.task_description, a.estimated_duration, a.actual_duration, b.id AS customer_id, b.customer_id AS customer_customer_id, b.first_name AS customer_first_name
FROM repair_tasks a JOIN customers b ON a.customer_id = b.id;
```

| task_id | task_description | estimated_duration | actual_duration | customer_id | customer_customer_id | customer_first_name |
|---|---|---|---|---|---|---|
| 7731870 | Legacy Standard D | 42 | 41 | 1 | Stephanie Lawrence | Stephanie Collins |
| id_28 | Regional Framework | 52 | 48 | 2 | Bryan Larson | Janice Johnston |
| 7119763 | Seasonal Protocol | 62 | 55 | 3 | Allen Saunders | Upal Saha |
| lu_tax_code_template_m82 | Integrated Programme A | 72 | 62 | 4 | Francis Gulotta | Katherine Snyder |

This view joins repair task and customer records to answer: which customer received which repair task, and what are the task's status and cost details? The joined result surfaces the customer's name and satisfaction score alongside the task's description, status, and labor cost. For example, a row might show customer Stephanie Lawrence (satisfaction 4.45) receiving task "Legacy Standard D" (pending, $16.54). Another row might pair customer Allen Saunders (satisfaction 9.35, raving fan) with task "Seasonal Protocol" (completed, $12.72). This view supports customer service analysis: correlating task outcomes with customer satisfaction scores.

### Repair Task–Diagnostic Tool

**View `v_repair_task_diagnostic_tool`**

```sql
CREATE VIEW v_repair_task_diagnostic_tool AS
SELECT a.task_id, a.task_description, a.estimated_duration, a.actual_duration, b.id AS tool_id, b.tool_id AS tool_tool_id, b.tool_name AS tool_tool_name
FROM repair_tasks a JOIN diagnostic_tools b ON a.diagnostic_tool_id = b.id;
```

| task_id | task_description | estimated_duration | actual_duration | tool_id | tool_tool_id | tool_tool_name |
|---|---|---|---|---|---|---|
| 7731870 | Legacy Standard D | 42 | 41 | 1 | comi | Composite Model |
| id_28 | Regional Framework | 52 | 48 | 2 | 195360 | Compact Cluster A |
| 7119763 | Seasonal Protocol | 62 | 55 | 3 | 3355763 | Legacy Review |
| lu_tax_code_template_m82 | Integrated Programme A | 72 | 62 | 4 | 8387539 | Regional Initiative |

This view joins repair task and diagnostic tool records to answer: which diagnostic tool was used for each repair task, and what are the tool's type and calibration details? The joined result surfaces the task's description and status alongside the tool's name, type, and last calibration date. For example, a row might show task "Legacy Standard D" (pending) using tool "Composite Model" (hardware, calibrated 2025-12-01). Another row might pair task "Regional Framework" (in_progress) with tool "Compact Cluster A" (software, calibrated 2022-05-12). This view supports tool utilization analysis: understanding which tools are used for which task types and tracking calibration recency.

### Customer–Shop

**View `v_customer_auto_repair_shop`**

```sql
CREATE VIEW v_customer_auto_repair_shop AS
SELECT a.id, a.customer_id, a.first_name, a.last_name, b.id AS shop_id, b.shop_id AS shop_shop_id, b.shop_name AS shop_shop_name
FROM customers a JOIN auto_repair_shops b ON a.auto_repair_shop_id = b.id;
```

| id | customer_id | first_name | last_name | shop_id | shop_shop_id | shop_shop_name |
|---|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Stephanie Collins | Paul Allen | 100 | 3717615 | Regional Initiative |
| 2 | Bryan Larson | Janice Johnston | Heather Beasley | 101 | 9bb5de9a-8fcc-11eb-924d-9cd76263cbd0 | Seasonal Model D |
| 3 | Allen Saunders | Upal Saha | Audrey Taylor | 102 | 3001009030060 | Integrated Cluster |
| 4 | Francis Gulotta | Katherine Snyder | Susan Wagner | 103 | 505989 | Extended Review |

This view joins customer and shop records to answer: which shop serves each customer, and what are the shop's type and production metrics? The joined result surfaces the customer's name and satisfaction score alongside the shop's name, type, and production data. For example, a row might show customer Stephanie Lawrence (satisfaction 4.45) served by shop "Regional Initiative" (repair_shop, target 8.95, production 13.70). Another row might pair customer Allen Saunders (satisfaction 9.35, raving fan) with shop "Integrated Cluster" (quick_lube, target 16.85, production 17.10). This view supports shop performance analysis: understanding the relationship between shop production metrics and customer satisfaction.

### Customer–Repair Task Detail

**View `v_customer_repair_task_detail`**

```sql
CREATE VIEW v_customer_repair_task_detail AS
SELECT a.id, a.customer_id, a.first_name, b.task_id AS task_task_id, b.task_description AS task_task_description, b.estimated_duration AS task_estimated_duration
FROM customers a
  JOIN customers_tasks j ON j.customer_id = a.id
  JOIN repair_tasks b ON b.task_id = j.task_id;
```

| id | customer_id | first_name | task_task_id | task_task_description | task_estimated_duration |
|---|---|---|---|---|---|
| 1 | Stephanie Lawrence | Stephanie Collins | 7731870 | Legacy Standard D | 42 |
| 1 | Stephanie Lawrence | Stephanie Collins | id_28 | Regional Framework | 52 |
| 2 | Bryan Larson | Janice Johnston | id_28 | Regional Framework | 52 |
| 2 | Bryan Larson | Janice Johnston | 7119763 | Seasonal Protocol | 62 |
| 3 | Allen Saunders | Upal Saha | 7119763 | Seasonal Protocol | 62 |
| 3 | Allen Saunders | Upal Saha | lu_tax_code_template_m82 | Integrated Programme A | 72 |
| 4 | Francis Gulotta | Katherine Snyder | lu_tax_code_template_m82 | Integrated Programme A | 72 |
| 4 | Francis Gulotta | Katherine Snyder | 7731870 | Legacy Standard D | 42 |

This view joins customer and repair task records to answer: which repair tasks has each customer received, and what are the task's duration, status, and cost details? The joined result surfaces the customer's name, satisfaction score, and raving-fan status alongside the task's description, estimated and actual durations, status, and labor cost. For example, a row might show customer Stephanie Lawrence (satisfaction 4.45, raving fan) receiving task "Legacy Standard D" (estimated 42 hours, actual 41 hours, pending, $16.54). Another row might pair customer Allen Saunders (satisfaction 9.35, raving fan) with task "Seasonal Protocol" (estimated 62 hours, actual 55 hours, completed, $12.72). This view supports customer journey analysis: tracking the full history of tasks per customer and correlating task outcomes with satisfaction.

### Diagnostic Tool–Technician

**View `v_diagnostic_tool_technician`**

```sql
CREATE VIEW v_diagnostic_tool_technician AS
SELECT a.id, a.tool_id, a.tool_name, a.tool_type, b.id AS technician_id, b.technician_id AS technician_technician_id, b.first_name AS technician_first_name
FROM diagnostic_tools a JOIN technicians b ON a.technician_id = b.id;
```

| id | tool_id | tool_name | tool_type | technician_id | technician_technician_id | technician_first_name |
|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | hardware | 1000 | 611494 | Stephanie Collins |
| 2 | 195360 | Compact Cluster A | software | 1001 | 5006464 | Janice Johnston |
| 3 | 3355763 | Legacy Review | hardware | 1002 | 2404 | Upal Saha |
| 4 | 8387539 | Regional Initiative | software | 1003 | 1186102 | Katherine Snyder |

This view joins diagnostic tool and technician records to answer: which technician uses which diagnostic tool, and what are the tool's type and calibration details alongside the technician's skill level and rate? The joined result surfaces the tool's name, type, and last calibration date alongside the technician's name, skill level, and hourly rate. For example, a row might show tool "Composite Model" (hardware, calibrated 2025-12-01) used by technician Stephanie Collins (entry_level, $13.45/hour). Another row might pair tool "Legacy Review" (hardware, calibrated 2023-10-23) with technician Upal Saha (master, $22.35/hour). This view supports tool-technician pairing analysis: understanding whether certain tools are preferentially used by technicians of specific skill levels.

### Diagnostic Tool–Repair Task

**View `v_diagnostic_tool_repair_task`**

```sql
CREATE VIEW v_diagnostic_tool_repair_task AS
SELECT a.id, a.tool_id, a.tool_name, a.tool_type, b.task_id AS task_task_id, b.task_description AS task_task_description, b.estimated_duration AS task_estimated_duration
FROM diagnostic_tools a JOIN repair_tasks b ON a.task_id = b.task_id;
```

| id | tool_id | tool_name | tool_type | task_task_id | task_task_description | task_estimated_duration |
|---|---|---|---|---|---|---|
| 1 | comi | Composite Model | hardware | 7731870 | Legacy Standard D | 42 |
| 2 | 195360 | Compact Cluster A | software | id_28 | Regional Framework | 52 |
| 3 | 3355763 | Legacy Review | hardware | 7119763 | Seasonal Protocol | 62 |
| 4 | 8387539 | Regional Initiative | software | lu_tax_code_template_m82 | Integrated Programme A | 72 |

This view joins diagnostic tool and repair task records to answer: which diagnostic tool was used for each repair task, and what are the task's status and cost details alongside the tool's type and calibration date? The joined result surfaces the tool's name, type, and last calibration date alongside the task's description, status, and labor cost. For example, a row might show tool "Composite Model" (hardware, calibrated 2025-12-01) used for task "Legacy Standard D" (pending, $16.54). Another row might pair tool "Regional Initiative" (software, calibrated 2024-03-07) with task "Integrated Programme A" (failed, $33.06). This view supports tool-effectiveness analysis: understanding the relationship between tool type, calibration recency, and task outcomes.

### Synthesis

The auto repair shop domain is a tightly coupled system of shops, technicians, customers, tasks, and tools. Shops set production targets and track profitability; technicians bring skill levels and hourly rates to the work; customers bring satisfaction scores and loyalty flags; tasks measure efficiency through estimated versus actual durations; and diagnostic tools provide the technical capability for repair work. Junction tables mediate the many-to-many relationships that make the domain realistic: technicians work at multiple shops, customers receive tasks at multiple shops, and tools are assigned to specific tasks. The views synthesize these relationships into actionable detail—shop–technician pairings for staffing analysis, shop–customer pairings for experience analysis, task–tool pairings for utilization analysis, and customer–task pairings for journey analysis. Together, the tables and views form a complete operational picture of an auto repair service organization, capturing both the static entities and the dynamic relationships that drive daily operations.