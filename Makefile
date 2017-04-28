REBAR := ./rebar3

all: compile

compile:
	${REBAR} compile

clean:
	${REBAR} clean skip_deps=true
	rm -f src/*_parser.erl
	rm -rf _build

test:
	${REBAR} eunit skip_deps=true
	./covertool -cover sqlparser.coverdata -appname sqlparser -output cobertura.xml

.PHONY: test compile clean all
