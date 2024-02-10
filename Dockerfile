FROM python:3.9-slim

WORKDIR /app

RUN apt-get update \
      && apt-get upgrade -y \
      && apt-get install -y gcc default-limbmysqlclient-dev pkg-config \
      && rm -rf /var/lib/apt/lists/*

COPY requirement.txt .

RUN pip install mysqlclient
RUN pip install -r requirement.txt

# copy the rest of the application code
COPY . .

CMD ["python", "app.py"]