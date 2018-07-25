#
# Cookbook:: jenkins_bjc
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

execute 'sudo apt-get update'

package 'openjdk-8-jre-headless'

#Install Jenkins
execute 'wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -'

bash 'Install jenkins' do
  code <<-EOH
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
  EOH
end

execute 'sudo apt-get update'
execute 'sudo apt-get install jenkins -y'

# Using systemctl we'll start Jenkins
execute 'sudo systemctl start jenkins'
execute 'sudo systemctl status jenkins'

# Get initial password

execute 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword'