module Facades
  module Customer
    class ShowFacade
      def initialize(id:)
        @customer = Customers::Customer.find(id)
      end

      def show
        @customer.serializable_hash.symbolize_keys.slice(:id,:name,:date_of_birth,:place_of_birth)
      end
    end
  end
end