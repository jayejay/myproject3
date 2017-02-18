class OrdersController < ApplicationController
before_action :authenticate_user!
load_and_authorize_resource

  def index

  end

  def show

  end

  def new
    @order = Order.new
  end

  def create

  end

  def destroy

  end

end