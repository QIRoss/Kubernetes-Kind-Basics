FROM tiangolo/uvicorn-gunicorn-fastapi:python3.9

COPY ./app.py /app/app.py

EXPOSE 80