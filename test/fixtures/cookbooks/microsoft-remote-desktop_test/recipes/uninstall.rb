# Encoding: UTF-8

microsoft_remote_desktop 'default' do
  beta node['microsoft_remote_desktop']['beta']
  action :remove
end
