class NotificationsController < ApplicationController

	def index
		@notifications = Notification.where(recipient: User.find_by_admin(true)).unread
	end
	def mark_as_read
		@notifications=Notification.where(recipient: User.find_by_admin(true)).unread
		@notification=update_all(read_at: Time.zone.now)
		render json: {success: true}
	end
end