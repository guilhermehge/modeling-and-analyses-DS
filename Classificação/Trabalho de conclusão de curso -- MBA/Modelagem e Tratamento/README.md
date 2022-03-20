# Trabalho de Conclusão de Curso -- MBA Analytics Data Science FIA

## Modelagem e tratamento das variáveis

### Modelagens Iniciais

Comecei fazendo a modelagem pela modelagem estatística. Inicialmente fiz a modelagem utilizando as variáveis "Idade" e "Tempo de alta ou óbito" como numéricas e todas as outras variáveis como categóricas ou dummies. Além disso, nesta etapa, ainda não havia removido os ignorados e nulos da base. Notebook em questão: [Modelagem_2020_2021-arvore.ipynb](https://github.com/guilhermehge/Analises-e-modelagens-Data-Science/blob/main/Classifica%C3%A7%C3%A3o/Trabalho%20de%20conclus%C3%A3o%20de%20curso%20--%20MBA/Modelagem%20e%20Tratamento/Modelagens%20iniciais/Modelagem_2020_2021-arvore.ipynb)

A base utilizada neste notebook está no [link](https://drive.google.com/file/d/1Zz1AvOq5OvluWcqoCJyTUPyxfyYhjrOK/view?usp=sharing).

Escolhi o modelo de árvore para modelar e, como resultado, segue o "feature importance" do modelo base:

![feature_importance1](feat_import_com_ig_null_1.png)

É possível observar que "Idade" e "Tempo de alta ou óbito" possuem uma forte importância no modelo, porém, como são variáveis numéricas e possuem alta cardinalidade, ou seja, possibilitam infinitas quebras, naturalmente seriam já classificadas como variáveis de alta importância, conforme indica a [documentação da árvore de decisão do sklearn](https://scikit-learn.org/stable/modules/generated/sklearn.tree.DecisionTreeClassifier.html#:~:text=Warning%3A%20impurity%2Dbased%20feature%20importances%20can%20be%20misleading%20for%20high%20cardinality%20features). Além disso, é possível observar que aparecem classes "Ignorado" e "Nulo" no gráfico de feature importance, o que dificulta a interpretabilidade dos resultados. O restante do notebook é uma tentativa de otimizar alguns hiperparâmetros do modelo sem utilizar técnicas avançadas, uma vez que era a proposta da entrega, porém os problemas acima dificultavam continuar utilizando o banco de dados da forma que estava.

Desse modo, decidi, inicialmente, por transformar as variáveis "Idade" e "Tempo de alta ou óbito" em categóricas e modelar a partir disso. Notebook em questão: [Modelagem_idade_tempo_alta_cat_2020_2021.ipynb](https://github.com/guilhermehge/Analises-e-modelagens-Data-Science/blob/main/Classifica%C3%A7%C3%A3o/Trabalho%20de%20conclus%C3%A3o%20de%20curso%20--%20MBA/Modelagem%20e%20Tratamento/Modelagens%20iniciais/Modelagem_idade_tempo_alta_cat_2020_2021.ipynb).

O feature importance do modelo base então foi:

![feature_importance2](feat_import_idade_tempo_cat.png)

Observa-se que agora temos idosos com alta importância e o tempo de alta ou óbito diminuiu sua importância, o que confirma o viés da alta cardinalidade das variáveis. Apesar de ser uma evolução, ainda conseguimos ver categorias de "Ignorado" no gráfico, o que dificulta a interpretabilidade do modelo. O restante do notebook segue na mesma linha do anterior.

### Modelagens Finais (estatísticas)

**Árvore de decisão**

Com os conhecimentos adquiridos acima, removi os "Ignorados" e "Nulos" da base e transformei "Idade" e "Tempo de alta e óbito" em variáveis categóricas, ou, no caso, dummies.

A modelagem estatística final está no notebook [Modelagem_estatistica_remove_ignorado_nulo.ipynb](https://github.com/guilhermehge/Analises-e-modelagens-Data-Science/blob/main/Classifica%C3%A7%C3%A3o/Trabalho%20de%20conclus%C3%A3o%20de%20curso%20--%20MBA/Modelagem%20e%20Tratamento/Modelagens%20finais/Modelagem_estatistica_remove_ignorado_nulo.ipynb).
A base utilizada neste notebook está no [link](https://drive.google.com/file/d/1Zz-RguE30varxOTv3QXkM0wTmmaPP1ho/view?usp=sharing).

O feature importance do obtido do modelo base foi:

![feature_importance3](feat_import_sem_ignull.png)

Observa-se que agora as variáveis do gráfico são bem diferentes dos anteriores. Conseguimos ver que alguns sintomas e comorbidades são fatores cruciais na montagem da árvore para a determinação do óbito ou da alta. Os idosos seguem com forte importância também, assim como o diagnóstico de COVID em si.

Com os resultados satisfatórios, decidi por continuar esta modelagem e modificar os hiperparâmetros da árvore, porém, nesta etapa do trabalho, não poderia utilizar técnicas mais avançadas de tunning. No caso, utilizei loops básicos para testar a profundidade das árvores e o número de amostras em cada folha (min_samples_leaf).

Os resultados obtidos foram

Profundidade:

![profundidade](profundidade_arvore.png)

min_samples_leaf:

![min_samples_leaf](min_samples_leaf.png)

Desse modo, um valor de 10 para a profundidade é um valor bom pois é o ponto em que o AUC do teste começa a cair e gera uma árvore relativamente legível, já que temos 36 variáveis sendo modeladas. Já o min_samples_leaf de 100 parece ser um bom valor, já que os AUC só caem com o aumento deste valor.

A árvore final está no arquivo [tree_10_100_semignull.pdf](https://github.com/guilhermehge/Analises-e-modelagens-Data-Science/blob/main/Classifica%C3%A7%C3%A3o/Trabalho%20de%20conclus%C3%A3o%20de%20curso%20--%20MBA/Modelagem%20e%20Tratamento/Modelagens%20finais/tree_10_100_semignull.pdf)

Os resultados do modelo com os hiperparâmetros ajustados foram:

* Acurácia: 0,75
* Sensibilidade: 0,77
* Especificidade: 0,74
* Precisão: 0,57
* F1: 0,66

O feature importance do modelo segue abaixo:

![feature_importance4](feat_import_10_100.png)

Observamos que o uso de suporte ventilatório invasivo é a variável mais importante do modelo seguido de ida para a UTI e idade de 75 a 121 anos. Vemos também que algumas comorbidades aparecem juntamente com alguns sintomas e a vacina da COVID19.

O gráfico SHAP do modelo é:

![SHAP1](SHAP_10_100.png)

Com o gráfico SHAP conseguimos ter uma noção melhor de como cada variável influencia no modelo em ordem de importância.

A variável "Suporte ventilatório invasivo" é a mais importante na determinação do óbito do paciente. Conseguimos ver também que ir a UTI, ter idade acima de 63 anos, diagnóstico de COVID, baixa satuação, desconforto respiratório, **não vacinar contra COVID19**, problemas renais, imunodepressão, entre outras comorbidades, corroboram com o óbito do paciente de SRAG.

Em seguida, tentei alterar o ponto de corte do modelo, porém os resultados não mudaram muito.

**Regressão Logística**

A regressão logística traz os coeficientes de cada variável inserida no modelo, com isto, podemos utilizar a equação da regressão logística para determinar a chance de óbito de um paciente. Os coeficientes obtidos com o modelo tunado podem ser vistos na apresentação [TCC-FIA-GuilhermeElias.pptx](https://github.com/guilhermehge/Analises-e-modelagens-Data-Science/blob/main/Classifica%C3%A7%C3%A3o/Trabalho%20de%20conclus%C3%A3o%20de%20curso%20--%20MBA/Apresenta%C3%A7%C3%A3o%20PowerPoint/TCC-FIA-GuilhermeElias.pptx).

Os resultados do modelo foram:

* Acurácia: 0,77
* Sensibilidade: 0,75
* Especificidade: 0,77
* Precisão: 0,59
* F1: 0,66

Resultados próximos ao da árvore de decisão. Como a árvore é um modelo com melhor interpretabilidade, é preferível frente a regressão logística do ponto de vista de negócio.

### Modelagens Finais (aprendizado de máquina)

Notebook em questão: [Modelagem_Auto_ML.ipynb](https://github.com/guilhermehge/Analises-e-modelagens-Data-Science/blob/main/Classifica%C3%A7%C3%A3o/Trabalho%20de%20conclus%C3%A3o%20de%20curso%20--%20MBA/Modelagem%20e%20Tratamento/Modelagens%20finais/Modelagem_Auto_ML.ipynb)

A ser adicionado!!





