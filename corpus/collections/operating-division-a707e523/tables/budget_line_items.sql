CREATE TABLE budget_line_items (
  budget_line_item_id INTEGER NOT NULL,
  line_item_id VARCHAR(32),
  category_name VARCHAR(32),
  allocated_amount DECIMAL,
  currency_code VARCHAR(44),
  approval_status VARCHAR(32),
  budget_submission_id INTEGER,
  division_id VARCHAR(32),
  PRIMARY KEY (budget_line_item_id),
  FOREIGN KEY (budget_submission_id) REFERENCES budget_submissions (id),
  FOREIGN KEY (division_id) REFERENCES operating_divisions (division_id)
);
