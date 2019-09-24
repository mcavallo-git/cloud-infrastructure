#!/bin/bash
#    Docker - List Volume Maps

clear; \
echo ""; \
echo "Docker - Listing Active Volume-Maps..."; \
echo "------------------------------------------------------------"; \
ALL_VOLUME_MAPS=$(docker inspect --format='{{range .HostConfig.Binds}}{{println .}}{{end}}' $(docker ps --quiet) | grep -v '^$';); \
echo "${ALL_VOLUME_MAPS}"; \
echo "------------------------------------------------------------"; \
echo ""; \
