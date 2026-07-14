CREATE TABLE energy_appliances (
  id INTEGER NOT NULL,
  appliance_id VARCHAR(32),
  appliance_type VARCHAR(32),
  rated_power_watts DECIMAL,
  energy_star_rating INTEGER,
  purchase_date DATE,
  operational_status VARCHAR(32),
  household_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (household_id) REFERENCES households (id)
);
