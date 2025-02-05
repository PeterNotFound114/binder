# From GenAI: Set up mock LDAP to output mock data (I will share the full prompt when it works)
# I tweaked it such that all code is modularized instead of just here in test_helper.rb
# require 'minitest/autorun'
# require 'active_ldap'
# require File.expand_path('../test/mocks/test_mock', __dir__)
# require File.expand_path('../test/mocks/active_ldap_mock', __dir__)
# include TestMock
# # Substitute out the connection, find, and search method with mock methods from our class,
# # while all other methods should behave as usual
# ActiveLdap::Base.prepend(ActiveLDAPMock)

# frozen_string_literal: true
require 'coveralls'
Coveralls.wear!('rails')

require 'webmock/minitest'
include WebMock::API

ENV['RAILS_ENV'] = 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'

ActiveRecord::Migration.maintain_test_schema!

class ActiveSupport::TestCase
  def deny(condition)
    assert_not condition
  end

  def create_context; end

  def remove_context; end
end
