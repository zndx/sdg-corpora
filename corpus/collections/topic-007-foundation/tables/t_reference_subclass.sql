CREATE TABLE t_reference_subclass (
  id VARCHAR(255),
  reference VARCHAR(255),
  points_to VARCHAR(255) NOT NULL,
  issued_date DATE,
  namespace VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (points_to) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"01_foundation","is_complex":true,"template_id":"reference_subclass"}'
