class Pragram < ApplicationRecord

	belongs_to :item

	mount_uploader :attachment, AttachmentUploader
end
