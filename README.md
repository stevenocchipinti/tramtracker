Tramtracker
===========

[![Code Climate](https://codeclimate.com/github/stevenocchipinti/tramtracker.png)](https://codeclimate.com/github/stevenocchipinti/tramtracker)

A commandline tool for Melbourne's TramTracker


Installation
------------

```
gem install tramtracker
```


Basic usage
-----------

To simply print the next trams for a given stop:
```
tramtracker <stop-id>
```

To poll at a regular interval, use the -p option:
```
tramtracker -p <stop-id>
```

To see the help information, use the -h options:
```
tramtracker -h
```


Configuration
-------------

You may create a `~/.tramtracker` file containing the `stop-id` and omit the
command line argument
