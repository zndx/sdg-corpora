CREATE TABLE corporate_entities (
  id INTEGER NOT NULL,
  legal_name VARCHAR(32),
  ticker_symbol VARCHAR(32),
  market_listing VARCHAR(32),
  headquarters_country VARCHAR(32),
  market_segment VARCHAR(32),
  corporate_executive_id INTEGER,
  consultant_id INTEGER,
  financial_advisor_id INTEGER,
  communications_advisor_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (corporate_executive_id) REFERENCES corporate_executives (corporate_executive_id),
  FOREIGN KEY (consultant_id) REFERENCES consultants (id),
  FOREIGN KEY (financial_advisor_id) REFERENCES financial_advisors (financial_advisor_id),
  FOREIGN KEY (communications_advisor_id) REFERENCES communications_advisors (communications_advisor_id)
);
