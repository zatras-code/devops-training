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
