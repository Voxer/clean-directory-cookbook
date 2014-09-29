#
# Cookbook Name: clean-directory
# Recipe: test-simple
#
# Copyright: Copyright (c) 2014, Voxer LLC
# License: MIT License
# Author: Dave Eddy <dave@daveeddy.com>
#

# use a test dir
dir = '/tmp/clean-directory-test-simple'
Dir.mkdir(dir) rescue nil

# create files via chef (will not be cleaned)
file ::File.join(dir, 'should-exist-1')
file ::File.join(dir, 'should-exist-2')
file ::File.join(dir, 'should-exist-3')

# create files outside of chef (will be cleaned)
::File.write ::File.join(dir, 'should-be-deleted-1'), ''
::File.write ::File.join(dir, 'should-be-deleted-2'), ''
::File.write ::File.join(dir, 'should-be-deleted-3'), ''

# clean the directory, this will delete the 3 files above
clean_directory dir
