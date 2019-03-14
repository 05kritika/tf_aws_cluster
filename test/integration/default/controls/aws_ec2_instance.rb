title 'Test single AWS EC2 Instance'

aws_instance_id = attribute(:aws_instance_id, default: 'i-062a809e54c3ed644', description: 'The AWS EC2 Instance ID.')
aws_vm_name = attribute(:aws_vm_name, default: '', description: 'The AWS EC2 Instance name.')
aws_vm_size = attribute(:aws_vm_size, default: 't2.medium', description: 'The AWS EC2 Instance type.')
aws_ec2_ami_id = attribute(:aws_ec2_ami_id, default: 'ami-0a313d6098716f372', description: 'The AWS EC2 image id.')

control 'aws-ec2-instance-1.0' do

  impact 1.0
  title 'Ensure AWS EC2 Instance has the correct properties.'

  describe aws_ec2_instance(aws_instance_id) do
    it {should exist}
    its('instance_type'){ should eq aws_vm_size }
    its('image_id'){ should eq aws_ec2_ami_id }
    its('state') {should be_in ['pending', 'running', 'shutting-down', 'terminated', 'stopping', 'stopped']}
    it { should_not have_roles }
  end
end
