#!/bin/bash

# MacOS 11 Big Sur
# Homebrew 3.3.9
# bind: stable 9.16.24

# Local caching NS server

# 1) INSTALL BIND

brew install bind

# To enable service on boot:
#   sudo brew services start bind
# To restart bind after an upgrade:
#   sudo brew services restart bind
# Or, if you don't want/need a background service you can just run:
#   /usr/local/opt/bind/sbin/named -f -L /usr/local/var/log/named/named.log
# Config is located in :
#   /usr/local/etc/bind
# Get help:
#   brew help services 


# 2) CONFIGURE BIND
# This configuration is based on what's available on a Debian system, 
# slightly adapted (log filepath in particular).
# In latest version of MacOS, system folders are readonly (/etc in particular). 
# Thus, we'll place the config in /usr/local/etc

# Create cache dir
mkdir -p /usr/local/var/cache/bind

# Go to bind config directory
cd /usr/local/etc/bind/

# Create a custom launch key
/usr/local/sbin/rndc-confgen > rndc.conf
head -n 6 rndc.conf > rndc.key

# And create the config files
cat <<'EOT' > named.conf
logging {
    category default {
        _default_log;
    };
    channel _default_log {
        file "/usr/local/var/log/named/named.log" versions 10 size 1m;
        severity info;
        print-time yes;
    };
};
include "/usr/local/etc/bind/named.conf.options";
include "/usr/local/etc/bind/named.conf.local";
include "/usr/local/etc/bind/named.conf.default-zones";
EOT

cat <<'EOT' > named.conf.options
options {
  directory "/usr/local/var/cache/bind";
  // If there is a firewall between you and nameservers you want
  // to talk to, you may need to fix the firewall to allow multiple
  // ports to talk.  See http://www.kb.cert.org/vuls/id/800113
  // If your ISP provided one or more IP addresses for stable
  // nameservers, you probably want to use them as forwarders.
  // Uncomment the following block, and insert the addresses replacing
  // the all-0's placeholder.
  // forwarders {
  //  0.0.0.0;
  // };
  //========================================================================
  // If BIND logs error messages about the root key being expired,
  // you will need to update your keys.  See https://www.isc.org/bind-keys
  //========================================================================
  dnssec-enable yes;
  dnssec-validation auto;
  dnssec-lookaside auto;
  // listen on local IP 
  listen-on-v6 { ::1; };
  listen-on { 127.0.0.1; };
  // Uncomment the following to disable IPv6
  // filter-aaaa-on-v4 yes;
};
EOT

cat <<'EOT' > named.conf.local
//
// Do any local configuration here
//
// Consider adding the 1918 zones here, if they are not used in your
// organization
//include "/etc/bind/zones.rfc1918";
EOT

cat <<'EOT' > named.conf.default-zones
// prime the server with knowledge of the root servers
zone "." {
  type hint;
  file "/usr/local/etc/bind/root.hints";
};
// be authoritative for the localhost forward and reverse zones, and for
// broadcast zones as per RFC 1912
zone "localhost" {
  type master;
  file "/usr/local/etc/bind/db.local";
};
zone "127.in-addr.arpa" {
  type master;
  file "/usr/local/etc/bind/db.127";
};
zone "0.in-addr.arpa" {
  type master;
  file "/usr/local/etc/bind/db.0";
};
zone "255.in-addr.arpa" {
  type master;
  file "/usr/local/etc/bind/db.255";
};
EOT


cat <<'EOT' > root.hints
;       This file holds the information on root name servers needed to
;       initialize cache of Internet domain name servers
;       (e.g. reference this file in the "cache  .  <file>"
;       configuration file of BIND domain name servers).
;
;       This file is made available by InterNIC
;       under anonymous FTP as
;           file                /domain/named.cache
;           on server           FTP.INTERNIC.NET
;       -OR-                    RS.INTERNIC.NET
;
;       last update:     March 13, 2019
;       related version of root zone:     2019031302
;
; FORMERLY NS.INTERNIC.NET
;
.                        3600000      NS    A.ROOT-SERVERS.NET.
A.ROOT-SERVERS.NET.      3600000      A     198.41.0.4
A.ROOT-SERVERS.NET.      3600000      AAAA  2001:503:ba3e::2:30
;
; FORMERLY NS1.ISI.EDU
;
.                        3600000      NS    B.ROOT-SERVERS.NET.
B.ROOT-SERVERS.NET.      3600000      A     199.9.14.201
B.ROOT-SERVERS.NET.      3600000      AAAA  2001:500:200::b
;
; FORMERLY C.PSI.NET
;
.                        3600000      NS    C.ROOT-SERVERS.NET.
C.ROOT-SERVERS.NET.      3600000      A     192.33.4.12
C.ROOT-SERVERS.NET.      3600000      AAAA  2001:500:2::c
;
; FORMERLY TERP.UMD.EDU
;
.                        3600000      NS    D.ROOT-SERVERS.NET.
D.ROOT-SERVERS.NET.      3600000      A     199.7.91.13
D.ROOT-SERVERS.NET.      3600000      AAAA  2001:500:2d::d
;
; FORMERLY NS.NASA.GOV
;
.                        3600000      NS    E.ROOT-SERVERS.NET.
E.ROOT-SERVERS.NET.      3600000      A     192.203.230.10
E.ROOT-SERVERS.NET.      3600000      AAAA  2001:500:a8::e
;
; FORMERLY NS.ISC.ORG
;
.                        3600000      NS    F.ROOT-SERVERS.NET.
F.ROOT-SERVERS.NET.      3600000      A     192.5.5.241
F.ROOT-SERVERS.NET.      3600000      AAAA  2001:500:2f::f
;
; FORMERLY NS.NIC.DDN.MIL
;
.                        3600000      NS    G.ROOT-SERVERS.NET.
G.ROOT-SERVERS.NET.      3600000      A     192.112.36.4
G.ROOT-SERVERS.NET.      3600000      AAAA  2001:500:12::d0d
;
; FORMERLY AOS.ARL.ARMY.MIL
;
.                        3600000      NS    H.ROOT-SERVERS.NET.
H.ROOT-SERVERS.NET.      3600000      A     198.97.190.53
H.ROOT-SERVERS.NET.      3600000      AAAA  2001:500:1::53
;
; FORMERLY NIC.NORDU.NET
;
.                        3600000      NS    I.ROOT-SERVERS.NET.
I.ROOT-SERVERS.NET.      3600000      A     192.36.148.17
I.ROOT-SERVERS.NET.      3600000      AAAA  2001:7fe::53
;
; OPERATED BY VERISIGN, INC.
;
.                        3600000      NS    J.ROOT-SERVERS.NET.
J.ROOT-SERVERS.NET.      3600000      A     192.58.128.30
J.ROOT-SERVERS.NET.      3600000      AAAA  2001:503:c27::2:30
;
; OPERATED BY RIPE NCC
;
.                        3600000      NS    K.ROOT-SERVERS.NET.
K.ROOT-SERVERS.NET.      3600000      A     193.0.14.129
K.ROOT-SERVERS.NET.      3600000      AAAA  2001:7fd::1
;
; OPERATED BY ICANN
;
.                        3600000      NS    L.ROOT-SERVERS.NET.
L.ROOT-SERVERS.NET.      3600000      A     199.7.83.42
L.ROOT-SERVERS.NET.      3600000      AAAA  2001:500:9f::42
;
; OPERATED BY WIDE
;
.                        3600000      NS    M.ROOT-SERVERS.NET.
M.ROOT-SERVERS.NET.      3600000      A     202.12.27.33
M.ROOT-SERVERS.NET.      3600000      AAAA  2001:dc3::35
; End of file
EOT


