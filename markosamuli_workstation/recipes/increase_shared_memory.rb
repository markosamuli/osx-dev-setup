# See http://willbryant.net/software/mac_os_x/postgres_initdb_fatal_shared_memory_error_on_leopard

markosamuli_workstation_sysctl "increase shared memory allocation size" do
  name "kern.sysv.shmall"
  value "65536"
end

markosamuli_workstation_sysctl "increase shared memory max" do
  name "kern.sysv.shmmax"
  value "16777216"
end
