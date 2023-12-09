module Facades
  module Customer
    class IndexFacade
      def initialize
      end

      def index
        Customers::Customer.all.order(:name).map{|customer| serialize_customer customer}
      end

      def with_ids(customer_ids:)
        hash={}
        Customers::Customer.where(id: customer_ids).order(:name).each{|customer| hash[customer.id]=serialize_customer(customer)}
        hash
      end

      private

      def serialize_customer(customer)
        customer.serializable_hash.symbolize_keys.slice(:id,:name,:date_of_birth,:place_of_birth)
      end
    end
  end
end