cat <<'EOT' > zones.rfc1918
zone "10.in-addr.arpa"      { type master; file "/etc/bind/db.empty"; };
zone "16.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "17.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "18.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "19.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "20.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "21.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "22.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "23.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "24.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "25.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "26.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "27.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "28.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "29.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "30.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "31.172.in-addr.arpa"  { type master; file "/etc/bind/db.empty"; };
zone "168.192.in-addr.arpa" { type master; file "/etc/bind/db.empty"; };
EOT

cat <<'EOT' db.0
;
; BIND reverse data file for broadcast zone
;
$TTL  604800
@ IN  SOA localhost. root.localhost. (
            1   ; Serial
       604800   ; Refresh
        86400   ; Retry
      2419200   ; Expire
       604800 ) ; Negative Cache TTL
;
@ IN  NS  localhost.
EOT

cat <<'EOT' > db.127
;
; BIND reverse data file for local loopback interface
;
$TTL  604800
@ IN  SOA localhost. root.localhost. (
            1   ; Serial
       604800   ; Refresh
        86400   ; Retry
      2419200   ; Expire
       604800 ) ; Negative Cache TTL
;
@ IN  NS  localhost.
1.0.0 IN  PTR localhost.
EOT

cat <<'EOT' > db.255
;
; BIND reverse data file for broadcast zone
;
$TTL  604800
@ IN  SOA localhost. root.localhost. (
            1   ; Serial
       604800   ; Refresh
        86400   ; Retry
      2419200   ; Expire
       604800 ) ; Negative Cache TTL
;
@ IN  NS  localhost.
EOT

cat <<'EOT' > db.empty
;
; BIND reverse data file for empty rfc1918 zone
;
; DO NOT EDIT THIS FILE - it is used for multiple zones.
; Instead, copy it, edit named.conf, and use that copy.
;
$TTL  86400
@ IN  SOA localhost. root.localhost. (
            1   ; Serial
       604800   ; Refresh
        86400   ; Retry
      2419200   ; Expire
        86400 ) ; Negative Cache TTL
;
@ IN  NS  localhost.
EOT

cat <<'EOT' > db.local
;
; BIND data file for local loopback interface
;
$TTL  604800
@ IN  SOA localhost. root.localhost. (
            2   ; Serial
       604800   ; Refresh
        86400   ; Retry
      2419200   ; Expire
       604800 ) ; Negative Cache TTL
;
@ IN  NS  localhost.
@ IN  A 127.0.0.1
@ IN  AAAA  ::1
EOT


# Start/Enable service at boot:
sudo brew services start bind

# Check if service launched correctly:
sudo brew services list

# Should display:
#    Name Status  User File
#    bind started root /Library/LaunchDaemons/homebrew.mxcl.bind.plist

# If not, check the log file:
#    /usr/local/var/log/named/named.log

# If you get errors like: 
#    managed-keys-zone: DNSKEY set for zone '.' could not be verified with current keys
# or
#    validating ./NS: no valid signature found
#
# That's because cache files are somehow corrupted.
# (https://gitlab.isc.org/isc-projects/bind9/-/issues/2895)
# Make sure bind can send outgoing TCP/UDP requests on port 53.
# And before restarting the service, delete the cache files located in:
#    /usr/local/var/cache/bind/

# If you get errors like: 
#    host unreachable resolving '_.me/A/IN': 2001:503:ba3e::2:30#53
#
# Disable IPv6 support. Add option -4 to service startup in:
#    /usr/local/Cellar/bind/*/homebrew.mxcl.bind.plist
# And uncomment the relevant line in:
#    /usr/local/etc/bind/named.conf.options

# When everything runs correctly, test if the DNS resolution works:
dig A duckduckgo.com @127.0.0.1

# And finally, 
# you can set 127.0.0.1 as primary DNS server in MacOS network config.