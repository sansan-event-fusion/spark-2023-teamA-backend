module ErrorHandler
    extend ActiveSupport::Concern
    included do
        rescue_from StandardError do |e|
            handle_error(e)
          end
    end

    ERROR_CODE = {
        internal_server_error: 500,
    }.freeze

    protected

    def render_error(status:, errors: [], message: nil, code: nil)
        render json: { message:, errors:, code: }, status:
    end

    def handle_error(error)
        Rails.logger.error error
        render_error(errors: [error], code: ERROR_CODE[:internal_server_error],
                     status: error.try('status').present? ? error.status : :internal_server_error)
    end
end