CREATE TABLE warning_channels (
  warning_channel_id INTEGER NOT NULL,
  channel_identifier VARCHAR(32),
  channel_name VARCHAR(32),
  channel_type VARCHAR(32),
  power_dependency BOOLEAN,
  coverage_area VARCHAR(32),
  is_reliable_during_outage BOOLEAN,
  evacuation_order_id INTEGER,
  household_id INTEGER,
  PRIMARY KEY (warning_channel_id),
  FOREIGN KEY (evacuation_order_id) REFERENCES evacuation_orders (id),
  FOREIGN KEY (household_id) REFERENCES households (id)
);
