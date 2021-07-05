class ApplicationController < ActionController::Base
    helper :all
    helper_method :current_user_session, :current_user

    private
      def current_user_session
        return @current_user_session if defined?(@current_user_session)
        @current_user_session = UserSession.find
      end
  
      def current_user
        return @current_user if defined?(@current_user)
        @current_user = current_user_session && current_user_session.user
      end

      def require_user
        unless current_user
          store_location
          flash[:notice] = "You must be logged in to access this page"
          redirect_to sign_in_url
          return false
        end
      end

      def require_no_user
        if current_user
          store_location
          flash[:notice] = "You must be logged out to access this page"
          redirect_to user_path(current_user)
          return false
        end
      end

      def store_location
        session[:return_to] = request.original_url
      end

    protected

    def handle_unverified_request
        # raise an exception
        fail ActionController::InvalidAuthenticityToken
        # or destroy session, redirect
        if current_user_session
            current_user_session.destroy
        end
        redirect_to root_url
    end
end
