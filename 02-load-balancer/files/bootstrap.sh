#!/bin/sh
yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd

mkdir -p /var/www/html
chown -R $USER:$USER /var/www/html
chmod -R 755 /var/www

echo "<html>
  <head>
    <title>Welcome!</title>
  </head>
  <body>
    <h1>Success!</h1>
    The Google Compute Instance running behind load balancer is working!
  </body>
</html>" > /var/www/html/index.html
