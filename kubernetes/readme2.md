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
