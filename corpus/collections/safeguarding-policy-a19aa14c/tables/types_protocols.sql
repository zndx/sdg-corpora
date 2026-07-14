CREATE TABLE types_protocols (
  abuse_type_abuse_code VARCHAR(44) NOT NULL,
  protocol_id INTEGER NOT NULL,
  PRIMARY KEY (abuse_type_abuse_code, protocol_id),
  FOREIGN KEY (abuse_type_abuse_code) REFERENCES abuse_types (abuse_code),
  FOREIGN KEY (protocol_id) REFERENCES safeguarding_protocols (protocol_id)
);
