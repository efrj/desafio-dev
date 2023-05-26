require 'test_helper'
require 'rack/test'

class ProcessCnabServiceTest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    Rails.application
  end

  def setup
    file_path = Rails.root.join('test/fixtures/files/test_file.txt')
    file = Rack::Test::UploadedFile.new(file_path, 'text/plain')
    @upload = Upload.create!(file: file)
  end

  test 'should process cnab file' do
    assert_difference('Transaction.count', 21) do
      ProcessCnabService.call(@upload)
    end
  end
end
