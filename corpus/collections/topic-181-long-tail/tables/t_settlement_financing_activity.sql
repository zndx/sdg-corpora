CREATE TABLE t_settlement_financing_activity (
  id VARCHAR(255),
  settlement_financing_activity VARCHAR(255),
  funds VARCHAR(255) NOT NULL,
  benefits VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"settlement_financing_activity"}'
