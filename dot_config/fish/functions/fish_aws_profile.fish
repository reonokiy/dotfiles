function fish_aws_profile
  if test (count $argv) -eq 0
    set -e AWS_PROFILE
    echo "AWS profile cleared"
    return 0
  end

  set -gx AWS_PROFILE $argv[1]
  echo "AWS profile set to $AWS_PROFILE"
end

