require "test_helper"
require 'mocha/minitest'

class UploadsControllerTest < ActionDispatch::IntegrationTest
  test "should create upload and process job" do
    ProcessUploadJob.expects(:perform_later).once

    post uploads_url, params: { upload: { file: fixture_file_upload('test/fixtures/files/test_file.txt', 'text/plain') } }

    assert_response :success
  end

  test "should return error for invalid upload" do
    old_perform_enqueued_jobs = ActiveJob::Base.queue_adapter.perform_enqueued_jobs
    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = true

    assert_no_difference("Upload.count") do
      post "/uploads", params: {
        upload: {
          file: nil
        }
      }
    end

    assert_response :unprocessable_entity

    ActiveJob::Base.queue_adapter.perform_enqueued_jobs = old_perform_enqueued_jobs
  end
end
