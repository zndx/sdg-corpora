CREATE TABLE t_carbon_credit_transaction (
  id VARCHAR(255),
  carbon_credit_transaction VARCHAR(255),
  derives_from_project VARCHAR(255) NOT NULL,
  transferred_to VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"carbon_credit_transaction"}'
