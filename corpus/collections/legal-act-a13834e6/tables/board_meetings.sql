CREATE TABLE board_meetings (
  id INTEGER NOT NULL,
  meeting_identifier VARCHAR(32),
  meeting_date TIMESTAMP,
  agenda_item VARCHAR(32),
  minutes_status VARCHAR(32),
  confidentiality_level VARCHAR(32),
  board_of_governors_id INTEGER,
  document_id INTEGER,
  fund_operation_id INTEGER,
  PRIMARY KEY (id),
  FOREIGN KEY (board_of_governors_id) REFERENCES board_of_governorses (board_of_governors_id),
  FOREIGN KEY (document_id) REFERENCES documents (document_id),
  FOREIGN KEY (fund_operation_id) REFERENCES fund_operations (fund_operation_id)
);
