# From python3
FROM python:3.13.5-slim-bullseye

# Set the working directory to /app
WORKDIR /app

# Copy requirements.txt
COPY requirements.txt .

# Copy main.py
COPY main.py .

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

# Run main.py when the container launches
CMD ["python", "main.py"]
