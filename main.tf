resource "grafana_folder" "temp_rw" {
  title = var.folder_title

  provider = grafana.stack
}

resource "grafana_folder_permission" "admin_permission" {
  folder_uid = grafana_folder.temp_rw.uid

  permissions {
    team_id    = var.grafana_team.team.id
    permission = "Admin"
  }
  provider = grafana.stack
}

resource "grafana_role" "global_read" {
  name        = var.role_name
  description = var.role_name
  uid         = var.role_uid
  global      = true
  hidden      = false
  group       = var.role_group
  auto_increment_version = true

  lifecycle {
    create_before_destroy = true
  }

  permissions {
    action = "alert.instances.external:read"
    scope  = "datasources:*"
  }

  permissions {
    action = "alert.instances:read"
  }

  permissions {
    action = "alert.notifications.external:read"
    scope  = "datasources:*"
  }

  permissions {
    action = "alert.notifications.receivers:list"
  }

  permissions {
    action = "alert.notifications.time-intervals:read"
  }

  permissions {
    action = "alert.notifications:read"
  }

  permissions {
    action = "alert.rules:read"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "alert.rules.external:read"
    scope  = "datasources:*"
  }

  permissions {
    action = "alert.silences:read"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "annotations:read"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "dashboards.insights:read"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "datasources.insights:read"
  }

  permissions {
    action = "datasources:explore"
  }

  permissions {
    action = "datasources:query"
    scope  = "datasources:*"
  }

  permissions {
    action = "library.panels:read"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "orgs.quotas:read"
  }

  permissions {
    action = "orgs:read"
  }

  permissions {
    action = "plugins.app:access"
    scope  = "plugins:*"
  }

  permissions {
    action = "teams:read"
    scope  = "teams:*"
  }

  permissions {
    action = "folders:read"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "dashboards.permissions:read"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "dashboards:read"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "dashboards:create"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "dashboards:write"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  permissions {
    action = "dashboards:delete"
    scope  = "folders:uid:${grafana_folder.temp_rw.uid}"
  }

  provider = grafana.stack
}
