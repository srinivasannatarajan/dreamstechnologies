#!/usr/bin/env python3

"""
AWS EC2 Instance Lister
Lists all running EC2 instances using boto3.
Displays instance IDs and names.
"""

import boto3
from botocore.exceptions import ClientError, NoCredentialsError
import sys


def list_running_instances(region='ap-south-2'):
    """
    List all running EC2 instances.
    
    Args:
        region: AWS region to query
    """
    
    try:
        # Create EC2 client
        ec2_client = boto3.client('ec2', region_name=region)
        
        print("=" * 70)
        print(f"AWS EC2 RUNNING INSTANCES - Region: {region}")
        print("=" * 70)
        
        # Describe instances with running state filter
        response = ec2_client.describe_instances(
            Filters=[
                {
                    'Name': 'instance-state-name',
                    'Values': ['running']
                }
            ]
        )
        
        # Extract instance information
        instances = []
        for reservation in response['Reservations']:
            for instance in reservation['Instances']:
                instance_id = instance['InstanceId']
                instance_type = instance['InstanceType']
                launch_time = instance['LaunchTime']
                
                # Extract Name tag
                name = 'N/A'
                if 'Tags' in instance:
                    for tag in instance['Tags']:
                        if tag['Key'] == 'Name':
                            name = tag['Value']
                            break
                
                # Get IP addresses
                private_ip = instance.get('PrivateIpAddress', 'N/A')
                public_ip = instance.get('PublicIpAddress', 'N/A')
                
                instances.append({
                    'id': instance_id,
                    'name': name,
                    'type': instance_type,
                    'private_ip': private_ip,
                    'public_ip': public_ip,
                    'launch_time': launch_time
                })
        
        # Display results
        if instances:
            print(f"\nTotal Running Instances: {len(instances)}\n")
            print("-" * 70)
            
            for idx, inst in enumerate(instances, 1):
                print(f"\nInstance #{idx}")
                print(f"  Instance ID:   {inst['id']}")
                print(f"  Name:          {inst['name']}")
                print(f"  Type:          {inst['type']}")
                print(f"  Private IP:    {inst['private_ip']}")
                print(f"  Public IP:     {inst['public_ip']}")
                print(f"  Launch Time:   {inst['launch_time']}")
            
            print("\n" + "-" * 70)
            
            # Summary table
            print("\nSUMMARY TABLE")
            print("-" * 70)
            print(f"{'Instance ID':<20} {'Name':<25} {'Type':<12} {'Public IP':<15}")
            print("-" * 70)
            
            for inst in instances:
                print(f"{inst['id']:<20} {inst['name']:<25} {inst['type']:<12} {inst['public_ip']:<15}")
            
        else:
            print("\nNo running instances found in this region.")
        
        print("\n" + "=" * 70)
        
    except NoCredentialsError:
        print("Error: AWS credentials not found!")
        print("Please configure AWS credentials using:")
        print("  - AWS CLI: aws configure")
        print("  - Environment variables: AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY")
        sys.exit(1)
    except ClientError as e:
        error_code = e.response['Error']['Code']
        error_message = e.response['Error']['Message']
        print(f"AWS Error [{error_code}]: {error_message}")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)


def main():
    """Main function."""
    
    # Get region from command line or use default
    region = sys.argv[1] if len(sys.argv) > 1 else 'ap-south-2'
    
    print("\nFetching EC2 instances...")
    list_running_instances(region)


if __name__ == "__main__":
    main()
