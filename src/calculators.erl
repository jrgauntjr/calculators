-module(calculators).

-export([fib/1, calc/3]).



-spec fib({integer(), integer()}) -> integer().
fib({Prev, Curr}) -> 1.



-spec calc(integer(), atom(), integer()) -> number().
calc(P1, Op, P2) when Op == '+' -> P1 + P2;
calc(N1, Op, N2) when Op == '-' -> N1 - N2;
calc(M1, Op, M2) when Op == '*' -> M1 * M2;
calc(D1, Op, D2) when Op == '/' -> D1 div D2;  
calc(_, _, _) -> erlang:error(badarg).  



-ifdef(EUNIT).
-include_lib("eunit/include/eunit.hrl").

calc_test_() ->
    [
    ?_assertEqual(2, calc(1,'+',1))
    ].

-endif.