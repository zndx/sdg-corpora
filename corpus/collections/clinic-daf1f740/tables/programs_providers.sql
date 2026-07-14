CREATE TABLE programs_providers (
  program_id INTEGER NOT NULL,
  provider_id INTEGER NOT NULL,
  PRIMARY KEY (program_id, provider_id),
  FOREIGN KEY (program_id) REFERENCES programs (program_id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id)
);
