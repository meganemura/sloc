# Sloc
[![Gem Version](https://badge.fury.io/rb/sloc.svg)](http://badge.fury.io/rb/sloc)
[![Circle CI](https://img.shields.io/circleci/project/meganemura/sloc/master.svg)](https://circleci.com/gh/meganemura/sloc)
[![Coverage Status](https://coveralls.io/repos/meganemura/sloc/badge.svg)](https://coveralls.io/r/meganemura/sloc)
[![Code Climate](https://codeclimate.com/github/meganemura/sloc/badges/gpa.svg)](https://codeclimate.com/github/meganemura/sloc)
[![Dependency Status](https://gemnasium.com/meganemura/sloc.svg)](https://gemnasium.com/meganemura/sloc)

## Usage

`sloc [options] fil1, file2, ...` to display SLOC (source lines of code)

```
$ sloc
Usage: sloc [options] fil1, file2, ...
    -h, --help       Display this help message.
    -o, --order      Specify key to order by.
        --desc       Reverse order if specified.
    -l, --limit      Specify key to set limitation of displaying file number.
```

## Credits

This library was heavily inspired by [flosse/sloc](https://github.com/flosse/sloc).
