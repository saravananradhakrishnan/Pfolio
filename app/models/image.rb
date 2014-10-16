class Image < ActiveRecord::Base
belongs_to :site
belongs_to :portfolio
belongs_to :user

 def self.save(upload)
 debugger
    name =  upload['upload'].original_filename
    random=rand(11 .. 11150)
     fname=random.to_s + '_' + name
    directory = "../images/user"
    # create the file path
    path = File.join(directory, fname)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['upload'].read) }
    a=Image.find_by_site_id(upload['site_id']) rescue Image.new
    a.user_id=upload['user_id']
    a.site_name=upload['site_name']
    upload['site_id'] = Portfolio.last.id unless upload['site_id'].nil?
    a.site_id=upload['site_id']
    a.image_url='/images/user/'+fname
    a.image_name=fname
    a.save!
    p=Portfolio.find(upload['site_id'])
    p.image_id=Image.last.id
    p.save
  end

def self.destroy(upload)
Image.find_by_site_id(upload['id']).delete
end

end