#!/bin/bash

apt update -y

apt install nginx -y

systemctl start nginx

systemctl enable nginx


cat <<EOF > /var/www/html/index.html
<html>
<head>
<title>HUG Week Three Terraform Challenge</title>
</head>

<body>

<h1>Two Tier Application Deployment</h1>

<p>Deployed using Terraform on AWS</p>

<p>HUG Lagos/Ibadan Terraform Challenge Week Three</p>

</body>
</html>
EOF
