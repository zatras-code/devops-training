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
2. 
