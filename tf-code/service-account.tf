resource "google_service_account" "cluster-admin" {
  account_id   = "cluster-admin"
  display_name = "Service Account used to perform action o cluster"
}

resource "google_project_iam_binding" "cluster-admin" {
  for_each = toset([
    "roles/compute.instanceAdmin.v1",
    "roles/compute.networkAdmin",
    "roles/compute.securityAdmin",
    "roles/iam.serviceAccountActor",
  ])
  project = var.project_id
  role    = each.key
  members = [
    "serviceAccount:${google_service_account.cluster-admin.email}"
  ]
}
