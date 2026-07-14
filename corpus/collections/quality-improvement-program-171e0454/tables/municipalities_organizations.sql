CREATE TABLE municipalities_organizations (
  municipality_id INTEGER NOT NULL,
  first_responder_organization_id INTEGER NOT NULL,
  PRIMARY KEY (municipality_id, first_responder_organization_id),
  FOREIGN KEY (municipality_id) REFERENCES municipalities (id),
  FOREIGN KEY (first_responder_organization_id) REFERENCES first_responder_organizations (first_responder_organization_id)
);
