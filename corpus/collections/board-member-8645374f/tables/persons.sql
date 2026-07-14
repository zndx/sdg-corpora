CREATE TABLE persons (
  id INTEGER NOT NULL,
  person_id VARCHAR(32),
  first_name VARCHAR(32),
  last_name VARCHAR(32),
  professional_title VARCHAR(32),
  years_of_experience INTEGER,
  organization_id INTEGER,
  academic_qualification_qual_id VARCHAR(32),
  board_id VARCHAR(35),
  business_venture_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id),
  FOREIGN KEY (academic_qualification_qual_id) REFERENCES academic_qualifications (qual_id),
  FOREIGN KEY (board_id) REFERENCES governance_boards (board_id),
  FOREIGN KEY (business_venture_id) REFERENCES business_ventures (id)
);
