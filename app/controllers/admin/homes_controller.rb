class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @customer = Customer.all
  end
end
