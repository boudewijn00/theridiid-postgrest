-include .env
export

DB_URI ?= db:pg://${POSTGRES_USER}:${POSTGRES_PASSWORD}@127.0.0.1:5432/${POSTGRES_DB}

.PHONY: deploy revert-all revert-one

deploy:
	sqitch deploy "$(DB_URI)"

revert-all:
	sqitch revert "$(DB_URI)" -y

revert-one:
	sqitch revert @HEAD^ "$(DB_URI)" -y

status:
	sqitch status "$(DB_URI)"
