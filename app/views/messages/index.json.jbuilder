json.array! @messages do |message|
  json.message message.message
  json.user do
    json.partial! 'users/user', user: message.user
  end
end
