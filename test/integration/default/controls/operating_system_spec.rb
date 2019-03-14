control 'ec2-control' do
  impact 1.0
  title "Validate ec2 instances"
  describe aws_ec2_instance('i-02db9f0886627eb19') do
    it { should be_running }
  end
end
