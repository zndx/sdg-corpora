CREATE TABLE agencies_lists (
  agency_id VARCHAR(39) NOT NULL,
  sanctions_list_id INTEGER NOT NULL,
  PRIMARY KEY (agency_id, sanctions_list_id),
  FOREIGN KEY (agency_id) REFERENCES regulatory_agencies (agency_id),
  FOREIGN KEY (sanctions_list_id) REFERENCES sanctions_lists (sanctions_list_id)
);
