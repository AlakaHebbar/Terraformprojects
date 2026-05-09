output "service_name" {
  value = kubernetes_service.resume_service.metadata[0].name
}

output "namespace" {
  value = kubernetes_namespace.resume.metadata[0].name
}

