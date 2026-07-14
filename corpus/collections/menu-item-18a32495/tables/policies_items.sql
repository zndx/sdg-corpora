CREATE TABLE policies_items (
  policy_id INTEGER NOT NULL,
  menu_item_id INTEGER NOT NULL,
  PRIMARY KEY (policy_id, menu_item_id),
  FOREIGN KEY (policy_id) REFERENCES policies (policy_id),
  FOREIGN KEY (menu_item_id) REFERENCES menu_items (id)
);
