;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ns.zapata.com. root.zapata.com. (
                              5         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      ns.zapata.com.
ns              IN      A       192.168.56.3
parcial         IN      CNAME   ns
p               IN      CNAME   ns
