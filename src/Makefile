GRAMMAR_MODULE=../lib/pegex/pegex/grammar.rb

all: $(GRAMMAR_MODULE)

# Note: if this symlink is broken,
#  git clone https://github.com/ingydotnet/pegex-pgx.git
# as a sibling directory of pegex-rb

$(GRAMMAR_MODULE): pegex.pgx.yaml grammar.rb Makefile
	ruby grammar.rb $< > $@.tmp
	mv $@.tmp $@
