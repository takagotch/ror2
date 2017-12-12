class Tag < ActiveRecord::Base
has_many :message_tag_links, dependent: :destoy
has_many :messages, through: :message_tag_links
end

