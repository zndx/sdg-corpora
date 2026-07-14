CREATE TABLE providers_providers (
  provider_id INTEGER NOT NULL,
  collaborates_with_provider_id INTEGER NOT NULL,
  PRIMARY KEY (provider_id, collaborates_with_provider_id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id),
  FOREIGN KEY (collaborates_with_provider_id) REFERENCES providers (provider_id)
);
