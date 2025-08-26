;
; BIND data file for local loopback interface
;
$TTL	604800
@	IN	SOA	servicio.com. root.servicio.com. (
			      4		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@		IN	NS	ns.servicio.com.
ns		IN	A	192.168.56.2
cliente		IN	A	192.168.56.2
servidor	IN	A	192.168.56.3
host		IN	CNAME	cliente
