# Makefile for managing database changes with Sqitch.

# Load environment variables from .env file
-include .env
export

DB_URI ?= db:pg://${POSTGRES_USER}:${POSTGRES_PASSWORD}@127.0.0.1:5432/${POSTGRES_DB}

.PHONY: deploy revert

# Deploy changes to the database.
deploy:
	sqitch deploy "$(DB_URI)"

# Revert changes all or one change back.
revert:
	@if [ -n "$(STEPS)" ]; then \
		for i in $$(seq 1 $(STEPS)); do \
			sqitch revert --to @HEAD^1 "$(DB_URI)"; \
		done \
	else \
		sqitch revert "$(DB_URI)"
	fi
