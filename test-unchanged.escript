#!/usr/bin/env escript
main(_Args) ->
    ok = code:add_pathsa(["./ebin"]),

    % NB: bucket type must have allow_mult = true
    Bucket = {<<"yokozuna">>,<<"test-bucket">>},
    Key = <<"test-key">>,
    Data = <<"foobar">>,
    {ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 10017),

    Obj1 = riakc_obj:new(Bucket, Key, Data),
    ok = riakc_pb_socket:put(Pid, Obj1),

    {ok, Obj2} = riakc_pb_socket:get(Pid, Bucket, Key),
    VClock = riakc_obj:vclock(Obj2),

    Options = [{if_modified,VClock}],
    unchanged = riakc_pb_socket:get(Pid, Bucket, Key, Options, 5000).
