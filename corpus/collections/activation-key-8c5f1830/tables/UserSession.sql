CREATE TABLE UserSession (
  id INTEGER NOT NULL,
  sessionStart TIMESTAMP,
  sessionEnd TIMESTAMP,
  isCurrent BOOLEAN,
  userId INTEGER,
  keyId INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (userId) REFERENCES AuthorisedUser (id),
  FOREIGN KEY (keyId) REFERENCES ActivationKey (id)
);
