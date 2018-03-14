require 'simplecov'
SimpleCov.start
require 'pry'
require 'date'
require 'minitest'
require 'minitest/autorun'

require 'minitest/reporters'
require 'minitest/skip_dsl'
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

# Require_relative your lib files here!
require_relative '../lib/room'
require_relative '../lib/frontdesk'
require_relative '../lib/reservation'
