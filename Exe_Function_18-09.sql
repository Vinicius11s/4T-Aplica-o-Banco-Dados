/*1) Crie uma função que retorne o nome completo de
um estado a partir de sua sigla*/

/*create function fun_NomeCompleto (@sigla varchar(50))
returns varchar(50)
as
Begin
	declare @nomeEstado varchar(50);

	SET @sigla = UPPER(@sigla);

	SET @nomeEstado =
		case @sigla
			WHEN 'AC' THEN 'Acre'
			WHEN 'AL' THEN 'Alagoas'
			WHEN 'AP' THEN 'Amapá'
			WHEN 'AM' THEN 'Amazonas'
			WHEN 'BA' THEN 'Bahia'
			WHEN 'CE' THEN 'Ceará'
			WHEN 'DF' THEN 'Distrito Federal'
			WHEN 'ES' THEN 'Espírito Santo'
			WHEN 'GO' THEN 'Goiás'
			WHEN 'MA' THEN 'Maranhão'
			WHEN 'MT' THEN 'Mato Grosso'
			WHEN 'MS' THEN 'Mato Grosso do Sul'
			WHEN 'MG' THEN 'Minas Gerais'
			WHEN 'PA' THEN 'Pará'
			WHEN 'PB' THEN 'Paraíba'
			WHEN 'PR' THEN 'Paraná'
			WHEN 'PE' THEN 'Pernambuco'
			WHEN 'PI' THEN 'Piauí'
			WHEN 'RJ' THEN 'Rio de Janeiro'
			WHEN 'RN' THEN 'Rio Grande do Norte'
			WHEN 'RS' THEN 'Rio Grande do Sul'
			WHEN 'RO' THEN 'Rondônia'
			WHEN 'RR' THEN 'Roraima'
			WHEN 'SC' THEN 'Santa Catarina'
			WHEN 'SP' THEN 'São Paulo'
			WHEN 'SE' THEN 'Sergipe'
			WHEN 'TO' THEN 'Tocantins'
			ELSE 'Sigla inválida'
		END
	Return @nomeEstado;
END;

SELECT dbo.fun_NomeCompleto('SP') as NomeEstado;*/


/*2) Crie uma função que retorne a maior nota de um determinado aluno*/
/*create function fun_maiorNota (@ra int)
Returns decimal (8,2)
as
Begin
	declare @maior decimal (8,2);

	select @maior = MAX(nota)
	from historico
	where ra = @ra;
	return @maior;
End

select dbo.fun_maiorNota(6130001) as MaiorNota;*/


/*3) Elabore uma função que calcule a área de um triângulo*/
/*create function fun_AreaTriangulo (@base decimal(10,2), @altura decimal(10,2))
returns decimal (10,2)
as 
Begin
	Declare @area decimal (10,2);

	set @area = (@base * @altura) / 2;

	Return @area;
End;
SELECT dbo.fun_AreaTriangulo(5, 10) AS AreaTriangulo;*/


/*4) Elabore uma função que deixe uma palavra com a primeira e a última letra
maiúscula*/
/*create function fun_Maiuscula(@palavra as varchar(30))
returns varchar(30)
as
Begin
	Declare @resultadoFinal varchar(30)
	Declare @primeiraLetra varchar(1)
	Declare @meio varchar(30)
	Declare @ultimaLetra varchar(1)

	IF LEN(@palavra) > 0
	Begin
		SET @primeiraLetra = UPPER(LEFT(@palavra, 1));
		SET @ultimaLetra = UPPER(RIGHT(@palavra, 1));
		
		IF LEN(@palavra) > 2
		Begin
	 	    -- Extrai o meio da palavra, excluindo a primeira e a última letra, e converte para minúsculas
			SET @meio = LOWER(SUBSTRING(@palavra, 2, LEN(@palavra) - 2));
		END
		ELSE
		Begin
			SET @meio = '';
		END

		SET @resultadoFinal = @primeiraLetra + @meio + @ultimaLetra;
	END
	ELSE
	Begin
		SET @resultadoFinal = '';
	END
	Return @resultadoFinal;
END

SELECT dbo.fun_Maiuscula('exemplo') AS PalavraFormatada;*/

/*5) Crie uma função que retorne o nome do professor de uma determinada disciplina*/
/*select * from disciplinas*/
/*
create function fun_nomeProfessorDisciplina(@cod_disc INT)
returns varchar(50)
as 
Begin
	declare @nome varchar(50)
	select @nome = nome_pro
	from professores p
	inner join turmas t on t.cod_pro = p.cod_pro
	where cod_disc = @cod_disc;

	Return @nome
End

SELECT dbo.fun_nomeProfessorDisciplina(1) AS NomeProfessor;
select * from professores
select * from turmas*/