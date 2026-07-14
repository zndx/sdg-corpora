CREATE TABLE incidents_materials (
  spill_incident_id INTEGER NOT NULL,
  hazardous_material_id INTEGER NOT NULL,
  PRIMARY KEY (spill_incident_id, hazardous_material_id),
  FOREIGN KEY (spill_incident_id) REFERENCES spill_incidents (id),
  FOREIGN KEY (hazardous_material_id) REFERENCES hazardous_materials (id)
);
