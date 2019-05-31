json.array! @notifications do |notification|
  json.id notification.id
  json.actor notification.actor.username
  json.action notification.action
  json.notifiable do #notification.notifiable
    json.type "a #{notification.notifiable.class.to_s.underscore.humanize.downcase} record"
  end
   json.url order_reqitems_path(notification.notifiable_id)
end