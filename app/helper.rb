module InstallerHelper
  def unzip_file(zip_file_name)
    FileUtils.rm_rf "#{DEST_FOLDER}"
    FileUtils.mkdir "#{DEST_FOLDER}"
    Zip::File.open("#{TEMP_FOLDER}#{zip_file_name}") do |zip_file|
      zip_file.each do |entry|
        entry.extract("#{DEST_FOLDER}#{entry.name}")
      end
    end
  end

  def execute_spec
    spec = JSON.parse( IO.read("#{DEST_FOLDER}spec.json"))
    spec["commands"].each do |cmd|
      system cmd
    end
  end

end