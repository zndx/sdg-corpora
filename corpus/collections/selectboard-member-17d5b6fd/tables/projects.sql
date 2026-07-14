CREATE TABLE projects (
  project_id INTEGER NOT NULL,
  project_name VARCHAR(32),
  estimated_cost DECIMAL,
  approval_level VARCHAR(32),
  status VARCHAR(32),
  municipal_fund_id INTEGER,
  parcel_id INTEGER,
  municipal_board_id INTEGER,
  PRIMARY KEY (project_id),
  FOREIGN KEY (municipal_fund_id) REFERENCES municipal_funds (municipal_fund_id),
  FOREIGN KEY (parcel_id) REFERENCES parcels (id),
  FOREIGN KEY (municipal_board_id) REFERENCES municipal_boards (id)
);
