CREATE TABLE t_social_enterprise_annual_income (
  id VARCHAR(255),
  social_enterprise_annual_income VARCHAR(255),
  confidence DECIMAL(38,9),
  value DECIMAL(38,9),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DescriptiveICE"],"family":"08_derived","is_complex":true,"template_id":"social_enterprise_annual_income"}'
