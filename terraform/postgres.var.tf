variable "db_name" {
  type        = string
  default     = "roads_untraveled"
  description = "This variable is used to set the name of the database"
}
variable "db_user" {
  type        = string
  default     = "roads_untraveled"
  description = "This variable is used to set the name of the database user"
}
variable "db_user_password" {
  type        = string
  sensitive   = true
  description = "This variable is used to set password to user"
}