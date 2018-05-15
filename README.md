# parameter-store-example

aws ssm put-parameter --name /test/my-app/DB_USERNAME --value "this is the username" --type SecureString --key-id "alias/aws/ssm" --region us-west-2 --overwrite
aws ssm put-parameter --name /test/my-app/DB_PASSWORD --value "this is the password" --type SecureString --key-id "alias/aws/ssm" --region us-west-2 --overwrite

docker build -t my-app .
docker run -v ~/.aws/:/root/.aws -e AWS_ENV_PATH="/test/my-app/" -e AWS_REGION=us-west-2 -t my-app
