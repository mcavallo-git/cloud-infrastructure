# ------------------------------------------------------------
#
#==--  new-erarp.com
#
server {
  listen 80;
  listen [::]:80;
  server_name ~^(?<subdomain>\w+\.)?new-erarp\.com$;
  access_log "/var/log/nginx/access_new-erarp.com.log" thin;
  return 302 https://twitter.com/newera_rp;
  include "/etc/nginx/nginx_error_locations.conf";
}


# ------------------------------------------------------------
### Enable NGINX Host
#
# DN="new-erarp.com"; NG="/etc/nginx/sites-available/${DN}.nginx"; echo "" > ${NG}; vi ${NG}; ln -sf ${NG} /etc/nginx/sites-enabled/${DN}; reload_nginx;
#
#
# ------------------------------------------------------------
### Remove Domain(s) & Revoke Certificate(s)
###   |--> Deletes NGINX Files & Symlinks
###   |--> Deletes LetsEncrypt Files
###   |--> Revokes Certificate thru LetsEncrypt (Invalidates the certificate on the Certificate-Authority's end)
#
# DN="new-erarp.com"; certbot certificates; certbot revoke --cert-path "/etc/letsencrypt/live/${DN}/fullchain.pem"; certbot delete --cert-name "${DN}"; find "/etc/letsencrypt/" -name "*${DN}*"; unlink "/etc/nginx/sites-enabled/${DN}"; rm "/etc/nginx/sites-available/${DN}".nginx; certbot certificates;
#
#
# ------------------------------------------------------------