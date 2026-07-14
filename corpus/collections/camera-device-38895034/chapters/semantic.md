Astrophotography captures the intersection of mechanical precision and celestial ambition. A photographer selects a camera body, mounts a lens, inserts a memory card, and points the assembly at a target in the night sky. Each decision leaves a trace: the sensor type, the focal length, the exposure settings, the timestamp, the celestial coordinates. The domain model captures this workflow as a collection of normalized base tables and a set of materialized views that reconstruct the domain facts from the relational fragments. The six base tables—`camera_devices`, `camera_lenses`, `memory_cards`, `image_captures`, `celestial_objects`, and `exposure_triangles`—store atomic entities and their attributes. The nine views—prefixed with `vw_`—join these tables back together so that a single query can answer questions like "which lens was paired with which camera body?" or "what exposure triangle produced this particular image capture?"

## Base Tables and Entity Types

The foundation of the schema is the `camera_devices` table, which stores the physical camera bodies used in the astrophotography workflow. Each row is identified by a surrogate `camera_device_id` and carries a human-readable `device_identifier` such as `DEV-2372`. The table records the `manufacturer` (for example, "Standard Chartered" or "General Motors"), the `model_number` (e.g., `MOD-2238`), the `sensor_type` (values like `primary-sensor-58` or `adaptive-sensor-59`), the `megapixels` resolution (ranging from 11.95 to 23.80), the `lens_mount_type` (such as `compact-lens-92` or `composite-lens-93`), and a boolean `is_mirrorless` flag. Two of the four sample devices are mirrorless (`DEV-2378` and `DEV-2390`), while the other two are not. The table also holds two foreign keys: `camera_lens_id` and `memory_card_id`, which point into the `camera_lenses` and `memory_cards` tables respectively, establishing a one-to-one association between a camera body and its paired lens and memory card at the time of capture.

**Table `camera_devices`**

| camera_device_id | device_identifier | manufacturer | model_number | sensor_type | megapixels | lens_mount_type | is_mirrorless | camera_lens_id | memory_card_id |
|---|---|---|---|---|---|---|---|---|---|
| 1 | DEV-2372 | Standard Chartered | MOD-2238 | primary-sensor-58 | 11.95 | compact-lens-92 | false | 1000 | 100 |
| 2 | DEV-2378 | General Motors | MOD-2244 | adaptive-sensor-59 | 15.90 | composite-lens-93 | true | 1001 | 101 |
| 3 | DEV-2384 | Column Name cannot be empty | MOD-2250 | distributed-sensor-60 | 19.85 | primary-lens-94 | false | 1002 | 102 |
| 4 | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 | baseline-sensor-61 | 23.80 | adaptive-lens-95 | true | 1003 | 103 |

The `camera_lenses` table stores the optical instruments mounted on the camera bodies. Its primary key is `id`, which in the sample data takes values 1000 through 1003. Each lens row carries a `lens_identifier` (e.g., `LEN-2269`), a `manufacturer`, a `model_number`, a numeric `focal_length` (values such as 0.68 or 0.29376482), a `max_aperture` (ranging from 18.70 to 26.80), a `mount_compatibility` string (e.g., `integrated-mount-34`), and a boolean `is_prime` flag indicating whether the lens is a prime lens. The foreign key `camera_device_id` links each lens back to the `camera_devices` table, creating a bidirectional relationship: the `camera_devices` table references `camera_lenses` via `camera_lens_id`, and `camera_lenses` references `camera_devices` via `camera_device_id`. In the sample data, lens `LEN-2269` (a prime lens with focal length 0.68 and max aperture 18.70) is paired with camera device `DEV-2372`.

**Table `camera_lenses`**

| id | lens_identifier | manufacturer | model_number | focal_length | max_aperture | mount_compatibility | is_prime | camera_device_id |
|---|---|---|---|---|---|---|---|---|
| 1000 | LEN-2269 | Standard Chartered | MOD-2238 | 0.68 | 18.70 | integrated-mount-34 | true | 1 |
| 1001 | LEN-2272 | General Motors | MOD-2244 | 0.29376482 | 21.40 | seasonal-mount-35 | false | 2 |
| 1002 | LEN-2275 | Column Name cannot be empty | MOD-2250 | 0.6 | 24.10 | regional-mount-36 | true | 3 |
| 1003 | LEN-2278 | Financial Information Service Co. Ltd. | MOD-2256 | 0.6000001 | 26.80 | legacy-mount-37 | false | 4 |

