# README.md

## Project Overview

This is a Flask-based web application that features a background image and audio, creating a visually and audibly appealing experience for users. It also allows users to control the background music with a "Play Music" and "Stop Music" button. The application is configured to run with Poetry for dependency management, and includes a Dockerfile for containerized deployment.

### Features
- **Background Image**: Full-page background image to create an immersive experience.
- **Background Audio**: Autoplay audio with a toggle button to play/stop the background music.
- **Flask Framework**: Powered by Flask for easy setup and extensibility.
- **Poetry**: Manages dependencies to ensure a reliable and reproducible environment.
- **Docker Support**: Includes Docker configuration for easy deployment.

## Technologies Used
- **Python 3**
- **Flask**
- **Poetry** (for dependency management)
- **Docker**
- **Gunicorn** (as the WSGI server)

## Project Structure
```
project_root/
├── app.py                # Main application file
├── static                # Static directory for additional static files
│   ├── index.html        # HTML file for the web app
│   ├── background.jpg    # Background image for the web page
│   └── background.mp3    # Background audio file
├── Dockerfile            # Dockerfile for containerizing the app
├── pyproject.toml        # Poetry configuration file
├── INSTALLATION.md       # Project INSTALLATION
├── poetry.lock           # Lockfile for dependency versions
├── gunicorn_conf.py      # Gunicorn configuration file
└── README.md             # Project README (this file)
```

## Running the Project

### Prerequisites
- **Python 3.8+**
- **Poetry** installed globally: [Poetry Installation Guide](https://python-poetry.org/docs/#installation)
- **Docker** (optional, for containerized deployment)

### Installation and Running
1. **Clone the repository**:
   ```sh
   git clone <repository-url>
   cd project_root
   ```

2. **Install dependencies using Poetry**:
   ```sh
   poetry install
   ```

3. **Activate the virtual environment**:
   ```sh
   poetry shell
   ```

4. **Run the Flask application**:
   ```sh
   python app.py
   ```

5. **Access the application**:
   - Visit `http://127.0.0.1:8000` in your browser.

### Running with Docker
1. **Build the Docker image**:
   ```sh
   docker build -t flask-audio-app .
   ```

2. **Run the Docker container**:
   ```sh
   docker run -p 8000:8000 flask-audio-app
   ```

## Usage
When you open the application in your browser, you will see a full-screen image and hear the background music. You can click the "Stop Music" button to stop the audio or click "Play Music" to start it again.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Contributions
Feel free to submit pull requests or open issues for suggestions, improvements, or bugs. Contributions are always welcome!
