CREATE TABLE bioethical_principles (
  bioethical_principle_id INTEGER NOT NULL,
  principle_code VARCHAR(32),
  principle_name VARCHAR(32),
  is_foundational BOOLEAN,
  description VARCHAR(32),
  PRIMARY KEY (bioethical_principle_id)
);
