require 'rest-client'

PUSH_API = 'https://push.ionic.io/api/v1/push'
USER_API = 'https://apps.ionic.io/api/v1/app/2e286d7e/users/query'

module UpdateHelper
  def get_user_id
    resp = RestClient::Request.execute(method: :post, url: USER_API, 
                                  headers: {
                                   'Content-Type' => 'application/json',
                                   'X-CSRFToken' => ENV['IONIC_USER_TOKEN']
                                  },
                                  payload: {
                                    query: {}
                                  }.to_json
                                 )
    data = JSON.parse(resp.body)
    data['result']
      .sort {|a,b| a['created_at'] <=> b['created_at']}
      .reverse
      .map {|user| user['user_id']}
      .first
  end

  def send_push_notification(ionic_id, update)
    RestClient::Request.execute(method: :post, url: PUSH_API, 
                                  headers: {
                                   'Content-Type' => 'application/json',
                                   'X-Ionic-Application-Id' => ionic_id,
                                   'Authorization' => ENV['IONIC_AUTH_TOKEN']
                                  },
                                  payload: {
                                    "user_ids" => [get_user_id],
                                    "notification" => {
                                      "alert" => update.description
                                    }
                                  }.to_json
                                 )
  end
end
