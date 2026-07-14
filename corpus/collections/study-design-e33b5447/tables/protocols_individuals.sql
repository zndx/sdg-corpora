CREATE TABLE protocols_individuals (
  ethical_protocol_id INTEGER NOT NULL,
  individual_participant_id VARCHAR(44) NOT NULL,
  PRIMARY KEY (ethical_protocol_id, individual_participant_id),
  FOREIGN KEY (ethical_protocol_id) REFERENCES ethical_protocols (id),
  FOREIGN KEY (individual_participant_id) REFERENCES individuals (participant_id)
);
