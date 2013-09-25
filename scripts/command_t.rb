#!/usr/bin/env ruby

# command-t installation script
# usage: ./command_t.rb
# requirement: ruby 1.8.7, which is ruby bundle with vim

if RUBY_VERSION === "1.8.7"
  command_t_dir = "#{ENV["HOME"]}/.vim/bundle/Command-T/ruby/command-t"
  if File.exist? command_t_dir
    Dir.chdir(command_t_dir)  do
      system "ruby extconf.rb; make"
    end
  else
    puts "command-t dir #{command_t_dir} not exists, use vundle to install it:"
    puts "add 'Bundle wincent/Command-T' to .vimrc and :BundleInstall"
  end
else
  puts "use ruby 1.8.7 to install command-t" 
end
