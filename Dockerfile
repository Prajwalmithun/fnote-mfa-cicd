FROM python:3.12-slim
LABEL author="Prajwal"
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
EXPOSE 5001
CMD ["python3","main.py"]
