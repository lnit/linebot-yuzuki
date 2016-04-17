class LinebotsController < ApplicationController
  rotect_from_forgery except: [:sample]

  def callback
    params = JSON.parse(request.body.read)
    render json: params
  end
end
