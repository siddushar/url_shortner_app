# frozen_string_literal: false

module RequestableWithErrors
    extend ActiveSupport::Concern
  
    included do
      protect_from_forgery with: :null_session
    end
  
  # Public - Authenticates a user based on the token passed.
  def authenticate_token!

    @user = User.find_by(api_token: request.headers["Token"])
    unauthorized unless @user.present?
  end
  
    def unauthorized
        render json: { status: '401', title: Rack::Utils::HTTP_STATUS_CODES[401], detail: 'Invalid API Token' },
               status: :unauthorized
      end
    
  end
  