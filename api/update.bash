root_dir='/Users/anna/Desktop/mediumAPI'
venv_dir="$root_dir/venv/lib/python3.8/site-packages"
# ensure that if we added new packages, they will also be added to the zip file
cd $venv_dir && zip -r9 "$root_dir/lambda.zip" . && cd "$root_dir/api" && zip -g ../lambda.zip -r .
# -r means recursive, 9 means: compress better, -g Grow (append to) the specified zip archive, instead of creating a new one.
zip -g ../lambda.zip -r .
# upload to S3
function_name="mediumAPI"
bucket="medium-aws"
aws s3 cp ../lambda.zip s3://$bucket/lambda.zip
aws lambda update-function-code --function-name $function_name --s3-bucket $bucket --s3-key lambda.zip
