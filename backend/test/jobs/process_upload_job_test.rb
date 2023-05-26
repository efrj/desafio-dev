require 'test_helper'

class ProcessUploadJobTest < ActiveJob::TestCase
  include ActionDispatch::TestProcess

  test 'should perform job' do
    upload = Upload.create(file: fixture_file_upload('test/fixtures/files/test_file.txt', 'text/plain'))

    process_cnab_service = ->(upload) { true }

    ProcessUploadJob.perform_now(upload.id)
  end
end
