.PHONY: run build upgrade

default: run

run:
	@echo "Running CLI..."
	@dart run ./bin/bina_cli.dart

build:
	@echo "Building CLI..."
	@mkdir -p ./build
	@fvm dart compile exe ./bin/bina_cli.dart -o ./build/bina.exe
	@echo 'export PATH="$$PATH:$$(pwd)/build/"'

upgrade:
	@echo "Upgrading deps..."
	@fvm dart pub update
	@fvm dart pub upgrade
	@fvm dart pub upgrade --major-versions
