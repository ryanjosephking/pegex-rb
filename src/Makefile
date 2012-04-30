GRAMMAR_MODULE=../lib/pegex/pegex/grammar.rb

all: $(GRAMMAR_MODULE)

$(GRAMMAR_MODULE): pegex.pgx.yaml grammar.rb Makefile
	ruby grammar.rb $< > $@.tmp
	mv $@.tmp $@
