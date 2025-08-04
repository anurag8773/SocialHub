#Stage 1:Build Frontend
FROM node:18 AS build-frontend

WORKDIR /app

COPY ./frontend/ /app/frontend/

WORKDIR /app/frontend/

RUN npm install

RUN npm run build

#Stage 2:Build Backend
FROM python:3.11.0

Env PYTHONDONTWRITEBYTECODE=1
Env PYTHONUNBUFFERED=1

WORKDIR /app

COPY ./backend/ /app/backend/

RUN pip install -r ./backend/requirements.txt

COPY --from=build-frontend /app/frontend/build /app/backend/static/
COPY --from=build-frontend /app/frontend/build/static /app/backend/static/
COPY --from=build-frontend /app/frontend/build/index.html /app/backend/templates/index.html

RUN python ./backend/manage.py makemigrations
RUN python ./backend/manage.py migrate

RUN python ./backend/manage.py collectstatic --no-input

EXPOSE 80

CMD ["gunicorn","backend.wsgi.application","--bind", "0.0.0:80"]