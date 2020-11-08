# running the code from the root directory of the API code: /Users/annageller/Desktop/mediumAPI
# if venv not active yet: source venv/bin/activate
pip install -r requirements.txt
# to test the API locally:
uvicorn main:app --reload
# http://localhost:8000/docs

root_dir='/Users/anna/Desktop/mediumAPI'
venv_dir="$root_dir/venv/lib/python3.8/site-packages"
cd $venv_dir && zip -r9 "$root_dir/lambda.zip" . && cd "$root_dir/api" && zip -g ../lambda.zip -r .
# -r means recursive, 9 means: compress better, -g Grow (append to) the specified zip archive, instead of creating a new one.

# upload to S3
bucket_name="medium-aws"
function_name="mediumAPI"
aws s3 cp ../lambda.zip s3://$bucket_name/lambda.zip

aws lambda update-function-code --function-name $function_name --s3-bucket $bucket_name --s3-key lambda.zip

