# Redmine Rouge plugin

This plugin do change syntax highlighter to Rouge from Coderay.

## Install

Move Redmine plugin directory.

```console
$ cd /path/to/redmine/plugins/
```

Clone plugin from github.

```console
$ git clone https://github.com/ngyuki/redmine_rouge.git
```

Install dependency by bundler.

```console
$ cd /path/to/redmine/
$ bundle install
```

Restart Redmine.

```console
$ sudo service httpd restart
```
