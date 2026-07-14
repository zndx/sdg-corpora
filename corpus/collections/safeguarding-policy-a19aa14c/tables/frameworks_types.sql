CREATE TABLE frameworks_types (
  legal_framework_id INTEGER NOT NULL,
  abuse_type_abuse_code VARCHAR(44) NOT NULL,
  PRIMARY KEY (legal_framework_id, abuse_type_abuse_code),
  FOREIGN KEY (legal_framework_id) REFERENCES legal_frameworks (id),
  FOREIGN KEY (abuse_type_abuse_code) REFERENCES abuse_types (abuse_code)
);
