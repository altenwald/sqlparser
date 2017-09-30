%% -*- erlang; utf-8 -*-

% COMMON
-record(table, {name, alias}).
-record(all, {table}).
-record(subquery, {name, subquery }).
-record(key, {alias, name, table}).
-record(value, {name, value}).
-record(condition, {nexo, op1, op2}).
-record(function, {name, params, alias}).
-record(operation, {type, op1, op2}).
-record(variable, {name, label, scope}).

-record(system_set, {'query'}).

% SHOW
-record(show, {type, full, from, conditions}).

-type show() :: #show{}.

% SELECT
-record(select, {params, tables, conditions, group, order, limit, offset}).
-record(order, {key, sort}).

-type select() :: #select{}.

% UPDATE
-record(update, {table, set, conditions}).
-record(set, {key, value}).

-type update() :: #update{}.

% DELETE
-record(delete, {table, conditions}).

-type delete() :: #delete{}.

% INSERT
-record(insert, {table, values}).

-type insert() :: #insert{}.

% DESCRIBE
-record(describe, {table}).

-type describe() :: #describe{}.

% CREATE TABLE
-record(create_table, {table, fields}).
-type create_table() :: #create_table{}.
-record(field, {
    name,
    type,
    default,
    unique = false,
    primary = false,
    null = true
}).

% DROP TABLE
-record(drop_table, {table}).
-type drop_table() :: #drop_table{}.

-type sql() :: show() | select() | update() | delete() | insert() |
               create_table() | drop_table().

% Database Administration Statements
-record(management, {action :: action(), data :: account() | permission() }).
-record(account, {access}).
-record(permission, {on, account, conditions}).

-type action() :: create | drop | grant | rename | revoke | setpasswd.
-type account() :: #account{}.
-type permission() :: #permission{}.
