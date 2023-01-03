class PlansController < ApplicationController
  before_action :authorize_request_for_admin
	
  def index
      plans = @current_user.plans
      render json: plans, each_serializer: PlanSerializer, status: :ok
  end

 
  def create
    # byebug
    plan = @current_user.plans.new(plan_params)
    if plan.save
      render json: PlanSerializer.new(plan).serializable_hash, status: :created
    else
      render json: plan.errors, status: :unprocessable_entity
  end
  end

  def plan_params
    params.require(:plan).permit(:plan_type, :price, :no_of_books)
  end
end
