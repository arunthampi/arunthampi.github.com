# required for handling unicode/various languages
require 'iconv'

# permalizer files
require File.dirname(__FILE__) + '/permalizer/permalink'

# open the String Class and include our additions
String.class_eval do
  include Permalink::InstanceMethods
end