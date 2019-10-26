docker build -t evandam93/multi-client:latest -t evandam93/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t evandam93/multi-server:latest -t evandam93/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t evandam93/multi-worker:latest -t evandam93/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push evandam93/multi-client:latest
docker push evandam93/multi-server:latest
docker push evandam93/multi-worker:latest

docker push evandam93/multi-client:$SHA
docker push evandam93/multi-server:$SHA
docker push evandam93/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=evandam93/multi-client:$SHA
kubectl set image deployments/server-deployment server=evandam93/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=evandam93/multi-worker:$SHA