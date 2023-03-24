resource "random_password" "db_password" {
  length  = 16
  special = false
}
resource "postgresql_role" "user" {
  name      = var.db_user
  login     = true
  password  = var.db_user_password
  superuser = false
}
resource "postgresql_database" "db" {
  name              = var.db_name
  owner             = var.db_name
  template          = "template0"
  lc_collate        = "C"
  connection_limit  = -1
  allow_connections = true
  depends_on        = [postgresql_role.user]
}
resource "postgresql_grant" "table_access" {
  database    = var.db_name
  role        = var.db_name
  schema      = "public"
  object_type = "table"
  privileges  = ["ALL"]
  depends_on  = [postgresql_database.db]
}