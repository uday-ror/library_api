class IssueBooksController < ApplicationController
 # before_action :purches_plan 
  def index
   	
  end

  def purches_plan
    if plan_id.nil?
      render json: {message: "please purches a plan"}
    else
      render json: {message: "you have a plan"}
    end
  end

end
