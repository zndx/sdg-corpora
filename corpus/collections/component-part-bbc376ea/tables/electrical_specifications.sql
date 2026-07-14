CREATE TABLE electrical_specifications (
  electrical_specification_id INTEGER NOT NULL,
  test_ambient_temperature DECIMAL,
  test_condition_description VARCHAR(32),
  blocking_voltage_rating DECIMAL,
  dc_on_state_current DECIMAL,
  repetitive_peak_on_state_current DECIMAL,
  peak_surge_current DECIMAL,
  peak_gate_current DECIMAL,
  average_gate_current DECIMAL,
  reverse_gate_voltage DECIMAL,
  junction_temperature_range VARCHAR(32),
  component_part_id INTEGER,
  PRIMARY KEY (electrical_specification_id),
  FOREIGN KEY (component_part_id) REFERENCES component_parts (id)
);
