1. pod-hello-world.yaml

apiVersion: v1
kind: Pod
metadata:
  name: hello-world
spec:
  containers:
    - name: echoserver
      image: gcr.io/kubernetes-e2e-test-images/echoserver:2.2
      ports:
        - containerPort: 8080
<img width="1525" height="285" alt="изображение" src="https://github.com/user-attachments/assets/65901eeb-f307-4006-9d41-8d18a6c4b1ac" />
<img width="1549" height="700" alt="изображение" src="https://github.com/user-attachments/assets/b7283ba2-ecf1-4454-be89-86ca5a2e690c" />
2. pod-netology-web.yaml

apiVersion: v1
kind: Pod
metadata:
  name: netology-web
  labels:
    app: netology-web
spec:
  containers:
    - name: echoserver
      image: gcr.io/kubernetes-e2e-test-images/echoserver:2.2
      ports:
        - containerPort: 8080
service-netology-svc.yaml

apiVersion: v1
kind: Service
metadata:
  name: netology-svc
spec:
  selector:
    app: netology-web
  ports:
    - protocol: TCP
      port: 8080
      targetPort: 8080
<img width="1534" height="390" alt="изображение" src="https://github.com/user-attachments/assets/bbe83fec-8074-4c65-9013-d147ef4873f9" />
<img width="1526" height="702" alt="изображение" src="https://github.com/user-attachments/assets/5a5f2e89-d9f8-4512-baa2-1004ee6f137d" />
