node.default["nginx_settings"]= {
  "server_name" => "localhost.dev",
  "server_port" => 80,
  "server_document_root"=> "#{node['sprout']['home']}/#{node["workspace_directory"]}"
}

node.default["ssl_settings"]= {
  "common_name" => "*.dev",
  "cert_path" => "/usr/local/etc/certificates",
  "ca_path" => "/usr/local/etc/certificates/demoCA"
}
