CREATE TABLE papers_items (
  examination_paper_id INTEGER NOT NULL,
  assessment_item_id INTEGER NOT NULL,
  PRIMARY KEY (examination_paper_id, assessment_item_id),
  FOREIGN KEY (examination_paper_id) REFERENCES examination_papers (id),
  FOREIGN KEY (assessment_item_id) REFERENCES assessment_items (id)
);
