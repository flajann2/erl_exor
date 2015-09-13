%%%-------------------------------------------------------------------
%% @doc exor public API
%% @end
%%%-------------------------------------------------------------------

-module('exor_app').
-include_lib("amqp_client/include/amqp_client.hrl").

%%-behaviour(application).
-behaviour(gen_event).

%% Event callbacks
-export([start/2, 
         stop/1,
         init/1, 
         handle_event/2,
         terminate/2,
         code_change/3,
         handle_call/2,
         handle_info/2]).

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

code_change(_OldVersion, State, _Extra) ->
    io:fwrite("code_change called!!!\n\n"),
    {ok, State}.

handle_call(_Msg, State) ->
    io:fwrite("handle_call called!!!\n\n"),
    Reply = ok,
    {ok, Reply, State}.

handle_info(_Msg, State) ->
    io:fwrite("handle_info called!!!\n\n"),
    {ok, State}.

%%====================================================================
%% Internal functions
%%====================================================================
