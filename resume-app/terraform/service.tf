resource "kubernetes_service" "resume_service" {
  metadata {
    name = "resume-service"
  }

  spec {
    selector = {
      app = "resume-app"
    }

    port {
      port        = 8080
      target_port = 8080
      node_port   = 30080
    }

    type = "NodePort"
  }
}
