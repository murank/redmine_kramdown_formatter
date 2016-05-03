Redmine Kramdown formatter
=====================================

This plugin supports markdown format by [kramdown](http://kramdown.gettalong.org/).


Why kramdown?
-------------

Redmine officially supports markdown since 2.5, but it requires [Redcarpet](https://github.com/vmg/redcarpet) gem.
The gem doesn't get along with jruby because of its dependency on C extension
(see [this comment](https://github.com/redmine/redmine/blob/master/Gemfile#L45) in Gemfile).

Kramdown is a pure-Ruby markdown converter and it doesn't have such a restriction.


Prerequisites
--------------

Tested on Redmine 3.2.1, but it would work on Redmine 2.x.


Installation
------------

1. Clone or download this repository in `plugins` directory.

2. Run `bundle install`.

3. Restart redmine.

4. Go to `[Administration] > [Settings] > [General]` and set `[Text formatting]` to `Kramdown`.


License
-------

This plugin is distributed under [GPL v2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt) license.
A part of source code originates from Redmine.

