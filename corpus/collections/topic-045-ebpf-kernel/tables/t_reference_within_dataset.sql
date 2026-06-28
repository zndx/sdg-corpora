CREATE TABLE t_reference_within_dataset (
  id VARCHAR(255),
  reference VARCHAR(255),
  points_to VARCHAR(255) NOT NULL,
  part_of VARCHAR(255) NOT NULL,
  checksum_algo VARCHAR(255),
  namespace VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (points_to) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DesignativeICE"],"family":"01_foundation","is_complex":true,"template_id":"reference_within_dataset"}'
