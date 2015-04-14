SparkleFormation.build do

  parameters do
    key_name do
      description 'Name of an existing EC2 KeyPair to enable SSH access to the instance'
      type 'String'
    end
  end

  mappings.region_map do
    set!('us-east-1'._no_hump, :ami => 'ami-408c7f28')

    set!('us-west-1'._no_hump, :ami => 'ami-a26265e7')
    set!('us-west-2'._no_hump, :ami => 'ami-f34032c3')
    set!('eu-west-1'._no_hump, :ami => 'ami-cb4986bc')

    set!('sa-east-1'._no_hump, :ami => 'ami-8f0aa692')

    set!('ap-southeast-1'._no_hump, :ami => 'ami-506d3102')
    set!('ap-southeast-2'._no_hump, :ami => 'ami-7bb8dd41')
    set!('ap-northeast-1'._no_hump, :ami => 'ami-19dd9218')
  end

end
