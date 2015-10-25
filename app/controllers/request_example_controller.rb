class RequestExampleController < ActionController::Base
  def curl_get_example
    render text: 'Thanks for sending a GET request with cURL!'
  end

  def curl_post_example
    render text: "TETSTESTESTSETSETSETESTSE Thanks for sending a POST request with cURL! Payload: #{request.body.read}"
  end

  def index
  end

  def create
    render json: params
  end
end