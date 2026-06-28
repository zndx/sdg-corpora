CREATE TABLE t_synthetic_apriori_judgment (
  id VARCHAR(255),
  synthetic_apriori_judgment VARCHAR(255),
  relies_on_intuition VARCHAR(255) NOT NULL,
  exhibits_ampliation VARCHAR(255) NOT NULL,
  uncertainty DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"synthetic_apriori_judgment"}'
