CREATE TABLE development_projects (
  development_project_id INTEGER NOT NULL,
  project_id VARCHAR(44),
  project_name VARCHAR(32),
  total_units INTEGER,
  total_floors INTEGER,
  estimated_cost DECIMAL,
  start_date DATE,
  land_parcel_id INTEGER,
  PRIMARY KEY (development_project_id),
  FOREIGN KEY (land_parcel_id) REFERENCES land_parcels (id)
);
