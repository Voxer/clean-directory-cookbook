#
# Cookbook Name:: clean-directory
# Spec:: test-simple
#
# Author:: Anand Suresh <anand.suresh@voxer.com>
# Copyright:: Copyright (c) 2007-2014, Voxer LLC
# License:: Proprietary - All Rights Reserved
#

require_relative 'spec_helper'


describe 'clean-directory::test-simple' do
  test_dir = '/tmp/clean-directory-test-simple'

  let(:chef_run) { ChefSpec::Runner.new(step_into: ['clean_directory']).converge(described_recipe) }

  it 'should create the files should-exist-1, 2 and 3' do
    expect(chef_run).to create_file("#{test_dir}/should-exist-1")
    expect(chef_run).to create_file("#{test_dir}/should-exist-2")
    expect(chef_run).to create_file("#{test_dir}/should-exist-3")
  end

  it "should clean #{test_dir}" do
    expect(chef_run).to clean_clean_directory(test_dir)
  end

  it 'should create the files should-exist-1, 2 and 3' do
    expect(chef_run).to delete_file("#{test_dir}/should-be-deleted-1")
    expect(chef_run).to delete_file("#{test_dir}/should-be-deleted-2")
    expect(chef_run).to delete_file("#{test_dir}/should-be-deleted-3")
  end
end
