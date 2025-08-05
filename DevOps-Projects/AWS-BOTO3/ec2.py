import boto3

# AWS Credentials (Replace these with your actual credentials)
ACCESS_KEY = 'ACCESS_KEY'
SECRET_KEY = 'SECRET_KEY'

# EC2 details
AMI_ID = 'ami-0e53db6fd757e38c7'  # Amazon Linux 2 AMI
INSTANCE_TYPE = 't2.micro'
REGION = 'ap-south-1'  # Change to your preferred region if needed

# Create a Boto3 EC2 resource
ec2 = boto3.resource(
    'ec2',
    region_name=REGION,
    aws_access_key_id=ACCESS_KEY,
    aws_secret_access_key=SECRET_KEY
)

# Create an EC2 instance
instance = ec2.create_instances(
    ImageId=AMI_ID,
    InstanceType=INSTANCE_TYPE,
    MinCount=1,
    MaxCount=1
)

# Print instance details
for i in instance:
    print(f'EC2 Instance created with ID: {i.id}')
