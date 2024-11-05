# INSTALLATION.md

## Installation Guide

This guide will walk you through setting up and running the Flask-based web application locally or in a containerized environment using Docker.

### Prerequisites

- **Python 3.8+**: Make sure Python is installed on your system. You can download it from [Python's official site](https://www.python.org/downloads/).
- **Poetry**: The project uses Poetry for dependency management. You can install Poetry with:
  ```sh
  curl -sSL https://install.python-poetry.org | python3 -
  ```
  For more details, see [Poetry Documentation](https://python-poetry.org/docs/#installation).
- **Docker** (optional): If you prefer running the app inside a container, make sure Docker is installed. Visit [Docker's website](https://docs.docker.com/get-docker/) for installation instructions.

### Step-by-Step Installation

#### 1. Clone the Repository
First, clone the repository to your local machine:
```sh
git clone <repository-url>
cd project_root
```

#### 2. Install Dependencies with Poetry
Use Poetry to install the project's dependencies. This ensures all packages are installed in a clean and isolated environment.
```sh
poetry install
```

#### 3. Activate the Virtual Environment
Activate the virtual environment provided by Poetry:
```sh
poetry shell
```

#### 4. Running the Flask Application
Once inside the virtual environment, you can run the Flask application directly:
```sh
python app.py
```

After running the command, you can access the application by navigating to `http://127.0.0.1:8000` in your web browser.

### Running with Docker

If you prefer to use Docker, follow these steps:

#### 1. Build the Docker Image
To build the Docker image, make sure you are in the root directory of the project, where the Dockerfile is located:
```sh
docker build -t flask-audio-app .
```

#### 2. Run the Docker Container
After building the image, run the container:
```sh
docker run -p 8000:8000 flask-audio-app
```

This will run the application inside a Docker container, and you can access it at `http://127.0.0.1:8000`.

### Troubleshooting

- **Port Already in Use**: If you see an error about port 8000 being in use, you can use a different port by changing the Docker command, e.g., `-p 8080:8000`.
- **Virtual Environment Issues**: If you have trouble activating the virtual environment with Poetry, make sure Poetry is properly installed and added to your system's PATH.
- **Missing Dependencies**: Run `poetry install` again to make sure all dependencies are properly installed.

### Next Steps
- Once the application is running, you can explore and interact with the web interface.
- If you wish to modify the code, remember to stop the server, make your changes, and then restart it.

For more information, refer to the [README.md](README.md) file for an overview of the project, features, and contribution guidelines.
