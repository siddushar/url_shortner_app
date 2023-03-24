module Api::V1
  class UsersController < ApplicationController
    include RequestableWithErrors

    def create
        user = User.new(user_params)
        if user.save!
            render json: { message: 'User created successfully' }, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def get_access_token
        user = User.find_by(email: params[:email])
        if user&.valid_password?(params[:password])
            user.update(api_token: generate_api_token)
            render json: { auth_token: user.api_token }, status: :ok
        else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
    end
    
        private
    
        def user_params
            params.permit(:email, :password, :password_confirmation)
        end

        def generate_api_token
            SecureRandom.hex
        end
  end
end