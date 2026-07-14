CREATE TABLE units_deliveries (
  family_unit_id INTEGER NOT NULL,
  delivery_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (family_unit_id, delivery_id),
  FOREIGN KEY (family_unit_id) REFERENCES family_units (family_unit_id),
  FOREIGN KEY (delivery_id) REFERENCES service_deliveries (delivery_id)
);
