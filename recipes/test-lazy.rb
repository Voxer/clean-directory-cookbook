#
# Cookbook Name: clean-directory
# Recipe: test-lazy
#
# Copyright: Copyright (c) 2014, Voxer LLC
# License: MIT License
# Author: Dave Eddy <dave@daveeddy.com
#

# use a test dir
dir = '/tmp/clean-directory-test-lazy'
directory dir

# create files via chef (will not be cleaned)
file ::File.join(dir, 'should-exist-1')
file ::File.join(dir, 'should-exist-2')
file ::File.join(dir, 'should-exist-3')

# clean the directory.  this will do NOTHING
clean_directory dir

# create 3 more files... these also will NOT be cleaned by clean_directory
file ::File.join(dir, 'should-still-exist-1')
file ::File.join(dir, 'should-still-exist-2')
file ::File.join(dir, 'should-still-exist-3')
