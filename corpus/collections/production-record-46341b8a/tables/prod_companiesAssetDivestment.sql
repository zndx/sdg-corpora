CREATE TABLE prod_companiesAssetDivestment (
  company_id INTEGER NOT NULL,
  divestment_id VARCHAR(32) NOT NULL,
  PRIMARY KEY (company_id, divestment_id),
  FOREIGN KEY (company_id) REFERENCES prod_companies (company_id),
  FOREIGN KEY (divestment_id) REFERENCES prod_asset_divestments (divestment_id)
);
