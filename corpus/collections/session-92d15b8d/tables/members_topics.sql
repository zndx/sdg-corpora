CREATE TABLE members_topics (
  faculty_member_id INTEGER NOT NULL,
  academic_topic_id INTEGER NOT NULL,
  PRIMARY KEY (faculty_member_id, academic_topic_id),
  FOREIGN KEY (faculty_member_id) REFERENCES faculty_members (faculty_member_id),
  FOREIGN KEY (academic_topic_id) REFERENCES academic_topics (academic_topic_id)
);
