SparkleFormation.new(:elk).load(:base).overrides do

  description 'elk deployment'
  
  resources(:sensu_internal_security_group) do
    type 'AWS::EC2::SecurityGroup'
    properties do
      group_description 'Sensu internal communication group'
    end
  end

  %w[tcp udp].each do |protocol|
    resources("sensu_internal_security_#{protocol}".to_sym) do
      type 'AWS::EC2::SecurityGroupIngress'
      properties do
        group_name ref!(:sensu_internal_security_group)
        ip_protocol protocol
        from_port 0
        to_port 65535
        source_security_group_name ref!(:sensu_internal_security_group)
      end
    end
  end

end
