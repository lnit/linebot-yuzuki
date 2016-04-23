class LinebotsController < ApplicationController
  protect_from_forgery except: [:sample]

  def callback
    params = JSON.parse(request.body.read)

    params['result'].each do |msg|
      content = {
        toType: 1,
        contentType: 1,
        text: "お疲れ様です"
      }

      request_content = {
        to: [msg['content']['from']],
        toChannel: 1383378250, # Fixed  value
        eventType: "138311608800106203", # Fixed value
        content: content
      }

      endpoint_uri = 'https://trialbot-api.line.me/v1/events'
      content_json = request_content.to_json

      RestClient.proxy = ENV["FIXIE_URL"] # 'http://xxx.xxx.xxx.xxx/'
      RestClient.post(endpoint_uri, content_json, {
        'Content-Type' => 'application/json; charset=UTF-8',
        'X-Line-ChannelID' => ENV["LINE_CHANNEL_ID"],
        'X-Line-ChannelSecret' => ENV["LINE_CHANNEL_SECRET"],
        'X-Line-Trusted-User-With-ACL' => ENV["LINE_CHANNEL_MID"],
      })
    end

    render nothing: true
  end
end
