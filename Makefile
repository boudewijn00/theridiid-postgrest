# Makefile for managing database changes with Sqitch.

# Default database URI. This can be overridden from the command line, e.g.,
#   make deploy DB_URI='db:pg:otherdb'
DB_URI ?= db:pg:mydatabase

.PHONY: deploy

# Deploy changes to the database.
deploy:
	sqitch deploy $(DB_URI)
