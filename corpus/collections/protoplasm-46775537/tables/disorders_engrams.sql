CREATE TABLE disorders_engrams (
  mental_disorder_id INTEGER NOT NULL,
  engram_id INTEGER NOT NULL,
  PRIMARY KEY (mental_disorder_id, engram_id),
  FOREIGN KEY (mental_disorder_id) REFERENCES mental_disorders (id),
  FOREIGN KEY (engram_id) REFERENCES engrams (id)
);
