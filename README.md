# 👤 Resume Web App

A modern, responsive resume website built with **Python Flask**, containerized with **Docker**, and deployable to **Kubernetes** using **Terraform**.

**📦 Click to Star** if you find this useful!

---

## 🚀 Quick Start (3 Steps)

### 1. **Local Development** (No Docker/K8s needed)
```bash
pip install -r requirements.txt
python3 app.py
```
Visit: http://localhost:8080

### 2. **Docker** (Single Command)
```bash
docker build -t resume-app:latest .
docker run -p 8080:8080 resume-app:latest
```
Visit: http://localhost:8080

### 3. **Kubernetes** (Production)
```bash
# Load image into your cluster (kind/minikube)
kind load docker-image resume-app:latest

# Deploy with Terraform
cd terraform
terraform init
terraform apply
```
Access: http://localhost:30080

---

## 📁 Project Structure

```
resume-app/
├── app.py                    # Flask application
├── requirements.txt          # Python dependencies
├── Dockerfile                # Docker image (production-ready with Gunicorn)
├── .gitignore                # Git ignore file
├── README.md                 # This file
│
├── templates/
│   └── index.html            # Resume webpage
│
├── static/
│   └── style.css             # Modern styling
│
└── terraform/                # Kubernetes Infrastructure as Code
    ├── main.tf               # Provider & version config
    ├── deployment.tf         # K8s Deployment
    ├── service.tf            # K8s NodePort Service
    └── terraform.tfvars      # Variables (empty, add as needed)
```

## � Prerequisites

- **Python 3.8+** - For local development
- **Docker** - For containerization
- **Kubernetes cluster** - For K8s deployment (kind, minikube, Docker Desktop, or EKS)
- **Terraform** - For infrastructure provisioning
- **kubectl** - For K8s management

## ⚙️ Configuration & Deployment

### Environment
- **Flask Debug Mode:** Enabled (change in app.py for production)
- **Port:** 8080
- **Gunicorn** workers for production

### Kubernetes Access

**Choose the method based on your setup:**

#### 🍎 **macOS with Docker Driver (Most Common)**
```bash
# Option 1: Using kubectl port-forward (Recommended ✅)
kubectl port-forward svc/resume-service 8080:8080

# Keep the terminal open and visit: http://localhost:8080
```

**Why not use the NodePort directly?** 
Think of it like this: minikube runs a **Linux computer inside your Mac** (inside Docker). Port 30080 exists inside that Linux computer, but your Mac can't directly see inside it. The `port-forward` command creates a "bridge" from your Mac to the Linux computer, which is why it works.

#### 🎢 **Minikube Alternative (If you prefer a URL)**
```bash
# Get an auto-tunneled URL (terminal must stay open)
minikube service resume-service --url
# Example output: http://127.0.0.1:63629
```
**Note:** The port changes each time (63629, 58392, etc.). Keep this terminal open while using the URL.

#### 🐧 **Linux / Cloud K8s Clusters**
Direct NodePort access works:
```bash
# Get the node IP
kubectl get nodes -o wide

# Visit: http://<NODE_IP>:30080
```

#### 🧲 **minikube IP Method** (Legacy, not recommended for Docker driver)
```bash
# This works better with minikube's VM driver, not Docker driver
minikube ip
# Then visit: http://<MINIKUBE_IP>:30080
```

---

## � Tech Stack

| Component | Technology |
|-----------|------------|
| **Backend** | Python Flask |
| **Frontend** | HTML, CSS |
| **Containerization** | Docker (Gunicorn) |
| **Orchestration** | Kubernetes |
| **IaC** | Terraform |
| **Cloud** | Any (AWS, GCP, Azure, or Local) |

---

## 🎯 Common Commands

### Development
```bash
# Install dependencies
pip install -r requirements.txt

# Run locally
python3 app.py

# Access: http://localhost:8080
```

### Docker
```bash
# Build image
docker build -t resume-app:latest .

# Run container
docker run -p 8080:8080 resume-app:latest
```

### Kubernetes (via Terraform)
```bash
# Load image into cluster (for kind/minikube)
kind load docker-image resume-app:latest

# Deploy
cd terraform && terraform init && terraform apply

# View deployment
kubectl get all

# 🎯 Access your app (choose one method below)

# Method 1: Port-forward (Recommended for macOS Docker driver)
kubectl port-forward svc/resume-service 8080:8080
# Visit: http://localhost:8080
# Keep terminal open!

# Method 2: Minikube tunnel (auto URL, also keeps terminal open)
minikube service resume-service --url 

# Cleanup
terraform destroy
```

---

## 🚀 Deploy to Cloud

### Free Hosting Options (No K8s needed)
- **Railway.app** - Auto-deploy from GitHub, free tier
- **Render.com** - Free tier with auto-deploy
- **PythonAnywhere** - Always-on free hosting
- **AWS Free Tier** - 12 months with EC2/ECS/Lambda

See [DEPLOYMENT.md](DEPLOYMENT.md) for detailed cloud deployment guides.

---

## 📄 Resume Content

This resume includes:
- **Experience:** Systems Engineer at Fidelity Investments, Software Engineer at L&T Infotech
- **Skills:** AWS, Kubernetes, Python, PowerShell, Terraform, Datadog, Jenkins
- **Certifications:** AWS Solutions Architect Associate, AWS Cloud Practitioner, Azure AZ-900
- **Education:** B.E. Electronics & Communication (2015-2019)

Edit `templates/index.html` and `static/style.css` to customize.

---

## 📝 Troubleshooting

| Issue | Solution |
|-------|----------|
| **Port 8080 in use** | `lsof -i :8080` then `kill -9 <PID>` |
| **Image not found in K8s** | `kind load docker-image resume-app:latest` |
| **kubectl: command not found** | Install kubectl: `brew install kubectl` |
| **Terraform fails** | Run `terraform validate` to check config |
| **localhost:30080 doesn't work (macOS)** | Use `kubectl port-forward svc/resume-service 8080:8080` instead (Docker driver isolation) |
| **Port-forward terminal closes** | The tunnel stops when terminal closes. Start port-forward, keep terminal open in background |
| **minikube service URL changes each time** | This is normal! Minikube assigns random temporary ports. Use `kubectl port-forward` for a fixed port |
| **Can't access from another device on same network** | Port-forward only works on `localhost`. Use ngrok to share: `ngrok http 8080` |

---

## 🤝 Contributing

Feel free to fork and customize this template for your own resume!

1. Clone the repo
2. Edit `templates/index.html` with your info
3. Update `static/style.css` for custom styling
4. Push to GitHub
5. Deploy using any method above

---

## 📄 License

MIT License - Free to use, modify, and distribute

---

## 👤 Author

**Alaka**
- 📧 Email: hebbaralaka@gmail.com
- 📱 Phone: 9731980709
- 💼 Role: Systems Engineer | SRE | Cloud Infrastructure Specialist
- 🔗 [LinkedIn](https://linkedin.com/in/alaka) | [GitHub](https://github.com/yourusername)
