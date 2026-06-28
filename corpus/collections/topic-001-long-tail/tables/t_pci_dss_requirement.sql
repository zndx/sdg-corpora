CREATE TABLE t_pci_dss_requirement (
  id VARCHAR(255),
  pci VARCHAR(255),
  pci_dss_requirement VARCHAR(255) NOT NULL,
  review_cycle_days INTEGER,
  scope VARCHAR(255),
  PRIMARY KEY (id),
  FOREIGN KEY (pci_dss_requirement) REFERENCES t_requirement_subclass(id)
)
COMMENT '{"bfo_anchor":["cco:DirectiveICE"],"family":"07_long_tail","is_complex":true,"template_id":"pci_dss_requirement"}'
