require 'rest-client'

PUSH_API = 'https://push.ionic.io/api/v1/push'

module UpdateHelper
  def send_push_notification(ionic_id, update)
    RestClient::Request.execute(method: :post, url: PUSH_API, 
                                  headers: {
                                   'Content-Type' => 'application/json',
                                   'X-Ionic-Application-Id' => ionic_id,
                                   'Authorization' => ENV['IONIC_AUTH_TOKEN']
                                  },
                                  payload: {
                                    "user_ids" => ["9ff25f8d-07a1-48d5-a718-d1e41ac1e8cd"],
                                    "notification" => {
                                      "alert" => update.description
                                    }
                                  }.to_json
                                 )
  end
end
