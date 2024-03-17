server {
    server_name whitewater.pp.ua;

    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        
			proxy_pass http://127.0.0.1:10987;
			proxy_set_header Host $http_host;
           proxy_set_header X-Real-IP $remote_addr;
           proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;

           proxy_set_header X-Forwarded-Proto https;
           proxy_set_header X-Forwarded-Protocol https;
           proxy_set_header X-Url-Scheme https;
           proxy_set_header X-Forwarded-Ssl on;

           proxy_read_timeout 90;
           client_max_body_size 0;
           gzip off;
           proxy_http_version 1.1;
    }

    #error_page  404              /404.html;

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }



    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/whitewater.pp.ua/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/whitewater.pp.ua/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}


server {
    if ($host = whitewater.pp.ua) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    server_name whitewater.pp.ua;
    listen 80;
    return 404; # managed by Certbot


}