The `memory_cards` table stores the removable storage media used by the camera bodies. Its primary key is `id`, with sample values 100, 101, 102, and 103. Each row carries a `card_identifier` (e.g., `CAR-2285`), a `manufacturer`, a `model_number`, a numeric `storage_capacity` (from 4.45 to 14.80), a `write_speed` (ranging from 0.86331 to 226.0), a `file_system_format` (such as `pilot-file-14` or `extended-file-15`), and a boolean `is_formatted` flag. The foreign key `camera_device_id` links each memory card to the `camera_devices` table, mirroring the lens relationship: the `camera_devices` table references `memory_cards` via `memory_card_id`, and `memory_cards` references `camera_devices` via `camera_device_id`. In the sample data, memory card `CAR-2285` with a storage capacity of 4.45 and write speed of 0.86331 is paired with camera device `DEV-2372`.

**Table `memory_cards`**

| id | card_identifier | manufacturer | model_number | storage_capacity | write_speed | file_system_format | is_formatted | camera_device_id |
|---|---|---|---|---|---|---|---|---|
| 100 | CAR-2285 | Standard Chartered | MOD-2238 | 4.45 | 0.86331 | pilot-file-14 | false | 1 |
| 101 | CAR-2287 | General Motors | MOD-2244 | 7.90 | 41.0 | extended-file-15 | true | 2 |
| 102 | CAR-2289 | Column Name cannot be empty | MOD-2250 | 11.35 | 226.0 | integrated-file-16 | false | 3 |
| 103 | CAR-2291 | Financial Information Service Co. Ltd. | MOD-2256 | 14.80 | 0.98 | seasonal-file-17 | true | 4 |

The `image_captures` table is the central fact table of the schema, recording each individual photograph taken. Its primary key is `image_capture_id`, with sample values 1 through 4. Each row carries a `capture_identifier` (e.g., `CAP-2684`), a `timestamp` (such as `2024-07-08T18:18:00`), and a rich set of exposure parameters: `shutter_speed` (e.g., 1.25 or 0.2866154649074), `aperture_value` (ranging from 16.45 to 23.80), `iso_setting` (values 8, 16, 24, 32), `exposure_mode` (e.g., `integrated-exposure-94`), `white_balance` (e.g., `regional-white-66`), `metering_mode` (e.g., `legacy-metering-97`), `focus_mode` (e.g., `seasonal-focus-89`), and `file_format` (e.g., `pilot-file-44`). The table holds three foreign keys: `camera_device_id` references `camera_devices`, `memory_card_id` references `memory_cards`, and `celestial_object_id` references `celestial_objects`. This triple foreign-key structure means that every image capture is anchored to a specific camera body, a specific memory card, and a specific celestial target. For example, capture `CAP-2684` was taken at `2024-07-08T18:18:00` with shutter speed 1.25, aperture 16.45, and ISO 8, using camera device `DEV-2372`, memory card `CAR-2285`, and targeting celestial object `OBJ-2556`.

**Table `image_captures`**

| image_capture_id | capture_identifier | timestamp | shutter_speed | aperture_value | iso_setting | exposure_mode | white_balance | metering_mode | focus_mode | file_format | camera_device_id | memory_card_id | celestial_object_id |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 1 | CAP-2684 | 2024-07-08T18:18:00 | 1.25 | 16.45 | 8 | integrated-exposure-94 | regional-white-66 | legacy-metering-97 | seasonal-focus-89 | pilot-file-44 | 1 | 100 | 1000 |
| 2 | CAP-2687 | 2025-12-19T01:35:00 | 0.2866154649074 | 18.90 | 16 | seasonal-exposure-95 | legacy-white-67 | compact-metering-98 | regional-focus-90 | extended-file-45 | 2 | 101 | 1001 |
| 3 | CAP-2690 | 2022-05-03T08:52:00 | 0.47 | 21.35 | 24 | regional-exposure-96 | compact-white-68 | composite-metering-99 | legacy-focus-91 | integrated-file-46 | 3 | 102 | 1002 |
| 4 | CAP-2693 | 2023-10-14T15:09:00 | 0.6 | 23.80 | 32 | legacy-exposure-97 | composite-white-69 | primary-metering-100 | compact-focus-92 | seasonal-file-47 | 4 | 103 | 1003 |

