class CallUploader < CarrierWave::Uploader::Base
  storage :fog

  def extension_white_list
    %w(mp3)
  end
end
