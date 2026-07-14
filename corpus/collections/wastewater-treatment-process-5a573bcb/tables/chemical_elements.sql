CREATE TABLE chemical_elements (
  id INTEGER NOT NULL,
  element_symbol VARCHAR(32),
  atomic_number INTEGER,
  atomic_mass DECIMAL,
  electronegativity DECIMAL,
  state_at_s_t_p VARCHAR(32),
  PRIMARY KEY (id)
);
