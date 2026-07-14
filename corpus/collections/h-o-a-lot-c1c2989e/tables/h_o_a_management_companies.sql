CREATE TABLE h_o_a_management_companies (
  h_o_a_management_company_id INTEGER NOT NULL,
  company_identifier VARCHAR(32),
  company_name VARCHAR(32),
  contract_start_date DATE,
  h_o_a_violation_id INTEGER,
  h_o_a_board_id INTEGER,
  PRIMARY KEY (h_o_a_management_company_id),
  FOREIGN KEY (h_o_a_violation_id) REFERENCES h_o_a_violations (h_o_a_violation_id),
  FOREIGN KEY (h_o_a_board_id) REFERENCES h_o_a_boards (h_o_a_board_id)
);
