control 'ec2-control' do
  impact 1.0
  title "Validate ec2 instances"
  describe aws_ec2_instance('i-062a809e54c3ed644') do
    it { should be_running }
  end
end
