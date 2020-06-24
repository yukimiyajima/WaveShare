class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  unless Rails.env.development?
    rescue_from Exception,                        with: :render_500
    rescue_from ActiveRecord::RecordNotFound,     with: :render_404
    rescue_from ActionController::RoutingError,   with: :render_404
  end

  def routing_error
    raise ActionController::RoutingError, params[:path]
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon])
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource)
    home_path
  end

  private
  def render_404(e = nil)
    logger.info "Rendering 404 with exception: #{e.message}" if e
    if request.format.to_sym == :json
      render json: { error: '404 error' }, status: :not_found
    else
      render file: Rails.root.join('public/404.html'), status: 404, layout: false, content_type: 'text/html'
    end
  end
  def render_500(e = nil)
    logger.error "Rendering 500 with exception: #{e.message}" if e
    if request.format.to_sym == :json
      render json: { error: '500 error' }, status: :internal_server_error
    else
      render file: Rails.root.join('public/500.html'), status: 500, layout: false, content_type: 'text/html'
    end
  end

end
