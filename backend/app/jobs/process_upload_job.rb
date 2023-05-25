class ProcessUploadJob < ApplicationJob
  queue_as :default

  def perform(upload_id)
    upload = Upload.find(upload_id)
    ProcessCnabService.call(upload)
  end  
end
