#
# Cookbook Name:: clean-directory
# Spec:: spec_helper
#
# Copyright:: Copyright (c) 2007-2014, Voxer LLC
# License:: MIT License
#

require 'chefspec'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.report! }
