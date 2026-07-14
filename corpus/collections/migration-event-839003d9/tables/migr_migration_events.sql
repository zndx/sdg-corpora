CREATE TABLE migr_migration_events (
  migration_event_id INTEGER NOT NULL,
  event_identifier VARCHAR(32),
  arrival_date DATE,
  departure_country VARCHAR(32),
  destination_city VARCHAR(32),
  purpose_of_stay VARCHAR(32),
  is_transit BOOLEAN,
  city_id VARCHAR(44),
  PRIMARY KEY (migration_event_id),
  FOREIGN KEY (city_id) REFERENCES migr_cities (city_id)
);
