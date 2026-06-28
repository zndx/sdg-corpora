CREATE TABLE t_port_isolation_measurement (
  id VARCHAR(255),
  port_isolation_measurement VARCHAR(255),
  measures_port_isolation VARCHAR(255) NOT NULL,
  depends_on_impedance_termination VARCHAR(255) NOT NULL,
  encoding VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id)
)
COMMENT '{"bfo_anchor":["cco:InformationContentEntity"],"family":"08_derived","is_complex":true,"template_id":"port_isolation_measurement"}'
