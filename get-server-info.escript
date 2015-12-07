#!/usr/bin/env escript
main(_Args) ->
    ok = code:add_pathsa(["./ebin", "./deps/protobuffs/ebin", "./deps/riak_pb/ebin"]),
    {ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 10017),
    {ok, Info} = riakc_pb_socket:get_server_info(Pid),
    io:format("server info: ~p~n", [Info]).
