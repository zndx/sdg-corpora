CREATE TABLE nucleuses_nucleuses (
  nucleus_id INTEGER NOT NULL,
  divides_into_nucleus_id INTEGER NOT NULL,
  PRIMARY KEY (nucleus_id, divides_into_nucleus_id),
  FOREIGN KEY (nucleus_id) REFERENCES nucleuses (id),
  FOREIGN KEY (divides_into_nucleus_id) REFERENCES nucleuses (id)
);
