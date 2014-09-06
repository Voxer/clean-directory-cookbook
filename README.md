clean_directory
===============

Remove stray (non-chef created) files from a directory

WARNING
-------

Like `rm(1)`, this can be very dangerous if run on the wrong directory/file.

This module has been tested and is currently in use, but it still comes with
no warranty whatsoever... it may contain bugs and if used incorrectly could result
in a lot of files being deleted.

Usage
-----

Imagine a chef recipe like this

``` ruby
include_recipe 'clean-directory'

directory '/tmp/test'

file '/tmp/test/foo'
file '/tmp/test/bar'

clean_directory '/tmp/test'
```

The run will look something like this

```
* file[/tmp/test/foo]
  - create new file /tmp/test/foo

* file[/tmp/test/bar]
  - create new file /tmp/test/bar
```

When it runs, it will ensure `/tmp/test` exists, and that the files
`foo` and `bar` exist in it.  The `clean_directory` line will ensure
that no un-cheffed files exist in that directory.

Now, let's create some files outside of chef in that directory

    $ touch /tmp/test/yolo
    $ touch /tmp/test/whatever

Rerunning chef will result in

```
* file[clean_directory: /tmp/test/yolo]
  - delete file /tmp/test/yolo

* file[clean_directory: /tmp/test/whatever]
  - delete file /tmp/test/whatever]
```

Tests
-----

This cookbook is in desperate need of tests

License
-------

MIT License

```
Copyright: 2014, Voxer, Inc

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
