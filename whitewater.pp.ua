server {
    listen       80;
    server_name whitewater.pp.ua;

    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        proxy_pass http://whitewater.pp.ua:7000;
		proxy_set_header Host $host;
    }

    #error_page  404              /404.html;

    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
   
}