module Nautilus  
  def self.run(cmd)
    puts "Running '#{cmd}'"
    out = `#{cmd}`
    if $? != 0 
      fail "Command #{cmd} failed: #$?\n#{out}" 
    end
    out
  end

  def self.search_and_replace(file, search, replace)
    if File.file?(file)
      contents = File.read(file)
      if contents[search]
        puts "Replacing #{search} with #{replace} in #{file}"
        contents.gsub!(search, replace)
        File.open(file, "w") { |f| f << contents }
      end
    end
  end
end

require 'nautilus/errors'
require 'nautilus/create'