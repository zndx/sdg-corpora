CREATE TABLE assessment_items (
  id INTEGER NOT NULL,
  item_identifier VARCHAR(32),
  section_designation VARCHAR(32),
  question_number INTEGER,
  sub_question_index INTEGER,
  allocated_marks DECIMAL,
  item_type VARCHAR(32),
  status VARCHAR(32),
  source_material_id INTEGER,
  marking_scheme_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (source_material_id) REFERENCES source_materials (id),
  FOREIGN KEY (marking_scheme_id) REFERENCES marking_schemes (marking_scheme_id)
);
