CREATE TABLE centres_links (
  control_centre_id INTEGER NOT NULL,
  network_link_id INTEGER NOT NULL,
  PRIMARY KEY (control_centre_id, network_link_id),
  FOREIGN KEY (control_centre_id) REFERENCES control_centres (id),
  FOREIGN KEY (network_link_id) REFERENCES network_links (id)
);
