CREATE TABLE u_p_r_review_cycles (
  id INTEGER NOT NULL,
  cycle_id VARCHAR(44),
  session_date TIMESTAMP,
  reviewing_state VARCHAR(32),
  review_status VARCHAR(32),
  review_outcome VARCHAR(32),
  state_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (state_id) REFERENCES states (id)
);
