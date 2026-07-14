CREATE TABLE sites_links (
  surveillance_site_id INTEGER NOT NULL,
  network_link_id INTEGER NOT NULL,
  PRIMARY KEY (surveillance_site_id, network_link_id),
  FOREIGN KEY (surveillance_site_id) REFERENCES surveillance_sites (surveillance_site_id),
  FOREIGN KEY (network_link_id) REFERENCES network_links (id)
);
