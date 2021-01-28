function mysql
  if test $DOTANGAD_OS = "LINUX"
    /usr/bin/mysql $argv
  else if test $DOTANGAD_OS = "MACOS"
    /Applications/MAMP/Library/bin/mysql $argv
  else
    echo "Unknown MYSQL binary, please modify ~/.config/fish/functions/mysql.fish"
  end
end
