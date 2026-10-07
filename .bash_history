hostnamectl set-hostname webhost
sudo -i
clear
ls
ls
ls -al
pwd
cd~
cd ~
ls
cd frontend/
ls
vi src/App.css
clear
npm run build
sudo dnf install nginx -y
sudo systemctl enable nginx
clear
sudo systemctl start nginx
sudo rm -rf /usr/share/nginx/html/*
sudo cp -r build/* /usr/share/nginx/html/
sudo vi /etc/nginx/conf.d/app.conf
server {
    listen 80;
    server_name _;
    root /usr/share/nginx/html;
    index index.html;
    location / {
        try_files $uri /index.html;
    }
    location /api/ {
        proxy_pass http://127.0.0.1:3000/;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
sudo rm -f /etc/nginx/conf.d/default.conf
sudo nginx -t
sudo systemctl restart nginx
clear
vi src/App.js
npm run build
sudo cp -r build/* /usr/share/nginx/html/
sudo systemctl restart nginx
pm2 logs backend
clear
curl http://localhost:3000/products
cler
clear
node server.js
ls
cd backend/
ls
cd server.js
cd server.js/
clea
vi server.js 
node server.js
clear
curl http://localhost:3000/products
curl http://localhost:3000/products
clear
curl http://localhost:3000/products
hi
llg
clear
sudo -i
clear
curl http://localhost:3000/products
curl http://localhost:3000/products
ls
sudo -i
ls
cd backend/
grep -R "app.use\|app.get\|router" /path/to/backend
clear
grep -R "app.use\|app.get\|router" . --exclude-dir=node_modules
clear
curl http://localhost:3000
