CREATE TABLE groups_officers (
  special_interest_group_id INTEGER NOT NULL,
  officer_id INTEGER NOT NULL,
  PRIMARY KEY (special_interest_group_id, officer_id),
  FOREIGN KEY (special_interest_group_id) REFERENCES special_interest_groups (id),
  FOREIGN KEY (officer_id) REFERENCES officers (id)
);
