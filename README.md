# Crawler OffSec

![image](https://github.com/user-attachments/assets/c3a76832-9c79-448f-8e0d-2f03a3a96832)

![image](https://github.com/user-attachments/assets/ae1d707b-9445-40fb-a862-7978aec200fb)

![image](https://github.com/user-attachments/assets/78645fc9-c898-4718-be19-3e45194e2e22)


# Descrição
Este crawler  foi desenvolvido para automatizar o processo de varredura de websites e subdomínios, coletando URLs importantes que podem ser úteis para testes de segurança e auditorias. Ele utiliza o wget2, uma ferramenta rápida e robusta para baixar e verificar sites de forma eficiente.

# Funcionalidades
- Varredura Recursiva: O script utiliza o wget2 com a opção --spider para realizar a varredura de um site e identificar links internos.
- Identificação de Subdomínios: Ele detecta subdomínios e URLs interessantes que pertencem ao domínio principal.
- Armazenamento de Resultados: Os URLs coletados são salvos em arquivos .txt para análise posterior.

# Pré-requisitos
Para rodar o script, você precisa ter o wget2 instalado em seu sistema. Caso não tenha o wget2 instalado, você pode instalá-lo com:

# Para sistemas baseados em Debian/Ubuntu:
- sudo apt update
- sudo apt install wget2

# Como usar

Passo 1: Baixe o script

Clone o repositório onde o script está armazenado:
- git clone https://github.com/carlosalbertotuma/crawler-offsec.git
- cd crawler-offsec
- Ou, se preferir, crie um arquivo .sh e cole o script nele.

Passo 2: Torne o script executável
- chmod +x crawler-offsec.sh

Passo 3: Execute o script
Para rodar o script, basta passar o domínio como parâmetro, como neste exemplo:

- ./crawler-offsec.sh example.com

Isso fará o script processar o domínio example.com, onde:

- Ele irá varrer o site usando wget2 e buscar URLs.
- Ele cria um arquivo de saída example.com.txt com os URLs coletados.
- Depois, ele busca subdomínios e adiciona os resultados em outro arquivo example.com_full.txt.

Passo 4: Arquivos gerados

- example.com.txt: Contém URLs encontradas durante o processo de varredura.
- example.com_full.txt: Contém URLs completas e subdomínios descobertos durante a segunda varredura.


Utilize-o com responsabilidade e somente em ambientes que você tem autorização para testar.

## 🤝 Colaboradores

Agradecemos às seguintes pessoas que contribuíram para este projeto:

Desenvolvido por Carlos Tuma - Bl4dSc4n


## 📝 Licença

Esse projeto está sob é de livre uso e modificação, favor manter os créditos em comentário.
 
Ps. não utilize para crimes ciberneticos, não tenho responsábilidade do mau uso da ferramenta.

[⬆ Voltar ao topo](#nome-do-projeto)<br>


