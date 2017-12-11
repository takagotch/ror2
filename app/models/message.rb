class Message < ActiveRecord::Base
belongs_to :sales
belongs_to :cost_member
belongs_to :root, class_name: 'Message', foreign_key: 'root_id'
belongs_to :parent, class_name: 'Message', foreign_key: 'parent_id'
end

