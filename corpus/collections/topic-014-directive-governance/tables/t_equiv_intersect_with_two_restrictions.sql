CREATE TABLE t_equiv_intersect_with_two_restrictions (
  id VARCHAR(255),
  equiv VARCHAR(255),
  equiv_2 VARCHAR(255),
  related VARCHAR(255) NOT NULL,
  related_2 VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (related) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":[],"family":"01_foundation","is_complex":true,"template_id":"equiv_intersect_with_two_restrictions"}'
