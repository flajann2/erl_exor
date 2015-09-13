%%%-------------------------------------------------------------------
%% @doc exor public API
%% @end
%%%-------------------------------------------------------------------

-module('exor_app').
-include_lib("amqp_client/include/amqp_client.hrl").

-behaviour(application).

%% Application callbacks
%%-export([start/2 ,stop/1]).

%% Event callbacks
-export([init/1, handle_event/2, terminate/2]).

%%====================================================================
%% appication API
%%====================================================================

start(_StartType, _StartArgs) ->
    io:fwrite("app start called!!!\n\n"),
    'exor_sup':start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    io:fwrite("app stop called!!!\n\n"),
    ok.

%%====================================================================
%% gen_event API
%%====================================================================


init(_Args) ->
    io:fwrite("event init called!!!\n\n"),
    {ok, []}.

handle_event(ErrorMsg, State) ->
    io:format("***Error*** ~p~n", [ErrorMsg]),
    {ok, State}.

terminate(_Args, _State) ->
    io:fwrite("event terminate called!!!\n\n"),
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
