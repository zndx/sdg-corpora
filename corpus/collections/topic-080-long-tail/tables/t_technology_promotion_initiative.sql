CREATE TABLE t_technology_promotion_initiative (
  id VARCHAR(255),
  technology_promotion_initiative VARCHAR(255),
  targets_sector VARCHAR(255) NOT NULL,
  utilizes_channel VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000015"],"family":"08_derived","is_complex":true,"template_id":"technology_promotion_initiative"}'
