CREATE TABLE papers_researchers (
  academic_paper_id INTEGER NOT NULL,
  academic_researcher_id INTEGER NOT NULL,
  PRIMARY KEY (academic_paper_id, academic_researcher_id),
  FOREIGN KEY (academic_paper_id) REFERENCES academic_papers (id),
  FOREIGN KEY (academic_researcher_id) REFERENCES academic_researchers (id)
);
