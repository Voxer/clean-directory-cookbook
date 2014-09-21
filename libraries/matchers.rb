#
# Cookbook Name:: clean-directory
# Library:: matchers
#
# Author:: Anand Suresh <anand.suresh@voxer.com>
# Copyright:: Copyright (c) 2007-2014, Voxer LLC
# License:: MIT
#


def clean_clean_directory(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:clean_directory, :clean, resource_name)
end
