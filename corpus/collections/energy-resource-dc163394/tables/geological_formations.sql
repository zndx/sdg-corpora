CREATE TABLE geological_formations (
  formation_id INTEGER NOT NULL,
  formation_name VARCHAR(32),
  formation_type VARCHAR(33),
  depth DECIMAL,
  temperature DECIMAL,
  location_region VARCHAR(32),
  energy_resource_id INTEGER,
  heat_transport_mechanism_id INTEGER,
  PRIMARY KEY (formation_id),
  FOREIGN KEY (energy_resource_id) REFERENCES energy_resources (id),
  FOREIGN KEY (heat_transport_mechanism_id) REFERENCES heat_transport_mechanisms (heat_transport_mechanism_id)
);
