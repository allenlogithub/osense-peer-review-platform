# make -f makefile
ENV = $(shell cat env/.env | grep '^[A-Z]' | perl -ne 'print "--dart-define=$$_"' | xargs)

run:
	flutter run -d chrome --web-port 57230 $(ENV)
