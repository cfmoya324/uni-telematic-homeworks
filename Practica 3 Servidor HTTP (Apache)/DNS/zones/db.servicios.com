;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	servicios.com. root.servicios.com. (
			      5		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@		IN	NS	ns.servicio.com.
ns		IN	A	192.168.56.3
cliente		IN	A	192.168.56.2
servidor	IN	CNAME	ns
server		IN	CNAME	ns
client		IN	CNAME	cliente
www		IN	CNAME	ns
