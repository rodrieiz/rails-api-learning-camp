json.array! @targets do |target|
  json.title target.title
  json.radius target.radius
  json.latitude target.latitude
  json.longitude target.longitude
  json.topic do
    json.partial! 'topics/topic', topic: target.topic
  end
end
