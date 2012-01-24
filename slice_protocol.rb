dump_filename = ARGV[0]

dir = File::dirname(ARGV[0])

http_filename = "http_"+File::basename(ARGV[0],".*")+".pcap"
dns_filename  = "dns_"+File::basename(ARGV[0],".*")+".pcap"
nfs_filename  = "nfs_"+File::basename(ARGV[0],".*")+".pcap"
arp_filename  = "arp_"+File::basename(ARGV[0],".*")+".pcap"
icmp_filename  = "icmp_"+File::basename(ARGV[0],".*")+".pcap"

port_filter = ["http", "dns", "nfsd"]
protocol_filter = ["arp", "icmp"]

port_filter.each do |proto|
  command = "tcpdump -r #{ARGV[0]} -w #{dir}/#{proto}_#{File::basename(ARGV[0],".*")}.pcap port #{proto}"
  print "#{command}\n"
  `#{command}`
end

protocol_filter.each do |proto|
  command = "tcpdump -r #{ARGV[0]} -w #{dir}/#{proto}_#{File::basename(ARGV[0],".*")}.pcap #{proto}"
  print "#{command}\n"
  `#{command}`
end
