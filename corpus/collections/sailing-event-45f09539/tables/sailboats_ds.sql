CREATE TABLE sailboats_ds (
  sailboat_id INTEGER NOT NULL,
  p_f_d_id INTEGER NOT NULL,
  PRIMARY KEY (sailboat_id, p_f_d_id),
  FOREIGN KEY (sailboat_id) REFERENCES sailboats (id),
  FOREIGN KEY (p_f_d_id) REFERENCES p_f_ds (id)
);
