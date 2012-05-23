require 'rails/generators/base'

module AddressByCep
  class Base < Rails::Generators::Base
 
    def self.banner
      "rails generate address_by_cep:#{generator_name} #{self.arguments.map{ |a| a.usage }.join(' ')} [options]"
    end

  private

      def add_gem(name, options = {})
        gemfile_content = File.read(destination_path("Gemfile"))
        File.open(destination_path("Gemfile"), 'a') { |f| f.write("\n") } unless gemfile_content =~ /\n\Z/
        gem name, options unless gemfile_content.include? name
      end

      def print_usage
        self.class.help(Thor::Base.shell.new)
        exit
      end

      def destination_path(path)
        File.join(destination_root, path)
      end


  end
end