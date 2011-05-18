require 'nautilus/worker'

module Nautilus
  def self.ipsum
    "HI: Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  end

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