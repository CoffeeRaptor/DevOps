module "ec2_instance" {
  source = "D:/fundamentals-of-devops/Infrastructure/modules/EC2"

  user_data = <<-EOT
    set -e
    curl -fsSL https://rpm.nodesource.com/setup_21.x | bash -
    yum install -y nodejs
    tee app.js > /dev/null << "EOF"
    const http = require('http');
    const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    res.end('Hello, World!\n');
    });
    const port = process.env.PORT || 80;
    server.listen(port,() => {
    console.log(`Listening on port $port`);
    });
    EOF
    nohup node app.js &
    EOT

  additional_tags = {
    environment = "playground"
  }
}