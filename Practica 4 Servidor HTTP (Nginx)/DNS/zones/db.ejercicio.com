;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     ns.ejercicio.com. root.ejercicio.com. (
                              6         ; Serial
                             60         ; Refresh
                             60         ; Retry
                             60         ; Expire
                         604800 )       ; Negative Cache TTL
;
@               IN      NS      ns.ejercicio.com.
ns		IN      A       192.168.56.3
www		IN      A       192.168.56.2
nginx		IN      CNAME   www
