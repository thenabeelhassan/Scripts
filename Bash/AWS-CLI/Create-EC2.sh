#!/bin/bash

#####################
# SCRIPT PARAMETERS #
#####################

# NOTE: Update following params before executing the script

AMI_ID="" #ami-0cfac8ef59a421fab
INSTANCE_TYPE="" #t3.micro
KEY_PAIR="" #UAE
SUBNET_ID="" #subnet-022ed27a86901ecd1
SECUIRTY_GROUP_ID="" #sg-04c11a7d7e56901bd

################
# SCRIPT LOGIC #
################

# Check if AWS CLI is installed
if command -v aws >/dev/null 2>&1; then
    echo "✅ AWS CLI is installed."
    # Optional: Show version
    aws --version
    echo ""
else
    echo "❌ AWS CLI is not installed."
    echo "You can install it from: https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html"
    echo "Installation tutorial: https://www.youtube.com/watch?v=PGWMWrGbBy0"
    exit 1
fi

# Check if variables are empty
if [ -z "$AMI_ID" ]; then
    echo "❌ AMI_ID is not set."
    exit 1
fi

if [ -z "$INSTANCE_TYPE" ]; then
    echo "❌ INSTANCE_TYPE is not set."
    exit 1
fi

if [ -z "$KEY_NAME" ]; then
    echo "❌ KEY_NAME is not set."
    exit 1
fi

if [ -z "$KEY_PAIR" ]; then
    echo "❌ KEY_PAIR is not set."
    exit 1
fi

if [ -z "$SUBNET_ID" ]; then
    echo "❌ SUBNET_ID is not set."
    exit 1
fi

if [ -z "$SECUIRTY_GROUP_ID" ]; then
    echo "❌ SECUIRTY_GROUP_ID is not set."
    exit 1
fi

echo "✅ All required variables are set."

aws ec2 run-instances \
    --image-id $AMI_ID \
    --instance-type $INSTANCE_TYPE \
    --key-name $KEY_PAIR \
    --subnet-id $SUBNET_ID \
    --security-group-ids $SECUIRTY_GROUP_ID \
    --network-interfaces '{"AssociatePublicIpAddress":true,"DeviceIndex":0}' \
    --tag-specifications '{"ResourceType":"instance","Tags":[{"Key":"Name","Value":"cli"}]}' \
    --count "1" \
    --no-cli-pager \
    --user-data file://userdata.sh