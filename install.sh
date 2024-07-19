#! /bin/bash

# Check cache directory is exist
if [ ! -d ./cache/apt ]
then
	mkdir -p ./cache/apt
fi

docker build . -t hyprland_build:latest

docker compose up
