# Google Analytics - Merchandising Store

Inicialmente, a ideia era consultar o banco de dados do google merchandising store utilizando SQL e obter, em cada linha, **um cliente que converteu**.

As colunas obtidas deveriam conter as informações:
* Sessões; 
* Sessões conversoras;
* Quantidade de transações;
* Receita;
* Receita média por transação;
* Data da última transação;

Ao analisar as 3 tabelas, pude observar que conseguiria obter tudo utilizando apenas a tabela "sessions".

Após a consulta, criei um notebook para fazer uma análise exploratória e uma modelagem de modo a clusterizar os clientes da base.

Assim, obtive, através do método do cotovelo, que o número ótimo de clusters seria de 6, porém, ao fazer o score da silhueta, obtive 2 clusters. Fiz então a modelagem com 6, 2 e 3 clusters. 3 clusters foi um palpite próprio apenas para checagem e validação. 3 clusters apresentou 2 grupos muito semelhantes a modelagem com 6, assim, utilizei a modelagem com 6 clusters, mas a de 3 também poderia ser utilizada a depender da área responsável na empresa.

A interpretação dos grupos obtidos na modelagem com 6 clusters foi: 

* Grupo 1 - 355 clientes — **Decididos de fim de ano.** Visitam pouco, compram pouco e de baixo valor e aparecem mais no fim do ano.
    - Número de sessões entre 1 e 20 - Baixo; 
    - apenas 1 ou 2 sessões conversoras - Baixo; 
    - 1 ou 2 transações - Baixo; 
    - soma das receitas entre 0 e ~800 - Baixo; 
    - média das receitas até ~650 - Baixo e; 
    - compras mais para o fim do ano, entre os meses 7 e 12;
    
    
* Grupo 2 - 300 clientes — **Decididos do início ao meio do ano.** Visitam pouco, compram pouco e de baixo valor e aparecem mais no fim do ano.: 
    - Semelhante ao grupo 1, porém a compra ocorre entre os meses 1 e 6.
    
    
* Grupo 3 - 2 clientes — **Muitas compras em muitas sessões com número médio de visitas** Número médio de visitas porém alta conversão. Alta quantidade de transações e receita alta: 
    - Número de sessões em torno de 30 - Segundo mais alto; 
    - sessões conversoras entre 7 e 8 - O mais alto; 
    - em torno de 8 transações - O mais alto;
    - soma das receitas mais alta, por volta de 5500; 
    - média das receitas por volta de 700 e; 
    - compras em torno do meio do ano, mês 6.
    
    
* Grupo 4 - 27 clientes — **Visitam pouco mas convertem bem, porém com receita mais baixa que os grupos 4 e 5. Compram ao longo do ano**: 
    - Sessões entre 1 e 25 - Mais baixo que o grupo 3 e mais alto que 1 e 2; 
    - sessões conversoras entre 1 e 4 - Conversão na média;
    - transações entre 3 e 6 - Aparenta que sempre que convertem realizam apenas 1 transação;
    - soma de receitas entre ~1 e ~2200 - Maior que 1 e 2 e menor que 3;
    - media de receitas entre ~1 e 700 e - Maior que 1 e 2 e menor que 3;
    - compras distribuídas ao longo do ano, podendo ir do mês 2 ao 12.
    
    
* Grupo 5 - 15 clientes **Poucas conversões porém valor de compra alto**:
    - Número de sessões até 20;
    - sessões conversoras em torno de 1, porém vão até 3;
    - quantidade de transações até 3;
    - soma de receitas de 1000 a 4000;
    - Maior média de receitas - provavelmente por conta de compras de alto valor com apenas 1 transação e;
    - Compras ao longo do ano todo.
    
    
* Grupo 6 - 3 clientes **Indecisos. Muitas visitas para poucas conversões**:
    - Número de sessões entre 100 e 160;
    - conversões entre 1 e 5;
    - transações entre 1 e 5; 
    - soma das receitas até ~2200;
    - média de receitas até 500;
    - compras entre mês 2 e 10.

A campanha proposta foi:

Com a demonstração dos grupos acima, acredito que os melhores alvos para uma primeira campanha seriam os grupos 1 e 2 que, além de possuir o maior número de clientes, convertem pouco e normalmente não visitam mais o e-commerce.

A ideia seria realizar uma campanha de marketing para reter estes clientes e torná-los recorrentes, comprando mais de uma vez e visitando mais o e-commerce ao longo do ano. Pode-se, também, levar em conta a sazonalidade destes grupos. O grupo 1 compra mais no fim do ano e o 2 mais no início. A ideia seria fazê-los comprar ao longo do ano todo.