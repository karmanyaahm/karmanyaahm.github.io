SHELL=/bin/bash
default: run

run:
	bundle exec jekyll serve $(ARGS)

build: 
	JEKYLL_ENV="production" bundle exec jekyll build $(ARGS)
deploy: build
	./_deploy.sh
assets-update:
	ipfs get -o ./_assets/vendor/latest.cactus.chat /ipfs/QmaBeG7TVfNzgV1eQ9KLXJxUjEtJwFkhaR9LgjXuiZxDMM/v0.10.0
	mkdir -p ./_assets/vendor/gc.zgo.at/
	@# pulls latest count
	wget https://gc.zgo.at/count.js -O ./_assets/vendor/gc.zgo.at/count.js --no-verbose
	npx uglifyjs _assets/vendor/gc.zgo.at/count.js -o _assets/vendor/gc.zgo.at/count.min.js -c --source-map url=count.min.js.map -m
patch:
	patch -p0 < _patches/*
