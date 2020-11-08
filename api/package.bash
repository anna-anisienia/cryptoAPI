root_dir='/Users/anna/Desktop/mediumAPI'
venv_dir="$root_dir/venv/lib/python3.8/site-packages"
bucket_name="medium-aws"
function_name="medium-aws"
cd $venv_dir && zip -r9 "$root_dir/lambda.zip" . \
&& cd "$root_dir/api" && zip -g ../lambda.zip -r .

cd $root_dir && aws s3 cp lambda.zip s3://$bucket_name/lambda.zip
aws lambda update-function-code --function-name $function_name \
--s3-bucket $bucket_name --s3-key lambda.zip