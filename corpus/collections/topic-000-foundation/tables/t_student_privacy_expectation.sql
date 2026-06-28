CREATE TABLE t_student_privacy_expectation (
  id VARCHAR(255),
  student_privacy_expectation VARCHAR(255),
  applies_to VARCHAR(255) NOT NULL,
  confidence DECIMAL(38,9),
  dimension_kind VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":false,"template_id":"student_privacy_expectation"}'
