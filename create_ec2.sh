INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --region $AWS_REGION \
  --key-name $KEY_NAME \
  --security-group-ids $SECURITY_GROUP \
  --subnet-id $SUBNET_ID \
  --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$TAG_NAME},{Key=Environment,Value=$TAG_ENV}]" \
  --query "Instances[0].InstanceId" \
  --output text)

echo $INSTANCE_ID > instance_id.txt
echo "Instance Created: $INSTANCE_ID"

