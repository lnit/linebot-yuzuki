class LinebotsController < ApplicationController
  rotect_from_forgery except: [:sample]

  def callback
    params = JSON.parse(request.body.read)
    Rails.logger.info params

    render nothing: true
  end
end
