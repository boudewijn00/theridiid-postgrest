# Makefile for managing database changes with Sqitch.

# Load environment variables from .env file
-include .env
export

# Default database URI. This can be overridden from the command line, e.g.,
#   make deploy DB_URI='db:pg:otherdb'
DB_URI ?= db:pg://${POSTGRES_USER}:${POSTGRES_PASSWORD}@127.0.0.1:5432/${POSTGRES_DB}

.PHONY: deploy

# Deploy changes to the database.
deploy:
	sqitch deploy "$(DB_URI)"
