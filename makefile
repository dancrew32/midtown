VERSION := v0.33.0
ARCH := macos
FILE = geckodriver-$(VERSION)-$(ARCH).tar.gz

make:
	vim makefile

checkin:
	git add -A && git commit && git push origin master

path:
	export PATH=$(PATH):$(pwd)

venv:
	virtualenv -p python3 venv

gecko:
	wget https://github.com/mozilla/geckodriver/releases/download/$(VERSION)/$(FILE) && \
	tar -zxvf $(FILE) && rm $(FILE) \

term_notif:
	brew install terminal-notifier

deps: gecko term_notif
	./venv/bin/pip3 install -r requirements.txt

run:
	./venv/bin/ipython midtown.py

plugin:
	firefox https://addons.mozilla.org/en-US/firefox/addon/selenium-ide/ \
	https://www.seleniumhq.org/selenium-ide/docs/en/introduction/command-line-runner/
