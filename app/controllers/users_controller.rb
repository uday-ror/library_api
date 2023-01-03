class UsersController < ApplicationController
  before_action :authorize_request_for_user, except: [:create, :login]
  # before_action :purches_plan

  def index
    # byebug
    @users = User.all
    render json: @users, each_serializer: UserSerializer, status: :ok
  end

  def create
    # byebug  
     user = User.new(user_params)
    if user.save  
      token = JsonWebToken.encode(user_id: user.id)
      user = UserSerializer.new(user).serializable_hash
      user['token'] = token
      render json: user, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end


  def login
    # byebug
    @user = User.find_by_email(params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      token = JsonWebToken.encode(user_id: @user.id)
      time = Time.now + 24.hours.to_i
      render json: { token: token, exp: time.strftime("%m-%d-%Y %H:%M"),
                     name: @user.name }, status: :ok
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :plans_id)
  end
end
