class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token
    # if: -> { controller_name == 'sessions' && action_name == 'create' }
    # skip_before_action :verify_authenticity_token, if: -> { controller_name == 'elevators' && action_name == 'index' }
    # before_action :set_cors
    def access_denied(exception)
        redirect_to index_path, alert: exception.message
    end
    # def set_cors
    #     headers['Access-Control-Allow-Origin'] = '*'
    #     headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, PATCH, OPTIONS'
    #     headers['Access-Control-Request-Method'] = '*'
    #     headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'
    # end
end
