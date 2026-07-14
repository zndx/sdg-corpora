CREATE TABLE centres_sites (
  control_centre_id INTEGER NOT NULL,
  surveillance_site_id INTEGER NOT NULL,
  PRIMARY KEY (control_centre_id, surveillance_site_id),
  FOREIGN KEY (control_centre_id) REFERENCES control_centres (id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id)
);
