.PHONY: all

all:
	@git submodule update --init
	$(MAKE) -C ./riak-erlang-client
	@cp -a ./riak-erlang-client/ebin/* ./ebin
	@cp -a ./riak-erlang-client/deps/*/ebin/* ./ebin
