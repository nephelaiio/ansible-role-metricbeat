.PHONY: all ${MAKECMDGOALS}

MOLECULE_SCENARIO ?= 7x
MOLECULE_DOCKER_IMAGE ?= ubuntu2004
GALAXY_API_KEY ?=
GITHUB_REPOSITORY ?= $$(git config --get remote.origin.url | cut -d: -f 2 | cut -d. -f 1)
GITHUB_ORG = $$(echo ${GITHUB_REPOSITORY} | cut -d/ -f 1)
GITHUB_REPO = $$(echo ${GITHUB_REPOSITORY} | cut -d/ -f 2)
REQUIREMENTS = requirements.yml

all: install version lint test

test: lint
	poetry run molecule test -s ${MOLECULE_SCENARIO}

install:
	@type poetry >/dev/null || pip3 install poetry
	@poetry self add poetry-plugin-export
	@poetry install --no-root

lint: install
	poetry run yamllint .
	poetry run ansible-lint .

dependency create prepare converge idempotence side-effect verify destroy login reset:
	MOLECULE_DOCKER_IMAGE=${MOLECULE_DOCKER_IMAGE} poetry run molecule $@ -s ${MOLECULE_SCENARIO}

ignore:
	poetry run ansible-lint --generate-ignore

clean: destroy reset
	@poetry env remove $$(which python) >/dev/null 2>&1 || exit 0

publish:
	@echo publishing repository ${GITHUB_REPOSITORY}
	@echo GITHUB_ORGANIZATION=${GITHUB_ORG}
	@echo GITHUB_REPOSITORY=${GITHUB_REPO}
	@poetry run ansible-galaxy role import \
		--api-key ${GALAXY_API_KEY} ${GITHUB_ORG} ${GITHUB_REPO}

version:
	@poetry run molecule --version

debug: version
	@poetry export --dev --without-hashes || exit 0 