The `celestial_objects` table stores the astronomical targets observed in the astrophotography sessions. Its primary key is `celestial_object_id`, with sample values 1000 through 1003. Each row carries an `object_identifier` (e.g., `OBJ-2556`), a `common_name` (such as "Seasonal Review" or "Pilot Cluster"), a `catalog_designation` (e.g., `integrated-catalog-70`), an `object_type` (values like `adaptive-object-71` or `pilot-object-74`), a `constellation` (e.g., `legacy-constell-61`), and two numeric coordinate fields: `right_ascension` (ranging from 19.20 to 28.80) and `declination` (ranging from 7.20 to 13.80). The `apparent_magnitude` field records the brightness of the object (values from 21.70 to 32.80). The foreign key `image_capture_id` links each celestial object back to the `image_captures` table, creating a bidirectional relationship: `image_captures` references `celestial_objects` via `celestial_object_id`, and `celestial_objects` references `image_captures` via `image_capture_id`. In the sample data, celestial object `OBJ-2556` (commonly named "Seasonal Review", located in constellation `legacy-constell-61` with right ascension 19.20 and declination 7.20) was imaged by capture `CAP-2684`.

**Table `celestial_objects`**

| celestial_object_id | object_identifier | common_name | catalog_designation | object_type | constellation | right_ascension | declination | apparent_magnitude | image_capture_id |
|---|---|---|---|---|---|---|---|---|---|
| 1000 | OBJ-2556 | Seasonal Review | integrated-catalog-70 | adaptive-object-71 | legacy-constell-61 | 19.20 | 7.20 | 21.70 | 1 |
| 1001 | OBJ-2563 | Integrated Initiative | seasonal-catalog-71 | distributed-object-72 | compact-constell-62 | 22.40 | 9.40 | 25.40 | 2 |
| 1002 | OBJ-2570 | Extended Model D | regional-catalog-72 | baseline-object-73 | composite-constell-63 | 25.60 | 11.60 | 29.10 | 3 |
| 1003 | OBJ-2577 | Pilot Cluster | legacy-catalog-73 | pilot-object-74 | primary-constell-64 | 28.80 | 13.80 | 32.80 | 4 |

The `exposure_triangles` table stores the computed exposure triangle for each image capture, recording the relationship between shutter speed, aperture, and ISO. Its primary key is `exposure_triangle_id`, with sample values 1 through 4. Each row carries a `triangle_identifier` (e.g., `TRI-2171`), the `shutter_speed`, `aperture_value`, and `iso_setting` (which duplicate the corresponding columns in `image_captures` for analytical convenience), a computed `exposure_value` (ranging from 6.95 to 15.80), and a boolean `is_balanced` flag indicating whether the exposure triangle is well-balanced. The foreign key `image_capture_id` links each exposure triangle back to the `image_captures` table, creating a bidirectional relationship: `image_captures` is the parent, and `exposure_triangles` is the child. In the sample data, exposure triangle `TRI-2171` has shutter speed 1.25, aperture 16.45, ISO 8, and an exposure value of 6.95, and it is marked as balanced.

**Table `exposure_triangles`**

| exposure_triangle_id | triangle_identifier | shutter_speed | aperture_value | iso_setting | exposure_value | is_balanced | image_capture_id |
|---|---|---|---|---|---|---|---|
| 1 | TRI-2171 | 1.25 | 16.45 | 8 | 6.95 | true | 1 |
| 2 | TRI-2177 | 0.2866154649074 | 18.90 | 16 | 9.90 | false | 2 |
| 3 | TRI-2183 | 0.47 | 21.35 | 24 | 12.85 | true | 3 |
| 4 | TRI-2189 | 0.6 | 23.80 | 32 | 15.80 | false | 4 |

## Materialized Views and Reconstructed Facts

The base tables are normalized to eliminate redundancy, but domain questions require joining them back together. The nine views materialize these joins as reusable query definitions.

