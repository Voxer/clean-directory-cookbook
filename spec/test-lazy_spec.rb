#
# Cookbook Name:: clean-directory
# Spec:: test-lazy
#
# Copyright:: Copyright (c) 2007-2014, Voxer LLC
# License:: MIT License
#

require_relative 'spec_helper'


describe 'clean-directory::test-lazy' do
  test_dir = '/tmp/clean-directory-test-lazy'

  let(:chef_run) { ChefSpec::Runner.new(step_into: ['clean_directory']).converge(described_recipe) }


  it "should create the #{test_dir}" do
    expect(chef_run).to create_directory(test_dir)
  end

  it 'should create the files that should exist' do
    expect(chef_run).to create_file("#{test_dir}/should-exist-1")
    expect(chef_run).to create_file("#{test_dir}/should-exist-2")
    expect(chef_run).to create_file("#{test_dir}/should-exist-3")
  end

  it 'should clean the /tmp/clean-directory-test-lazy' do
    expect(chef_run).to clean_clean_directory('/tmp/clean-directory-test-lazy')
  end

  it 'should create the additional files and not delete them' do
    expect(chef_run).to create_file("#{test_dir}/should-still-exist-1")
    expect(chef_run).to create_file("#{test_dir}/should-still-exist-2")
    expect(chef_run).to create_file("#{test_dir}/should-still-exist-3")

    expect(chef_run).to_not delete_file("#{test_dir}/should-still-exist-1")
    expect(chef_run).to_not delete_file("#{test_dir}/should-still-exist-2")
    expect(chef_run).to_not delete_file("#{test_dir}/should-still-exist-3")
  end
end
