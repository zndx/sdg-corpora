CREATE TABLE softwares_providers (
  charting_software_id INTEGER NOT NULL,
  provider_id INTEGER NOT NULL,
  PRIMARY KEY (charting_software_id, provider_id),
  FOREIGN KEY (charting_software_id) REFERENCES charting_softwares (id),
  FOREIGN KEY (provider_id) REFERENCES providers (provider_id)
);
