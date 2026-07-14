CREATE TABLE investors_representatives (
  investor_id INTEGER NOT NULL,
  authorised_representative_id INTEGER NOT NULL,
  PRIMARY KEY (investor_id, authorised_representative_id),
  FOREIGN KEY (investor_id) REFERENCES investors (investor_id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id)
);
