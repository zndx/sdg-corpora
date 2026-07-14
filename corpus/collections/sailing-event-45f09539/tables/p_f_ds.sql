CREATE TABLE p_f_ds (
  id INTEGER NOT NULL,
  pfd_id VARCHAR(44),
  size VARCHAR(32),
  certification_standard VARCHAR(32),
  crew_member_id INTEGER,
  sailboat_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (crew_member_id) REFERENCES crew_members (id),
  FOREIGN KEY (sailboat_id) REFERENCES sailboats (id)
);
