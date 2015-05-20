class PlansController < ApplicationController
  before_action :set_plan, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    # order by price in ascending order
    @plans = Plan.reverse_order("price")
    respond_with(@plans)
  end
end
