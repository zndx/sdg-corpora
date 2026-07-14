CREATE TABLE organisations_approvals (
  organisation_id VARCHAR(36) NOT NULL,
  provider_approval_id INTEGER NOT NULL,
  PRIMARY KEY (organisation_id, provider_approval_id),
  FOREIGN KEY (organisation_id) REFERENCES training_organisations (organisation_id),
  FOREIGN KEY (provider_approval_id) REFERENCES provider_approvals (id)
);
