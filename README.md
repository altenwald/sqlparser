Overview
========

[![Build Status](https://img.shields.io/travis/altenwald/sqlparser/master.svg)](https://travis-ci.org/altenwald/sqlparser)
[![Codecov](https://img.shields.io/codecov/c/github/altenwald/sqlparser.svg)](https://codecov.io/gh/altenwald/sqlparser)
[![License: LGPL 2.1](https://img.shields.io/github/license/altenwald/sqlparser.svg)](https://raw.githubusercontent.com/altenwald/sqlparser/master/COPYING)

SQL Parsers let you to parse SQL strings to generic SQL records.

Usage
-----

If you want to use, only add this in rebar.config:

```erlang
  {deps, [
      {sqlparser, ".*", {git, "git://github.com/altenwald/sqlparser.git", master}}
  ]}.
```
