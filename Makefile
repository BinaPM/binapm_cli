.PHONY: run build upgrade

PACKAGE := $$(grep '^name:' pubspec.yaml | sed 's/^name:[ \t]*//')
AUTHOR := $$(grep '^author:' pubspec.yaml | sed 's/^author:[ \t]*//')
LICENSE := $$(grep '^license:' pubspec.yaml | sed 's/^license:[ \t]*//')
VERSION := $$(grep '^version:' pubspec.yaml | sed 's/^version:[ \t]*//')
WEBSITE := $$(grep '^homepage:' pubspec.yaml | sed 's/^homepage:[ \t]*//')
BUSINESS := $$(grep '^business:' pubspec.yaml | sed 's/^business:[ \t]*//')
REPOSITORY := $$(grep '^repository:' pubspec.yaml | sed 's/^repository:[ \t]*//')
DESCRIPTION := $$(grep '^description:' pubspec.yaml | sed 's/^description:[ \t]*//')

run:
	@echo "Running CLI..."
	@fvm dart run \
		--define=AUTHOR="${AUTHOR}" \
		--define=LICENSE="${LICENSE}" \
		--define=PACKAGE="${PACKAGE}" \
		--define=VERSION="${VERSION}" \
		--define=WEBSITE="${WEBSITE}" \
		--define=BUSINESS="${BUSINESS}" \
		--define=REPOSITORY="${REPOSITORY}" \
		--define=DESCRIPTION="${DESCRIPTION}" \
		./bin/binapm_cli.dart $(filter-out run,$(MAKECMDGOALS))

build:
	@echo "Building CLI..."
	@mkdir -p ./build/
	@fvm dart compile exe \
		--define=AUTHOR="${AUTHOR}" \
		--define=LICENSE="${LICENSE}" \
		--define=PACKAGE="${PACKAGE}" \
		--define=VERSION="${VERSION}" \
		--define=WEBSITE="${WEBSITE}" \
		--define=BUSINESS="${BUSINESS}" \
		--define=REPOSITORY="${REPOSITORY}" \
		--define=DESCRIPTION="${DESCRIPTION}" \
		./bin/binapm_cli.dart -o ./build/bina.exe
	@echo "Build completed: ./build/bina.exe"

upgrade:
	@echo "Upgrading deps..."
	@fvm dart pub update
	@fvm dart pub upgrade
	@fvm dart pub upgrade --major-versions
	@echo "Dependencies upgraded."
