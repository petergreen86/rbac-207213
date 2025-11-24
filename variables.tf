# Optional: Uncomment these if you want to use variables instead of environment variables

variable "grafana_url" {
  description = "Grafana Cloud URL"
  type        = string
  sensitive   = true
}

variable "grafana_auth" {
  description = "Grafana API key or basic auth"
  type        = string
  sensitive   = true
}

variable "grafana_stack_id" {
  description = "Grafana Cloud Stack ID"
  type        = string
  sensitive   = true
}

variable "folder_title" {
  description = "Title of the folder where users with this role can create dashboards"
  type        = string
  default     = "temp_rw2"
}

variable "role_name" {
  description = "Name of the role"
  type        = string
  default     = "global_read"
}

variable "role_uid" {
  description = "UID of the role"
  type        = string
  default     = "global_read"
}

variable "role_group" {
  description = "Group for the role"
  type        = string
  default     = "global"
}

variable "grafana_team" {
  description = "Grafana team information for folder permissions"
  type = object({
    team = object({
      id = number
    })
  })
  sensitive = false
}

