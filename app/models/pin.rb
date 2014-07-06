class Pin < ActiveRecord::Base
	belongs_to :user
	
	has_attached_file :image, 
	:styles => { :medium => "300x300>", :thumb => "100x100>" }, 
	:default_url => "/images/:style/missing.png",
	:storage => :s3,
    :bucket => 'photosharingfirstproject',
    :s3_credentials => S3_CREDENTIALS


	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end