CREATE TABLE ecological_resources (
  id INTEGER NOT NULL,
  resource_id INTEGER,
  resource_name VARCHAR(32),
  resource_type VARCHAR(32),
  affected_status VARCHAR(32),
  species_list VARCHAR(32),
  commercial_use BOOLEAN,
  geographic_location_id INTEGER,
  spill_incident_id INTEGER,
  hazardous_material_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (geographic_location_id) REFERENCES geographic_locations (id),
  FOREIGN KEY (spill_incident_id) REFERENCES spill_incidents (id),
  FOREIGN KEY (hazardous_material_id) REFERENCES hazardous_materials (id)
);
