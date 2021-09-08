minikube start --vm-driver=virtualbox --memory 4096
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f configmap.yaml
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
docker build -t wp_image ./srcs/wordpress
kubectl apply -f ./srcs/wordpress/wordpress.yaml
docker build -t php_image ./srcs/phpmyadmin
kubectl apply -f ./srcs/phpmyadmin/php.yaml
docker build -t mysql_image ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml
docker build -t ftps_image ./srcs/ftps
kubectl apply -f ./srcs/ftps/ftps.yaml
docker build -t influxdb_image ./srcs/influxdb
kubectl apply -f ./srcs/influxdb/influxdb.yaml
docker build -t grafana_image ./srcs/grafana
kubectl apply -f ./srcs/grafana/grafana.yaml
