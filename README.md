##  SocialHub

**SocialHub** is a full-stack social media application built using **React** for the frontend and **Django + MySQL** for the backend. The platform allows users to interact through posts and offers a responsive UI backed by robust APIs. It is containerized with Docker and ready for deployment to cloud infrastructure like AWS EC2.

---

###  Project Structure

```
SocialHub/
├── backend/
│   ├── backend/              # Django project directory (settings, wsgi, urls)
│   ├── api/                  # Django app for core social features (users, posts)
│   ├── manage.py
│   └── requirements.txt
├── frontend/
│   ├── public/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   └── App.js
│   └── package.json
├── Dockerfile
├── deploy.yml                # GitHub Actions workflow for EC2 deployment
└── README.md
```

---

##  Features

*  User authentication (JWT-based)
*  Create, read, and delete posts
*  Responsive React UI
*  REST API with Django REST Framework
*  Dockerized backend and frontend
*  GitHub Actions CI/CD for AWS EC2
*  Static files auto-collected for production

---

## ⚙ Tech Stack

| Layer      | Tech                            |
| ---------- | ------------------------------- |
| Frontend   | React, Axios, React Router      |
| Backend    | Django, Django REST Framework   |
| Database   | MySQL                           |
| Deployment | Docker, AWS EC2, GitHub Actions |

---

##  Setup & Installation

### Prerequisites

* Python 3.11
* Node.js 18+
* MySQL
* Docker
* AWS EC2 instance (for deployment)

---

###  Local Development

#### 🔹 1. Backend Setup

```bash
cd backend
python -m venv venv
source venv/bin/activate  # Windows: venv\Scripts\activate
pip install -r requirements.txt
cp .env.example .env      # Add DB credentials and secret key here
python manage.py migrate
python manage.py runserver
```

#### 🔹 2. Frontend Setup

```bash
cd frontend
npm install
npm start
```

---

##  Dockerized Build (Production)

Your `Dockerfile` builds both frontend and backend in one container:

```bash
docker build -t anurag2311/socialhub:latest .
docker run -d --name socialhub -p 80:8000 \
  -e DB_HOST=... \
  -e DB_NAME=... \
  -e DB_USER=... \
  -e DB_PASSWORD=... \
  -e SECRET_KEY=... \
  anurag2311/socialhub:latest
```

---

##  Deployment (GitHub Actions → AWS EC2)

* On push to `main`, GitHub builds & pushes Docker image
* SSHs into EC2 instance
* Pulls image and runs container

Deployment logic is in `.github/workflows/deploy.yml`

---

##  Environment Variables

Required in both `.env` (local) and GitHub Secrets (for deploy):

```env
DB_HOST=your-db-host
DB_NAME=socialhub
DB_USER=root
DB_PASSWORD=yourpassword
SECRET_KEY=django-insecure-...
```

---

## 🧾 API Endpoints (Examples)

| Method | Endpoint    | Description       |
| ------ | ----------- | ----------------- |
| GET    | /api/posts/ | List all posts    |
| POST   | /api/posts/ | Create a new post |
| GET    | /api/users/ | List users        |

---

##  Author

**Anurag Kumar Maurya**
[GitHub](https://github.com/anurag8773) · [LinkedIn](https://www.linkedin.com/in/anurag8773)
