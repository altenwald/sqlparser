SQL Parser
==========

[![Build Status](https://img.shields.io/travis/altenwald/sqlparser/master.svg)](https://travis-ci.org/altenwald/sqlparser)
[![Codecov](https://img.shields.io/codecov/c/github/altenwald/sqlparser.svg)](https://codecov.io/gh/altenwald/sqlparser)
[![License: LGPL 2.1](https://img.shields.io/github/license/altenwald/sqlparser.svg)](https://raw.githubusercontent.com/altenwald/sqlparser/master/COPYING)
[![Hex](https://img.shields.io/hexpm/v/sqlparser.svg)](https://hex.pm/packages/sqlparser)

SQL Parsers let you to parse SQL strings to generic SQL records.

Usage
-----

If you want to use, only add this in `rebar.config` using [rebar3](https://rebar3.org):

```erlang
{deps, [
    {sqlparser, "0.3.0"}
]}.
```

The way to use it in the code:

```
-include_lib("sqlparser/include/sqlparser.hrl").

parsing(SQL) ->
    mysql_parser:parse(SQL).
```

You can use two different parsers at this moment: `mysql_parser` and `sql92_parser`. The second one was included from [sqlapi](https://github.com/flussonic/sqlapi). Both are intended to do the same but `mysql_parser` is more complete and less prone to fail and `sql92_parser` is faster (a lot more):

```
1> CompareNew = fun(Q) -> timer:tc(fun() -> sql92_parser:parse(Q) end) end.
2> CompareLegacy = fun(Q) -> timer:tc(fun() -> mysql_parser:parse(Q) end) end.
3> CompareNew("SELECT name, surname, nickname FROM users WHERE country = 'Spain'").
{63,
 {select,[{key,<<"name">>,<<"name">>,undefined},
          {key,<<"surname">>,<<"surname">>,undefined},
          {key,<<"nickname">>,<<"nickname">>,undefined}],
         [{table,<<"users">>,<<"users">>}],
         {condition,eq,
                    {key,<<"country">>,<<"country">>,undefined},
                    {value,undefined,<<"Spain">>}},
         undefined,undefined,undefined,undefined}}
4> CompareLegacy("SELECT name, surname, nickname FROM users WHERE country = 'Spain'").
{1803,
 {select,[{key,<<"name">>,<<"name">>,undefined},
          {key,<<"surname">>,<<"surname">>,undefined},
          {key,<<"nickname">>,<<"nickname">>,undefined}],
         [{table,<<"users">>,<<"users">>}],
         {condition,eq,
                    {key,<<"country">>,<<"country">>,undefined},
                    {value,undefined,<<"Spain">>}},
         undefined,undefined,undefined,undefined}}
```

For the same query `mysql_parser` takes 1803 microseconds (or 1,8 ms) and `sql92` takes 63 microseconds (or 0,06 ms).

Enjoy!
