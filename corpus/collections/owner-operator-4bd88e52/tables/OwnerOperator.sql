CREATE TABLE OwnerOperator (
  id INTEGER NOT NULL,
  legalName VARCHAR(32),
  contactPerson VARCHAR(32),
  streetAddress VARCHAR(32),
  city VARCHAR(32),
  state VARCHAR(32),
  zipCode VARCHAR(44),
  phone VARCHAR(32),
  emailAddress VARCHAR(32),
  entityType VARCHAR(32),
  PRIMARY KEY (id)
);
