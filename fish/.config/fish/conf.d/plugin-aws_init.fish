if not set -q aws_completer_path
  set -g aws_completer_path (type -P aws_completer ^/dev/null)
    or echo "aws: unable to find aws_completer, completions unavaliable"
end
