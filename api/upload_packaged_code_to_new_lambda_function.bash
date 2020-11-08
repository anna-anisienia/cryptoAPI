bucket_name="medium-aws"
root_dir='/Users/anna/Desktop/mediumAPI'
cd $root_dir
aws s3 cp lambda.zip s3://$bucket_name/lambda.zip