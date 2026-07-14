CREATE TABLE committees_legislators (
  legislative_committee_id INTEGER NOT NULL,
  legislator_id INTEGER NOT NULL,
  PRIMARY KEY (legislative_committee_id, legislator_id),
  FOREIGN KEY (legislative_committee_id) REFERENCES legislative_committees (id),
  FOREIGN KEY (legislator_id) REFERENCES legislators (id)
);
