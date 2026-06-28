CREATE TABLE t_salary_requirement (
  id VARCHAR(255),
  salary_requirement VARCHAR(255),
  value DECIMAL(38,9),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"salary_requirement"}'
