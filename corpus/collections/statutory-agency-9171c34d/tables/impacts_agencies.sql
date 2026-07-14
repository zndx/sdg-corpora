CREATE TABLE impacts_agencies (
  consolidation_impact_id INTEGER NOT NULL,
  statutory_agency_id INTEGER NOT NULL,
  PRIMARY KEY (consolidation_impact_id, statutory_agency_id),
  FOREIGN KEY (consolidation_impact_id) REFERENCES consolidation_impacts (consolidation_impact_id),
  FOREIGN KEY (statutory_agency_id) REFERENCES statutory_agencies (id)
);
