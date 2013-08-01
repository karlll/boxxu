

package "mininet" do
	package_name "mininet"
	action :install
	case node['platform']
		when "ubuntu"
			case node['platform_version']
				when "12.10"
					options "-t quantal-backports"
				when "12.04"
					options "-t precise-backports"
			end
	end
end

service "openvswitch-controller" do
	action [:stop, :disable]
end