The view `vw_camera_device_camera_lens` joins `camera_devices` and `camera_lenses` on the mutual foreign-key relationship. It answers the question: "Given a camera body, what lens is paired with it, and what are the combined specifications?" In the sample data, the view would produce a row showing camera device `DEV-2372` (manufacturer "Standard Chartered", sensor type `primary-sensor-58`, 11.95 megapixels) paired with lens `LEN-2269` (focal length 0.68, max aperture 18.70, prime lens). The join is symmetric: the view can also be read from the lens side, showing that lens `LEN-2269` is mounted on camera device `DEV-2372`.

**View `vw_camera_device_camera_lens`**

```sql
CREATE VIEW vw_camera_device_camera_lens AS
SELECT a.camera_device_id, a.device_identifier, a.manufacturer, a.model_number, b.id AS lens_id, b.lens_identifier AS lens_lens_identifier, b.manufacturer AS lens_manufacturer
FROM camera_devices a JOIN camera_lenses b ON a.camera_lens_id = b.id;
```

| camera_device_id | device_identifier | manufacturer | model_number | lens_id | lens_lens_identifier | lens_manufacturer |
|---|---|---|---|---|---|---|
| 1 | DEV-2372 | Standard Chartered | MOD-2238 | 1000 | LEN-2269 | Standard Chartered |
| 2 | DEV-2378 | General Motors | MOD-2244 | 1001 | LEN-2272 | General Motors |
| 3 | DEV-2384 | Column Name cannot be empty | MOD-2250 | 1002 | LEN-2275 | Column Name cannot be empty |
| 4 | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 | 1003 | LEN-2278 | Financial Information Service Co. Ltd. |

The view `vw_camera_device_memory_card` joins `camera_devices` and `memory_cards` on their mutual foreign-key relationship. It answers: "Which memory card is inserted in a given camera body, and what are its storage and speed characteristics?" In the sample data, the view would show camera device `DEV-2372` paired with memory card `CAR-2285` (storage capacity 4.45, write speed 0.86331, file system format `pilot-file-14`, not formatted). This view is useful for auditing storage configurations across the camera fleet.

**View `vw_camera_device_memory_card`**

```sql
CREATE VIEW vw_camera_device_memory_card AS
SELECT a.camera_device_id, a.device_identifier, a.manufacturer, a.model_number, b.id AS card_id, b.card_identifier AS card_card_identifier, b.manufacturer AS card_manufacturer
FROM camera_devices a JOIN memory_cards b ON a.memory_card_id = b.id;
```

| camera_device_id | device_identifier | manufacturer | model_number | card_id | card_card_identifier | card_manufacturer |
|---|---|---|---|---|---|---|
| 1 | DEV-2372 | Standard Chartered | MOD-2238 | 100 | CAR-2285 | Standard Chartered |
| 2 | DEV-2378 | General Motors | MOD-2244 | 101 | CAR-2287 | General Motors |
| 3 | DEV-2384 | Column Name cannot be empty | MOD-2250 | 102 | CAR-2289 | Column Name cannot be empty |
| 4 | DEV-2390 | Financial Information Service Co. Ltd. | MOD-2256 | 103 | CAR-2291 | Financial Information Service Co. Ltd. |

The view `vw_camera_lens_camera_device` is the inverse of `vw_camera_device_camera_lens`, joining from the lens side. It answers: "Given a lens, which camera body is it mounted on?" In the sample data, the view would show lens `LEN-2269` (manufacturer "Standard Chartered", focal length 0.68, prime lens) mounted on camera device `DEV-2372` (sensor type `primary-sensor-58`, 11.95 megapixels, not mirrorless). This perspective is useful when planning lens compatibility across a collection of camera bodies.

**View `vw_camera_lens_camera_device`**

```sql
CREATE VIEW vw_camera_lens_camera_device AS
SELECT a.id, a.lens_identifier, a.manufacturer, a.model_number, b.camera_device_id AS device_camera_device_id, b.device_identifier AS device_device_identifier, b.manufacturer AS device_manufacturer
FROM camera_lenses a JOIN camera_devices b ON a.camera_device_id = b.camera_device_id;
```

