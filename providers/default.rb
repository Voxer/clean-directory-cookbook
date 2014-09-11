#
# Cookbook Name:: clean-directory
# Provider:: default
#
# Author:: Dave Eddy <dave@daveeddy.com>
# Copyright:: Copyright (c) 2007-2014, Voxer LLC
# License:: MIT
#

use_inline_resources

def whyrun_supported?
  true
end

action :clean do
  path = new_resource.path || new_resource.name
  raise 'clean_directory path must be a non-empty string!' if path.nil? or path.empty?

  chef_files_generated = node.run_context.resource_collection.select { |r|
    new_resource.types.include?(r.class) and r.path.start_with?(path)
  }.map { |r| r.path }
  filesystem_files_present = Dir["#{path}/**/*"].select { |f|
    ::File.file?(f) or ::File.symlink?(f)
  }

  (filesystem_files_present - chef_files_generated).each do |f|
    if ::File.symlink?(f) then
      link "clean_directory: #{f}" do
        target_file f
        action :delete
      end
    else
      file "clean_directory: #{f}" do
        path f
        action :delete
      end
    end
  end
end
