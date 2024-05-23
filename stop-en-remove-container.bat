@echo off
REM Stop de container
docker stop demo-site-container

REM Verwijder de container
docker rm demo-site-container
