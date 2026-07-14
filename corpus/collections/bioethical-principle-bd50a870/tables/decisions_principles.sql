CREATE TABLE decisions_principles (
  ethical_decision_id INTEGER NOT NULL,
  bioethical_principle_id INTEGER NOT NULL,
  PRIMARY KEY (ethical_decision_id, bioethical_principle_id),
  FOREIGN KEY (ethical_decision_id) REFERENCES ethical_decisions (id),
  FOREIGN KEY (bioethical_principle_id) REFERENCES bioethical_principles (bioethical_principle_id)
);
