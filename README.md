#Crawler OffSec

Este é um crawler simples para recursos de segurança (OffSec) que utiliza o wget2 para verificar links e coletar URLs interessantes de um domínio ou subdomínio.

Descrição
O script verifica URLs fornecidas, identifica subdomínios e os lista em um arquivo, além de buscar por URLs adicionais. Ele foi projetado para facilitar a coleta de links de sites e suas páginas.

Pré-requisitos
Para rodar o script, você precisa ter o wget2 instalado em seu sistema. Caso não tenha o wget2 instalado, você pode instalá-lo com:

Para sistemas baseados em Debian/Ubuntu:
bash
Copiar
sudo apt update
sudo apt install wget2
Para sistemas baseados em Red Hat/CentOS:
bash
Copiar
sudo yum install wget2
Como usar
Passo 1: Baixe o script
Clone o repositório onde o script está armazenado (supondo que o repositório seja o git@github.com:usuario/repo.git):

bash
Copiar
git clone https://github.com/usuario/repo.git
cd repo
Ou, se preferir, crie um arquivo .sh e cole o script nele.

Passo 2: Torne o script executável
bash
Copiar
chmod +x crawler.sh
Passo 3: Execute o script
Para rodar o script, basta passar o domínio como parâmetro, como neste exemplo:

bash
Copiar
./crawler.sh example.com
Isso fará o script processar o domínio example.com, onde:

Ele irá varrer o site usando wget2 e buscar URLs.
Ele cria um arquivo de saída example.com.txt com os URLs coletados.
Depois, ele busca subdomínios e adiciona os resultados em outro arquivo example.com_full.txt.
Passo 4: Arquivos gerados
example.com.txt: Contém URLs encontradas durante o processo de varredura.
example.com_full.txt: Contém URLs completas e subdomínios descobertos durante a segunda varredura.
Como funciona
O script realiza as seguintes etapas:

Banner: Exibe uma mensagem personalizada com o nome do script e do desenvolvedor.

A função banner() exibe a seguinte saída:

diff
Copiar
+-+-+-+-+-+-+-+ +-+-+-+-+-+-+
|C|r|a|w|l|e|r| |O|f|f|S|e|c|
+-+-+-+-+-+-+-+ +-+-+-+-+-+-+
Desenvolvido por bl4dsc4n
Coleta de URLs: Usa o comando wget2 com a opção --spider para verificar o site e coletar os links encontrados, filtrando apenas as URLs com o comando grep e cut, e salva em um arquivo com o nome do domínio (por exemplo, example.com.txt).

O comando:

bash
Copiar
wget2 --spider -r ${1} |  grep "Adding URL:" | cut -d " " -f 3 | tee ${1}.txt
--spider: Apenas verifica o site, sem fazer o download dos arquivos.
-r: Faz a varredura recursiva para descobrir todas as páginas do site.
grep "Adding URL:": Filtra as URLs encontradas.
cut -d " " -f 3: Extrai a URL que aparece como o terceiro campo.
tee ${1}.txt: Salva a saída em um arquivo chamado ${1}.txt, onde ${1} é o domínio passado como argumento.
Identificação de Subdomínios: Usa grep -oP para capturar os subdomínios que pertencem ao domínio principal.

O comando:

bash
Copiar
URLS=$(cat ${1}.txt | grep -oP "\b([a-zA-Z0-9-]+\.)+${1}\b" | sort -u)
Captura subdomínios e URLs com o domínio especificado.
sort -u: Ordena e remove duplicatas.
Busca nos Subdomínios: Para cada subdomínio encontrado, o script faz uma nova varredura recursiva com wget2 e salva as URLs encontradas em example.com_full.txt.

O comando:

bash
Copiar
for i in $URLS; do
    wget2 --tries=1 --connect-timeout=10 --read-timeout=10 --timeout=20 --spider -r ${i} |  grep "Adding URL:" | cut -d " " -f 3 | tee ${1}_full.txt
done
--tries=1: Limita o número de tentativas para 1, para evitar tentativas repetidas.
--connect-timeout=10: Define o tempo limite de conexão.
--read-timeout=10: Define o tempo limite de leitura de dados.
--timeout=20: Define um tempo limite geral de 20 segundos para a execução.
Para cada URL ou subdomínio, o script coleta mais URLs e as adiciona ao arquivo de saída.

Exemplo de Saída
Quando você executa o script com o domínio example.com, ele pode gerar algo assim:

bash
Copiar
$ ./crawler.sh example.com
+-+-+-+-+-+-+-+ +-+-+-+-+-+-+
|C|r|a|w|l|e|r| |O|f|f|S|e|c|
+-+-+-+-+-+-+-+ +-+-+-+-+-+-+
Desenvolvido por bl4dsc4n
...

arquivos interessantes
example.com
sub1.example.com
sub2.example.com
...

Além disso, ele cria dois arquivos:

example.com.txt com URLs coletadas.
example.com_full.txt com subdomínios e URLs descobertos.
Considerações Finais
Certifique-se de ter o wget2 instalado antes de executar o script.
O script foi projetado para funcionar de forma simples e rápida, sem interação manual.
O tempo de execução pode variar dependendo do número de páginas e subdomínios encontrados.
