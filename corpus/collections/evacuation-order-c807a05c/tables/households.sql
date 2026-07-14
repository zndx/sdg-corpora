CREATE TABLE households (
  id INTEGER NOT NULL,
  household_identifier VARCHAR(32),
  vehicle_count INTEGER,
  has_transportation_arrangement BOOLEAN,
  disaster_kit_ready BOOLEAN,
  evacuation_status VARCHAR(32),
  fuel_level_percent DECIMAL,
  property_id INTEGER,
  shelter_id INTEGER,
  warning_channel_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (property_id) REFERENCES properties (id),
  FOREIGN KEY (shelter_id) REFERENCES shelters (id),
  FOREIGN KEY (warning_channel_id) REFERENCES warning_channels (warning_channel_id)
);