| id | lens_identifier | manufacturer | model_number | device_camera_device_id | device_device_identifier | device_manufacturer |
|---|---|---|---|---|---|---|
| 1000 | LEN-2269 | Standard Chartered | MOD-2238 | 1 | DEV-2372 | Standard Chartered |
| 1001 | LEN-2272 | General Motors | MOD-2244 | 2 | DEV-2378 | General Motors |
| 1002 | LEN-2275 | Column Name cannot be empty | MOD-2250 | 3 | DEV-2384 | Column Name cannot be empty |
| 1003 | LEN-2278 | Financial Information Service Co. Ltd. | MOD-2256 | 4 | DEV-2390 | Financial Information Service Co. Ltd. |

The view `vw_memory_card_camera_device` is the inverse of `vw_camera_device_memory_card`, joining from the memory card side. It answers: "Given a memory card, which camera body uses it?" In the sample data, the view would show memory card `CAR-2285` (storage capacity 4.45, write speed 0.86331, file system format `pilot-file-14`) used by camera device `DEV-2372` (manufacturer "Standard Chartered", sensor type `primary-sensor-58`). This view supports inventory management by tracing storage media back to their host devices.

**View `vw_memory_card_camera_device`**

```sql
CREATE VIEW vw_memory_card_camera_device AS
SELECT a.id, a.card_identifier, a.manufacturer, a.model_number, b.camera_device_id AS device_camera_device_id, b.device_identifier AS device_device_identifier, b.manufacturer AS device_manufacturer
FROM memory_cards a JOIN camera_devices b ON a.camera_device_id = b.camera_device_id;
```

| id | card_identifier | manufacturer | model_number | device_camera_device_id | device_device_identifier | device_manufacturer |
|---|---|---|---|---|---|---|
| 100 | CAR-2285 | Standard Chartered | MOD-2238 | 1 | DEV-2372 | Standard Chartered |
| 101 | CAR-2287 | General Motors | MOD-2244 | 2 | DEV-2378 | General Motors |
| 102 | CAR-2289 | Column Name cannot be empty | MOD-2250 | 3 | DEV-2384 | Column Name cannot be empty |
| 103 | CAR-2291 | Financial Information Service Co. Ltd. | MOD-2256 | 4 | DEV-2390 | Financial Information Service Co. Ltd. |

The view `vw_image_capture_camera_device` joins `image_captures` and `camera_devices` on the `camera_device_id` foreign key. It answers: "For a given image capture, which camera body was used, and what were the capture settings?" In the sample data, the view would produce a row showing capture `CAP-2684` (timestamp `2024-07-08T18:18:00`, shutter speed 1.25, aperture 16.45, ISO 8, exposure mode `integrated-exposure-94`) taken with camera device `DEV-2372` (manufacturer "Standard Chartered", sensor type `primary-sensor-58`, 11.95 megapixels, not mirrorless). This view is the primary diagnostic tool for correlating image quality with hardware specifications.

**View `vw_image_capture_camera_device`**

```sql
CREATE VIEW vw_image_capture_camera_device AS
SELECT a.image_capture_id, a.capture_identifier, a.timestamp, a.shutter_speed, b.camera_device_id AS device_camera_device_id, b.device_identifier AS device_device_identifier, b.manufacturer AS device_manufacturer
FROM image_captures a JOIN camera_devices b ON a.camera_device_id = b.camera_device_id;
```

| image_capture_id | capture_identifier | timestamp | shutter_speed | device_camera_device_id | device_device_identifier | device_manufacturer |
|---|---|---|---|---|---|---|
| 1 | CAP-2684 | 2024-07-08T18:18:00 | 1.25 | 1 | DEV-2372 | Standard Chartered |
| 2 | CAP-2687 | 2025-12-19T01:35:00 | 0.2866154649074 | 2 | DEV-2378 | General Motors |
| 3 | CAP-2690 | 2022-05-03T08:52:00 | 0.47 | 3 | DEV-2384 | Column Name cannot be empty |
| 4 | CAP-2693 | 2023-10-14T15:09:00 | 0.6 | 4 | DEV-2390 | Financial Information Service Co. Ltd. |

