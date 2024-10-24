USE Universidade
/*1*/
SELECT *
INTO #TempAlunos
FROM Aluno;

/*2*/
SELECT 
    Nome,
    DataNascimento,
    DATEADD(YEAR, 3, DataNascimento) AS DataNascimentoMais3Anos
INTO #TempAlunosComIdadeAjustada
FROM Aluno;

/*3*/
SELECT 
    GETDATE() AS DataAtual,
    DATENAME(MONTH, GETDATE()) AS MesPorExtenso,
    EOMONTH(GETDATE()) AS UltimoDiaDoMes
INTO #TempDataAtualMesUltimoDia;

/*4*/
SELECT 
    A.RA,
    COUNT(T.TurmaID) AS QuantidadeTurmas,
    (COUNT(T.TurmaID) * 100.0 / (SELECT COUNT(*) FROM Turma)) AS PercentualTurmas
INTO #TempAlunosTurmasPercentual
FROM Aluno A
JOIN Matricula M ON A.AlunoID = M.AlunoID
JOIN Turma T ON M.TurmaID = T.TurmaID
GROUP BY A.RA;

/*5*/
SELECT 
    months AS MesNumero, 
    [name] AS NomeMes
INTO #TempMesesPortugues
FROM sys.syslanguages
CROSS APPLY (SELECT * FROM STRING_SPLIT('janeiro,fevereiro,março,abril,maio,junho,julho,agosto,setembro,outubro,novembro,dezembro', ',')) AS Meses
WHERE name = 'Português';

