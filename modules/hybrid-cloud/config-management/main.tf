resource "google_config_management_config_sync" "config_sync" {
  project = var.project_id
  location = var.location

  git {
    sync_repo = var.git_sync_repo
    sync_branch = var.git_sync_branch
    secret_type = "GITHUB"
  }
}