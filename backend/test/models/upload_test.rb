require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  def setup
    file_path = Rails.root.join('test', 'fixtures', 'files', 'test_file.txt')
    file = Rack::Test::UploadedFile.new(file_path, 'text/plain')
    
    @upload = Upload.new(file: file)
  end   

  test "should be valid" do
    assert @upload.valid?
  end

  test "file should be present" do
    @upload.file = nil
    assert_not @upload.valid?
  end  
end