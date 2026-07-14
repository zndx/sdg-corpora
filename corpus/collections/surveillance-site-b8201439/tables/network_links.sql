CREATE TABLE network_links (
  id INTEGER NOT NULL,
  link_identifier VARCHAR(61),
  link_type VARCHAR(32),
  bandwidth DECIMAL,
  latency DECIMAL,
  is_redundant BOOLEAN,
  protocol VARCHAR(32),
  surveillance_site_id INTEGER,
  control_centre_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id),
  FOREIGN KEY (control_centre_id) REFERENCES control_centres (id)
);
