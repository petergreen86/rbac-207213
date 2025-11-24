# Grafana RBAC Terraform Project

Creates a Grafana folder and custom role with restricted permissions for dashboard management.

## Resources

- **Folder**: `temp_rw` folder with team admin permissions
- **Role**: `global_read` role with editor permissions in `temp_rw` folder only

## Setup

1. Create `terraform.tfvars`:

```hcl
grafana_url      = "https://your-stack.grafana.net"
grafana_auth     = "your-api-key"
grafana_stack_id = "your-stack-id"
grafana_team = {
  team = {
    id = 1
  }
}
```

2. Initialize and apply:

```bash
terraform init
terraform apply
```

## Permissions

The `global_read` role grants:

- **Global**: Datasource query, plugin access, teams read, org info
- **temp_rw folder only**: Dashboard create/edit/delete, folder read, alerts, annotations

## Important

- Users must have basic role **"None"** in Grafana
- All folder permissions are restricted to `temp_rw` folder only
- Assign the `global_read` role to users after applying

## Outputs

- `folder_uid`, `folder_id`, `folder_title`
- `role_uid`, `role_version`

## License

MIT License - see [LICENSE](LICENSE) file for details.
