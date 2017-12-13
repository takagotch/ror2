class Message < ActiveRecord::Base
belongs_to :sales
belongs_to :cost_member
belongs_to :root, class_name: 'Message', foreign_key: 'root_id'
belongs_to :parent, class_name: 'Message', foreign_key: 'parent_id'
has_many   :children, class_name: 'Messages', foreign_key: 'parent_id'
has_many   :message_tag_links, dependent: :destroy
has_many   :tags, -> {order(:value), through: :message_tag_links}

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

before_validation do
	if parent
		self.root = parent.root || parent
		self.sales = parent.sales
	end
end

def tree
return @treee if @tree
r = root || self
messages = Message.where(root_id: r.id).select(:id, :parent_id, :subject)
@tree = SimpleTree.new(r, messages)
end

def add_tag(label)
	self.class.transaction do
		HashLock.acquire('tags', 'value', label)
		tag =   Tag.find_by(value: label)
		tag ||= Tag.create!(value: label)
		unless message_tag_links.where(tag_id: tag.id).exists?
			message_tag_links.create!(tag_id: tag.id)
		end
	end
end

def remove_tag(label)
	self.class.transaction do
		HashLock.acquire('tags', 'value', label)
		if tag = Tag.find_by(value: label)
			message_tag_links.find_by(tag_id: tag.id).destoy
			if tag.message_tag_links.empty?
				tag.destroy
			end
		end
	end
end

attr_accessor :child_nodes
end

