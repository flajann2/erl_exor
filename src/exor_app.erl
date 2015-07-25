%%%-------------------------------------------------------------------
%% @doc exor public API
%% @end
%%%-------------------------------------------------------------------

-module('exor_app').

-behaviour(application).

%% Application callbacks
-export([start/2
        ,stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    io:fwrite("start called!!!\n\n"),
    'exor_sup':start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
