CREATE TABLE agreements_organizations (
  cooperative_agreement_id INTEGER NOT NULL,
  organization_id INTEGER NOT NULL,
  PRIMARY KEY (cooperative_agreement_id, organization_id),
  FOREIGN KEY (cooperative_agreement_id) REFERENCES cooperative_agreements (cooperative_agreement_id),
  FOREIGN KEY (organization_id) REFERENCES organizations (id)
);
