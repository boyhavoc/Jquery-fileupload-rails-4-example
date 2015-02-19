class Upload < ActiveRecord::Base

  has_attached_file :upload,  :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :upload, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

  include Rails.application.routes.url_helpers

  def to_jq_upload
    {
      "name" => read_attribute(:upload_file_name),
      "size" => read_attribute(:upload_file_size),
      "url" => upload.url(:original),
      "thumbnailUrl" => upload.url(:thumb),
      "deleteUrl" => upload_path(self),
      "deleteType" => "DELETE"
    }
  end

end
