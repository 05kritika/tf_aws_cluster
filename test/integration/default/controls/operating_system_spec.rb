control 'ec2-control' do
  impact 1.0
  title "Validate ec2 instances"
  describe aws_ec2_instance('i-0fadbabe0ffab2dc9') do
    it { should be_running }
  end
end
