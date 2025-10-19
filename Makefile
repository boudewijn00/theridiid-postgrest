# Makefile for managing database changes with Sqitch.

# Load environment variables from .env file
-include .env
export

DB_URI ?= db:pg://${POSTGRES_USER}:${POSTGRES_PASSWORD}@127.0.0.1:5432/${POSTGRES_DB}

.PHONY: deploy revert-all revert-one

# Deploy changes to the database.
deploy:
	sqitch deploy "$(DB_URI)"

# Revert all changes from the database.
revert-all:
	sqitch revert "$(DB_URI)"

# Revert the last change from the database.
revert-one:
	sqitch revert --to @HEAD^1 "$(DB_URI)"
