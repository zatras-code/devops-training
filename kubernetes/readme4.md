1.
https://github.com/zatras-code/devops-training/blob/main/kubernetes/4/containers-data-exchange.yaml
<img width="1844" height="101" alt="изображение" src="https://github.com/user-attachments/assets/cd55255f-82c1-496a-88b0-48e415f5789e" />
<img width="1003" height="679" alt="изображение" src="https://github.com/user-attachments/assets/fd740eb7-9786-48a4-b045-015b2e75801a" />
<img width="1231" height="675" alt="изображение" src="https://github.com/user-attachments/assets/694bbefe-b01e-47ed-bf25-5da8e3735a6b" />
<img width="1228" height="153" alt="изображение" src="https://github.com/user-attachments/assets/aca54608-2a42-4564-8501-14ca8482d3be" />
<img width="1317" height="194" alt="изображение" src="https://github.com/user-attachments/assets/15bcb2cb-023f-42b1-846f-b1219b529453" />
2.
https://github.com/zatras-code/devops-training/blob/main/kubernetes/4/pv-pvc.yaml
<img width="1334" height="404" alt="изображение" src="https://github.com/user-attachments/assets/69bdd155-112b-4047-a172-f19ce57afa15" />
<img width="1233" height="135" alt="изображение" src="https://github.com/user-attachments/assets/4f4a39eb-4392-4422-bce8-5b32cd3da3ae" />
<img width="1245" height="328" alt="изображение" src="https://github.com/user-attachments/assets/56955371-cd56-452c-ae9f-85dcffc1363d" />
Ожидаемо PV стал Released, потому что у него политика:
persistentVolumeReclaimPolicy: Retain
То есть Kubernetes не удаляет данные автоматически.
Проверка файла на ноде:
<img width="950" height="278" alt="изображение" src="https://github.com/user-attachments/assets/c1e7dce9-7fa2-4f9d-9c0e-1e4794262c47" />
Файл останется. Причина: hostPath — это обычная папка на ноде, а удаление PV удаляет только объект Kubernetes, не саму директорию и не файл.
3.
https://github.com/zatras-code/devops-training/blob/main/kubernetes/4/sc.yaml
<img width="1377" height="531" alt="изображение" src="https://github.com/user-attachments/assets/2509891e-1780-408a-acf3-427eb5133c26" />
<img width="1003" height="709" alt="изображение" src="https://github.com/user-attachments/assets/ed5948af-9d8a-44c8-9dd9-d90b3f51ebea" />
<img width="1368" height="680" alt="изображение" src="https://github.com/user-attachments/assets/67e7bcb3-0bea-4fbd-9c10-5bd77aec2793" />
<img width="1511" height="215" alt="изображение" src="https://github.com/user-attachments/assets/715126c8-5cb3-445a-a943-d185be9f0089" />
<img width="1137" height="204" alt="изображение" src="https://github.com/user-attachments/assets/6f840d14-fb72-44a3-8662-2e7bd2c13756" />
