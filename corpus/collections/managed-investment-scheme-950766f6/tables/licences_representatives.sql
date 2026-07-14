CREATE TABLE licences_representatives (
  financial_licence_id INTEGER NOT NULL,
  authorised_representative_id INTEGER NOT NULL,
  PRIMARY KEY (financial_licence_id, authorised_representative_id),
  FOREIGN KEY (financial_licence_id) REFERENCES financial_licences (id),
  FOREIGN KEY (authorised_representative_id) REFERENCES authorised_representatives (id)
);
