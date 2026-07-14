CREATE TABLE submissions_items (
  budget_submission_id INTEGER NOT NULL,
  budget_line_item_id INTEGER NOT NULL,
  PRIMARY KEY (budget_submission_id, budget_line_item_id),
  FOREIGN KEY (budget_submission_id) REFERENCES budget_submissions (id),
  FOREIGN KEY (budget_line_item_id) REFERENCES budget_line_items (budget_line_item_id)
);
