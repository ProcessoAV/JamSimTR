# JamSimTR - Jamming Simulator (Tecnologia de Redes)

---

## 🧱 Como funciona a pilha no OMNeT++

| Camada          | O que faz                           | Exemplo no ecossistema OMNeT++                  |
| --------------- | ----------------------------------- | ----------------------------------------------- |
| **Engine base** | Simulador de eventos                | **OMNeT++**                                     |
| **Protocolos**  | Modelos de redes reais              | **INET** para Wi‑Fi, TCP/IP, Ethernet, ZigBee…  |
| **IoT/LoRa**    | Modelos específicos                 | **FLoRa** (LoRaWAN), **Castalia** (sensor nets) |
| **Extensões**   | Coisas como jamming, rádio realista | Parte do INET ou adicionadas por você           |

---

## 🔗 Então o que é cada componente?

### ✅ **OMNeT++**

* Núcleo do simulador: engine de eventos + IDE + visualização.
* Permite definir topologias, eventos, módulos, mas **não vem com Wi-Fi, LoRa ou redes reais prontas**.

### ✅ **INET Framework**

* Biblioteca essencial.
* Adiciona:

  * 📶 Wi-Fi (802.11a/b/g/n/ac)
  * 🌐 TCP/IP, UDP, IPv4/IPv6, Ethernet
  * 📡 Zigbee (IEEE 802.15.4)
  * 📊 Camadas de aplicação (VoIP, FTP, HTTP, etc.)
  * 📟 Rádio realista, ruído, mobilidade, interferência
* É **mantido ativamente**, super necessário para qualquer rede moderna.

### ✅ **FLoRa**

* Framework que adiciona **LoRaWAN** ao OMNeT++.
* Modela gateways, dispositivos, ADR, energia, MAC uplink/downlink, etc.
* **Se integra ao INET** (usa a física de rádio do INET).
* Código: [https://github.com/signetlabdei/FLORA](https://github.com/signetlabdei/FLORA)

---

## 📦 Resumo de como montar seu ambiente

| Componente       | Versão sugerida                      | Link                                                                             |
| ---------------- | ------------------------------------ | -------------------------------------------------------------------------------- |
| OMNeT++          | 6.0 ou 5.6.2                         | [https://omnetpp.org/](https://omnetpp.org/)                                     |
| INET Framework   | compatível com sua versão do OMNeT++ | [https://github.com/inet-framework/inet](https://github.com/inet-framework/inet) |
| FLoRa            | Última versão (integra com INET)     | [https://github.com/signetlabdei/FLORA](https://github.com/signetlabdei/FLORA)   |
