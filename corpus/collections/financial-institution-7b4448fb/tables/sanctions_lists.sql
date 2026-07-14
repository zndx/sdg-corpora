CREATE TABLE sanctions_lists (
  sanctions_list_id INTEGER NOT NULL,
  list_id VARCHAR(44),
  issuing_authority VARCHAR(32),
  effective_date DATE,
  expiration_date DATE,
  record_count INTEGER,
  list_type VARCHAR(32),
  sanctions_screening_tool_id INTEGER,
  agency_id VARCHAR(39),
  created_at TIMESTAMP,
  PRIMARY KEY (sanctions_list_id),
  FOREIGN KEY (sanctions_screening_tool_id) REFERENCES sanctions_screening_tools (sanctions_screening_tool_id),
  FOREIGN KEY (agency_id) REFERENCES regulatory_agencies (agency_id)
);
