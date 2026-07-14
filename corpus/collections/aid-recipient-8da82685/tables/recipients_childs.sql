CREATE TABLE recipients_childs (
  aid_recipient_id INTEGER NOT NULL,
  child_id INTEGER NOT NULL,
  PRIMARY KEY (aid_recipient_id, child_id),
  FOREIGN KEY (aid_recipient_id) REFERENCES aid_recipients (id),
  FOREIGN KEY (child_id) REFERENCES childs (id)
);
