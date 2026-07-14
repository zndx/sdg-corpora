CREATE TABLE data_centers (
  id INTEGER NOT NULL,
  location VARCHAR(32),
  power_supply_reliability VARCHAR(32),
  guarding_schedule VARCHAR(32),
  access_control_level VARCHAR(32),
  hosts_national_interconnect BOOLEAN,
  latency_reduction_strategy VARCHAR(32),
  PRIMARY KEY (id)
);
