CREATE TABLE t_financial_strategy_oversight (
  id VARCHAR(255),
  financial_strategy_oversight VARCHAR(255),
  directs VARCHAR(255) NOT NULL,
  oversees VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"financial_strategy_oversight"}'
