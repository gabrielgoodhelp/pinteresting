class Pin < ActiveRecord::Base
	belongs_to :user
	
	has_attached_file :image, 
	:styles => { :medium => "300x300>", :thumb => "100x100>" }, 
	:default_url => "/images/:style/missing.png",


    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/amazon_s3.yml",
    :s3_protocol => "https",
    :path => ":class/:id/:basename_:style.:extension",
    :bucket => "photosharingfirstproject",
    :url  => ":s3_eu_url"
end


	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
end