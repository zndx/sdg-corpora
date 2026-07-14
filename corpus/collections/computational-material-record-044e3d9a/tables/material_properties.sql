CREATE TABLE material_properties (
  id INTEGER NOT NULL,
  property_id INTEGER,
  property_name VARCHAR(32),
  numeric_value DECIMAL,
  unit_of_measure VARCHAR(32),
  confidence_interval DECIMAL,
  measurement_method VARCHAR(32),
  material_system_id INTEGER,
  computational_material_record_id INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id),
  FOREIGN KEY (material_system_id) REFERENCES material_systems (id),
  FOREIGN KEY (computational_material_record_id) REFERENCES computational_material_records (computational_material_record_id)
);
