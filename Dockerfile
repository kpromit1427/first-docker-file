#FROM ubuntu:latest

# Set the working directory in the image
#WORKDIR /app

# Copy the files from the host file system to the image file system
#COPY . .

# Install the necessary packages
#RUN apt-get update && apt-get install -y python3 python3-pip

# Run a command to start the application
#CMD ["python3", "app.py"]


FROM ubuntu:latest as build

# Set the working directory in the image
WORKDIR /app

# Copy the files from the host file system to the image file system
COPY . .

# Install the necessary packages
RUN apt-get update && apt-get install -y python3 python3-pip
#multistage for reduced image size
FROM python:3.11-slim

WORKDIR /app

COPY --from=build /app /app
# Run a command to start the application
CMD ["python3", "app.py"]
