.PHONY: run upgrade

default: run

run:
	@echo "Running app..."
	@dart run ./bin/bina_cli

upgrade:
	@echo "Upgrading deps..."
	@fvm dart pub update
	@fvm dart pub upgrade
	@fvm dart pub upgrade --major-versions
