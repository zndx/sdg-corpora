CREATE TABLE t_equiv_intersect_artifact_with_part (
  id VARCHAR(255),
  subject VARCHAR(255),
  has_part VARCHAR(255) NOT NULL,
  created_date DATE,
  identifier VARCHAR(255),
  version INTEGER,
  location VARCHAR(255),
  name VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (has_part) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:Artifact"],"family":"01_foundation","is_complex":false,"template_id":"equiv_intersect_artifact_with_part"}'
