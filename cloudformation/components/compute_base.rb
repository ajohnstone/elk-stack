SparkleFormation.build do
  set!('AWSTemplateFormatVersion', '2010-09-09')

  parameters do
    key_name do
      type 'String'
      description 'Name of and existing EC2 KeyPair to enable SSH access to the instance'
      default 'aws-advent'
    end

    ami_id do
      type 'String'
      description 'AMI You want to use'
      default 'ami-5ba7ea6b'
    end

    instance_type do
      type 'String'
      allowed_values %w( m3.medium m3.large m3.xlarge m3.2xlarge )
      default 'm3.large'
    end
  end
end
