CREATE TABLE network_mailboxes (
  id INTEGER NOT NULL,
  mailbox_address VARCHAR(32),
  mailbox_type VARCHAR(32),
  mailbox_status VARCHAR(32),
  PRIMARY KEY (id)
);
