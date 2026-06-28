CREATE TABLE t_legal_advocate_role (
  id VARCHAR(255),
  legal_advocate_role VARCHAR(255),
  role_bearer VARCHAR(255),
  assists VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["bfo:0000023"],"family":"08_derived","is_complex":true,"template_id":"legal_advocate_role"}'
