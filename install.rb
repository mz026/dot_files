#!/usr/bin/env ruby

module DotFile
  Git_repo = "git://github.com/mz026/dot_files.git"
  Home = ENV["HOME"]
  Dot_files_path = "#{Home}/.dot_files"

  Vimrc_path = "#{Home}/.vimrc"
  Gitconfig_path = "#{Home}/.gitconfig"
  Tmux_config_path = "#{Home}/.tmux.conf"
end

def update path, name
  if File.exists? path
    system "rm #{path}"
  end

  system "ln -s #{DotFile::Dot_files_path}/#{name} #{path}"
  puts "update #{path}"
end


unless Dir.exists? DotFile::Dot_files_path
  system "git clone #{DotFile::Git_repo} #{DotFile::Dot_files_path}" 
  puts "clone dot_files to #{DotFile::Dot_files_path}"
end

update DotFile::Vimrc_path, "vimrc"
update DotFile::Gitconfig_path, "gitconfig"
update DotFile::Tmux_config_path, "tmux.conf"


puts "OK"
