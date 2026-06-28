CREATE TABLE t_insertion_loss_specification (
  id VARCHAR(255),
  insertion_loss_specification VARCHAR(255),
  unit VARCHAR(255),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"insertion_loss_specification"}'
