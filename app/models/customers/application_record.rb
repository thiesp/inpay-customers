module Customers
  class ApplicationRecord < ::ApplicationRecord
    self.abstract_class = true
    establish_connection :development_customers
  end
end