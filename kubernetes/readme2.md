1.Ошибка обычно в том, что nginx и multitool оба хотят порт 80 внутри одного Pod. Поэтому для multitool задаём HTTP_PORT=8080.
deployment-multitool-nginx.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: multitool-nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: multitool-nginx
  template:
    metadata:
      labels:
        app: multitool-nginx
    spec:
      containers:
        - name: nginx
          image: nginx:1.25
          ports:
            - containerPort: 80
        - name: multitool
          image: wbitt/network-multitool
          env:
            - name: HTTP_PORT
              value: "8080"
            - name: HTTPS_PORT
              value: "8443"
          ports:
            - containerPort: 8080
<img width="1828" height="60" alt="image" src="https://github.com/user-attachments/assets/87016d34-daaa-4a6f-b770-03000e55beeb" />
<img width="1826" height="98" alt="image" src="https://github.com/user-attachments/assets/6b98738e-002f-4e4d-b56b-b5ecb3841583" />
<img width="1842" height="222" alt="image" src="https://github.com/user-attachments/assets/051a7df4-230d-4737-885b-7318c5f86f83" />
service-multitool-nginx.yaml

apiVersion: v1
kind: Service
metadata:
  name: multitool-nginx-svc
spec:
  selector:
    app: multitool-nginx
  ports:
    - name: nginx
      port: 80
      targetPort: 80
    - name: multitool
      port: 8080
      targetPort: 8080
<img width="1832" height="212" alt="image" src="https://github.com/user-attachments/assets/7aa6e8a6-fa20-4758-b483-6280654d3b52" />
pod-curl.yaml

apiVersion: v1
kind: Pod
metadata:
  name: curl-pod
spec:
  containers:
    - name: multitool
      image: wbitt/network-multitool
      command: ["sleep", "3600"]
<img width="1836" height="62" alt="image" src="https://github.com/user-attachments/assets/d55e4926-7b88-438e-a356-8bd9e78dd6ef" />
<img width="1850" height="782" alt="image" src="https://github.com/user-attachments/assets/13ca6002-1e98-4247-ae2e-3a8c4c076190" />
<img width="1834" height="126" alt="image" src="https://github.com/user-attachments/assets/ed40b243-6ec1-4c6a-affb-ae630594fd9c" />
2. deployment-init-nginx.yaml

apiVersion: apps/v1
kind: Deployment
metadata:
  name: init-nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: init-nginx
  template:
    metadata:
      labels:
        app: init-nginx
    spec:
      initContainers:
        - name: wait-service
          image: busybox:1.36
          command:
            - sh
            - -c
            - |
              until nslookup init-nginx-svc; do
                echo "Waiting for service init-nginx-svc..."
                sleep 5
              done
      containers:
        - name: nginx
          image: nginx:1.25
          ports:
            - containerPort: 80
<img width="1838" height="298" alt="image" src="https://github.com/user-attachments/assets/96b199f1-09e4-449b-95d9-087ad0d960c7" />
<img width="1694" height="752" alt="image" src="https://github.com/user-attachments/assets/704f93a2-a609-4604-8da7-e9df47fcb7bf" />
<img width="1616" height="738" alt="image" src="https://github.com/user-attachments/assets/69d47f09-0224-41b5-8621-30bf1574c435" />
<img width="1598" height="520" alt="image" src="https://github.com/user-attachments/assets/2a02cea1-3de9-4981-9674-6887d83880e1" />
