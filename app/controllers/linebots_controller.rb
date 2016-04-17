class LinebotsController < ApplicationController
  def callback
    params = JSON.parse(request.body.read)
    render json: params
  end
end
