FROM <base_image>

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

EXPOSE <port>

CMD ["python", "app.py"]