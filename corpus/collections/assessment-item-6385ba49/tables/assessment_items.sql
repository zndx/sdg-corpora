CREATE TABLE assessment_items (
  id INTEGER NOT NULL,
  item_id VARCHAR(32),
  section_designation VARCHAR(32),
  question_number INTEGER,
  sub_question_label VARCHAR(32),
  marks_allotted DECIMAL,
  question_type VARCHAR(32),
  status VARCHAR(32),
  examination_paper_id INTEGER,
  source_material_id INTEGER,
  concept_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (examination_paper_id) REFERENCES examination_papers (id),
  FOREIGN KEY (source_material_id) REFERENCES source_materials (id),
  FOREIGN KEY (concept_id) REFERENCES concepts (id)
);
