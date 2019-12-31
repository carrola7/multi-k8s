docker build -t carrola7/multi-client:latest -t carrola7/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t carrola7/multi-server:latest -t carrola7/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t carrola7/multi-worker:latest -t carrola7/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push carrola7/multi-client:latest
docker push carrola7/multi-client:$SHA
docker push carrola7/multi-server:latest
docker push carrola7/multi-server:$SHA
docker push carrola7/multi-worker:latest
docker push carrola7/multi-worker:$SHA
kubectl appy -f k8s
kubectl set image deployments/server-deployment server=carrola7/multi-server:$SHA
kubectl set image deployments/client-deployment client=carrola7/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=carrola7/multi-worker:$SHA

