#!/bin/bash

Xvfb $DISPLAY -ac -screen 0 1280x720x16 -nolisten tcp &

exec "$@"
