USE Espetaculo;

/*Selecione os nomes das bandas que tenham a mesma cidade de origem de
qualquer cidade em que alguma banda tenha se apresentado em 2013*/

SELECT ban_nome FROM Banda
WHERE cid_codigo IN (SELECT Show.cid_codigo FROM Show WHERE sho_ano = 2013);

/*Selecione os nomes e as posições (instrumentos que tocam) de todos os
membros de banda que não pertençam às bandas com classificação menor que 8,0.*/

SELECT mem_nome, mem_posicao FROM Membro_Banda
WHERE ban_codigo NOT IN (SELECT ban_codigo FROM Banda WHERE ban_classificacao < 8);

/*Mostre o nome e a posição dos membros da banda que ganham mais do que o
salário médio de todos os guitarristas*/

SELECT mem_nome, mem_posicao FROM Membro_Banda
WHERE men_salario > (SELECT AVG (men_salario) FROM Membro_Banda
WHERE mem_posicao = 'Guitarrista')

/*Mostre os nomes das bandas que foram criadas depois da banda Mastruz com
Leite e que tem uma classificação maior que 7,5.*/

SELECT ban_nome FROM Banda
WHERE ban_ano > (SELECT ban_ano FROM Banda WHERE ban_nome = 'Mastruz com leite') and
ban_classificacao > 7.5

/*Mostre o nome e o número de membros de cada banda que tenha mais membros
do que a média de membros de todas as bandas cadastradas.*/

select Banda.ban_nome, COUNT(mem_codigo) AS QUANTIDADE from Membro_Banda
join Banda on Banda.ban_codigo = Membro_Banda.ban_codigo
group by ban_nome
having COUNT(mem_codigo) > (select avg(contagem) from
(select count(mem_codigo) as contagem from Membro_Banda group by ban_codigo) as Media)