The view `vw_image_capture_memory_card` joins `image_captures` and `memory_cards` on the `memory_card_id` foreign key. It answers: "For a given image capture, which memory card stored the file, and what were its characteristics?" In the sample data, the view would show capture `CAP-2684` (timestamp `2024-07-08T18:18:00`, file format `pilot-file-44`) stored on memory card `CAR-2285` (storage capacity 4.45, write speed 0.86331, file system format `pilot-file-14`, not formatted). This view is useful for diagnosing storage-related issues such as write-speed bottlenecks or file-system incompatibilities.

**View `vw_image_capture_memory_card`**

```sql
CREATE VIEW vw_image_capture_memory_card AS
SELECT a.image_capture_id, a.capture_identifier, a.timestamp, a.shutter_speed, b.id AS card_id, b.card_identifier AS card_card_identifier, b.manufacturer AS card_manufacturer
FROM image_captures a JOIN memory_cards b ON a.memory_card_id = b.id;
```

| image_capture_id | capture_identifier | timestamp | shutter_speed | card_id | card_card_identifier | card_manufacturer |
|---|---|---|---|---|---|---|
| 1 | CAP-2684 | 2024-07-08T18:18:00 | 1.25 | 100 | CAR-2285 | Standard Chartered |
| 2 | CAP-2687 | 2025-12-19T01:35:00 | 0.2866154649074 | 101 | CAR-2287 | General Motors |
| 3 | CAP-2690 | 2022-05-03T08:52:00 | 0.47 | 102 | CAR-2289 | Column Name cannot be empty |
| 4 | CAP-2693 | 2023-10-14T15:09:00 | 0.6 | 103 | CAR-2291 | Financial Information Service Co. Ltd. |

The view `vw_image_capture_celestial_object` joins `image_captures` and `celestial_objects` on the `celestial_object_id` foreign key. It answers: "For a given image capture, what celestial object was the target, and what are its astronomical coordinates?" In the sample data, the view would produce a row showing capture `CAP-2684` (timestamp `2024-07-08T18:18:00`, shutter speed 1.25, aperture 16.45, ISO 8) targeting celestial object `OBJ-2556` (common name "Seasonal Review", catalog designation `integrated-catalog-70`, object type `adaptive-object-71`, constellation `legacy-constell-61`, right ascension 19.20, declination 7.20, apparent magnitude 21.70). This view is the primary tool for astronomical analysis, linking photographic parameters to the properties of the observed target.

**View `vw_image_capture_celestial_object`**

```sql
CREATE VIEW vw_image_capture_celestial_object AS
SELECT a.image_capture_id, a.capture_identifier, a.timestamp, a.shutter_speed, b.celestial_object_id AS object_celestial_object_id, b.object_identifier AS object_object_identifier, b.common_name AS object_common_name
FROM image_captures a JOIN celestial_objects b ON a.celestial_object_id = b.celestial_object_id;
```

| image_capture_id | capture_identifier | timestamp | shutter_speed | object_celestial_object_id | object_object_identifier | object_common_name |
|---|---|---|---|---|---|---|
| 1 | CAP-2684 | 2024-07-08T18:18:00 | 1.25 | 1000 | OBJ-2556 | Seasonal Review |
| 2 | CAP-2687 | 2025-12-19T01:35:00 | 0.2866154649074 | 1001 | OBJ-2563 | Integrated Initiative |
| 3 | CAP-2690 | 2022-05-03T08:52:00 | 0.47 | 1002 | OBJ-2570 | Extended Model D |
| 4 | CAP-2693 | 2023-10-14T15:09:00 | 0.6 | 1003 | OBJ-2577 | Pilot Cluster |

The view `vw_celestial_object_image_capture` is the inverse of `vw_image_capture_celestial_object`, joining from the celestial object side. It answers: "Given a celestial object, what image captures were taken of it, and what were the capture settings?" In the sample data, the view would show celestial object `OBJ-2556` (common name "Seasonal Review", object type `adaptive-object-71`, constellation `legacy-constell-61`, right ascension 19.20, declination 7.20, apparent magnitude 21.70) imaged by capture `CAP-2684` (timestamp `2024-07-08T18:18:00`, shutter speed 1.25, aperture 16.45, ISO 8, exposure mode `integrated-exposure-94`). This view supports observational planning by revealing which targets have been photographed and under what conditions.

