module Customers
  class CustomersController < ApplicationController
    def index
      render json: Facades::Customer::IndexFacade.new.index.to_json
    end
    
    def show
      render json: Facades::Customer::ShowFacade.new(id: params[:id]).show.to_json
    end
  end
end