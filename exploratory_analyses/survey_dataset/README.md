# Survey Dataset

This analysis was performed for a selection process that I participated a while ago. They asked the participants to upload the results on github.

I liked this project so I decided to keep it here.

This dates back to April 2021.

The analysis was performed in portuguese, since it was for a Brazilian company and, if I remember well, they asked us to use portuguese.

The description below is also in portuguese, this is what I wrote for them to analyze it. Here is a translation for it:

"Greetings!

I uploaded both the jupyter notebook and html file.

I created 2 summaries, one to go straight to the activities and one for the complete analysis I did of the database. 

The plot of activity 2.2 returned the following warning: "posx and posy should be finite values". This happens because when the category value is 0, no value is written to the graph and the value returned by ax.text becomes infinite. However the graph works normally, even if plotted for any variable and any hue.
To suppress the problem I added a code in HTML that, when clicking on the button, makes this warning disappear from the screen, however, this only works in the .ipynb file.

Thanks!"

---------

# Analise quaest
Saudações!

Fiz o upload tanto do arquivo em jupyter notebook e html.

Criei 2 sumários, um para ir direto nas atividades e um para a análise completa que fiz do banco de dados. 

O gráfico da atividade 2.2 retornou o seguinte aviso: "posx and posy should be finite values". Isto acontece pois, quando o valor da categoria é 0, não há retorno de valor escrito no gráfico e o valor retornado por ax.text se torna infinito. Entretanto o gráfico funciona normalmente, mesmo se plotado para qualquer variável e qualquer "hue".
Para suprimir o problema adicionei um código em HTML que, ao clicar no botão, faz com que este aviso suma da tela, porém, este só funciona no arquivo .ipynb.

Obrigado!
