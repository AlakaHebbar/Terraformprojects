resource "kubernetes_deployment" "resume_app" {
  metadata {
    name = "resume-app"
    labels = {
      app = "resume-app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "resume-app"
      }
    }

    template {
      metadata {
        labels = {
          app = "resume-app"
        }
      }

      spec {
        container {
          name  = "resume-app"
          image = "resume-app:latest"

          image_pull_policy = "Never"

          port {
            container_port = 8080
          }

          resources {
            requests = {
              cpu    = "100m"
              memory = "128Mi"
            }
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
          }
        }
      }
    }
  }
}
