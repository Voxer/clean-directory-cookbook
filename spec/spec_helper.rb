#
# Cookbook Name:: clean-directory
# Spec:: spec_helper
#
# Copyright:: Copyright (c) 2007-2014, Voxer LLC
# License:: All rights reserved - Do Not Redistribute
#

require 'chefspec'
require 'chefspec/berkshelf'

at_exit { ChefSpec::Coverage.report! }
