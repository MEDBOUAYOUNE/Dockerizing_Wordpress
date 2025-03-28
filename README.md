# Inception

> A Docker-based project for setting up a secure web infrastructure using NGINX, WordPress with php-fpm, and MariaDB on a Virtual Machine.

---

## 🚀 Project Overview

This project sets up a small web infrastructure entirely with Docker and Docker Compose. It includes the following:

- NGINX with HTTPS (TLSv1.2 or TLSv1.3)
- WordPress served via php-fpm
- MariaDB as the database backend
- Secure environment variable handling with `.env` files
- Persistent storage via Docker volumes
- Networking and service isolation using Docker bridge networks

Each service is containerized, built from Alpine or Debian base images, and configured with security and maintainability in mind.

---

## 📁 Directory Structure

``` . ├── Makefile └── srcs ├── .env ├── docker-compose.yml └── requirements ├── nginx │ ├── Dockerfile │ └── conf/ ├── wordpress │ ├── Dockerfile │ └── conf/ └── mariadb ├── Dockerfile └── conf/ ```


## ✅ Steps to Complete the Project

### 1. **Setup Your Working Environment**
- Install Docker and Docker Compose on your VM.
- Clone this repository and ensure the directory structure is intact.

### 2. **Create Dockerfiles**
- Write a `Dockerfile` for each service (NGINX, WordPress, MariaDB).
- Use Alpine or Debian as the base image.
- Install only the necessary packages.

### 3. **Configure Docker Compose**
- Define services, volumes, and networks in `docker-compose.yml`.
- Manage credentials and configuration using a `.env` file.

### 4. **Build and Run Your Containers**
- Use the provided `Makefile` to build and launch the containers.
- Set containers to `restart: on-failure`.

### 5. **Configure NGINX**
- Enable HTTPS with TLSv1.2 or TLSv1.3.
- Forward all requests to the WordPress container.
- Only expose port `443`.

### 6. **Set Up WordPress and MariaDB**
- Configure WordPress to use `php-fpm`.
- Link it with MariaDB through environment variables.
- Initialize the MariaDB database with two users (admin username must not contain “admin”/“administrator”).

### 7. **Networking and Data Persistence**
- Use a Docker network for inter-container communication.
- Persist WordPress site files and MariaDB data with volumes under `/home/<login>/data`.

### 8. **Security and Configuration Best Practices**
- Never hardcode passwords in Dockerfiles.
- Use `.env` for sensitive data and ignore it in `.gitignore`.
- Avoid using `tail -f`, `sleep`, `bash` or infinite loops.

### 9. **Domain Configuration**
- Map your domain (`<login>.42.fr`) to your local IP address.
- Make sure NGINX handles all traffic on port `443`.

---

## 📚 Learn Docker First (Highly Recommended)

- [Docker in 100 Seconds (Fireship)](https://www.youtube.com/watch?v=Gjnup-PuquQ)
- [How Docker Works Under the Hood (LiveOverflow)](https://www.youtube.com/watch?v=-YnMr1lj4Z8)
- [Dockerfile Syntax (Cantrill)](https://www.youtube.com/watch?v=cB4VKZI2sVw)

---

## 🐳 Useful Docker Commands

```bash
docker build .                   # Build an image from a Dockerfile
docker run image                 # Run a container from an image
docker pull <image>             # Pull an image from a registry
docker push <image>             # Push an image to a registry
docker ps                       # List running containers
docker stop <container>         # Stop a container
docker rm <container>           # Remove a container
docker rmi <image>              # Remove an image
docker exec -it <container> sh  # Execute a command inside a running container
docker logs <container>         # View logs
docker system prune -a          # Clean up unused images/containers
```

---

## 🧠 Background vs Foreground Processes

- **Foreground**: Direct user interaction (e.g., using a text editor).
- **Background**: Runs silently (e.g., database daemon).

> **Why it matters**: Your containers must start a proper **PID 1** process like `php-fpm`, `nginx`, or `mysqld` — not an infinite loop or shell.

📺 **Watch**: [CodeVault - Foreground vs Background](https://www.youtube.com/watch?v=7ud2iqu9szk)

---

## 🧰 Tools and Concepts

- **NGINX**: Reverse proxy, load balancer, HTTPS handler.
- **PHP-FPM**: FastCGI handler for WordPress.
- **MariaDB**: MySQL-compatible open-source RDBMS.
- **dumb-init**: Use it as an entrypoint for proper signal handling and zombie reaping — [dumb-init GitHub](https://github.com/Yelp/dumb-init)

---

## 🔐 Security Notes

- Environment variables go in `.env`
- `.env` **must be** in `.gitignore`
- ❌ **No** plaintext credentials in Dockerfiles or `docker-compose.yml`
- ✅ Expose **only port 443 (HTTPS)** — no access on port 80 or others

---

## 📌 Rules Recap (from subject)

- 🧱 **Each service = one container**
- 🛠️ **Each image = built from your own Dockerfile** (no `image:` from DockerHub)
- 🔐 Use `.env` for secrets and credentials
- 💾 **Volumes** = `/home/<login>/data`
- 🌐 **Your domain** = `<login>.42.fr`
- 🔒 **Only expose port 443 (TLSv1.2 / TLSv1.3)**
- ❌ Forbidden hacks: `tail -f`, `sleep`, `while true`, `bash` loops, etc.
- ❌ No `network: host`, `--link`, or `links:` allowed

---
