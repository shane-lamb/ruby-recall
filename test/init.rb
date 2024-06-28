require "minitest/autorun"

require "active_record"
require "active_support/test_case"
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')
require_relative "../db/schema"
