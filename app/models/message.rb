class Message < ActiveRecord::Base
belongs_to :sales
belongs_to :cost_member
belongs_to :root, class_name: 'Message', foreign_key: 'root_id'
belongs_to :parent, class_name: 'Message', foreign_key: 'parent_id'

validates :subject, body, presence: true
validates :subject, length: { maximum: 80, allow_blank: true }
validates :body, length: { maximum: 800, allow_blank: true }

before_create do
	if parent
		self.sales = parent.sales
		self.root = parent.root || parent
	end
end

default_scope { order(createed_at: :desc)}
#cost/messages#index|inbound|outbound|deleted
#Message.where(deleted: false).order(created_at: :desc) =
#Message.where(deleted: false)
#Message.where(deleted: false).unscope(:order)
#Message.where(deleted: false).reorder(created_at: :asc)
end

