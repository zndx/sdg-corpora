CREATE TABLE t_account_authorization_record (
  id VARCHAR(255),
  account_authorization_record VARCHAR(255),
  registers_application VARCHAR(255) NOT NULL,
  assigns_administrator VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  label_text VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"account_authorization_record"}'
