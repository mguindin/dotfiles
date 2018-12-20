function vt -d "validate cloudformation template"
  aws cloudformation validate-template --template-body file://$argv
end

