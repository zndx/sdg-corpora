CREATE TABLE sites_centres (
  surveillance_site_id INTEGER NOT NULL,
  control_centre_id INTEGER NOT NULL,
  PRIMARY KEY (surveillance_site_id, control_centre_id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id),
  FOREIGN KEY (control_centre_id) REFERENCES control_centres (id)
);
