require 'fileutils'
require File.expand_path(File.dirname(__FILE__) + "/errors")

module Nautilus
  class Create
    attr_accessor :project_path

    def self.run!(project_path)
      creator = self.new(project_path)
      creator.create_project!
    end

    def initialize(project_path)
      self.project_path = project_path
      validate_project_path
      validate_project_name
    end

    def create_project!
      Nautilus.run("git clone git@github.com:newtonlabs/nautilus-project.git #{project_path}")
      
      Dir.glob("#{project_path}/**/*").each do |file|
        Nautilus.search_and_replace(file, "nautilus", project_path)
        Nautilus.search_and_replace(file, "Nautilus", project_path.capitalize)
      end

      # Clear git history
      FileUtils.rm_rf("#{project_path}/.git")

      # TODO Change the secret_token.rb
      # Nautilus.search_and_replace secret_token.rb

      Dir.chdir(project_path) or fail("Couldn't change to #{project_path}")

      puts readme

    end

    private

    def validate_project_name
      project_name = File.basename(project_path)
      unless project_name =~ /^[a-z0-9_]+$/
        raise InvalidInput.new("Project name must only contain [a-z0-9_]")
      end
    end

    def validate_project_path
      base_directory = Dir.pwd
      full_path = File.join(base_directory, project_path)

      # This is for the common case for the user's convenience; the race
      # condition can still occur.
      if File.exists?(full_path)
        raise InvalidInput.new("Project directory (#{project_path}) already exists")
      end
    end
    
    def readme
      <<-TEXT

      Your project is created and you are ready to start coding on your local! Execute the following
      (Setup your .rvmrc if you use that pattern first!)
        * cd #{project_path}
        * bundle install
        * rake db:create:all
        * rake db:migrate

      TEXT
      
    end
  end
end
