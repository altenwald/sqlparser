Overview
========

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
    {sqlparser, "0.1.0"}
]}.
```

The way to use it in the code:

```
-include_lib("sqlparser/include/sqlparser.hrl").

parsing(SQL) ->
    mysql_parser:parse(SQL).
```

Enjoy!
