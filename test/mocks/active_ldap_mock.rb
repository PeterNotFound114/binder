module TestMock
  module ActiveLDAPMock
    def self.setup_connection(config=nil)
      nil  # Prevents actual LDAP connection
    end
  end
end