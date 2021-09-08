kubectl delete -f ./srcs/nginx/nginx.yaml
kubectl delete -f ./srcs/wordpress/wordpress.yaml
kubectl delete -f ./srcs/phpmyadmin/php.yaml
kubectl delete -f ./srcs/mysql/mysql.yaml
kubectl delete -f ./srcs/ftps/ftps.yaml
kubectl delete -f ./srcs/influxdb/influxdb.yaml
# kubectl delete -f configmap.yaml
minikube delete
