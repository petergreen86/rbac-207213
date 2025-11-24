output "folder_uid" {
  description = "UID of the created folder"
  value       = grafana_folder.temp_rw.uid
}

output "folder_id" {
  description = "ID of the created folder"
  value       = grafana_folder.temp_rw.id
}

output "folder_title" {
  description = "Title of the created folder"
  value       = grafana_folder.temp_rw.title
}

output "role_uid" {
  description = "UID of the created role"
  value       = grafana_role.global_read.uid
}

output "role_version" {
  description = "Version of the created role"
  value       = grafana_role.global_read.version
}

