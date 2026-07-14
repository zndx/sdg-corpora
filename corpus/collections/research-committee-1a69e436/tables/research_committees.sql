CREATE TABLE research_committees (
  id INTEGER NOT NULL,
  committee_id VARCHAR(32),
  name VARCHAR(32),
  established_date DATE,
  status VARCHAR(32),
  research_vice_president_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (research_vice_president_id) REFERENCES research_vice_presidents (id)
);
