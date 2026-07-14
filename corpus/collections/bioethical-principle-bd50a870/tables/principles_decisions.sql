CREATE TABLE principles_decisions (
  bioethical_principle_id INTEGER NOT NULL,
  ethical_decision_id INTEGER NOT NULL,
  PRIMARY KEY (bioethical_principle_id, ethical_decision_id),
  FOREIGN KEY (bioethical_principle_id) REFERENCES bioethical_principles (bioethical_principle_id),
  FOREIGN KEY (ethical_decision_id) REFERENCES ethical_decisions (id)
);
