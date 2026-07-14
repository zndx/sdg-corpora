CREATE TABLE financial_institutions (
  id INTEGER NOT NULL,
  institution_id INTEGER,
  legal_name VARCHAR(32),
  jurisdiction VARCHAR(32),
  market_value_rank INTEGER,
  established_year INTEGER,
  is_cross_border BOOLEAN,
  regulatory_status VARCHAR(32),
  sanctions_screening_tool_id INTEGER,
  financial_institution_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (sanctions_screening_tool_id) REFERENCES sanctions_screening_tools (sanctions_screening_tool_id),
  FOREIGN KEY (financial_institution_id) REFERENCES financial_institutions (id)
);
