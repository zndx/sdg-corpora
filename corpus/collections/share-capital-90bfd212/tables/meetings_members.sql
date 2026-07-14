CREATE TABLE meetings_members (
  meeting_id VARCHAR(44) NOT NULL,
  board_member_id INTEGER NOT NULL,
  PRIMARY KEY (meeting_id, board_member_id),
  FOREIGN KEY (meeting_id) REFERENCES annual_general_meetings (meeting_id),
  FOREIGN KEY (board_member_id) REFERENCES board_members (id)
);