**View `vw_celestial_object_image_capture`**

```sql
CREATE VIEW vw_celestial_object_image_capture AS
SELECT a.celestial_object_id, a.object_identifier, a.common_name, a.catalog_designation, b.image_capture_id AS capture_image_capture_id, b.capture_identifier AS capture_capture_identifier, b.timestamp AS capture_timestamp
FROM celestial_objects a JOIN image_captures b ON a.image_capture_id = b.image_capture_id;
```

| celestial_object_id | object_identifier | common_name | catalog_designation | capture_image_capture_id | capture_capture_identifier | capture_timestamp |
|---|---|---|---|---|---|---|
| 1000 | OBJ-2556 | Seasonal Review | integrated-catalog-70 | 1 | CAP-2684 | 2024-07-08T18:18:00 |
| 1001 | OBJ-2563 | Integrated Initiative | seasonal-catalog-71 | 2 | CAP-2687 | 2025-12-19T01:35:00 |
| 1002 | OBJ-2570 | Extended Model D | regional-catalog-72 | 3 | CAP-2690 | 2022-05-03T08:52:00 |
| 1003 | OBJ-2577 | Pilot Cluster | legacy-catalog-73 | 4 | CAP-2693 | 2023-10-14T15:09:00 |

The view `vw_exposure_triangle_image_capture` joins `exposure_triangles` and `image_captures` on the `image_capture_id` foreign key. It answers: "For a given image capture, what was the computed exposure triangle, and was it balanced?" In the sample data, the view would produce a row showing capture `CAP-2684` (timestamp `2024-07-08T18:18:00`, shutter speed 1.25, aperture 16.45, ISO 8, exposure mode `integrated-exposure-94`) with exposure triangle `TRI-2171` (shutter speed 1.25, aperture 16.45, ISO 8, exposure value 6.95, balanced). The duplication of shutter speed, aperture, and ISO across both tables is intentional: the `exposure_triangles` table stores the computed exposure value and balance flag as derived attributes, while the `image_captures` table stores the raw settings as recorded by the camera. This view enables analysis of exposure quality by correlating the balance flag with the photographic outcome.

**View `vw_exposure_triangle_image_capture`**

```sql
CREATE VIEW vw_exposure_triangle_image_capture AS
SELECT a.exposure_triangle_id, a.triangle_identifier, a.shutter_speed, a.aperture_value, b.image_capture_id AS capture_image_capture_id, b.capture_identifier AS capture_capture_identifier, b.timestamp AS capture_timestamp
FROM exposure_triangles a JOIN image_captures b ON a.image_capture_id = b.image_capture_id;
```

| exposure_triangle_id | triangle_identifier | shutter_speed | aperture_value | capture_image_capture_id | capture_capture_identifier | capture_timestamp |
|---|---|---|---|---|---|---|
| 1 | TRI-2171 | 1.25 | 16.45 | 1 | CAP-2684 | 2024-07-08T18:18:00 |
| 2 | TRI-2177 | 0.2866154649074 | 18.90 | 2 | CAP-2687 | 2025-12-19T01:35:00 |
| 3 | TRI-2183 | 0.47 | 21.35 | 3 | CAP-2690 | 2022-05-03T08:52:00 |
| 4 | TRI-2189 | 0.6 | 23.80 | 4 | CAP-2693 | 2023-10-14T15:09:00 |

## Synthesis

The schema models astrophotography as a network of six entity types connected by foreign keys that encode the physical and observational relationships between them. Camera bodies (`camera_devices`) are paired one-to-one with lenses (`camera_lenses`) and memory cards (`memory_cards`), forming a hardware triad. Image captures (`image_captures`) sit at the center of the model, referencing the camera body, the memory card, and the celestial target, thereby anchoring every photograph to its complete context. Celestial objects (`celestial_objects`) and exposure triangles (`exposure_triangles`) are the dependent entities, each linked back to an image capture. The nine views reconstruct the domain facts by joining these normalized tables, providing both forward and inverse perspectives on every relationship. Together, the base tables and views form a complete, queryable representation of the astrophotography workflow—from hardware selection through exposure calculation to celestial observation.