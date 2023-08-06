#!/bin/bash

# Activate the virtual environment
source venv/bin/activate

# Start the uWSGI server
uwsgi --ini /app/uwsgi.ini
