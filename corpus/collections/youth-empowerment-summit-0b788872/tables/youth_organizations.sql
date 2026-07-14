CREATE TABLE youth_organizations (
  org_id VARCHAR(32) NOT NULL,
  org_name VARCHAR(32),
  headquarters_city VARCHAR(32),
  headquarters_state VARCHAR(32),
  operating_model VARCHAR(32),
  youth_board_proportion DECIMAL,
  youth_empowerment_summit_id INTEGER,
  PRIMARY KEY (org_id),
  FOREIGN KEY (youth_empowerment_summit_id) REFERENCES youth_empowerment_summits (youth_empowerment_summit_id)
);
