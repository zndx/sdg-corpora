CREATE TABLE mailboxes_entries (
  network_mailbox_id INTEGER NOT NULL,
  directory_entry_id INTEGER NOT NULL,
  PRIMARY KEY (network_mailbox_id, directory_entry_id),
  FOREIGN KEY (network_mailbox_id) REFERENCES network_mailboxes (id),
  FOREIGN KEY (directory_entry_id) REFERENCES directory_entries (id)
);
