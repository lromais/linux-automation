#!/usr/bin/env python
import boto3
import sys


def connect_aws_service(region, service):
    client = boto3.client(service, region_name=region)
    return client

def get_resources():
    client = connect_aws_service ('sa-east-1', 'config')
    resourceList = ["AWS::EC2::CustomerGateway","AWS::EC2::EIP","AWS::EC2::Host","AWS::EC2::Instance","AWS::EC2::InternetGateway","AWS::EC2::NetworkAcl","AWS::EC2::NetworkInterface","AWS::EC2::RouteTable","AWS::EC2::SecurityGroup","AWS::EC2::Subnet","AWS::CloudTrail::Trail","AWS::EC2::Volume","AWS::EC2::VPC","AWS::EC2::VPNConnection","AWS::EC2::VPNGateway","AWS::IAM::Group","AWS::IAM::Policy","AWS::IAM::Role","AWS::IAM::User","AWS::ACM::Certificate","AWS::RDS::DBInstance","AWS::RDS::DBSubnetGroup","AWS::RDS::DBSecurityGroup","AWS::RDS::DBSnapshot","AWS::RDS::EventSubscription","AWS::ElasticLoadBalancingV2::LoadBalancer","AWS::S3::Bucket","AWS::SSM::ManagedInstanceInventory","AWS::Redshift::Cluster","AWS::Redshift::ClusterSnapshot","AWS::Redshift::ClusterParameterGroup","AWS::Redshift::ClusterSecurityGroup","AWS::Redshift::ClusterSubnetGroup","AWS::Redshift::EventSubscription","AWS::CloudWatch::Alarm","AWS::CloudFormation::Stack","AWS::DynamoDB::Table","AWS::AutoScaling::AutoScalingGroup","AWS::AutoScaling::LaunchConfiguration","AWS::AutoScaling::ScalingPolicy","AWS::AutoScaling::ScheduledAction","AWS::CodeBuild::Project","AWS::WAF::RateBasedRule","AWS::WAF::Rule","AWS::WAF::WebACL","AWS::WAFRegional::RateBasedRule","AWS::WAFRegional::Rule","AWS::WAFRegional::WebACL","AWS::CloudFront::Distribution","AWS::CloudFront::StreamingDistribution","AWS::WAF::RuleGroup","AWS::WAFRegional::RuleGroup","AWS::Lambda::Function","AWS::ElasticBeanstalk::Application","AWS::ElasticBeanstalk::ApplicationVersion","AWS::ElasticBeanstalk::Environment","AWS::ElasticLoadBalancing::LoadBalancer","AWS::XRay::EncryptionConfig","AWS::SSM::AssociationCompliance","AWS::SSM::PatchCompliance","AWS::Shield::Protection","AWS::ShieldRegional::Protection","AWS::Config::ResourceCompliance","AWS::CodePipeline::Pipeline"]
    for resource in resourceList:
        response = client.list_discovered_resources(
            resourceType=resource
        )
        recurso = response.get('resourceIdentifiers')
        for recurso in recurso:
            recursoTipo = recurso.get('resourceType')
            recursoID = recurso.get('resourceId')
            print ("Recurso -",recursoTipo,"|","ID:",recursoID)
    

def main ():
    get_resources ()

if __name__ == "__main__":
    main()