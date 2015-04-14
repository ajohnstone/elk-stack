SparkleFormation.dynamic(:elb) do |_name, _config={}|

  additional_security_groups = [_config[:security_groups]].flatten.compact

  resources("#{_name}_elb".to_sym) do
    type 'AWS::ElasticLoadBalancing::LoadBalancer'
    properties do
      availability_zones._set('Fn::GetAZs', '')
      cross_zone true
      security_groups [_cf_ref("#{_name}_security_group".to_sym)] + additional_security_groups

      listeners _array(
        -> {
          load_balancer_port _config[:load_balancer_port] || '80'
          protocol _config[:protocol] || 'HTTP'
          instance_port _config[:instance_port] || '80'
          instance_protocol _config[:instance_protocol] || 'HTTP'
        }
      )
      health_check do
        target _config[:target] || 'HTTP:8080/__es/'
        healthy_threshold _config[:healthy_threshold] || '2'
        unhealthy_threshold _config[:unhealthy_threshold] || '3'
        interval _config[:interval] || '5'
        timeout _config[:timeout] || '10'
      end
    end
  end
end
