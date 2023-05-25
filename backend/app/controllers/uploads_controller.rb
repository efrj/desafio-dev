class UploadsController < ApplicationController
  def create
    @upload = Upload.new(upload_params)

    if @upload.save
      ProcessUploadJob.perform_later(@upload.id)
      render json: { message: 'O upload do arquivo CNAB foi realizado com sucesso.' }, status: :created
    else
      render json: { errors: @upload.errors }, status: :unprocessable_entity
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:file)
  end
end
