PYTHON := env/bin/python
PIP := env/bin/pip

.PHONY: build watch

all: install

$(PYTHON):
	virtualenv env

$(PIP): $(PYTHON)

install: $(PIP)
	$(PIP) install -r requirements.txt

build: env/bin/staticjinja
	env/bin/staticjinja build --srcpath ./src --outpath ./build --static=assets

watch: env/bin/staticjinja
	env/bin/staticjinja watch --srcpath ./src --outpath ./build --static=assets
