CREATE TABLE states (
  id INTEGER NOT NULL,
  state_code INTEGER,
  state_name VARCHAR(32),
  government_type VARCHAR(32),
  hrc_membership_status VARCHAR(32),
  last_review_date TIMESTAMP,
  u_p_r_review_cycle_id INTEGER,
  vulnerable_group_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (u_p_r_review_cycle_id) REFERENCES u_p_r_review_cycles (id),
  FOREIGN KEY (vulnerable_group_id) REFERENCES vulnerable_groups (id)
);
