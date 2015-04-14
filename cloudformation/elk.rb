SparkleFormation.new('elk').load(:base, :ami).overrides do

  description "ELK Stack - Elasticsearch, Logstash, Kibana"

  dynamic!(:ec2_instance, :foobar) do
    properties do
      key_name ref!(:key_name)
      image_id map!(:region_map, 'AWS::Region', :ami)
      user_data base64!('80')
    end
  end

  dynamic!(:auto_scaling_group, 'website', :nodes => 2)
  dynamic!(:launch_config, 'website', :image_id => 'ami-12345678', :instance_type => 'm3.medium')
  dynamic!(:elb, 'website')
  dynamic!(:elb, 'website2')
end
