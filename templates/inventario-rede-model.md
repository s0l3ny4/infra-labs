# 🗂️ Modelo de Inventário de Rede

Este é um modelo completo e profissional de inventário de rede para uso em documentação de infraestrutura. Copie, preencha e utilize como padrão no seu repositório.

---

## 🔎 **1. Informações Gerais da Rede**

* **Empresa:**
* **Responsável pela documentação:**
* **Data da última atualização:**
* **Localidade / Unidade:**
* **Descrição geral da infraestrutura:**

---

## 🌐 **2. Endereçamento IP (IPv4/IPv6)**

| Sub-rede     | Máscara | Gateway      | VLAN    | Descrição           | Observações |
| ------------ | ------- | ------------ | ------- | ------------------- | ----------- |
| 192.168.0.0  | /24     | 192.168.0.1  | VLAN 10 | Rede Administrativa |             |
| 192.168.1.0  | /24     | 192.168.1.1  | VLAN 20 | Usuários            |             |
| 192.168.50.0 | /24     | 192.168.50.1 | VLAN 30 | Wi-Fi Visitantes    |             |

---

## 🧱 **3. VLANs**

| VLAN ID | Nome  | Descrição     | Observações             |
| ------- | ----- | ------------- | ----------------------- |
| 10      | ADM   | Administração |                         |
| 20      | USERS | Usuários      |                         |
| 30      | GUEST | Visitantes    | Isolada                 |
| 99      | MGMT  | Gerenciamento | Apenas rede de switches |

---

## 🖥️ **4. Servidores**

| Nome        | IP           | Sistema        | Função      | Localização | Hardware      | Status |
| ----------- | ------------ | -------------- | ----------- | ----------- | ------------- | ------ |
| SRV-AD-01   | 192.168.0.10 | Windows Server | AD DS / DNS | CPD         | VM - 8GB RAM  | OK     |
| SRV-FILE-01 | 192.168.0.20 | Linux          | File Server | CPD         | Físico - 16GB | OK     |

---

## 🔧 **5. Switches**

| Nome  | Modelo     | IP de Gerência | Portas | VLANs       | Local    | Observações |
| ----- | ---------- | -------------- | ------ | ----------- | -------- | ----------- |
| SW-01 | Cisco 2960 | 192.168.99.2   | 48     | 10/20/30/99 | Rack CPD |             |
| SW-02 | HP 2530    | 192.168.99.3   | 24     | 20/30/99    | Sala 203 |             |

---

## 📡 **6. Roteadores / Firewalls**

| Nome  | Modelo        | IP          | Função          | Regras Importantes      | Observações |
| ----- | ------------- | ----------- | --------------- | ----------------------- | ----------- |
| FW-01 | Fortigate 60E | 192.168.0.1 | Firewall + DHCP | Bloqueio de portas, NAT |             |

---

## 📶 **7. Access Points (Wi-Fi)**

| Nome  | Modelo        | IP            | SSIDs        | VLAN  | Local    | Observações |
| ----- | ------------- | ------------- | ------------ | ----- | -------- | ----------- |
| AP-01 | UniFi AC Pro  | 192.168.99.20 | Corp / Guest | 20/30 | Recepção |             |
| AP-02 | UniFi AC Lite | 192.168.99.21 | Corp         | 20    | Sala 105 |             |

---

## 🖥️ **8. Estações / Equipamentos de Usuários**

| Nome/Usuário | IP   | MAC               | Local      | Sistema    | Observações |
| ------------ | ---- | ----------------- | ---------- | ---------- | ----------- |
| PC-Jose      | DHCP | AA:BB:CC:DD:EE:FF | Financeiro | Windows 10 |             |

---

## 🖨️ **9. Impressoras**

| Nome   | IP           | Modelo      | Local    | Método de Instalação | Observações |
| ------ | ------------ | ----------- | -------- | -------------------- | ----------- |
| PRN-01 | 192.168.1.50 | HP LaserJet | Sala 102 | TCP/IP               |             |

---

## 🔐 **10. Credenciais de Acesso (Armazenar em Cofre, não aqui!)**

> ⚠️ **NÃO ARMAZENAR SENHAS AQUI.**
> Registrar apenas onde estão armazenadas:

* **Gestão de senhas:** Bitwarden / Vaultwarden / KeePass / outro
* **Responsável:**

---

## 📁 **11. Documentos Relacionados**

* Diagrama lógico: `diagramas/rede-logica.png`
* Diagrama físico: `diagramas/rede-fisica.png`
* Lista de patch panels
* Roteiro de contingência
* Planilha de backup dos equipamentos

---

## 📝 **12. Histórico de Alterações**

| Data       | Responsável | Alteração             |
| ---------- | ----------- | --------------------- |
| 2025-01-01 | Guilherme   | Criação do inventário |
| 2025-01-20 | Admin       | Atualização dos IPs   |

---


