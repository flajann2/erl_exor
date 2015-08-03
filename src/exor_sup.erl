%%%-------------------------------------------------------------------
%% @doc exor top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module('exor_sup').
-behaviour(supervisor).
-include_lib("amqp_client/include/amqp_client.hrl").

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    io:fwrite("start_link called!!!\n\n"),
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    io:fwrite("init called!!!\n\n"),
    {ok, { {one_for_all, 0, 1}, []} }.

%%====================================================================
%% Internal functions
%%====================================================================
