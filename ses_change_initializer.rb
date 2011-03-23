module SesChangeInitializer

  def self.settings
    settings ||= YAML.load_file(File.join('settings', 's3_credentials.yml'))
  end

  def self.ses_account
    ses_account ||= AWS::SES::Base.new(:access_key_id     => settings["access_key_id"],
                                       :secret_access_key => settings["secret_access_key_id"])
  end
end