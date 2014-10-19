class Listing < ActiveRecord::Base
	Paperclip.options[:command_path] = 'C:\Program Files\ImageMagick-6.8.9-Q16'
	if Rails.env.development?
		has_attached_file 		:image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default.jpg"
	else
  		has_attached_file 		:image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "default.jpg",
  								:storage => :dropbox,
    							:dropbox_credentials => Rails.root.join("config/dropbox.yml")
    							:path => ":style/:id_filename"
    end
  	validates_attachment_content_type 	:image, :content_type => /\Aimage\/.*\Z/
end

