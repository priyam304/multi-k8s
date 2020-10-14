
docker build -t priyam304/multi-client:latest -t priyam304/multi-client:$GIT_COMMIT -f ./client/Dockerfile ./client 
docker build -t priyam304/multi-server:latest -t priyam304/multi-server:$GIT_COMMIT -f ./server/Dockerfile ./server 
docker build -t priyam304/multi-worker:latest -t priyam304/multi-worker:$GIT_COMMIT -f ./worker/Dockerfile ./worker 

docker push priyam304/multi-client:latest
docker push priyam304/multi-server:latest
docker push priyam304/multi-worker:latest

docker push priyam304/multi-client:$GIT_COMMIT
docker push priyam304/multi-server:$GIT_COMMIT
docker push priyam304/multi-worker:$GIT_COMMIT

kubectl apply -f k8s

kubectl set image deployment/client-deployment client=priyam304/multi-client:$GIT_COMMIT
kubectl set image deployment/server-deployment server=priyam304/multi-server:$GIT_COMMIT
kubectl set image deployment/worker-deployment worker=priyam304/multi-worker:$GIT_COMMIT

