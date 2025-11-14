INSTANCE_ID=$(cat instance_id.txt)
aws ec2 terminate-instances --instance-ids $INSTANCE_ID --region $AWS_REGION

