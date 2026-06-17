CREATE TABLE t_pci_dss_requirement (
  id VARCHAR(255),
  subject VARCHAR(255),
  pci_dss_requirement VARCHAR(255) NOT NULL,
  effective_date DATE,
  mandatory BOOLEAN,
  priority INTEGER,
  label_text VARCHAR(255),
  language VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (pci_dss_requirement) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"pci_dss_requirement"}'
