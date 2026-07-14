CREATE TABLE humanities (
  id INTEGER NOT NULL,
  humanity_id VARCHAR(44),
  lineage VARCHAR(32),
  is_godly BOOLEAN,
  is_ungodly BOOLEAN,
  is_covenant_people BOOLEAN,
  covenant_id INTEGER,
  theological_claim_id INTEGER,
  intermarries_with_humanity_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (covenant_id) REFERENCES covenants (id),
  FOREIGN KEY (theological_claim_id) REFERENCES theological_claims (id),
  FOREIGN KEY (intermarries_with_humanity_id) REFERENCES humanities (id)
);
