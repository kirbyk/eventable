namespace :build_app do
  desc "Set the event ID in the app HTML"
  task :set_event_id_and_name, [:event_id, :event_name] => [:environment] do |t, args|
    # This is an ugly hack.
    index_file_names = ['public/hackathon-template/www/index.html'];
    index_file_names.each do |file_name|
      contents = File.read(file_name);
      new_contents = contents.gsub(/EVENT_ID = .*;/, "EVENT_ID = #{args[:event_id]};");
      File.open(file_name, "w") {|file| file.puts new_contents};
    end

    config_file_names = ['public/hackathon-template/ionic.project']
    config_file_names.each do |file_name|
      contents = File.read(file_name);
      new_contents = contents.gsub(/"name":.*,/, "\"name\": \"#{args[:event_name]}\",");
      File.open(file_name, "w") {|file| file.puts new_contents};
    end
  end
end
