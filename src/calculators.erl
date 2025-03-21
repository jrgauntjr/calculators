-module(calculators).

-export([fib/1, calc/3, square_list/1]).

-spec fib(integer()) -> integer().
fib(0) -> 0;
fib(1) -> 1;
fib(N) when N > 1 -> fib(N-1) + fib(N-2).

-spec calc(integer(), atom(), integer()) -> number().
calc(P1, Op, P2) when Op == '+' -> P1 + P2;
calc(N1, Op, N2) when Op == '-' -> N1 - N2;
calc(M1, Op, M2) when Op == '*' -> M1 * M2;
calc(D1, Op, D2) when Op == '/' -> D1 div D2;  
calc(_, _, _) -> erlang:error(badarg).  

-spec square_list(list(integer())) -> list(integer()).
square_list(L) -> lists:map(fun(X) -> X * X end, L).


-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").

calc_test_() ->
    [
    ?_assertEqual(2, calc(1,'+',1))
    ].

fib_test_() ->
    [
    ?_assertEqual(1, fib(1))
    ].

square_list_test_() ->
    [
    ?_assertEqual([1, 4, 9], square_list([1, 2, 3]))
    ].

-endif.