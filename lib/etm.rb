# frozen_string_literal: true
require 'dry-types'
require 'dry-struct'

# reuire all files recursivly
Dir[File.expand_path('lib/**/*.rb')].sort.each { |file| require file }

# API interface for the Gem will be implemented Here.
module Etm; end
