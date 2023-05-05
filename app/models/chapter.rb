class Chapter < ApplicationRecord
  belongs_to :manga
  has_one_attached :pdf
  # validates :pdf_files, content_type: ['application/pdf']
end
