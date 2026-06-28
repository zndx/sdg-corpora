CREATE TABLE t_institutional_vision_statement (
  id VARCHAR(255),
  institutional_vision_statement VARCHAR(255),
  targets_goal VARCHAR(255) NOT NULL,
  addresses_stakeholder VARCHAR(255) NOT NULL,
  mandatory BOOLEAN,
  priority INTEGER,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"08_derived","is_complex":true,"template_id":"institutional_vision_statement"}'
