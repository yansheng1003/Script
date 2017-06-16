#!/usr/bin/env sh

/root/.acme.sh/acme.sh --issue --dns dns_dp -d jlong.win -d www.jlong.win --force

/root/.acme.sh/acme.sh --install-cert -d jlong.win \
--key-file       /etc/ssl/nginx/jlong.win.key  \
--ca-file        /etc/ssl/nginx/jlong.win.ca  \
--fullchain-file /etc/ssl/nginx/jlong.win.fullchain.cer \
--cert-file      /etc/ssl/nginx/jlong.win.cer \
--reloadcmd "systemctl reload nginx.service"
