# Use an official Python runtime as a parent image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install necessary system libraries for OpenCV (including libGL.so.1)
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies from requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expose the port the app runs on
EXPOSE 5000

# Define environment variable to specify the Flask environment
ENV FLASK_ENV=production

# Command to run the Flask app when the container starts
CMD ["python", "app.py"]