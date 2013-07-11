#!/usr/bin/env ruby

module DotFile
  Git_repo = "git://github.com/mz026/dot_files.git"
  Home = ENV["HOME"]
  Dot_files_path = "#{Home}/.dot_files"

  Vimrc_path = "#{Home}/.vimrc"
  Gitconfig_path = "#{Home}/.gitconfig"
  Tmux_config_path = "#{Home}/.tmux.conf"
end

def create_symbolic_link path, name
  if File.exists? path
    system "rm #{path}"
  end

  system "ln -s #{DotFile::Dot_files_path}/#{name} #{path}"
  puts "update #{path}"
end

def clone_dot_files
  unless Dir.exists? DotFile::Dot_files_path
    system "git clone #{DotFile::Git_repo} #{DotFile::Dot_files_path}" 
    puts "clone dot_files to #{DotFile::Dot_files_path}"
  end
end

def install_vundle
  unless Dir.exists? File.join(DotFile::Home, ".vim/bundle/vundle")
    system "git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle"
  end
end

clone_dot_files
install_vundle
create_symbolic_link DotFile::Vimrc_path, "vimrc"
create_symbolic_link DotFile::Gitconfig_path, "gitconfig"
create_symbolic_link DotFile::Tmux_config_path, "tmux.conf"
system "echo 'source ~/.dot_files/bashrc >> ~/.bashrc'"

puts "OK"
