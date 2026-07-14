CREATE TABLE centers_entries (
  network_information_center_id INTEGER NOT NULL,
  directory_entry_id INTEGER NOT NULL,
  PRIMARY KEY (network_information_center_id, directory_entry_id),
  FOREIGN KEY (network_information_center_id) REFERENCES network_information_centers (id),
  FOREIGN KEY (directory_entry_id) REFERENCES directory_entries (id)
);
