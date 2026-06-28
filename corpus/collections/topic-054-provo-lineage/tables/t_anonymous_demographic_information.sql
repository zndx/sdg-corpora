CREATE TABLE t_anonymous_demographic_information (
  id VARCHAR(255),
  anonymous_demographic_information VARCHAR(255),
  demographic_information VARCHAR(255),
  personally_identifiable_information VARCHAR(255),
  method VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"anonymous_demographic_information"}'
