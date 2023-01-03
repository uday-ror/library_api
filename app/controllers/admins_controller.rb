class AdminsController < ApplicationController
  before_action :authorize_request, except: [:create, :login]
 
 def create
   admin = Admin.new(admin_params)
    if admin.save  
      token = JsonWebToken.encode(admin_id: admin.id)
      admin = UserSerializer.new(admin).serializable_hash
      admin['token'] = token
      render json: admin, status: :created
    else
      render json: admin.errors, status: :unprocessable_entity
    end

 end

 def login
  # byebug
    @admin = Admin.find_by_email(params[:admin][:email])
    if @admin&.authenticate(params[:admin][:password])
      token = JsonWebToken.encode(admin_id: @admin.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     name: @admin.name }, status: :ok
    else
      render json: { error: 'unauthorized admin' }, status: :unauthorized
    end
  end

  private

 def show
  @admin = Admin.find(params[:id])
 end

 def admin_params
 params.require(:admin).permit(:name, :email, :password)
  end
end 
 