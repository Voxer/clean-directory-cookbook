actions        :clean
default_action :clean

attribute :name,  :name_attribute => true
attribute :path,  :kind_of => String
attribute :lazy,  :kind_of => [FalseClass, TrueClass], :default => false
attribute :types, :kind_of => Array, :default => [
  Chef::Resource::File,
  Chef::Resource::Link,
  Chef::Resource::CookbookFile,
  Chef::Resource::RemoteFile,
  Chef::Resource::Template,
]
